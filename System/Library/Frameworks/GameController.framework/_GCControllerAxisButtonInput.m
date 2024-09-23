@implementation _GCControllerAxisButtonInput

- (_GCControllerAxisButtonInput)initWithAxis:(id)a3 positive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _GCControllerAxisButtonInput *v7;
  _GCControllerAxisButtonInput *v8;
  void *v9;
  void *v10;
  int v11;
  __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  void *v15;
  objc_super v17;

  v4 = a4;
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_GCControllerAxisButtonInput;
  v7 = -[GCControllerElement init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_axis, v6);
    v8->_positive = v4;
    objc_msgSend(v6, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryAlias");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v6, "isHorizontal");
    v12 = CFSTR("Down");
    if (v4)
      v12 = CFSTR("Up");
    v13 = CFSTR("Right");
    if (!v4)
      v13 = CFSTR("Left");
    if (v11)
      v12 = (__CFString *)v13;
    v14 = v12;
    v15 = (void *)objc_msgSend(objc_alloc((Class)&off_254DF2C58), "initWithString:", v10);
    objc_msgSend(v15, "appendString:", CFSTR(" "));
    objc_msgSend(v15, "appendString:", v14);
    -[GCControllerElement setPrimaryAlias:](v8, "setPrimaryAlias:", v15);

  }
  return v8;
}

- (id)collection
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_axis);
  objc_msgSend(WeakRetained, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAnalog
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_axis);
  v3 = objc_msgSend(WeakRetained, "isAnalog");

  return v3;
}

- (BOOL)_setValueFromAxisButton:(float)a3
{
  return -[_GCControllerAxisButtonInput _setValueFromAxisButton:queue:](self, "_setValueFromAxisButton:queue:", MEMORY[0x24BDAC9B8]);
}

- (BOOL)_setValueFromAxisButton:(float)a3 queue:(id)a4
{
  _BOOL4 positive;
  GCControllerAxisInput **p_axis;
  id v7;
  id WeakRetained;
  void *v9;
  double v10;
  char v11;

  positive = self->_positive;
  p_axis = &self->_axis;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_axis);
  v9 = WeakRetained;
  *(float *)&v10 = -a3;
  if (positive)
    *(float *)&v10 = a3;
  v11 = objc_msgSend(WeakRetained, "_setValue:queue:", v7, v10);

  return v11;
}

- (void)_setPendingValue:(float)a3
{
  float v4;
  float v5;
  GCControllerAxisInput **p_axis;
  id WeakRetained;
  char v8;
  id v9;
  float v10;
  float v11;
  double v12;
  id v13;
  double v14;
  id v15;

  v4 = -a3;
  if (self->_positive)
    v5 = a3;
  else
    v5 = v4;
  p_axis = &self->_axis;
  WeakRetained = objc_loadWeakRetained((id *)&self->_axis);
  v8 = objc_msgSend(WeakRetained, "updatePending");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_axis);
    objc_msgSend(v9, "pendingValue");
    v11 = fabsf(v10);

    if (fabsf(a3) <= v11)
      return;
    v15 = objc_loadWeakRetained((id *)p_axis);
    *(float *)&v12 = v5;
    objc_msgSend(v15, "setPendingValue:", v12);
  }
  else
  {
    v13 = objc_loadWeakRetained((id *)p_axis);
    *(float *)&v14 = v5;
    objc_msgSend(v13, "setPendingValue:", v14);

    v15 = objc_loadWeakRetained((id *)p_axis);
    objc_msgSend(v15, "setUpdatePending:", 1);
  }

}

- (BOOL)_commitPendingValueOnQueue:(id)a3
{
  GCControllerAxisInput **p_axis;
  id v4;
  id WeakRetained;
  char v6;

  p_axis = &self->_axis;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_axis);
  v6 = objc_msgSend(WeakRetained, "_commitPendingValueOnQueue:", v4);

  return v6;
}

- (BOOL)_setValue:(float)a3
{
  return -[_GCControllerAxisButtonInput _setValue:queue:](self, "_setValue:queue:", MEMORY[0x24BDAC9B8]);
}

- (BOOL)_setValue:(float)a3 queue:(id)a4
{
  double v5;
  objc_super v6;
  objc_super v7;

  if (self->_positive)
    return -[GCControllerButtonInput _setValue:queue:](&v7, sel__setValue_queue_, a4, *(double *)&a3, v6.receiver, v6.super_class, self, _GCControllerAxisButtonInput);
  *(float *)&v5 = -a3;
  return -[GCControllerButtonInput _setValue:queue:](&v6, sel__setValue_queue_, a4, v5, self, _GCControllerAxisButtonInput, v7.receiver, v7.super_class);
}

- (float)value
{
  _BOOL4 positive;
  id WeakRetained;
  float v4;
  float v5;

  positive = self->_positive;
  WeakRetained = objc_loadWeakRetained((id *)&self->_axis);
  objc_msgSend(WeakRetained, "value");
  if (positive)
    v5 = v4;
  else
    v5 = -v4;

  return fmaxf(v5, 0.0);
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
    -[_GCControllerAxisButtonInput collection](self, "collection");
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
    v10.super_class = (Class)_GCControllerAxisButtonInput;
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
    -[_GCControllerAxisButtonInput collection](self, "collection");
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
    v10.super_class = (Class)_GCControllerAxisButtonInput;
    -[GCControllerElement unmappedLocalizedName](&v10, sel_unmappedLocalizedName);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (GCControllerAxisInput)axis
{
  return (GCControllerAxisInput *)objc_loadWeakRetained((id *)&self->_axis);
}

- (void)setAxis:(id)a3
{
  objc_storeWeak((id *)&self->_axis, a3);
}

- (BOOL)isPositive
{
  return self->_positive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_axis);
}

@end
