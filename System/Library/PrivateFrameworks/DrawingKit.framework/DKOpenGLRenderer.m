@implementation DKOpenGLRenderer

- (DKOpenGLRenderer)initWithBounds:(CGRect)a3 scale:(double)a4 bufferSize:(int)a5 sharedContext:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  DKOpenGLRenderer *v13;
  DKOpenGLRenderer *v14;
  unsigned int v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)DKOpenGLRenderer;
  v13 = -[DKOpenGLRenderer init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_bounds.origin.x = x;
    v13->_bounds.origin.y = y;
    v13->_bounds.size.width = width;
    v13->_bounds.size.height = height;
    v13->_backingScale = a4;
    v13->_lineWidthScale = 1.0;
    v13->_didNotifyRendererDelegate = 0;
    v13->mSharedContext = a6;
    if (a5 <= 8000)
      v15 = 8000;
    else
      v15 = a5;
    if (v15 >= 0xFFFE)
      v15 = 65534;
    v13->mBufferSize = v15;
    -[DKOpenGLRenderer initGL](v13, "initGL");
  }
  return v14;
}

- (DKOpenGLRenderer)initWithBounds:(CGRect)a3 scale:(double)a4
{
  return -[DKOpenGLRenderer initWithBounds:scale:bufferSize:sharedContext:](self, "initWithBounds:scale:bufferSize:sharedContext:", 8000, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (DKOpenGLRenderer)init
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  return -[DKOpenGLRenderer initWithBounds:scale:](self, "initWithBounds:scale:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v5);
}

- (void)dealloc
{
  objc_super v3;

  if (+[DKGLUtilities gpuAvailable](DKGLUtilities, "gpuAvailable"))
    -[DKOpenGLRenderer teardown](self, "teardown");
  self->mPages.__end_ = self->mPages.__begin_;
  self->mContiguousVertexStorage.__end_ = self->mContiguousVertexStorage.__begin_;
  self->mVertexHistory.__end_ = self->mVertexHistory.__begin_;
  v3.receiver = self;
  v3.super_class = (Class)DKOpenGLRenderer;
  -[DKOpenGLRenderer dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  unsigned int *p_mPaperTex;
  unsigned int mPaperTex;

  -[DKOpenGLRenderer destroyFrameBuffers](self, "destroyFrameBuffers");
  if (self->mVbo)
    +[DKGLUtilities deleteVBO:](DKGLUtilities, "deleteVBO:", &self->mVbo);
  if (!self->mPaperTexIsShared)
  {
    mPaperTex = self->mPaperTex;
    p_mPaperTex = &self->mPaperTex;
    if (mPaperTex)
      +[DKGLUtilities deleteTexture:](DKGLUtilities, "deleteTexture:", p_mPaperTex);
  }
  glFinish();
}

- (BOOL)initGL
{
  unsigned __int8 *U_COLOR;
  int64_t v4;
  uint64_t v5;
  unsigned int mPaperTex;
  GLuint Program;
  GLint UniformLocation;
  float backingScale;
  float v10;
  GLuint v11;
  GLint v12;
  GLint v13;
  GLint v14;
  GLuint v15;
  GLint v16;
  GLint v17;
  GLint v18;
  GLint v19;
  GLint v20;
  int v21;
  GLuint v22;
  GLint v23;
  GLuint v24;
  BOOL v25;
  __int128 v27;
  GLfloat v[2];
  GLint params;

  *(_OWORD *)self->U_COLOR = xmmword_21DCC0760;
  U_COLOR = self->U_COLOR;
  *(int32x2_t *)self->mWinSize = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_bounds.size));
  -[DKOpenGLRenderer setNumPages:](self, "setNumPages:", 1);
  *(_QWORD *)self->mCanvasSize = *(_QWORD *)self->mWinSize;
  *(_QWORD *)self->mCanvasOffset = 0;
  v4 = -[DKOpenGLRenderer numPages](self, "numPages");
  v5 = *(_QWORD *)self->mCanvasSize;
  self->_contentSize.width = (double)(v4 * (int)v5);
  self->_contentSize.height = (double)SHIDWORD(v5);
  self->mTime = 0.0;
  -[DKOpenGLRenderer setDrawingEnabled:](self, "setDrawingEnabled:", 1);
  -[DKOpenGLRenderer setAllowWetComposite:](self, "setAllowWetComposite:", 1);
  glDisable(0xBE2u);
  glDisable(0xB71u);
  glDepthMask(0);
  if (!self->mSharedContext)
  {
    if (self->mPaperTex)
      goto LABEL_4;
    goto LABEL_3;
  }
  +[DKGLUtilities createSharedRepeatableTexture:withImageName:ofType:](DKGLUtilities, "createSharedRepeatableTexture:withImageName:ofType:", &self->mPaperTex, CFSTR("paper_texture"), CFSTR("jpg"));
  mPaperTex = self->mPaperTex;
  self->mPaperTexIsShared = mPaperTex != 0;
  if (!mPaperTex)
  {
LABEL_3:
    +[DKGLUtilities createRepeatableTexture:withImageName:ofType:](DKGLUtilities, "createRepeatableTexture:withImageName:ofType:", &self->mPaperTex, CFSTR("paper_texture"), CFSTR("jpg"));
    self->mPaperTexIsShared = 0;
  }
LABEL_4:
  self->mParticleLifespan = 2.0;
  glGenBuffers(1, &self->mVbo);
  glBindBuffer(0x8892u, self->mVbo);
  glBufferData(0x8892u, 24 * self->mBufferSize, 0, 0x88E8u);
  glGenVertexArraysOES();
  glBindVertexArrayOES();
  glBindBuffer(0x8892u, self->mVbo);
  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(1u);
  glEnableVertexAttribArray(2u);
  glEnableVertexAttribArray(3u);
  glEnableVertexAttribArray(4u);
  glVertexAttribPointer(0, 2, 0x1406u, 0, 24, 0);
  glVertexAttribPointer(1u, 1, 0x1406u, 0, 24, (const GLvoid *)8);
  glVertexAttribPointer(2u, 1, 0x1406u, 0, 24, (const GLvoid *)0xC);
  glVertexAttribPointer(3u, 1, 0x1406u, 0, 24, (const GLvoid *)0x10);
  glVertexAttribPointer(4u, 1, 0x1406u, 0, 24, (const GLvoid *)0x14);
  glGetError();
  Program = glCreateProgram();
  self->mWetPaintProg = Program;
  glAttachShader(Program, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("wet_paint"), CFSTR("vert")));
  glAttachShader(self->mWetPaintProg, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("wet_paint"), CFSTR("frag")));
  glBindAttribLocation(self->mWetPaintProg, 0, "iPosition");
  glBindAttribLocation(self->mWetPaintProg, 1u, "iSpeed");
  glBindAttribLocation(self->mWetPaintProg, 2u, "iBirth");
  glBindAttribLocation(self->mWetPaintProg, 3u, "iForce");
  glBindAttribLocation(self->mWetPaintProg, 4u, "iEndPoint");
  glLinkProgram(self->mWetPaintProg);
  params = 0;
  glGetProgramiv(self->mWetPaintProg, 0x8B82u, &params);
  if (!params)
    goto LABEL_10;
  glUseProgram(self->mWetPaintProg);
  self->mWetPaintProgTimeUniformLocation = glGetUniformLocation(self->mWetPaintProg, "uTime");
  self->mWetPaintProgSubtractEndPointsOnlyUniformLocation = glGetUniformLocation(self->mWetPaintProg, "uSubtractEndPointsOnly");
  self->mWetPaintProgLifespanUniformLocation = glGetUniformLocation(self->mWetPaintProg, "uLifespan");
  UniformLocation = glGetUniformLocation(self->mWetPaintProg, "uSize");
  backingScale = self->_backingScale;
  glUniform1f(UniformLocation, backingScale * 10.0);
  glUniform1f(self->mWetPaintProgTimeUniformLocation, 0.0);
  glUniform1f(self->mWetPaintProgLifespanUniformLocation, self->mParticleLifespan);
  glUniform1i(self->mWetPaintProgSubtractEndPointsOnlyUniformLocation, 0);
  v10 = self->_backingScale;
  *(float32x2_t *)v = vmul_n_f32(vcvt_f32_s32(*(int32x2_t *)self->mCanvasSize), v10);
  v11 = glCreateProgram();
  self->mDryPaintProg = v11;
  glAttachShader(v11, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("dry_paint"), CFSTR("vert")));
  glAttachShader(self->mDryPaintProg, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("dry_paint"), CFSTR("frag")));
  glBindAttribLocation(self->mDryPaintProg, 0, "iPosition");
  glBindAttribLocation(self->mDryPaintProg, 1u, "iTexCoord0");
  glLinkProgram(self->mDryPaintProg);
  glGetProgramiv(self->mDryPaintProg, 0x8B82u, &params);
  if (!params)
    goto LABEL_10;
  glUseProgram(self->mDryPaintProg);
  self->mDryPaintProgXCoordOffsetUniformLocation = glGetUniformLocation(self->mDryPaintProg, "uXCoordOffset");
  v12 = glGetUniformLocation(self->mDryPaintProg, "texture_src");
  glUniform1i(v12, 0);
  v13 = glGetUniformLocation(self->mDryPaintProg, "texture_dest");
  glUniform1i(v13, 1);
  v14 = glGetUniformLocation(self->mDryPaintProg, "uTargetMultiple");
  glUniform1f(v14, 0.5);
  glUniform1f(self->mDryPaintProgXCoordOffsetUniformLocation, 0.0);
  v15 = glCreateProgram();
  self->mCompositeProg = v15;
  glAttachShader(v15, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("dry_composite"), CFSTR("vert")));
  glAttachShader(self->mCompositeProg, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("dry_composite"), CFSTR("frag")));
  glBindAttribLocation(self->mCompositeProg, 0, "iPosition");
  glBindAttribLocation(self->mCompositeProg, 1u, "iTexCoord0");
  glLinkProgram(self->mCompositeProg);
  glGetProgramiv(self->mCompositeProg, 0x8B82u, &params);
  if (!params)
    goto LABEL_10;
  glUseProgram(self->mCompositeProg);
  self->mCompositeColorUniformLocation = glGetUniformLocation(self->mCompositeProg, "uColor");
  v16 = glGetUniformLocation(self->mCompositeProg, "texture_dest");
  glUniform1i(v16, 0);
  v17 = glGetUniformLocation(self->mCompositeProg, "texture_paper");
  glUniform1i(v17, 1);
  glUniform4fv(self->mCompositeColorUniformLocation, 1, (const GLfloat *)U_COLOR);
  v18 = glGetUniformLocation(self->mCompositeProg, "uTargetMultiple");
  glUniform1f(v18, 0.5);
  v19 = glGetUniformLocation(self->mCompositeProg, "uXCoordOffset");
  glUniform1f(v19, 0.0);
  v20 = glGetUniformLocation(self->mCompositeProg, "uIncludeWetPass");
  glUniform1i(v20, 1);
  v21 = glGetUniformLocation(self->mCompositeProg, "uViewport");
  self->mCompositeProgViewportUniformLocation = v21;
  glUniform2fv(v21, 1, v);
  v22 = glCreateProgram();
  self->mTextureProg = v22;
  glAttachShader(v22, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("texture"), CFSTR("vert")));
  glAttachShader(self->mTextureProg, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("texture"), CFSTR("frag")));
  glBindAttribLocation(self->mTextureProg, 0, "iPosition");
  glBindAttribLocation(self->mTextureProg, 1u, "iTexCoord");
  glLinkProgram(self->mTextureProg);
  glGetProgramiv(self->mTextureProg, 0x8B82u, &params);
  if (!params)
    goto LABEL_10;
  glUseProgram(self->mTextureProg);
  v23 = glGetUniformLocation(self->mTextureProg, "texture_src");
  glUniform1i(v23, 0);
  self->mTextureProgModelViewProjectionUniformLocation = glGetUniformLocation(self->mTextureProg, "uModelViewProjection");
  v24 = glCreateProgram();
  self->mColorProg = v24;
  glAttachShader(v24, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("color"), CFSTR("vert")));
  glAttachShader(self->mColorProg, +[DKGLUtilities compileShader:ofType:](DKGLUtilities, "compileShader:ofType:", CFSTR("color"), CFSTR("frag")));
  glBindAttribLocation(self->mColorProg, 0, "iPosition");
  glBindAttribLocation(self->mColorProg, 1u, "iTexCoord");
  glLinkProgram(self->mColorProg);
  glGetProgramiv(self->mColorProg, 0x8B82u, &params);
  if (params)
  {
    glUseProgram(self->mColorProg);
    v27 = xmmword_21DCC0770;
    self->mColorProgColorUniformLocation = glGetUniformLocation(self->mColorProg, "uColor");
    self->mColorProgModelViewProjectionUniformLocation = glGetUniformLocation(self->mColorProg, "uModelViewProjection");
    v25 = 1;
    glUniform4fv(self->mColorProgColorUniformLocation, 1, (const GLfloat *)&v27);
    -[DKOpenGLRenderer initializeFrameBuffers](self, "initializeFrameBuffers", v27, *(_QWORD *)v);
  }
  else
  {
LABEL_10:
    NSLog(CFSTR("Error linking program"));
    return 0;
  }
  return v25;
}

