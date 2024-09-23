@implementation GLKReflectionMapEffect

- (GLKReflectionMapEffect)init
{
  char *v2;
  GLKReflectionMapEffect *v3;
  __int128 v4;
  GLKEffectPropertyTexture *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GLKReflectionMapEffect;
  v2 = -[GLKBaseEffect init](&v7, sel_init);
  v3 = (GLKReflectionMapEffect *)v2;
  if (v2)
  {
    *((_DWORD *)v2 + 56) = -1;
    *((_DWORD *)v2 + 46) = 1065353216;
    *(_QWORD *)&v4 = 0;
    *((_QWORD *)&v4 + 1) = 0x3F80000000000000;
    *(_OWORD *)(v2 + 188) = v4;
    *((_DWORD *)v2 + 51) = 0;
    *((_QWORD *)v2 + 26) = 0;
    *((_DWORD *)v2 + 54) = 1065353216;
    v5 = objc_alloc_init(GLKEffectPropertyTexture);
    v3->_textureCubeMap = v5;
    -[GLKEffectPropertyTexture setTarget:](v5, "setTarget:", 34067);
    -[GLKEffectPropertyTexGen setMode:](-[GLKEffectPropertyTexture texGenS](v3->_textureCubeMap, "texGenS"), "setMode:", 3);
    -[GLKEffectPropertyTexGen setMode:](-[GLKEffectPropertyTexture texGenT](v3->_textureCubeMap, "texGenT"), "setMode:", 3);
    -[GLKEffectPropertyTexGen setMode:](-[GLKEffectPropertyTexture texGenR](v3->_textureCubeMap, "texGenR"), "setMode:", 3);
    -[NSMutableArray addObject:](-[GLKBaseEffect propertyArray](v3, "propertyArray"), "addObject:", v3->_textureCubeMap);
    v3->_dirtyUniforms = 1;
  }
  return v3;
}

- (void)setMatrix:(GLKMatrix3 *)matrix
{
  float m22;
  __int128 v4;

  m22 = matrix->m22;
  v4 = *(_OWORD *)&matrix->m[4];
  *(_OWORD *)&self->_matrix.m00 = *(_OWORD *)&matrix->m00;
  *(_OWORD *)&self->_matrix.m[4] = v4;
  self->_matrix.m22 = m22;
  self->_dirtyUniforms = 1;
}

- (void)prepareToDraw
{
  int UniformLocation;
  GLint params;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GLKReflectionMapEffect;
  -[GLKBaseEffect prepareToDraw](&v5, sel_prepareToDraw);
  if (self->_dirtyUniforms)
  {
    if (-[GLKEffectPropertyTexture enabled](self->_textureCubeMap, "enabled"))
    {
      params = 0;
      glGetIntegerv(0x8B8Du, &params);
      UniformLocation = glGetUniformLocation(params, "reflectionMapMatrix");
      self->_matrixLoc = UniformLocation;
      glUniformMatrix3fv(UniformLocation, 1, 0, &self->_matrix.m00);
      self->_dirtyUniforms = 0;
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GLKReflectionMapEffect;
  -[GLKBaseEffect dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  __int128 v4;
  objc_super v6;
  GLKMatrix3 matrix;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("self = %p\n{\n"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("textureCubeMap = %p\n"), -[GLKReflectionMapEffect textureCubeMap](self, "textureCubeMap"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[GLKEffectPropertyTexture description](-[GLKReflectionMapEffect textureCubeMap](self, "textureCubeMap"), "description"));
  objc_msgSend(v3, "appendString:", CFSTR("matrix\n{\n"));
  v4 = *(_OWORD *)&self->_matrix.m[4];
  *(_OWORD *)&matrix.m00 = *(_OWORD *)&self->_matrix.m00;
  *(_OWORD *)&matrix.m[4] = v4;
  matrix.m22 = self->_matrix.m22;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), NSStringFromGLKMatrix3(&matrix));
  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  v6.receiver = self;
  v6.super_class = (Class)GLKReflectionMapEffect;
  objc_msgSend(v3, "appendString:", -[GLKBaseEffect description](&v6, sel_description));
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (GLKEffectPropertyTexture)textureCubeMap
{
  return self->_textureCubeMap;
}

- (BOOL)dirtyUniforms
{
  return self->_dirtyUniforms;
}

- (void)setDirtyUniforms:(BOOL)a3
{
  self->_dirtyUniforms = a3;
}

- (GLKMatrix3)matrix
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].m[5];
  *(_OWORD *)&retstr->m00 = *(_OWORD *)&self[5].m[1];
  *(_OWORD *)&retstr->m[4] = v3;
  retstr->m22 = self[6].m00;
  return self;
}

- (int)matrixLoc
{
  return self->_matrixLoc;
}

- (void)setMatrixLoc:(int)a3
{
  self->_matrixLoc = a3;
}

@end
