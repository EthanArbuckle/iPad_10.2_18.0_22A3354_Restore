@implementation PKInk

- (double)weight
{
  return self->_weight;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)variant
{
  return self->_variant;
}

- (void)set_requiredContentVersionOverride:(int64_t)a3
{
  self->__requiredContentVersionOverride = a3;
}

- (void)setWeight:(double)a3
{
  double v3;
  NSObject *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  double v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a3;
  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    v5 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE213000, v5, OS_LOG_TYPE_ERROR, "Weight must be a finite number", buf, 2u);
    }

    -[PKInk identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInk defaultWeightForIdentifier:](PKInk, "defaultWeightForIdentifier:", v6);
    v3 = v7;

  }
  -[PKInk identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.ink.custom")))
  {

  }
  else
  {
    -[PKInk behavior](self, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "useUnclampedWeight");

    if ((v10 & 1) == 0)
    {
      if (v3 > 1.0 || v3 < -1.0)
      {
        v11 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          _os_log_error_impl(&dword_1BE213000, v11, OS_LOG_TYPE_ERROR, "Ink expects an adjustment size between -1 and 1", v13, 2u);
        }

      }
      v12 = 1.0;
      if (v3 <= 1.0)
        v12 = v3;
      if (v3 >= -1.0)
        v3 = v12;
      else
        v3 = -1.0;
    }
  }
  self->_weight = v3;
}

- (PKInk)init
{
  double v3;
  double v4;
  void *v5;
  PKInk *v6;

  +[PKInk defaultWeightForIdentifier:](PKInk, "defaultWeightForIdentifier:", CFSTR("com.apple.ink.pen"));
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKInk initWithIdentifier:color:version:variant:weight:](self, "initWithIdentifier:color:version:variant:weight:", CFSTR("com.apple.ink.pen"), v5, +[PKInk currentInkVersionForInkIdentifier:](PKInk, "currentInkVersionForInkIdentifier:", CFSTR("com.apple.ink.pen")), 0, v4);

  return v6;
}

- (PKInk)initWithUncheckedIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7
{
  id v13;
  id v14;
  id v15;
  PKInk *v16;
  CGColor *ConvertedToSRGB;
  uint64_t v18;
  UIColor *color;
  NSObject *v20;
  uint64_t v21;
  UIColor *v22;
  uint64_t v23;
  NSString *variant;
  void *v25;
  uint64_t v26;
  PKInkBehavior *behavior;
  uint8_t v29[16];
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v30.receiver = self;
  v30.super_class = (Class)PKInk;
  v16 = -[PKInk init](&v30, sel_init);
  if (v16)
  {
    if (v14)
    {
      ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB(objc_msgSend(objc_retainAutorelease(v14), "CGColor"));
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", ConvertedToSRGB);
      v18 = objc_claimAutoreleasedReturnValue();
      color = v16->_color;
      v16->_color = (UIColor *)v18;

      CGColorRelease(ConvertedToSRGB);
    }
    else
    {
      v20 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_fault_impl(&dword_1BE213000, v20, OS_LOG_TYPE_FAULT, "Ink must not be initialized with a nil color", v29, 2u);
      }

      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v16->_color;
      v16->_color = (UIColor *)v21;

    }
    objc_storeStrong((id *)&v16->_identifier, a3);
    v16->_version = a5;
    if (v15)
    {
      v23 = objc_msgSend(v15, "copy");
      variant = v16->_variant;
      v16->_variant = (NSString *)v23;
    }
    else
    {
      variant = v16->_variant;
      v16->_variant = (NSString *)CFSTR("default");
    }

    +[PKInkManager defaultInkManager](PKInkManager, "defaultInkManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "inkBehaviorForIdentifier:version:variant:", v13, a5, v15);
    v26 = objc_claimAutoreleasedReturnValue();
    behavior = v16->_behavior;
    v16->_behavior = (PKInkBehavior *)v26;

    -[PKInk setWeight:](v16, "setWeight:", a7);
    -[PKInk _setupDefaultSixChannelAddAndMultiplyColors](v16, "_setupDefaultSixChannelAddAndMultiplyColors");
    -[PKInk _setupRequiredContentVersion](v16, "_setupRequiredContentVersion");
  }

  return v16;
}

- (PKInk)initWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  PKInk *v17;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[PKInkManager defaultInkManager](PKInkManager, "defaultInkManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "supportedInkIdentifierFromIdentifier:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[PKInk initWithUncheckedIdentifier:color:version:variant:weight:](self, "initWithUncheckedIdentifier:color:version:variant:weight:", v16, v13, a5, v14, a7);
  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIColor)color
{
  return self->_color;
}

- (PKInkBehavior)behavior
{
  return self->_behavior;
}

