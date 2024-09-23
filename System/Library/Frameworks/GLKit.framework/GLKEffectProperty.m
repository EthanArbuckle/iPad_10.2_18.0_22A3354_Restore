@implementation GLKEffectProperty

- (GLKEffectProperty)init
{
  GLKEffectProperty *v2;
  GLKEffectProperty *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  GLKEffectPropertyPrv *prv;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GLKEffectProperty;
  v2 = -[GLKEffectProperty init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_location = -1;
    v2->_nameString = 0;
    v2->_vshSource = 0;
    v2->_fshSource = 0;
    v2->_prv = (GLKEffectPropertyPrv *)malloc_type_malloc(0x28uLL, 0xA0040BD5F1188uLL);
    v4 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    *((_QWORD *)v3->_prv + 1) = v4;
    *(_QWORD *)v3->_prv = v4;
    v5 = *(_QWORD **)v3->_prv;
    *v5 = 0;
    v5[1] = 0;
    v6 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    *((_QWORD *)v3->_prv + 3) = v6;
    *((_QWORD *)v3->_prv + 2) = v6;
    prv = v3->_prv;
    v8 = (_QWORD *)*((_QWORD *)prv + 2);
    *v8 = 0;
    v8[1] = 0;
    *((_QWORD *)prv + 4) = 0;
    v3->_masksInitialized = 0;
    -[GLKEffectProperty dirtyAllUniforms](v3, "dirtyAllUniforms");
  }
  return v3;
}

- (void)setEffect:(id)a3
{
  *((_QWORD *)self->_prv + 4) = a3;
  self->_effect = (GLKEffect *)a3;
}

- (void)setNameString:(char *)a3
{
  char *nameString;

  nameString = self->_nameString;
  if (nameString)
  {
    free(nameString);
    self->_nameString = 0;
  }
  if (a3)
    self->_nameString = strdup(a3);
}

- (void)setVSHSource:(char *)a3
{
  char *vshSource;

  vshSource = self->_vshSource;
  if (vshSource)
  {
    free(vshSource);
    self->_vshSource = 0;
  }
  if (a3)
    self->_vshSource = strdup(a3);
}

- (void)setFSHSource:(char *)a3
{
  char *fshSource;

  fshSource = self->_fshSource;
  if (fshSource)
  {
    free(fshSource);
    self->_fshSource = 0;
  }
  if (a3)
    self->_fshSource = strdup(a3);
}

- (void)setShaderBindings
{
  NSLog(CFSTR("-[GLKEffectProperty setShaderBindings] abstract method has been called."), a2);
  -[GLKEffectProperty dirtyAllUniforms](self, "dirtyAllUniforms");
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  return 1;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  return 1;
}

+ (void)logSetMasksWithLabel:(id)a3 obj:(id)a4 typeStr:(id)a5
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = objc_msgSend(a5, "isEqualToString:", CFSTR("vsh"));
  if ((v8 & 1) != 0)
    goto LABEL_4;
  if ((objc_msgSend(a5, "isEqualToString:", CFSTR("fsh")) & 1) == 0)
  {
    if (!objc_msgSend(a5, "isEqualToString:", CFSTR("both")))
      return;
LABEL_4:
    v9 = objc_msgSend(a4, "vshMasks");
    LODWORD(v10) = objc_msgSend(a4, "vshMaskCt");
    v11 = (_QWORD *)objc_msgSend(a4, "vshMaskStr");
    NSLog(CFSTR("%@ Masks Set:"), a3);
    if ((int)v10 >= 1)
    {
      v10 = v10;
      v12 = (uint64_t *)(v9 + 8);
      while (1)
      {
        v13 = (_QWORD *)objc_msgSend(a4, "vshMask");
        v14 = *(v12 - 1);
        if ((v14 & *v13) != 0)
          break;
        v15 = *v12;
        if ((*v12 & v13[1]) != 0)
          goto LABEL_9;
LABEL_10:
        v12 += 2;
        ++v11;
        if (!--v10)
          goto LABEL_11;
      }
      v15 = *v12;
LABEL_9:
      NSLog(CFSTR("\t%s - %08llx %08llx"), *v11, v15, v14);
      goto LABEL_10;
    }
LABEL_11:
    NSLog(CFSTR("\n"));
    if ((v8 & 1) != 0)
      return;
  }
  v16 = objc_msgSend(a4, "fshMasks");
  LODWORD(v17) = objc_msgSend(a4, "fshMaskCt");
  v18 = (_QWORD *)objc_msgSend(a4, "fshMaskStr");
  NSLog(CFSTR("%@ Masks Set:"), a3);
  if ((int)v17 >= 1)
  {
    v17 = v17;
    v19 = (uint64_t *)(v16 + 8);
    while (1)
    {
      v20 = (_QWORD *)objc_msgSend(a4, "fshMask");
      v21 = *(v19 - 1);
      if ((v21 & *v20) != 0)
        break;
      v22 = *v19;
      if ((*v19 & v20[1]) != 0)
        goto LABEL_17;
LABEL_18:
      v19 += 2;
      ++v18;
      if (!--v17)
        goto LABEL_19;
    }
    v22 = *v19;
LABEL_17:
    NSLog(CFSTR("\t%s - %08llx %08llx"), *v18, v22, v21);
    goto LABEL_18;
  }
LABEL_19:
  NSLog(CFSTR("\n"));
}

- (GLKBigInt_s)vshMask
{
  return *(GLKBigInt_s **)self->_prv;
}

- (GLKBigInt_s)fshMask
{
  return (GLKBigInt_s *)*((_QWORD *)self->_prv + 2);
}

- (void)dealloc
{
  char *nameString;
  char *vshSource;
  char *fshSource;
  objc_super v6;

  free(*((void **)self->_prv + 1));
  free(*((void **)self->_prv + 3));
  free(self->_prv);
  nameString = self->_nameString;
  if (nameString)
    free(nameString);
  vshSource = self->_vshSource;
  if (vshSource)
    free(vshSource);
  fshSource = self->_fshSource;
  if (fshSource)
    free(fshSource);
  v6.receiver = self;
  v6.super_class = (Class)GLKEffectProperty;
  -[GLKEffectProperty dealloc](&v6, sel_dealloc);
}

- (int)location
{
  return self->_location;
}

- (void)setLocation:(int)a3
{
  self->_location = a3;
}

- (char)nameString
{
  return self->_nameString;
}

- (char)vshSource
{
  return self->_vshSource;
}

- (void)setVshSource:(char *)a3
{
  self->_vshSource = a3;
}

- (char)fshSource
{
  return self->_fshSource;
}

- (void)setFshSource:(char *)a3
{
  self->_fshSource = a3;
}

- (unint64_t)dirtyUniforms
{
  return self->_dirtyUniforms;
}

- (void)setDirtyUniforms:(unint64_t)a3
{
  self->_dirtyUniforms = a3;
}

- (unsigned)masksInitialized
{
  return self->_masksInitialized;
}

- (void)setMasksInitialized:(unsigned __int8)a3
{
  self->_masksInitialized = a3;
}

- (GLKEffect)effect
{
  return self->_effect;
}

@end
