@implementation HFColorControlItem

void __33__HFColorControlItem_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__HFColorControlItem_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __33__HFColorControlItem_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED379D60;
  qword_1ED379D60 = v1;

}

id __33__HFColorControlItem_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___HFColorControlItem;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_111_1);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__HFColorControlItem_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __33__HFColorControlItem_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __33__HFColorControlItem_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HFColorControlItem_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (qword_1ED379D58 != -1)
    dispatch_once(&qword_1ED379D58, block);
  return (id)qword_1ED379D60;
}

- (BOOL)supportsItemRepresentingServices:(id)a3
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_18_7);
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HFColorControlItem;
  -[HFControlItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__HFColorControlItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1EA72AF60;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

BOOL __57__HFColorControlItem_initWithValueSource_displayResults___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "allCharacteristicsForCharacteristicType:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

uint64_t __33__HFColorControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "supportsNaturalLighting"));
}

- (BOOL)supportsNaturalLighting
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[HFControlItem valueSource](self, "valueSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F03F48D8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "isNaturalLightingSupported");
  return v5;
}

- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "responseForCharacteristicType:aggregationPolicy:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFColorControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HFControlItemCharacteristicOptions *v11;
  void *v12;
  HFControlItemCharacteristicOptions *v13;
  HFColorControlItem *v14;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "colorCharacteristicTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__HFColorControlItem_initWithValueSource_displayResults___block_invoke;
  v17[3] = &unk_1EA726EA8;
  v18 = v6;
  v9 = v6;
  objc_msgSend(v8, "na_filter:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [HFControlItemCharacteristicOptions alloc];
  v19 = &unk_1EA7CD318;
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](v11, "initWithCharacteristicTypesByUsage:", v12);

  v16.receiver = self;
  v16.super_class = (Class)HFColorControlItem;
  v14 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v16, sel_initWithValueSource_characteristicOptions_displayResults_, v9, v13, v7);

  return v14;
}

+ (id)colorCharacteristicTypes
{
  if (_MergedGlobals_316 != -1)
    dispatch_once(&_MergedGlobals_316, &__block_literal_global_3_17);
  return (id)qword_1ED379D40;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (-[HFColorControlItem canCopyWithCharacteristicOptions:](self, "canCopyWithCharacteristicOptions:", a3))
  {
    v7 = objc_alloc((Class)objc_opt_class());
    -[HFControlItem displayResults](self, "displayResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithValueSource:displayResults:", v6, v8);

    objc_msgSend(v9, "copyLatestResultsFromItem:", self);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

uint64_t __55__HFColorControlItem_supportsItemRepresentingServices___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "hf_characteristicOfType:", *MEMORY[0x1E0CB88E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "hf_characteristicOfType:", *MEMORY[0x1E0CB8A00]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(v2, "hf_characteristicOfType:", *MEMORY[0x1E0CB8810]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 1;
  else
    v7 = v5;

  return v7;
}

id __50__HFColorControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "naturalLightingEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("naturalLightEnabled"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(WeakRetained, "valueSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F03F48D8))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "lightProfiles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unionSet:", v12);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("dependentHomeKitObjects"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)naturalLightingEnabled
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[HFControlItem valueSource](self, "valueSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F03F48D8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "isNaturalLightingEnabled");
  return v5;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, _QWORD, float);
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  HFRGBColor *v14;
  int v15;
  int v16;
  int v17;
  double v18;
  double v19;
  double v20;
  HFRGBColor *v21;
  void *v22;
  HFTemperatureColor *v23;
  HFTemperatureColor *v24;
  float v25;
  float v26;
  float v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  HFColorCollection *v31;
  NSObject *v32;
  uint64_t v33;
  id v35;
  void *v36;
  _QWORD aBlock[4];
  id v38;
  HFColorControlItem *v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HFColorControlItem_valueForCharacteristicValues___block_invoke;
  aBlock[3] = &unk_1EA73E868;
  v5 = v4;
  v38 = v5;
  v39 = self;
  v6 = (void (**)(void *, _QWORD, float))_Block_copy(aBlock);
  v6[2](v6, *MEMORY[0x1E0CB88E8], 360.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, *MEMORY[0x1E0CB8A00], 100.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB8810];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8810]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem normalizedValueForCharacteristicValue:ofType:](self, "normalizedValueForCharacteristicValue:ofType:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v13 = v8 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v21 = 0;
    if (!v11)
      goto LABEL_14;
  }
  else
  {
    v14 = [HFRGBColor alloc];
    objc_msgSend(v7, "floatValue");
    v16 = v15;
    objc_msgSend(v8, "floatValue");
    LODWORD(v18) = v17;
    LODWORD(v19) = 1.0;
    LODWORD(v20) = v16;
    v21 = -[HFRGBColor initWithHue:saturation:brightness:](v14, "initWithHue:saturation:brightness:", v20, v18, v19);
    objc_msgSend(v12, "addObject:", v21);
    if (!v11)
      goto LABEL_14;
  }
  v36 = v8;
  -[HFColorControlItem colorProfile](self, "colorProfile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = [HFTemperatureColor alloc];
  objc_msgSend(v11, "floatValue");
  v24 = -[HFTemperatureColor initWithTemperatureInMired:](v23, "initWithTemperatureInMired:");
  if (!v21)
    goto LABEL_12;
  objc_msgSend(v11, "floatValue");
  v26 = v25;
  objc_msgSend(v22, "minimumTemperature");
  if (v26 != v27)
    goto LABEL_12;
  -[HFTemperatureColor hf_RGBColorRepresentation](v24, "hf_RGBColorRepresentation");
  v35 = v5;
  v28 = v7;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HFRGBColor isEqual:](v21, "isEqual:", v29);

  v7 = v28;
  v5 = v35;
  if (v30)