- (id)_sixChannelVersion
{
  PKInk *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  PKInk *v8;

  v3 = [PKInk alloc];
  -[PKInk identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInk color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKInk version](self, "version");
  -[PKInk variant](self, "variant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInk weight](self, "weight");
  v8 = -[PKInk initWithIdentifier:color:version:variant:weight:](v3, "initWithIdentifier:color:version:variant:weight:", v4, v5, v6, v7);

  -[PKInk _setupCustomizedSixChannelColors](v8, "_setupCustomizedSixChannelColors");
  -[PKInk set_weightIsUndefined:](v8, "set_weightIsUndefined:", -[PKInk _weightIsUndefined](self, "_weightIsUndefined"));
  return v8;
}

- (void)_setupRequiredContentVersion
{
  void *v3;
  _BOOL4 v4;
  PKInk *v5;
  int64_t v6;

  if (-[PKInk _isFountainPenInk](self, "_isFountainPenInk")
    && (+[PKContentVersionUtility sharedUtility](),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = -[PKContentVersionUtility programLinkedOnOrAfterDawnburstE]((_BOOL8)v3),
        v3,
        v4))
  {
    v5 = self;
    v6 = 3;
  }
  else
  {
    if (!self)
      return;
    v6 = -[PKInk _requiredContentVersion](self, "_requiredContentVersion");
    v5 = self;
  }
  -[PKInk set_requiredContentVersionOverride:](v5, "set_requiredContentVersionOverride:", v6);
}

- (void)_setupDefaultSixChannelAddAndMultiplyColors
{
  __int128 v3;
  __int128 v4;

  -[PKInk _defaultSixChannelAddColor](self, "_defaultSixChannelAddColor");
  *(_OWORD *)self->_sixChannelAddColor = v3;
  -[PKInk _defaultSixChannelMultiplyColor](self, "_defaultSixChannelMultiplyColor");
  *(_OWORD *)self->_sixChannelMultiplyColor = v4;
}

- (void)_setupCustomizedSixChannelColors
{
  CGColor *v3;
  double v4;
  void *v5;
  void *v6;
  unint64_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  float32x4_t v11;
  float32x4_t v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float64x2_t v17;
  __int128 v18;
  double v19[3];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[UIColor CGColor](self->_color, "CGColor");
  v18 = __const_DKUColorGetVectorFloat3_rgba;
  *(_OWORD *)v19 = unk_1BE4FE3E0;
  DKUColorGetRGBAComponents(v3, &v18);
  v17 = (float64x2_t)v18;
  v4 = v19[0];
  -[PKInk behavior](self, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderingDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "blendMode");

  v9.i64[0] = 0;
  v9.i32[2] = 0;
  if (v7 > 4)
  {
    v12.i64[0] = 0;
    v12.i32[2] = 0;
  }
  else
  {
    *(float32x2_t *)v8.f32 = vcvt_f32_f64(v17);
    v10 = v4;
    v11 = v8;
    v11.f32[2] = v10;
    if (((1 << v7) & 0x15) != 0)
    {
      v12 = v11;
    }
    else
    {
      v13 = (fminf(v8.f32[0], fminf(v8.f32[1], v10)) + -0.9) / 0.1;
      v14 = 0.0;
      if (v13 >= 0.0)
      {
        v14 = v13;
        if (v13 > 1.0)
          v14 = 1.0;
      }
      v15 = v14 * 0.85 + 0.15;
      v16 = v15;
      v12 = vmulq_n_f32(v11, v16);
      *(float *)&v15 = 1.0 - v15;
      v9 = vmulq_n_f32(v11, *(float *)&v15);
    }
  }
  v12.i32[3] = 1.0;
  v9.i32[3] = 1.0;
  *(float32x4_t *)self->_sixChannelAddColor = v12;
  *(float32x4_t *)self->_sixChannelMultiplyColor = v9;
}

- (int64_t)_requiredContentVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  -[PKInk identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ink.pen")))
    goto LABEL_8;
  -[PKInk identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ink.pencil")))
  {
LABEL_7:

LABEL_8:
    return 1;
  }
  -[PKInk identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ink.marker")))
  {
LABEL_6:

    goto LABEL_7;
  }
  -[PKInk identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ink.eraser")) & 1) != 0)
  {

    goto LABEL_6;
  }
  -[PKInk identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.ink.lasso"));

  if ((v9 & 1) != 0)
    return 1;
  -[PKInk identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")) & 1) != 0)
    goto LABEL_16;
  -[PKInk identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ink.watercolor")) & 1) != 0)
  {
LABEL_15:

LABEL_16:
    return 2;
  }
  -[PKInk identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
  {

    goto LABEL_15;
  }
  -[PKInk identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.ink.monoline"));

  if ((v14 & 1) != 0)
    return 2;
  return 250;
}

- (BOOL)_isLassoInk
{
  void *v2;
  char v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.lasso"));

  return v3;
}

- (BOOL)_isFountainPenInk
{
  void *v2;
  char v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.fountainpen"));

  return v3;
}

- (BOOL)_isEraserInk
{
  void *v3;
  char v4;
  void *v5;

  -[PKInk identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ink.eraser")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[PKInk identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ink.objectEraser"));

  }
  return v4;
}

- (float32x2_t)_defaultSixChannelMultiplyColor
{
  void *v2;
  void *v3;
  uint64_t v4;
  CGColor *v5;
  float64x2_t v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderingDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "blendMode");

  if ((v4 | 2) == 3)
  {
    v5 = (CGColor *)objc_msgSend(a1[6], "CGColor");
    v7[0] = (float64x2_t)__const_DKUColorGetVectorFloat3_rgba;
    v7[1] = (float64x2_t)unk_1BE4FE3E0;
    DKUColorGetRGBAComponents(v5, v7);
    return vcvt_f32_f64(v7[0]);
  }
  else
  {
    return 0;
  }
}

- (float32x2_t)_defaultSixChannelAddColor
{
  void *v2;
  void *v3;
  unint64_t v4;
  float32x2_t result;
  CGColor *v6;
  float64x2_t v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderingDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "blendMode");

  result = 0;
  if (v4 <= 4 && ((1 << v4) & 0x15) != 0)
  {
    v6 = (CGColor *)objc_msgSend(a1[6], "CGColor", 0.0);
    v7[0] = (float64x2_t)__const_DKUColorGetVectorFloat3_rgba;
    v7[1] = (float64x2_t)unk_1BE4FE3E0;
    DKUColorGetRGBAComponents(v6, v7);
    return vcvt_f32_f64(v7[0]);
  }
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (double)defaultWeightForIdentifier:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  v4 = -0.5;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ink.marker")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ink.pencil")) & 1) != 0)
    {
      v4 = -1.0;
    }
    else if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ink.pen")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ink.watercolor")) & 1) != 0
        || (objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ink.fountainpen")) & 1) != 0
        || (objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ink.monoline")) & 1) != 0
        || (v4 = -1.0, objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ink.crayon"))))
      {
        +[PKInkingTool defaultWidthForInkType:](PKInkingTool, "defaultWidthForInkType:", v3);
        v4 = v5;
      }
    }
  }

  return v4;
}

+ (int64_t)currentInkVersionForInkIdentifier:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ink.eraser")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ink.objectEraser")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

