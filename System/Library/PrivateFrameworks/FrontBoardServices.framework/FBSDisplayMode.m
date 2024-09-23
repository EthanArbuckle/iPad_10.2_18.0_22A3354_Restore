@implementation FBSDisplayMode

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;

  objc_msgSend(off_1E38E9E08, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSizeT:", self->_width);
  v5 = (id)objc_msgSend(v3, "appendSizeT:", self->_height);
  v6 = (id)objc_msgSend(v3, "appendSizeT:", self->_preferredScale);
  v7 = (id)objc_msgSend(v3, "appendCGFloat:", self->_scaleOverride);
  v8 = (id)objc_msgSend(v3, "appendDouble:", self->_refreshRate);
  v9 = (id)objc_msgSend(v3, "appendInteger:", self->_gamut);
  v10 = (id)objc_msgSend(v3, "appendInteger:", self->_hdr);
  v11 = (id)objc_msgSend(v3, "appendInteger:", self->_rotation);
  v12 = (id)objc_msgSend(v3, "appendBool:", self->_virtual);
  v13 = objc_msgSend(v3, "hash");

  return v13;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t xdict;

  v4 = a3;
  if (v4)
  {
    xdict = v4;
    xpc_dictionary_set_uint64(v4, (const char *)objc_msgSend(CFSTR("width"), "UTF8String"), self->_width);
    xpc_dictionary_set_uint64(xdict, (const char *)objc_msgSend(CFSTR("height"), "UTF8String"), self->_height);
    if (self->_preferredScale)
      xpc_dictionary_set_uint64(xdict, (const char *)objc_msgSend(CFSTR("preferredScale"), "UTF8String"), self->_preferredScale);
    if ((BSFloatIsZero() & 1) == 0)
      xpc_dictionary_set_double(xdict, (const char *)objc_msgSend(CFSTR("scaleOverride"), "UTF8String"), self->_scaleOverride);
    xpc_dictionary_set_double(xdict, (const char *)objc_msgSend(CFSTR("refreshRate"), "UTF8String"), self->_refreshRate);
    if (self->_gamut)
      xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("gamut"), "UTF8String"), self->_gamut);
    if (self->_hdr)
      xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("hdr"), "UTF8String"), self->_hdr);
    if (self->_rotation)
      xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("rotation"), "UTF8String"), self->_rotation);
    xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("virtual"), "UTF8String"), self->_virtual);
    v4 = xdict;
  }

}

+ (id)_emptyMode
{
  if (_emptyMode_onceToken != -1)
    dispatch_once(&_emptyMode_onceToken, &__block_literal_global_26);
  return (id)_emptyMode___emptyMode;
}

- (id)_copyWithOverrideSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  uint64_t v9;

  height = a3.height;
  width = a3.width;
  -[FBSDisplayMode pointScale](self, "pointScale");
  if ((self->_rotation | 2) == 3)
  {
    v7 = height;
    height = width;
  }
  else
  {
    v7 = width;
  }
  LOBYTE(v9) = 1;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:", (unint64_t)(v6 * v7), (unint64_t)(v6 * height), self->_preferredScale, self->_gamut, self->_hdr, self->_rotation, self->_scaleOverride, self->_refreshRate, v9, 1);
}

- (FBSDisplayMode)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t uint64;
  uint64_t v7;
  uint64_t v8;
  double value;
  double v10;
  int64_t int64;
  int64_t v12;
  int64_t v13;
  FBSDisplayMode *v14;
  uint64_t v16;

  v4 = a3;
  xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("scaleOverride"), "UTF8String"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64 = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("width"), "UTF8String"));
  v7 = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("height"), "UTF8String"));
  v8 = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("preferredScale"), "UTF8String"));
  value = 0.0;
  if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E0C81300])
    value = xpc_double_get_value(v5);
  v10 = xpc_dictionary_get_double(v4, (const char *)objc_msgSend(CFSTR("refreshRate"), "UTF8String"));
  int64 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("gamut"), "UTF8String"));
  v12 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("hdr"), "UTF8String"));
  v13 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("rotation"), "UTF8String"));
  LOBYTE(v16) = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("virtual"), "UTF8String"));
  v14 = -[FBSDisplayMode _initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:](self, "_initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:", uint64, v7, v8, int64, v12, v13, value, v10, v16, 2);

  return v14;
}

