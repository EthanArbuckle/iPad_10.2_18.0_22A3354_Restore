@implementation ETGLSketchRenderer

- (ETGLSketchRenderer)initWithContext:(id)a3 andDrawable:(id)a4
{
  EAGLContext *v6;
  id v7;
  ETGLSketchRenderer *v8;
  ETGLSketchRenderer *v9;
  GLenum Error;
  NSObject *v11;
  ETGLSketchRenderer *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  GLenum v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (EAGLContext *)a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ETGLSketchRenderer;
  v8 = -[ETGLSketchRenderer init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ETGLSketchRenderer setIsDying:](v8, "setIsDying:", 0);
    *(_QWORD *)&v9->_allocatedWidth = 0;
    v9->_lineWidthScaleFactor = 1.0;
    v9->_cometScaleFactor = 1.0;
    v9->_context = v6;
    if (v7)
    {
      -[ETGLSketchRenderer setupFBOs:](v9, "setupFBOs:", v7);
      -[ETGLSketchRenderer setupVAOs](v9, "setupVAOs");
    }
    -[ETGLSketchRenderer setupShaders](v9, "setupShaders");
    -[ETGLSketchRenderer setupTexture](v9, "setupTexture");
    glEnable(0xBE2u);
    glBlendFunc(1u, 0x303u);
    Error = glGetError();
    if (Error && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[ETGLSketchRenderer initWithContext:andDrawable:]";
        v17 = 1024;
        v18 = Error;
        _os_log_impl(&dword_22C68B000, v11, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
      }

    }
    *(_QWORD *)&v9->_vertexBufferCount = 0;
    *(_QWORD *)&v9->_currentTimeClock = 0;
    v12 = v9;
  }

  return v9;
}

- (void)dealloc
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *allVertices;
  EAGLContext *v4;
  EAGLContext *context;
  objc_super v6;

  allVertices = self->_allVertices;
  if (allVertices)
  {
    free(allVertices);
    self->_allVertices = 0;
  }
  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v4 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;

  if (v4 == context)
    objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", 0);
  v6.receiver = self;
  v6.super_class = (Class)ETGLSketchRenderer;
  -[ETGLSketchRenderer dealloc](&v6, sel_dealloc);
}

- (void)animateOutWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  double wispDelay;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__ETGLSketchRenderer_animateOutWithCompletion___block_invoke;
  v13[3] = &unk_24F6E6F30;
  objc_copyWeak(&v15, &location);
  v6 = v4;
  v14 = v6;
  v7 = MEMORY[0x22E2FF82C](v13);
  v8 = (void *)v7;
  wispDelay = self->_wispDelay;
  if (wispDelay == 0.0)
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
  else
  {
    v10 = dispatch_time(0, (uint64_t)(wispDelay * 1000000000.0));
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __47__ETGLSketchRenderer_animateOutWithCompletion___block_invoke_2;
    v11[3] = &unk_24F6E6E20;
    v12 = v8;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], v11);

  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __47__ETGLSketchRenderer_animateOutWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsDying:", 1);

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "setCompletionBlock:", v5);

}

uint64_t __47__ETGLSketchRenderer_animateOutWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateGLWithTime:(float)a3
{
  self->_currentTimeClock = a3;
  if (!-[ETGLSketchRenderer isDying](self, "isDying"))
    self->_deathTime = self->_currentTimeClock;
}

- (void)updateGLWithCurrentTime
{
  self->_currentTimeClock = self->_currentTimeClock + 0.016667;
  if (!-[ETGLSketchRenderer isDying](self, "isDying"))
    self->_deathTime = self->_currentTimeClock;
}

- (void)setInitialDrawingColor:(ETGLSketchRenderer *)self
{
  _OWORD *v2;

  *(_OWORD *)self->_brushColorForInitialColor = *v2;
}

- (void)setFinalDrawingColor:(ETGLSketchRenderer *)self
{
  _OWORD *v2;

  *(_OWORD *)self->_brushColorForFinalColor = *v2;
}

- (void)setupFBOs:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  GLenum v8;
  GLint params[2];
  uint8_t buf[4];
  GLint v11;
  __int16 v12;
  GLint v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  glGenFramebuffers(1, &self->_viewFramebuffer);
  glGenRenderbuffers(1, &self->_viewRenderbuffer);
  glBindFramebuffer(0x8D40u, self->_viewFramebuffer);
  glBindRenderbuffer(0x8D41u, self->_viewRenderbuffer);
  -[EAGLContext renderbufferStorage:fromDrawable:](self->_context, "renderbufferStorage:fromDrawable:", 36161, v4);
  glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, self->_viewRenderbuffer);
  *(_QWORD *)params = 0;
  glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &params[1]);
  glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, params);
  v5 = params[0];
  self->_backingWidth = params[1];
  self->_backingHeight = v5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v11 = params[1];
      v12 = 1024;
      v13 = params[0];
      _os_log_impl(&dword_22C68B000, v6, OS_LOG_TYPE_INFO, "w and h -  %i %i", buf, 0xEu);
    }

  }
  if (self->_backingWidth && self->_backingHeight)
  {
    if (glCheckFramebufferStatus(0x8D40u) != 36053 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = glCheckFramebufferStatus(0x8D40u);
        *(_DWORD *)buf = 67109120;
        v11 = v8;
        _os_log_impl(&dword_22C68B000, v7, OS_LOG_TYPE_INFO, "failed to make complete framebuffer object %x", buf, 8u);
      }

    }
    glViewport(0, 0, self->_backingWidth, self->_backingHeight);
  }

}