- (void)setInkColor:(id)a3
{
  id v5;
  float64x2_t v6;
  float64x2_t v7;
  float64_t v8;
  float64_t v9;
  float64_t v10;
  float64_t v11;

  objc_storeStrong((id *)&self->_inkColor, a3);
  v5 = a3;
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v11, &v10, &v9, &v8);

  v6.f64[0] = v11;
  v6.f64[1] = v10;
  v7.f64[0] = v9;
  v7.f64[1] = v8;
  *(float32x4_t *)self->U_COLOR = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v7);
}

- (void)setNumPages:(int64_t)a3
{
  if (self->_numPages != a3)
  {
    std::vector<Page>::resize((uint64_t)&self->mPages, a3);
    self->_numPages = a3;
  }
}

- (void)setBounds:(CGRect)a3
{
  if (self->_bounds.size.width != a3.size.width || self->_bounds.size.height != a3.size.height)
  {
    self->_bounds = a3;
    -[DKOpenGLRenderer didResize](self, "didResize");
  }
}

- (void)setBackingScale:(double)a3
{
  if (self->_backingScale != a3)
  {
    self->_backingScale = a3;
    -[DKOpenGLRenderer didResize](self, "didResize");
  }
}

- (void)didResize
{
  int32x2_t v3;
  float backingScale;
  float32x2_t v5;
  GLfloat v[2];

  -[DKOpenGLRenderer destroyFrameBuffers](self, "destroyFrameBuffers");
  v3 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_bounds.size));
  *(int32x2_t *)self->mWinSize = v3;
  *(int32x2_t *)self->mCanvasSize = v3;
  *(_QWORD *)self->mCanvasOffset = 0;
  -[DKOpenGLRenderer initializeFrameBuffers](self, "initializeFrameBuffers");
  backingScale = self->_backingScale;
  v5 = vcvt_f32_s32(*(int32x2_t *)self->mCanvasSize);
  self->_contentSize.width = (float)((float)(0xCCCCCCCCCCCCCCCDLL * ((self->mPages.__end_ - self->mPages.__begin_) >> 3))
                                   * v5.f32[0]);
  self->_contentSize.height = v5.f32[1];
  *(float32x2_t *)v = vmul_n_f32(v5, backingScale);
  glUseProgram(self->mCompositeProg);
  glUniform2fv(self->mCompositeProgViewportUniformLocation, 1, v);
  -[DKOpenGLRenderer drawContiguousVertexStorageImmediatelyWithLayeredBlending:](self, "drawContiguousVertexStorageImmediatelyWithLayeredBlending:", 1);
}

- (void)destroyFrameBuffers
{
  Page *i;

  for (i = self->mPages.__begin_; i != self->mPages.__end_; i = (Page *)((char *)i + 40))
  {
    +[DKGLUtilities deleteFBO:depthRB:texture:](DKGLUtilities, "deleteFBO:depthRB:texture:", i, 0, (char *)i + 4);
    +[DKGLUtilities deleteFBO:depthRB:texture:](DKGLUtilities, "deleteFBO:depthRB:texture:", (char *)i + 16, 0, (char *)i + 20);
  }
  +[DKGLUtilities deleteFBO:depthRB:texture:](DKGLUtilities, "deleteFBO:depthRB:texture:", &self->mWetPaintBufferFBO, 0, &self->mWetPaintBufferT);
}

- (void)initializeFrameBuffers
{
  __int128 v2;
  Page *begin;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  Page *v8;
  int v9;
  int v10;
  double backingScale;
  double v12;
  double v13;
  double v14;
  double v15;
  GLint UniformLocation;
  double v17;
  double v18;
  GLint v19;
  GLint v20;
  __int128 v21;
  GLfloat value[16];

  *(float *)&v2 = self->_backingScale;
  *(int32x2_t *)&v2 = vcvt_s32_f32(vmul_n_f32(vcvt_f32_s32(*(int32x2_t *)self->mCanvasSize), *(float *)&v2));
  v21 = v2;
  begin = self->mPages.__begin_;
  if (begin != self->mPages.__end_)
  {
    v5 = v2;
    v6 = DWORD1(v2);
    v7 = (char *)begin + 16;
    do
    {
      *((_QWORD *)v7 - 1) = v21;
      +[DKGLUtilities createFBO:depthRB:texture:width:height:format:](DKGLUtilities, "createFBO:depthRB:texture:width:height:format:", v7 - 16, 0, v7 - 12, v5, v6, 32849, v21);
      *((_QWORD *)v7 + 1) = v21;
      +[DKGLUtilities createFBO:depthRB:texture:width:height:format:](DKGLUtilities, "createFBO:depthRB:texture:width:height:format:", v7, 0, v7 + 4, v5, v6, 32856);
      v8 = (Page *)(v7 + 24);
      v7 += 40;
    }
    while (v8 != self->mPages.__end_);
  }
  *(_QWORD *)self->mWetPaintBufferSize = v21;
  v9 = v21;
  v10 = DWORD1(v21);
  +[DKGLUtilities createFBO:depthRB:texture:width:height:format:](DKGLUtilities, "createFBO:depthRB:texture:width:height:format:", &self->mWetPaintBufferFBO, 0, &self->mWetPaintBufferT, v21, DWORD1(v21), 32849, v21);
  backingScale = self->_backingScale;
  v12 = (double)v9 / backingScale;
  *(float *)&v12 = v12;
  v13 = (double)v10 / backingScale;
  *(float *)&v13 = v13;
  +[DKGLUtilities setProjectionMatrixForWidth:height:flipped:matrix:](DKGLUtilities, "setProjectionMatrixForWidth:height:flipped:matrix:", 0, value, v12, v13);
  v14 = *(double *)self->mCanvasOffset;
  *(float *)&v14 = (float)-*(_DWORD *)self->mCanvasOffset;
  LODWORD(v15) = 0;
  +[DKGLUtilities translateMatrix:byX:Y:result:](DKGLUtilities, "translateMatrix:byX:Y:result:", value, value, v14, v15);
  glUseProgram(self->mWetPaintProg);
  UniformLocation = glGetUniformLocation(self->mWetPaintProg, "uModelViewProjection");
  glUniformMatrix4fv(UniformLocation, 1, 0, value);
  *(float *)&v17 = (float)v9;
  *(float *)&v18 = (float)v10;
  +[DKGLUtilities setProjectionMatrixForWidth:height:flipped:matrix:](DKGLUtilities, "setProjectionMatrixForWidth:height:flipped:matrix:", 0, value, v17, v18);
  glUseProgram(self->mDryPaintProg);
  v19 = glGetUniformLocation(self->mDryPaintProg, "uModelViewProjection");
  glUniformMatrix4fv(v19, 1, 0, value);
  glUseProgram(self->mCompositeProg);
  v20 = glGetUniformLocation(self->mCompositeProg, "uModelViewProjection");
  glUniformMatrix4fv(v20, 1, 0, value);
}

