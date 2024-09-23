@implementation SNSoundPrintASmokeAlarmModelInput

- (SNSoundPrintASmokeAlarmModelInput)initWithInput1:(id)a3
{
  return -[SNSoundPrintASmokeAlarmModelInput initWithInput1:stateIn:thresholdedHistoryIn:detectedHistoryIn:](self, "initWithInput1:stateIn:thresholdedHistoryIn:detectedHistoryIn:", a3, 0, 0, 0);
}

- (SNSoundPrintASmokeAlarmModelInput)initWithInput1:(id)a3 stateIn:(id)a4 thresholdedHistoryIn:(id)a5 detectedHistoryIn:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SNSoundPrintASmokeAlarmModelInput *v15;
  SNSoundPrintASmokeAlarmModelInput *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SNSoundPrintASmokeAlarmModelInput;
  v15 = -[SNSoundPrintASmokeAlarmModelInput init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_input1, a3);
    objc_storeStrong((id *)&v16->_stateIn, a4);
    objc_storeStrong((id *)&v16->_thresholdedHistoryIn, a5);
    objc_storeStrong((id *)&v16->_detectedHistoryIn, a6);
  }

  return v16;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA7E8);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("input1")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("stateIn")))
    {
      -[SNSoundPrintASmokeAlarmModelInput stateIn](self, "stateIn");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v8 = (void *)MEMORY[0x1E0C9E918];
        -[SNSoundPrintASmokeAlarmModelInput stateIn](self, "stateIn");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v10 = (void *)v9;
        objc_msgSend(v8, "featureValueWithMultiArray:", v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("thresholdedHistoryIn")))
    {
      -[SNSoundPrintASmokeAlarmModelInput thresholdedHistoryIn](self, "thresholdedHistoryIn");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v8 = (void *)MEMORY[0x1E0C9E918];
        -[SNSoundPrintASmokeAlarmModelInput thresholdedHistoryIn](self, "thresholdedHistoryIn");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("detectedHistoryIn")))
      {
        v7 = 0;
        goto LABEL_15;
      }
      -[SNSoundPrintASmokeAlarmModelInput detectedHistoryIn](self, "detectedHistoryIn");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v8 = (void *)MEMORY[0x1E0C9E918];
        -[SNSoundPrintASmokeAlarmModelInput detectedHistoryIn](self, "detectedHistoryIn");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v7 = 0;
    goto LABEL_14;
  }
  v5 = (void *)MEMORY[0x1E0C9E918];
  -[SNSoundPrintASmokeAlarmModelInput input1](self, "input1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_15:
  return v7;
}

- (MLMultiArray)input1
{
  return self->_input1;
}

- (void)setInput1:(id)a3
{
  objc_storeStrong((id *)&self->_input1, a3);
}

- (MLMultiArray)stateIn
{
  return self->_stateIn;
}

- (void)setStateIn:(id)a3
{
  objc_storeStrong((id *)&self->_stateIn, a3);
}

- (MLMultiArray)thresholdedHistoryIn
{
  return self->_thresholdedHistoryIn;
}

- (void)setThresholdedHistoryIn:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdedHistoryIn, a3);
}

- (MLMultiArray)detectedHistoryIn
{
  return self->_detectedHistoryIn;
}

- (void)setDetectedHistoryIn:(id)a3
{
  objc_storeStrong((id *)&self->_detectedHistoryIn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedHistoryIn, 0);
  objc_storeStrong((id *)&self->_thresholdedHistoryIn, 0);
  objc_storeStrong((id *)&self->_stateIn, 0);
  objc_storeStrong((id *)&self->_input1, 0);
}

@end