- (void)setupTexture
{
  int32x2_t v2;
  int v3;
  uint64_t *v4;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int16x8_t v16;
  GLuint textures;

  textures = 0;
  if ((setupTexture_alreadyGeneratedStaticPixelsData & 1) == 0)
  {
    v3 = 0;
    v4 = &setupTexture_pixels;
    __asm
    {
      FMOV            V3.4S, #4.0
      FMOV            V4.4S, #1.0
    }
    v11 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    do
    {
      *(float *)v2.i32 = (float)((float)((float)v3 / 7.0) + -0.5) * (float)((float)((float)v3 / 7.0) + -0.5);
      v12 = (float32x4_t)vdupq_lane_s32(v2, 0);
      v13 = vmlsq_f32(_Q4, _Q3, vaddq_f32(v12, (float32x4_t)xmmword_22C6BA9E0));
      v14 = vaddq_f32(v12, (float32x4_t)xmmword_22C6BA9F0);
      v15 = vmlsq_f32(_Q4, _Q3, v14);
      *(int8x8_t *)v14.f32 = vand_s8(vorr_s8((int8x8_t)vmovn_s32(vcvtq_s32_f32(vmulq_f32(v13, v11))), (int8x8_t)vmovn_s32(vcgeq_f32(v13, _Q4))), (int8x8_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vclezq_f32(v13))));
      v16 = (int16x8_t)vmvnq_s8((int8x16_t)vclezq_f32(v15));
      v2.i32[0] = vmovn_s16((int16x8_t)v14).u32[0];
      *(int8x8_t *)v16.i8 = vand_s8(vorr_s8((int8x8_t)vmovn_s32(vcvtq_s32_f32(vmulq_f32(v15, v11))), (int8x8_t)vmovn_s32(vcgeq_f32(v15, _Q4))), (int8x8_t)vmovn_s32((int32x4_t)v16));
      v2.i32[1] = vmovn_s16(v16).u32[0];
      *v4++ = (uint64_t)v2;
      ++v3;
    }
    while (v3 != 8);
    setupTexture_alreadyGeneratedStaticPixelsData = 1;
  }
  glGenTextures(1, &textures);
  glBindTexture(0xDE1u, textures);
  glPixelStorei(0xCF5u, 1);
  glTexParameteri(0xDE1u, 0x2801u, 9729);
  glTexParameteri(0xDE1u, 0x2800u, 9729);
  glTexParameteri(0xDE1u, 0x2802u, 33071);
  glTexParameteri(0xDE1u, 0x2803u, 33071);
  glTexImage2D(0xDE1u, 0, 6403, 8, 8, 0, 0x1903u, 0x1401u, &setupTexture_pixels);
}

- (void)setupShaders
{
  self->_shaderProgram = -[ETGLSketchRenderer linkProgramWithVShader:FShader:](self, "linkProgramWithVShader:FShader:", -[ETGLSketchRenderer loadOneShaderOfType:withCString:length:](self, "loadOneShaderOfType:withCString:length:", 35633, "#version 100\n#extension GL_EXT_separate_shader_objects : enable\n\nlayout(location = 0) attribute vec4 in_Vertex;\n"
                             "layout(location = 1) attribute vec4 in_InitialColor;\n"
                             "layout(location = 2) attribute vec4 in_FinalColor;\n"
                             "layout(location = 3) attribute vec4 in_TimesAndNoise;\n"
                             "layout(location = 4) attribute vec4 in_PointSize;\n"
                             "\n"
                             "layout(location = 5) attribute float in_CurrentTime;\n"
                             "layout(location = 6) attribute float in_DeathTime;\n"
                             "layout(location = 7) attribute float in_LastBirthTime;\n"
                             "layout(location = 8) attribute float in_DeathPerPoint;\n"
                             "layout(location = 9) attribute float in_DeathUntilKill;\n"
                             "\n"
                             "varying mediump vec4  out_Color;\n"
                             "\n"
                             "void main(void)\n"
                             "{\n"
                             "mediump float cometLife = 0.3;\n"
                             "mediump float colorChangeTime = 5.25;\n"
                             "mediump float relaxationTime = 5.0;\n"
                             "mediump float life = (in_CurrentTime - in_TimesAndNoise.x);\n"
                             "mediump float birthToDeathRatio = in_TimesAndNoise.y/in_LastBirthTime;\n"
                             "mediump float kTimeIndexIncrement = 0.016666666667;\n"
                             "mediump float cometLifeRatio;\n"
                             "mediump float deathRatio;\n"
                             "mediump float deathRatioTriangle;\n"
                             "mediump float tailRatio;\n"
                             "deathRatio = (in_CurrentTime - in_DeathTime);\n"
                             "deathRatio = clamp(deathRatio - birthToDeathRatio * (in_DeathUntilKill - in_DeathPerPoint),"
                             " 0.0, in_DeathPerPoint) / in_DeathPerPoint;\n"
                             "tailRatio = step((in_LastBirthTime - 500.0 * kTimeIndexIncrement)/in_LastBirthTime, birthTo"
                             "DeathRatio) * step(0.01, deathRatio) * birthToDeathRatio * deathRatio;\n"
                             "cometLifeRatio = 1.0 - clamp(life, 0.0, cometLife) / cometLife;\n"
                             "cometLifeRatio = smoothstep(0.0, 1.0, cometLifeRatio);\n"
                             "mediump float relaxationRatio = clamp(life, 0.0, relaxationTime) / relaxationTime;\n"
                             "mediump float colorChangeRatio = clamp(life, 0.0, colorChangeTime) / colorChangeTime;\n"
                             "deathRatioTriangle = 1.0 - clamp(abs((deathRatio - 0.25) * 4.0), 0.0, 1.0);\n"
                             "vec2 pos = vec2(in_Vertex.xy + (in_Vertex.zw - in_Vertex.xy) * relaxationRatio * relaxation"
                             "Ratio * relaxationRatio * (relaxationRatio * (relaxationRatio * 6. - 15.) + 10.));\n"
                             "pos = pos + ((1.0+in_PointSize.z) * in_TimesAndNoise.zw * deathRatio * deathRatio * (1.0 + "
                             "(tailRatio * tailRatio * tailRatio * 1.25)));\n"
                             "mediump float deathTime = in_CurrentTime - in_DeathTime;\n"
                             "pos = (pos * (1.0-(in_PointSize.z*0.3)*deathTime*deathTime)) + vec2(0.0, in_PointSize.z*dea"
                             "thTime*deathTime*deathTime);\n"
                             "gl_Position = vec4(pos, 0.0, 1.0);\n"
                             "gl_PointSize = (1.0 + 7.0 * cometLifeRatio * in_PointSize.y) * in_PointSize.x;\n"
                             "gl_PointSize -= (gl_PointSize-1.0) * deathRatio * deathRatio * deathRatio;\n"
                             "gl_PointSize += 31.0 * tailRatio * tailRatio * tailRatio * in_PointSize.y;\n"
                             "out_Color = mix(in_InitialColor, in_FinalColor, colorChangeRatio);\n"
                             "out_Color.rgb = mix(out_Color.rgb, vec3(1.0), cometLifeRatio + deathRatioTriangle * 0.3);\n"
                             "out_Color.a = (1.0 - deathRatio) * (1.0 - tailRatio) * (0.15 + 0.85 * (1.0 - cometLifeRatio));\n}\n",
                             2760),
                           -[ETGLSketchRenderer loadOneShaderOfType:withCString:length:](self, "loadOneShaderOfType:withCString:length:", 35632, "#version 100\n\nuniform mediump sampler2D theTex;\n"
                             "varying mediump vec4  out_Color;\n"
                             "\n"
                             "void main(void)\n"
                             "{\n"
                             "gl_FragColor = out_Color;\n"
                             "gl_FragColor.a *= texture2D(theTex, gl_PointCoord).r;\n"
                             "gl_FragColor.rgb *= gl_FragColor.a;\n"
                             "}\n",
                             218));
}