- (void)setDrawingEnabled:(BOOL)a3
{
  if (self->_drawingEnabled != a3)
  {
    if (!a3)
      -[DKOpenGLRenderer updateDryForcefully](self, "updateDryForcefully");
    self->_drawingEnabled = a3;
  }
}

- (void)setAllowWetComposite:(BOOL)a3
{
  unsigned int v3;
  GLint UniformLocation;

  if (self->_allowWetComposite != a3)
  {
    v3 = a3;
    glUseProgram(self->mCompositeProg);
    UniformLocation = glGetUniformLocation(self->mCompositeProg, "uIncludeWetPass");
    glUniform1f(UniformLocation, (float)v3);
    self->_allowWetComposite = v3;
  }
}

- (void)appendVertexHistoryElement
{
  VertexGroup *begin;
  vector<VertexGroup, std::allocator<VertexGroup>> *p_mVertexHistory;
  unint64_t v5;
  VertexGroup *end;
  uint64_t v7;
  char *v8;
  VertexGroup *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  VertexGroup *value;
  VertexGroup *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  VertexGroup *v22;
  VertexGroup *v23;
  char *v24;

  p_mVertexHistory = &self->mVertexHistory;
  begin = self->mVertexHistory.__begin_;
  v5 = 0xAAAAAAAAAAAAAAABLL * ((p_mVertexHistory[-1].__end_ - p_mVertexHistory[-1].__begin_) >> 3);
  end = p_mVertexHistory->__end_;
  v7 = (end - begin) >> 4;
  if (end == begin)
  {
    value = self->mVertexHistory.__end_cap_.__value_;
    if (end >= value)
    {
      v16 = value - begin;
      if (v16 >> 3 <= (unint64_t)(v7 + 1))
        v17 = v7 + 1;
      else
        v17 = v16 >> 3;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
        v18 = 0xFFFFFFFFFFFFFFFLL;
      else
        v18 = v17;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VertexGroup>>((uint64_t)&self->mVertexHistory.__end_cap_, v18);
      v20 = &v19[16 * v7];
      v22 = (VertexGroup *)&v19[16 * v21];
      *(_QWORD *)v20 = v5;
      *((_QWORD *)v20 + 1) = 0;
      v15 = (VertexGroup *)(v20 + 16);
      v23 = self->mVertexHistory.__begin_;
      begin = self->mVertexHistory.__end_;
      if (begin != v23)
      {
        do
        {
          *((_OWORD *)v20 - 1) = *((_OWORD *)begin - 1);
          v20 -= 16;
          begin = (VertexGroup *)((char *)begin - 16);
        }
        while (begin != v23);
        begin = p_mVertexHistory->__begin_;
      }
      self->mVertexHistory.__begin_ = (VertexGroup *)v20;
      goto LABEL_30;
    }
  }
  else
  {
    v8 = (char *)begin + 16 * v7;
    if (!*((_QWORD *)v8 - 1))
    {
      *((_QWORD *)v8 - 2) = v5;
      *((_QWORD *)v8 - 1) = 0;
      return;
    }
    v9 = self->mVertexHistory.__end_cap_.__value_;
    if (end >= v9)
    {
      v10 = v7 + 1;
      if ((unint64_t)(v7 + 1) >> 60)
        std::vector<Page>::__throw_length_error[abi:ne180100]();
      v11 = v9 - begin;
      if (v11 >> 3 > v10)
        v10 = v11 >> 3;
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
        v12 = 0xFFFFFFFFFFFFFFFLL;
      else
        v12 = v10;
      if (v12)
      {
        v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VertexGroup>>((uint64_t)&self->mVertexHistory.__end_cap_, v12);
        begin = self->mVertexHistory.__begin_;
        end = self->mVertexHistory.__end_;
      }
      else
      {
        v13 = 0;
      }
      v24 = &v13[16 * v7];
      v22 = (VertexGroup *)&v13[16 * v12];
      *(_QWORD *)v24 = v5;
      *((_QWORD *)v24 + 1) = 0;
      v15 = (VertexGroup *)(v24 + 16);
      if (end != begin)
      {
        do
        {
          *((_OWORD *)v24 - 1) = *((_OWORD *)end - 1);
          v24 -= 16;
          end = (VertexGroup *)((char *)end - 16);
        }
        while (end != begin);
        begin = p_mVertexHistory->__begin_;
      }
      self->mVertexHistory.__begin_ = (VertexGroup *)v24;
LABEL_30:
      self->mVertexHistory.__end_ = v15;
      self->mVertexHistory.__end_cap_.__value_ = v22;
      if (begin)
        operator delete(begin);
      goto LABEL_32;
    }
  }
  *(_QWORD *)end = v5;
  *((_QWORD *)end + 1) = 0;
  v15 = (VertexGroup *)((char *)end + 16);
LABEL_32:
  self->mVertexHistory.__end_ = v15;
}

- (void)removeVertexHistoryElement
{
  VertexGroup *end;
  VertexGroup *begin;

  begin = self->mVertexHistory.__begin_;
  end = self->mVertexHistory.__end_;
  self->mVertexHistory.__end_ = (VertexGroup *)((char *)end - 16);
  if ((VertexGroup *)((char *)end - 16) == begin)
    self->mContiguousVertexStorage.__end_ = self->mContiguousVertexStorage.__begin_;
  else
    std::vector<Vertex>::resize((uint64_t)&self->mContiguousVertexStorage, *((_QWORD *)end - 3) + *((_QWORD *)end - 4));
}

