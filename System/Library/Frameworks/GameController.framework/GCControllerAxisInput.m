@implementation GCControllerAxisInput

- (GCControllerAxisInput)initWithCollection:(id)a3 horizontal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  GCControllerAxisInput *v7;
  GCControllerAxisInput *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  _GCControllerAxisButtonInput *v14;
  GCControllerButtonInput *negative;
  _GCControllerAxisButtonInput *v16;
  GCControllerButtonInput *positive;
  objc_super v19;

  v4 = a4;
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GCControllerAxisInput;
  v7 = -[GCControllerElement init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    -[GCControllerElement setCollection:](v7, "setCollection:", v6);
    v8->_horizontal = v4;
    v9 = CFSTR("Y Axis");
    if (v4)
      v9 = CFSTR("X Axis");
    v10 = v9;
    v11 = objc_alloc((Class)&off_254DF2C58);
    objc_msgSend(v6, "primaryAlias");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithString:", v12);

    objc_msgSend(v13, "appendString:", CFSTR(" "));
    objc_msgSend(v13, "appendString:", v10);

    -[GCControllerElement setPrimaryAlias:](v8, "setPrimaryAlias:", v13);
    v14 = -[_GCControllerAxisButtonInput initWithAxis:positive:]([_GCControllerAxisButtonInput alloc], "initWithAxis:positive:", v8, 0);
    negative = v8->_negative;
    v8->_negative = &v14->super;

    v16 = -[_GCControllerAxisButtonInput initWithAxis:positive:]([_GCControllerAxisButtonInput alloc], "initWithAxis:positive:", v8, 1);
    positive = v8->_positive;
    v8->_positive = &v16->super;

    v8->_minValue = -1.0;
    v8->_maxValue = 1.0;

  }
  return v8;
}

- (GCControllerAxisInput)initWithCollection:(id)a3
{
  return -[GCControllerAxisInput initWithCollection:horizontal:](self, "initWithCollection:horizontal:", a3, 0);
}

- (void)setMinValue:(float)a3 andMaxValue:(float)a4
{
  if (a3 < a4)
  {
    self->_minValue = a3;
    self->_maxValue = a4;
  }
}

- (float)minValue
{
  return self->_minValue;
}

- (float)maxValue
{
  return self->_maxValue;
}

- (id)description
{
  void *v3;
  float v4;
  void *v5;

  -[GCControllerElement primaryAlias](self, "primaryAlias");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerAxisInput value](self, "value");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@ (%+.3f)"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerAxisInput description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAnalog
{
  void *v2;
  char v3;

  -[GCControllerElement collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnalog");

  return v3;
}

- (BOOL)_setValue:(float)a3
{
  return -[GCControllerAxisInput _setValue:queue:](self, "_setValue:queue:", MEMORY[0x24BDAC9B8]);
}

- (BOOL)_setValue:(float)a3 queue:(id)a4
{
  id v6;
  GCControllerAxisInput *v7;
  NSObject *v8;
  float value;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  double v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  double v24;
  double v25;
  void *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  _BYTE v34[24];
  void *v35;
  NSObject *v36;
  id v37;
  GCControllerAxisInput *v38;
  id v39;
  os_signpost_id_t v40;
  uint64_t v41;
  float v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = self;
  v8 = v6;
  value = v7->_value;
  if (value != a3)
  {
    getGCSignpostLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    -[GCControllerElement primaryAlias](v7, "primaryAlias");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement device](v7, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "physicalInputProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastEventTimestamp");
    v15 = v14;

    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)v34 = 138412546;
      *(_QWORD *)&v34[4] = v11;
      *(_WORD *)&v34[12] = 2048;
      *(_QWORD *)&v34[14] = v15;
      _os_signpost_emit_with_name_impl(&dword_215181000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Axis Value Updated", "%@, receiveTimestamp=%f", v34, 0x16u);
    }
    -[GCControllerAxisInput minValue](v7, "minValue");
    v17 = v16;
    -[GCControllerAxisInput maxValue](v7, "maxValue");
    v19 = clamp(a3, v17, v18);
    v7->_value = v19;
    -[GCControllerAxisInput minValue](v7, "minValue");
    v21 = v20;
    -[GCControllerAxisInput maxValue](v7, "maxValue");
    v23 = (float)((float)-(float)(v22 - (float)(a3 * 2.0)) - v21) / (float)(v22 - v21);
    *(float *)&v24 = v23;
    -[GCControllerButtonInput _setValue:queue:](v7->_negative, "_setValue:queue:", v8, v24);
    *(float *)&v25 = v23;
    -[GCControllerButtonInput _setValue:queue:](v7->_positive, "_setValue:queue:", v8, v25);
    v26 = (void *)MEMORY[0x2199DEBB0](v7->_valueChangedHandler);
    if (v26)
    {
      v27 = os_signpost_id_generate(v10);
      v28 = v10;
      v29 = v28;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_DWORD *)v34 = 138412546;
        *(_QWORD *)&v34[4] = v11;
        *(_WORD *)&v34[12] = 2048;
        *(_QWORD *)&v34[14] = v15;
        _os_signpost_emit_with_name_impl(&dword_215181000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "Axis Value Change Callback", "%@, receiveTimestamp=%f", v34, 0x16u);
      }

      *(_QWORD *)v34 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v34[8] = 3221225472;
      *(_QWORD *)&v34[16] = __ControllerAxisInputSetValue_block_invoke;
      v35 = &unk_24D2B3160;
      v36 = v29;
      v40 = v27;
      v37 = v11;
      v41 = v15;
      v30 = v26;
      v38 = v7;
      v39 = v30;
      v42 = a3;
      dispatch_async(v8, v34);

    }
    -[GCControllerElement collection](v7, "collection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[GCControllerElement collection](v7, "collection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_fireValueChangedWithQueue:", v8);

    }
  }

  return value != a3;
}