- (PKInk)initWithArchive:(const void *)a3
{
  float *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGColorRef RGBA;
  uint64_t *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  PKInk *v20;
  uint64_t v21;
  int8x16_t v22;
  uint64_t v23;
  int8x16_t v24;

  v5 = (float *)*((_QWORD *)a3 + 1);
  if (v5)
  {
    v6 = v5[5];
    v7 = v5[4];
    v8 = v5[3];
    v9 = v5[2];
  }
  else
  {
    v9 = 1.0;
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
  }
  RGBA = CGColorCreateRGBA(v6, v7, v8, v9);
  v11 = (uint64_t *)*((_QWORD *)a3 + 2);
  if (*((char *)v11 + 23) < 0)
    v11 = (uint64_t *)*v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((*((_BYTE *)a3 + 72) & 2) != 0)
  {
    v14 = *((_QWORD *)a3 + 7);
    if (v14 == 3)
    {
      if (-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.ink.calligraphy")))
      {
        v15 = CFSTR("com.apple.ink.fountainpen");

        v14 = 3;
        v13 = v15;
      }
      else
      {
        v14 = 3;
      }
    }
  }
  else
  {
    v14 = 0;
  }
  v16 = CFSTR("default");
  v17 = (uint64_t *)*((_QWORD *)a3 + 6);
  if (v17)
  {
    if (*((char *)v17 + 23) < 0)
      v17 = (uint64_t *)*v17;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v16 = (__CFString *)v18;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", RGBA);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PKInk initWithIdentifier:color:version:variant:](self, "initWithIdentifier:color:version:variant:", v13, v19, v14, v16);

  if ((*((_BYTE *)a3 + 72) & 4) != 0)
    -[PKInk setWeight:](v20, "setWeight:", *((double *)a3 + 8));
  else
    -[PKInk set_weightIsUndefined:](v20, "set_weightIsUndefined:", 1);
  v21 = *((_QWORD *)a3 + 4);
  if (v21)
  {
    v22 = (int8x16_t)vrev64q_s32(*(int32x4_t *)(v21 + 8));
    -[PKInk set_sixChannelAddColor:](v20, "set_sixChannelAddColor:", *(double *)vextq_s8(v22, v22, 8uLL).i64);
  }
  v23 = *((_QWORD *)a3 + 5);
  if (v23)
  {
    v24 = (int8x16_t)vrev64q_s32(*(int32x4_t *)(v23 + 8));
    -[PKInk set_sixChannelMultiplyColor:](v20, "set_sixChannelMultiplyColor:", *(double *)vextq_s8(v24, v24, 8uLL).i64);
  }
  if ((*((_BYTE *)a3 + 72) & 1) == 0 && v20)
    -[PKInk set_requiredContentVersionOverride:](v20, "set_requiredContentVersionOverride:", -[PKInk _requiredContentVersion](v20, "_requiredContentVersion"));
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](&v20->_unknownFields.__ptr_, (uint64_t *)a3 + 10);

  return v20;
}

- (void)saveToArchive:(void *)a3
{
  id v5;
  CGColor *v6;
  uint64_t v7;
  double v8;
  float v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  float Alpha;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  unint64_t v21;
  void *v22;
  BOOL v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  double v46[3];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[PKInk color](self, "color");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");

  v45 = xmmword_1BE4FC650;
  *(_OWORD *)v46 = unk_1BE4FC660;
  if (DKUColorGetRGBAComponents(v6, &v45))
  {
    drawing::Ink::makeColor(a3);
    v7 = *((_QWORD *)a3 + 1);
    v8 = *((double *)&v45 + 1);
    v9 = *(double *)&v45;
    *(float *)(v7 + 20) = v9;
    *(_BYTE *)(v7 + 24) |= 8u;
    v10 = *((_QWORD *)a3 + 1);
    v11 = v8;
    *(_BYTE *)(v10 + 24) |= 4u;
    *(float *)(v10 + 16) = v11;
    v12 = *((_QWORD *)a3 + 1);
    v13 = v46[0];
    *(_BYTE *)(v12 + 24) |= 2u;
    *(float *)(v12 + 12) = v13;
    v14 = *((_QWORD *)a3 + 1);
    Alpha = CGColorGetAlpha(v6);
    *(_BYTE *)(v14 + 24) |= 1u;
    *(float *)(v14 + 8) = Alpha;
  }
  -[PKInk identifierForArchiving](self, "identifierForArchiving");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v43, (char *)objc_msgSend(v16, "UTF8String"));
  v17 = (uint64_t *)((char *)a3 + 16);
  v18 = *((_QWORD *)a3 + 2);
  if (!v18)
  {
    v18 = operator new();
    *(_QWORD *)v18 = 0;
    *(_QWORD *)(v18 + 8) = 0;
    *(_QWORD *)(v18 + 16) = 0;
    v19 = *v17;
    *v17 = v18;
    if (v19)
    {
      std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)a3 + 16, v19);
      v18 = *v17;
    }
  }
  if (*(char *)(v18 + 23) < 0)
    operator delete(*(void **)v18);
  v20 = v43;
  *(_QWORD *)(v18 + 16) = v44;
  *(_OWORD *)v18 = v20;
  HIBYTE(v44) = 0;
  LOBYTE(v43) = 0;

  v21 = -[PKInk version](self, "version");
  *((_BYTE *)a3 + 72) |= 2u;
  *((_QWORD *)a3 + 7) = v21;
  -[PKInk variantForArchiving](self, "variantForArchiving");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (!v23)
  {
    -[PKInk variantForArchiving](self, "variantForArchiving");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v43, (char *)objc_msgSend(v24, "UTF8String"));
    v25 = (uint64_t *)((char *)a3 + 48);
    v26 = *((_QWORD *)a3 + 6);
    if (!v26)
    {
      v26 = operator new();
      *(_QWORD *)v26 = 0;
      *(_QWORD *)(v26 + 8) = 0;
      *(_QWORD *)(v26 + 16) = 0;
      v27 = *v25;
      *v25 = v26;
      if (v27)
      {
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)a3 + 48, v27);
        v26 = *v25;
      }
    }
    if (*(char *)(v26 + 23) < 0)
      operator delete(*(void **)v26);
    v28 = v43;
    *(_QWORD *)(v26 + 16) = v44;
    *(_OWORD *)v26 = v28;
    HIBYTE(v44) = 0;
    LOBYTE(v43) = 0;

  }
  if (!-[PKInk _weightIsUndefined](self, "_weightIsUndefined"))
  {
    -[PKInk _weight](self, "_weight");
    *((_BYTE *)a3 + 72) |= 4u;
    *((_QWORD *)a3 + 8) = v29;
  }
  if (-[PKInk _shouldSaveSixChannelAddColor](self, "_shouldSaveSixChannelAddColor"))
  {
    -[PKInk _sixChannelAddColor](self, "_sixChannelAddColor");
    v41 = v30;
    drawing::Ink::makeSixChannelAddColor(a3);
    v31 = *((_QWORD *)a3 + 4);
    *(_BYTE *)(v31 + 24) |= 8u;
    *(_DWORD *)(v31 + 20) = v41;
    v32 = *((_QWORD *)a3 + 4);
    *(_BYTE *)(v32 + 24) |= 4u;
    *(_DWORD *)(v32 + 16) = DWORD1(v41);
    v33 = *((_QWORD *)a3 + 4);
    *(_BYTE *)(v33 + 24) |= 2u;
    *(_DWORD *)(v33 + 12) = DWORD2(v41);
    v34 = *((_QWORD *)a3 + 4);
    *(_BYTE *)(v34 + 24) |= 1u;
    *(_DWORD *)(v34 + 8) = HIDWORD(v41);
  }
  if (-[PKInk _shouldSaveSixChannelMultiplyColor](self, "_shouldSaveSixChannelMultiplyColor", v41))
  {
    -[PKInk _sixChannelMultiplyColor](self, "_sixChannelMultiplyColor");
    v42 = v35;
    drawing::Ink::makeSixChannelMultiplyColor(a3);
    v36 = *((_QWORD *)a3 + 5);
    *(_BYTE *)(v36 + 24) |= 8u;
    *(_DWORD *)(v36 + 20) = v42;
    v37 = *((_QWORD *)a3 + 5);
    *(_BYTE *)(v37 + 24) |= 4u;
    *(_DWORD *)(v37 + 16) = DWORD1(v42);
    v38 = *((_QWORD *)a3 + 5);
    *(_BYTE *)(v38 + 24) |= 2u;
    *(_DWORD *)(v38 + 12) = DWORD2(v42);
    v39 = *((_QWORD *)a3 + 5);
    *(_BYTE *)(v39 + 24) |= 1u;
    *(_DWORD *)(v39 + 8) = HIDWORD(v42);
  }
  if (-[PKInk _shouldSaveRequiredContentVersionOverride](self, "_shouldSaveRequiredContentVersionOverride", v42))
  {
    v40 = -[PKInk _requiredContentVersionOverride](self, "_requiredContentVersionOverride");
    *((_BYTE *)a3 + 72) |= 1u;
    *((_QWORD *)a3 + 3) = v40;
  }
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((_QWORD *)a3 + 10, (uint64_t *)&self->_unknownFields);
}

