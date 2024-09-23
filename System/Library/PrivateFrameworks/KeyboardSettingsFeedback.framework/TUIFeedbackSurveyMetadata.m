@implementation TUIFeedbackSurveyMetadata

- (TUIFeedbackSurveyMetadata)initWithBuild:(id)a3 model:(id)a4 language:(id)a5 region:(id)a6 initialPreferenceValue:(BOOL)a7 initialInputModes:(id)a8 initialTimestamp:(id)a9 finalPreferenceValue:(BOOL)a10 finalInputModes:(id)a11 finalTimestamp:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  TUIFeedbackSurveyMetadata *v25;
  TUIFeedbackSurveyMetadata *v26;
  _BOOL4 v28;
  objc_super v29;

  v28 = a7;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  v23 = a11;
  v24 = a12;
  v29.receiver = self;
  v29.super_class = (Class)TUIFeedbackSurveyMetadata;
  v25 = -[TUIFeedbackSurveyMetadata init](&v29, sel_init);
  v26 = v25;
  if (v25)
  {
    -[TUIFeedbackSurveyMetadata setBuild:](v25, "setBuild:", v17);
    -[TUIFeedbackSurveyMetadata setModel:](v26, "setModel:", v18);
    -[TUIFeedbackSurveyMetadata setLanguage:](v26, "setLanguage:", v19);
    -[TUIFeedbackSurveyMetadata setRegion:](v26, "setRegion:", v20);
    -[TUIFeedbackSurveyMetadata setInitialPreferenceValue:](v26, "setInitialPreferenceValue:", v28);
    -[TUIFeedbackSurveyMetadata setInitialInputModes:](v26, "setInitialInputModes:", v21);
    -[TUIFeedbackSurveyMetadata setInitialTimestamp:](v26, "setInitialTimestamp:", v22);
    -[TUIFeedbackSurveyMetadata setFinalPreferenceValue:](v26, "setFinalPreferenceValue:", a10);
    -[TUIFeedbackSurveyMetadata setFinalInputModes:](v26, "setFinalInputModes:", v23);
    -[TUIFeedbackSurveyMetadata setFinalTimestamp:](v26, "setFinalTimestamp:", v24);
  }

  return v26;
}

- (int64_t)duration
{
  NSDate *finalTimestamp;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  finalTimestamp = self->_finalTimestamp;
  -[TUIFeedbackSurveyMetadata initialTimestamp](self, "initialTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceDate:](finalTimestamp, "timeIntervalSinceDate:", v3);
  v5 = v4;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(&unk_2510849E8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(&unk_2510849E8);
        if (v5 < (double)(int)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "intValue"))
          return v8 + (int)v10;
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(&unk_2510849E8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    return 0;
  }
  return v11;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)initialPreferenceValue
{
  return self->_initialPreferenceValue;
}

- (void)setInitialPreferenceValue:(BOOL)a3
{
  self->_initialPreferenceValue = a3;
}

- (NSArray)initialInputModes
{
  return self->_initialInputModes;
}

- (void)setInitialInputModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)initialTimestamp
{
  return self->_initialTimestamp;
}

- (void)setInitialTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)finalPreferenceValue
{
  return self->_finalPreferenceValue;
}

- (void)setFinalPreferenceValue:(BOOL)a3
{
  self->_finalPreferenceValue = a3;
}

- (NSArray)finalInputModes
{
  return self->_finalInputModes;
}

- (void)setFinalInputModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)finalTimestamp
{
  return self->_finalTimestamp;
}

- (void)setFinalTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalTimestamp, 0);
  objc_storeStrong((id *)&self->_finalInputModes, 0);
  objc_storeStrong((id *)&self->_initialTimestamp, 0);
  objc_storeStrong((id *)&self->_initialInputModes, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