- (void)addPoints:(id)a3 withSegmentLength:(unint64_t)a4
{
  id v5;
  Vertex *begin;
  vector<Vertex, std::allocator<Vertex>> *p_mContiguousVertexStorage;
  Vertex *end;
  float mTime;
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  float64x2_t v15;
  float32x2_t v16;
  float lineWidthScale;
  float v18;
  float v19;
  Vertex *v20;
  Vertex *value;
  Vertex *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  Vertex *v29;
  Vertex *v30;
  Vertex *v31;
  __int128 v32;
  VertexGroup *v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  float v44;
  double v45;
  float v46;
  BOOL v47;
  _DWORD *v48;
  uint64_t v49;
  NSUInteger v50;
  int v51;
  int v52;
  int mBufferSize;
  int v54;
  GLuint mVbo;
  GLintptr v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  NSUInteger location;
  NSUInteger length;
  id v62;
  Vertex *v63;
  Vertex *v64;
  unint64_t v65;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  begin = self->mContiguousVertexStorage.__begin_;
  end = self->mContiguousVertexStorage.__end_;
  p_mContiguousVertexStorage = &self->mContiguousVertexStorage;
  v62 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v63 = end;
    v64 = begin;
    location = self->mVertexRange.location;
    length = self->mVertexRange.length;
    mTime = self->mTime;
    self->_didNotifyRendererDelegate = 0;
    if (self->_drawingEnabled)
      v10 = mTime;
    else
      v10 = 0.0;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v62;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v71 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          if (v14)
          {
            objc_msgSend(v14, "dk_renderPointValue");
            v15 = 0u;
          }
          else
          {
            v15 = 0uLL;
          }
          v16 = vcvt_f32_f64(v15);
          lineWidthScale = self->_lineWidthScale;
          v18 = fminf(fmaxf(0.0, 0.0), lineWidthScale);
          v19 = 0.0;
          v20 = self->mContiguousVertexStorage.__end_;
          value = self->mContiguousVertexStorage.__end_cap_.__value_;
          if (v20 >= value)
          {
            v23 = 0xAAAAAAAAAAAAAAABLL * ((v20 - p_mContiguousVertexStorage->__begin_) >> 3);
            v24 = v23 + 1;
            if (v23 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<Page>::__throw_length_error[abi:ne180100]();
            v25 = 0xAAAAAAAAAAAAAAABLL * ((value - p_mContiguousVertexStorage->__begin_) >> 3);
            if (2 * v25 > v24)
              v24 = 2 * v25;
            if (v25 >= 0x555555555555555)
              v26 = 0xAAAAAAAAAAAAAAALL;
            else
              v26 = v24;
            if (v26)
              v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Vertex>>((uint64_t)&self->mContiguousVertexStorage.__end_cap_, v26);
            else
              v27 = 0;
            v28 = &v27[24 * v23];
            *(float32x2_t *)v28 = v16;
            *((float *)v28 + 2) = v18;
            *((float *)v28 + 3) = v10;
            *((float *)v28 + 4) = v19;
            *((_DWORD *)v28 + 5) = 0;
            v30 = self->mContiguousVertexStorage.__begin_;
            v29 = self->mContiguousVertexStorage.__end_;
            v31 = (Vertex *)v28;
            if (v29 != v30)
            {
              do
              {
                v32 = *(_OWORD *)((char *)v29 - 24);
                *((_QWORD *)v31 - 1) = *((_QWORD *)v29 - 1);
                *(_OWORD *)((char *)v31 - 24) = v32;
                v31 = (Vertex *)((char *)v31 - 24);
                v29 = (Vertex *)((char *)v29 - 24);
              }
              while (v29 != v30);
              v29 = p_mContiguousVertexStorage->__begin_;
            }
            v22 = (Vertex *)(v28 + 24);
            self->mContiguousVertexStorage.__begin_ = v31;
            self->mContiguousVertexStorage.__end_ = (Vertex *)(v28 + 24);
            self->mContiguousVertexStorage.__end_cap_.__value_ = (Vertex *)&v27[24 * v26];
            if (v29)
              operator delete(v29);
          }
          else
          {
            *(float32x2_t *)v20 = v16;
            *((float *)v20 + 2) = v18;
            *((float *)v20 + 3) = v10;
            *((float *)v20 + 4) = v19;
            v22 = (Vertex *)((char *)v20 + 24);
            *((_DWORD *)v20 + 5) = 0;
          }
          self->mContiguousVertexStorage.__end_ = v22;
          if (self->_undoEnabled)
          {
            v33 = self->mVertexHistory.__end_;
            if (v33 == self->mVertexHistory.__begin_)
            {
              -[DKOpenGLRenderer appendVertexHistoryElement](self, "appendVertexHistoryElement");
              v33 = self->mVertexHistory.__end_;
            }
            ++*((_QWORD *)v33 - 1);
          }
          ++self->mVertexRange.length;
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      }
      while (v11);
    }

    v65 = vcvtas_u32_f32((float)(unint64_t)objc_msgSend(obj, "count") / (float)a4);
    if (v65)
    {
      v34 = 0;
      v35 = -1431655765 * ((unint64_t)(v63 - v64) >> 3) - a4 - 20;
      do
      {
        v36 = v34 * a4;
        v37 = objc_msgSend(obj, "count", location) - v34 * a4;
        if (v37 >= (int)a4)
          v38 = a4;
        else
          v38 = v37;
        v69 = 0u;
        objc_msgSend(obj, "objectAtIndexedSubscript:", v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39)
          objc_msgSend(v39, "dk_renderPointValue");
        else
          v69 = 0u;

        v68 = 0u;
        objc_msgSend(obj, "objectAtIndexedSubscript:", v36 + v38 - 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v41)
          objc_msgSend(v41, "dk_renderPointValue");
        else
          v68 = 0u;

        *(float *)&v43 = *(double *)&v69;
        v44 = *((double *)&v69 + 1);
        *((float *)&v43 + 1) = v44;
        *(float *)&v45 = *(double *)&v68;
        v46 = *((double *)&v68 + 1);
        *((float *)&v45 + 1) = v46;
        if (-[DKOpenGLRenderer detectCollision::](self, "detectCollision::", v43, v45))
          v47 = (int)(-1431655765 * ((unint64_t)(v63 - v64) >> 3) - a4 - 20 + v36) < 1;
        else
          v47 = 1;
        if (!v47 && a4 << 32)
        {
          v48 = (_DWORD *)((char *)p_mContiguousVertexStorage->__begin_ + 24 * v35 + 20);
          v49 = 24 * (int)a4;
          do
          {
            *v48 = 1065353216;
            v48 += 6;
            v49 -= 24;
          }
          while (v49);
        }
        ++v34;
        v35 += a4;
      }
      while (v34 != v65);
    }
    if (self->_drawingEnabled)
    {
      v50 = self->mVertexRange.length;
      v51 = v50 - length;
      if (v50 > length)
      {
        self->mTimeWetBecameDirty = self->mTime;
        v52 = length + location;
        mBufferSize = self->mBufferSize;
        v54 = ((int)length + (int)location) % mBufferSize;
        mVbo = self->mVbo;
        if (v54 + v51 <= mBufferSize)
        {
          glBindBuffer(0x8892u, mVbo);
          v56 = 24 * v54;
          v58 = v51;
          v59 = v52;
        }
        else
        {
          glBindBuffer(0x8892u, mVbo);
          glBufferSubData(0x8892u, 24 * v54, 24 * (self->mBufferSize - v54), (char *)self->mContiguousVertexStorage.__begin_ + 24 * v52);
          v56 = 0;
          v57 = self->mBufferSize;
          v58 = (v54 + v51) % v57;
          v59 = v52 + (uint64_t)((int)v57 - v54);
        }
        glBufferSubData(0x8892u, v56, 24 * v58, (char *)p_mContiguousVertexStorage->__begin_ + 24 * v59);
      }
    }
    else
    {
      self->mTime = (float)(v10 + self->mParticleLifespan) + 1.0;
      glUseProgram(self->mWetPaintProg);
      glUniform1f(self->mWetPaintProgTimeUniformLocation, self->mTime);
    }
  }

}

- (BOOL)detectCollision:(DKOpenGLRenderer *)self :(SEL)a2
{
  float32x2_t v2;
  float32x2_t v3;
  float32x2_t v5;
  int32x2_t v6;
  BOOL v7;
  float32x2_t v9;
  float32x2_t *begin;
  float32x2_t *end;
  vector<std::pair<float __attribute__((ext_vector_type(2))), float __attribute__((ext_vector_type(2)))>, std::allocator<std::pair<float __attribute__((ext_vector_type(2))), float __attribute__((ext_vector_type(2)))>>> *p_mNonCollisionSegments;
  int32x2_t v14;
  float32x2_t v15;
  float32x2_t *v16;
  unsigned int v22;
  float32x2_t v23;
  int32x4_t v24;
  float32x4_t v25;
  __compressed_pair<std::pair<float __attribute__((ext_vector_type(2))), float __attribute__((ext_vector_type(2)))> *, std::allocator<std::pair<float __attribute__((ext_vector_type(2))), float __attribute__((ext_vector_type(2)))>>> *p_end_cap;
  float32x2_t *value;
  float32x2_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  float32x2_t *v34;
  char *v35;
  char *v36;
  char *v37;
  float32x2_t v39;

  v5 = v2;
  v6 = vceq_f32(v2, v3);
  if ((vand_s8((int8x8_t)v6, (int8x8_t)vdup_lane_s32(v6, 1)).u8[0] & 1) != 0)
    return 0;
  v9 = vsub_f32(v3, v5);
  begin = (float32x2_t *)self->mNonCollisionSegments.__begin_;
  end = (float32x2_t *)self->mNonCollisionSegments.__end_;
  p_mNonCollisionSegments = &self->mNonCollisionSegments;
  if (end == begin)
  {
LABEL_7:
    v7 = 0;
  }
  else
  {
    _S1 = -v9.f32[0];
    v14 = vdup_lane_s32((int32x2_t)v9, 0);
    v15 = vneg_f32(v9);
    v16 = (float32x2_t *)self->mNonCollisionSegments.__begin_;
    while (1)
    {
      _D6 = v16[1];
      __asm { FMLA            S16, S1, V6.S[1] }
      *(float *)&v22 = -_D6.f32[1];
      v23 = vsub_f32(*v16, v5);
      _D6.i32[1] = v15.i32[1];
      *(float32x2_t *)v24.i8 = vdiv_f32(vmla_f32(vmul_f32((float32x2_t)vrev64_s32((int32x2_t)v23), _D6), v23, (float32x2_t)__PAIR64__(v14.u32[1], v22)), (float32x2_t)vdup_lane_s32(_D16, 0));
      v24.i64[1] = v24.i64[0];
      v25 = (float32x4_t)vrev64q_s32(v24);
      _D6.i32[0] = vmovn_s32(vcgeq_f32((float32x4_t)xmmword_21DCC0780, v25)).u32[0];
      _D6.i32[1] = vmovn_s32(vcgeq_f32(v25, (float32x4_t)xmmword_21DCC0780)).i32[1];
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16((int16x4_t)_D6, 0xFuLL))) & 1) != 0)
        break;
      v16 += 2;
      if (v16 == end)
        goto LABEL_7;
    }
    self->mNonCollisionSegments.__end_ = begin;
    v7 = 1;
    end = begin;
  }
  p_end_cap = &self->mNonCollisionSegments.__end_cap_;
  value = (float32x2_t *)self->mNonCollisionSegments.__end_cap_.__value_;
  if (end >= value)
  {
    v29 = ((char *)end - (char *)begin) >> 4;
    v30 = v29 + 1;
    if ((unint64_t)(v29 + 1) >> 60)
      std::vector<Page>::__throw_length_error[abi:ne180100]();
    v31 = (char *)value - (char *)begin;
    if (v31 >> 3 > v30)
      v30 = v31 >> 3;
    if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0)
      v32 = 0xFFFFFFFFFFFFFFFLL;
    else
      v32 = v30;
    if (v32)
    {
      v39 = v9;
      v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<VertexGroup>>((uint64_t)p_end_cap, v32);
      v9 = v39;
    }
    else
    {
      v33 = 0;
    }
    v34 = (float32x2_t *)&v33[16 * v29];
    v35 = &v33[16 * v32];
    *v34 = v5;
    v34[1] = v9;
    v28 = v34 + 2;
    v37 = (char *)self->mNonCollisionSegments.__begin_;
    v36 = (char *)self->mNonCollisionSegments.__end_;
    if (v36 != v37)
    {
      do
      {
        *(_OWORD *)v34[-2].f32 = *((_OWORD *)v36 - 1);
        v34 -= 2;
        v36 -= 16;
      }
      while (v36 != v37);
      v36 = (char *)p_mNonCollisionSegments->__begin_;
    }
    self->mNonCollisionSegments.__begin_ = v34;
    self->mNonCollisionSegments.__end_ = v28;
    self->mNonCollisionSegments.__end_cap_.__value_ = v35;
    if (v36)
      operator delete(v36);
  }
  else
  {
    *end = v5;
    end[1] = v9;
    v28 = end + 2;
  }
  self->mNonCollisionSegments.__end_ = v28;
  return v7;
}

