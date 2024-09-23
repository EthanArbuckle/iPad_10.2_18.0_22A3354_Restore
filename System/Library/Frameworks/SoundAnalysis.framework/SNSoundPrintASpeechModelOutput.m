@implementation SNSoundPrintASpeechModelOutput

- (SNSoundPrintASpeechModelOutput)initWithInput_1:(id)a3 Confidence:(id)a4 Detected:(id)a5 detectedHistoryOut:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SNSoundPrintASpeechModelOutput *v15;
  SNSoundPrintASpeechModelOutput *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SNSoundPrintASpeechModelOutput;
  v15 = -[SNSoundPrintASpeechModelOutput init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_input_1, a3);
    objc_storeStrong((id *)&v16->_Confidence, a4);
    objc_storeStrong((id *)&v16->_Detected, a5);
    objc_storeStrong((id *)&v16->_detectedHistoryOut, a6);
  }

  return v16;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA920);
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
    -[SNSoundPrintASpeechModelOutput input](self, "input");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Confidence")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrintASpeechModelOutput Confidence](self, "Confidence");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Detected")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrintASpeechModelOutput Detected](self, "Detected");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("detectedHistoryOut")))
    {
      v8 = 0;
      goto LABEL_10;
    }
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrintASpeechModelOutput detectedHistoryOut](self, "detectedHistoryOut");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
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
  objc_storeStrong((id *)&self->_Detected, 0);
  objc_storeStrong((id *)&self->_Confidence, 0);
  objc_storeStrong((id *)&self->_input_1, 0);
}

@end
