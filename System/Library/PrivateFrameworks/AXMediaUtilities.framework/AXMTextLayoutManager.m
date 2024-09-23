@implementation AXMTextLayoutManager

- (AXMTextLayoutManager)initWithSemanticTextFactory:(id)a3
{
  id v4;
  AXMTextLayoutManager *v5;
  AXMTextLayoutManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXMTextLayoutManager;
  v5 = -[AXMTextLayoutManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AXMTextLayoutManager setSemanticTextFactory:](v5, "setSemanticTextFactory:", v4);

  return v6;
}

- (NSNumberFormatter)numberFormatter
{
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    -[NSNumberFormatter setNumberStyle:](self->_numberFormatter, "setNumberStyle:", 5);
    numberFormatter = self->_numberFormatter;
  }
  return numberFormatter;
}

- (NSMeasurementFormatter)measurementFormatter
{
  NSMeasurementFormatter *measurementFormatter;
  NSMeasurementFormatter *v4;
  NSMeasurementFormatter *v5;

  measurementFormatter = self->_measurementFormatter;
  if (!measurementFormatter)
  {
    v4 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x1E0CB3760]);
    v5 = self->_measurementFormatter;
    self->_measurementFormatter = v4;

    -[NSMeasurementFormatter setUnitStyle:](self->_measurementFormatter, "setUnitStyle:", 3);
    measurementFormatter = self->_measurementFormatter;
  }
  return measurementFormatter;
}

- (id)fractionDenominatorValuesWithOneAsNumerator
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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

  v19 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("image.value.one"), &stru_1E6260C18, CFSTR("Accessibility"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("image.value.half"), &stru_1E6260C18, CFSTR("Accessibility"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("image.value.third"), &stru_1E6260C18, CFSTR("Accessibility"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("image.value.fourth"), &stru_1E6260C18, CFSTR("Accessibility"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("image.value.fifth"), &stru_1E6260C18, CFSTR("Accessibility"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("image.value.sixth"), &stru_1E6260C18, CFSTR("Accessibility"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("image.value.seventh"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("image.value.eighth"), &stru_1E6260C18, CFSTR("Accessibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("image.value.nineth"), &stru_1E6260C18, CFSTR("Accessibility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("image.value.tenth"), &stru_1E6260C18, CFSTR("Accessibility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithObjects:", &stru_1E6260C18, v24, v16, v23, v13, v11, v2, v3, v4, v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fractionDenominatorValues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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

  v19 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("image.value.one"), &stru_1E6260C18, CFSTR("Accessibility"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("image.value.halves"), &stru_1E6260C18, CFSTR("Accessibility"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("image.value.thirds"), &stru_1E6260C18, CFSTR("Accessibility"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("image.value.fourths"), &stru_1E6260C18, CFSTR("Accessibility"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("image.value.fifth"), &stru_1E6260C18, CFSTR("Accessibility"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("image.value.sixths"), &stru_1E6260C18, CFSTR("Accessibility"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("image.value.sevenths"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("image.value.eighths"), &stru_1E6260C18, CFSTR("Accessibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("image.value.nineths"), &stru_1E6260C18, CFSTR("Accessibility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("image.value.tenths"), &stru_1E6260C18, CFSTR("Accessibility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithObjects:", &stru_1E6260C18, v24, v16, v23, v13, v11, v2, v3, v4, v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)measurementAbbreviationsToVerboseString
{
  void *v3;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[6];
  _QWORD v48[8];

  v48[6] = *MEMORY[0x1E0C80C00];
  v47[0] = CFSTR("g");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[AXMTextLayoutManager measurementFormatter](self, "measurementFormatter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AE0], "grams");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringFromUnit:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" %@"), v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", CFSTR("[\\d]+ ?g(\\s|\\)|$|,)"), CFSTR("g"), v43, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v42;
  v47[1] = CFSTR("mg");
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[AXMTextLayoutManager measurementFormatter](self, "measurementFormatter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AE0], "milligrams");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringFromUnit:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR(" %@"), v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObjects:", CFSTR("[\\d]+ ?mg(\\s|\\)|$|,)"), CFSTR("mg"), v38, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v37;
  v47[2] = CFSTR("mcg");
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[AXMTextLayoutManager measurementFormatter](self, "measurementFormatter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AE0], "micrograms");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringFromUnit:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR(" %@"), v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithObjects:", CFSTR("[\\d]+ ?mcg(\\s|\\)|$|,)"), CFSTR("mcg"), v33, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v32;
  v47[3] = CFSTR("ml");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[AXMTextLayoutManager measurementFormatter](self, "measurementFormatter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B08], "milliliters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringFromUnit:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR(" %@"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithObjects:", CFSTR("[\\d]+ ?ml(\\s|\\)|$|,)"), CFSTR("ml"), v28, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v27;
  v47[4] = CFSTR("kcal");
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[AXMTextLayoutManager measurementFormatter](self, "measurementFormatter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringFromUnit:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR(" %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithObjects:", CFSTR("[\\d]+ ?kcal(\\s|\\)|$|,)"), CFSTR("kcal"), v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v16;
  v47[5] = CFSTR("kg");
  v17 = (void *)MEMORY[0x1E0C99D20];
  v18 = (void *)MEMORY[0x1E0CB3940];
  -[AXMTextLayoutManager measurementFormatter](self, "measurementFormatter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AE0], "kilograms");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromUnit:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR(" %@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayWithObjects:", CFSTR("[\\d]+ ?kg(\\s|\\)|$|,)"), CFSTR("kg"), v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)receiptRegularExpressions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v2 = (void *)MEMORY[0x1E0C99D20];
  v22 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("(?:subtotal|sub total) ?[$|€|R$]? ?[\\d]+\\.[\\d][\\d]"), 1, &v22);
  v4 = v22;
  v21 = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("(?:sales tax)(?:[\\d][\\d]\\.[\\d][\\d][\\d]?%) ?[$|€|R$]? ?[\\d]+\\.[\\d][\\d]"), 1, &v21);
  v6 = v21;

  v20 = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("(?:total) ?[$|€|R$]? ?[\\d]+\\.[\\d][\\d]"), 1, &v20);
  v8 = v20;

  v19 = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("([a-zA-Z 0-9]+)([$|€]?[\\d]+\\.[\\d][\\d]) ([$|€|R$]?[\\d]+\\.[\\d][\\d])"), 1, &v19);
  v10 = v19;

  v18 = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("([a-zA-Z 0-9]+) ([\\d]+) ([$|€|R$]?[\\d]+\\.[\\d][\\d]) ([$|€]?[\\d]+\\.[\\d][\\d])"), 1, &v18);
  v12 = v18;

  v17 = v12;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[a-zA-Z 0-9]+ [$|€|R$]?[\\d]+\\.[\\d][\\d]"), 1, &v17);
  v14 = v17;

  objc_msgSend(v2, "arrayWithObjects:", v3, v5, v7, v9, v11, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_assembleLayoutSequences:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[AXMLayoutSequence sequence:](AXMLayoutSequence, "sequence:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_assembleLayoutLines:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  double v16;
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id obj;
  uint64_t v27;
  id v28;
  uint64_t v29;
  char v30;
  _BYTE v31[15];
  char v32;
  _BYTE v33[15];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  double v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AXMediaLogTextLayout();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXMTextLayoutManager _assembleLayoutLines:].cold.3();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v3;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v39;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v5);
        AXMediaLogTextLayout();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v6;
          _os_log_debug_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEBUG, "  Next sequence: %@", buf, 0xCu);
        }

        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v8 = v28;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v35;
LABEL_12:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v35 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
            AXMediaLogTextLayout();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v43 = (uint64_t)v13;
              _os_log_debug_impl(&dword_1B0E3B000, v14, OS_LOG_TYPE_DEBUG, "   Compare w/ line %@", buf, 0xCu);
            }

            objc_msgSend(v13, "height");
            v16 = v15 * 0.3;
            AXMediaLogTextLayout();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              v43 = 0x403E000000000000;
              v44 = 2048;
              v45 = v16;
              _os_log_debug_impl(&dword_1B0E3B000, v17, OS_LOG_TYPE_DEBUG, "   threshold (%.0f%% of lineItem.height): %.2f", buf, 0x16u);
            }

            v18 = objc_msgSend(v13, "metric:inProximityOfMetric:item:threshold:", 0, 0, v6, v16);
            v19 = objc_msgSend(v13, "metric:inProximityOfMetric:item:threshold:", 1, 1, v6, v16);
            v20 = v19;
            if (v18)
            {
              if ((v19 & 1) != 0)
                break;
            }
            AXMediaLogTextLayout();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              v43 = v18;
              v44 = 2048;
              *(_QWORD *)&v45 = v20;
              _os_log_debug_impl(&dword_1B0E3B000, v21, OS_LOG_TYPE_DEBUG, "   sequence and line differ. height:%ld top:%ld", buf, 0x16u);
            }

            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
              if (v10)
                goto LABEL_12;
              goto LABEL_25;
            }
          }
          v22 = v13;

          if (!v22)
            goto LABEL_30;
          AXMediaLogTextLayout();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            -[AXMTextLayoutManager _assembleLayoutLines:].cold.2(&v32, v33);

          objc_msgSend(v22, "addSequence:", v6);
        }
        else
        {
LABEL_25:

LABEL_30:
          AXMediaLogTextLayout();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[AXMTextLayoutManager _assembleLayoutLines:].cold.1(&v30, v31);

          +[AXMLayoutLine line:](AXMLayoutLine, "line:", v6);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v22);
        }

        ++v5;
      }
      while (v5 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v29);
  }

  return v28;
}

- (id)_assembleLayoutRegions:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  char v21;
  unsigned int v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id obj;
  uint64_t v29;
  id v30;
  uint64_t v31;
  char v32;
  _BYTE v33[15];
  char v34;
  _BYTE v35[15];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  double v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AXMediaLogTextLayout();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXMTextLayoutManager _assembleLayoutRegions:].cold.3();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v3;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v41;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v5);
        AXMediaLogTextLayout();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v6;
          _os_log_debug_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEBUG, "  Next line: %@", buf, 0xCu);
        }

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v8 = v30;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v37;
LABEL_12:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v37 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
            AXMediaLogTextLayout();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v45 = (uint64_t)v13;
              _os_log_debug_impl(&dword_1B0E3B000, v14, OS_LOG_TYPE_DEBUG, "   Compare w/ region %@", buf, 0xCu);
            }

            objc_msgSend(v13, "firstLine");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "height");
            v17 = v16 * 0.3;

            AXMediaLogTextLayout();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              v45 = 0x403E000000000000;
              v46 = 2048;
              v47 = v17;
              _os_log_debug_impl(&dword_1B0E3B000, v18, OS_LOG_TYPE_DEBUG, "   threshold (%.0f%% of regionItem.firstLine.height): %.2f", buf, 0x16u);
            }

            objc_msgSend(v13, "firstLine");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "metric:inProximityOfMetric:item:threshold:", 0, 0, v6, v17);

            v21 = objc_msgSend(v13, "metric:inProximityOfMetric:item:threshold:", 6, 6, v6, v17);
            v22 = objc_msgSend(v13, "metric:inProximityOfMetric:item:threshold:", 4, 4, v6, 5.0);
            if (v20)
            {
              if ((v21 & 1) != 0)
                break;
            }
            AXMediaLogTextLayout();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              v45 = v20;
              v46 = 2048;
              *(_QWORD *)&v47 = v22;
              _os_log_debug_impl(&dword_1B0E3B000, v23, OS_LOG_TYPE_DEBUG, "   line and region differ. height:%ld left:%ld", buf, 0x16u);
            }

            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
              if (v10)
                goto LABEL_12;
              goto LABEL_25;
            }
          }
          v24 = v13;

          if (!v24)
            goto LABEL_30;
          AXMediaLogTextLayout();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            -[AXMTextLayoutManager _assembleLayoutRegions:].cold.2(&v34, v35);

          objc_msgSend(v24, "addLine:", v6);
        }
        else
        {
LABEL_25:

LABEL_30:
          AXMediaLogTextLayout();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            -[AXMTextLayoutManager _assembleLayoutRegions:].cold.1(&v32, v33);

          +[AXMLayoutRegion region:](AXMLayoutRegion, "region:", v6);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v24);
        }

        ++v5;
      }
      while (v5 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v31);
  }

  return v30;
}

