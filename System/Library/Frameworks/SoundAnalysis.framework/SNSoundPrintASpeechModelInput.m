@implementation SNSoundPrintASpeechModelInput

- (SNSoundPrintASpeechModelInput)initWithInput1:(id)a3
{
  return -[SNSoundPrintASpeechModelInput initWithInput1:stateIn:detectedHistoryIn:](self, "initWithInput1:stateIn:detectedHistoryIn:", a3, 0, 0);
}

- (SNSoundPrintASpeechModelInput)initWithInput1:(id)a3 stateIn:(id)a4 detectedHistoryIn:(id)a5
{
  id v9;
  id v10;
  id v11;
  SNSoundPrintASpeechModelInput *v12;
  SNSoundPrintASpeechModelInput *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SNSoundPrintASpeechModelInput;
  v12 = -[SNSoundPrintASpeechModelInput init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_input1, a3);
    objc_storeStrong((id *)&v13->_stateIn, a4);
    objc_storeStrong((id *)&v13->_detectedHistoryIn, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA908);
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
      -[SNSoundPrintASpeechModelInput stateIn](self, "stateIn");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v8 = (void *)MEMORY[0x1E0C9E918];
        -[SNSoundPrintASpeechModelInput stateIn](self, "stateIn");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v10 = (void *)v9;
        objc_msgSend(v8, "featureValueWithMultiArray:", v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("detectedHistoryIn")))
      {
        v7 = 0;
        goto LABEL_12;
      }
      -[SNSoundPrintASpeechModelInput detectedHistoryIn](self, "detectedHistoryIn");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v8 = (void *)MEMORY[0x1E0C9E918];
        -[SNSoundPrintASpeechModelInput detectedHistoryIn](self, "detectedHistoryIn");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    v7 = 0;
    goto LABEL_11;
  }
  v5 = (void *)MEMORY[0x1E0C9E918];
  -[SNSoundPrintASpeechModelInput input1](self, "input1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
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
  objc_storeStrong((id *)&self->_stateIn, 0);
  objc_storeStrong((id *)&self->_input1, 0);
}

@end