- (int)loadOneShaderOfType:(unsigned int)a3 withCString:(const char *)a4 length:(int)a5
{
  GLuint Shader;
  GLint params;
  GLint v8;
  GLint length;
  GLchar *string;

  string = (GLchar *)a4;
  v8 = 0;
  length = a5;
  params = 0;
  Shader = glCreateShader(a3);
  glShaderSource(Shader, 1, (const GLchar *const *)&string, &length);
  glCompileShader(Shader);
  glGetShaderiv(Shader, 0x8B81u, &params);
  glGetShaderiv(Shader, 0x8B84u, &v8);
  return Shader;
}

- (int)linkProgramWithVShader:(int)a3 FShader:(int)a4
{
  GLuint Program;
  GLint params[2];

  *(_QWORD *)params = 0;
  Program = glCreateProgram();
  glAttachShader(Program, a3);
  glAttachShader(Program, a4);
  glLinkProgram(Program);
  glGetProgramiv(Program, 0x8B82u, params);
  glGetProgramiv(Program, 0x8B84u, &params[1]);
  glDetachShader(Program, a3);
  glDetachShader(Program, a4);
  glDeleteShader(a3);
  glDeleteShader(a4);
  return Program;
}

- (void)setupVAOs
{
  glGenVertexArraysOES();
  glBindVertexArrayOES();
  glGenBuffers(1, &self->_vboVertLineId);
  glBindBuffer(0x8892u, self->_vboVertLineId);
  self->_allVertices = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(0x5000uLL, 0x50uLL, 0x10000404247E4FDuLL);
  glBufferData(0x8892u, 1638400, 0, 0x88E8u);
  glEnableVertexAttribArray(0);
  glVertexAttribPointer(0, 4, 0x1406u, 0, 80, 0);
  glEnableVertexAttribArray(1u);
  glVertexAttribPointer(1u, 4, 0x1406u, 0, 80, (const GLvoid *)0x10);
  glEnableVertexAttribArray(2u);
  glVertexAttribPointer(2u, 4, 0x1406u, 0, 80, (const GLvoid *)0x20);
  glEnableVertexAttribArray(3u);
  glVertexAttribPointer(3u, 4, 0x1406u, 0, 80, (const GLvoid *)0x30);
  glEnableVertexAttribArray(4u);
  glVertexAttribPointer(4u, 4, 0x1406u, 0, 80, (const GLvoid *)0x40);
}

- (BOOL)resizeFromCachedLayer
{
  double v3;
  double v4;
  NSObject *v5;
  unsigned int v6;
  NSObject *v7;
  GLsizei backingWidth;
  GLsizei backingHeight;
  GLenum Error;
  NSObject *v11;
  int v12;
  NSObject *v13;
  GLenum v14;
  GLint params[2];
  uint8_t buf[4];
  _BYTE v18[10];
  GLenum v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (self->_allocatedWidth)
  {
    -[CAEAGLLayer bounds](self->_cachedLayer, "bounds");
    if (*(_QWORD *)&self->_backingWidth == __PAIR64__((int)v4, (int)v3))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C68B000, v5, OS_LOG_TYPE_INFO, "Redundantly resizing Sketch renderer", buf, 2u);
        }

      }
    }
  }
  glBindFramebuffer(0x8D40u, self->_viewFramebuffer);
  glBindRenderbuffer(0x8D41u, self->_viewRenderbuffer);
  -[EAGLContext renderbufferStorage:fromDrawable:](self->_context, "renderbufferStorage:fromDrawable:", 36161, self->_cachedLayer);
  *(_QWORD *)params = 0;
  glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &params[1]);
  glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, params);
  v6 = params[0];
  self->_backingWidth = params[1];
  self->_backingHeight = v6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v18 = params[1];
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = params[0];
      _os_log_impl(&dword_22C68B000, v7, OS_LOG_TYPE_INFO, "resizing layer -  %i %i", buf, 0xEu);
    }

  }
  backingWidth = self->_backingWidth;
  if (!backingWidth)
    goto LABEL_24;
  backingHeight = self->_backingHeight;
  if (!backingHeight)
    goto LABEL_24;
  glViewport(0, 0, backingWidth, backingHeight);
  if (glCheckFramebufferStatus(0x8D40u) != 36053)
  {
    v12 = IMOSLoggingEnabled();
    if (!v12)
      return v12;
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = glCheckFramebufferStatus(0x8D40u);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v18 = v14;
      _os_log_impl(&dword_22C68B000, v13, OS_LOG_TYPE_INFO, "failed to make complete framebuffer object %x", buf, 8u);
    }

LABEL_24:
    LOBYTE(v12) = 0;
    return v12;
  }
  Error = glGetError();
  if (Error && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v18 = "-[ETGLSketchRenderer resizeFromCachedLayer]";
      *(_WORD *)&v18[8] = 1024;
      v19 = Error;
      _os_log_impl(&dword_22C68B000, v11, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
    }

  }
  *(_QWORD *)&self->_allocatedWidth = *(_QWORD *)&self->_backingWidth;
  LOBYTE(v12) = 1;
  return v12;
}

