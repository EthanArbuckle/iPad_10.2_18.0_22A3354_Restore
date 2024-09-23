@implementation GLKEffectPropertyTexture

- (GLKEffectPropertyTexture)init
{
  GLKEffectPropertyTexture *v2;
  GLKEffectPropertyTexture *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GLKEffectPropertyTexture;
  v2 = -[GLKEffectProperty init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_target = 3553;
    v2->_texGenR = 0;
    v2->_texGenT = 0;
    v2->_texGenS = 0;
    v2->_texGenArray = 0;
    -[GLKEffectPropertyTexture setUnit2dNameString:](v2, "setUnit2dNameString:", 0);
    -[GLKEffectPropertyTexture setUnitCubeNameString:](v3, "setUnitCubeNameString:", 0);
    v3->_enabled = 1;
    v3->_matrixEnabled = 0;
    v3->_envMode = 1;
    v3->_textureIndex = -1;
    v3->_name = 0;
  }
  return v3;
}

- (void)dirtyAllUniforms
{
  -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 0x200000);
}

- (GLKEffectPropertyTexGen)texGenS
{
  GLKEffectPropertyTexGen *result;
  GLKEffectPropertyTexGen *v4;

  result = self->_texGenS;
  if (!result)
  {
    if (!self->_texGenArray)
      self->_texGenArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = -[GLKEffectPropertyTexGen initWithMode:coord:]([GLKEffectPropertyTexGen alloc], "initWithMode:coord:", 0, 0);
    self->_texGenS = v4;
    -[GLKEffectPropertyTexGen setTextureIndex:](v4, "setTextureIndex:", self->_textureIndex);
    -[GLKEffectProperty setEffect:](self->_texGenS, "setEffect:", *((_QWORD *)self->super._prv + 4));
    _texGenSMask((uint64_t)self);
    _reflectionMapMask((uint64_t)self);
    -[NSMutableArray addObject:](self->_texGenArray, "addObject:", self->_texGenS);
    return self->_texGenS;
  }
  return result;
}

- (GLKEffectPropertyTexGen)texGenT
{
  GLKEffectPropertyTexGen *result;
  GLKEffectPropertyTexGen *v4;

  result = self->_texGenT;
  if (!result)
  {
    if (!self->_texGenArray)
      self->_texGenArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = -[GLKEffectPropertyTexGen initWithMode:coord:]([GLKEffectPropertyTexGen alloc], "initWithMode:coord:", 0, 1);
    self->_texGenT = v4;
    -[GLKEffectPropertyTexGen setTextureIndex:](v4, "setTextureIndex:", self->_textureIndex);
    -[GLKEffectProperty setEffect:](self->_texGenT, "setEffect:", *((_QWORD *)self->super._prv + 4));
    _texGenTMask((uint64_t)self);
    _reflectionMapMask((uint64_t)self);
    -[NSMutableArray addObject:](self->_texGenArray, "addObject:", self->_texGenT);
    return self->_texGenT;
  }
  return result;
}

- (GLKEffectPropertyTexGen)texGenR
{
  GLKEffectPropertyTexGen *result;
  GLKEffectPropertyTexGen *v4;

  result = self->_texGenR;
  if (!result)
  {
    if (!self->_texGenArray)
      self->_texGenArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = -[GLKEffectPropertyTexGen initWithMode:coord:]([GLKEffectPropertyTexGen alloc], "initWithMode:coord:", 0, 2);
    self->_texGenR = v4;
    -[GLKEffectPropertyTexGen setTextureIndex:](v4, "setTextureIndex:", self->_textureIndex);
    -[GLKEffectProperty setEffect:](self->_texGenR, "setEffect:", *((_QWORD *)self->super._prv + 4));
    _texGenRMask((uint64_t)self);
    _reflectionMapMask((uint64_t)self);
    -[NSMutableArray addObject:](self->_texGenArray, "addObject:", self->_texGenR);
    return self->_texGenR;
  }
  return result;
}

