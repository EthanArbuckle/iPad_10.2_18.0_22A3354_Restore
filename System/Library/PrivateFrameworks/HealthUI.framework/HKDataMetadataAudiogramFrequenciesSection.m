@implementation HKDataMetadataAudiogramFrequenciesSection

- (HKDataMetadataAudiogramFrequenciesSection)initWithSample:(id)a3 leftEar:(BOOL)a4 unitController:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  HKDataMetadataAudiogramFrequenciesSection *v15;
  HKDataMetadataAudiogramFrequenciesSection *v16;
  HKDataMetadataAudiogramFrequenciesSection *v17;
  objc_super v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6)
      v13 = CFSTR("LEFT_FULL");
    else
      v13 = CFSTR("RIGHT_FULL");
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v19.receiver = self;
    v19.super_class = (Class)HKDataMetadataAudiogramFrequenciesSection;
    v15 = -[HKDataMetadataSimpleSection initWithTitle:](&v19, sel_initWithTitle_, v14);
    v16 = v15;
    if (v15)
      -[HKDataMetadataAudiogramFrequenciesSection _addCellsFromAudiogramSample:forLeftEar:unitController:](v15, "_addCellsFromAudiogramSample:forLeftEar:unitController:", v10, v6, v9);
    self = v16;

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_sensitivityQuantityFromSensitivityPoint:(id)a3 isLeftEar:(BOOL)a4
{
  if (a4)
    objc_msgSend(a3, "leftEarSensitivity");
  else
    objc_msgSend(a3, "rightEarSensitivity");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_addCellsFromAudiogramSample:(id)a3 forLeftEar:(BOOL)a4 unitController:(id)a5
{
  _BOOL8 v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  _BYTE v25[128];
  uint64_t v26;

  v5 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v19 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a3, "sensitivityPoints");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[HKDataMetadataAudiogramFrequenciesSection _sensitivityQuantityFromSensitivityPoint:isLeftEar:](self, "_sensitivityQuantityFromSensitivityPoint:isLeftEar:", v12, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[HKDataMetadataAudiogramFrequenciesSection _formattedFrequencyStringFromSensitivityPoint:](self, "_formattedFrequencyStringFromSensitivityPoint:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKDataMetadataAudiogramFrequenciesSection _formattedSensitivityStringFromSensitivityPoint:isLeftEar:unitController:](self, "_formattedSensitivityStringFromSensitivityPoint:isLeftEar:unitController:", v12, v5, v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = CFSTR("HKAudiogramSample");
          v24[1] = CFSTR("Sensitivity");
          v24[2] = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          HKUIJoinStringsForAutomationIdentifier(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKDataMetadataSimpleSection addText:detail:baseIdentifier:](self, "addText:detail:baseIdentifier:", v15, v14, v17);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

}

- (id)_formattedFrequencyStringFromSensitivityPoint:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "frequency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "hertzUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  HKNumberFormatterWithDecimalPrecision(5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 / 1000.0 >= 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 / 1000.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("KILOHERTZ_NUMBERLESS_UNIT");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("HERTZ_NUMBERLESS_UNIT");
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormatValueAndUnit(v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_formattedSensitivityStringFromSensitivityPoint:(id)a3 isLeftEar:(BOOL)a4 unitController:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a4;
  v8 = (void *)MEMORY[0x1E0CB6CD0];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "decibelHearingLevelUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataAudiogramFrequenciesSection _sensitivityQuantityFromSensitivityPoint:isLeftEar:](self, "_sensitivityQuantityFromSensitivityPoint:isLeftEar:", v10, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "doubleValueForUnit:", v11);
  objc_msgSend(v13, "numberWithDouble:", HKRoundWithPositiveZeroForDoubleValue(v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKNumberFormatterFromTemplate(0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringFromValue(v15, 0, v9, 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedDisplayNameForUnit:value:", v11, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  HKFormatValueAndUnit(v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