- (BOOL)resizeFromLayer:(id)a3
{
  self->_cachedLayer = (CAEAGLLayer *)a3;
  return -[ETGLSketchRenderer resizeFromCachedLayer](self, "resizeFromCachedLayer");
}

- (void)reset
{
  unsigned int *p_viewFramebuffer;
  unsigned int *p_vaoLineID;
  unsigned int vaoLineID;

  p_viewFramebuffer = &self->_viewFramebuffer;
  if (self->_viewFramebuffer)
  {
    glDeleteFramebuffers(1, p_viewFramebuffer);
    *p_viewFramebuffer = 0;
  }
  if (self->_viewRenderbuffer)
  {
    glDeleteRenderbuffers(1, &self->_viewRenderbuffer);
    self->_viewRenderbuffer = 0;
  }
  if (self->_vboVertLineId)
  {
    glDeleteBuffers(1, &self->_vboVertLineId);
    self->_vboVertLineId = 0;
  }
  vaoLineID = self->_vaoLineID;
  p_vaoLineID = &self->_vaoLineID;
  if (vaoLineID)
  {
    glDeleteVertexArraysOES();
    *p_vaoLineID = 0;
  }
}

- (void)erase
{
  *(_QWORD *)&self->_vertexBufferCount = 0;
  *(_QWORD *)&self->_currentTimeClock = 0;
  *(_QWORD *)&self->_deathTime = 0;
}