LABEL_12:
    objc_msgSend(v12, "addObject:", v24);

  v8 = v36;
LABEL_14:
  if (objc_msgSend(v12, "count"))
  {
    v31 = -[HFColorCollection initWithPrimitiveColors:]([HFColorCollection alloc], "initWithPrimitiveColors:", v12);
  }
  else
  {
    HFLogForCategory(0x38uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v41 = v33;
      v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_1DD34E000, v32, OS_LOG_TYPE_DEFAULT, "%@ couldn't find any color primitives in the characteristics: %@", buf, 0x16u);
    }

    v31 = 0;
  }

  return v31;
}

id __51__HFColorControlItem_valueForCharacteristicValues___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "normalizedValueForCharacteristicValue:ofType:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "floatValue");
    *(float *)&v10 = v9 / a3;
    objc_msgSend(v8, "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __46__HFColorControlItem_colorCharacteristicTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8A00];
  v5[0] = *MEMORY[0x1E0CB88E8];
  v5[1] = v1;
  v5[2] = *MEMORY[0x1E0CB8810];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379D40;
  qword_1ED379D40 = v3;

}

- (HFColorControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFColorControlItem.m"), 64, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFColorControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (BOOL)supportsRGBColor
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  if (qword_1ED379D48 != -1)
    dispatch_once(&qword_1ED379D48, &__block_literal_global_20_9);
  v3 = (id)qword_1ED379D50;
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicTypesForUsage:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isSubsetOfSet:", v5);

  return v6;
}

void __38__HFColorControlItem_supportsRGBColor__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB88E8], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379D50;
  qword_1ED379D50 = v0;

}

- (HFColorProfile)colorProfile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  HFTemperatureColorProfile *v12;
  double v13;
  double v14;
  HFTemperatureColorProfile *v15;

  -[HFControlItem metadataForCharacteristicType:](self, "metadataForCharacteristicType:", *MEMORY[0x1E0CB8810]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "minimumValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      v4 = &unk_1EA7CD330;
    objc_msgSend(v4, "floatValue");
    v7 = v6;

    objc_msgSend(v3, "maximumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v8 = &unk_1EA7CD348;
    objc_msgSend(v8, "floatValue");
    v11 = v10;

    v12 = [HFTemperatureColorProfile alloc];
    LODWORD(v13) = v7;
    LODWORD(v14) = v11;
    v15 = -[HFTemperatureColorProfile initWithMinimumTemperature:maximumTemperature:](v12, "initWithMinimumTemperature:maximumTemperature:", v13, v14);
  }
  else
  {
    v15 = 0;
  }

  return (HFColorProfile *)v15;
}

