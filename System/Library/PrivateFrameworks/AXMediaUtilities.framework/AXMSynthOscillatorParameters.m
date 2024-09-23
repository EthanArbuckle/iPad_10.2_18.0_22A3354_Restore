@implementation AXMSynthOscillatorParameters

- (AXMSynthOscillatorParameters)init
{
  AXMSynthOscillatorParameters *v2;
  uint64_t v3;
  AXMSynthEnvelopeParameters *envelopeParameters;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXMSynthOscillatorParameters;
  v2 = -[AXMSynthObservableParameters init](&v7, sel_init);
  if (v2)
  {
    +[AXMSynthEnvelopeParameters defaultParameters](AXMSynthEnvelopeParameters, "defaultParameters");
    v3 = objc_claimAutoreleasedReturnValue();
    envelopeParameters = v2->_envelopeParameters;
    v2->_envelopeParameters = (AXMSynthEnvelopeParameters *)v3;

    -[AXMSynthOscillatorParameters mainParameters](v2, "mainParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMSynthEnvelopeParameters setMainParameters:](v2->_envelopeParameters, "setMainParameters:", v5);

  }
  return v2;
}

- (void)addFmOperatorIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterFMOperatorIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(v4, "arrayByAddingObject:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:", v5, CFSTR("kSynthParameterFMOperatorIdentifiers"));
    -[AXMSynthOscillatorParameters mainParameters](self, "mainParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oscillatorParametersWithIdentifier:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXMSynthOscillatorParameters identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forParameter:", v8, CFSTR("kSynthParameterFMTargetIdentifier"));

  }
}

- (void)removeFmOperatorIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterFMOperatorIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v9))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "removeObject:", v9);
    v6 = (void *)objc_msgSend(v5, "copy");
    -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:", v6, CFSTR("kSynthParameterFMOperatorIdentifiers"));

    -[AXMSynthOscillatorParameters mainParameters](self, "mainParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oscillatorParametersWithIdentifier:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setValue:forParameter:", 0, CFSTR("kSynthParameterFMTargetIdentifier"));
  }

}

- (AXMSynthOscillatorParameters)fmTargetParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXMSynthOscillatorParameters fmTargetIdentifier](self, "fmTargetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXMSynthOscillatorParameters mainParameters](self, "mainParameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMSynthOscillatorParameters fmTargetIdentifier](self, "fmTargetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oscillatorParametersWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (AXMSynthOscillatorParameters *)v6;
}

- (void)routeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AXMSynthOscillatorParameters fmTargetParameters](self, "fmTargetParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynthOscillatorParameters identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFmOperatorIdentifier:", v5);

  -[AXMSynthOscillatorParameters identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addFmOperatorIdentifier:", v6);

}

- (NSString)displayName
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AXMSynthOscillatorParameters fmTargetIdentifier](self, "fmTargetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("Operator");
  if (!v3)
    v4 = CFSTR("Oscillator");
  v5 = v4;

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[AXMSynthOscillatorParameters identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)identifier
{
  return (NSString *)-[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterIdentifier"));
}

- (void)setIdentifier:(id)a3
{
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:", a3, CFSTR("kSynthParameterIdentifier"));
}

- (int64_t)waveform
{
  void *v2;
  int64_t v3;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterWaveform"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setWaveform:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (float)sampleRate
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[AXMSynthOscillatorParameters mainParameters](self, "mainParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueForParameter:", CFSTR("kSynthParameterSampleRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (float)baseFrequency
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[AXMSynthOscillatorParameters mainParameters](self, "mainParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueForParameter:", CFSTR("kSynthParameterBaseFrequency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setBaseFrequency:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (float)frequencyRatio
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterFrequencyRatio"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setFrequencyRatio:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (NSArray)fmOperatorIdentifiers
{
  return (NSArray *)-[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterFMOperatorIdentifiers"));
}

- (NSString)fmTargetIdentifier
{
  return (NSString *)-[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterFMTargetIdentifier"));
}

- (float)gain
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterGain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setGain:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (int64_t)detuning
{
  void *v2;
  int64_t v3;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterDetuning"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setDetuning:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (BOOL)isBypassed
{
  void *v2;
  char v3;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterBypass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setIsBypassed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (void)addSupportedParameters
{
  void *v3;
  void *v4;
  _QWORD v5[11];

  v5[10] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("kSynthParameterIdentifier");
  v5[1] = CFSTR("kSynthParameterGain");
  v5[2] = CFSTR("kSynthParameterWaveform");
  v5[3] = CFSTR("kSynthParameterFrequencyRatio");
  v5[4] = CFSTR("kSynthParameterDetuning");
  v5[5] = CFSTR("kSynthParameterFMOperatorIdentifiers");
  v5[6] = CFSTR("kSynthParameterFMTargetIdentifier");
  v5[7] = CFSTR("kSynthParameterBypass");
  v5[8] = CFSTR("kSynthParameterADSREnvelope");
  v5[9] = CFSTR("kSynthParameterLowpassCutoff");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters supportedParameters](self, "supportedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v3);

}

+ (id)defaultParameters
{
  AXMSynthOscillatorParameters *v2;

  v2 = objc_alloc_init(AXMSynthOscillatorParameters);
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &stru_1E6260C18, CFSTR("kSynthParameterIdentifier"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288BC8, CFSTR("kSynthParameterGain"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288420, CFSTR("kSynthParameterWaveform"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288BD8, CFSTR("kSynthParameterFrequencyRatio"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288438, CFSTR("kSynthParameterDetuning"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", MEMORY[0x1E0C9AA60], CFSTR("kSynthParameterFMOperatorIdentifiers"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", 0, CFSTR("kSynthParameterFMTargetIdentifier"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", MEMORY[0x1E0C9AAB0], CFSTR("kSynthParameterBypass"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288BE8, CFSTR("kSynthParameterLowpassCutoff"));
  return v2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  _BOOL4 v13;
  const __CFString *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AXMSynthOscillatorParameters identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynthOscillatorParameters gain](self, "gain");
  v7 = v6;
  -[AXMSynthOscillatorParameters baseFrequency](self, "baseFrequency");
  v9 = v8;
  -[AXMSynthOscillatorParameters frequencyRatio](self, "frequencyRatio");
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXMSynthOscillatorParameters waveform](self, "waveform"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AXMSynthOscillatorParameters isBypassed](self, "isBypassed");
  v14 = &stru_1E6260C18;
  if (v13)
    v14 = CFSTR("bypassed");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p id=%@ gain=%.2f frq=%.1f wf=%@ %@>"), v4, self, v5, v7, (float)(v9 * v11), v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (AXMSynthMainParameters)mainParameters
{
  return (AXMSynthMainParameters *)objc_loadWeakRetained((id *)&self->_mainParameters);
}

- (void)setMainParameters:(id)a3
{
  objc_storeWeak((id *)&self->_mainParameters, a3);
}

- (AXMSynthEnvelopeParameters)envelopeParameters
{
  return self->_envelopeParameters;
}

- (float)lowpassCutoff
{
  return self->_lowpassCutoff;
}

- (void)setLowpassCutoff:(float)a3
{
  self->_lowpassCutoff = a3;
}

- (float)reverbMix
{
  return self->_reverbMix;
}

- (void)setReverbMix:(float)a3
{
  self->_reverbMix = a3;
}

- (BOOL)reverbIsBypassed
{
  return self->_reverbIsBypassed;
}

- (void)setReverbIsBypassed:(BOOL)a3
{
  self->_reverbIsBypassed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_envelopeParameters, 0);
  objc_destroyWeak((id *)&self->_mainParameters);
}

@end
