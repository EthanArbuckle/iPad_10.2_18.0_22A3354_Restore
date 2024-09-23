@implementation DDConversionAction

+ (id)allActionsForResult:(__DDResult *)a3 context:(id)a4 onlyTest:(BOOL)a5
{
  void *v6;
  id v8;
  id v9;

  v9 = a4;
  if (a3)
  {
    if ((DDResultHasType() & 1) != 0 || DDResultHasType())
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kDDContextNoRoomForSubtitlesKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "BOOLValue");

      a3 = 0;
      DDResultPhysicalUnitsExtraction();

    }
    else
    {
      a3 = 0;
    }
  }

  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetUnit, 0);
  objc_storeStrong((id *)&self->_forcedUnit, 0);
  objc_storeStrong((id *)&self->_calculateString, 0);
  objc_storeStrong((id *)&self->_calculateResult, 0);
  objc_storeStrong((id *)&self->_extractedUnit, 0);
  objc_storeStrong((id *)&self->_extractedCurrency, 0);
}

- (DDConversionAction)initWithValue:(double)a3 unit:(id)a4 targetUnit:(id)a5 context:(id)a6 ambiguousDetection:(BOOL)a7 result:(__DDResult *)a8
{
  id v15;
  id v16;
  DDConversionAction *v17;
  DDConversionAction *v18;
  objc_super v20;

  v15 = a4;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)DDConversionAction;
  v17 = -[DDAction initWithURL:result:context:](&v20, sel_initWithURL_result_context_, 0, 0, a6);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_targetUnit, a5);
    objc_storeStrong((id *)&v18->_extractedUnit, a4);
    v18->_extractedValue = a3;
    v18->_ambiguousDetection = a7;
    if (a8)
      v18->super._result = (__DDResult *)CFRetain(a8);
  }

  return v18;
}