- (void)appendPointArray:(ETGLSketchRenderer *)self length:(SEL)a2
{
  uint64_t v2;
  unint64_t v3;
  uint64_t vertexBufferCount;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  float32x2_t v18;
  float32x2_t v19;
  __int128 v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *allVertices;
  uint64_t v23;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v24;
  uint64_t v25;
  __int128 v26;
  float v27;
  uint32_t v28;
  float32x2_t v29;
  float32x2_t v30;
  char *v31;
  __int128 v32;
  float v33;
  float v34;
  float cometScaleFactor;
  float v36;
  float32x2_t v37;
  float32x2_t v38;

  vertexBufferCount = self->_vertexBufferCount;
  v6 = vertexBufferCount + v3;
  v7 = 20479 - vertexBufferCount;
  if (v6 >> 12 <= 4)
    v8 = v3;
  else
    v8 = v7;
  if (v8)
  {
    v9 = v2;
    v10 = 0;
    __asm { FMOV            V0.2S, #6.0 }
    v37 = _D0;
    v38 = (float32x2_t)vdup_n_s32(0x2F800000u);
    __asm
    {
      FMOV            V12.2S, #-15.0
      FMOV            V13.2S, #10.0
    }
    v18 = (float32x2_t)vdup_n_s32(0x3E19999Au);
    v19 = (float32x2_t)vdup_n_s32(0x3C23D70Au);
    __asm { FMOV            V8.2S, #1.0 }
    do
    {
      *(_QWORD *)&v21 = *(_QWORD *)(v9 + 8 * v10);
      allVertices = self->_allVertices;
      v23 = 80 * ((int)v10 + self->_vertexBufferCount);
      *((_QWORD *)&v21 + 1) = vextq_s8(*(int8x16_t *)((char *)allVertices + v23), *(int8x16_t *)((char *)allVertices + v23), 8uLL).u64[0];
      *(_OWORD *)((char *)allVertices + v23) = v21;
      v24 = self->_allVertices;
      v25 = 80 * ((int)v10 + self->_vertexBufferCount);
      v26 = *(_OWORD *)((char *)v24 + v25);
      *((_QWORD *)&v26 + 1) = *(_QWORD *)(v9 + 8 * v10);
      *(_OWORD *)((char *)v24 + v25) = v26;
      v27 = self->_currentTimeClock + (float)((float)((float)(int)v10 / (float)v8) * 0.016667);
      v28 = arc4random();
      v29 = vmul_f32(vcvt_f32_u32((uint32x2_t)__PAIR64__(arc4random(), v28)), v38);
      v30 = vmla_f32(v19, v18, vmul_f32(vmla_f32(_D13, vmla_f32(_D12, v37, v29), v29), vmul_f32(v29, vmul_f32(v29, vmul_f32(v29, vmul_f32(v29, v29))))));
      srdnoise2();
      v31 = (char *)self->_allVertices + 80 * (int)v10 + 80 * self->_vertexBufferCount;
      v32 = *((_OWORD *)v31 + 3);
      *((float32x2_t *)&v32 + 1) = vmul_f32(v30, 0);
      *((_OWORD *)v31 + 3) = v32;
      *((float *)self->_allVertices + 20 * (int)v10 + 20 * self->_vertexBufferCount + 12) = v27;
      v33 = self->_currentTimeIndex + 0.016667;
      self->_currentTimeIndex = v33;
      *((float *)self->_allVertices + 20 * (int)v10 + 20 * self->_vertexBufferCount + 13) = v33;
      v34 = self->_lineWidthScaleFactor * 8.0;
      *((float *)self->_allVertices + 20 * (int)v10 + 20 * self->_vertexBufferCount + 16) = v34;
      cometScaleFactor = self->_cometScaleFactor;
      *((float *)self->_allVertices + 20 * (int)v10 + 20 * self->_vertexBufferCount + 17) = cometScaleFactor;
      v36 = 3.0;
      if (!self->_useFastVerticalWisp)
        v36 = 0.0;
      *((float *)self->_allVertices + 20 * (int)v10 + 20 * self->_vertexBufferCount + 18) = v36;
      *((_OWORD *)self->_allVertices + 5 * (int)v10 + 5 * self->_vertexBufferCount + 1) = *(_OWORD *)self->_brushColorForInitialColor;
      *((_OWORD *)self->_allVertices + 5 * (int)v10++ + 5 * self->_vertexBufferCount + 2) = *(_OWORD *)self->_brushColorForFinalColor;
    }
    while (v8 > v10);
  }
  self->_lastBirth = self->_currentTimeIndex;
  self->_vertexCount = v8;
  -[ETGLSketchRenderer updateVertexBufferWithVertexCount:](self, "updateVertexBufferWithVertexCount:", v8, *(_QWORD *)&v37, *(_QWORD *)&v38);
}

- (void)appendDualPointArray:(ETGLSketchRenderer *)self length:(SEL)a2 controlPoint:alternatePoints:alternateLength:alternateControlPoint:unitSize:segmentIndex:segmentCount:
{
  float32x2_t *v2;
  unint64_t v3;
  float32x2_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float v10;
  uint64_t v12;
  float32x2_t v13;
  float32x2_t *v14;
  float32x2_t v15;
  float32x2_t *v16;
  float32x2_t v17;
  int32x2_t v18;
  unint64_t v19;
  float32x2_t v20;
  int32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  int32x2_t v24;
  float32x2_t v25;
  int32x2_t v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  uint64_t vertexBufferCount;
  float v38;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *allVertices;
  uint64_t v40;
  __int128 v41;
  float v42;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v43;
  uint64_t v44;
  __int128 v45;
  float currentTimeClock;
  uint32_t v47;
  int v48;
  float32x4_t v49;
  float32x2_t v50;
  int32x4_t v51;
  int8x16_t v52;
  float32x2_t v53;
  float v54;
  float v55;
  char *v56;
  __int128 v57;
  float v58;
  id WeakRetained;
  float32x2_t v60;
  uint64_t v61;
  float v62;
  float v63;

  v12 = v5 - 1;
  if (v5 == 1)
  {
    self->_currentTimeIndex = fmaxf(self->_currentTimeIndex + -0.83333, 0.0);
  }
  else if (v3 >= 2 && v5)
  {
    v13 = v9;
    v14 = v4;
    v15 = v8;
    v16 = v2;
    v17 = vsub_f32(*v2, v8);
    v18 = (int32x2_t)vmul_f32(v17, v17);
    v19 = v3 - 1;
    v20 = vsub_f32(v15, v2[v3 - 1]);
    v21 = (int32x2_t)vmul_f32(v20, v20);
    v22 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v18, v21), (float32x2_t)vzip2_s32(v18, v21)));
    v23 = vsub_f32(*v4, v13);
    v24 = (int32x2_t)vmul_f32(v23, v23);
    v25 = vsub_f32(v13, v4[v12]);
    v26 = (int32x2_t)vmul_f32(v25, v25);
    v27 = (int)(float)(vaddv_f32(v22) / v10);
    v28 = (int)(float)(vaddv_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v24, v26), (float32x2_t)vzip2_s32(v24, v26))))
                     / v10);
    if (v27 <= v28)
      v29 = v28;
    else
      v29 = v27;
    if ((int)v29 < 1)
    {
      v30 = 0;
    }
    else
    {
      v30 = 0;
      v31 = 1.0 / (float)v7;
      v62 = (float)v6;
      __asm { FMOV            V1.2S, #1.0 }
      v60 = (float32x2_t)vdup_n_s32(0x3DCCCCCDu);
      v61 = _D1;
      while (1)
      {
        vertexBufferCount = self->_vertexBufferCount;
        if ((unint64_t)(v30 - 20479 + vertexBufferCount) <= 0xFFFFFFFFFFFFAFFFLL)
          break;
        v38 = (float)(int)v30 / (float)(int)v29;
        allVertices = self->_allVertices;
        v40 = 80 * ((int)v30 + (int)vertexBufferCount);
        *(float32x2_t *)&v41 = vmla_n_f32(vmla_n_f32(vmul_n_f32(v15, v38 * (float)((float)(1.0 - v38) + (float)(1.0 - v38))), *v16, (float)(1.0 - v38) * (float)(1.0 - v38)), v16[v19], v38 * v38);
        *((_QWORD *)&v41 + 1) = vextq_s8(*(int8x16_t *)((char *)allVertices + v40), *(int8x16_t *)((char *)allVertices + v40), 8uLL).u64[0];
        *(_OWORD *)((char *)allVertices + v40) = v41;
        v42 = (float)(v31 * v38) + (float)(v31 * v62);
        v43 = self->_allVertices;
        v44 = 80 * ((int)v30 + self->_vertexBufferCount);
        v45 = *(_OWORD *)((char *)v43 + v44);
        *((float32x2_t *)&v45 + 1) = vmla_n_f32(vmla_n_f32(vmul_n_f32(v13, v42 * (float)((float)(1.0 - v42) + (float)(1.0 - v42))), *v14, (float)(1.0 - v42) * (float)(1.0 - v42)), v14[v12], v42 * v42);
        *(_OWORD *)((char *)v43 + v44) = v45;
        currentTimeClock = self->_currentTimeClock;
        v47 = arc4random();
        v48 = self->_vertexBufferCount;
        if ((int)v30 + v48 < 1)
        {
          v53 = 0;
        }
        else
        {
          v49 = vsubq_f32(*((float32x4_t *)self->_allVertices + 5 * (v30 + v48)), *((float32x4_t *)self->_allVertices + 5 * (v30 + v48 - 1)));
          v50 = (float32x2_t)vextq_s8((int8x16_t)v49, (int8x16_t)v49, 8uLL).u64[0];
          v51 = (int32x4_t)vmulq_f32(v49, v49);
          v52 = (int8x16_t)vdupq_laneq_s32(v51, 3);
          v51.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v51, (int8x16_t)v51, 8uLL), (float32x2_t)*(_OWORD *)&vextq_s8(v52, v52, 8uLL)).u32[0];
          *(float32x2_t *)v52.i8 = vrsqrte_f32((float32x2_t)v51.u32[0]);
          *(float32x2_t *)v52.i8 = vmul_f32(*(float32x2_t *)v52.i8, vrsqrts_f32((float32x2_t)v51.u32[0], vmul_f32(*(float32x2_t *)v52.i8, *(float32x2_t *)v52.i8)));
          v53 = vmul_n_f32(v50, vmul_f32(*(float32x2_t *)v52.i8, vrsqrts_f32((float32x2_t)v51.u32[0], vmul_f32(*(float32x2_t *)v52.i8, *(float32x2_t *)v52.i8))).f32[0]);
        }
        v54 = (float)((float)v47 * 2.3283e-10) * 0.1 + 0.9;
        v55 = v54 * 0.1;
        v63 = v55;
        srdnoise2();
        v56 = (char *)self->_allVertices + 80 * (int)v30 + 80 * self->_vertexBufferCount;
        v57 = *((_OWORD *)v56 + 3);
        *((float32x2_t *)&v57 + 1) = vmla_n_f32(vmul_f32(v53, v60), 0, v63);
        *((_OWORD *)v56 + 3) = v57;
        *((float *)self->_allVertices + 20 * (int)v30 + 20 * self->_vertexBufferCount + 12) = currentTimeClock
                                                                                            + (float)(v38 * 0.016667);
        *(float *)&v57 = self->_currentTimeIndex + 0.016667;
        LODWORD(self->_currentTimeIndex) = v57;
        *((_DWORD *)self->_allVertices + 20 * (int)v30 + 20 * self->_vertexBufferCount + 13) = v57;
        *(float *)&v57 = self->_lineWidthScaleFactor * 5.0;
        *((_DWORD *)self->_allVertices + 20 * (int)v30 + 20 * self->_vertexBufferCount + 16) = v57;
        *(float *)&v57 = self->_cometScaleFactor;
        *((_DWORD *)self->_allVertices + 20 * (int)v30 + 20 * self->_vertexBufferCount + 17) = v57;
        v58 = 3.0;
        if (!self->_useFastVerticalWisp)
          v58 = 0.0;
        *((float *)self->_allVertices + 20 * (int)v30 + 20 * self->_vertexBufferCount + 18) = v58;
        *((_OWORD *)self->_allVertices + 5 * (int)v30 + 5 * self->_vertexBufferCount + 1) = *(_OWORD *)self->_brushColorForInitialColor;
        *((_OWORD *)self->_allVertices + 5 * (int)v30++ + 5 * self->_vertexBufferCount + 2) = *(_OWORD *)self->_brushColorForFinalColor;
        if (v29 == v30)
        {
          v30 = v29;
          goto LABEL_20;
        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "sketchRendererDidReachVertexLimit:", self);

    }