- (id)_initWithWidth:(unint64_t)a3 height:(unint64_t)a4 preferredScale:(unint64_t)a5 scaleOverride:(double)a6 refreshRate:(double)a7 gamut:(int64_t)a8 hdr:(int64_t)a9 rotation:(int64_t)a10 virtual:(BOOL)a11 validityCheck:(int64_t)a12
{
  FBSDisplayMode *v21;
  uint64_t v22;
  int v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  char IsZero;
  void *v28;
  NSObject *v29;
  id result;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)FBSDisplayMode;
  v21 = -[FBSDisplayMode init](&v32, sel_init);
  v22 = (uint64_t)v21;
  if (v21)
  {
    v21->_width = a3;
    v21->_height = a4;
    v21->_preferredScale = a5;
    v23 = BSFloatEqualToFloat();
    v24 = 0.0;
    if (!v23)
      v24 = a6;
    *(double *)(v22 + 32) = v24;
    *(double *)(v22 + 40) = a7;
    *(_QWORD *)(v22 + 48) = a8;
    *(_QWORD *)(v22 + 56) = a9;
    *(_QWORD *)(v22 + 64) = a10;
    *(_BYTE *)(v22 + 72) = a11;
  }
  if (a12 == 3)
    return (id)v22;
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  if (a5 != -1 && a4 + 1 >= 2 && a3 + 1 >= 2 && v25 == v26)
  {
    if (a5)
    {
      if (a6 < 0.0 || a7 <= 0.0)
        goto LABEL_20;
    }
    else
    {
      IsZero = BSFloatIsZero();
      if (a7 <= 0.0 || a6 < 0.0 || (IsZero & 1) != 0)
        goto LABEL_20;
    }
    if (FBSDisplayGamutIsValid(a8) && FBSDisplayHDRModeIsValid(a9) && FBSDisplayRotationIsValid(a10))
      return (id)v22;
  }
LABEL_20:
  if (a12 == 2)
  {
    FBLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[FBSDisplayMode _initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:].cold.1(v22, v29);

    v28 = (void *)v22;
    v22 = 0;
    goto LABEL_26;
  }
  if (a12 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("FBSDisplayMode.m"), 112, CFSTR("FBSDisplayMode cannot be configured as requested : %@"), v22);
LABEL_26:

    return (id)v22;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSDisplayMode cannot be configured as requested : %@"), v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSDisplayMode _initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:].cold.2(a2, v22, (uint64_t)v31);
  objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[FBSDisplayMode pointScale](self, "pointScale");
  v4 = v3;
  -[FBSDisplayMode pixelSize](self, "pixelSize");
  v6 = v5 / v4;
  v8 = v7 / v4;
  result.height = v8;
  result.width = v6;
  return result;
}

- (CGSize)pixelSize
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v2 = 16;
  v3 = 16;
  if ((self->_rotation | 2) == 3)
    v3 = 8;
  else
    v2 = 8;
  v4 = (double)*(unint64_t *)((char *)&self->super.isa + v3);
  v5 = (double)*(unint64_t *)((char *)&self->super.isa + v2);
  result.height = v4;
  result.width = v5;
  return result;
}

- (double)pointScale
{
  if (BSFloatIsZero())
    return (double)self->_preferredScale;
  else
    return self->_scaleOverride;
}