- (void)update
{
  void *v3;
  NSUInteger length;
  NSUInteger location;
  float mTime;
  Vertex *begin;
  float mParticleLifespan;
  NSUInteger v9;
  float *v10;
  NSUInteger v11;
  Vertex *end;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *__p;
  void *v23;
  uint64_t v24;
  CGRect v25;

  self->mTime = self->mTime + 0.016667;
  glUseProgram(self->mWetPaintProg);
  glUniform1f(self->mWetPaintProgTimeUniformLocation, self->mTime);
  if ((float)(self->mTime - self->mTimeWetBecameDirty) >= self->mParticleLifespan)
  {
    if (self->mVertexRange.location && !self->_didNotifyRendererDelegate)
    {
      self->_didNotifyRendererDelegate = 1;
      -[DKOpenGLRenderer delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v3, "rendererDidFinishAnimatingDrawing:", self);

    }
  }
  else
  {
    -[DKOpenGLRenderer updateWet](self, "updateWet");
  }
  length = self->mVertexRange.length;
  if (length)
  {
    location = self->mVertexRange.location;
    mTime = self->mTime;
    begin = self->mContiguousVertexStorage.__begin_;
    mParticleLifespan = self->mParticleLifespan;
    v9 = location + 1;
    v10 = (float *)((char *)begin + 24 * location + 12);
    v11 = length - 1;
    do
    {
      if ((float)(mTime - *v10) < mParticleLifespan)
        break;
      self->mVertexRange.location = v9;
      self->mVertexRange.length = v11;
      ++v9;
      v10 += 6;
      --v11;
    }
    while (v11 != -1);
    end = self->mContiguousVertexStorage.__end_;
    v23 = 0;
    v24 = 0;
    __p = 0;
    std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&__p, (char *)begin + 24 * location, (uint64_t)end, 0xAAAAAAAAAAAAAAABLL * ((end - (Vertex *)((char *)begin + 24 * location)) >> 3));
    LODWORD(v13) = 10.0;
    -[DKOpenGLRenderer regionWithVertices:withInflationAmount:](self, "regionWithVertices:withInflationAmount:", &__p, v13);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    if (__p)
    {
      v23 = __p;
      operator delete(__p);
    }
    v25.origin.x = v15;
    v25.origin.y = v17;
    v25.size.width = v19;
    v25.size.height = v21;
    self->mDirtyCanvasRegion = CGRectUnion(self->mDirtyCanvasRegion, v25);
    -[DKOpenGLRenderer updateDryCycleIncludingComposite:](self, "updateDryCycleIncludingComposite:", 1);
    self->mDirtyCanvasRegion.origin.x = v15;
    self->mDirtyCanvasRegion.origin.y = v17;
    self->mDirtyCanvasRegion.size.width = v19;
    self->mDirtyCanvasRegion.size.height = v21;
  }
}

- (CGRect)regionWithVertices:()vector<Vertex withInflationAmount:(std:(float)a4 :allocator<Vertex>> *)a3
{
  float v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  Vertex *begin;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL IsNull;
  uint64_t v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v35;
  double v36;
  double v37;
  double v38;
  __int128 v39;
  char *__p;
  char *v41;
  char *v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect result;
  CGRect v48;

  v4 = a4;
  v6 = *MEMORY[0x24BDBF070];
  v5 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF070] + 24);
  __p = 0;
  v41 = 0;
  v42 = 0;
  begin = a3->__begin_;
  if (a3->__begin_ == a3->__end_)
  {
    v25 = v6;
    v26 = v5;
    v27 = v8;
  }
  else
  {
    do
    {
      if (v41 >= v42)
      {
        v12 = (v41 - __p) >> 3;
        if ((unint64_t)(v12 + 1) >> 61)
          std::vector<Page>::__throw_length_error[abi:ne180100]();
        v13 = (v42 - __p) >> 2;
        if (v13 <= v12 + 1)
          v13 = v12 + 1;
        if ((unint64_t)(v42 - __p) >= 0x7FFFFFFFFFFFFFF8)
          v14 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (v14)
          v15 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v42, v14);
        else
          v15 = 0;
        v16 = &v15[8 * v12];
        *(_QWORD *)v16 = *(_QWORD *)begin;
        v11 = v16 + 8;
        v17 = v41;
        if (v41 != __p)
        {
          do
          {
            v18 = *((_QWORD *)v17 - 1);
            v17 -= 8;
            *((_QWORD *)v16 - 1) = v18;
            v16 -= 8;
          }
          while (v17 != __p);
          v17 = __p;
        }
        __p = v16;
        v42 = &v15[8 * v14];
        if (v17)
          operator delete(v17);
      }
      else
      {
        *(_QWORD *)v41 = *(_QWORD *)begin;
        v11 = v41 + 8;
      }
      v41 = v11;
      *(_QWORD *)&v19 = *(_QWORD *)begin;
      v39 = v19;
      *(CGFloat *)&v19 = v6;
      v20 = v5;
      v21 = v8;
      v22 = v7;
      IsNull = CGRectIsNull(*(CGRect *)&v19);
      v24 = *((_QWORD *)&v39 + 1);
      v25 = *(float *)&v39;
      v26 = *((float *)&v39 + 1);
      v27 = 0.0;
      if (IsNull)
      {
        v7 = 0.0;
      }
      else
      {
        v43.size.width = 0.0;
        v43.size.height = 0.0;
        v43.origin.x = *(float *)&v39;
        v43.origin.y = *((float *)&v39 + 1);
        v48.origin.x = v6;
        v48.origin.y = v5;
        v48.size.width = v8;
        v48.size.height = v7;
        *(CGRect *)&a4 = CGRectUnion(v43, v48);
        v25 = *(double *)&a4;
        v26 = v28;
        v27 = v29;
        v7 = v30;
      }
      begin = (Vertex *)((char *)begin + 24);
      v8 = v27;
      v5 = v26;
      v6 = v25;
    }
    while (begin != a3->__end_);
  }
  v44.origin.x = v25;
  v44.origin.y = v26;
  v44.size.width = v27;
  v44.size.height = v7;
  if (CGRectIsNull(v44))
  {
    x = *MEMORY[0x24BDBF090];
    y = *(double *)(MEMORY[0x24BDBF090] + 8);
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    height = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    v45.origin.x = v25;
    v45.origin.y = v26;
    v45.size.width = v27;
    v45.size.height = v7;
    v46 = CGRectInset(v45, (float)-v4, (float)-v4);
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
  }
  if (__p)
    operator delete(__p);
  v35 = x;
  v36 = y;
  v37 = width;
  v38 = height;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (CGRect)getVertexBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *__p;
  void *v17;
  uint64_t v18;
  CGRect result;

  __p = 0;
  v17 = 0;
  v18 = 0;
  std::vector<Vertex>::__init_with_size[abi:ne180100]<Vertex*,Vertex*>(&__p, self->mContiguousVertexStorage.__begin_, (uint64_t)self->mContiguousVertexStorage.__end_, 0xAAAAAAAAAAAAAAABLL * ((self->mContiguousVertexStorage.__end_ - self->mContiguousVertexStorage.__begin_) >> 3));
  LODWORD(v3) = 10.0;
  -[DKOpenGLRenderer regionWithVertices:withInflationAmount:](self, "regionWithVertices:withInflationAmount:", &__p, v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)updateWet
{
  -[DKOpenGLRenderer renderToWetPaintBufferWithRange:](self, "renderToWetPaintBufferWithRange:", self->mVertexRange.location, self->mVertexRange.length);
}