LABEL_20:
    self->_lastBirth = self->_currentTimeIndex;
    -[ETGLSketchRenderer updateVertexBufferWithVertexCount:](self, "updateVertexBufferWithVertexCount:", v30, *(_QWORD *)&v60, v61);
  }
}

- (void)updateVertexBufferWithVertexCount:(unint64_t)a3
{
  int v3;
  GLenum Error;
  GLenum v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  GLenum v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  glBufferSubData(0x8892u, 80 * self->_vertexBufferCount, 80 * a3, (char *)self->_allVertices + 80 * self->_vertexBufferCount);
  Error = glGetError();
  if (Error)
  {
    v6 = Error;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 136315394;
        v9 = "-[ETGLSketchRenderer updateVertexBufferWithVertexCount:]";
        v10 = 1024;
        v11 = v6;
        _os_log_impl(&dword_22C68B000, v7, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v8, 0x12u);
      }

    }
  }
  self->_vertexBufferCount += v3;
}

- (void)_warmupShaders
{
  GLenum Error;
  NSObject *v4;
  GLenum v5;
  NSObject *v6;
  NSObject *v7;
  GLenum v8;
  GLenum v9;
  NSObject *v10;
  GLenum v11;
  NSObject *v12;
  GLuint renderbuffers;
  GLuint framebuffers;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  GLenum v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  framebuffers = 0;
  glGenFramebuffers(1, &framebuffers);
  glBindFramebuffer(0x8D40u, framebuffers);
  renderbuffers = 0;
  glGenRenderbuffers(1, &renderbuffers);
  glBindRenderbuffer(0x8D41u, renderbuffers);
  Error = glGetError();
  if (Error && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[ETGLSketchRenderer _warmupShaders]";
      v17 = 1024;
      v18 = Error;
      _os_log_impl(&dword_22C68B000, v4, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
    }

  }
  glRenderbufferStorage(0x8D41u, 0x8058u, 32, 32);
  v5 = glGetError();
  if (v5 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[ETGLSketchRenderer _warmupShaders]";
      v17 = 1024;
      v18 = v5;
      _os_log_impl(&dword_22C68B000, v6, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
    }

  }
  glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, renderbuffers);
  glViewport(0, 0, 32, 32);
  if (glCheckFramebufferStatus(0x8D40u) != 36053 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = glCheckFramebufferStatus(0x8D40u);
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v8;
      _os_log_impl(&dword_22C68B000, v7, OS_LOG_TYPE_INFO, "Unexpected failure to make complete framebuffer object during warmup (0x%04x)", buf, 8u);
    }

  }
  glClear(0x4000u);
  glBindVertexArrayOES();
  glUseProgram(self->_shaderProgram);
  v9 = glGetError();
  if (v9 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[ETGLSketchRenderer _warmupShaders]";
      v17 = 1024;
      v18 = v9;
      _os_log_impl(&dword_22C68B000, v10, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
    }

  }
  glDrawArrays(0, 0, 1);
  v11 = glGetError();
  if (v11 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[ETGLSketchRenderer _warmupShaders]";
      v17 = 1024;
      v18 = v11;
      _os_log_impl(&dword_22C68B000, v12, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", buf, 0x12u);
    }

  }
  glDiscardFramebufferEXT();
}

+ (void)warmupShaders
{
  void *v2;
  ETGLSketchRenderer *v3;
  NSObject *v4;
  uint8_t v5[16];

  if ((warmupShaders_alreadyWarmedUp & 1) == 0)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE2818]), "initWithAPI:", 2);
    if (v2 && (objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v2) & 1) != 0)
    {
      v3 = -[ETGLSketchRenderer initWithContext:andDrawable:]([ETGLSketchRenderer alloc], "initWithContext:andDrawable:", v2, 0);
      v3->_useThisRendererOnlyForWarmup = 1;
      -[ETGLSketchRenderer _warmupShaders](v3, "_warmupShaders");
      warmupShaders_alreadyWarmedUp = 1;
      objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", 0);

      v2 = 0;
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_22C68B000, v4, OS_LOG_TYPE_INFO, "Unexpected failure to create context during shader warmup", v5, 2u);
      }

    }
  }
}