- (CGSize)nativePixelSize
{
  double width;
  double height;
  CGSize result;

  width = (double)self->_width;
  height = (double)self->_height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)_rotation
{
  return self->_rotation;
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_9(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 72);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_8(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_7(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_6(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
}

double __26__FBSDisplayMode_isEqual___block_invoke_5(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 40);
}

double __26__FBSDisplayMode_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_3(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t __26__FBSDisplayMode_isEqual___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t width;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t height;
  id v11;
  id v12;
  unint64_t preferredScale;
  id v14;
  id v15;
  double scaleOverride;
  id v17;
  id v18;
  double refreshRate;
  id v20;
  id v21;
  int64_t gamut;
  id v23;
  id v24;
  int64_t hdr;
  id v26;
  id v27;
  int64_t rotation;
  id v29;
  id v30;
  _BOOL8 v31;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;

  v4 = a3;
  objc_msgSend(off_1E38E9E00, "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  width = self->_width;
  v7 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __26__FBSDisplayMode_isEqual___block_invoke;
  v51[3] = &unk_1E38ED7C0;
  v8 = v4;
  v52 = v8;
  v9 = (id)objc_msgSend(v5, "appendSizeT:counterpart:", width, v51);
  height = self->_height;
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __26__FBSDisplayMode_isEqual___block_invoke_2;
  v49[3] = &unk_1E38ED7C0;
  v11 = v8;
  v50 = v11;
  v12 = (id)objc_msgSend(v5, "appendSizeT:counterpart:", height, v49);
  preferredScale = self->_preferredScale;
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __26__FBSDisplayMode_isEqual___block_invoke_3;
  v47[3] = &unk_1E38ED7C0;
  v14 = v11;
  v48 = v14;
  v15 = (id)objc_msgSend(v5, "appendSizeT:counterpart:", preferredScale, v47);
  scaleOverride = self->_scaleOverride;
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __26__FBSDisplayMode_isEqual___block_invoke_4;
  v45[3] = &unk_1E38EC288;
  v17 = v14;
  v46 = v17;
  v18 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v45, scaleOverride);
  refreshRate = self->_refreshRate;
  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __26__FBSDisplayMode_isEqual___block_invoke_5;
  v43[3] = &unk_1E38EC288;
  v20 = v17;
  v44 = v20;
  v21 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v43, refreshRate);
  gamut = self->_gamut;
  v41[0] = v7;
  v41[1] = 3221225472;
  v41[2] = __26__FBSDisplayMode_isEqual___block_invoke_6;
  v41[3] = &unk_1E38EB9E8;
  v23 = v20;
  v42 = v23;
  v24 = (id)objc_msgSend(v5, "appendInteger:counterpart:", gamut, v41);
  hdr = self->_hdr;
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __26__FBSDisplayMode_isEqual___block_invoke_7;
  v39[3] = &unk_1E38EB9E8;
  v26 = v23;
  v40 = v26;
  v27 = (id)objc_msgSend(v5, "appendInteger:counterpart:", hdr, v39);
  rotation = self->_rotation;
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __26__FBSDisplayMode_isEqual___block_invoke_8;
  v37[3] = &unk_1E38EB9E8;
  v29 = v26;
  v38 = v29;
  v30 = (id)objc_msgSend(v5, "appendInteger:counterpart:", rotation, v37);
  v31 = self->_virtual;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __26__FBSDisplayMode_isEqual___block_invoke_9;
  v35[3] = &unk_1E38EB998;
  v36 = v29;
  v32 = v29;
  v33 = (id)objc_msgSend(v5, "appendBool:counterpart:", v31, v35);
  LOBYTE(v29) = objc_msgSend(v5, "isEqual");

  return (char)v29;
}

- (NSString)description
{
  unint64_t width;
  unint64_t height;
  unint64_t preferredScale;
  double scaleOverride;
  unint64_t rotation;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  BOOL v16;
  const __CFString *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  double refreshRate;
  void *v23;
  void *v24;
  void *v25;
  double v26;

  width = self->_width;
  height = self->_height;
  preferredScale = self->_preferredScale;
  scaleOverride = self->_scaleOverride;
  rotation = self->_rotation;
  if ((BSFloatIsZero() & 1) != 0)
  {
    v8 = 0;
    if (rotation)
    {
LABEL_3:
      v9 = (void *)MEMORY[0x1E0CB3940];
      FBSDisplayRotationDescription(rotation);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("r%@"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%.1f)"), *(_QWORD *)&scaleOverride);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (rotation)
      goto LABEL_3;
  }
  v11 = 0;
LABEL_6:
  if (preferredScale == 1 && v8 == 0)
  {
    v16 = v11 != 0;
    v17 = &stru_1E38EF720;
    if (v11)
      v17 = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zux%zu%@"), width, height, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_1E38EF720;
    if (v8)
      v14 = v8;
    else
      v14 = &stru_1E38EF720;
    if (v11)
      v13 = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zux%zu/%zu%@%@"), width, height, preferredScale, v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 1;
  }

  v18 = (void *)MEMORY[0x1E0CB3940];
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[FBSDisplayMode _referenceSizeDescription](self, "_referenceSizeDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    refreshRate = self->_refreshRate;
    FBSDisplayGamutDescription(self->_gamut);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    FBSDisplayHDRModeDescription(self->_hdr);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p; %@ (%@) %gHz %@ %@>"),
      v20,
      self,
      v21,
      v15,
      *(_QWORD *)&refreshRate,
      v23,
      v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = self->_refreshRate;
    FBSDisplayGamutDescription(self->_gamut);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    FBSDisplayHDRModeDescription(self->_hdr);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p; %@ %gHz %@ %@>"), v20, self, v15, *(_QWORD *)&v26, v21, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v25;
}

- (int64_t)colorGamut
{
  return self->_gamut;
}

- (double)refreshRate
{
  return self->_refreshRate;
}

- (id)_referenceSizeDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  -[FBSDisplayMode size](self, "size");
  v4 = v3;
  v6 = v5;
  -[FBSDisplayMode pointScale](self, "pointScale");
  v8 = v7;
  if (BSFloatIsOne())
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%gx%g"), v4, v6, v10);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%gx%g@%gx"), v4, v6, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initWithCADisplayMode:(id)a3 scale:(double)a4 rotation:(int64_t)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  uint64_t v21;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FBSDisplayMode.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("caMode"));

  }
  v10 = objc_msgSend(v9, "width");
  v11 = objc_msgSend(v9, "height");
  v12 = objc_msgSend(v9, "preferredScale");
  objc_msgSend(v9, "refreshRate");
  v14 = v13;
  objc_msgSend(v9, "colorGamut");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = FBSDisplayGamutFromCADisplayGamut(v15);
  objc_msgSend(v9, "hdrMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  v18 = -[FBSDisplayMode _initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:](self, "_initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:", v10, v11, v12, v16, FBSDisplayHDRModeFromCADisplayHDRMode(v17), a5, a4, v14, v21, 1);

  return v18;
}