- (id)_assembleLayoutCellsWithFeatures:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[AXMLayoutCell sequence:](AXMLayoutCell, "sequence:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_assembleLayoutRow:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  char v13;
  _BYTE v14[15];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        AXMediaLogTextLayout();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v9;
          _os_log_debug_impl(&dword_1B0E3B000, v10, OS_LOG_TYPE_DEBUG, "  Next cell: %@", buf, 0xCu);
        }

        if (v9)
        {
          AXMediaLogTextLayout();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[AXMTextLayoutManager _assembleLayoutRow:].cold.1(&v13, v14);

          if (v6)
          {
            objc_msgSend(v6, "addCell:", v9);
          }
          else
          {
            +[AXMLayoutRow row:](AXMLayoutRow, "row:", v9);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_assembleLayoutHeader:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  char v13;
  _BYTE v14[15];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        AXMediaLogTextLayout();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v9;
          _os_log_debug_impl(&dword_1B0E3B000, v10, OS_LOG_TYPE_DEBUG, "  Next cell: %@", buf, 0xCu);
        }

        if (v9)
        {
          AXMediaLogTextLayout();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[AXMTextLayoutManager _assembleLayoutHeader:].cold.1(&v13, v14);

          if (v6)
          {
            objc_msgSend(v6, "addCell:", v9);
          }
          else
          {
            +[AXMLayoutHeader header:](AXMLayoutHeader, "header:", v9);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_assembleLayoutColumn:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  char v15;
  _BYTE v16[15];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = a3;
  objc_msgSend(v14, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        AXMediaLogTextLayout();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v10;
          _os_log_debug_impl(&dword_1B0E3B000, v11, OS_LOG_TYPE_DEBUG, "  Next cell: %@", buf, 0xCu);
        }

        if (v10)
        {
          AXMediaLogTextLayout();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            -[AXMTextLayoutManager _assembleLayoutColumn:].cold.1(&v15, v16);

          if (v7)
          {
            objc_msgSend(v7, "addCell:", v10);
          }
          else
          {
            +[AXMLayoutColumn column:](AXMLayoutColumn, "column:", v10);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_assembleLayoutRowFromCell:(id)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;

  +[AXMLayoutCell sequence:](AXMLayoutCell, "sequence:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMediaLogTextLayout();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXMTextLayoutManager _assembleLayoutRowFromCell:].cold.2();

  if (v3)
  {
    AXMediaLogTextLayout();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXMTextLayoutManager _assembleLayoutRowFromCell:].cold.1();

    +[AXMLayoutRow row:](AXMLayoutRow, "row:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_assembleLayoutTable:(id)a3 header:(id)a4 columnItems:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  id v29;
  char v30;
  _BYTE v31[15];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  _BYTE v37[15];
  char v38;
  _BYTE v39[15];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29 = a5;
  AXMediaLogTextLayout();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AXMTextLayoutManager _assembleLayoutTable:header:columnItems:].cold.4();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        AXMediaLogTextLayout();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v16;
          _os_log_debug_impl(&dword_1B0E3B000, v17, OS_LOG_TYPE_DEBUG, "  Next row: %@", buf, 0xCu);
        }

        AXMediaLogTextLayout();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
        if (v13)
        {
          if (v19)
            -[AXMTextLayoutManager _assembleLayoutTable:header:columnItems:].cold.3(&v38, v39);

          objc_msgSend(v13, "addRow:", v16);
        }
        else
        {
          if (v19)
            -[AXMTextLayoutManager _assembleLayoutTable:header:columnItems:].cold.2(&v36, v37);

          +[AXMLayoutTable region:row:](AXMLayoutTable, "region:row:", v8, v16, v29);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v29;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        AXMediaLogTextLayout();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v25;
          _os_log_debug_impl(&dword_1B0E3B000, v26, OS_LOG_TYPE_DEBUG, "  Next column: %@", buf, 0xCu);
        }

        if (v13)
        {
          AXMediaLogTextLayout();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[AXMTextLayoutManager _assembleLayoutTable:header:columnItems:].cold.1(&v30, v31);

          objc_msgSend(v13, "addColumn:", v25);
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v22);
  }

  return v13;
}

- (id)_assembleNutritionLabelLayoutWithRows:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  char v16;
  _BYTE v17[15];
  char v18;
  _BYTE v19[15];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AXMediaLogTextLayout();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXMTextLayoutManager _assembleNutritionLabelLayoutWithRows:].cold.3();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        AXMediaLogTextLayout();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v11;
          _os_log_debug_impl(&dword_1B0E3B000, v12, OS_LOG_TYPE_DEBUG, "  Next row: %@", buf, 0xCu);
        }

        AXMediaLogTextLayout();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v8)
        {
          if (v14)
            -[AXMTextLayoutManager _assembleNutritionLabelLayoutWithRows:].cold.2(&v18, v19);

          objc_msgSend(v8, "addRow:", v11);
        }
        else
        {
          if (v14)
            -[AXMTextLayoutManager _assembleNutritionLabelLayoutWithRows:].cold.1(&v16, v17);

          +[AXMLayoutNutritionLabel region:](AXMLayoutNutritionLabel, "region:", v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_assembleReceipt:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  char v16;
  _BYTE v17[15];
  char v18;
  _BYTE v19[15];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AXMediaLogTextLayout();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXMTextLayoutManager _assembleReceipt:].cold.3();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        AXMediaLogTextLayout();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v11;
          _os_log_debug_impl(&dword_1B0E3B000, v12, OS_LOG_TYPE_DEBUG, "  Next row: %@", buf, 0xCu);
        }

        AXMediaLogTextLayout();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v8)
        {
          if (v14)
            -[AXMTextLayoutManager _assembleReceipt:].cold.2(&v18, v19);

          objc_msgSend(v8, "addRow:", v11);
        }
        else
        {
          if (v14)
            -[AXMTextLayoutManager _assembleReceipt:].cold.1(&v16, v17);

          +[AXMLayoutReceipt region:](AXMLayoutReceipt, "region:", v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)documentWithTextFeatures:(id)a3 canvasSize:(CGSize)a4 preferredLocales:(id)a5 applySemanticAnalysis:(BOOL)a6 error:(id *)a7
{
  double height;
  double width;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL8 v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  AXMTextLayoutManager *v66;
  id v67;
  id obj;
  uint64_t v69;
  _BOOL4 v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v70 = a6;
  height = a4.height;
  width = a4.width;
  v92 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v67 = a5;
  if (objc_msgSend(v12, "count"))
  {
    v65 = v12;
    -[AXMTextLayoutManager _assembleLayoutSequences:](self, "_assembleLayoutSequences:", v12);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMTextLayoutManager _assembleLayoutLines:](self, "_assembleLayoutLines:");
    v66 = self;
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMTextLayoutManager _assembleLayoutRegions:](self, "_assembleLayoutRegions:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = v19;
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
    if (v72)
    {
      v69 = *(_QWORD *)v86;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v86 != v69)
            objc_enumerationMutation(obj);
          v74 = v20;
          v21 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v20);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = 0u;
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v73 = v21;
          objc_msgSend(v21, "lines");
          v75 = (id)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v82;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v82 != v24)
                  objc_enumerationMutation(v75);
                v26 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = 0u;
                v78 = 0u;
                v79 = 0u;
                v80 = 0u;
                objc_msgSend(v26, "sequences");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
                if (v29)
                {
                  v30 = v29;
                  v31 = *(_QWORD *)v78;
                  do
                  {
                    for (j = 0; j != v30; ++j)
                    {
                      if (*(_QWORD *)v78 != v31)
                        objc_enumerationMutation(v28);
                      objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "feature");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "addObject:", v33);

                    }
                    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
                  }
                  while (v30);
                }

                objc_msgSend(v27, "ax_mappedArrayUsingBlock:", &__block_literal_global_14);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "componentsJoinedByString:", CFSTR(" "));
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v26, "normalizedFrame");
                v37 = v36;
                v39 = v38;
                v41 = v40;
                v43 = v42;
                objc_msgSend(v26, "recognizedTextFeatures");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                +[AXMVisionFeature textLineWithText:boundingBox:recognizedTextFeatures:canvasSize:](AXMVisionFeature, "textLineWithText:boundingBox:recognizedTextFeatures:canvasSize:", v35, v44, v37, v39, v41, v43, width, height);
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v76, "addObject:", v45);
              }
              v23 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
            }
            while (v23);
          }

          objc_msgSend(v76, "ax_mappedArrayUsingBlock:", &__block_literal_global_220);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "componentsJoinedByString:", CFSTR(" "));
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v70)
          {
            -[AXMTextLayoutManager semanticTextFactory](v66, "semanticTextFactory");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "firstObject");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "semanticTextForText:withLocale:", v47, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = objc_msgSend(v50, "isSemanticallyComplete");
            objc_msgSend(v50, "transformedSpeechText");
            v52 = objc_claimAutoreleasedReturnValue();

            v47 = (void *)v52;
          }
          else
          {
            v51 = 1;
          }
          objc_msgSend(v73, "normalizedFrame");
          +[AXMVisionFeature textRegionWithText:isSpeakable:boundingBox:lines:canvasSize:](AXMVisionFeature, "textRegionWithText:isSpeakable:boundingBox:lines:canvasSize:", v47, v51, v76);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObject:", v53);

          v20 = v74 + 1;
        }
        while (v74 + 1 != v72);
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
      }
      while (v72);
    }

    objc_msgSend(v71, "ax_filteredArrayUsingBlock:", &__block_literal_global_222);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "ax_mappedArrayUsingBlock:", &__block_literal_global_223);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "componentsJoinedByString:", CFSTR(". "));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = objc_msgSend(v56, "length") != 0;
    +[AXMLayoutItem normalizedBoundingFrameForItems:](AXMLayoutItem, "normalizedBoundingFrameForItems:", obj);
    +[AXMVisionFeature textDocumentWithText:isSpeakable:boundingBox:regions:canvasSize:](AXMVisionFeature, "textDocumentWithText:isSpeakable:boundingBox:regions:canvasSize:", v56, v57, v71);
    v58 = (id)objc_claimAutoreleasedReturnValue();

    v59 = v58;
    v12 = v65;
  }
  else
  {
    _AXMMakeError(0, CFSTR("no source texts provided"), v13, v14, v15, v16, v17, v18, v62);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v60;
    if (a7)
    {
      v58 = objc_retainAutorelease(v60);
      v59 = 0;
      *a7 = v58;
    }
    else
    {
      v59 = 0;
    }
  }

  return v59;
}

uint64_t __105__AXMTextLayoutManager_documentWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __105__AXMTextLayoutManager_documentWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __105__AXMTextLayoutManager_documentWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValueSpeakable");
}

uint64_t __105__AXMTextLayoutManager_documentWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (id)envelopeWithTextFeatures:(id)a3 canvasSize:(CGSize)a4 preferredLocales:(id)a5 applySemanticAnalysis:(BOOL)a6 error:(id *)a7
{
  double height;
  double width;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _BOOL8 v68;
  void *v69;
  void *v70;
  _BOOL8 v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  _BOOL8 v77;
  void *v78;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  AXMTextLayoutManager *v84;
  id v85;
  uint64_t v86;
  void *v87;
  _BOOL4 v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  id obj;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v88 = a6;
  height = a4.height;
  width = a4.width;
  v111 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v85 = a5;
  if (objc_msgSend(v12, "count"))
  {
    v83 = v12;
    -[AXMTextLayoutManager _assembleLayoutSequences:](self, "_assembleLayoutSequences:", v12);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMTextLayoutManager _assembleLayoutLines:](self, "_assembleLayoutLines:");
    v84 = self;
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMTextLayoutManager _assembleLayoutRegions:](self, "_assembleLayoutRegions:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v21 = v19;
    v89 = v21;
    v90 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v104, v110, 16);
    if (v90)
    {
      v86 = *(_QWORD *)v105;
      v87 = v20;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v105 != v86)
            objc_enumerationMutation(v21);
          v92 = v22;
          v23 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v22);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = 0u;
          v101 = 0u;
          v102 = 0u;
          v103 = 0u;
          v91 = v23;
          objc_msgSend(v23, "lines");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v101;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v101 != v26)
                  objc_enumerationMutation(obj);
                v28 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = 0u;
                v97 = 0u;
                v98 = 0u;
                v99 = 0u;
                objc_msgSend(v28, "sequences");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
                if (v31)
                {
                  v32 = v31;
                  v33 = *(_QWORD *)v97;
                  do
                  {
                    for (j = 0; j != v32; ++j)
                    {
                      if (*(_QWORD *)v97 != v33)
                        objc_enumerationMutation(v30);
                      objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * j), "feature");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "addObject:", v35);

                    }
                    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
                  }
                  while (v32);
                }

                objc_msgSend(v29, "ax_mappedArrayUsingBlock:", &__block_literal_global_227);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "componentsJoinedByString:", CFSTR(" "));
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v28, "normalizedFrame");
                v39 = v38;
                v41 = v40;
                v43 = v42;
                v45 = v44;
                objc_msgSend(v28, "recognizedTextFeatures");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                +[AXMVisionFeature textLineWithText:boundingBox:recognizedTextFeatures:canvasSize:](AXMVisionFeature, "textLineWithText:boundingBox:recognizedTextFeatures:canvasSize:", v37, v46, v39, v41, v43, v45, width, height);
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v94, "addObject:", v47);
              }
              v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
            }
            while (v25);
          }

          objc_msgSend(v94, "ax_mappedArrayUsingBlock:", &__block_literal_global_228);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "componentsJoinedByString:", CFSTR(" "));
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v88)
          {
            -[AXMTextLayoutManager semanticTextFactory](v84, "semanticTextFactory");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "firstObject");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "semanticTextForText:withLocale:", v49, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = objc_msgSend(v52, "isSemanticallyComplete");
            objc_msgSend(v52, "transformedSpeechText");
            v54 = objc_claimAutoreleasedReturnValue();

            v49 = (void *)v54;
          }
          else
          {
            v53 = 1;
          }
          v20 = v87;
          v21 = v89;
          objc_msgSend(v91, "normalizedFrame");
          +[AXMVisionFeature textRegionWithText:isSpeakable:boundingBox:lines:canvasSize:](AXMVisionFeature, "textRegionWithText:isSpeakable:boundingBox:lines:canvasSize:", v49, v53, v94);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "addObject:", v55);

          v22 = v92 + 1;
        }
        while (v92 + 1 != v90);
        v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v104, v110, 16);
      }
      while (v90);
    }

    objc_msgSend(v20, "ax_filteredArrayUsingBlock:", &__block_literal_global_229);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "ax_mappedArrayUsingBlock:", &__block_literal_global_230);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "componentsJoinedByString:", CFSTR(". "));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXMTextLayoutManager extractDataFromEnvelopeWithFeatures:preferredLocales:canvasSize:](v84, "extractDataFromEnvelopeWithFeatures:preferredLocales:canvasSize:", v83, v85, width, height);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "firstObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "value");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v58, "lastObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "value");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60 && v62)
    {
      v63 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("envelope.address.formatter"), &stru_1E6260C18, CFSTR("Accessibility"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringWithFormat:", v65, v60, v62);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v66, v57, 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v66, "length") != 0;
      v69 = v89;
      +[AXMLayoutItem normalizedBoundingFrameForItems:](AXMLayoutItem, "normalizedBoundingFrameForItems:", v89);
      v70 = v67;
      v71 = v68;
      v72 = v58;
    }
    else
    {
      v76 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "arrayWithObjects:", v66, v57, 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v57, "length") != 0;
      v69 = v89;
      +[AXMLayoutItem normalizedBoundingFrameForItems:](AXMLayoutItem, "normalizedBoundingFrameForItems:", v89);
      v70 = v67;
      v71 = v77;
      v72 = v20;
    }
    +[AXMVisionFeature envelopeWithText:isSpeakable:boundingBox:regions:canvasSize:](AXMVisionFeature, "envelopeWithText:isSpeakable:boundingBox:regions:canvasSize:", v70, v71, v72);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = v78;
    v75 = v74;
    v12 = v83;
  }
  else
  {
    _AXMMakeError(0, CFSTR("no source texts provided"), v13, v14, v15, v16, v17, v18, v80);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73;
    if (a7)
    {
      v74 = objc_retainAutorelease(v73);
      v75 = 0;
      *a7 = v74;
    }
    else
    {
      v75 = 0;
    }
  }

  return v75;
}

uint64_t __105__AXMTextLayoutManager_envelopeWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __105__AXMTextLayoutManager_envelopeWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __105__AXMTextLayoutManager_envelopeWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValueSpeakable");
}