- (CGImage)createRenderedFrameImageUsingAlpha:(BOOL)a3
{
  _BOOL4 v3;
  signed int v5;
  size_t v6;
  char *v7;
  char *v8;
  unsigned int backingHeight;
  unsigned int v10;
  int v11;
  char *v12;
  CGDataProvider *v13;
  CGColorSpace *DeviceRGB;
  CGBitmapInfo v15;
  CGImage *v16;

  v3 = a3;
  v5 = 4 * self->_backingWidth;
  v6 = self->_backingHeight * v5;
  v7 = (char *)malloc_type_malloc(v6, 0xF8CC8E7uLL);
  v8 = (char *)malloc_type_malloc(v6, 0x3B7ADF49uLL);
  glReadPixels(0, 0, self->_backingWidth, self->_backingHeight, 0x1908u, 0x1401u, v7);
  backingHeight = self->_backingHeight;
  if (backingHeight)
  {
    v10 = 0;
    v11 = -1;
    v12 = v8;
    do
    {
      memcpy(v12, &v7[(backingHeight + v11) * v5], v5);
      backingHeight = self->_backingHeight;
      --v11;
      v12 += v5;
      ++v10;
    }
    while (backingHeight > v10);
  }
  free(v7);
  v13 = CGDataProviderCreateWithData(0, v8, v6, (CGDataProviderReleaseDataCallback)releasePixels);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (v3)
    v15 = 1;
  else
    v15 = 5;
  v16 = CGImageCreate(self->_backingWidth, self->_backingHeight, 8uLL, 0x20uLL, v5, DeviceRGB, v15, v13, 0, 0, kCGRenderingIntentDefault);
  if (v13)
    CFRelease(v13);
  CGColorSpaceRelease(DeviceRGB);
  return v16;
}

- (void)render
{
  NSObject *v3;
  GLenum Error;
  NSObject *v5;
  GLenum v6;
  NSObject *v7;
  GLenum v8;
  NSObject *v9;
  GLenum v10;
  NSObject *v11;
  float lastBirth;
  double v13;
  int vertexBufferBegin;
  float *v15;
  int v16;
  void (**completionBlock)(void);
  id v18;
  GLenum v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  GLenum v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (self->_backingWidth && self->_backingHeight)
    goto LABEL_45;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_22C68B000, v3, OS_LOG_TYPE_INFO, "Error: GLSketch being asked to -render into a 0x0 viewport!", (uint8_t *)&v21, 2u);
    }

  }
  -[ETGLSketchRenderer resizeFromCachedLayer](self, "resizeFromCachedLayer");
  if (self->_backingWidth)
  {
    if (self->_backingHeight)
    {
LABEL_45:
      glClear(0x4000u);
      if (self->_vertexBufferBegin < self->_vertexBufferCount - 1)
      {
        -[ETGLSketchRenderer updateGLWithCurrentTime](self, "updateGLWithCurrentTime");
        Error = glGetError();
        if (Error && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            v21 = 136315394;
            v22 = "-[ETGLSketchRenderer render]";
            v23 = 1024;
            v24 = Error;
            _os_log_impl(&dword_22C68B000, v5, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v21, 0x12u);
          }

        }
        glUseProgram(self->_shaderProgram);
        v6 = glGetError();
        if (v6 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v21 = 136315394;
            v22 = "-[ETGLSketchRenderer render]";
            v23 = 1024;
            v24 = v6;
            _os_log_impl(&dword_22C68B000, v7, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v21, 0x12u);
          }

        }
        glVertexAttrib1f(5u, self->_currentTimeClock);
        glVertexAttrib1f(6u, self->_deathTime);
        glVertexAttrib1f(7u, self->_lastBirth);
        glVertexAttrib1f(8u, 1.75);
        glVertexAttrib1f(9u, 3.0);
        v8 = glGetError();
        if (v8 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            v21 = 136315394;
            v22 = "-[ETGLSketchRenderer render]";
            v23 = 1024;
            v24 = v8;
            _os_log_impl(&dword_22C68B000, v9, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v21, 0x12u);
          }

        }
        glDrawArrays(0, self->_vertexBufferBegin, self->_vertexBufferCount - self->_vertexBufferBegin);
        v10 = glGetError();
        if (v10 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v21 = 136315394;
            v22 = "-[ETGLSketchRenderer render]";
            v23 = 1024;
            v24 = v10;
            _os_log_impl(&dword_22C68B000, v11, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v21, 0x12u);
          }

        }
        if (!self->_renderingOffscreen)
          -[EAGLContext presentRenderbuffer:](self->_context, "presentRenderbuffer:", 36161);
        if (-[ETGLSketchRenderer isDying](self, "isDying"))
        {
          lastBirth = self->_lastBirth;
          v13 = (float)(self->_currentTimeClock - self->_deathTime);
          vertexBufferBegin = self->_vertexBufferBegin;
          v15 = (float *)((char *)self->_allVertices + 80 * vertexBufferBegin + 52);
          v16 = vertexBufferBegin - 1;
          while ((v13 + (float)(*v15 / lastBirth) * -1.25) / 1.75 > 1.0)
          {
            self->_vertexBufferBegin = v16 + 2;
            v15 += 20;
            if (++v16 == self->_vertexBufferCount - 2)
            {
              completionBlock = (void (**)(void))self->_completionBlock;
              if (completionBlock)
              {
                completionBlock[2]();
                v18 = self->_completionBlock;
                self->_completionBlock = 0;

              }
              break;
            }
          }
        }
        v19 = glGetError();
        if (v19 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = 136315394;
            v22 = "-[ETGLSketchRenderer render]";
            v23 = 1024;
            v24 = v19;
            _os_log_impl(&dword_22C68B000, v20, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v21, 0x12u);
          }

        }
      }
    }
  }
}

