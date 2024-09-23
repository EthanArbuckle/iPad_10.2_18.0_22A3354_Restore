@implementation HKAudioExposureDataProviderCurrentValue

- (HKAudioExposureDataProviderCurrentValue)initWithLEQQuantity:(id)a3 secondsListened:(double)a4 daysAggregated:(int64_t)a5 date:(id)a6
{
  id v11;
  id v12;
  HKAudioExposureDataProviderCurrentValue *v13;
  objc_super v15;

  v11 = a3;
  v12 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HKAudioExposureDataProviderCurrentValue;
  v13 = -[HKAudioExposureDataProviderCurrentValue init](&v15, sel_init);
  if (v13)
  {
    v13->_classification = objc_msgSend(MEMORY[0x1E0CB62F8], "classifyLEQ:forDuration:overDays:", v11, a5, a4);
    objc_storeStrong((id *)&v13->_leqQuantity, a3);
    v13->_secondsListened = a4;
    v13->_daysAggregated = a5;
    objc_storeStrong((id *)&v13->_date, a6);
  }

  return v13;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0DC1140];
  v20[0] = *MEMORY[0x1E0DC1138];
  v20[1] = v8;
  v21[0] = a5;
  v9 = (void *)MEMORY[0x1E0DC3658];
  v10 = a5;
  objc_msgSend(v9, "hk_chartLollipopValueColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB62F8], "localizedDisplayNameForClassification:", self->_classification);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudioExposureDataProviderCurrentValue _attributedSymbolForClassification:font:](self, "_attributedSymbolForClassification:font:", self->_classification, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v12);
  objc_msgSend(v15, "appendAttributedString:", v16);

  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  v18 = (void *)objc_msgSend(v17, "initWithString:attributes:", v13, v12);
  objc_msgSend(v15, "appendAttributedString:", v18);

  return v15;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKAudioExposureDataProviderCurrentValue date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKLastUpdatedText(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lastUpdatedShortDescriptionWithDateCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKAudioExposureDataProviderCurrentValue date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKMostRecentSampleEndDateText(v5, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringWithDisplayType:(id)a3 unitController:(id)a4
{
  HKQuantity *leqQuantity;
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t daysAggregated;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;

  if (self->_classification)
  {
    leqQuantity = self->_leqQuantity;
    v7 = (void *)MEMORY[0x1E0CB6CD0];
    v8 = a4;
    v9 = a3;
    objc_msgSend(v7, "decibelAWeightedSoundPressureLevelUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantity doubleValueForUnit:](leqQuantity, "doubleValueForUnit:", v10);
    v12 = v11;

    objc_msgSend(v8, "unitForDisplayType:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_valueFormatterForUnit:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromValue:displayType:unitController:", v15, v9, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secondsListened);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HKTimePeriodString(v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    daysAggregated = self->_daysAggregated;
    if (daysAggregated == 1)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = CFSTR("AUDIO_EXPOSURE_TODAYS_AVG_DESCRIPTION");
    }
    else
    {
      v24 = 0;
      if (daysAggregated < 2 || (unint64_t)daysAggregated > *MEMORY[0x1E0CB4B98])
        goto LABEL_9;
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = CFSTR("AUDIO_EXPOSURE_WEEKS_AVG_DESCRIPTION");
    }
    objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v25, v16, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    return v24;
  }
  v24 = 0;
  return v24;
}

- (id)attributedSupplementaryStringWithDisplayType:(id)a3 unitController:(id)a4 font:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[HKAudioExposureDataProviderCurrentValue stringWithDisplayType:unitController:](self, "stringWithDisplayType:unitController:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC1140];
  v16[0] = *MEMORY[0x1E0DC1138];
  v16[1] = v11;
  v17[0] = v8;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);

  v14 = (void *)objc_msgSend(v13, "initWithString:attributes:", v9, v12);
  return v14;
}

- (id)_attributedSymbolForClassification:(unint64_t)a3 font:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  if (a3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "hk_hearingHealthAudioExposureSymbolForClassification:font:", a3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

    v8 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendAttributedString:", v9);

    v10 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E9C4C428);
  }

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_leqQuantity, 0);
}

@end
