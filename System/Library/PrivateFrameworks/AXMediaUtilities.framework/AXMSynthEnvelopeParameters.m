@implementation AXMSynthEnvelopeParameters

- (void)addSupportedParameters
{
  void *v3;
  void *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("kSynthParameterEnvelopeAttackTime");
  v5[1] = CFSTR("kSynthParameterEnvelopeAttackLevel");
  v5[2] = CFSTR("kSynthParameterEnvelopeDecayTime");
  v5[3] = CFSTR("kSynthParameterEnvelopeSustainLevel");
  v5[4] = CFSTR("kSynthParameterEnvelopeReleaseTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters supportedParameters](self, "supportedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v3);

}

+ (id)defaultParameters
{
  AXMSynthEnvelopeParameters *v2;

  v2 = objc_alloc_init(AXMSynthEnvelopeParameters);
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288B88, CFSTR("kSynthParameterEnvelopeAttackTime"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288B98, CFSTR("kSynthParameterEnvelopeAttackLevel"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288BA8, CFSTR("kSynthParameterEnvelopeDecayTime"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288BB8, CFSTR("kSynthParameterEnvelopeSustainLevel"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288BA8, CFSTR("kSynthParameterEnvelopeReleaseTime"));
  return v2;
}

- (float)sampleRate
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthEnvelopeParameters mainParameters](self, "mainParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleRate");
  v4 = v3;

  return v4;
}

- (float)attackMS
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterEnvelopeAttackTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setAttackTime:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (float)attackLevel
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterEnvelopeAttackLevel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setAttackLevel:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (float)decayMS
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterEnvelopeDecayTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setDecayTime:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (float)sustainLevel
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterEnvelopeSustainLevel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setSustainLevel:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (float)releaseMS
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterEnvelopeReleaseTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setReleaseTime:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (AXMSynthMainParameters)mainParameters
{
  return (AXMSynthMainParameters *)objc_loadWeakRetained((id *)&self->_mainParameters);
}

- (void)setMainParameters:(id)a3
{
  objc_storeWeak((id *)&self->_mainParameters, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainParameters);
}

@end