uint64_t __105__AXMTextLayoutManager_envelopeWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (id)extractDataFromEnvelopeWithFeatures:(id)a3 preferredLocales:(id)a4 canvasSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  double x;
  double y;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  id v61;
  void *v62;
  void *v63;
  double v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint64_t v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  height = a5.height;
  width = a5.width;
  v82 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v67 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v9 = v8;
  v74 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
  if (v74)
  {
    v10 = 0;
    v11 = 0;
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v72 = *(_QWORD *)v78;
    v71 = 0.0;
    v16 = 0.005;
    v73 = 0.0;
    v70 = 0.0;
    v17 = 0.0;
    while (1)
    {
      for (i = 0; i != v74; ++i)
      {
        if (*(_QWORD *)v78 != v72)
          objc_enumerationMutation(v9);
        v19 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        v76 = 0;
        objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 16, &v76);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v76;
        objc_msgSend(v19, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v20, "numberOfMatchesInString:options:range:", v22, 0, 0, objc_msgSend(v23, "length"));

        if (v24)
        {
          if (v10)
          {
            objc_msgSend(v19, "normalizedFrame");
            if (vabdd_f64(v25, v73) < v16)
            {
              objc_msgSend(v19, "normalizedFrame");
              if (v71 - v26 < v70 + 0.01)
              {
                v27 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v19, "value");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "stringWithFormat:", CFSTR("%@, %@"), v11, v28);
                v29 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v19, "normalizedFrame");
                v87.origin.x = v30;
                v87.origin.y = v31;
                v87.size.width = v32;
                v87.size.height = v33;
                v83.origin.x = x;
                v83.origin.y = y;
                v83.size.width = v15;
                v83.size.height = v14;
                v84 = CGRectUnion(v83, v87);
                x = v84.origin.x;
                y = v84.origin.y;
                v15 = v84.size.width;
                v14 = v84.size.height;
                goto LABEL_17;
              }
            }
          }
          else
          {
            objc_msgSend(v19, "value");
            v29 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "normalizedFrame");
            x = v47;
            y = v48;
            v15 = v49;
            v14 = v50;
            objc_msgSend(v19, "confidence");
            v17 = v51;
            v10 = objc_msgSend(v9, "indexOfObject:", v19);
LABEL_17:
            v11 = (void *)v29;
          }
          objc_msgSend(v19, "normalizedFrame");
          v70 = v52;
          objc_msgSend(v19, "normalizedFrame");
          v73 = v53;
          objc_msgSend(v19, "normalizedFrame");
          v71 = v54;
          goto LABEL_25;
        }
        if (!v10)
          goto LABEL_25;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v10 - 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "normalizedFrame");
        v68 = v35;
        v69 = v34;
        if (vabdd_f64(x, v36) >= v16)
        {
          v43 = v11;
        }
        else
        {
          v65 = v17;
          v37 = v16;
          v38 = width;
          v39 = height;
          objc_msgSend(v34, "normalizedFrame");
          v41 = v40 - y;
          objc_msgSend(v35, "normalizedFrame");
          v43 = v11;
          if (v41 < v42 + 0.01)
          {
            v44 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v34, "value");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "stringWithFormat:", CFSTR("%@, %@"), v45, v11);
            v46 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "normalizedFrame");
            v88.origin.x = x;
            v88.origin.y = y;
            v88.size.width = v15;
            v88.size.height = v14;
            v86 = CGRectUnion(v85, v88);
            x = v86.origin.x;
            y = v86.origin.y;
            v15 = v86.size.width;
            v14 = v86.size.height;
            v43 = (void *)v46;
          }
          height = v39;
          width = v38;
          v16 = v37;
          v17 = v65;
        }
        v55 = v9;
        objc_msgSend(v67, "firstObject");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localeIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v57, "isEqual:", CFSTR("en-US")))
        {

LABEL_23:
          v75 = v43;
          +[AXMAddressFormatter replaceDirectionalAbbreviations:](AXMAddressFormatter, "replaceDirectionalAbbreviations:", &v75);
          v61 = v75;

          v43 = v61;
          goto LABEL_24;
        }
        objc_msgSend(v67, "firstObject");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "localeIdentifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "isEqual:", CFSTR("en-CA"));

        if (v60)
          goto LABEL_23;
LABEL_24:
        v9 = v55;
        v11 = v43;
        +[AXMVisionFeature envelopeRegion:boundingBox:confidence:canvasSize:](AXMVisionFeature, "envelopeRegion:boundingBox:confidence:canvasSize:", v43, x, y, v15, v14, v17, width, height);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "addObject:", v62);

        v10 = 0;
LABEL_25:

      }
      v74 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
      if (!v74)
        goto LABEL_29;
    }
  }
  v11 = 0;
LABEL_29:

  objc_msgSend(v66, "sortedArrayUsingComparator:", &__block_literal_global_243);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  return v63;
}

uint64_t __88__AXMTextLayoutManager_extractDataFromEnvelopeWithFeatures_preferredLocales_canvasSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "normalizedFrame");
  v7 = v6;
  objc_msgSend(v5, "normalizedFrame");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "normalizedFrame");
    v11 = v10;
    objc_msgSend(v5, "normalizedFrame");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)documentWithTable:(id)a3 canvasSize:(CGSize)a4 preferredLocales:(id)a5 requestHandler:(id)a6 metrics:(id)a7 error:(id *)a8
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  _BOOL4 v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  double v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t k;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t m;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t n;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  double v105;
  _BOOL8 v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  _BOOL8 v118;
  _BOOL8 v119;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  id obj;
  id obja;
  id objb;
  id objc;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  id v169;
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _QWORD v175[3];

  height = a4.height;
  width = a4.width;
  v175[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = objc_claimAutoreleasedReturnValue();
  v138 = (void *)v18;
  v139 = v16;
  v130 = v17;
  if (v14)
  {
    objc_msgSend(v14, "extent");
    v20 = (unint64_t)v19;
    objc_msgSend(v14, "extent");
    -[AXMTextLayoutManager preprocessTable:width:height:metrics:](self, "preprocessTable:width:height:metrics:", v14, v20, (unint64_t)v21, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc((Class)getVNImageRequestHandlerClass_0()), "initWithCIImage:options:", v22, MEMORY[0x1E0C9AA70]);
    v24 = objc_alloc_init((Class)getVNDetectContoursRequestClass());
    v175[0] = v24;
    v25 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v175, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = 0;
    v27 = objc_msgSend(v23, "performRequests:error:", v26, &v169);
    v145 = v169;

    v147 = v24;
    if (v27)
    {
      obj = v23;
      objc_msgSend(v24, "results");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = objc_claimAutoreleasedReturnValue();

      -[AXMTextLayoutManager sortContourRowResults:maxWidth:maxHeight:minWidth:minHeight:](self, "sortContourRowResults:maxWidth:maxHeight:minWidth:minHeight:", v29, 0.9, 0.5, 0.0, 0.0);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMTextLayoutManager getTableRows:](self, "getTableRows:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "reverseObjectEnumerator");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allObjects");
      v32 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v32;
      v135 = (void *)v29;
      -[AXMTextLayoutManager sortContourColumnResults:maxWidth:maxHeight:](self, "sortContourColumnResults:maxWidth:maxHeight:", v29, 0.5, 0.5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMTextLayoutManager getTableColumns:](self, "getTableColumns:", v34);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[AXMTextLayoutManager verifyTable:sortedColumns:](self, "verifyTable:sortedColumns:", v33);
      if (v25)
      {
        v124 = v22;
        v126 = v33;
        v128 = v15;
        v131 = v14;
        -[AXMTextLayoutManager textRowsForTable:sourceImage:requestHandler:canvasSize:](self, "textRowsForTable:sourceImage:requestHandler:canvasSize:", v33, v14, v139, width, height);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "count"))
        {
          v36 = 0;
          v37 = 0;
          do
          {
            objc_msgSend(v35, "objectAtIndex:", v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMTextLayoutManager _assembleLayoutCellsWithFeatures:](self, "_assembleLayoutCellsWithFeatures:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              -[AXMTextLayoutManager _assembleLayoutRow:](self, "_assembleLayoutRow:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "addObject:", v40);
            }
            else
            {
              -[AXMTextLayoutManager _assembleLayoutHeader:](self, "_assembleLayoutHeader:", v39);
              v40 = (void *)v37;
              v37 = objc_claimAutoreleasedReturnValue();
            }

            ++v36;
          }
          while (objc_msgSend(v35, "count") > v36);
        }
        else
        {
          v37 = 0;
        }
        -[AXMTextLayoutManager textColumnsForTable:sourceImage:requestHandler:canvasSize:](self, "textColumnsForTable:sourceImage:requestHandler:canvasSize:", v137, v131, v139, width, height);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "count"))
        {
          v45 = 0;
          do
          {
            objc_msgSend(v44, "objectAtIndex:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMTextLayoutManager _assembleLayoutCellsWithFeatures:](self, "_assembleLayoutCellsWithFeatures:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMTextLayoutManager _assembleLayoutColumn:](self, "_assembleLayoutColumn:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "addObject:", v48);

            ++v45;
          }
          while (objc_msgSend(v44, "count") > v45);
        }

        v17 = v130;
        v14 = v131;
        v33 = v126;
        v15 = v128;
        v43 = v139;
        v42 = (void *)v37;
        v22 = v124;
      }
      else
      {
        v42 = 0;
        v43 = v139;
      }

      v23 = obj;
    }
    else
    {
      v137 = 0;
      v33 = 0;
      v42 = 0;
      v43 = v139;
    }

    if (!v25)
    {
      v134 = v42;
      v112 = 0;
      v111 = v138;
      goto LABEL_67;
    }
    v127 = v33;
    v129 = v15;
    v41 = v138;
  }
  else
  {
    v41 = (void *)v18;
    v127 = 0;
    v129 = v15;
    v137 = 0;
    v42 = 0;
  }
  v49 = (void *)objc_msgSend(v140, "copy");
  v50 = (void *)objc_msgSend(v41, "copy");
  -[AXMTextLayoutManager _assembleLayoutTable:header:columnItems:](self, "_assembleLayoutTable:header:columnItems:", v49, v42, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  objc_msgSend(v42, "cells");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v165, v174, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v166;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v166 != v57)
          objc_enumerationMutation(v54);
        objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * i), "feature");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v59);

      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v165, v174, 16);
    }
    while (v56);
  }
  v132 = v14;

  v60 = (double)(unint64_t)objc_msgSend(v53, "count");
  objc_msgSend(v53, "ax_mappedArrayUsingBlock:", &__block_literal_global_244);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "componentsJoinedByString:", CFSTR(", "));
  v62 = objc_claimAutoreleasedReturnValue();

  v134 = v42;
  objc_msgSend(v42, "normalizedFrame");
  v123 = (void *)v62;
  v125 = v53;
  +[AXMVisionFeature tableRowWithText:boundingBox:cells:canvasSize:](AXMVisionFeature, "tableRowWithText:boundingBox:cells:canvasSize:", v62, v53);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:");
  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v136 = v51;
  objc_msgSend(v51, "rows");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v161, v173, 16);
  v146 = v52;
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v162;
    do
    {
      for (j = 0; j != v64; ++j)
      {
        if (*(_QWORD *)v162 != v65)
          objc_enumerationMutation(obja);
        v67 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = 0u;
        v158 = 0u;
        v159 = 0u;
        v160 = 0u;
        objc_msgSend(v67, "cells");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v157, v172, 16);
        if (v70)
        {
          v71 = v70;
          v72 = *(_QWORD *)v158;
          do
          {
            for (k = 0; k != v71; ++k)
            {
              if (*(_QWORD *)v158 != v72)
                objc_enumerationMutation(v69);
              objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * k), "feature");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "addObject:", v74);

            }
            v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v157, v172, 16);
          }
          while (v71);
        }

        v60 = v60 + (double)(unint64_t)objc_msgSend(v68, "count");
        objc_msgSend(v68, "ax_mappedArrayUsingBlock:", &__block_literal_global_247);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "componentsJoinedByString:", CFSTR(", "));
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v67, "normalizedFrame");
        +[AXMVisionFeature tableRowWithText:boundingBox:cells:canvasSize:](AXMVisionFeature, "tableRowWithText:boundingBox:cells:canvasSize:", v76, v68);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v146;
        objc_msgSend(v146, "addObject:", v77);

      }
      v64 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v161, v173, 16);
    }
    while (v64);
  }

  objc_msgSend(v52, "ax_mappedArrayUsingBlock:", &__block_literal_global_248_0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "componentsJoinedByString:", CFSTR("; "));
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  objc_msgSend(v136, "columns");
  objb = (id)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v153, v171, 16);
  v80 = v148;
  if (v79)
  {
    v81 = v79;
    v82 = *(_QWORD *)v154;
    do
    {
      for (m = 0; m != v81; ++m)
      {
        if (*(_QWORD *)v154 != v82)
          objc_enumerationMutation(objb);
        v84 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * m);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = 0u;
        v150 = 0u;
        v151 = 0u;
        v152 = 0u;
        objc_msgSend(v84, "cells");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v149, v170, 16);
        if (v87)
        {
          v88 = v87;
          v89 = *(_QWORD *)v150;
          do
          {
            for (n = 0; n != v88; ++n)
            {
              if (*(_QWORD *)v150 != v89)
                objc_enumerationMutation(v86);
              objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * n), "feature");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "addObject:", v91);

            }
            v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v149, v170, 16);
          }
          while (v88);
        }

        objc_msgSend(v85, "ax_mappedArrayUsingBlock:", &__block_literal_global_251_0);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "componentsJoinedByString:", CFSTR(", "));
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v84, "normalizedFrame");
        +[AXMVisionFeature tableColumnWithText:boundingBox:cells:canvasSize:](AXMVisionFeature, "tableColumnWithText:boundingBox:cells:canvasSize:", v93, v85);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v148;
        objc_msgSend(v148, "addObject:", v94);

      }
      v81 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v153, v171, 16);
    }
    while (v81);
  }

  v95 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "localizedStringForKey:value:table:", CFSTR("math.table.row.format"), &stru_1E6260C18, CFSTR("Accessibility"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "localizedStringWithFormat:", v97, objc_msgSend(v146, "count"));
  v98 = objc_claimAutoreleasedReturnValue();

  v99 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "localizedStringForKey:value:table:", CFSTR("math.table.column.format"), &stru_1E6260C18, CFSTR("Accessibility"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "localizedStringWithFormat:", v101, objc_msgSend(v80, "count"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  objc = (id)v98;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v98, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v146, "count");
  v105 = v60 / (double)(unint64_t)(objc_msgSend(v80, "count") * v104) * 100.0;
  v106 = v105 < 100.0 && v105 >= 60.0;
  if (v106)
  {
    v107 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "localizedStringForKey:value:table:", CFSTR("table.incomplete"), &stru_1E6260C18, CFSTR("Accessibility"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "localizedStringWithFormat:", v109, v103);
    v110 = objc_claimAutoreleasedReturnValue();

    v103 = (void *)v110;
    v14 = v132;
    v111 = v138;
LABEL_64:
    v118 = objc_msgSend(v121, "length") != 0;
    v115 = v136;
    objc_msgSend(v136, "normalizedFrame");
    v119 = v118;
    v114 = v146;
    v117 = v121;
    v116 = v148;
    +[AXMVisionFeature tableWithText:isSpeakable:boundingBox:rows:columns:canvasSize:isIncomplete:](AXMVisionFeature, "tableWithText:isSpeakable:boundingBox:rows:columns:canvasSize:isIncomplete:", v103, v119, v146, v148, v106);
    v112 = (id)objc_claimAutoreleasedReturnValue();
    v113 = v139;
    goto LABEL_65;
  }
  v14 = v132;
  v111 = v138;
  if (v105 >= 60.0)
    goto LABEL_64;
  v112 = 0;
  v113 = v139;
  v114 = v146;
  v115 = v136;
  v116 = v148;
  v117 = v121;
LABEL_65:

  v33 = v127;
  v15 = v129;
  v17 = v130;
  v43 = v113;
LABEL_67:

  return v112;
}