+ (BOOL)actionAvailableForResult:(__DDResult *)a3
{
  __DDResult *v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  if (a3)
  {
    if (objc_msgSend(a1, "isAvailable"))
    {
      if (!DDResultHasType())
      {
        objc_msgSend(a1, "allActionsForResult:context:onlyTest:", v3, 0, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v3) = objc_msgSend(v8, "count") != 0;

        return (char)v3;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.quicklook.extension.previewUI"));

      if ((v7 & 1) == 0)
        DDResultCurrencyExtraction();
    }
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

+ (id)allActionsForResult:(__DDResult *)a3 context:(id)a4
{
  return (id)objc_msgSend(a1, "allActionsForResult:context:onlyTest:", a3, a4, 0);
}

- (DDConversionAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8;
  id v9;
  DDConversionAction *v10;
  objc_super v12;

  v8 = a3;
  v9 = a5;
  if (a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)DDConversionAction;
    v10 = -[DDAction initWithURL:result:context:](&v12, sel_initWithURL_result_context_, v8, a4, v9);
    self = v10;
    if (v10)
    {
      -[DDConversionAction commonInitWithURL:result:context:targetUnit:](v10, "commonInitWithURL:result:context:targetUnit:", v8, a4, v9, 0);
      a4 = (__DDResult *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a4 = 0;
    }
  }

  return (DDConversionAction *)a4;
}

- (DDConversionAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 targetUnit:(id)a6
{
  id v10;
  id v11;
  id v12;
  DDConversionAction *v13;
  objc_super v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4)
  {
    v15.receiver = self;
    v15.super_class = (Class)DDConversionAction;
    v13 = -[DDAction initWithURL:result:context:](&v15, sel_initWithURL_result_context_, v10, a4, v11);
    self = v13;
    if (v13)
    {
      -[DDConversionAction commonInitWithURL:result:context:targetUnit:](v13, "commonInitWithURL:result:context:targetUnit:", v10, a4, v11, v12);
      a4 = (__DDResult *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a4 = 0;
    }
  }

  return (DDConversionAction *)a4;
}

- (id)commonInitWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 targetUnit:(id)a6
{
  id v7;

  v7 = a6;
  if (DDResultHasType())
  {
    DDResultPhysicalUnitsExtraction();
  }
  else if (DDResultHasType())
  {
    DDResultCurrencyExtraction();
  }

  return self;
}

- (BOOL)calloutFlavor
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->super._context, "objectForKeyedSubscript:", CFSTR("kDDContextNoRoomForSubtitlesKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)menuItemattributes
{
  if (-[DDConversionAction calloutFlavor](self, "calloutFlavor"))
    return 1;
  else
    return -[DDConversionAction conversionFailed](self, "conversionFailed");
}

- (id)localizedName
{
  uint64_t v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[DDConversionAction calloutFlavor](self, "calloutFlavor") || self->_extractedCurrency)
  {
    -[DDConversionAction _titleWithValue](self, "_titleWithValue");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v4 = (void *)v3;
    return v4;
  }
  if (!self->_calculateString)
  {
    -[DDUIPhysicalUnit localizedUnitNameWithValue:unit:](self->_targetUnit, "localizedUnitNameWithValue:unit:", self->_extractedUnit, self->_extractedValue);
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  -[DDConversionAction calculateResult](self, "calculateResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "terms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formattedUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    DDLocalizedStringFromTable(CFSTR("Cannot Convert Value"), (uint64_t)CFSTR("Generic value conversion action menu title"), CFSTR("Cannot Convert Value"), CFSTR("Conversion"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v11;

  return v4;
}

- (id)_titleWithValue
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (self->_calculateString)
  {
    -[DDConversionAction calculateResult](self, "calculateResult");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "formattedResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      DDLocalizedStringFromTable(CFSTR("Cannot Convert Value"), (uint64_t)CFSTR("Generic value conversion action menu title"), CFSTR("Cannot Convert Value"), CFSTR("Conversion"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    -[DDUIPhysicalUnit localizedConvertedValueFrom:unit:](self->_targetUnit, "localizedConvertedValueFrom:unit:", self->_extractedUnit, self->_extractedValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)subtitle
{
  __CFString *v3;

  if (-[DDConversionAction calloutFlavor](self, "calloutFlavor")
    || -[DDConversionAction conversionFailed](self, "conversionFailed"))
  {
    v3 = 0;
  }
  else if (self->_extractedCurrency)
  {
    v3 = CFSTR("yahoo! finance");
  }
  else
  {
    -[DDConversionAction _titleWithValue](self, "_titleWithValue");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)quickActionTitle
{
  void *v2;

  if (self->_calculateString || self->_ambiguousDetection)
  {
    DDResultGetMatchedString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DDUIPhysicalUnit localizedConvertedValueFrom:unit:](self->_extractedUnit, "localizedConvertedValueFrom:unit:", self->_extractedValue);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)calculateResult
{
  NSString *calculateString;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CalculateResult *v8;
  CalculateResult *calculateResult;
  void *v10;
  CalculateResult *v11;
  CalculateResult *v12;
  id v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  calculateString = self->_calculateString;
  if (calculateString && !self->_calculateDidRun)
  {
    v4 = (void *)MEMORY[0x1E0D09EC0];
    v15 = *MEMORY[0x1E0D09E98];
    v16[0] = &unk_1E4269C70;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "evaluate:options:", calculateString, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bestConversion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "convertedTo:", v7);
      v8 = (CalculateResult *)objc_claimAutoreleasedReturnValue();
      calculateResult = self->_calculateResult;
      self->_calculateResult = v8;

    }
    if (!self->_calculateResult)
    {
      objc_msgSend(v6, "conversions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (CalculateResult *)objc_claimAutoreleasedReturnValue();
      v12 = self->_calculateResult;
      self->_calculateResult = v11;

    }
    if (!self->_extractedCurrency)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v13, "setMaximumFractionDigits:", 3);
      objc_msgSend(v13, "setUsesGroupingSeparator:", 1);
      -[CalculateResult setNumberFormatter:](self->_calculateResult, "setNumberFormatter:", v13);

    }
    self->_calculateDidRun = 1;

  }
  return self->_calculateResult;
}

- (void)performFromView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  if (!-[DDConversionAction conversionFailed](self, "conversionFailed"))
  {
    if (self->_extractedCurrency)
      -[DDConversionAction _titleWithValue](self, "_titleWithValue");
    else
      -[DDConversionAction subtitle](self, "subtitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CEA810];
    v6 = objc_msgSend(v8, "_dataOwnerForCopy");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__DDConversionAction_performFromView___block_invoke;
    v9[3] = &unk_1E42580C8;
    v10 = v4;
    v7 = v4;
    objc_msgSend(v5, "_performAsDataOwner:block:", v6, v9);

  }
}

void __38__DDConversionAction_performFromView___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v7 = v2;
    v8 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v5);

}

- (BOOL)conversionFailed
{
  void *v2;
  BOOL v3;

  if (!self->_calculateString)
    return 0;
  -[DDConversionAction calculateResult](self, "calculateResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)iconName
{
  if (-[DDConversionAction conversionFailed](self, "conversionFailed"))
    return 0;
  else
    return CFSTR("doc.on.doc");
}

- (id)menuIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CEA638];
  -[DDUIPhysicalUnit group](self->_extractedUnit, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolNameForValue:unit:", self->_extractedUnit, self->_extractedValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_systemImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)menuName
{
  void *v3;
  void *v4;
  void *v5;

  -[DDUIPhysicalUnit localizedMenuTitleFormat:](self->_extractedUnit, "localizedMenuTitleFormat:", CFSTR("x"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDUIPhysicalUnit localizedMenuTitleFormat:](self->_extractedUnit, "localizedMenuTitleFormat:", CFSTR("x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DDLocalizedStringFromTable(v3, (uint64_t)&stru_1E4259460, v4, CFSTR("Conversion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canBePerformedWhenDeviceIsLocked
{
  return 1;
}

- (unint64_t)groupDisplayOption
{
  return 1;
}

- (id)specialCaseActions
{
  void *v3;

  v3 = (void *)specialCaseResultForResult((uint64_t)self->super._result);
  if (v3)
  {
    +[DDConversionAction allActionsForResult:context:](DDConversionAction, "allActionsForResult:context:", v3, self->super._context);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
