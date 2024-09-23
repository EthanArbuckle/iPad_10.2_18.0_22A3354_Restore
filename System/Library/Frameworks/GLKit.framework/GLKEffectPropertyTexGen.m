@implementation GLKEffectPropertyTexGen

- (GLKEffectPropertyTexGen)init
{
  -[GLKEffectPropertyTexGen doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (GLKEffectPropertyTexGen)initWithMode:(int)a3 coord:(int)a4
{
  uint64_t v5;
  GLKEffectPropertyTexGen *v6;
  GLKEffectPropertyTexGen *v7;
  float *v8;
  float *plane;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)GLKEffectPropertyTexGen;
  v6 = -[GLKEffectProperty init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_planeLoc = -1;
    v6->_modeLoc = -1;
    v6->_plane = (float *)malloc_type_malloc(0x10uLL, 0x100004052888210uLL);
    -[GLKEffectPropertyTexGen setMode:](v7, "setMode:", v5);
    v7->_coord = a4;
    v7->_planeNameString = 0;
    v7->_modeNameString = 0;
    v7->_textureIndex = 0;
    if (a4 == 1)
    {
      plane = v7->_plane;
      plane[3] = 0.0;
      *(_QWORD *)(plane + 1) = 1065353216;
      goto LABEL_6;
    }
    if (!a4)
    {
      v8 = v7->_plane;
      *v8 = 1.0;
      *((_QWORD *)v8 + 1) = 0;
      plane = v8 + 1;
LABEL_6:
      *plane = 0.0;
    }
  }
  return v7;
}

- (void)dirtyAllUniforms
{
  -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 12582912);
}

- (void)setMode:(int)a3
{
  if (self->_mode != a3 || !-[GLKEffectProperty masksInitialized](self, "masksInitialized"))
  {
    self->_mode = a3;
    _normalizedNormalsMask(*((_QWORD *)self->super._prv + 4));
    _vNormalEyeMask(*((_QWORD *)self->super._prv + 4));
    _vPositionEyeMask(*((_QWORD *)self->super._prv + 4));
    _useTexCoordAttribMask(*((_QWORD *)self->super._prv + 4));
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x400000);
  }
}

- (void)setPlane:(float *)a3
{
  float *plane;

  plane = self->_plane;
  if (*a3 != *plane || a3[1] != plane[1] || a3[2] != plane[2] || a3[3] != plane[3])
  {
    *(_OWORD *)plane = *(_OWORD *)a3;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x800000);
  }
}

- (void)setModeNameString:(char *)a3
{
  char *modeNameString;

  modeNameString = self->_modeNameString;
  if (modeNameString)
    free(modeNameString);
  self->_modeNameString = strdup(a3);
}

- (void)setPlaneNameString:(char *)a3
{
  char *planeNameString;

  planeNameString = self->_planeNameString;
  if (planeNameString)
    free(planeNameString);
  self->_planeNameString = strdup(a3);
}

- (void)setTextureIndex:(unsigned int)a3
{
  self->_textureIndex = a3;
}

- (void)setShaderBindings
{
  GLint params;
  char __str[64];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  params = 0;
  glGetIntegerv(0x8B8Du, &params);
  snprintf(__str, 0x3FuLL, "textures[%d].texGen[%d].mode", self->_textureIndex, self->_coord);
  -[GLKEffectPropertyTexGen setModeNameString:](self, "setModeNameString:", __str);
  snprintf(__str, 0x3FuLL, "textures[%d].texGen[%d].plane", self->_textureIndex, self->_coord);
  -[GLKEffectPropertyTexGen setPlaneNameString:](self, "setPlaneNameString:", __str);
  self->_modeLoc = glGetUniformLocation(params, -[GLKEffectPropertyTexGen modeNameString](self, "modeNameString"));
  self->_planeLoc = glGetUniformLocation(params, -[GLKEffectPropertyTexGen planeNameString](self, "planeNameString"));
  -[GLKEffectPropertyTexGen dirtyAllUniforms](self, "dirtyAllUniforms");
}

- (void)initializeMasks
{
  _normalizedNormalsMask(*((_QWORD *)self->super._prv + 4));
  _vNormalEyeMask(*((_QWORD *)self->super._prv + 4));
  _vPositionEyeMask(*((_QWORD *)self->super._prv + 4));
  _useTexCoordAttribMask(*((_QWORD *)self->super._prv + 4));
  -[GLKEffectProperty setMasksInitialized:](self, "setMasksInitialized:", 1);
}

- (void)bind
{
  if (-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms"))
  {
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x400000) != 0)
      glUniform1i(self->_modeLoc, self->_mode);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x800000) != 0)
      glUniform4fv(self->_planeLoc, 1, self->_plane);
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 0);
  }
}

- (void)dealloc
{
  char *modeNameString;
  char *planeNameString;
  objc_super v5;

  free(self->_plane);
  modeNameString = self->_modeNameString;
  if (modeNameString)
    free(modeNameString);
  planeNameString = self->_planeNameString;
  if (planeNameString)
    free(planeNameString);
  v5.receiver = self;
  v5.super_class = (Class)GLKEffectPropertyTexGen;
  -[GLKEffectProperty dealloc](&v5, sel_dealloc);
}

- (int)mode
{
  return self->_mode;
}

- (float)plane
{
  return self->_plane;
}

- (int)coord
{
  return self->_coord;
}

- (float)eyePlaneByInvModelview
{
  return self->_eyePlaneByInvModelview;
}

- (void)setEyePlaneByInvModelview:(float *)a3
{
  self->_eyePlaneByInvModelview = a3;
}

- (int)modeLoc
{
  return self->_modeLoc;
}

- (void)setModeLoc:(int)a3
{
  self->_modeLoc = a3;
}

- (int)planeLoc
{
  return self->_planeLoc;
}

- (void)setPlaneLoc:(int)a3
{
  self->_planeLoc = a3;
}

- (int)eyePlaneByInvModelviewLoc
{
  return self->_eyePlaneByInvModelviewLoc;
}

- (void)setEyePlaneByInvModelviewLoc:(int)a3
{
  self->_eyePlaneByInvModelviewLoc = a3;
}

- (char)modeNameString
{
  return self->_modeNameString;
}

- (char)planeNameString
{
  return self->_planeNameString;
}

- (unsigned)textureIndex
{
  return self->_textureIndex;
}

@end