uint64_t __99__AXMTextLayoutManager_documentWithTable_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __99__AXMTextLayoutManager_documentWithTable_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __99__AXMTextLayoutManager_documentWithTable_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __99__AXMTextLayoutManager_documentWithTable_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (id)documentWithNutritionLabel:(id)a3 canvasSize:(CGSize)a4 requestHandler:(id)a5 metrics:(id)a6 error:(id *)a7
{
  double height;
  double width;
  id v11;
  id v12;
  __int128 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL8 v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id obj;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _QWORD v107[3];

  height = a4.height;
  width = a4.width;
  v107[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v102 = *MEMORY[0x1E0C9D648];
  v103 = v13;
  objc_msgSend(v11, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  if (v16 == 6)
  {
    objc_msgSend(v11, "imageByApplyingOrientation:", 6);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v17;
  }
  -[AXMTextLayoutManager preprocessNutritionLabel:finalFrame:](self, "preprocessNutritionLabel:finalFrame:", v11, &v102);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc((Class)getVNImageRequestHandlerClass_0()), "initWithCIImage:options:", v18, MEMORY[0x1E0C9AA70]);
  v20 = objc_alloc_init((Class)getVNDetectContoursRequestClass());
  v107[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "performRequests:error:", v21, 0);

  v23 = 0;
  if (v22)
  {
    v83 = v20;
    v84 = v19;
    objc_msgSend(v20, "results");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = objc_claimAutoreleasedReturnValue();

    v82 = (void *)v25;
    -[AXMTextLayoutManager sortContourRowResults:maxWidth:maxHeight:minWidth:minHeight:](self, "sortContourRowResults:maxWidth:maxHeight:minWidth:minHeight:", v25, 1.0, 1.0, 0.0, 0.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "reverseObjectEnumerator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allObjects");
    v28 = objc_claimAutoreleasedReturnValue();

    v87 = v11;
    objc_msgSend(v11, "extent");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v85 = v18;
    objc_msgSend(v18, "extent");
    v81 = (void *)v28;
    -[AXMTextLayoutManager nutritionLabelRowsForContourResults:normalizedNutritionLabelFrame:fullImageFrame:processedImageFrame:](self, "nutritionLabelRowsForContourResults:normalizedNutritionLabelFrame:fullImageFrame:processedImageFrame:", v28, v102, v103, v30, v32, v34, v36, v37, v38, v39, v40);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v12;
    -[AXMTextLayoutManager featureCellsForNutritionLabelRows:withRequestHandler:withCanvasSize:](self, "featureCellsForNutritionLabelRows:withRequestHandler:withCanvasSize:", width, height);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v43 = v41;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v99 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          objc_msgSend(v48, "value");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "isEqualToString:", &stru_1E6260C18);

          if ((v50 & 1) == 0)
          {
            -[AXMTextLayoutManager _assembleLayoutRowFromCell:](self, "_assembleLayoutRowFromCell:", v48);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addObject:", v51);

          }
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
      }
      while (v45);
    }
    v78 = v43;

    v79 = v42;
    v52 = (void *)objc_msgSend(v42, "copy");
    -[AXMTextLayoutManager _assembleNutritionLabelLayoutWithRows:](self, "_assembleNutritionLabelLayoutWithRows:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v77 = v53;
    objc_msgSend(v53, "rows");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v95;
      do
      {
        for (j = 0; j != v55; ++j)
        {
          if (*(_QWORD *)v95 != v56)
            objc_enumerationMutation(obj);
          v58 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          objc_msgSend(v58, "cells");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
          if (v61)
          {
            v62 = v61;
            v63 = *(_QWORD *)v91;
            do
            {
              for (k = 0; k != v62; ++k)
              {
                if (*(_QWORD *)v91 != v63)
                  objc_enumerationMutation(v60);
                objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * k), "feature");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "addObject:", v65);

              }
              v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
            }
            while (v62);
          }

          objc_msgSend(v59, "ax_mappedArrayUsingBlock:", &__block_literal_global_260_0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "componentsJoinedByString:", CFSTR(", "));
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v58, "normalizedFrame");
          +[AXMVisionFeature tableRowWithText:boundingBox:cells:canvasSize:](AXMVisionFeature, "tableRowWithText:boundingBox:cells:canvasSize:", v67, v59);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "addObject:", v68);

        }
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
      }
      while (v55);
    }

    v69 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("nutrition.label.row.format"), &stru_1E6260C18, CFSTR("Accessibility"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "stringWithFormat:", v71, objc_msgSend(v89, "count"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v89, "ax_mappedArrayUsingBlock:", &__block_literal_global_263_0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "componentsJoinedByString:", CFSTR("; "));
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = objc_msgSend(v74, "length") != 0;
    objc_msgSend(v77, "normalizedFrame");
    +[AXMVisionFeature nutritionLabelWithText:isSpeakable:boundingBox:rows:canvasSize:](AXMVisionFeature, "nutritionLabelWithText:isSpeakable:boundingBox:rows:canvasSize:", v72, v75, v89);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v86;
    v11 = v87;
    v19 = v84;
    v18 = v85;
    v20 = v83;
  }

  return v23;
}

uint64_t __91__AXMTextLayoutManager_documentWithNutritionLabel_canvasSize_requestHandler_metrics_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __91__AXMTextLayoutManager_documentWithNutritionLabel_canvasSize_requestHandler_metrics_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (id)documentWithReceipt:(id)a3 withTextSkew:(double)a4 canvasSize:(CGSize)a5 preferredLocales:(id)a6 requestHandler:(id)a7 metrics:(id)a8 error:(id *)a9
{
  double height;
  double width;
  id v16;
  double v22;
  unint64_t v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _BOOL8 v68;
  void *v69;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id obj;
  id obja;
  __int128 v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97;
  id v98;
  double v99;
  double v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  id v105;
  _QWORD v106[4];

  height = a5.height;
  width = a5.width;
  v106[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v75 = a6;
  v77 = a7;
  v76 = a8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = v16;
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = 0.0;
  v100 = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  v101 = _Q0;
  if (!v16)
    goto LABEL_20;
  v82 = _Q0;
  objc_msgSend(v16, "extent");
  v23 = (unint64_t)v22;
  objc_msgSend(v16, "extent");
  -[AXMTextLayoutManager preprocessReceipt:withTextSkew:width:height:metrics:requestHandler:finalFrame:](self, "preprocessReceipt:withTextSkew:width:height:metrics:requestHandler:finalFrame:", v16, v23, (unint64_t)v24, v76, v77, &v99, a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc((Class)getVNImageRequestHandlerClass_0()), "initWithCIImage:options:", v25, MEMORY[0x1E0C9AA70]);
  v27 = objc_alloc_init((Class)getVNRecognizeTextRequestClass_0());
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setRecognitionLanguages:", v28);

  objc_msgSend(v27, "setRecognitionLevel:", 0);
  objc_msgSend(v27, "setUsesLanguageCorrection:", 0);
  v106[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0;
  v30 = objc_msgSend(v26, "performRequests:error:", v29, &v98);
  v31 = v98;

  if (v30)
  {
    objc_msgSend(v27, "results");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v32, "count"))
    {
      v33 = (void *)objc_msgSend(objc_alloc((Class)getVNImageRequestHandlerClass_0()), "initWithCIImage:options:", v78, MEMORY[0x1E0C9AA70]);

      v105 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v31;
      v35 = objc_msgSend(v33, "performRequests:error:", v34, &v97);
      v36 = v97;

      if (v35)
      {
        objc_msgSend(v27, "results");
        v37 = objc_claimAutoreleasedReturnValue();

        v99 = 0.0;
        v100 = 0.0;
        v32 = (void *)v37;
        v101 = v82;
      }
      goto LABEL_8;
    }
  }
  else
  {
    v32 = 0;
  }
  v36 = v31;
  v33 = v26;
LABEL_8:
  if (objc_msgSend(v32, "count"))
  {
    v72 = v36;
    v73 = v33;
    obj = v27;
    v83 = v25;
    objc_msgSend(v32, "sortedArrayUsingComparator:", &__block_literal_global_266);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMTextLayoutManager getReceiptRows:preferredLocales:canvasSize:](self, "getReceiptRows:preferredLocales:canvasSize:", width, height);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v40 = v38;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v94 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
          objc_msgSend(v45, "value");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "isEqual:", &stru_1E6260C18);

          if ((v47 & 1) == 0)
          {
            objc_msgSend(v39, "addObject:", v45);
            -[AXMTextLayoutManager _assembleLayoutRowFromCell:](self, "_assembleLayoutRowFromCell:", v45);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "addObject:", v48);

          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
      }
      while (v42);
    }

    v27 = obj;
    v25 = v83;
    v33 = v73;
    v36 = v72;
  }

LABEL_20:
  v49 = (void *)objc_msgSend(v79, "copy");
  -[AXMTextLayoutManager _assembleReceipt:](self, "_assembleReceipt:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v74 = v50;
  objc_msgSend(v50, "rows");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v52; ++j)
      {
        if (*(_QWORD *)v90 != v53)
          objc_enumerationMutation(obja);
        v55 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        objc_msgSend(v55, "cells");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v86;
          do
          {
            for (k = 0; k != v59; ++k)
            {
              if (*(_QWORD *)v86 != v60)
                objc_enumerationMutation(v57);
              objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * k), "feature");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "addObject:", v62);

            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
          }
          while (v59);
        }

        objc_msgSend(v56, "ax_mappedArrayUsingBlock:", &__block_literal_global_267);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "componentsJoinedByString:", CFSTR(", "));
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v55, "normalizedFrame");
        +[AXMVisionFeature tableRowWithText:boundingBox:cells:canvasSize:](AXMVisionFeature, "tableRowWithText:boundingBox:cells:canvasSize:", v64, v56);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addObject:", v65);

      }
      v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
    }
    while (v52);
  }

  objc_msgSend(v84, "ax_mappedArrayUsingBlock:", &__block_literal_global_268);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "componentsJoinedByString:", CFSTR("; "));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = objc_msgSend(v67, "length") != 0;
  +[AXMVisionFeature receiptWithText:isSpeakable:boundingBox:regions:canvasSize:](AXMVisionFeature, "receiptWithText:isSpeakable:boundingBox:regions:canvasSize:", v67, v68, v84, v99, v100, v101, width, height);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  return v69;
}