- (PKInk)initWithV1Archive:(const void *)a3 serializationVersion:(unint64_t)a4
{
  float *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGColorRef RGBA;
  uint64_t *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  PKInk *v20;

  v6 = (float *)*((_QWORD *)a3 + 1);
  if (v6)
  {
    v7 = v6[5];
    v8 = v6[4];
    v9 = v6[3];
    v10 = v6[2];
  }
  else
  {
    v10 = 1.0;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }
  RGBA = CGColorCreateRGBA(v7, v8, v9, v10);
  v12 = (uint64_t *)*((_QWORD *)a3 + 2);
  if (*((char *)v12 + 23) < 0)
    v12 = (uint64_t *)*v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)a3 + 32) & 1) == 0)
  {
    v14 = CFSTR("default");
    v15 = v14;
LABEL_11:
    v18 = v15;

    v16 = 0;
    v14 = v18;
    goto LABEL_12;
  }
  v16 = *((_QWORD *)a3 + 3);
  v17 = CFSTR("default");
  v14 = v17;
  if ((v16 | 2) == 2)
  {
    v15 = CFSTR("thick");
    if (v16 != 2)
      v15 = v17;
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", RGBA);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PKInk initWithIdentifier:color:version:variant:](self, "initWithIdentifier:color:version:variant:", v13, v19, v16, v14);

  return v20;
}

- (void)saveToV1Archive:(void *)a3
{
  id v5;
  CGColor *v6;
  uint64_t v7;
  double v8;
  float v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  float Alpha;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  unint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  double v25[3];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PKInk color](self, "color");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");

  v24 = xmmword_1BE4FC650;
  *(_OWORD *)v25 = unk_1BE4FC660;
  if (DKUColorGetRGBAComponents(v6, &v24))
  {
    drawingV1::Ink::makeColor(a3);
    v7 = *((_QWORD *)a3 + 1);
    v8 = *((double *)&v24 + 1);
    v9 = *(double *)&v24;
    *(float *)(v7 + 20) = v9;
    *(_BYTE *)(v7 + 24) |= 8u;
    v10 = *((_QWORD *)a3 + 1);
    v11 = v8;
    *(_BYTE *)(v10 + 24) |= 4u;
    *(float *)(v10 + 16) = v11;
    v12 = *((_QWORD *)a3 + 1);
    v13 = v25[0];
    *(_BYTE *)(v12 + 24) |= 2u;
    *(float *)(v12 + 12) = v13;
    v14 = *((_QWORD *)a3 + 1);
    Alpha = CGColorGetAlpha(v6);
    *(_BYTE *)(v14 + 24) |= 1u;
    *(float *)(v14 + 8) = Alpha;
  }
  -[PKInk identifier](self, "identifier");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v22, (char *)objc_msgSend(v16, "UTF8String"));
  v17 = (uint64_t *)((char *)a3 + 16);
  v18 = *((_QWORD *)a3 + 2);
  if (!v18)
  {
    v18 = operator new();
    *(_QWORD *)v18 = 0;
    *(_QWORD *)(v18 + 8) = 0;
    *(_QWORD *)(v18 + 16) = 0;
    v19 = *v17;
    *v17 = v18;
    if (v19)
    {
      std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)a3 + 16, v19);
      v18 = *v17;
    }
  }
  if (*(char *)(v18 + 23) < 0)
    operator delete(*(void **)v18);
  v20 = v22;
  *(_QWORD *)(v18 + 16) = v23;
  *(_OWORD *)v18 = v20;
  HIBYTE(v23) = 0;
  LOBYTE(v22) = 0;

  v21 = -[PKInk version](self, "version");
  *((_BYTE *)a3 + 32) |= 1u;
  *((_QWORD *)a3 + 3) = v21;
}

- (PKInk)initWithRawValue:(id)a3
{
  id v4;
  const unsigned __int8 *v5;
  PKInk *v6;
  _BYTE v8[32];
  _QWORD v9[9];
  int v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v10 = 0;
  v9[0] = &off_1E7774910;
  v9[1] = 0;
  v9[2] = 0;
  memset(&v9[4], 0, 24);
  v4 = objc_retainAutorelease(a3);
  v5 = (const unsigned __int8 *)objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");
  PB::Reader::Reader((PB::Reader *)v8, v5);
  if (drawing::Ink::readFrom((drawing::Ink *)v9, (PB::Reader *)v8))
  {
    self = -[PKInk initWithArchive:](self, "initWithArchive:", v9);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }
  drawing::Ink::~Ink((drawing::Ink *)v9);

  return v6;
}

- (NSData)rawValue
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[9];
  int v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v7 = 0;
  v6[0] = &off_1E7774910;
  v6[1] = 0;
  v6[2] = 0;
  memset(&v6[4], 0, 24);
  -[PKInk saveToArchive:](self, "saveToArchive:", v6);
  PB::Writer::Writer((PB::Writer *)&v4);
  drawing::Ink::writeTo((drawing::Ink *)v6, (PB::Writer *)&v4);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, v4 - v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PB::Writer::~Writer((PB::Writer *)&v4);
  drawing::Ink::~Ink((drawing::Ink *)v6);
  return (NSData *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKInk dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("representation"));

}

- (PKInk)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKInk *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("representation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("properties"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInk inkWithIdentifier:properties:](PKInk, "inkWithIdentifier:properties:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)identifierForInkType:(id)a3
{
  return a3;
}

+ (PKInk)inkWithType:(id)a3 color:(id)a4 weight:(double)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  +[PKInk identifierForInkType:](PKInk, "identifierForInkType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", v8, v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKInk *)v9;
}

+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4 weight:(double)a5
{
  id v7;
  id v8;
  PKInk *v9;

  v7 = a3;
  v8 = a4;
  v9 = -[PKInk initWithIdentifier:color:version:variant:weight:]([PKInk alloc], "initWithIdentifier:color:version:variant:weight:", v7, v8, +[PKInk currentInkVersionForInkIdentifier:](PKInk, "currentInkVersionForInkIdentifier:", v7), 0, a5);

  return v9;
}

+ (PKInk)inkWithIdentifier:(id)a3 properties:(id)a4
{
  objc_msgSend(a1, "inkWithIdentifier:properties:inkVersion:", a3, a4, -1);
  return (PKInk *)(id)objc_claimAutoreleasedReturnValue();
}