- (void)_logForNaturalLightUserStudy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    objc_opt_class();
    -[HFControlItem valueSource](self, "valueSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_opt_class();
    objc_msgSend(v7, "valueSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "originalValueSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[HFControlItem valueSource](self, "valueSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allServices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "anyObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      HFLogForCategory(0x44uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412802;
        v18 = v15;
        v19 = 2112;
        v20 = v4;
        v21 = 2112;
        v22 = objc_opt_class();
        _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "User changed color for light \"%@\". Value: \"%@\". Value Source: %@", (uint8_t *)&v17, 0x20u);
      }

    }
  }

}

- (id)writeValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "temperatureColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "RGBColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v8, "valueDescriptionInKelvin");
  else
    objc_msgSend(v9, "valueDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFColorControlItem _logForNaturalLightUserStudy:](self, "_logForNaturalLightUserStudy:", v11);

  if (v7)
  {
    -[HFColorControlItem setNaturalLightingEnabled:](self, "setNaturalLightingEnabled:", 0);
    v14.receiver = self;
    v14.super_class = (Class)HFColorControlItem;
    -[HFControlItem writeValue:](&v14, sel_writeValue_, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      NSLog(CFSTR("Attempting to write a natural light color!"));
    else
      NSLog(CFSTR("Unknown color value: %@"), v5);
    v12 = 0;
  }

  return v12;
}

- (id)normalizedValueForValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    NSLog(CFSTR("Attempting to normalize a natural light color!"));
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HFColorControlItem;
    -[HFControlItem normalizedValueForValue:](&v8, sel_normalizedValueForValue_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "characteristicTypesForUsage:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB8810];
  v11 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0CB8810]);

  v12 = -[HFColorControlItem supportsRGBColor](self, "supportsRGBColor");
  objc_msgSend(v7, "preferredColorPrimitive");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass() & v11;

  if ((v14 & 1) != 0 || v12)
  {
    if (v14)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(v7, "temperatureColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
LABEL_7:
      v35 = v10;
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "temperatureColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "temperatureInMired");
      objc_msgSend(v16, "numberWithFloat:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFControlItem normalizedCharacteristicValuesForValues:](self, "normalizedCharacteristicValuesForValues:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }
  if (v12 && (objc_msgSend(v7, "RGBColor"), v21 = (void *)objc_claimAutoreleasedReturnValue(), v21, v21))
  {
    v32 = 0;
    objc_msgSend(v7, "RGBColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "getHue:saturation:brightness:", (char *)&v32 + 4, &v32, 0);

    *(float *)&v23 = *((float *)&v32 + 1) * 360.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CB88E8];
    -[HFControlItem normalizedValueForCharacteristicValue:ofType:](self, "normalizedValueForCharacteristicValue:ofType:", v24, *MEMORY[0x1E0CB88E8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    *(float *)&v27 = *(float *)&v32 * 100.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0CB8A00];
    -[HFControlItem normalizedValueForCharacteristicValue:ofType:](self, "normalizedValueForCharacteristicValue:ofType:", v28, *MEMORY[0x1E0CB8A00]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = v25;
    v33[1] = v29;
    v34[0] = v26;
    v34[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      NSLog(CFSTR("Attempting to get characteristics a natural light color!"));
    else
      NSLog(CFSTR("Attempting to use non-temperature color %@ with temperature-only control %@!"), v5, self);
    v20 = (void *)MEMORY[0x1E0C9AA70];
  }
LABEL_16:

  return v20;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  if (-[HFColorControlItem supportsNaturalLighting](self, "supportsNaturalLighting"))
  {
    if (v3)
      -[HFColorControlItem _logForNaturalLightUserStudy:](self, "_logForNaturalLightUserStudy:", CFSTR("Natural Light"));
    -[HFControlItem valueSource](self, "valueSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F03F48D8))
      v6 = v5;
    else
      v6 = 0;
    v8 = v6;

    v7 = (id)objc_msgSend(v8, "writeNaturalLightEnabledState:", v3);
  }
}

@end