uint64_t __114__AXMTextLayoutManager_documentWithReceipt_withTextSkew_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double MaxY;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "boundingBox");
  MaxY = CGRectGetMaxY(v16);
  objc_msgSend(v5, "boundingBox");
  if (MaxY >= CGRectGetMaxY(v17))
  {
    objc_msgSend(v4, "boundingBox");
    v8 = CGRectGetMaxY(v18);
    objc_msgSend(v5, "boundingBox");
    if (v8 <= CGRectGetMaxY(v19)
      && (objc_msgSend(v4, "boundingBox"), v10 = v9, objc_msgSend(v5, "boundingBox"), v10 >= v11))
    {
      objc_msgSend(v4, "boundingBox");
      v13 = v12;
      objc_msgSend(v5, "boundingBox");
      v7 = v13 > v14;
    }
    else
    {
      v7 = -1;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __114__AXMTextLayoutManager_documentWithReceipt_withTextSkew_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __114__AXMTextLayoutManager_documentWithReceipt_withTextSkew_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (id)preprocessTable:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 metrics:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  float v17;
  const __CFString *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  unint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  int v36;
  unint64_t v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  const __CFString *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  id v73;
  void *v74;
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[4];

  v86[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v73 = a6;
  v74 = v8;
  objc_msgSend(v8, "imageByApplyingFilter:", CFSTR("CIPhotoEffectNoir"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageByApplyingFilter:", CFSTR("CIColorInvert"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = *MEMORY[0x1E0C9E1B0];
  v11 = *MEMORY[0x1E0C9E1B0];
  v70 = *MEMORY[0x1E0C9E1D0];
  v85[0] = *MEMORY[0x1E0C9E1D0];
  v85[1] = v11;
  v86[0] = &unk_1E6288B38;
  v86[1] = &unk_1E6288B48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "imageByApplyingFilter:", CFSTR("CIColorThresholdOtsu"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = a5;
  v15 = v14;
  v16 = 3;
  v17 = (float)(a5 / 0x1E);
  v18 = CFSTR("inputHeight");
  v19 = 0x1E0CB3000uLL;
  v67 = v15;
  do
  {
    v20 = v15;
    objc_msgSend(v15, "imageByClampingToExtent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v18;
    v84[0] = &unk_1E62882B8;
    v83[0] = CFSTR("inputWidth");
    *(float *)&v22 = v17;
    objc_msgSend(*(id *)(v19 + 2024), "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
    v24 = v19;
    v25 = v18;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageByApplyingFilter:withInputParameters:", CFSTR("AXMCIMorphologyRectangleMinimum"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extent");
    objc_msgSend(v27, "imageByCroppingToRect:");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v18 = v25;
    v19 = v24;

    --v16;
  }
  while (v16);
  v28 = 3;
  do
  {
    v29 = v15;
    objc_msgSend(v15, "imageByClampingToExtent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = CFSTR("inputWidth");
    v81[1] = CFSTR("inputHeight");
    v82[0] = &unk_1E62882B8;
    *(float *)&v31 = v17;
    objc_msgSend(*(id *)(v24 + 2024), "numberWithFloat:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "imageByApplyingFilter:withInputParameters:", CFSTR("AXMCIMorphologyRectangleMaximum"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extent");
    objc_msgSend(v34, "imageByCroppingToRect:");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    --v28;
  }
  while (v28);
  v66 = v15;
  v35 = v67;
  v36 = 3;
  v68 = v35;
  v37 = 0x1E0C99000uLL;
  v38 = CFSTR("inputWidth");
  v39 = &unk_1E62882B8;
  do
  {
    v40 = v35;
    objc_msgSend(v35, "imageByClampingToExtent", v66);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v38;
    *(float *)&v42 = (float)(a4 / 0x28);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
    v43 = v38;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = CFSTR("inputHeight");
    v80[0] = v44;
    v80[1] = v39;
    objc_msgSend(*(id *)(v37 + 3456), "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
    v45 = v37;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "imageByApplyingFilter:withInputParameters:", CFSTR("AXMCIMorphologyRectangleMinimum"), v46);
    v47 = v39;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "extent");
    objc_msgSend(v48, "imageByCroppingToRect:");
    v35 = (id)objc_claimAutoreleasedReturnValue();

    v39 = v47;
    v37 = v45;

    v38 = v43;
    --v36;
  }
  while (v36);
  v49 = 3;
  do
  {
    v50 = v35;
    objc_msgSend(v35, "imageByClampingToExtent");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v38;
    *(float *)&v52 = (float)(a4 / 0x28);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = CFSTR("inputHeight");
    v78[0] = v53;
    v78[1] = v39;
    objc_msgSend(*(id *)(v37 + 3456), "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "imageByApplyingFilter:withInputParameters:", CFSTR("AXMCIMorphologyRectangleMaximum"), v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "extent");
    objc_msgSend(v55, "imageByCroppingToRect:");
    v35 = (id)objc_claimAutoreleasedReturnValue();

    v39 = v47;
    v37 = v45;

    v38 = v43;
    --v49;
  }
  while (v49);
  objc_msgSend(v66, "mergeWithImage:withSize:withMetrics:", v35, v73, (double)a4, (double)v71);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v70;
  v75[1] = v69;
  v76[0] = &unk_1E6288B38;
  v76[1] = &unk_1E6288B58;
  objc_msgSend(*(id *)(v45 + 3456), "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v58, "imageByApplyingFilter:", CFSTR("CIColorInvert"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 3;
  do
  {
    v61 = v59;
    objc_msgSend(v59, "imageByClampingToExtent");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "imageByApplyingFilter:withInputParameters:", CFSTR("AXMCIMorphologyRectangleMinimum"), &unk_1E6289680);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "extent");
    objc_msgSend(v63, "imageByCroppingToRect:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    --v60;
  }
  while (v60);
  objc_msgSend(v59, "imageByApplyingFilter:", CFSTR("CIColorThresholdOtsu"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (id)preprocessNutritionLabel:(id)a3 finalFrame:(CGRect *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  unint64_t v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  int v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  double v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[4];
  _QWORD v61[6];

  v61[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0C9E1D0];
  v60[0] = *MEMORY[0x1E0C9E1F8];
  v60[1] = v7;
  v61[0] = v6;
  v61[1] = &unk_1E6288B38;
  v8 = *MEMORY[0x1E0C9E260];
  v60[2] = *MEMORY[0x1E0C9E1B0];
  v60[3] = v8;
  v61[2] = &unk_1E6288B68;
  v61[3] = &unk_1E6288B78;
  v9 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "imageByApplyingFilter:", CFSTR("CIColorInvert"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMTextLayoutManager largestDetectedContoursForImage:](self, "largestDetectedContoursForImage:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v6, "extent");
    -[AXMTextLayoutManager detectCenterContourFromContours:withImageExtent:](self, "detectCenterContourFromContours:withImageExtent:", v13);
    a4->origin.x = v14;
    a4->origin.y = v15;
    a4->size.width = v16;
    a4->size.height = v17;
    objc_msgSend(v6, "extent");
    v19 = (unint64_t)v18;
    v55 = v6;
    objc_msgSend(v6, "extent");
    -[AXMTextLayoutManager imageRectForNormalizedRect:imageWidth:imageHeight:](self, "imageRectForNormalizedRect:imageWidth:imageHeight:", v19, (unint64_t)v20, a4->origin.x, a4->origin.y, a4->size.width, a4->size.height);
    v54 = v12;
    objc_msgSend(v12, "imageByCroppingToRect:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "extent");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v21, "extent");
    v31 = v30 / 55.0;
    v32 = v21;
    v33 = 6;
    v34 = CFSTR("inputWidth");
    v53 = v32;
    do
    {
      v35 = v32;
      objc_msgSend(v32, "imageByClampingToExtent", v53);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v34;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v37 = v34;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = CFSTR("inputHeight");
      v59[0] = v38;
      v59[1] = &unk_1E62882B8;
      objc_msgSend(*(id *)(v9 + 3456), "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
      v39 = v9;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "imageByApplyingFilter:withInputParameters:", CFSTR("AXMCIMorphologyRectangleMinimum"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "imageByCroppingToRect:", v23, v25, v27, v29);
      v32 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v39;
      v34 = v37;

      --v33;
    }
    while (v33);
    v42 = v31 + 40.0;
    v43 = 6;
    do
    {
      v44 = v32;
      objc_msgSend(v32, "imageByClampingToExtent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v34;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v56[1] = CFSTR("inputHeight");
      v57[0] = v46;
      v57[1] = &unk_1E62882B8;
      objc_msgSend(*(id *)(v9 + 3456), "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "imageByApplyingFilter:withInputParameters:", CFSTR("AXMCIMorphologyRectangleMaximum"), v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "imageByCroppingToRect:", v23, v25, v27, v29);
      v32 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v39;
      v34 = v37;

      --v43;
    }
    while (v43);
    objc_msgSend(v32, "imageByApplyingFilter:", CFSTR("CIColorInvert"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "extent");
    objc_msgSend(v49, "addBorderWithBorderSize:", v50 * 0.01);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v54;
    v6 = v55;
  }
  else
  {
    v51 = 0;
  }

  return v51;
}

- (id)preprocessReceipt:(id)a3 withTextSkew:(double)a4 width:(unint64_t)a5 height:(unint64_t)a6 metrics:(id)a7 requestHandler:(id)a8 finalFrame:(CGRect *)a9
{
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  __int128 v41;
  void *v42;
  CGAffineTransform v45;
  CGAffineTransform v46;
  _QWORD v47[3];
  _QWORD v48[4];

  v48[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend(v13, "imageByApplyingFilter:", CFSTR("CIColorThresholdOtsu"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0C9E1B0];
  v47[0] = *MEMORY[0x1E0C9E1D0];
  v47[1] = v15;
  v48[0] = &unk_1E6288B38;
  v48[1] = &unk_1E6288B58;
  v47[2] = *MEMORY[0x1E0C9E260];
  v48[2] = &unk_1E6288B78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMTextLayoutManager largestDetectedContoursForImage:](self, "largestDetectedContoursForImage:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  objc_msgSend(v13, "extent");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  if (v19)
  {
    -[AXMTextLayoutManager detectCenterContourFromContours:withImageExtent:](self, "detectCenterContourFromContours:withImageExtent:", v18, v21, v23, v25, v27);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[AXMTextLayoutManager imageRectForNormalizedRect:imageWidth:imageHeight:](self, "imageRectForNormalizedRect:imageWidth:imageHeight:", a5, a6);
    v21 = v36;
    v23 = v37;
    v25 = v38;
    v27 = v39;
  }
  else
  {
    v33 = 1.0;
    v29 = 0.0;
    v31 = 0.0;
    v35 = 1.0;
  }
  a9->origin.x = v29;
  a9->origin.y = v31;
  a9->size.width = v33;
  a9->size.height = v35;
  objc_msgSend(v17, "imageByCroppingToRect:", v21, v23, v25, v27);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v46.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v46.c = v41;
  *(_OWORD *)&v46.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v45.a = *(_OWORD *)&v46.a;
  *(_OWORD *)&v45.c = v41;
  *(_OWORD *)&v45.tx = *(_OWORD *)&v46.tx;
  CGAffineTransformRotate(&v46, &v45, -a4);
  v45 = v46;
  objc_msgSend(v40, "imageByApplyingTransform:", &v45);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)largestDetectedContoursForImage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  double x;
  double y;
  double width;
  double height;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[3];
  CGRect BoundingBox;
  CGRect v53;

  v51[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)getVNDetectContoursRequestClass());
  v6 = (void *)objc_msgSend(objc_alloc((Class)getVNImageRequestHandlerClass_0()), "initWithCIImage:options:", v4, MEMORY[0x1E0C9AA70]);
  v51[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v8 = objc_msgSend(v6, "performRequests:error:", v7, &v48);
  v9 = v48;

  if (v8)
  {
    v36 = v4;
    objc_msgSend(v5, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v5;
    if (objc_msgSend(v11, "contourCount") >= 1)
    {
      v13 = 0;
      v14 = v9;
      do
      {
        v47 = v14;
        objc_msgSend(v11, "contourAtIndex:error:", v13, &v47);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v47;

        objc_msgSend(v12, "addObject:", v15);
        ++v13;
        v14 = v9;
      }
      while (objc_msgSend(v11, "contourCount") > v13);
    }
    v33 = v11;
    v34 = v9;
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_294);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v12;
    objc_msgSend(v12, "removeAllObjects");
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v16;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(obj);
          v21 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i));
          BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v21, "normalizedPath"));
          x = BoundingBox.origin.x;
          y = BoundingBox.origin.y;
          width = BoundingBox.size.width;
          height = BoundingBox.size.height;
          if (!-[AXMTextLayoutManager isBoundary:withinNormalizedDistance:ofBoundary:](self, "isBoundary:withinNormalizedDistance:ofBoundary:", 0, 0, 0x3FF0000000000000, 0x3FF0000000000000))
          {
            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            v26 = v37;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v40;
              while (2)
              {
                for (j = 0; j != v28; ++j)
                {
                  if (*(_QWORD *)v40 != v29)
                    objc_enumerationMutation(v26);
                  v53 = CGPathGetBoundingBox((CGPathRef)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j)), "normalizedPath"));
                  if (-[AXMTextLayoutManager isBoundary:withinNormalizedDistance:ofBoundary:](self, "isBoundary:withinNormalizedDistance:ofBoundary:", x, y, width, height, 0.02, *(_QWORD *)&v53.origin.x, *(_QWORD *)&v53.origin.y, *(_QWORD *)&v53.size.width, *(_QWORD *)&v53.size.height))
                  {

                    goto LABEL_21;
                  }
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
                if (v28)
                  continue;
                break;
              }
            }

            objc_msgSend(v26, "addObject:", v21);
          }
LABEL_21:
          ;
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v18);
    }

    objc_msgSend(v37, "ax_filteredArrayUsingBlock:", &__block_literal_global_296);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v35;
    v4 = v36;
    v9 = v34;
  }
  else
  {
    v31 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v31;
}

uint64_t __56__AXMTextLayoutManager_largestDetectedContoursForImage___block_invoke(int a1, id a2, void *a3)
{
  id v4;
  id v5;
  double x;
  double y;
  double width;
  double height;
  id v10;
  const CGPath *v11;
  CGRect BoundingBox;
  CGRect v17;

  v4 = objc_retainAutorelease(a2);
  v5 = a3;
  BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v4, "normalizedPath"));
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  v10 = objc_retainAutorelease(v5);
  v11 = (const CGPath *)objc_msgSend(v10, "normalizedPath");

  v17 = CGPathGetBoundingBox(v11);
  if (height > v17.size.height && width > v17.size.width && y < v17.origin.y && x < v17.origin.x)
    return -1;
  else
    return 1;
}

BOOL __56__AXMTextLayoutManager_largestDetectedContoursForImage___block_invoke_2(int a1, id a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL8 result;
  CGRect BoundingBox;
  CGRect v8;

  BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(objc_retainAutorelease(a2), "normalizedPath"));
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  result = 0;
  if (CGRectGetWidth(BoundingBox) > 0.25)
  {
    v8.origin.x = x;
    v8.origin.y = y;
    v8.size.width = width;
    v8.size.height = height;
    if (CGRectGetHeight(v8) > 0.25)
      return 1;
  }
  return result;
}

- (CGRect)detectCenterContourFromContours:(id)a3 withImageExtent:(CGRect)a4
{
  double height;
  double width;
  id v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t i;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  _BOOL4 v28;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGFloat x;
  CGFloat y;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;
  CGRect BoundingBox;
  CGRect v57;
  CGRect result;
  CGRect v59;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  y = a4.origin.y;
  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  v37 = v10;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v51;
    v38 = width;
    v15 = (unint64_t)width;
    v16 = (unint64_t)height;
    v46 = v10;
    v47 = v11;
    v35 = v9;
    v36 = v11;
    v34 = v8;
    v17 = height;
    v18 = v9;
    v39 = v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(v7);
        BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i)), "normalizedPath"));
        v44 = BoundingBox.origin.y;
        v45 = BoundingBox.origin.x;
        v42 = BoundingBox.size.height;
        v43 = BoundingBox.size.width;
        -[AXMTextLayoutManager imageRectForNormalizedRect:imageWidth:imageHeight:](self, "imageRectForNormalizedRect:imageWidth:imageHeight:", v15, v16);
        v21 = v20;
        v48 = v22;
        v24 = v23;
        v26 = v25;
        v49 = AXMRectDistance(x, y, v38, v17, v20, v22, v23, v25);
        v27 = AXMRectDistance(x, y, v38, v17, v8, v18, v47, v46);
        v57.origin.x = v8;
        v57.origin.y = v18;
        v57.size.width = v47;
        v57.size.height = v46;
        v59.origin.x = v21;
        v59.origin.y = v48;
        v59.size.width = v24;
        v59.size.height = v26;
        v28 = CGRectContainsRect(v57, v59);
        if (v49 < v27 || v28)
        {
          v8 = v21;
          v18 = v48;
          v46 = v26;
          v47 = v24;
          v36 = v43;
          v37 = v42;
          v34 = v45;
          v35 = v44;
        }
        v17 = v39;
      }
      v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v13);
  }
  else
  {
    v35 = v9;
    v36 = v11;
    v34 = v8;
  }

  v30 = v34;
  v31 = v35;
  v32 = v36;
  v33 = v37;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (BOOL)isBoundary:(CGRect)a3 withinNormalizedDistance:(double)a4 ofBoundary:(CGRect)a5
{
  double v5;
  BOOL v6;
  double v7;
  BOOL v8;
  double v9;

  v6 = vabdd_f64(a3.origin.x, a5.origin.x) > a4;
  v5 = vabdd_f64(a3.origin.y, a5.origin.y);
  v6 = v6 || v5 > a4;
  v7 = vabdd_f64(a3.size.width, a5.size.width);
  v8 = v6 || v7 > a4;
  v9 = vabdd_f64(a3.size.height, a5.size.height);
  return !v8 && v9 <= a4;
}