+ (PKInk)inkWithIdentifier:(id)a3 properties:(id)a4 inkVersion:(int64_t)a5
{
  void *v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  PKInk *v54;
  void *v55;
  PKInk *v56;
  int64_t v58;

  v9 = a3;
  v10 = a4;
  v58 = a5;
  if (a5 < 0)
    v58 = objc_msgSend(a1, "currentInkVersionForInkIdentifier:", v9);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkWeightProperty"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkWeightProperty")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkWeightProperty"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

  }
  else
  {
    +[PKInk defaultWeightForIdentifier:](PKInk, "defaultWeightForIdentifier:", v9);
    v14 = v15;
    if (!v11)
      goto LABEL_8;
  }

LABEL_8:
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.eraser")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkVersionProperty"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else if (fabs(v14 + -1.0) < 0.00999999978)
    {
      objc_msgSend(a1, "defaultWeightForIdentifier:", v9);
      v14 = v17;
    }
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkOpacityProperty"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18
    && (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkOpacityProperty")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkOpacityProperty"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v21 = v20;

  }
  else
  {
    +[PKInk defaultOpacityForIdentifier:](PKInk, "defaultOpacityForIdentifier:", v9);
    v21 = v22;
    if (!v18)
      goto LABEL_18;
  }

LABEL_18:
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v25 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("PKInkRedComponentProperty"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("PKInkRedComponentProperty"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("PKInkRedComponentProperty"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          v25 = v32;

        }
      }

    }
  }
  else
  {
    v25 = 0.0;
  }

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("PKInkGreenComponentProperty"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PKInkGreenComponentProperty"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("PKInkGreenComponentProperty"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "doubleValue");
          v35 = v42;

        }
      }

    }
  }
  else
  {
    v35 = 0.0;
  }

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("PKInkBlueComponentProperty"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("PKInkBlueComponentProperty"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkColorProperty"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("PKInkBlueComponentProperty"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "doubleValue");
          v45 = v52;

        }
      }

    }
  }
  else
  {
    v45 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v25, v35, v45, v21);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = [PKInk alloc];
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PKInkVariantProperty"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[PKInk initWithIdentifier:color:version:variant:weight:](v54, "initWithIdentifier:color:version:variant:weight:", v9, v53, v58, v55, v14);

  return v56;
}

- (PKInk)initWithInkType:(PKInkType)type color:(UIColor *)color
{
  UIColor *v6;
  void *v7;
  PKInk *v8;

  v6 = color;
  +[PKInk identifierForInkType:](PKInk, "identifierForInkType:", type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKInk initWithIdentifier:color:version:variant:weight:](self, "initWithIdentifier:color:version:variant:weight:", v7, v6, +[PKInk currentInkVersionForInkIdentifier:](PKInk, "currentInkVersionForInkIdentifier:", v7), 0, 0.0);

  return v8;
}

- (id)_copyWithVariant:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[PKInk identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInk color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKInk version](self, "version");
  -[PKInk weight](self, "weight");
  v9 = (void *)objc_msgSend(v5, "initWithIdentifier:color:version:variant:weight:", v6, v7, v8, v4);

  objc_msgSend(v9, "set_weightIsUndefined:", -[PKInk _weightIsUndefined](self, "_weightIsUndefined"));
  return v9;
}