- (void)updateDryCycleIncludingComposite:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[DKOpenGLRenderer renderToDryPaintBuffer](self, "renderToDryPaintBuffer");
  if (v3)
    -[DKOpenGLRenderer renderToComposite:](self, "renderToComposite:", 1);
}

- (void)renderToWetPaintBufferWithRange:(_NSRange)a3
{
  GLsizei length;
  GLint v5;
  int mBufferSize;
  GLsizei v7;
  GLint v8;
  GLint params;

  length = a3.length;
  v5 = SLODWORD(a3.location) % self->mBufferSize;
  params = 0;
  glGetIntegerv(0x8CA6u, &params);
  glBindFramebuffer(0x8D40u, self->mWetPaintBufferFBO);
  glEnable(0xBE2u);
  glBlendFunc(1u, 0x303u);
  glViewport(0, 0, *(_QWORD *)self->mWetPaintBufferSize, HIDWORD(*(_QWORD *)self->mWetPaintBufferSize));
  glUseProgram(self->mWetPaintProg);
  glBindVertexArrayOES();
  glBindBuffer(0x8892u, self->mVbo);
  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(1u);
  glEnableVertexAttribArray(2u);
  glEnableVertexAttribArray(3u);
  glEnableVertexAttribArray(4u);
  glClearColor(0.0, 0.0, 0.0, 0.0);
  glClear(0x4000u);
  mBufferSize = self->mBufferSize;
  if (v5 + length <= mBufferSize)
  {
    v8 = v5;
    v7 = length;
  }
  else
  {
    glDrawArrays(0, v5, mBufferSize - v5);
    v7 = (v5 + length) % self->mBufferSize;
    v8 = 0;
  }
  glDrawArrays(0, v8, v7);
  glDisable(0xBE2u);
  glBindFramebuffer(0x8D40u, params);
}

- (void)renderToDryPaintBuffer
{
  Page *begin;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  float backingScale;
  double v8;
  GLint v9;
  GLint v10;
  GLsizei v11;
  CGFloat Height;
  double v13;
  double v14;
  double v15;
  double v16;
  GLint params;
  CGRect mDirtyCanvasRegion;

  begin = self->mPages.__begin_;
  if ((int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)) >= 1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (char *)begin + v4;
      *(float *)((char *)begin + v4 + 32) = (float)((float)(int)v5 * (float)(int)*(_QWORD *)self->mCanvasSize)
                                          / (float)(int)*(_QWORD *)self->mCanvasSize;
      params = 0;
      glGetIntegerv(0x8CA6u, &params);
      glBindFramebuffer(0x8D40u, *(_DWORD *)v6);
      glViewport(0, 0, *((_QWORD *)v6 + 1), HIDWORD(*((_QWORD *)v6 + 1)));
      glEnable(0xC11u);
      backingScale = self->_backingScale;
      v8 = backingScale;
      mDirtyCanvasRegion = self->mDirtyCanvasRegion;
      v9 = (int)(mDirtyCanvasRegion.origin.x * v8);
      v10 = (int)(mDirtyCanvasRegion.origin.y * v8);
      v11 = (int)(CGRectGetWidth(mDirtyCanvasRegion) * v8);
      Height = CGRectGetHeight(self->mDirtyCanvasRegion);
      glScissor(v9, v10, v11, (int)(Height * v8));
      glUseProgram(self->mDryPaintProg);
      glUniform1f(self->mDryPaintProgXCoordOffsetUniformLocation, *((GLfloat *)v6 + 8));
      glActiveTexture(0x84C0u);
      glBindTexture(0xDE1u, *((_DWORD *)v6 + 1));
      glActiveTexture(0x84C1u);
      glBindTexture(0xDE1u, self->mWetPaintBufferT);
      v13 = *((double *)v6 + 1);
      *(float *)&v14 = (float)SLODWORD(v13);
      *(float *)&v15 = (float)SHIDWORD(v13);
      LODWORD(v13) = 0;
      LODWORD(v16) = 0;
      +[DKGLUtilities drawQuadAtX:Y:width:height:](DKGLUtilities, "drawQuadAtX:Y:width:height:", v13, v16, v14, v15);
      glDisable(0xC11u);
      glBindFramebuffer(0x8D40u, params);
      ++v5;
      begin = self->mPages.__begin_;
      v4 += 40;
    }
    while (v5 < (int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)));
  }
}

- (void)renderToComposite:(BOOL)a3
{
  Page *begin;
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *U_COLOR;
  __objc2_class **p_superclass;
  char *v10;
  float backingScale;
  double v12;
  GLint v13;
  unsigned __int8 *v14;
  __objc2_class **v15;
  int v16;
  GLsizei v17;
  CGFloat Height;
  GLint v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  GLint params;
  CGRect mDirtyCanvasRegion;

  begin = self->mPages.__begin_;
  if ((int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)) >= 1)
  {
    v4 = a3;
    v6 = 0;
    v7 = 0;
    U_COLOR = self->U_COLOR;
    p_superclass = DKOpenGLRenderer.superclass;
    v24 = a3;
    do
    {
      v10 = (char *)begin + v6;
      *(float *)((char *)begin + v6 + 32) = (float)((float)(int)v7 * (float)(int)*(_QWORD *)self->mCanvasSize)
                                          / (float)(int)*(_QWORD *)self->mCanvasSize;
      params = 0;
      glGetIntegerv(0x8CA6u, &params);
      glBindFramebuffer(0x8D40u, *(_DWORD *)((char *)begin + v6 + 16));
      if (!v4)
      {
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(0x4000u);
      }
      glViewport(0, 0, *((_QWORD *)v10 + 3), HIDWORD(*((_QWORD *)v10 + 3)));
      if (v4)
      {
        glEnable(0xC11u);
        backingScale = self->_backingScale;
        v12 = backingScale;
        mDirtyCanvasRegion = self->mDirtyCanvasRegion;
        v13 = (int)(mDirtyCanvasRegion.origin.x * v12);
        v14 = U_COLOR;
        v15 = p_superclass;
        v16 = (int)(mDirtyCanvasRegion.origin.y * v12);
        v17 = (int)(CGRectGetWidth(mDirtyCanvasRegion) * v12);
        Height = CGRectGetHeight(self->mDirtyCanvasRegion);
        v19 = v16;
        p_superclass = v15;
        U_COLOR = v14;
        v4 = v24;
        glScissor(v13, v19, v17, (int)(Height * v12));
      }
      glUseProgram(self->mCompositeProg);
      glUniform4fv(self->mCompositeColorUniformLocation, 1, (const GLfloat *)U_COLOR);
      glActiveTexture(0x84C0u);
      glBindTexture(0xDE1u, *(_DWORD *)((char *)begin + v6 + 4));
      glActiveTexture(0x84C1u);
      glBindTexture(0xDE1u, self->mPaperTex);
      v20 = *((double *)v10 + 3);
      *(float *)&v21 = (float)SLODWORD(v20);
      *(float *)&v22 = (float)SHIDWORD(v20);
      LODWORD(v20) = 0;
      LODWORD(v23) = 0;
      objc_msgSend(p_superclass + 9, "drawQuadAtX:Y:width:height:", v20, v23, v21, v22);
      if (v4)
        glDisable(0xC11u);
      glBindFramebuffer(0x8D40u, params);
      ++v7;
      begin = self->mPages.__begin_;
      v6 += 40;
    }
    while (v7 < (int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)));
  }
}

- (void)updateDryForcefully
{
  Vertex *begin;
  NSUInteger length;
  NSUInteger location;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *__p;
  void *v12;
  uint64_t v13;

  if (self->mVertexRange.length)
  {
    self->mTime = self->mParticleLifespan + self->mTime;
    glUseProgram(self->mWetPaintProg);
    glUniform1f(self->mWetPaintProgTimeUniformLocation, self->mTime);
    -[DKOpenGLRenderer updateWet](self, "updateWet");
    length = self->mVertexRange.length;
    begin = self->mContiguousVertexStorage.__begin_;
    location = self->mVertexRange.location;
    v12 = 0;
    v13 = 0;
    __p = 0;
    std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&__p, (char *)begin + 24 * location, (uint64_t)begin + 24 * length + 24 * location, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(24 * length) >> 3));
    LODWORD(v6) = 10.0;
    -[DKOpenGLRenderer regionWithVertices:withInflationAmount:](self, "regionWithVertices:withInflationAmount:", &__p, v6);
    self->mDirtyCanvasRegion.origin.x = v7;
    self->mDirtyCanvasRegion.origin.y = v8;
    self->mDirtyCanvasRegion.size.width = v9;
    self->mDirtyCanvasRegion.size.height = v10;
    if (__p)
    {
      v12 = __p;
      operator delete(__p);
    }
    -[DKOpenGLRenderer updateDryCycleIncludingComposite:](self, "updateDryCycleIncludingComposite:", 1);
    -[DKOpenGLRenderer clearWetPaintBuffer](self, "clearWetPaintBuffer");
  }
}

- (void)draw
{
  float width;
  float backingScale;
  GLsizei v5;
  float height;

  glEnable(0xBE2u);
  glBlendFunc(0x302u, 0x303u);
  +[DKGLUtilities setCurrentClearColor](DKGLUtilities, "setCurrentClearColor");
  glClear(0x4000u);
  width = self->_bounds.size.width;
  backingScale = self->_backingScale;
  v5 = (int)(float)(width * backingScale);
  height = self->_bounds.size.height;
  glViewport(0, 0, v5, (int)(float)(backingScale * height));
  -[DKOpenGLRenderer drawComposite](self, "drawComposite");
  glDisable(0xBE2u);
}