- (void)setTextureIndex:(int)a3
{
  uint64_t v3;
  NSMutableArray *texGenArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t textureIndex;
  GLKBigInt_s v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19[128];
  char __str[64];
  uint64_t v21;

  v3 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x24BDAC8D0];
  self->_textureIndex = a3;
  snprintf(__str, 0x3FuLL, "unit2d[%d]", a3);
  -[GLKEffectPropertyTexture setUnit2dNameString:](self, "setUnit2dNameString:", __str);
  snprintf(__str, 0x3FuLL, "unitCube[%d]", self->_textureIndex);
  -[GLKEffectPropertyTexture setUnitCubeNameString:](self, "setUnitCubeNameString:", __str);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  texGenArray = self->_texGenArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](texGenArray, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(texGenArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setTextureIndex:", v3);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](texGenArray, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  _setMasks_0((uint64_t)self);
  _normalizedNormalsMask(*((_QWORD *)self->super._prv + 4));
  _vNormalEyeMask(*((_QWORD *)self->super._prv + 4));
  _texturingEnabledMask(*((_QWORD *)self->super._prv + 4));
  _vPositionEyeMask(*((_QWORD *)self->super._prv + 4));
  _useTexCoordAttribMask(*((_QWORD *)self->super._prv + 4));
  v10 = 0;
  self->_allFshMasks.n0 = 0;
  self->_allFshMasks.n1 = 0;
  v11 = _staticFshVPositionMask_0;
  self->_allFshMasks.n0 = _staticFshVPositionMask_0;
  v12 = _staticFshVPositionMask_1;
  self->_allFshMasks.n1 = _staticFshVPositionMask_1;
  textureIndex = self->_textureIndex;
  v14.n0 = v11;
  v14.n1 = v12;
  do
  {
    v14 = (GLKBigInt_s)vorrq_s8((int8x16_t)v14, *(int8x16_t *)&_staticFshMasks_1[2 * textureIndex + v10]);
    self->_allFshMasks = v14;
    v10 += 6;
  }
  while (v10 != 144);
  -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 0x200000);
}

- (void)setShaderBindings
{
  NSMutableArray *texGenArray;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  GLint params;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  params = 0;
  glGetIntegerv(0x8B8Du, &params);
  self->_unit2dLoc = glGetUniformLocation(params, self->_unit2dNameString);
  self->_unitCubeLoc = glGetUniformLocation(params, self->_unitCubeNameString);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  texGenArray = self->_texGenArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](texGenArray, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(texGenArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "setShaderBindings");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](texGenArray, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }
  -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 0x200000);
}

+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  __CFString *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = 0;
  v7 = &unk_2549DE9E8;
  do
  {
    *(v7 - 1) = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("texturing%d"), v6), a4, v6);
    *v7 = v8;
    ++v6;
    v7 += 2;
  }
  while (v6 != 3);
  v9 = &unk_2549DEA18;
  for (i = 1; i != 24; ++i)
  {
    v11 = 0;
    v12 = _fshMaskStr[i];
    v13 = v9;
    do
    {
      *(v13 - 1) = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", v12, a4, v11);
      *v13 = v14;
      ++v11;
      v13 += 2;
    }
    while (v11 != 3);
    v9 += 6;
  }
  _staticFshVPositionMask_0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("v_position"), a4, 0);
  _staticFshVPositionMask_1 = v15;
  _staticVshVPositionMask_0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("v_position"), a3, 0);
  _staticVshVPositionMask_1 = v16;
}