- (BOOL)isBoundary:(CGRect)a3 withinBoundary:(CGRect)a4 withNormalizedThreshold:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  CGFloat v16;
  CGFloat v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v16 = a3.size.width;
  v17 = a3.size.height;
  MinX = CGRectGetMinX(a3);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (MinX < CGRectGetMinX(v18) - a5)
    return 0;
  v19.origin.x = v10;
  v19.origin.y = v9;
  v19.size.width = v16;
  v19.size.height = v17;
  MinY = CGRectGetMinY(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (MinY < CGRectGetMinY(v20) - a5)
    return 0;
  v21.origin.x = v10;
  v21.origin.y = v9;
  v21.size.width = v16;
  v21.size.height = v17;
  MaxX = CGRectGetMaxX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (MaxX > CGRectGetMaxX(v22) + a5)
    return 0;
  v23.origin.x = v10;
  v23.origin.y = v9;
  v23.size.width = v16;
  v23.size.height = v17;
  MaxY = CGRectGetMaxY(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  return MaxY <= CGRectGetMaxY(v24) + a5;
}

- (CGRect)imageRectForNormalizedRect:(CGRect)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v5 = a3.origin.x * (double)a4;
  v6 = a3.size.width * (double)a4;
  v7 = a3.origin.y * (double)a5;
  v8 = a3.size.height * (double)a5;
  result.size.height = v8;
  result.size.width = v6;
  result.origin.y = v7;
  result.origin.x = v5;
  return result;
}

- (id)processReceiptText:(id)a3 foundMerchantName:(BOOL *)a4 preferredLocales:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  BOOL *v109;
  id v110;
  void *v111;
  id obj;
  id v113;
  id v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v113 = a5;
  v111 = v8;
  if (*a4)
  {
    v115 = 0;
    objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 16, &v115);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v115;
    if (objc_msgSend(v9, "numberOfMatchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")))
    {
      v114 = v8;
      v10 = v8;
      +[AXMAddressFormatter replaceDirectionalAbbreviations:](AXMAddressFormatter, "replaceDirectionalAbbreviations:", &v114);
      v11 = v114;

      v12 = v11;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("image.text.address"), &stru_1E6260C18, CFSTR("Accessibility"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(", %@"), v12);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
    }
    else
    {
      v108 = v9;
      v13 = objc_alloc_init(MEMORY[0x1E0CB3780]);
      objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "formUnionWithCharacterSet:", v35);

      objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "formUnionWithCharacterSet:", v36);

      v110 = v13;
      objc_msgSend(v13, "removeCharactersInString:", CFSTR(",$.€"));
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v8, "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        v37 = 0;
        do
        {
          v38 = objc_msgSend(v8, "characterAtIndex:", v37);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "rangeOfCharacterFromSet:", v13) == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v14, "appendFormat:", CFSTR("%C"), v38);
          else
            objc_msgSend(v14, "appendFormat:", CFSTR("%s"), " ");

          ++v37;
          v8 = v111;
        }
        while (v37 < objc_msgSend(v111, "length"));
      }
      v40 = objc_msgSend(v14, "length");
      -[AXMTextLayoutManager receiptRegularExpressions](self, "receiptRegularExpressions");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndex:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "firstMatchInString:options:range:", v14, 0, 0, v40);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v43 = objc_msgSend(v12, "range");
        objc_msgSend(v14, "substringWithRange:", v43, v44);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[AXMTextLayoutManager receiptRegularExpressions](self, "receiptRegularExpressions");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectAtIndex:", 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "firstMatchInString:options:range:", v14, 0, 0, v40);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v48 = objc_msgSend(v47, "range");
          objc_msgSend(v14, "substringWithRange:", v48, v49);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[AXMTextLayoutManager receiptRegularExpressions](self, "receiptRegularExpressions");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectAtIndex:", 2);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "firstMatchInString:options:range:", v14, 0, 0, v40);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = v52;
          if (v52)
          {
            v54 = objc_msgSend(v52, "range");
            objc_msgSend(v14, "substringWithRange:", v54, v55);
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v9 = v108;
          }
          else
          {
            -[AXMTextLayoutManager receiptRegularExpressions](self, "receiptRegularExpressions");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectAtIndex:", 3);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "firstMatchInString:options:range:", v14, 0, 0, v40);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (v58)
            {
              v59 = objc_msgSend(v58, "rangeAtIndex:", 1);
              v61 = v60;
              v62 = objc_msgSend(v58, "rangeAtIndex:", 2);
              v104 = v63;
              v64 = objc_msgSend(v58, "rangeAtIndex:", 3);
              v100 = v65;
              v102 = v64;
              v66 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "localizedStringForKey:value:table:", CFSTR("receipt.product.unitprice.total.formatter"), &stru_1E6260C18, CFSTR("Accessibility"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "substringWithRange:", v59, v61);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "substringWithRange:", v62, v104);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "substringWithRange:", v102, v100);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "stringWithFormat:", v67, v68, v69, v70);
              v71 = objc_claimAutoreleasedReturnValue();

              v72 = (void *)v71;
              v8 = v111;

              -[AXMTextLayoutManager filterReceiptForGarbageText:](self, "filterReceiptForGarbageText:", v71);
              v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v73 = v58;
              v9 = v108;
              v13 = v110;
              v53 = 0;
            }
            else
            {
              -[AXMTextLayoutManager receiptRegularExpressions](self, "receiptRegularExpressions");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "objectAtIndex:", 4);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "firstMatchInString:options:range:", v14, 0, 0, v40);
              v76 = (void *)objc_claimAutoreleasedReturnValue();

              v107 = v76;
              if (v76)
              {
                v77 = objc_msgSend(v76, "rangeAtIndex:", 1);
                v79 = v78;
                v80 = objc_msgSend(v76, "rangeAtIndex:", 2);
                v103 = v81;
                v101 = objc_msgSend(v76, "rangeAtIndex:", 3);
                v99 = v82;
                v97 = objc_msgSend(v76, "rangeAtIndex:", 4);
                v84 = v83;
                v105 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("receipt.product.qty.unitprice.total.formatter"), &stru_1E6260C18, CFSTR("Accessibility"));
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "substringWithRange:", v77, v79);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "substringWithRange:", v80, v103);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "substringWithRange:", v101, v99);
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "substringWithRange:", v97, v84);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v105, "stringWithFormat:", v85, v86, v87, v88, v89);
                v90 = (void *)objc_claimAutoreleasedReturnValue();

                v8 = v111;
                -[AXMTextLayoutManager filterReceiptForGarbageText:](self, "filterReceiptForGarbageText:", v90);
                v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                -[AXMTextLayoutManager receiptRegularExpressions](self, "receiptRegularExpressions");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "objectAtIndex:", 5);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "firstMatchInString:options:range:", v14, 0, 0, v40);
                v90 = (void *)objc_claimAutoreleasedReturnValue();

                if (v90)
                {
                  v93 = objc_msgSend(v90, "range");
                  objc_msgSend(v14, "substringWithRange:", v93, v94);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  -[AXMTextLayoutManager filterReceiptForGarbageText:](self, "filterReceiptForGarbageText:", v95);
                  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v15 = &stru_1E6260C18;
                }
              }
              v9 = v108;
              v13 = v110;
              v53 = 0;

              v73 = 0;
              v72 = v107;
            }

          }
        }

      }
    }

  }
  else
  {
    v109 = a4;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v18 = (void *)v16;
    objc_msgSend(v17, "componentsSeparatedByCharactersInSet:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != ''"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filteredArrayUsingPredicate:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("image.text.name"), &stru_1E6260C18, CFSTR("Accessibility"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingString:", CFSTR(","));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    obj = v21;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v120, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v117;
      while (2)
      {
        v28 = 0;
        v29 = v24;
        do
        {
          if (*(_QWORD *)v117 != v27)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v28);
          -[AXMTextLayoutManager semanticTextFactory](self, "semanticTextFactory");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v31, "_textExistsInLexicon:withLocale:", v30, v32);

          if ((v33 & 1) == 0 && !objc_msgSend(v30, "intValue"))
          {

            v24 = &stru_1E6260C18;
            goto LABEL_23;
          }
          -[__CFString stringByAppendingString:](v29, "stringByAppendingString:", CFSTR(" "));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringByAppendingString:", v30);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v28;
          v29 = v24;
        }
        while (v26 != v28);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v120, 16);
        if (v26)
          continue;
        break;
      }
    }
LABEL_23:

    -[AXMTextLayoutManager filterReceiptForGarbageText:](self, "filterReceiptForGarbageText:", v24);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((-[__CFString isEqualToString:](v15, "isEqualToString:", &stru_1E6260C18) & 1) == 0)
      *v109 ^= 1u;
    v8 = v111;
  }

  return v15;
}

- (id)filterReceiptForGarbageText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != ''"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    v13 = &stru_1E6260C18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v15, "length", (_QWORD)v24) >= 3
          && (unint64_t)objc_msgSend(v15, "length") <= 0x28
          && !-[AXMTextLayoutManager hasConsecutiveCharacters:withLength:](self, "hasConsecutiveCharacters:withLength:", v15, 5)&& !-[AXMTextLayoutManager hasConsecutiveDigits:withLength:](self, "hasConsecutiveDigits:withLength:", v15, 3))
        {
          -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR(" "));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByAppendingString:", v15);
          v17 = objc_claimAutoreleasedReturnValue();

          v13 = (__CFString *)v17;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }
  else
  {
    v13 = &stru_1E6260C18;
  }

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString componentsSeparatedByCharactersInSet:](v13, "componentsSeparatedByCharactersInSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != ''"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v21, "count") >= 2)
    v22 = v13;
  else
    v22 = &stru_1E6260C18;

  return v22;
}

- (BOOL)hasConsecutiveCharacters:(id)a3 withLength:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v5 = (objc_class *)MEMORY[0x1E0CB38E8];
  v6 = a3;
  v7 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(.)\\1{%lu}"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = (void *)objc_msgSend(v7, "initWithPattern:options:error:", v8, 1, &v12);

  objc_msgSend(v9, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10 != 0;
}

- (BOOL)hasConsecutiveDigits:(id)a3 withLength:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v5 = (objc_class *)MEMORY[0x1E0CB38E8];
  v6 = a3;
  v7 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\\d{%lu}"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = (void *)objc_msgSend(v7, "initWithPattern:options:error:", v8, 1, &v12);

  objc_msgSend(v9, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10 != 0;
}

- (id)sortContourRowResults:(id)a3 maxWidth:(double)a4 maxHeight:(double)a5 minWidth:(double)a6 minHeight:(double)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  double x;
  double y;
  double width;
  double height;
  void *v22;
  id v24;
  CGRect BoundingBox;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "contourCount") >= 1)
  {
    v13 = 0;
    v14 = 0;
    do
    {
      v15 = v14;
      v24 = v14;
      objc_msgSend(v11, "contourAtIndex:error:", v13, &v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v24;

      v17 = objc_retainAutorelease(v16);
      BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v17, "normalizedPath"));
      x = BoundingBox.origin.x;
      y = BoundingBox.origin.y;
      width = BoundingBox.size.width;
      height = BoundingBox.size.height;
      if (CGRectGetHeight(BoundingBox) <= a5)
      {
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        if (CGRectGetHeight(v26) >= a7)
        {
          v27.origin.x = x;
          v27.origin.y = y;
          v27.size.width = width;
          v27.size.height = height;
          if (CGRectGetWidth(v27) <= a4)
          {
            v28.origin.x = x;
            v28.origin.y = y;
            v28.size.width = width;
            v28.size.height = height;
            if (CGRectGetWidth(v28) >= a6)
            {
              objc_msgSend(MEMORY[0x1E0CB3B18], "axmValueWithCGRect:", x, y, width, height);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v22);

            }
          }
        }
      }

      ++v13;
    }
    while (objc_msgSend(v11, "contourCount") > v13);

  }
  objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_328);

  return v12;
}

uint64_t __84__AXMTextLayoutManager_sortContourRowResults_maxWidth_maxHeight_minWidth_minHeight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double MinY;
  double v7;
  CGRect v8;
  CGRect v9;

  memset(&v9, 0, sizeof(v9));
  v4 = a3;
  objc_msgSend(a2, "getValue:", &v9);
  memset(&v8, 0, sizeof(v8));
  objc_msgSend(v4, "getValue:", &v8);

  MinY = CGRectGetMinY(v9);
  if (MinY < CGRectGetMinY(v8))
    return -1;
  v7 = CGRectGetMinY(v9);
  return v7 > CGRectGetMinY(v8);
}

- (id)sortContourColumnResults:(id)a3 maxWidth:(double)a4 maxHeight:(double)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  double x;
  double y;
  double width;
  double height;
  void *v18;
  id v20;
  CGRect BoundingBox;
  CGRect v22;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "contourCount") >= 1)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = v10;
      v20 = v10;
      objc_msgSend(v7, "contourAtIndex:error:", v9, &v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v20;

      v13 = objc_retainAutorelease(v12);
      BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v13, "normalizedPath"));
      x = BoundingBox.origin.x;
      y = BoundingBox.origin.y;
      width = BoundingBox.size.width;
      height = BoundingBox.size.height;
      if (CGRectGetHeight(BoundingBox) < a5)
      {
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        if (CGRectGetWidth(v22) < a4)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "axmValueWithCGRect:", x, y, width, height);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v18);

        }
      }

      ++v9;
    }
    while (objc_msgSend(v7, "contourCount") > v9);

  }
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_329);

  return v8;
}

uint64_t __68__AXMTextLayoutManager_sortContourColumnResults_maxWidth_maxHeight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double MinX;
  double v7;
  CGRect v8;
  CGRect v9;

  memset(&v9, 0, sizeof(v9));
  v4 = a3;
  objc_msgSend(a2, "getValue:", &v9);
  memset(&v8, 0, sizeof(v8));
  objc_msgSend(v4, "getValue:", &v8);

  MinX = CGRectGetMinX(v9);
  if (MinX < CGRectGetMinX(v8))
    return -1;
  v7 = CGRectGetMinX(v9);
  return v7 > CGRectGetMinX(v8);
}

