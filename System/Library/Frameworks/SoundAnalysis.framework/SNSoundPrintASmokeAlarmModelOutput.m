@implementation SNSoundPrintASmokeAlarmModelOutput

- (SNSoundPrintASmokeAlarmModelOutput)initWithInput_1:(id)a3 Confidence:(id)a4 Detected:(id)a5 thresholdedHistoryOut:(id)a6 detectedHistoryOut:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SNSoundPrintASmokeAlarmModelOutput *v17;
  SNSoundPrintASmokeAlarmModelOutput *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SNSoundPrintASmokeAlarmModelOutput;
  v17 = -[SNSoundPrintASmokeAlarmModelOutput init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_input_1, a3);
    objc_storeStrong((id *)&v18->_Confidence, a4);
    objc_storeStrong((id *)&v18->_Detected, a5);
    objc_storeStrong((id *)&v18->_thresholdedHistoryOut, a6);
    objc_storeStrong((id *)&v18->_detectedHistoryOut, a7);
  }

  return v18;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA800);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("input_1")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrintASmokeAlarmModelOutput input](self, "input");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Confidence")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrintASmokeAlarmModelOutput Confidence](self, "Confidence");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Detected")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrintASmokeAlarmModelOutput Detected](self, "Detected");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("thresholdedHistoryOut")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrintASmokeAlarmModelOutput thresholdedHistoryOut](self, "thresholdedHistoryOut");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("detectedHistoryOut")))
    {
      v8 = 0;
      goto LABEL_12;
    }
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrintASmokeAlarmModelOutput detectedHistoryOut](self, "detectedHistoryOut");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v8;
}

- (MLMultiArray)input_1
{
  return self->_input_1;
}

- (void)setInput_1:(id)a3
{
  objc_storeStrong((id *)&self->_input_1, a3);
}

- (MLMultiArray)Confidence
{
  return self->_Confidence;
}

- (void)setConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_Confidence, a3);
}

- (MLMultiArray)Detected
{
  return self->_Detected;
}

- (void)setDetected:(id)a3
{
  objc_storeStrong((id *)&self->_Detected, a3);
}

- (MLMultiArray)thresholdedHistoryOut
{
  return self->_thresholdedHistoryOut;
}

- (void)setThresholdedHistoryOut:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdedHistoryOut, a3);
}

- (MLMultiArray)detectedHistoryOut
{
  return self->_detectedHistoryOut;
}

- (void)setDetectedHistoryOut:(id)a3
{
  objc_storeStrong((id *)&self->_detectedHistoryOut, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedHistoryOut, 0);
  objc_storeStrong((id *)&self->_thresholdedHistoryOut, 0);
  objc_storeStrong((id *)&self->_Detected, 0);
  objc_storeStrong((id *)&self->_Confidence, 0);
  objc_storeStrong((id *)&self->_input_1, 0);
}

@end