- (void)drawComposite
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  CGFloat width;
  CGFloat height;
  double backingScale;
  double v17;
  double v18;
  double v19;
  double v20;
  Page *begin;
  uint64_t v22;
  uint64_t v23;
  int v24;
  float v25;
  int v26;
  double v27;
  char *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  GLfloat v36[16];
  GLfloat value[16];
  GLfloat v[4];

  v3 = (int)*(_QWORD *)self->mCanvasSize;
  v4 = (double)(-[DKOpenGLRenderer numPages](self, "numPages") * v3);
  v5 = (double)*(int *)&self->mCanvasSize[4];
  v6 = *(_QWORD *)self->mCanvasOffset;
  v7 = (double)(int)v6;
  v8 = (double)SHIDWORD(v6);
  glUseProgram(self->mColorProg);
  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)v = _Q0;
  if (DKIsDarkMode())
    *(_OWORD *)v = xmmword_21DCC0790;
  glUniform4fv(self->mColorProgColorUniformLocation, 1, v);
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  *(float *)&width = width;
  *(float *)&height = height;
  +[DKGLUtilities setProjectionMatrixForWidth:height:flipped:matrix:](DKGLUtilities, "setProjectionMatrixForWidth:height:flipped:matrix:", 1, value, width, height);
  glUniformMatrix4fv(self->mColorProgModelViewProjectionUniformLocation, 1, 0, value);
  backingScale = self->_backingScale;
  v17 = backingScale * v7;
  v18 = backingScale * v8;
  v19 = backingScale * v4;
  v20 = backingScale * v5;
  *(float *)&backingScale = backingScale * v7;
  *(float *)&v17 = v18;
  *(float *)&v18 = v19;
  *(float *)&v19 = v20;
  +[DKGLUtilities drawQuadAtX:Y:width:height:](DKGLUtilities, "drawQuadAtX:Y:width:height:", backingScale, v17, v18, v19);
  begin = self->mPages.__begin_;
  if ((int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)) >= 1)
  {
    v22 = 0;
    v23 = 0;
    do
    {
      v24 = HIDWORD(*(_QWORD *)self->mCanvasSize);
      v25 = (float)(int)*(_QWORD *)self->mCanvasSize;
      v26 = HIDWORD(*(_QWORD *)self->mCanvasOffset);
      v27 = (double)(int)*(_QWORD *)self->mCanvasOffset + (float)((float)(int)v23 * v25);
      glActiveTexture(0x84C0u);
      v28 = (char *)begin + v22;
      glBindTexture(0xDE1u, *((_DWORD *)v28 + 5));
      glUseProgram(self->mTextureProg);
      v29 = self->_backingScale;
      v30 = (double)(int)*((_QWORD *)v28 + 3) / v29;
      *(float *)&v30 = v30;
      v31 = (double)(int)HIDWORD(*((_QWORD *)v28 + 3)) / v29;
      *(float *)&v31 = v31;
      +[DKGLUtilities setProjectionMatrixForWidth:height:flipped:matrix:](DKGLUtilities, "setProjectionMatrixForWidth:height:flipped:matrix:", 1, v36, v30, v31);
      glUniformMatrix4fv(self->mTextureProgModelViewProjectionUniformLocation, 1, 0, v36);
      *(float *)&v32 = v27;
      *(float *)&v33 = (float)v26;
      *(float *)&v34 = (float)v24;
      *(float *)&v35 = v25;
      +[DKGLUtilities drawQuadAtX:Y:width:height:](DKGLUtilities, "drawQuadAtX:Y:width:height:", v32, v33, v35, v34);
      ++v23;
      begin = self->mPages.__begin_;
      v22 += 40;
    }
    while (v23 < (int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)));
  }
}

- (void)undo
{
  if (self->mVertexHistory.__end_ != self->mVertexHistory.__begin_ && self->_undoEnabled)
  {
    -[DKOpenGLRenderer removeVertexHistoryElement](self, "removeVertexHistoryElement");
    -[DKOpenGLRenderer drawContiguousVertexStorageImmediatelyWithLayeredBlending:](self, "drawContiguousVertexStorageImmediatelyWithLayeredBlending:", 1);
  }
}

- (void)drawContiguousVertexStorageImmediatelyWithLayeredBlending:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  int64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int mBufferSize;
  unsigned int v11;
  unint64_t v12;
  char *v13;
  float *v14;
  float *v15;
  uint64_t v16;
  uint64_t v17;
  float *v18;
  uint64_t v19;
  char *v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *__p;
  void *v30;
  uint64_t v31;
  void *v32;
  float *v33;
  uint64_t v34;

  v3 = a3;
  glEnable(0xBE2u);
  glBlendFunc(1u, 0x303u);
  +[DKGLUtilities setCurrentClearColor](DKGLUtilities, "setCurrentClearColor");
  glClear(0x4000u);
  glViewport(0, 0, (int)self->_backingScale * (int)self->_bounds.size.width, (int)self->_bounds.size.height * (int)self->_backingScale);
  -[DKOpenGLRenderer clear](self, "clear");
  self->mNonCollisionSegments.__end_ = self->mNonCollisionSegments.__begin_;
  v5 = self->mContiguousVertexStorage.__end_ == self->mContiguousVertexStorage.__begin_;
  v6 = (self->mContiguousVertexStorage.__end_ - self->mContiguousVertexStorage.__begin_) >> 3;
  v7 = -1431655765 * v6;
  self->mVertexRange.location = 0xAAAAAAAAAAAAAAABLL * v6;
  self->mVertexRange.length = 0;
  if (!v5)
  {
    v8 = vcvtps_u32_f32((float)v7 / (float)self->mBufferSize);
    if (v3)
    {
      glUseProgram(self->mWetPaintProg);
      glUniform1i(self->mWetPaintProgSubtractEndPointsOnlyUniformLocation, 1);
    }
    if (v8)
    {
      v9 = 0;
      while (1)
      {
        mBufferSize = self->mBufferSize;
        v11 = v7 - mBufferSize * v9;
        if (v11 >= mBufferSize)
          v12 = mBufferSize;
        else
          v12 = v11;
        v13 = (char *)self->mContiguousVertexStorage.__begin_ + 24 * mBufferSize * v9;
        v33 = 0;
        v34 = 0;
        v32 = 0;
        std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&v32, v13, (uint64_t)&v13[24 * v12], v12);
        __p = 0;
        v30 = 0;
        v31 = 0;
        std::vector<Vertex>::__init_with_size[abi:ne180100]<Vertex*,Vertex*>(&__p, v32, (uint64_t)v33, 0xAAAAAAAAAAAAAAABLL * (((char *)v33 - (_BYTE *)v32) >> 3));
        -[DKOpenGLRenderer updateVertexControllerWithData:range:allowWet:](self, "updateVertexControllerWithData:range:allowWet:", &__p, 0, v12, 0);
        if (__p)
        {
          v30 = __p;
          operator delete(__p);
        }
        v14 = (float *)v32;
        v15 = v33;
        if (v32 != v33)
          break;
LABEL_25:
        if (v14)
        {
          v33 = v14;
          operator delete(v14);
        }
        if (++v9 == v8)
          goto LABEL_28;
      }
      LODWORD(v16) = 0;
      LODWORD(v17) = 0;
      v18 = (float *)((char *)v32 + 24);
      while (1)
      {
        v16 = (v16 + 1);
        if (v18 == v15 || !v3)
        {
          if (v18 == v15)
            goto LABEL_19;
        }
        else if (v18[5] == 0.0 && *(v18 - 1) == 1.0)
        {
LABEL_19:
          v19 = v17;
          -[DKOpenGLRenderer renderToWetPaintBufferWithRange:](self, "renderToWetPaintBufferWithRange:", v17, v16);
          v20 = (char *)v32 + 24 * v17;
          v17 = (v16 + v17);
          v27 = 0;
          v28 = 0;
          v26 = 0;
          std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&v26, v20, (uint64_t)v32 + 24 * v17, v17 - v19);
          LODWORD(v21) = 10.0;
          -[DKOpenGLRenderer regionWithVertices:withInflationAmount:](self, "regionWithVertices:withInflationAmount:", &v26, v21);
          self->mDirtyCanvasRegion.origin.x = v22;
          self->mDirtyCanvasRegion.origin.y = v23;
          self->mDirtyCanvasRegion.size.width = v24;
          self->mDirtyCanvasRegion.size.height = v25;
          if (v26)
          {
            v27 = v26;
            operator delete(v26);
          }
          -[DKOpenGLRenderer updateDryCycleIncludingComposite:](self, "updateDryCycleIncludingComposite:", 0);
          LODWORD(v16) = 0;
          v15 = v33;
        }
        v5 = v18 == v15;
        v18 += 6;
        if (v5)
        {
          v14 = (float *)v32;
          goto LABEL_25;
        }
      }
    }
LABEL_28:
    -[DKOpenGLRenderer renderToComposite:](self, "renderToComposite:", 0);
  }
  if (v3)
  {
    glUseProgram(self->mWetPaintProg);
    glUniform1i(self->mWetPaintProgSubtractEndPointsOnlyUniformLocation, 0);
  }
  glFinish();
}