- (id)getTableRows:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  CGFloat MinY;
  void *v10;
  char v11;
  void *v12;
  CGFloat v13;
  void *v14;
  unint64_t v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  CGRect v25;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      memset(&v25, 0, sizeof(v25));
      objc_msgSend(v3, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getValue:", &v25);

      v8 = (void *)MEMORY[0x1E0CB37E8];
      MinY = CGRectGetMinY(v25);
      *(float *)&MinY = MinY;
      objc_msgSend(v8, "numberWithFloat:", MinY);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "containsObject:", v10);

      if ((v11 & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v13 = CGRectGetMinY(v25);
        *(float *)&v13 = v13;
        objc_msgSend(v12, "numberWithFloat:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
      ++v6;
    }
    while (objc_msgSend(v3, "count") > v6);
  }
  if (objc_msgSend(v5, "count"))
  {
    v15 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __37__AXMTextLayoutManager_getTableRows___block_invoke;
      v24[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16l;
      *(double *)&v24[4] = v18;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "filteredArrayUsingPredicate:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_332);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v21);

      ++v15;
    }
    while (objc_msgSend(v5, "count") > v15);
  }
  v22 = (void *)objc_msgSend(v4, "copy");

  return v22;
}

BOOL __37__AXMTextLayoutManager_getTableRows___block_invoke(uint64_t a1, void *a2)
{
  CGRect v4;

  memset(&v4, 0, sizeof(v4));
  objc_msgSend(a2, "getValue:", &v4);
  return CGRectGetMinY(v4) == *(double *)(a1 + 32);
}

uint64_t __37__AXMTextLayoutManager_getTableRows___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double MinX;
  double v7;
  CGRect v8;
  CGRect v9;

  memset(&v9, 0, sizeof(v9));
  v4 = a3;
  objc_msgSend(a2, "getValue:", &v9);
  memset(&v8, 0, sizeof(v8));
  objc_msgSend(v4, "getValue:", &v8);

  MinX = CGRectGetMinX(v9);
  if (MinX < CGRectGetMinX(v8))
    return -1;
  v7 = CGRectGetMinX(v9);
  return v7 > CGRectGetMinX(v8);
}

- (id)getTableColumns:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  CGFloat MinX;
  void *v10;
  char v11;
  void *v12;
  CGFloat v13;
  void *v14;
  unint64_t v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  CGRect v25;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      memset(&v25, 0, sizeof(v25));
      objc_msgSend(v3, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getValue:", &v25);

      v8 = (void *)MEMORY[0x1E0CB37E8];
      MinX = CGRectGetMinX(v25);
      *(float *)&MinX = MinX;
      objc_msgSend(v8, "numberWithFloat:", MinX);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "containsObject:", v10);

      if ((v11 & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v13 = CGRectGetMinX(v25);
        *(float *)&v13 = v13;
        objc_msgSend(v12, "numberWithFloat:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
      ++v6;
    }
    while (objc_msgSend(v3, "count") > v6);
  }
  if (objc_msgSend(v5, "count"))
  {
    v15 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __40__AXMTextLayoutManager_getTableColumns___block_invoke;
      v24[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16l;
      *(double *)&v24[4] = v18;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "filteredArrayUsingPredicate:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_333);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v21);

      ++v15;
    }
    while (objc_msgSend(v5, "count") > v15);
  }
  v22 = (void *)objc_msgSend(v4, "copy");

  return v22;
}

BOOL __40__AXMTextLayoutManager_getTableColumns___block_invoke(uint64_t a1, void *a2)
{
  CGRect v4;

  memset(&v4, 0, sizeof(v4));
  objc_msgSend(a2, "getValue:", &v4);
  return CGRectGetMinX(v4) == *(double *)(a1 + 32);
}

uint64_t __40__AXMTextLayoutManager_getTableColumns___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double MinY;
  double v7;
  CGRect v8;
  CGRect v9;

  memset(&v9, 0, sizeof(v9));
  v4 = a3;
  objc_msgSend(a2, "getValue:", &v9);
  memset(&v8, 0, sizeof(v8));
  objc_msgSend(v4, "getValue:", &v8);

  MinY = CGRectGetMinY(v9);
  if (MinY < CGRectGetMinY(v8))
    return -1;
  v7 = CGRectGetMinY(v9);
  return v7 > CGRectGetMinY(v8);
}

- (BOOL)verifyTable:(id)a3 sortedColumns:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") < 2 || (unint64_t)objc_msgSend(v6, "count") < 2)
    goto LABEL_26;
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v8 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") < 2)
        ++v8;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getValue:", &v24);

      v11 = *((double *)&v25 + 1);
      if (objc_msgSend(v9, "count"))
        break;
LABEL_11:

      if (objc_msgSend(v5, "count") <= (unint64_t)++v7)
        goto LABEL_14;
    }
    v12 = 0;
    while (1)
    {
      v23 = 0u;
      objc_msgSend(v9, "objectAtIndex:", v12, 0, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getValue:", &v22);

      if (vabdd_f64(*((double *)&v23 + 1), v11) > 0.005)
        goto LABEL_25;
      if (objc_msgSend(v9, "count") <= (unint64_t)++v12)
        goto LABEL_11;
    }
  }
  v8 = 0;
LABEL_14:
  if (v8 == objc_msgSend(v5, "count"))
    goto LABEL_26;
  if (objc_msgSend(v6, "count"))
  {
    v14 = 0;
    v15 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") < 2)
        ++v15;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v9, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "getValue:", &v24);

      v17 = *(double *)&v25;
      if (objc_msgSend(v9, "count"))
        break;
LABEL_23:

      if (objc_msgSend(v6, "count") <= (unint64_t)++v14)
        goto LABEL_29;
    }
    v18 = 0;
    while (1)
    {
      v23 = 0u;
      objc_msgSend(v9, "objectAtIndex:", v18, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "getValue:", &v22);

      if (vabdd_f64(*(double *)&v23, v17) > 0.005)
        break;
      if (objc_msgSend(v9, "count") <= (unint64_t)++v18)
        goto LABEL_23;
    }
LABEL_25:

LABEL_26:
    v20 = 0;
    goto LABEL_27;
  }
  v15 = 0;
LABEL_29:
  v20 = v15 != objc_msgSend(v6, "count");
LABEL_27:

  return v20;
}

- (id)nutritionLabelRowsForContourResults:(double)a3 normalizedNutritionLabelFrame:(double)a4 fullImageFrame:(double)a5 processedImageFrame:(double)a6
{
  id v23;
  void *v24;
  unint64_t v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;

  v23 = a11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    v25 = 0;
    v26 = 0.0;
    do
    {
      objc_msgSend(v23, "objectAtIndex:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "AXMRectValue");
      v29 = v28;

      if (v25)
      {
        objc_msgSend(v23, "objectAtIndex:", v25 - 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "AXMRectValue");
        v32 = v31;

        v33 = v32 - v29;
      }
      else
      {
        v33 = 1.0 - v29 + -0.005;
        v26 = a4 + a2;
      }
      v26 = v26 - a15 * v33 / a8;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", a1, v26, a3 + 0.01);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v34);

      ++v25;
    }
    while (objc_msgSend(v23, "count") > v25);
  }
  objc_msgSend(v24, "lastObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "AXMRectValue");
  v37 = v36 - a2;

  if (v37 > 0.05)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", a1, a2, a3, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v38);

  }
  return v24;
}

- (id)getReceiptRows:(id)a3 preferredLocales:(id)a4 canvasSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  unint64_t v10;
  double MaxY;
  void *v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double x;
  double v32;
  double y;
  double v34;
  double v35;
  double v36;
  double v37;
  float v38;
  double v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  float v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v53;
  void *v54;
  id obj;
  uint64_t v56;
  id v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  char v65;
  _BYTE v66[128];
  uint64_t v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  height = a5.height;
  width = a5.width;
  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v58 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v10 = 0;
    MaxY = 1.0;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "boundingBox");
      v17 = v13;
      v18 = v14;
      v19 = v15;
      v20 = v16;
      if (v10 && MaxY - CGRectGetMaxY(*(CGRect *)&v13) <= 0.006)
      {
        objc_msgSend(v9, "lastObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v12);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v21);

        v68.origin.x = v17;
        v68.origin.y = v18;
        v68.size.width = v19;
        v68.size.height = v20;
        MaxY = CGRectGetMaxY(v68);
      }

      ++v10;
    }
    while (objc_msgSend(v8, "count") > v10);
  }
  v53 = v8;
  v65 = 0;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v9;
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v59)
  {
    v56 = *(_QWORD *)v62;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v62 != v56)
          objc_enumerationMutation(obj);
        v60 = v23;
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v23), "sortedArrayUsingComparator:", &__block_literal_global_334);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndex:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "topCandidates:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "string");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndex:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "boundingBox");
        x = v30;
        y = v32;
        v35 = v34;
        v37 = v36;

        objc_msgSend(v27, "confidence");
        v39 = v38;
        if ((unint64_t)objc_msgSend(v24, "count") < 2)
        {
          v46 = v28;
        }
        else
        {
          v40 = 1;
          do
          {
            objc_msgSend(v24, "objectAtIndex:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "topCandidates:", 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "firstObject");
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            v44 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v43, "string");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "stringWithFormat:", CFSTR("%@ %@"), v28, v45, v53);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v41, "boundingBox");
            v71.origin.x = x;
            v71.origin.y = y;
            v71.size.width = v35;
            v71.size.height = v37;
            v70 = CGRectUnion(v69, v71);
            x = v70.origin.x;
            y = v70.origin.y;
            v35 = v70.size.width;
            v37 = v70.size.height;
            objc_msgSend(v27, "confidence");
            v39 = v39 + v47;

            ++v40;
            v28 = v46;
          }
          while (objc_msgSend(v24, "count") > v40);
        }
        if (objc_msgSend(v24, "count"))
          v39 = v39 / (double)(unint64_t)objc_msgSend(v24, "count");
        -[AXMTextLayoutManager processReceiptText:foundMerchantName:preferredLocales:](self, "processReceiptText:foundMerchantName:preferredLocales:", v46, &v65, v58);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXMVisionFeature tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:](AXMVisionFeature, "tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:", v48, MEMORY[0x1E0C9AA60], 0, x, y, v35, v37, v39, width, height);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "confidence");
        if (v50 > 0.0)
          objc_msgSend(v54, "addObject:", v49);

        v23 = v60 + 1;
      }
      while (v60 + 1 != v59);
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v59);
  }

  v51 = (void *)objc_msgSend(v54, "copy");
  return v51;
}

uint64_t __67__AXMTextLayoutManager_getReceiptRows_preferredLocales_canvasSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "boundingBox");
  v7 = v6;
  objc_msgSend(v5, "boundingBox");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "boundingBox");
    v11 = v10;
    objc_msgSend(v5, "boundingBox");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (id)textRowsForTable:(id)a3 sourceImage:(id)a4 requestHandler:(id)a5 canvasSize:(CGSize)a6
{
  double height;
  double width;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  __CFString *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  float v37;
  AXMVisionFeatureRecognizedText *v38;
  unint64_t v39;
  void *v40;
  double v41;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  id obj;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  _BYTE v66[128];
  _QWORD v67[3];

  height = a6.height;
  width = a6.width;
  v67[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init((Class)getVNRecognizeTextRequestClass_0());
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRecognitionLanguages:", v12);

  objc_msgSend(v11, "setRecognitionLevel:", 0);
  objc_msgSend(v11, "setUsesLanguageCorrection:", 0);
  v67[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v14 = objc_msgSend(v10, "performRequests:error:", v13, &v65);
  v15 = v65;

  if (v14)
  {
    v43 = v15;
    v44 = v11;
    v45 = v10;
    objc_msgSend(v11, "results");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v16 = 0;
      v47 = v9;
      do
      {
        objc_msgSend(v9, "objectAtIndex:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          v18 = 0;
          v50 = v17;
          v51 = v16;
          do
          {
            v63 = 0u;
            v64 = 0u;
            objc_msgSend(v17, "objectAtIndex:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "getValue:", &v63);

            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = __79__AXMTextLayoutManager_textRowsForTable_sourceImage_requestHandler_canvasSize___block_invoke;
            v60[3] = &__block_descriptor_64_e25_B24__0_8__NSDictionary_16l;
            v61 = v63;
            v62 = v64;
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v60);
            v20 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "filteredArrayUsingPredicate:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            obj = v21;
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
            v52 = (void *)v20;
            v53 = v18;
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v57;
              v25 = 0.0;
              v26 = &stru_1E6260C18;
              do
              {
                v27 = 0;
                v28 = v26;
                do
                {
                  if (*(_QWORD *)v57 != v24)
                    objc_enumerationMutation(obj);
                  objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v27), "topCandidates:", 1);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "firstObject");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v30, "string");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_1E6260C18);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", CFSTR(";"), &stru_1E6260C18);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  if (-[__CFString length](v28, "length"))
                    v34 = -[__CFString length](v28, "length") + 1;
                  else
                    v34 = 0;
                  v35 = objc_msgSend(v33, "length");
                  if (-[__CFString isEqualToString:](v28, "isEqualToString:", &stru_1E6260C18))
                  {
                    v36 = v33;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v28, v33);
                    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  v26 = v36;

                  objc_msgSend(v30, "confidence");
                  v25 = v25 + v37;
                  v38 = -[AXMVisionFeatureRecognizedText initWithRecognizedText:range:]([AXMVisionFeatureRecognizedText alloc], "initWithRecognizedText:range:", v30, v34, v35);
                  objc_msgSend(v55, "addObject:", v38);

                  ++v27;
                  v28 = v26;
                }
                while (v23 != v27);
                v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
              }
              while (v23);
            }
            else
            {
              v25 = 0.0;
              v26 = &stru_1E6260C18;
            }
            v16 = v51;

            v39 = objc_msgSend(obj, "count");
            +[AXMVisionFeature tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:](AXMVisionFeature, "tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:", v26, v55, v51 == 0, v63, v64, v25 / (double)v39, width, height);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "confidence");
            if (v41 > 0.0)
              objc_msgSend(v48, "addObject:", v40);

            v18 = v53 + 1;
            v17 = v50;
          }
          while (objc_msgSend(v50, "count") > (unint64_t)(v53 + 1));
        }
        if (objc_msgSend(v48, "count"))
          objc_msgSend(v46, "addObject:", v48);

        ++v16;
        v9 = v47;
      }
      while (objc_msgSend(v47, "count") > v16);
    }

    v11 = v44;
    v10 = v45;
    v15 = v43;
  }

  return v46;
}

