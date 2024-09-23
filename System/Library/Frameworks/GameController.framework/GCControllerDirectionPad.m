@implementation GCControllerDirectionPad

- (GCControllerDirectionPad)initWithDigital:(BOOL)a3
{
  return -[GCControllerDirectionPad initWithDigital:descriptionName:](self, "initWithDigital:descriptionName:", a3, 0);
}

- (GCControllerDirectionPad)initWithDigital:(BOOL)a3 descriptionName:(id)a4
{
  id v6;
  GCControllerDirectionPad *v7;
  GCControllerDirectionPad *v8;
  void *v9;
  GCControllerAxisInput *v10;
  GCControllerAxisInput *xAxis;
  GCControllerAxisInput *v12;
  GCControllerAxisInput *yAxis;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GCControllerDirectionPad;
  v7 = -[GCControllerElement init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_nonAnalog = a3;
    if (v6)
    {
      v9 = (void *)objc_msgSend(v6, "copy");
      -[GCControllerElement setPrimaryAlias:](v8, "setPrimaryAlias:", v9);

    }
    else
    {
      -[GCControllerElement setPrimaryAlias:](v7, "setPrimaryAlias:", CFSTR("Direction Pad"));
    }
    v10 = -[GCControllerAxisInput initWithCollection:horizontal:]([GCControllerAxisInput alloc], "initWithCollection:horizontal:", v8, 1);
    xAxis = v8->_xAxis;
    v8->_xAxis = v10;

    v12 = -[GCControllerAxisInput initWithCollection:horizontal:]([GCControllerAxisInput alloc], "initWithCollection:horizontal:", v8, 0);
    yAxis = v8->_yAxis;
    v8->_yAxis = v12;

    v8->_wasZeroed = 1;
    v8->_timesPressed = 0;
  }

  return v8;
}

- (void)_fireValueChanged
{
  -[GCControllerDirectionPad _fireValueChangedWithQueue:](self, "_fireValueChangedWithQueue:", MEMORY[0x24BDAC9B8]);
}

- (void)_fireValueChangedWithQueue:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  void *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  GCControllerDirectionPad *v19;
  _BOOL4 v20;
  _QWORD block[4];
  NSObject *v22;
  id v23;
  GCControllerDirectionPad *v24;
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  float v28;
  float v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getGCSignpostLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  -[GCControllerElement primaryAlias](self, "primaryAlias");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerElement device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "physicalInputProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastEventTimestamp");
  v10 = v9;

  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v6;
    v32 = 2048;
    v33 = v10;
    _os_signpost_emit_with_name_impl(&dword_215181000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DPad Value Updated", "%@, receiveTimestamp=%f", buf, 0x16u);
  }
  -[GCControllerAxisInput value](self->_xAxis, "value");
  v12 = v11;
  -[GCControllerAxisInput value](self->_yAxis, "value");
  v14 = v13;
  v15 = (void *)MEMORY[0x2199DEBB0](self->_valueChangedHandler);
  if (v15)
  {
    v16 = os_signpost_id_generate(v5);
    v17 = v5;
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v6;
      v32 = 2048;
      v33 = v10;
      _os_signpost_emit_with_name_impl(&dword_215181000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "DPad Value Change Callback", "%@, receiveTimestamp=%f", buf, 0x16u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__GCControllerDirectionPad__fireValueChangedWithQueue___block_invoke;
    block[3] = &unk_24D2B3DB8;
    v22 = v18;
    v26 = v16;
    v23 = v6;
    v27 = v10;
    v24 = self;
    v25 = v15;
    v28 = v12;
    v29 = v14;
    dispatch_async(v4, block);

  }
  v19 = self;
  v20 = fabsf(v12) > 0.0019531;
  if (fabsf(v14) > 0.0019531)
    v20 = 1;
  if (v19->_wasZeroed && v20)
  {
    ++v19->_timesPressed;
    v19->_wasZeroed = 0;
  }
  if (!v20)
    v19->_wasZeroed = 1;

}

uint64_t __55__GCControllerDirectionPad__fireValueChangedWithQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 72);
    v8 = 138412546;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    _os_signpost_emit_with_name_impl(&dword_215181000, v3, OS_SIGNPOST_INTERVAL_END, v4, "DPad Value Change Callback", "%@, receiveTimestamp=%f", (uint8_t *)&v8, 0x16u);
  }

  return (*(uint64_t (**)(float, float))(*(_QWORD *)(a1 + 56) + 16))(*(float *)(a1 + 80), *(float *)(a1 + 84));
}

- (BOOL)isAnalog
{
  return !self->_nonAnalog;
}