- (id)_copyWithOriginalRequiredContentVersion
{
  PKInk *v2;
  PKInk *cachedInkWithOriginalRequiredContentVersion;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PKInk *v9;
  PKInk *v10;
  PKInk *v11;

  v2 = self;
  objc_sync_enter(v2);
  cachedInkWithOriginalRequiredContentVersion = v2->_cachedInkWithOriginalRequiredContentVersion;
  if (!cachedInkWithOriginalRequiredContentVersion)
  {
    v4 = objc_alloc((Class)objc_opt_class());
    -[PKInk identifier](v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInk color](v2, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKInk version](v2, "version");
    -[PKInk variant](v2, "variant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInk weight](v2, "weight");
    v9 = (PKInk *)objc_msgSend(v4, "initWithIdentifier:color:version:variant:weight:", v5, v6, v7, v8);

    if (v9)
      -[PKInk set_requiredContentVersionOverride:](v9, "set_requiredContentVersionOverride:", -[PKInk _requiredContentVersion](v9, "_requiredContentVersion"));
    -[PKInk set_weightIsUndefined:](v9, "set_weightIsUndefined:", -[PKInk _weightIsUndefined](v2, "_weightIsUndefined"));
    v10 = v2->_cachedInkWithOriginalRequiredContentVersion;
    v2->_cachedInkWithOriginalRequiredContentVersion = v9;

    cachedInkWithOriginalRequiredContentVersion = v2->_cachedInkWithOriginalRequiredContentVersion;
  }
  v11 = cachedInkWithOriginalRequiredContentVersion;
  objc_sync_exit(v2);

  return v11;
}

- (BOOL)_isHandwritingInk
{
  void *v2;
  char v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.handwriting"));

  return v3;
}

- (BOOL)_isPenInk
{
  void *v2;
  char v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.pen"));

  return v3;
}

- (BOOL)_isPencilInk
{
  void *v2;
  char v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.pencil"));

  return v3;
}

- (BOOL)_isMarkerInk
{
  void *v2;
  char v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.marker"));

  return v3;
}

- (BOOL)_isMonolineInk
{
  void *v2;
  void *v4;
  int v5;
  char v6;
  void *v7;
  void *v9;

  -[PKInk identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ink.pen"));
  if (v5)
  {
    -[PKInk variant](self, "variant");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("fixed-width")) & 1) != 0)
    {
      v6 = 1;
      goto LABEL_6;
    }
  }
  -[PKInk identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ink.monoline")) & 1) == 0)
  {
    -[PKInk identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.micronpen"));

    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }

  v6 = 1;
  if (v5)
LABEL_6:

LABEL_7:
  return v6;
}

- (BOOL)_isFountainPenInkV2
{
  _BOOL4 v3;

  v3 = -[PKInk _isFountainPenInk](self, "_isFountainPenInk");
  if (v3)
    LOBYTE(v3) = -[PKInk requiredContentVersion](self, "requiredContentVersion") > PKContentVersion2;
  return v3;
}

- (BOOL)_isWatercolorInk
{
  void *v2;
  char v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.watercolor"));

  return v3;
}

- (BOOL)_isCrayonInk
{
  void *v2;
  char v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.crayon"));

  return v3;
}

- (BOOL)_isGenerationTool
{
  void *v2;
  char v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.generationtool"));

  return v3;
}

- (BOOL)_isCustomInk
{
  void *v2;
  char v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.custom"));

  return v3;
}

- (int64_t)inkFormatVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;

  -[PKInk identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ink.pen")))
    goto LABEL_8;
  -[PKInk identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ink.pencil")))
  {
LABEL_7:

LABEL_8:
    return 0;
  }
  -[PKInk identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ink.marker")))
  {
LABEL_6:

    goto LABEL_7;
  }
  -[PKInk identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ink.eraser")) & 1) != 0)
  {

    goto LABEL_6;
  }
  -[PKInk identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.ink.lasso"));

  if ((v9 & 1) != 0)
    return 0;
  -[PKInk identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ink.fountainpen")))
    goto LABEL_14;
  -[PKInk identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ink.watercolor")))
  {

LABEL_14:
    return 1;
  }
  -[PKInk identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.ink.monoline"));

  if ((v13 & 1) != 0)
    return 1;
  -[PKInk identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.crayon"));

  if (v15)
    return 2;
  else
    return 250;
}

- (PKContentVersion)requiredContentVersion
{
  int64_t v3;
  PKContentVersion result;

  v3 = -[PKInk _requiredContentVersionOverride](self, "_requiredContentVersionOverride");
  result = -[PKInk _requiredContentVersion](self, "_requiredContentVersion");
  if (v3 > result)
    return v3;
  return result;
}

- (id)identifierForArchiving
{
  void *v3;
  char v4;
  __CFString *v5;

  -[PKInk identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ink.monoline"));

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("com.apple.ink.pen");
  }
  else
  {
    -[PKInk identifier](self, "identifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)variantForArchiving
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;
  char v7;

  -[PKInk identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ink.monoline"));

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("fixed-width");
  }
  else
  {
    -[PKInk variant](self, "variant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("default"));

    if ((v7 & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[PKInk variant](self, "variant");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (id)properties
{
  id v3;
  CGColor *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[5];
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PKInk color](self, "color");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGColor *)objc_msgSend(v3, "CGColor");

  v22 = xmmword_1BE4FF118;
  v23 = unk_1BE4FF128;
  if (DKUColorGetRGBAComponents(v4, &v22))
  {
    v5 = v22;
    v6 = v23;
    v20[0] = CFSTR("PKInkColorProperty");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v22, CFSTR("PKInkRedComponentProperty"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v18[1] = CFSTR("PKInkGreenComponentProperty");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v5 + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v8;
    v18[2] = CFSTR("PKInkBlueComponentProperty");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v20[1] = CFSTR("PKInkWeightProperty");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[PKInk weight](self, "weight");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    v20[2] = CFSTR("PKInkOpacityProperty");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v6 + 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    v20[3] = CFSTR("PKInkVersionProperty");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKInk version](self, "version"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v14;
    v20[4] = CFSTR("PKInkVariantProperty");
    -[PKInk variant](self, "variant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (BOOL)_supportsCombiningStrokes
{
  void *v2;
  char v3;

  -[PKInk behavior](self, "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCombiningStrokes");

  return v3;
}

+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  double v7;
  PKInk *v8;

  v5 = a3;
  v6 = a4;
  +[PKInk defaultWeightForIdentifier:](PKInk, "defaultWeightForIdentifier:", v5);
  v8 = -[PKInk initWithIdentifier:color:version:variant:weight:]([PKInk alloc], "initWithIdentifier:color:version:variant:weight:", v5, v6, +[PKInk currentInkVersionForInkIdentifier:](PKInk, "currentInkVersionForInkIdentifier:", v5), 0, v7);

  return v8;
}

+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6
{
  id v9;
  id v10;
  id v11;
  double v12;
  PKInk *v13;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  +[PKInk defaultWeightForIdentifier:](PKInk, "defaultWeightForIdentifier:", v9);
  v13 = -[PKInk initWithIdentifier:color:version:variant:weight:]([PKInk alloc], "initWithIdentifier:color:version:variant:weight:", v9, v10, a5, v11, v12);

  return v13;
}

+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4 variant:(id)a5
{
  id v6;
  id v7;
  double v8;
  PKInk *v9;

  v6 = a3;
  v7 = a4;
  +[PKInk defaultWeightForIdentifier:](PKInk, "defaultWeightForIdentifier:", v6);
  v9 = -[PKInk initWithIdentifier:color:version:variant:weight:]([PKInk alloc], "initWithIdentifier:color:version:variant:weight:", v6, v7, 1, 0, v8);

  return v9;
}

- (PKInk)initWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKInk *v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[PKInk defaultWeightForIdentifier:](PKInk, "defaultWeightForIdentifier:", v10);
  v13 = -[PKInk initWithIdentifier:color:version:variant:weight:](self, "initWithIdentifier:color:version:variant:weight:", v10, v11, a5, v12);

  return v13;
}

- (PKInk)initWithBehavior:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  PKInk *v18;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[PKInkManager defaultInkManager](PKInkManager, "defaultInkManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addInkBehavior:forIdentifier:", v12, v16);

  objc_msgSend(v12, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PKInk initWithUncheckedIdentifier:color:version:variant:weight:](self, "initWithUncheckedIdentifier:color:version:variant:weight:", v17, v13, a5, v14, a7);

  return v18;
}

+ (id)inkFromDictionary:(id)a3 color:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  PKInk *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = +[PKInk currentInkVersionForInkIdentifier:](PKInk, "currentInkVersionForInkIdentifier:", v9);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%lu"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%lu.%@"), v9, v10, CFSTR("default"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkParser inkBehaviorFromDictionary:identifier:version:variant:]((uint64_t)PKInkParser, v7, v11, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKInk initWithIdentifier:color:version:variant:weight:behavior:]([PKInk alloc], "initWithIdentifier:color:version:variant:weight:behavior:", v9, v8, v10, CFSTR("default"), v13, -1.0);
  -[PKInk _setupRequiredContentVersion](v14, "_setupRequiredContentVersion");

  return v14;
}

+ (id)inkFromInk:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  PKInk *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  PKInk *v14;

  v5 = a3;
  v6 = a4;
  v7 = [PKInk alloc];
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "version");
  objc_msgSend(v5, "variant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "weight");
  v12 = v11;
  objc_msgSend(v5, "behavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKInk initWithIdentifier:color:version:variant:weight:behavior:](v7, "initWithIdentifier:color:version:variant:weight:behavior:", v8, v6, v9, v10, v13, v12);

  if (objc_msgSend(v5, "_shouldSaveRequiredContentVersionOverride"))
    -[PKInk set_requiredContentVersionOverride:](v14, "set_requiredContentVersionOverride:", objc_msgSend(v5, "_requiredContentVersionOverride"));
  -[PKInk set_weightIsUndefined:](v14, "set_weightIsUndefined:", objc_msgSend(v5, "_weightIsUndefined"));

  return v14;
}

+ (id)inkFromInk:(id)a3 weight:(double)a4
{
  id v5;
  PKInk *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PKInk *v12;

  v5 = a3;
  v6 = [PKInk alloc];
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "version");
  objc_msgSend(v5, "variant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKInk initWithIdentifier:color:version:variant:weight:behavior:](v6, "initWithIdentifier:color:version:variant:weight:behavior:", v7, v8, v9, v10, v11, a4);

  if (objc_msgSend(v5, "_shouldSaveRequiredContentVersionOverride"))
    -[PKInk set_requiredContentVersionOverride:](v12, "set_requiredContentVersionOverride:", objc_msgSend(v5, "_requiredContentVersionOverride"));
  -[PKInk set_weightIsUndefined:](v12, "set_weightIsUndefined:", objc_msgSend(v5, "_weightIsUndefined"));

  return v12;
}

- (PKInk)initWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7 behavior:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PKInk *v19;
  CGColor *ConvertedToSRGB;
  uint64_t v21;
  UIColor *color;
  NSObject *v23;
  uint64_t v24;
  UIColor *v25;
  uint64_t v26;
  NSString *variant;
  uint8_t v29[16];
  objc_super v30;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)PKInk;
  v19 = -[PKInk init](&v30, sel_init);
  if (v19)
  {
    if (v16)
    {
      ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB(objc_msgSend(objc_retainAutorelease(v16), "CGColor"));
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", ConvertedToSRGB);
      v21 = objc_claimAutoreleasedReturnValue();
      color = v19->_color;
      v19->_color = (UIColor *)v21;

      CGColorRelease(ConvertedToSRGB);
    }
    else
    {
      v23 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_fault_impl(&dword_1BE213000, v23, OS_LOG_TYPE_FAULT, "Ink must not be initialized with a nil color", v29, 2u);
      }

      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v19->_color;
      v19->_color = (UIColor *)v24;

    }
    objc_storeStrong((id *)&v19->_identifier, a3);
    v19->_version = a5;
    v26 = objc_msgSend(v17, "copy");
    variant = v19->_variant;
    v19->_variant = (NSString *)v26;

    objc_storeStrong((id *)&v19->_behavior, a8);
    v19->_weight = a7;
    -[PKInk _setupDefaultSixChannelAddAndMultiplyColors](v19, "_setupDefaultSixChannelAddAndMultiplyColors");
    -[PKInk set_requiredContentVersionOverride:](v19, "set_requiredContentVersionOverride:", -[PKInk _requiredContentVersion](v19, "_requiredContentVersion"));
  }

  return v19;
}

+ (id)inkFromInk:(id)a3 withBehavior:(id)a4
{
  return a3;
}

+ (void)_clearCachedInks
{
  +[PKInkManager clearCachedManager](PKInkManager, "clearCachedManager");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PKInk isEqualInk:](self, "isEqualInk:", v4);

  return v5;
}

- (unint64_t)hashValueForFloat:(double)a3
{
  unint64_t v3;
  unint64_t v4;

  v3 = vcvtmd_u64_f64(a3 * 1000.0);
  v4 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) >> 27));
  return v4 ^ (v4 >> 31);
}

- (BOOL)isEqualInk:(id)a3
{
  PKInk *v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = (PKInk *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[PKInk isEqualUnweightedInk:](self, "isEqualUnweightedInk:", v4))
  {
    -[PKInk weight](self, "weight");
    v6 = v5;
    -[PKInk weight](v4, "weight");
    v8 = floor(v6 * 1000.0) == floor(v7 * 1000.0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualUnweightedInk:(id)a3
{
  PKInk *v4;
  void *v5;
  void *v6;
  id v7;
  CGColor *v8;
  id v9;
  unint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  float32x4_t v26;
  float32x4_t v27;

  v4 = (PKInk *)a3;
  if (self == v4)
    goto LABEL_27;
  -[PKInk identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInk identifier](v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[PKInk color](self, "color");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (CGColor *)objc_msgSend(v7, "CGColor");
    -[PKInk color](v4, "color");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (!DKUColorIsEqualToColorIgnoringOpacity(v8, (CGColor *)objc_msgSend(v9, "CGColor"), 0))
      goto LABEL_17;
    v10 = -[PKInk version](self, "version");
    if (v10 != -[PKInk version](v4, "version"))
      goto LABEL_17;
    -[PKInk _sixChannelAddColor](self, "_sixChannelAddColor");
    v26 = v11;
    -[PKInk _sixChannelAddColor](v4, "_sixChannelAddColor");
    v13 = vsubq_f32(v26, v12);
    if (fabsf(v13.f32[0]) >= 0.01
      || fabsf(v13.f32[1]) >= 0.01
      || fabsf(v13.f32[2]) >= 0.01
      || fabsf(v13.f32[3]) >= 0.01
      || (-[PKInk _sixChannelMultiplyColor](self, "_sixChannelMultiplyColor"),
          v27 = v14,
          -[PKInk _sixChannelMultiplyColor](v4, "_sixChannelMultiplyColor"),
          v16 = vsubq_f32(v27, v15),
          fabsf(v16.f32[0]) >= 0.01)
      || fabsf(v16.f32[1]) >= 0.01
      || fabsf(v16.f32[2]) >= 0.01
      || fabsf(v16.f32[3]) >= 0.01)
    {
LABEL_17:
      v20 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v17 = -[PKInk _requiredContentVersionOverride](self, "_requiredContentVersionOverride");
    v18 = -[PKInk _requiredContentVersionOverride](v4, "_requiredContentVersionOverride");

    if (v17 != v18)
    {
      v20 = 0;
      goto LABEL_28;
    }
    -[PKInk variant](self, "variant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {

LABEL_22:
      -[PKInk variant](self, "variant");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKInk variant](v4, "variant");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v22;
      v24 = v23;
      if (v7 == v24)
      {
        v20 = 1;
        v9 = v7;
        v6 = v7;
      }
      else
      {
        v9 = v24;
        v20 = 0;
        if (v7 && v24)
          v20 = objc_msgSend(v7, "isEqualToString:", v24);
        v6 = v9;
      }
      v5 = v7;
      goto LABEL_18;
    }
    -[PKInk variant](v4, "variant");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      goto LABEL_22;
LABEL_27:
    v20 = 1;
    goto LABEL_28;
  }
  v20 = 0;
LABEL_19:

LABEL_28:
  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  unint64_t v11;
  unint64_t v12;

  -[PKInk identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PKInk color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = -[PKInk version](self, "version");
  -[PKInk variant](self, "variant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[PKInk weight](self, "weight");
  v11 = -[PKInk hashValueForFloat:](self, "hashValueForFloat:", v10 + 1.0);
  v12 = v6 ^ v4 ^ v7 ^ v9 ^ -[PKInk _requiredContentVersionOverride](self, "_requiredContentVersionOverride") ^ v11;

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInk identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInk color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInk variant](self, "variant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ %@ %@ %lu>"), v5, self, v6, v7, v8, -[PKInk version](self, "version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (double)defaultOpacityForIdentifier:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = 0.5;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ink.pencil")) & 1) == 0)
  {
    v4 = 1.0;
    if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ink.pen")) & 1) == 0)
    {
      if (objc_msgSend(v3, "isEqual:", CFSTR("com.apple.ink.marker")))
        v4 = 0.8;
      else
        v4 = 1.0;
    }
  }

  return v4;
}

- (BOOL)_shouldSaveSixChannelAddColor
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v5;

  v5 = *(float32x4_t *)self->_sixChannelAddColor;
  -[PKInk _defaultSixChannelAddColor](self, "_defaultSixChannelAddColor");
  v3 = vsubq_f32(v5, v2);
  return fabsf(v3.f32[0]) >= 0.01 || fabsf(v3.f32[1]) >= 0.01 || fabsf(v3.f32[2]) >= 0.01 || fabsf(v3.f32[3]) >= 0.01;
}

- (BOOL)_shouldSaveSixChannelMultiplyColor
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v5;

  v5 = *(float32x4_t *)self->_sixChannelMultiplyColor;
  -[PKInk _defaultSixChannelMultiplyColor](self, "_defaultSixChannelMultiplyColor");
  v3 = vsubq_f32(v5, v2);
  return fabsf(v3.f32[0]) >= 0.01 || fabsf(v3.f32[1]) >= 0.01 || fabsf(v3.f32[2]) >= 0.01 || fabsf(v3.f32[3]) >= 0.01;
}

- (BOOL)_shouldSaveRequiredContentVersionOverride
{
  int64_t v3;

  v3 = -[PKInk _requiredContentVersionOverride](self, "_requiredContentVersionOverride");
  return v3 > -[PKInk _requiredContentVersion](self, "_requiredContentVersion");
}

- (int64_t)_numPaintFramebuffers
{
  void *v2;
  void *v3;

  -[PKInk behavior](self, "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryParticleDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 2;
  else
    return 1;
}

- (unint64_t)particleRotation
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PKInk behavior](self, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "particleDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return self && -[PKInk _isFountainPenInkV2](self, "_isFountainPenInkV2");
  v5 = objc_msgSend(v4, "particleRotation");

  return v5;
}

- (double)_weight
{
  return self->_weight;
}

- (BOOL)_isStrokeGeneratingInk
{
  void *v2;
  int v3;

  -[PKInk identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.lasso")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.eraser")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.objectEraser")) & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.generationtool")) ^ 1;
  }

  return v3;
}

+ (id)colorForLassoStroke
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.466666667, 0.466666667, 0.466666667, 1.0);
}