- (int64_t)hdrMode
{
  return self->_hdr;
}

void __28__FBSDisplayMode__emptyMode__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;

  LOBYTE(v2) = 1;
  v0 = -[FBSDisplayMode _initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:]([FBSDisplayMode alloc], "_initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:", 0, 0, 1, 0, 0, 0, 0.0, 0.0, v2, 3);
  v1 = (void *)_emptyMode___emptyMode;
  _emptyMode___emptyMode = (uint64_t)v0;

}

- (FBSDisplayMode)init
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  FBSDisplayMode *result;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  FBSDisplayMode *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("init is unavailable on %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("FBSDisplayMode.m");
    v20 = 1024;
    v21 = 37;
    v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = (FBSDisplayMode *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithWidth:(unint64_t)a3 height:(unint64_t)a4 scale:(unint64_t)a5 refreshRate:(double)a6 gamut:(int64_t)a7 hdr:(int64_t)a8
{
  uint64_t v9;

  LOBYTE(v9) = 1;
  return -[FBSDisplayMode _initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:](self, "_initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:", a3, a4, a5, a7, a8, 0, 0.0, a6, v9, 1);
}

- (id)_copyWithOverrideSize:(CGSize)a3 scale:(double)a4
{
  double height;
  uint64_t v7;

  if ((self->_rotation | 2) == 3)
  {
    height = a3.height;
    a3.height = a3.width;
  }
  else
  {
    height = a3.width;
  }
  LOBYTE(v7) = 1;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:", (unint64_t)(height * a4), (unint64_t)(a3.height * a4), (unint64_t)a4, self->_gamut, self->_hdr, self->_rotation, a4, self->_refreshRate, v7, 1);
}

- (BOOL)_isVirtualMode
{
  return self->_virtual;
}

- (unint64_t)_caWidth
{
  return self->_width;
}

- (unint64_t)_caHeight
{
  return self->_height;
}

- (unint64_t)_caPreferredScale
{
  return self->_preferredScale;
}

- (double)_caRefreshRate
{
  return self->_refreshRate;
}

- (id)_caColorGamut
{
  return FBSDisplayGamutToCADisplayGamut(self->_gamut);
}

- (id)_caHDRMode
{
  return FBSDisplayHDRModeToCADisplayHDRMode(self->_hdr);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FBSDisplayMode)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("width"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("height"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("preferredScale"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scaleOverride"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("refreshRate"));
  v11 = v10;
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("gamut"));
  v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hdr"));
  v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rotation"));
  v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("virtual"));

  LOBYTE(v17) = v15;
  return (FBSDisplayMode *)-[FBSDisplayMode _initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:](self, "_initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:", v5, v6, v7, v12, v13, v14, v9, v11, v17, 2);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t preferredScale;
  int64_t gamut;
  int64_t hdr;
  int64_t rotation;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeInt64:forKey:", self->_width, CFSTR("width"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_height, CFSTR("height"));
  preferredScale = self->_preferredScale;
  if (preferredScale)
    objc_msgSend(v9, "encodeInt64:forKey:", preferredScale, CFSTR("preferredScale"));
  if ((BSFloatIsZero() & 1) == 0)
    objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("scaleOverride"), self->_scaleOverride);
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("refreshRate"), self->_refreshRate);
  gamut = self->_gamut;
  if (gamut)
    objc_msgSend(v9, "encodeInteger:forKey:", gamut, CFSTR("gamut"));
  hdr = self->_hdr;
  if (hdr)
    objc_msgSend(v9, "encodeInteger:forKey:", hdr, CFSTR("hdr"));
  rotation = self->_rotation;
  v8 = v9;
  if (rotation)
  {
    objc_msgSend(v9, "encodeInteger:forKey:", rotation, CFSTR("rotation"));
    v8 = v9;
  }
  objc_msgSend(v8, "encodeBool:forKey:", self->_virtual, CFSTR("virtual"));

}

- (void)_initWithWidth:(uint64_t)a1 height:(NSObject *)a2 preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_ERROR, "FBSDisplayMode cannot be configured as requested : %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_initWithWidth:(uint64_t)a3 height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSDisplayMode.m");
  v16 = 1024;
  v17 = 110;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
