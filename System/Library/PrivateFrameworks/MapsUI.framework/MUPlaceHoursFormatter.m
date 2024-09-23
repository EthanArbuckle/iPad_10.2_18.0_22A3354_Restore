@implementation MUPlaceHoursFormatter

- (MUPlaceHoursFormatter)initWithHoursString:(id)a3 AMPMSymbols:(id)a4
{
  id v6;
  id v7;
  MUPlaceHoursFormatter *v8;
  uint64_t v9;
  NSString *hoursString;
  uint64_t v11;
  NSArray *AMPMSymbols;
  void *v13;
  void *v14;
  MUPlaceHoursFormatter *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "count"))
  {
    v17.receiver = self;
    v17.super_class = (Class)MUPlaceHoursFormatter;
    v8 = -[MUPlaceHoursFormatter init](&v17, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      hoursString = v8->_hoursString;
      v8->_hoursString = (NSString *)v9;

      v11 = objc_msgSend(v7, "copy");
      AMPMSymbols = v8->_AMPMSymbols;
      v8->_AMPMSymbols = (NSArray *)v11;

      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "languageCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_formatAMPM = objc_msgSend(v14, "isEqualToString:", CFSTR("ar")) ^ 1;

    }
    self = v8;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)buildAttributedHourStringWithHourFont:(id)a3 AMPMFont:(id)a4 hourColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSString *hoursString;
  uint64_t v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  NSArray *obj;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = *MEMORY[0x1E0DC1140];
  v41[0] = *MEMORY[0x1E0DC1138];
  v11 = v41[0];
  v41[1] = v12;
  v42[0] = v8;
  v42[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v11;
  v39[1] = v12;
  v40[0] = v9;
  v40[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", self->_hoursString, v13);
  if (self->_formatAMPM)
  {
    v27 = v10;
    v28 = v9;
    v29 = v8;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = self->_AMPMSymbols;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(obj);
          v20 = (void *)MEMORY[0x1E0CB38E8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "regularExpressionWithPattern:options:error:", v21, 0, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          hoursString = self->_hoursString;
          v24 = -[NSString length](hoursString, "length");
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __82__MUPlaceHoursFormatter_buildAttributedHourStringWithHourFont_AMPMFont_hourColor___block_invoke;
          v31[3] = &unk_1E2E032E8;
          v32 = v15;
          v33 = v14;
          objc_msgSend(v22, "enumerateMatchesInString:options:range:usingBlock:", hoursString, 0, 0, v24, v31);

        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v17);
    }

    v9 = v28;
    v8 = v29;
    v10 = v27;
  }
  v25 = (void *)objc_msgSend(v15, "copy");

  return v25;
}

uint64_t __82__MUPlaceHoursFormatter_buildAttributedHourStringWithHourFont_AMPMFont_hourColor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(a2, "range");
  return objc_msgSend(v2, "setAttributes:range:", v3, v4, v5);
}

+ (id)hoursFormatterFromHoursStringComponents:(id)a3 AMPMSymbols:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "length") > v10)
          v10 = objc_msgSend(v13, "length");
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__MUPlaceHoursFormatter_hoursFormatterFromHoursStringComponents_AMPMSymbols___block_invoke;
  v18[3] = &__block_descriptor_40_e21__24__0__NSString_8Q16l;
  v18[4] = v10;
  MUMap(v6, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHoursString:AMPMSymbols:", v15, v7);

  return v16;
}

id __77__MUPlaceHoursFormatter_hoursFormatterFromHoursStringComponents_AMPMSymbols___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  unint64_t v6;
  __CFString *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 == objc_msgSend(v3, "length"))
  {
    v5 = &stru_1E2E05448;
  }
  else
  {
    v6 = 0;
    v7 = &stru_1E2E05448;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v7);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v6;
      v8 = *(_QWORD *)(a1 + 32);
      v9 = v8 - objc_msgSend(v3, "length");
      v7 = v5;
    }
    while (v6 < v9);
  }
  if (-[__CFString length](v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5, v3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v3;
  }
  v11 = v10;

  return v11;
}

+ (id)_hoursMonospacedFont
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC13D0];
  v10[0] = *MEMORY[0x1E0DC13D8];
  v10[1] = v2;
  v11[0] = &unk_1E2E55590;
  v11[1] = &unk_1E2E555A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v7, "fontWithDescriptor:size:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_AMPMFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0DC1380];
  v3 = *MEMORY[0x1E0DC13D0];
  v12[0] = *MEMORY[0x1E0DC13D8];
  v12[1] = v3;
  v13[0] = &unk_1E2E555C0;
  v13[1] = &unk_1E2E555D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v9, "fontWithDescriptor:size:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)buildDefaultPlacecardHoursString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "_hoursMonospacedFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_AMPMFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceHoursFormatter buildAttributedHourStringWithHourFont:AMPMFont:hourColor:](self, "buildAttributedHourStringWithHourFont:AMPMFont:hourColor:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)hoursString
{
  return self->_hoursString;
}

- (NSArray)AMPMSymbols
{
  return self->_AMPMSymbols;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AMPMSymbols, 0);
  objc_storeStrong((id *)&self->_hoursString, 0);
}

@end