- (void)_addTestDataToUnknownFields
{
  PKProtobufUnknownFields *v3;
  shared_ptr<PKProtobufUnknownFields> *p_unknownFields;
  PB::Writer **v5;
  PB::Writer **ptr;
  PB::Writer **v7;

  v3 = (PKProtobufUnknownFields *)operator new();
  PKProtobufUnknownFields::PKProtobufUnknownFields(v3);
  v7 = (PB::Writer **)v3;
  p_unknownFields = &self->_unknownFields;
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]<PKProtobufUnknownFields,std::default_delete<PKProtobufUnknownFields>,void>(p_unknownFields, (uint64_t *)&v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    std::unique_ptr<PB::Writer>::reset[abi:ne180100](v5, 0);
    MEMORY[0x1C3B7F770](v5, 0x1020C40EDED9539);
  }
  ptr = (PB::Writer **)p_unknownFields->__ptr_;
  arc4random_uniform(0x186A0u);
  PB::Writer::writeVarInt(*ptr);
}

- (id)_dataInUnknownFields
{
  PKProtobufUnknownFields *ptr;
  _QWORD *v3;
  void *v4;

  ptr = self->_unknownFields.__ptr_;
  if (ptr && (v3 = *(_QWORD **)ptr) != 0 && *v3 != v3[1])
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("identifier");
  -[PKInk identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = CFSTR("properties");
  -[PKInk properties](self, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_behavior, a3);
}

- (__n128)_sixChannelAddColor
{
  return a1[6];
}

- (void)set_sixChannelAddColor:(PKInk *)self
{
  __int128 v2;

  *(_OWORD *)self->_sixChannelAddColor = v2;
}

- (__n128)_sixChannelMultiplyColor
{
  return a1[7];
}

- (void)set_sixChannelMultiplyColor:(PKInk *)self
{
  __int128 v2;

  *(_OWORD *)self->_sixChannelMultiplyColor = v2;
}

- (BOOL)_weightIsUndefined
{
  return self->__weightIsUndefined;
}

- (void)set_weightIsUndefined:(BOOL)a3
{
  self->__weightIsUndefined = a3;
}

- (int64_t)_requiredContentVersionOverride
{
  return self->__requiredContentVersionOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cachedInkWithOriginalRequiredContentVersion, 0);
  std::shared_ptr<PKProtobufUnknownFields>::~shared_ptr[abi:ne180100]((uint64_t)&self->_unknownFields);
}