- (BOOL)canvasIsEmpty
{
  return self->mContiguousVertexStorage.__end_ == self->mContiguousVertexStorage.__begin_;
}

- (void)resetRendererState
{
  CGSize v3;

  self->mVertexRange.location = 0;
  self->mVertexRange.length = 0;
  *(_QWORD *)&self->mTime = 0x3C23D70A3F822225;
  glUseProgram(self->mWetPaintProg);
  glUniform1f(self->mWetPaintProgTimeUniformLocation, self->mTime);
  self->mParticleLifespan = 2.0;
  glUseProgram(self->mWetPaintProg);
  glUniform1f(self->mWetPaintProgLifespanUniformLocation, self->mParticleLifespan);
  v3 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->mDirtyCanvasRegion.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->mDirtyCanvasRegion.size = v3;
  self->mContiguousVertexStorage.__end_ = self->mContiguousVertexStorage.__begin_;
  self->mVertexHistory.__end_ = self->mVertexHistory.__begin_;
  self->_ignoreFirstUndoItem = 0;
  -[DKOpenGLRenderer clear](self, "clear");
}

- (void)clear
{
  -[DKOpenGLRenderer clearWetPaintBuffer](self, "clearWetPaintBuffer");
  -[DKOpenGLRenderer clearDryPaintBuffer](self, "clearDryPaintBuffer");
  -[DKOpenGLRenderer clearComposite](self, "clearComposite");
}

- (void)clearWetPaintBuffer
{
  GLint params;

  params = 0;
  glGetIntegerv(0x8CA6u, &params);
  glBindFramebuffer(0x8D40u, self->mWetPaintBufferFBO);
  glClearColor(0.0, 0.0, 0.0, 0.0);
  glClear(0x4000u);
  glBindFramebuffer(0x8D40u, params);
}

- (void)clearDryPaintBuffer
{
  Page *begin;
  uint64_t v4;
  uint64_t v5;
  GLint params;

  begin = self->mPages.__begin_;
  if ((int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)) >= 1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      params = 0;
      glGetIntegerv(0x8CA6u, &params);
      glBindFramebuffer(0x8D40u, *(_DWORD *)((char *)begin + v4));
      glClearColor(0.0, 0.0, 0.0, 0.0);
      glClear(0x4000u);
      glBindFramebuffer(0x8D40u, params);
      ++v5;
      begin = self->mPages.__begin_;
      v4 += 40;
    }
    while (v5 < (int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)));
  }
}

- (void)clearComposite
{
  Page *begin;
  uint64_t v4;
  uint64_t v5;
  GLint params;

  begin = self->mPages.__begin_;
  if ((int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)) >= 1)
  {
    v4 = 0;
    v5 = 16;
    do
    {
      params = 0;
      glGetIntegerv(0x8CA6u, &params);
      glBindFramebuffer(0x8D40u, *(_DWORD *)((char *)begin + v5));
      glClearColor(0.0, 0.0, 0.0, 0.0);
      glClear(0x4000u);
      glBindFramebuffer(0x8D40u, params);
      ++v4;
      begin = self->mPages.__begin_;
      v5 += 40;
    }
    while (v4 < (int)(-858993459 * ((unint64_t)(self->mPages.__end_ - begin) >> 3)));
  }
}

- (void)didBeginNewStroke
{
  if (-[DKOpenGLRenderer drawingEnabled](self, "drawingEnabled"))
  {
    if (self->_undoEnabled)
      -[DKOpenGLRenderer appendVertexHistoryElement](self, "appendVertexHistoryElement");
  }
}

- (void)updateVertexControllerWithDataRange:(_NSRange)a3 allowWet:(BOOL)a4
{
  _BOOL4 v4;
  int length;
  NSUInteger v7;
  float mTime;
  char *v9;
  float *v10;
  float *v11;
  GLuint mVbo;
  GLvoid *data;
  float *v14;
  uint64_t v15;

  v4 = a4;
  length = a3.length;
  v7 = a3.location % self->mBufferSize;
  mTime = self->mTime;
  v9 = (char *)self->mContiguousVertexStorage.__begin_ + 24 * a3.location;
  v14 = 0;
  v15 = 0;
  data = 0;
  std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&data, v9, (uint64_t)&v9[24 * a3.length], a3.length);
  if (v4)
  {
    v10 = (float *)data;
    v11 = v14;
    while (v10 != v11)
    {
      v10[3] = mTime;
      v10 += 6;
    }
  }
  mVbo = self->mVbo;
  if ((v7 + length) <= self->mBufferSize)
  {
    glBindBuffer(0x8892u, mVbo);
    glBufferSubData(0x8892u, 24 * (int)v7, 24 * length, data);
  }
  else
  {
    glBindBuffer(0x8892u, mVbo);
    glBufferSubData(0x8892u, 24 * (int)v7, 24 * (self->mBufferSize - v7), data);
    glBufferSubData(0x8892u, 0, 24 * (((int)v7 + length) % (unint64_t)self->mBufferSize), (char *)data + 24 * (int)v7 + 24 * (unint64_t)(self->mBufferSize - v7));
  }
  if (data)
  {
    v14 = (float *)data;
    operator delete(data);
  }
}

- (void)updateVertexControllerWithData:()vector<Vertex range:(std:(_NSRange)a4 :(BOOL)a5 allocator<Vertex>> *)a3 allowWet:
{
  _BOOL4 v5;
  int length;
  NSUInteger v8;
  float mTime;
  char *v10;
  char *v11;
  float *v12;
  float *v13;
  GLuint mVbo;
  GLvoid *data;
  float *v16;
  uint64_t v17;

  v5 = a5;
  length = a4.length;
  v8 = a4.location % self->mBufferSize;
  mTime = self->mTime;
  v10 = (char *)a3->__begin_ + 24 * a4.location;
  v11 = (char *)a3->__begin_ + 24 * a4.location + 24 * a4.length;
  v16 = 0;
  v17 = 0;
  data = 0;
  std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(&data, v10, (uint64_t)v11, 0xAAAAAAAAAAAAAAABLL * ((int64_t)(24 * a4.length) >> 3));
  if (v5)
  {
    v12 = (float *)data;
    v13 = v16;
    while (v12 != v13)
    {
      v12[3] = mTime;
      v12 += 6;
    }
  }
  mVbo = self->mVbo;
  if ((v8 + length) <= self->mBufferSize)
  {
    glBindBuffer(0x8892u, mVbo);
    glBufferSubData(0x8892u, 24 * (int)v8, 24 * length, data);
  }
  else
  {
    glBindBuffer(0x8892u, mVbo);
    glBufferSubData(0x8892u, 24 * (int)v8, 24 * (self->mBufferSize - v8), data);
    glBufferSubData(0x8892u, 0, 24 * (((int)v8 + length) % (unint64_t)self->mBufferSize), (char *)data + 24 * (int)v8 + 24 * (unint64_t)(self->mBufferSize - v8));
  }
  if (data)
  {
    v16 = (float *)data;
    operator delete(data);
  }
}

- (id)snapshotImage
{
  void *v3;

  if (!+[DKGLUtilities gpuAvailable](DKGLUtilities, "gpuAvailable")
    || self->mPages.__end_ == self->mPages.__begin_)
  {
    v3 = 0;
  }
  else
  {
    -[DKOpenGLRenderer update](self, "update");
    -[DKOpenGLRenderer draw](self, "draw");
    +[DKGLUtilities snapshotImageOfFrameBufferWithID:bufferSize:displayScale:](DKGLUtilities, "snapshotImageOfFrameBufferWithID:bufferSize:displayScale:", *((unsigned int *)self->mPages.__begin_ + 4), self->_bounds.size.width, self->_bounds.size.height, self->_backingScale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (DKOpenGLRendererDelegate)delegate
{
  return (DKOpenGLRendererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)inkColor
{
  return self->_inkColor;
}

- (double)lineWidthScale
{
  return self->_lineWidthScale;
}

- (void)setLineWidthScale:(double)a3
{
  self->_lineWidthScale = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isUndoEnabled
{
  return self->_undoEnabled;
}

- (void)setUndoEnabled:(BOOL)a3
{
  self->_undoEnabled = a3;
}

- (BOOL)ignoreFirstUndoItem
{
  return self->_ignoreFirstUndoItem;
}

- (void)setIgnoreFirstUndoItem:(BOOL)a3
{
  self->_ignoreFirstUndoItem = a3;
}

- (double)backingScale
{
  return self->_backingScale;
}

- (BOOL)drawingEnabled
{
  return self->_drawingEnabled;
}

- (BOOL)allowWetComposite
{
  return self->_allowWetComposite;
}

- (int64_t)numPages
{
  return self->_numPages;
}

- (void).cxx_destruct
{
  Page *begin;
  void *v4;
  VertexGroup *v5;
  Vertex *v6;

  objc_storeStrong((id *)&self->_inkColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  begin = self->mPages.__begin_;
  if (begin)
  {
    self->mPages.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->mNonCollisionSegments.__begin_;
  if (v4)
  {
    self->mNonCollisionSegments.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->mVertexHistory.__begin_;
  if (v5)
  {
    self->mVertexHistory.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->mContiguousVertexStorage.__begin_;
  if (v6)
  {
    self->mContiguousVertexStorage.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_QWORD *)self + 16) = 0;
  return self;
}

@end