- (id)description
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  float v8;
  void *v9;

  -[GCControllerElement primaryAlias](self, "primaryAlias");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerDirectionPad xAxis](self, "xAxis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = v5;
  -[GCControllerDirectionPad yAxis](self, "yAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@ (x: %+.3f, y: %+.3f)"), v3, *(_QWORD *)&v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  -[GCControllerDirectionPad description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GCControllerButtonInput)up
{
  return -[GCControllerAxisInput positive](self->_yAxis, "positive");
}

- (GCControllerButtonInput)down
{
  return -[GCControllerAxisInput negative](self->_yAxis, "negative");
}

- (GCControllerButtonInput)left
{
  return -[GCControllerAxisInput negative](self->_xAxis, "negative");
}

- (GCControllerButtonInput)right
{
  return -[GCControllerAxisInput positive](self->_xAxis, "positive");
}

- (BOOL)_commitPendingValueOnQueue:(id)a3
{
  GCControllerDirectionPad *v3;
  GCControllerAxisInput *xAxis;
  id v5;

  v3 = self;
  xAxis = self->_xAxis;
  v5 = a3;
  LOBYTE(xAxis) = -[GCControllerElement _commitPendingValueOnQueue:](xAxis, "_commitPendingValueOnQueue:", v5);
  LOBYTE(v3) = -[GCControllerElement _commitPendingValueOnQueue:](v3->_yAxis, "_commitPendingValueOnQueue:", v5);

  return xAxis | v3;
}

- (void)setValueForXAxis:(float)xAxis yAxis:(float)yAxis
{
  char isKindOfClass;
  void *v8;
  char v9;
  void *v10;
  id v11;
  GCControllerDirectionPad *v12;
  id v13;
  void *v14;
  double v15;
  char v16;
  void *v17;
  double v18;
  int v19;
  void *v20;

  -[GCControllerElement device](self, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = v20;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_10;
    v9 = objc_msgSend(v20, "isSnapshot");
    v8 = v20;
    if ((v9 & 1) == 0)
      goto LABEL_10;
    objc_msgSend(v20, "handlerQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDAC9B8];
    v11 = MEMORY[0x24BDAC9B8];
  }
  v12 = self;
  v13 = v10;
  -[GCControllerDirectionPad xAxis](v12, "xAxis");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = xAxis;
  v16 = objc_msgSend(v14, "_setValue:queue:", v13, v15);

  -[GCControllerDirectionPad yAxis](v12, "yAxis");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = yAxis;
  v19 = objc_msgSend(v17, "_setValue:queue:", v13, v18);

  if ((v16 & 1) != 0 || v19)
    objc_msgSend(0, "addObject:", v12);

  v8 = v20;
LABEL_10:

}

- (int)getAndResetTimesPressed
{
  int timesPressed;

  timesPressed = self->_timesPressed;
  self->_timesPressed = 0;
  return timesPressed;
}

- (void)setUnmappedLocalizedName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)GCControllerDirectionPad;
  -[GCControllerElement setUnmappedLocalizedName:](&v29, sel_setUnmappedLocalizedName_, a3);
  -[GCControllerElement unmappedLocalizedName](self, "unmappedLocalizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _GCFConvertStringToLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement unmappedLocalizedName](self, "unmappedLocalizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerDirectionPad up](self, "up");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnmappedLocalizedName:", v7);

    _GCFConvertStringToLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement unmappedLocalizedName](self, "unmappedLocalizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerDirectionPad down](self, "down");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUnmappedLocalizedName:", v11);

    _GCFConvertStringToLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement unmappedLocalizedName](self, "unmappedLocalizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerDirectionPad left](self, "left");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUnmappedLocalizedName:", v15);

    _GCFConvertStringToLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement unmappedLocalizedName](self, "unmappedLocalizedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerDirectionPad right](self, "right");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUnmappedLocalizedName:", v19);

    _GCFConvertStringToLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement unmappedLocalizedName](self, "unmappedLocalizedName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerDirectionPad xAxis](self, "xAxis");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUnmappedLocalizedName:", v23);

    _GCFConvertStringToLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement unmappedLocalizedName](self, "unmappedLocalizedName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerDirectionPad yAxis](self, "yAxis");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setUnmappedLocalizedName:", v27);

  }
}

- (void)setUnmappedNameLocalizationKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GCControllerDirectionPad;
  -[GCControllerElement setUnmappedNameLocalizationKey:](&v11, sel_setUnmappedNameLocalizationKey_, a3);
  -[GCControllerElement unmappedNameLocalizationKey](self, "unmappedNameLocalizationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GCControllerDirectionPad up](self, "up");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUnmappedNameLocalizationKey:", CFSTR("DIRECTION_PAD_UP"));

    -[GCControllerDirectionPad down](self, "down");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUnmappedNameLocalizationKey:", CFSTR("DIRECTION_PAD_DOWN"));

    -[GCControllerDirectionPad left](self, "left");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUnmappedNameLocalizationKey:", CFSTR("DIRECTION_PAD_LEFT"));

    -[GCControllerDirectionPad right](self, "right");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnmappedNameLocalizationKey:", CFSTR("DIRECTION_PAD_RIGHT"));

    -[GCControllerDirectionPad xAxis](self, "xAxis");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnmappedNameLocalizationKey:", CFSTR("DIRECTION_PAD_X_AXIS"));

    -[GCControllerDirectionPad yAxis](self, "yAxis");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUnmappedNameLocalizationKey:", CFSTR("DIRECTION_PAD_Y_AXIS"));

  }
}

- (GCControllerDirectionPadValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCControllerDirectionPadValueChangedHandler)valueChangedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, valueChangedHandler, 128);
}

- (GCControllerAxisInput)xAxis
{
  return self->_xAxis;
}

- (void)setXAxis:(id)a3
{
  objc_storeStrong((id *)&self->_xAxis, a3);
}

- (GCControllerAxisInput)yAxis
{
  return self->_yAxis;
}

- (void)setYAxis:(id)a3
{
  objc_storeStrong((id *)&self->_yAxis, a3);
}

- (BOOL)nonAnalog
{
  return self->_nonAnalog;
}

- (void)setNonAnalog:(BOOL)a3
{
  self->_nonAnalog = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yAxis, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);
  objc_storeStrong(&self->_valueChangedHandler, 0);
}

@end