+ (id)identifierForCommandType:(unsigned int)a3 wantsObjectErase:(BOOL)a4
{
  __CFString *v4;
  void *v7;
  void *v8;
  NSObject *v9;
  _DWORD v10[4];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
  {
    v4 = CFSTR("com.apple.ink.eraser");
    if (a4)
      v4 = CFSTR("com.apple.ink.objectEraser");
    return v4;
  }
  else if (a3 > 4)
  {
    v9 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = a3;
      _os_log_error_impl(&dword_1BE213000, v9, OS_LOG_TYPE_ERROR, "Unknown command type for ink: %d", (uint8_t *)v10, 8u);
    }

    return CFSTR("com.apple.ink.pen");
  }
  else
  {
    v11[0] = CFSTR("com.apple.ink.pencil");
    v11[1] = CFSTR("com.apple.ink.pen");
    v11[2] = CFSTR("com.apple.ink.marker");
    v11[3] = CFSTR("com.apple.ink.eraser");
    v11[4] = CFSTR("com.apple.ink.lasso");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

- (id)_shadowModel
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  if (-[PKInk _isMonolineInk](self, "_isMonolineInk"))
  {
    v3 = CFSTR("Micron");
  }
  else
  {
    if (qword_1ECEE6628 != -1)
      dispatch_once(&qword_1ECEE6628, &__block_literal_global_95);
    v4 = (void *)_MergedGlobals_163;
    -[PKInk identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v7 = CFSTR("BallpointPen3");
    if (v6)
      v7 = v6;
    v3 = v7;

  }
  return v3;
}

uint64_t __34__PKInk_ShadowModel___shadowModel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_163;
  _MergedGlobals_163 = v0;

  objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("Highlighter"), CFSTR("com.apple.ink.marker"));
  objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("FountainV3Pen"), CFSTR("com.apple.ink.fountainpen"));
  objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("Crayon"), CFSTR("com.apple.ink.crayon"));
  objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("Eraser"), CFSTR("com.apple.ink.eraser"));
  objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("Eraser"), CFSTR("com.apple.ink.objectEraser"));
  objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("WatercolorPen1"), CFSTR("com.apple.ink.watercolor"));
  objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("SelectionTool"), CFSTR("com.apple.ink.lasso"));
  objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("BallpointPen3"), CFSTR("com.apple.ink.pen"));
  objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("BallpointPen3"), CFSTR("com.apple.ink.handwriting"));
  objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("Pencil"), CFSTR("com.apple.ink.pencil"));
  return objc_msgSend((id)_MergedGlobals_163, "setObject:forKeyedSubscript:", CFSTR("Wand"), CFSTR("com.apple.ink.generationtool"));
}

@end