- (void)setLineWidthScaleFactor:(double)a3
{
  double lineWidthScaleFactor;
  uint64_t v4;
  uint64_t v5;
  double v6;
  float *v7;
  float v8;
  float cometScaleFactor;
  float v10;
  uint64_t vertexBufferCount;
  GLenum Error;
  GLenum v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  GLenum v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  lineWidthScaleFactor = self->_lineWidthScaleFactor;
  self->_lineWidthScaleFactor = a3;
  self->_cometScaleFactor = 1.0 / a3;
  if (self->_vertexBufferCount >= 1)
  {
    v4 = 0;
    v5 = 0;
    v6 = a3 / lineWidthScaleFactor;
    do
    {
      v7 = (float *)((char *)self->_allVertices + v4);
      v8 = v6 * v7[16];
      v7[16] = v8;
      cometScaleFactor = self->_cometScaleFactor;
      *(float *)((char *)self->_allVertices + v4 + 68) = cometScaleFactor;
      if (self->_useFastVerticalWisp)
        v10 = 3.0;
      else
        v10 = 0.0;
      *(float *)((char *)self->_allVertices + v4 + 72) = v10;
      ++v5;
      vertexBufferCount = self->_vertexBufferCount;
      v4 += 80;
    }
    while (v5 < vertexBufferCount);
    glBufferSubData(0x8892u, 0, 80 * vertexBufferCount, self->_allVertices);
    Error = glGetError();
    if (Error)
    {
      v13 = Error;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = 136315394;
          v16 = "-[ETGLSketchRenderer setLineWidthScaleFactor:]";
          v17 = 1024;
          v18 = v13;
          _os_log_impl(&dword_22C68B000, v14, OS_LOG_TYPE_INFO, "%s: glGetError(0x%x)", (uint8_t *)&v15, 0x12u);
        }

      }
    }
  }
}

- (float)currentTimeClock
{
  return self->_currentTimeClock;
}

- (float)currentTimeIndex
{
  return self->_currentTimeIndex;
}

- (BOOL)isDying
{
  return self->_isDying;
}

- (void)setIsDying:(BOOL)a3
{
  self->_isDying = a3;
}

- (double)wispDelay
{
  return self->_wispDelay;
}

- (void)setWispDelay:(double)a3
{
  self->_wispDelay = a3;
}

- (ETGLSketchRendererDelegate)delegate
{
  return (ETGLSketchRendererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)renderingOffscreen
{
  return self->_renderingOffscreen;
}

- (void)setRenderingOffscreen:(BOOL)a3
{
  self->_renderingOffscreen = a3;
}

- (double)lineWidthScaleFactor
{
  return self->_lineWidthScaleFactor;
}

- (BOOL)useFastVerticalWisp
{
  return self->_useFastVerticalWisp;
}

- (void)setUseFastVerticalWisp:(BOOL)a3
{
  self->_useFastVerticalWisp = a3;
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)allVertices
{
  return self->_allVertices;
}

- (void)setAllVertices:(id *)a3
{
  self->_allVertices = a3;
}

- (int)vertexBufferCount
{
  return self->_vertexBufferCount;
}

- (void)setVertexBufferCount:(int)a3
{
  self->_vertexBufferCount = a3;
}

- (int)vertexBufferBegin
{
  return self->_vertexBufferBegin;
}

- (void)setVertexBufferBegin:(int)a3
{
  self->_vertexBufferBegin = a3;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (void)setVertexCount:(unint64_t)a3
{
  self->_vertexCount = a3;
}

- (float)deathTime
{
  return self->_deathTime;
}

- (void)setDeathTime:(float)a3
{
  self->_deathTime = a3;
}

- (float)lastBirth
{
  return self->_lastBirth;
}

- (void)setLastBirth:(float)a3
{
  self->_lastBirth = a3;
}

- (__n128)brushColorForInitialColor
{
  return a1[9];
}

- (void)setBrushColorForInitialColor:(ETGLSketchRenderer *)self
{
  __int128 v2;

  *(_OWORD *)self->_brushColorForInitialColor = v2;
}

- (__n128)brushColorForFinalColor
{
  return a1[10];
}

- (void)setBrushColorForFinalColor:(ETGLSketchRenderer *)self
{
  __int128 v2;

  *(_OWORD *)self->_brushColorForFinalColor = v2;
}

- (unsigned)shaderProgram
{
  return self->_shaderProgram;
}

- (void)setShaderProgram:(unsigned int)a3
{
  self->_shaderProgram = a3;
}

- (unsigned)vboVertLineId
{
  return self->_vboVertLineId;
}

- (void)setVboVertLineId:(unsigned int)a3
{
  self->_vboVertLineId = a3;
}

- (unsigned)vaoLineID
{
  return self->_vaoLineID;
}

- (void)setVaoLineID:(unsigned int)a3
{
  self->_vaoLineID = a3;
}

- (unsigned)viewRenderbuffer
{
  return self->_viewRenderbuffer;
}

- (void)setViewRenderbuffer:(unsigned int)a3
{
  self->_viewRenderbuffer = a3;
}

- (unsigned)viewFramebuffer
{
  return self->_viewFramebuffer;
}

- (void)setViewFramebuffer:(unsigned int)a3
{
  self->_viewFramebuffer = a3;
}

- (unsigned)backingWidth
{
  return self->_backingWidth;
}

- (void)setBackingWidth:(unsigned int)a3
{
  self->_backingWidth = a3;
}

- (unsigned)backingHeight
{
  return self->_backingHeight;
}

- (void)setBackingHeight:(unsigned int)a3
{
  self->_backingHeight = a3;
}

- (double)cometScaleFactor
{
  return self->_cometScaleFactor;
}

- (void)setCometScaleFactor:(double)a3
{
  self->_cometScaleFactor = a3;
}

- (unsigned)allocatedWidth
{
  return self->_allocatedWidth;
}

- (void)setAllocatedWidth:(unsigned int)a3
{
  self->_allocatedWidth = a3;
}

- (unsigned)allocatedHeight
{
  return self->_allocatedHeight;
}

- (void)setAllocatedHeight:(unsigned int)a3
{
  self->_allocatedHeight = a3;
}

- (EAGLContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  self->_context = (EAGLContext *)a3;
}

- (CAEAGLLayer)cachedLayer
{
  return self->_cachedLayer;
}

- (void)setCachedLayer:(id)a3
{
  self->_cachedLayer = (CAEAGLLayer *)a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