+ (void)clearAllTexturingMasks:(GLKBigInt_s *)a3 fshMask:(GLKBigInt_s *)a4
{
  uint64_t v4;
  int8x16_t v5;
  GLKBigInt_s v6;
  uint64_t *v7;
  uint64_t i;

  v4 = 0;
  v5 = (int8x16_t)__PAIR128__(_staticFshVPositionMask_1, _staticFshVPositionMask_0);
  *(int8x16_t *)a3 = vbicq_s8(*(int8x16_t *)a3, (int8x16_t)__PAIR128__(_staticVshVPositionMask_1, _staticVshVPositionMask_0));
  v6 = (GLKBigInt_s)vbicq_s8(*(int8x16_t *)a4, v5);
  *a4 = v6;
  v7 = &_staticFshMasks_1;
  do
  {
    for (i = 0; i != 144; i += 6)
    {
      v6 = (GLKBigInt_s)vbicq_s8((int8x16_t)v6, *(int8x16_t *)&v7[i]);
      *a4 = v6;
    }
    ++v4;
    v7 += 2;
  }
  while (v4 != 3);
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  BOOL result;

  v3 = *((_QWORD *)a3 + 1);
  result = v3 != _staticVshVPositionMask_0
        || (v4 = *((_QWORD *)a3 + 2), v4 != _staticVshVPositionMask_1)
        || (v5 = *(_QWORD **)self->super._prv, (*v5 & v3) != 0)
        || (v4 & v5[1]) != 0;
  return result;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  _QWORD *v3;
  BOOL result;

  result = (*(_OWORD *)&self->_allFshMasks & *(_OWORD *)((_BYTE *)a3 + 8)) == 0
        || (v3 = (_QWORD *)*((_QWORD *)self->super._prv + 2), (*v3 & *((_QWORD *)a3 + 1)) != 0)
        || (*((_QWORD *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (void)setUnit2dNameString:(char *)a3
{
  char *unit2dNameString;

  unit2dNameString = self->_unit2dNameString;
  if (unit2dNameString)
  {
    free(unit2dNameString);
    self->_unit2dNameString = 0;
  }
  if (a3)
    self->_unit2dNameString = strdup(a3);
}

- (void)setUnitCubeNameString:(char *)a3
{
  char *unitCubeNameString;

  unitCubeNameString = self->_unitCubeNameString;
  if (unitCubeNameString)
  {
    free(unitCubeNameString);
    self->_unitCubeNameString = 0;
  }
  if (a3)
    self->_unitCubeNameString = strdup(a3);
}

- (void)setEnabled:(GLBOOLean)enabled
{
  int v3;
  uint64_t textureIndex;
  int8x16_t *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = enabled;
  if (self->_enabled != enabled || -[GLKEffectProperty masksInitialized](self, "masksInitialized"))
  {
    self->_enabled = v3;
    textureIndex = self->_textureIndex;
    v6 = (int8x16_t *)*((_QWORD *)self->super._prv + 2);
    v7 = _staticFshMasks_1[2 * textureIndex];
    if (v3)
    {
      v8 = v6->i64[1] | _staticFshMasks_1[2 * textureIndex + 1];
      v6->i64[0] |= v7;
      v6->i64[1] = v8;
    }
    else
    {
      *v6 = vbicq_s8(*v6, *(int8x16_t *)&_staticFshMasks_1[2 * textureIndex]);
    }
    _reflectionMapMask((uint64_t)self);
    _texGenSMask((uint64_t)self);
    _texGenTMask((uint64_t)self);
    _texGenRMask((uint64_t)self);
    _normalizedNormalsMask(*((_QWORD *)self->super._prv + 4));
    _vNormalEyeMask(*((_QWORD *)self->super._prv + 4));
    _texturingEnabledMask(*((_QWORD *)self->super._prv + 4));
    _vPositionEyeMask(*((_QWORD *)self->super._prv + 4));
    _useTexCoordAttribMask(*((_QWORD *)self->super._prv + 4));
  }
}

- (void)initializeMasks
{
  GLKEffectPropertyTexGen *texGenS;
  GLKEffectPropertyTexGen *texGenT;
  GLKEffectPropertyTexGen *texGenR;

  texGenS = self->_texGenS;
  if (texGenS)
  {
    -[GLKEffectProperty setEffect:](texGenS, "setEffect:", *((_QWORD *)self->super._prv + 4));
    -[GLKEffectPropertyTexGen initializeMasks](self->_texGenS, "initializeMasks");
  }
  texGenT = self->_texGenT;
  if (texGenT)
  {
    -[GLKEffectProperty setEffect:](texGenT, "setEffect:", *((_QWORD *)self->super._prv + 4));
    -[GLKEffectPropertyTexGen initializeMasks](self->_texGenT, "initializeMasks");
  }
  texGenR = self->_texGenR;
  if (texGenR)
  {
    -[GLKEffectProperty setEffect:](texGenR, "setEffect:", *((_QWORD *)self->super._prv + 4));
    -[GLKEffectPropertyTexGen initializeMasks](self->_texGenR, "initializeMasks");
  }
  *(_QWORD *)self->super._prv = objc_msgSend(*((id *)self->super._prv + 4), "vshMask");
  *((_QWORD *)self->super._prv + 2) = objc_msgSend(*((id *)self->super._prv + 4), "fshMask");
  _setMasks_0((uint64_t)self);
  _normalizedNormalsMask(*((_QWORD *)self->super._prv + 4));
  _vNormalEyeMask(*((_QWORD *)self->super._prv + 4));
  _texturingEnabledMask(*((_QWORD *)self->super._prv + 4));
  _vPositionEyeMask(*((_QWORD *)self->super._prv + 4));
  _useTexCoordAttribMask(*((_QWORD *)self->super._prv + 4));
  -[GLKEffectProperty setMasksInitialized:](self, "setMasksInitialized:", 1);
}

- (void)setEnvMode:(GLKTextureEnvMode)envMode
{
  if (self->_envMode != envMode)
  {
    self->_envMode = envMode;
    _envModeMask((uint64_t)self);
  }
}

- (void)setTarget:(GLKTextureTarget)target
{
  int8x16_t *v4;
  _QWORD *v5;
  uint64_t *v6;
  int8x16_t *v7;

  if (self->_target != target)
  {
    self->_target = target;
    if (target == GLKTextureTargetCubeMap)
    {
      v7 = (int8x16_t *)&_staticFshMasks_1[2 * self->_textureIndex];
      *(int8x16_t *)*((_QWORD *)self->super._prv + 2) = vorrq_s8(*(int8x16_t *)*((_QWORD *)self->super._prv + 2), v7[30]);
      v5 = (_QWORD *)*((_QWORD *)self->super._prv + 2);
      *v5 &= ~v7[27].i64[0];
      v6 = &v7[27].i64[1];
    }
    else
    {
      if (target != GLKTextureTarget2D)
      {
LABEL_7:
        _reflectionMapMask((uint64_t)self);
        -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x200000);
        return;
      }
      v4 = (int8x16_t *)&_staticFshMasks_1[2 * self->_textureIndex];
      *(int8x16_t *)*((_QWORD *)self->super._prv + 2) = vorrq_s8(*(int8x16_t *)*((_QWORD *)self->super._prv + 2), v4[27]);
      v5 = (_QWORD *)*((_QWORD *)self->super._prv + 2);
      *v5 &= ~v4[30].i64[0];
      v6 = &v4[30].i64[1];
    }
    v5[1] &= ~*v6;
    goto LABEL_7;
  }
}

- (void)setMatrixEnabled:(unsigned __int8)a3
{
  int8x16_t *v3;
  int8x16_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_matrixEnabled != a3)
  {
    self->_matrixEnabled = a3;
    v3 = (int8x16_t *)*((_QWORD *)self->super._prv + 2);
    v4 = (int8x16_t *)&_staticFshMasks_1[2 * self->_textureIndex];
    v5 = v4[42].i64[0];
    if (a3)
    {
      v6 = v3->i64[1] | v4[42].i64[1];
      v3->i64[0] |= v5;
      v3->i64[1] = v6;
    }
    else
    {
      *v3 = vbicq_s8(*v3, v4[42]);
    }
  }
}

- (unsigned)normalizedNormalsMask
{
  GLKEffectPropertyTexGen *texGenS;
  GLKEffectPropertyTexGen *texGenT;
  GLKEffectPropertyTexGen *texGenR;
  unsigned __int8 result;

  result = 0;
  if (self->_enabled)
  {
    texGenS = self->_texGenS;
    if (texGenS)
    {
      if (-[GLKEffectPropertyTexGen mode](texGenS, "mode") == 2
        || -[GLKEffectPropertyTexGen mode](self->_texGenS, "mode") == 3)
      {
        return 1;
      }
    }
    texGenT = self->_texGenT;
    if (texGenT)
    {
      if (-[GLKEffectPropertyTexGen mode](texGenT, "mode") == 2
        || -[GLKEffectPropertyTexGen mode](self->_texGenT, "mode") == 3)
      {
        return 1;
      }
    }
    texGenR = self->_texGenR;
    if (texGenR)
    {
      if (-[GLKEffectPropertyTexGen mode](texGenR, "mode") == 2
        || -[GLKEffectPropertyTexGen mode](self->_texGenR, "mode") == 3)
      {
        return 1;
      }
    }
  }
  return result;
}

- (unsigned)vPositionEyeMask
{
  GLKEffectPropertyTexGen *texGenS;
  int v4;
  GLKEffectPropertyTexGen *texGenT;
  GLKEffectPropertyTexGen *texGenR;

  if (!self->_enabled)
    goto LABEL_15;
  texGenS = self->_texGenS;
  if (!texGenS)
    goto LABEL_19;
  if (-[GLKEffectPropertyTexGen mode](texGenS, "mode") == 2
    || -[GLKEffectPropertyTexGen mode](self->_texGenS, "mode") == 3)
  {
    goto LABEL_13;
  }
  v4 = -[GLKEffectPropertyTexGen mode](self->_texGenS, "mode");
  if (v4 != 1)
  {
LABEL_19:
    texGenT = self->_texGenT;
    if (!texGenT)
      goto LABEL_10;
    if (-[GLKEffectPropertyTexGen mode](texGenT, "mode") == 2
      || -[GLKEffectPropertyTexGen mode](self->_texGenT, "mode") == 3)
    {
      goto LABEL_13;
    }
    v4 = -[GLKEffectPropertyTexGen mode](self->_texGenT, "mode");
    if (v4 != 1)
    {
LABEL_10:
      texGenR = self->_texGenR;
      if (texGenR)
      {
        if (-[GLKEffectPropertyTexGen mode](texGenR, "mode") == 2
          || -[GLKEffectPropertyTexGen mode](self->_texGenR, "mode") == 3)
        {
LABEL_13:
          LOBYTE(v4) = 1;
          return v4;
        }
        v4 = -[GLKEffectPropertyTexGen mode](self->_texGenR, "mode");
        if (v4 == 1)
          return v4;
      }
LABEL_15:
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (unsigned)vNormalEyeMask
{
  GLKEffectPropertyTexGen *texGenS;
  GLKEffectPropertyTexGen *texGenT;
  GLKEffectPropertyTexGen *texGenR;
  unsigned __int8 result;

  result = 0;
  if (self->_enabled)
  {
    texGenS = self->_texGenS;
    if (texGenS)
    {
      if (-[GLKEffectPropertyTexGen mode](texGenS, "mode") == 2
        || -[GLKEffectPropertyTexGen mode](self->_texGenS, "mode") == 3)
      {
        return 1;
      }
    }
    texGenT = self->_texGenT;
    if (texGenT)
    {
      if (-[GLKEffectPropertyTexGen mode](texGenT, "mode") == 2
        || -[GLKEffectPropertyTexGen mode](self->_texGenT, "mode") == 3)
      {
        return 1;
      }
    }
    texGenR = self->_texGenR;
    if (texGenR)
    {
      if (-[GLKEffectPropertyTexGen mode](texGenR, "mode") == 2
        || -[GLKEffectPropertyTexGen mode](self->_texGenR, "mode") == 3)
      {
        return 1;
      }
    }
  }
  return result;
}

- (unsigned)useTexCoordAttribMask
{
  GLKEffectPropertyTexGen *texGenS;
  GLKEffectPropertyTexGen *texGenT;
  GLKEffectPropertyTexGen *texGenR;
  unsigned __int8 result;

  result = 0;
  if (self->_enabled)
  {
    texGenS = self->_texGenS;
    if (!texGenS
      || -[GLKEffectPropertyTexGen mode](texGenS, "mode") != 2
      && -[GLKEffectPropertyTexGen mode](self->_texGenS, "mode") != 3)
    {
      return 1;
    }
    texGenT = self->_texGenT;
    if (!texGenT
      || -[GLKEffectPropertyTexGen mode](texGenT, "mode") != 2
      && -[GLKEffectPropertyTexGen mode](self->_texGenT, "mode") != 3)
    {
      return 1;
    }
    texGenR = self->_texGenR;
    if (!texGenR
      || -[GLKEffectPropertyTexGen mode](texGenR, "mode") != 2
      && -[GLKEffectPropertyTexGen mode](self->_texGenR, "mode") != 3)
    {
      return 1;
    }
  }
  return result;
}

- (id)description
{
  id v3;
  unsigned int target;
  const __CFString *v5;
  uint64_t envMode;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %p\n{\n"), objc_msgSend((id)objc_opt_class(), "description"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tenabled =\t\t%d\n"), self->_enabled);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tname =   \t\t%d\n"), self->_name);
  target = self->_target;
  if (target == 3553)
  {
    v5 = CFSTR("\ttarget = \t\tGLKTextureTarget2D\n");
  }
  else
  {
    if (target != 34067)
      goto LABEL_6;
    v5 = CFSTR("\ttarget = \t\tGLKTextureTargetCubeMap\n");
  }
  objc_msgSend(v3, "appendFormat:", v5);
LABEL_6:
  envMode = self->_envMode;
  if (envMode <= 2)
    objc_msgSend(v3, "appendFormat:", off_24C848308[envMode]);
  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

- (void)bind
{
  int *v3;
  NSMutableArray *texGenArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_enabled)
  {
    glActiveTexture(self->_textureIndex + 33984);
    glBindTexture(self->_target, self->_name);
    if (-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms"))
    {
      if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x200000) != 0)
      {
        if (self->_target == 3553)
          v3 = &OBJC_IVAR___GLKEffectPropertyTexture__unit2dLoc;
        else
          v3 = &OBJC_IVAR___GLKEffectPropertyTexture__unitCubeLoc;
        glUniform1i(*(_DWORD *)((char *)&self->super.super.isa + *v3), self->_textureIndex);
      }
      -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 0);
    }
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    texGenArray = self->_texGenArray;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](texGenArray, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(texGenArray);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "bind");
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](texGenArray, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
}

- (void)dealloc
{
  char *unitCubeNameString;
  char *unit2dNameString;
  objc_super v5;

  unitCubeNameString = self->_unitCubeNameString;
  if (unitCubeNameString)
    free(unitCubeNameString);
  unit2dNameString = self->_unit2dNameString;
  if (unit2dNameString)
    free(unit2dNameString);

  v5.receiver = self;
  v5.super_class = (Class)GLKEffectPropertyTexture;
  -[GLKEffectProperty dealloc](&v5, sel_dealloc);
}

- (GLKTextureTarget)target
{
  return self->_target;
}

- (GLBOOLean)enabled
{
  return self->_enabled;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (int)textureIndex
{
  return self->_textureIndex;
}

- (unsigned)matrixEnabled
{
  return self->_matrixEnabled;
}

- (GLKTextureEnvMode)envMode
{
  return self->_envMode;
}

- (char)unit2dNameString
{
  return self->_unit2dNameString;
}

- (char)unitCubeNameString
{
  return self->_unitCubeNameString;
}

- (GLuint)name
{
  return self->_name;
}

- (void)setName:(GLuint)name
{
  self->_name = name;
}

- (int)unit2dLoc
{
  return self->_unit2dLoc;
}

- (void)setUnit2dLoc:(int)a3
{
  self->_unit2dLoc = a3;
}

- (int)unitCubeLoc
{
  return self->_unitCubeLoc;
}

- (void)setUnitCubeLoc:(int)a3
{
  self->_unitCubeLoc = a3;
}

- (NSMutableArray)texGenArray
{
  return self->_texGenArray;
}

- (GLKBigInt_s)allFshMasks
{
  GLKBigInt_s *p_allFshMasks;
  unint64_t n0;
  unint64_t n1;
  GLKBigInt_s result;

  p_allFshMasks = &self->_allFshMasks;
  n0 = self->_allFshMasks.n0;
  n1 = p_allFshMasks->n1;
  result.n1 = n1;
  result.n0 = n0;
  return result;
}

@end