BOOL __79__AXMTextLayoutManager_textRowsForTable_sourceImage_requestHandler_canvasSize___block_invoke(CGRect *a1, void *a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  objc_msgSend(a2, "boundingBox");
  v13 = CGRectInset(v12, 0.005, 0.005);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MinX = CGRectGetMinX(v13);
  if (MinX < CGRectGetMinX(a1[1]))
    return 0;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MaxX = CGRectGetMaxX(v14);
  if (MaxX > CGRectGetMaxX(a1[1]))
    return 0;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MinY = CGRectGetMinY(v15);
  if (MinY < CGRectGetMinY(a1[1]))
    return 0;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MaxY = CGRectGetMaxY(v16);
  return MaxY <= CGRectGetMaxY(a1[1]);
}

- (id)textColumnsForTable:(id)a3 sourceImage:(id)a4 requestHandler:(id)a5 canvasSize:(CGSize)a6
{
  double height;
  double width;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  float v40;
  unint64_t v41;
  void *v42;
  double v43;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  _BYTE v68[128];
  _QWORD v69[3];

  height = a6.height;
  width = a6.width;
  v69[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init((Class)getVNRecognizeTextRequestClass_0());
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRecognitionLanguages:", v12);

  objc_msgSend(v11, "setRecognitionLevel:", 0);
  objc_msgSend(v11, "setUsesLanguageCorrection:", 0);
  v69[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  v14 = objc_msgSend(v10, "performRequests:error:", v13, &v67);
  v15 = v67;

  if (v14)
  {
    v45 = v15;
    v46 = v11;
    v47 = v10;
    objc_msgSend(v11, "results");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v16 = 0;
      v17 = &stru_1E6260C18;
      v18 = CFSTR(",");
      v19 = CFSTR(";");
      v49 = v9;
      do
      {
        v50 = v16;
        objc_msgSend(v9, "objectAtIndex:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count"))
        {
          v21 = 0;
          v53 = v20;
          do
          {
            v65 = 0u;
            v66 = 0u;
            v55 = v21;
            objc_msgSend(v20, "objectAtIndex:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "getValue:", &v65);

            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __82__AXMTextLayoutManager_textColumnsForTable_sourceImage_requestHandler_canvasSize___block_invoke;
            v62[3] = &__block_descriptor_64_e25_B24__0_8__NSDictionary_16l;
            v63 = v65;
            v64 = v66;
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v62);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "filteredArrayUsingPredicate:");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            obj = v23;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v59;
              v27 = 0.0;
              v28 = (void *)v17;
              do
              {
                v29 = 0;
                v56 = v25;
                do
                {
                  if (*(_QWORD *)v59 != v26)
                    objc_enumerationMutation(obj);
                  objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v29), "topCandidates:", 1);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "firstObject");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v28, "isEqualToString:", v17))
                  {
                    objc_msgSend(v31, "string");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", v18, v17);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v34 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v31, "string");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", v18, v17);
                    v35 = v26;
                    v36 = v17;
                    v37 = v19;
                    v38 = v18;
                    v39 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "stringWithFormat:", CFSTR("%@ %@"), v28, v39);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();

                    v28 = (void *)v39;
                    v18 = v38;
                    v19 = v37;
                    v17 = v36;
                    v26 = v35;
                    v25 = v56;
                  }

                  objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", v19, v17);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v31, "confidence");
                  v27 = v27 + v40;

                  ++v29;
                }
                while (v25 != v29);
                v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
              }
              while (v25);
            }
            else
            {
              v27 = 0.0;
              v28 = (void *)v17;
            }
            v41 = objc_msgSend(obj, "count");
            +[AXMVisionFeature tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:](AXMVisionFeature, "tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:", v28, MEMORY[0x1E0C9AA60], 0, v65, v66, v27 / (double)v41, width, height);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "confidence");
            if (v43 > 0.0)
              objc_msgSend(v51, "addObject:", v42);

            v21 = v55 + 1;
            v20 = v53;
          }
          while (objc_msgSend(v53, "count") > (unint64_t)(v55 + 1));
        }
        if (objc_msgSend(v51, "count"))
          objc_msgSend(v48, "addObject:", v51);

        v9 = v49;
        v16 = v50 + 1;
      }
      while (objc_msgSend(v49, "count") > (unint64_t)(v50 + 1));
    }

    v11 = v46;
    v10 = v47;
    v15 = v45;
  }

  return v48;
}

BOOL __82__AXMTextLayoutManager_textColumnsForTable_sourceImage_requestHandler_canvasSize___block_invoke(CGRect *a1, void *a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  objc_msgSend(a2, "boundingBox");
  v13 = CGRectInset(v12, 0.005, 0.005);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MinX = CGRectGetMinX(v13);
  if (MinX < CGRectGetMinX(a1[1]))
    return 0;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MaxX = CGRectGetMaxX(v14);
  if (MaxX > CGRectGetMaxX(a1[1]))
    return 0;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MinY = CGRectGetMinY(v15);
  if (MinY < CGRectGetMinY(a1[1]))
    return 0;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MaxY = CGRectGetMaxY(v16);
  return MaxY <= CGRectGetMaxY(a1[1]);
}

- (id)featureCellsForNutritionLabelRows:(id)a3 withRequestHandler:(id)a4 withCanvasSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  __CFString *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  float v34;
  AXMVisionFeatureRecognizedText *v35;
  char v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  double v40;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  uint64_t v51;
  id obj;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  _BYTE v64[128];
  _QWORD v65[3];

  height = a5.height;
  width = a5.width;
  v65[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init((Class)getVNRecognizeTextRequestClass_0());
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRecognitionLanguages:", v11);

  objc_msgSend(v10, "setRecognitionLevel:", 0);
  objc_msgSend(v10, "setUsesLanguageCorrection:", 0);
  v65[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  v13 = objc_msgSend(v9, "performRequests:error:", v12, &v63);
  v14 = v63;

  if (v13)
  {
    v42 = v14;
    v43 = v10;
    v44 = v9;
    objc_msgSend(v10, "results");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v15 = 0;
      v47 = v8;
      do
      {
        v61 = 0u;
        v62 = 0u;
        v51 = v15;
        objc_msgSend(v8, "objectAtIndex:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "getValue:", &v61);

        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __92__AXMTextLayoutManager_featureCellsForNutritionLabelRows_withRequestHandler_withCanvasSize___block_invoke;
        v58[3] = &unk_1E625E0C0;
        v58[4] = self;
        v59 = v61;
        v60 = v62;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v58);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "filteredArrayUsingPredicate:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_339);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        obj = v18;
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v55;
          v22 = 0.0;
          v23 = &stru_1E6260C18;
          do
          {
            v24 = 0;
            v25 = v23;
            do
            {
              if (*(_QWORD *)v55 != v21)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v24), "topCandidates:", 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "firstObject");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v27, "string");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_1E6260C18);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR(";"), &stru_1E6260C18);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (-[__CFString length](v25, "length"))
                v31 = -[__CFString length](v25, "length") + 2;
              else
                v31 = 0;
              v32 = objc_msgSend(v30, "length");
              if (-[__CFString isEqualToString:](v25, "isEqualToString:", &stru_1E6260C18))
              {
                v33 = v30;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v25, v30);
                v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              v23 = v33;

              objc_msgSend(v27, "confidence");
              v22 = v22 + v34;
              v35 = -[AXMVisionFeatureRecognizedText initWithRecognizedText:range:]([AXMVisionFeatureRecognizedText alloc], "initWithRecognizedText:range:", v27, v31, v32);
              objc_msgSend(v53, "addObject:", v35);

              ++v24;
              v25 = v23;
            }
            while (v20 != v24);
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          }
          while (v20);
        }
        else
        {
          v22 = 0.0;
          v23 = &stru_1E6260C18;
        }

        v36 = AXMIsRunningInServiceProcess();
        v37 = (uint64_t)v23;
        if ((v36 & 1) == 0)
        {
          -[AXMTextLayoutManager processNutritionLabelText:](self, "processNutritionLabelText:", v23);
          v37 = objc_claimAutoreleasedReturnValue();
          v46 = (void *)v37;
        }
        v38 = objc_msgSend(obj, "count");
        +[AXMVisionFeature tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:](AXMVisionFeature, "tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:", v37, v53, 0, v61, v62, v22 / (double)v38, width, height);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v36 & 1) == 0)

        objc_msgSend(v39, "confidence");
        if (v40 > 0.0)
          objc_msgSend(v45, "addObject:", v39);

        v15 = v51 + 1;
        v8 = v47;
      }
      while (objc_msgSend(v47, "count") > (unint64_t)(v51 + 1));
    }

    v10 = v43;
    v9 = v44;
    v14 = v42;
  }

  return v45;
}

uint64_t __92__AXMTextLayoutManager_featureCellsForNutritionLabelRows_withRequestHandler_withCanvasSize___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "boundingBox");
  return objc_msgSend(*(id *)(a1 + 32), "isBoundary:withinBoundary:withNormalizedThreshold:", 0x3F7EB851EB851EB8);
}

uint64_t __92__AXMTextLayoutManager_featureCellsForNutritionLabelRows_withRequestHandler_withCanvasSize___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "topCandidates:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("\\d+%"), 1, 0);
  objc_msgSend(v3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = 1;
  else
    v8 = -1;

  return v8;
}

- (id)processNutritionLabelText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[0-9]/[0-9]"), 1, &v28);
  v6 = v28;
  v7 = objc_msgSend(v4, "length");
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v4;
  if (v8)
  {
    v22 = v6;
    v23 = v5;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    v9 = v4;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      v9 = v4;
      do
      {
        v14 = 0;
        v15 = v9;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "range");
          objc_msgSend(v15, "substringWithRange:", v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXMTextLayoutManager processFraction:](self, "processFraction:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", v18, v19);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          ++v14;
          v15 = v9;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v12);
    }

    v6 = v22;
    v5 = v23;
  }
  -[AXMTextLayoutManager processMeasurement:](self, "processMeasurement:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)processFraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "intValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXMTextLayoutManager numberFormatter](self, "numberFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromNumber:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectAtIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      v15 = (void *)MEMORY[0x1E0CB3940];
      if (v14 == 1)
        -[AXMTextLayoutManager fractionDenominatorValuesWithOneAsNumerator](self, "fractionDenominatorValuesWithOneAsNumerator");
      else
        -[AXMTextLayoutManager fractionDenominatorValues](self, "fractionDenominatorValues");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndex:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", (int)objc_msgSend(v17, "intValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %@"), v11, v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v19;
    }

    v4 = v11;
  }

  return v4;
}

- (id)processMeasurement:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AXMTextLayoutManager *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[AXMTextLayoutManager measurementAbbreviationsToVerboseString](self, "measurementAbbreviationsToVerboseString");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = v4;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v40;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(obj);
        v34 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v5);
        v7 = objc_msgSend(v4, "length", v29);
        v8 = objc_alloc(MEMORY[0x1E0CB38E8]);
        -[AXMTextLayoutManager measurementAbbreviationsToVerboseString](self, "measurementAbbreviationsToVerboseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v12 = (void *)objc_msgSend(v8, "initWithPattern:options:error:", v11, 1, &v38);
        v33 = v38;

        objc_msgSend(v12, "firstMatchInString:options:range:", v4, 0, 0, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = v4;
          v35 = v6;
          do
          {
            objc_msgSend(v12, "firstMatchInString:options:range:", v14, 0, 0, v7);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v37, "range");
            objc_msgSend(v14, "substringWithRange:", v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMTextLayoutManager measurementAbbreviationsToVerboseString](self, "measurementAbbreviationsToVerboseString");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectForKeyedSubscript:", v6);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndex:", 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMTextLayoutManager measurementAbbreviationsToVerboseString](self, "measurementAbbreviationsToVerboseString");
            v20 = v12;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v6);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndex:", 2);
            v23 = self;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", v19, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            self = v23;
            v12 = v20;

            v26 = v17;
            objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", v17, v25);
            v4 = (id)objc_claimAutoreleasedReturnValue();

            v7 = objc_msgSend(v4, "length");
            v6 = v35;

            objc_msgSend(v20, "firstMatchInString:options:range:", v4, 0, 0, v7);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v4;
          }
          while (v27);
        }

        v5 = v34 + 1;
      }
      while (v34 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v32);
  }

  return v4;
}

- (AXMSemanticTextFactory)semanticTextFactory
{
  return self->_semanticTextFactory;
}

- (void)setSemanticTextFactory:(id)a3
{
  objc_storeStrong((id *)&self->_semanticTextFactory, a3);
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (void)setMeasurementFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_measurementFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_semanticTextFactory, 0);
}

- (void)_assembleLayoutLines:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Creating new line with sequence", v4);
}

- (void)_assembleLayoutLines:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Adding sqeuence to line", v4);
}

- (void)_assembleLayoutLines:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1B0E3B000, v0, v1, "Will assemble lines...", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_assembleLayoutRegions:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Creating new region with line", v4);
}

- (void)_assembleLayoutRegions:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Adding line to region", v4);
}

- (void)_assembleLayoutRegions:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1B0E3B000, v0, v1, "Will assemble regions...", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_assembleLayoutRow:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Adding cell to row", v4);
}

- (void)_assembleLayoutHeader:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Adding cell to headeer", v4);
}

- (void)_assembleLayoutColumn:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Adding cell to column", v4);
}

- (void)_assembleLayoutRowFromCell:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1B0E3B000, v0, v1, "  Adding cell to row", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_assembleLayoutRowFromCell:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1B0E3B000, v0, OS_LOG_TYPE_DEBUG, "  Next cell: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_assembleLayoutTable:(_BYTE *)a1 header:(_BYTE *)a2 columnItems:.cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Adding column to table", v4);
}

- (void)_assembleLayoutTable:(_BYTE *)a1 header:(_BYTE *)a2 columnItems:.cold.2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Creating new table with header", v4);
}

- (void)_assembleLayoutTable:(_BYTE *)a1 header:(_BYTE *)a2 columnItems:.cold.3(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Adding row to table", v4);
}

- (void)_assembleLayoutTable:header:columnItems:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1B0E3B000, v0, v1, "Will assemble table...", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_assembleNutritionLabelLayoutWithRows:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Creating new label with header", v4);
}

- (void)_assembleNutritionLabelLayoutWithRows:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Adding row to label", v4);
}

- (void)_assembleNutritionLabelLayoutWithRows:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1B0E3B000, v0, v1, "Will assemble label...", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_assembleReceipt:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Creating new receipt", v4);
}

- (void)_assembleReceipt:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1B0E3B000, v2, v3, "  Adding row to receipt", v4);
}

- (void)_assembleReceipt:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1B0E3B000, v0, v1, "Will assemble receipt...", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
