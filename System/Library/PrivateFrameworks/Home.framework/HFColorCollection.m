@implementation HFColorCollection

void __32__HFColorCollection_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_27);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_28_0);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED378C20;
  qword_1ED378C20 = v3;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_211 != -1)
    dispatch_once(&_MergedGlobals_211, &__block_literal_global_22);
  return (NAIdentity *)(id)qword_1ED378C20;
}

uint64_t __32__HFColorCollection_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "temperatureColor");
}

uint64_t __32__HFColorCollection_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "RGBColor");
}

- (HFTemperatureColor)temperatureColor
{
  HFTemperatureColor *v3;
  void *v4;
  char v5;
  void *v6;

  v3 = self->_temperatureColor;
  if (!v3)
  {
    -[HFColorCollection RGBColor](self, "RGBColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[HFColorCollection RGBColor](self, "RGBColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hf_temperatureColorRepresentation");
      v3 = (HFTemperatureColor *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (HFRGBColor)RGBColor
{
  HFRGBColor *v3;
  void *v4;

  v3 = self->_RGBColor;
  if (!v3)
  {
    -[HFColorCollection temperatureColor](self, "temperatureColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_RGBColorRepresentation");
    v3 = (HFRGBColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HFColorCollection)initWithPrimitiveColors:(id)a3
{
  id v5;
  HFColorCollection *v6;
  HFColorCollection *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id *p_RGBColor;
  void *v16;
  HFColorCollection *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFColorCollection.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primitiveColors.count > 0"));

  }
  v22.receiver = self;
  v22.super_class = (Class)HFColorCollection;
  v6 = -[HFColorCollection init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    v17 = v6;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (!v9)
      goto LABEL_20;
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v17->_RGBColor)
          {
            NSLog(CFSTR("Found multiple RGB colors in primitives %@! Picking the first one found."), v8);
            continue;
          }
          p_RGBColor = (id *)&v17->_RGBColor;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          if (v17->_temperatureColor)
          {
            NSLog(CFSTR("Found multiple temperature colors in primitives %@! Picking the first one found."), v8);
            continue;
          }
          p_RGBColor = (id *)&v17->_temperatureColor;
        }
        objc_storeStrong(p_RGBColor, v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (!v10)
      {
LABEL_20:

        v7 = v17;
        break;
      }
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temperatureColor, 0);
  objc_storeStrong((id *)&self->_RGBColor, 0);
}

- (id)colorPrimitives
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", self->_RGBColor);
  objc_msgSend(v3, "na_safeAddObject:", self->_temperatureColor);
  return v3;
}

- (HFColorPrimitive)preferredColorPrimitive
{
  void *temperatureColor;

  temperatureColor = self->_temperatureColor;
  if (!temperatureColor)
    temperatureColor = self->_RGBColor;
  return (HFColorPrimitive *)temperatureColor;
}

- (HFColorCollection)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPrimitiveColors_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFColorCollection.m"), 49, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFColorCollection init]",
    v5);

  return 0;
}

- (HFColorCollection)initWithPrimitiveColor:(id)a3
{
  void *v4;
  HFColorCollection *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFColorCollection initWithPrimitiveColors:](self, "initWithPrimitiveColors:", v4);

  return v5;
}

- (id)colorByAdjustingForProfile:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFColorCollection colorPrimitives](self, "colorPrimitives");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__HFColorCollection_colorByAdjustingForProfile___block_invoke;
  v11[3] = &unk_1EA727408;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_map:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithPrimitiveColors:", v8);

  return v9;
}

uint64_t __48__HFColorCollection_colorByAdjustingForProfile___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "adjustedColorPrimitiveForPrimitive:", a2);
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFColorCollection RGBColor](self, "RGBColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("RGBColor"));

  -[HFColorCollection temperatureColor](self, "temperatureColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("temperatureColor"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

@end