- (float)value
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  getGCSignpostLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    -[GCControllerElement primaryAlias](self, "primaryAlias");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "physicalInputProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastEventTimestamp");
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = v7;
    _os_signpost_emit_with_name_impl(&dword_215181000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Axis Value Read", "%@, receiveTimestamp=%f", (uint8_t *)&v9, 0x16u);

  }
  return self->_value;
}

- (int)getAndResetTimesPressed
{
  int v3;

  v3 = -[GCControllerButtonInput getAndResetTimesPressed](self->_positive, "getAndResetTimesPressed");
  return -[GCControllerButtonInput getAndResetTimesPressed](self->_negative, "getAndResetTimesPressed") + v3;
}

- (void)setValue:(float)value
{
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  id v9;
  GCControllerAxisInput *v10;
  double v11;
  void *v12;

  -[GCControllerElement device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = v12;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_9;
    v7 = objc_msgSend(v12, "isSnapshot");
    v6 = v12;
    if ((v7 & 1) == 0)
      goto LABEL_9;
    objc_msgSend(v12, "handlerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDAC9B8];
    v9 = MEMORY[0x24BDAC9B8];
  }
  v10 = self;
  *(float *)&v11 = value;
  if (-[GCControllerAxisInput _setValue:queue:](v10, "_setValue:queue:", v8, v11))
    objc_msgSend(0, "addObject:", v10);

  v6 = v12;
LABEL_9:

}

- (id)localizedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[GCControllerElement nameLocalizationKey](self, "nameLocalizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GCControllerElement nameLocalizationKey](self, "nameLocalizationKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _GCFConvertStringToLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement collection](self, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GCControllerAxisInput;
    -[GCControllerElement localizedName](&v10, sel_localizedName);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)unmappedLocalizedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[GCControllerElement unmappedNameLocalizationKey](self, "unmappedNameLocalizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GCControllerElement unmappedNameLocalizationKey](self, "unmappedNameLocalizationKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _GCFConvertStringToLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement collection](self, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unmappedLocalizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GCControllerAxisInput;
    -[GCControllerElement unmappedLocalizedName](&v10, sel_unmappedLocalizedName);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (GCControllerAxisValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCControllerAxisValueChangedHandler)valueChangedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, valueChangedHandler, 128);
}

- (BOOL)isHorizontal
{
  return self->_horizontal;
}

- (void)setHorizontal:(BOOL)a3
{
  self->_horizontal = a3;
}

- (GCControllerButtonInput)positive
{
  return self->_positive;
}

- (void)setPositive:(id)a3
{
  objc_storeStrong((id *)&self->_positive, a3);
}

- (GCControllerButtonInput)negative
{
  return self->_negative;
}

- (void)setNegative:(id)a3
{
  objc_storeStrong((id *)&self->_negative, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negative, 0);
  objc_storeStrong((id *)&self->_positive, 0);
  objc_storeStrong(&self->_valueChangedHandler, 0);
}

@end
