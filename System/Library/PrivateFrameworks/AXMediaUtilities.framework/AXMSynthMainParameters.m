@implementation AXMSynthMainParameters

- (AXMSynthMainParameters)init
{
  AXMSynthMainParameters *v2;
  uint64_t v3;
  AXMSynthOscillatorParameters *mainOsc1Params;
  uint64_t v5;
  AXMSynthOscillatorParameters *mainOsc2Params;
  uint64_t v7;
  AXMSynthOscillatorParameters *mainOsc3Params;
  uint64_t v9;
  AXMSynthOscillatorParameters *fmOperatorAParams;
  uint64_t v11;
  AXMSynthOscillatorParameters *fmOperatorBParams;
  uint64_t v13;
  AXMSynthOscillatorParameters *fmOperatorCParams;
  uint64_t v15;
  AXMSynthOscillatorParameters *fmOperatorDParams;
  double v17;
  double v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AXMSynthMainParameters;
  v2 = -[AXMSynthObservableParameters init](&v20, sel_init);
  if (v2)
  {
    +[AXMSynthOscillatorParameters defaultParameters](AXMSynthOscillatorParameters, "defaultParameters");
    v3 = objc_claimAutoreleasedReturnValue();
    mainOsc1Params = v2->_mainOsc1Params;
    v2->_mainOsc1Params = (AXMSynthOscillatorParameters *)v3;

    +[AXMSynthOscillatorParameters defaultParameters](AXMSynthOscillatorParameters, "defaultParameters");
    v5 = objc_claimAutoreleasedReturnValue();
    mainOsc2Params = v2->_mainOsc2Params;
    v2->_mainOsc2Params = (AXMSynthOscillatorParameters *)v5;

    +[AXMSynthOscillatorParameters defaultParameters](AXMSynthOscillatorParameters, "defaultParameters");
    v7 = objc_claimAutoreleasedReturnValue();
    mainOsc3Params = v2->_mainOsc3Params;
    v2->_mainOsc3Params = (AXMSynthOscillatorParameters *)v7;

    +[AXMSynthOscillatorParameters defaultParameters](AXMSynthOscillatorParameters, "defaultParameters");
    v9 = objc_claimAutoreleasedReturnValue();
    fmOperatorAParams = v2->_fmOperatorAParams;
    v2->_fmOperatorAParams = (AXMSynthOscillatorParameters *)v9;

    +[AXMSynthOscillatorParameters defaultParameters](AXMSynthOscillatorParameters, "defaultParameters");
    v11 = objc_claimAutoreleasedReturnValue();
    fmOperatorBParams = v2->_fmOperatorBParams;
    v2->_fmOperatorBParams = (AXMSynthOscillatorParameters *)v11;

    +[AXMSynthOscillatorParameters defaultParameters](AXMSynthOscillatorParameters, "defaultParameters");
    v13 = objc_claimAutoreleasedReturnValue();
    fmOperatorCParams = v2->_fmOperatorCParams;
    v2->_fmOperatorCParams = (AXMSynthOscillatorParameters *)v13;

    +[AXMSynthOscillatorParameters defaultParameters](AXMSynthOscillatorParameters, "defaultParameters");
    v15 = objc_claimAutoreleasedReturnValue();
    fmOperatorDParams = v2->_fmOperatorDParams;
    v2->_fmOperatorDParams = (AXMSynthOscillatorParameters *)v15;

    -[AXMSynthOscillatorParameters setIdentifier:](v2->_mainOsc1Params, "setIdentifier:", CFSTR("1"));
    -[AXMSynthOscillatorParameters setIdentifier:](v2->_mainOsc2Params, "setIdentifier:", CFSTR("2"));
    -[AXMSynthOscillatorParameters setIdentifier:](v2->_mainOsc3Params, "setIdentifier:", CFSTR("3"));
    -[AXMSynthOscillatorParameters setIdentifier:](v2->_fmOperatorAParams, "setIdentifier:", CFSTR("A"));
    -[AXMSynthOscillatorParameters setIdentifier:](v2->_fmOperatorBParams, "setIdentifier:", CFSTR("B"));
    -[AXMSynthOscillatorParameters setIdentifier:](v2->_fmOperatorCParams, "setIdentifier:", CFSTR("C"));
    -[AXMSynthOscillatorParameters setIdentifier:](v2->_fmOperatorDParams, "setIdentifier:", CFSTR("D"));
    -[AXMSynthOscillatorParameters setMainParameters:](v2->_mainOsc1Params, "setMainParameters:", v2);
    -[AXMSynthOscillatorParameters setMainParameters:](v2->_mainOsc2Params, "setMainParameters:", v2);
    -[AXMSynthOscillatorParameters setMainParameters:](v2->_mainOsc3Params, "setMainParameters:", v2);
    -[AXMSynthOscillatorParameters setMainParameters:](v2->_fmOperatorAParams, "setMainParameters:", v2);
    -[AXMSynthOscillatorParameters setMainParameters:](v2->_fmOperatorBParams, "setMainParameters:", v2);
    -[AXMSynthOscillatorParameters setMainParameters:](v2->_fmOperatorCParams, "setMainParameters:", v2);
    -[AXMSynthOscillatorParameters setMainParameters:](v2->_fmOperatorDParams, "setMainParameters:", v2);
    LODWORD(v17) = 0;
    -[AXMSynthOscillatorParameters setGain:](v2->_mainOsc3Params, "setGain:", v17);
    LODWORD(v18) = 0;
    -[AXMSynthOscillatorParameters setGain:](v2->_mainOsc2Params, "setGain:", v18);
  }
  return v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)AXMSynthMainParameters;
  -[AXMSynthObservableParameters dictionaryRepresentation](&v18, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AXMSynthMainParameters allOscillatorParameters](self, "allOscillatorParameters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "dictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (NSArray)allOscillatorParameters
{
  AXMSynthOscillatorParameters *mainOsc2Params;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  mainOsc2Params = self->_mainOsc2Params;
  v4[0] = self->_mainOsc1Params;
  v4[1] = mainOsc2Params;
  v4[2] = self->_mainOsc3Params;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)allOperatorParameters
{
  AXMSynthOscillatorParameters *fmOperatorBParams;
  AXMSynthOscillatorParameters *fmOperatorDParams;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  fmOperatorBParams = self->_fmOperatorBParams;
  v5[0] = self->_fmOperatorAParams;
  v5[1] = fmOperatorBParams;
  fmOperatorDParams = self->_fmOperatorDParams;
  v5[2] = self->_fmOperatorCParams;
  v5[3] = fmOperatorDParams;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)oscillatorParametersWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynthMainParameters oscillatorParametersWithIdentifiers:](self, "oscillatorParametersWithIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)oscillatorParametersWithIdentifiers:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v12;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("1")))
        {
          -[AXMSynthMainParameters mainOsc1Params](self, "mainOsc1Params");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("2")))
        {
          -[AXMSynthMainParameters mainOsc2Params](self, "mainOsc2Params");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("3")))
        {
          -[AXMSynthMainParameters mainOsc3Params](self, "mainOsc3Params");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("A")))
        {
          -[AXMSynthMainParameters fmOperatorAParams](self, "fmOperatorAParams");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("B")))
        {
          -[AXMSynthMainParameters fmOperatorBParams](self, "fmOperatorBParams");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("C")))
        {
          -[AXMSynthMainParameters fmOperatorCParams](self, "fmOperatorCParams");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("D")))
            continue;
          -[AXMSynthMainParameters fmOperatorDParams](self, "fmOperatorDParams");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v4;
}

- (float)sampleRate
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterSampleRate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setSampleRate:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (float)baseFrequency
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterBaseFrequency"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setBaseFrequency:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (float)mainVolume
{
  void *v2;
  float v3;
  float v4;

  -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", CFSTR("kSynthParameterMainVolume"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setMainVolume:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters setValue:forParameter:](self, "setValue:forParameter:");

}

- (void)addSupportedParameters
{
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("kSynthParameterSampleRate");
  v4[1] = CFSTR("kSynthParameterMainVolume");
  v4[2] = CFSTR("kSynthParameterBaseFrequency");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters addSupportedParameters:](self, "addSupportedParameters:", v3);

}

+ (id)defaultParameters
{
  AXMSynthMainParameters *v2;

  v2 = objc_alloc_init(AXMSynthMainParameters);
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288D18, CFSTR("kSynthParameterMainVolume"));
  -[AXMSynthObservableParameters setValue:forParameter:](v2, "setValue:forParameter:", &unk_1E6288D28, CFSTR("kSynthParameterBaseFrequency"));
  return v2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  float v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AXMSynthMainParameters mainVolume](self, "mainVolume");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p gain=%.2f\n\toscillators:\n\t\t%@\n\t\t%@\n\t\t%@\n\toperators:\n\t\t%@\n\t\t%@\n\t\t%@\n\t\t%@\n>"), v4, self, v5, self->_mainOsc1Params, self->_mainOsc2Params, self->_mainOsc3Params, self->_fmOperatorAParams, self->_fmOperatorBParams, self->_fmOperatorCParams, self->_fmOperatorDParams);
}

- (AXMSynthOscillatorParameters)mainOsc1Params
{
  return self->_mainOsc1Params;
}

- (void)setMainOsc1Params:(id)a3
{
  objc_storeStrong((id *)&self->_mainOsc1Params, a3);
}

- (AXMSynthOscillatorParameters)mainOsc2Params
{
  return self->_mainOsc2Params;
}

- (void)setMainOsc2Params:(id)a3
{
  objc_storeStrong((id *)&self->_mainOsc2Params, a3);
}

- (AXMSynthOscillatorParameters)mainOsc3Params
{
  return self->_mainOsc3Params;
}

- (void)setMainOsc3Params:(id)a3
{
  objc_storeStrong((id *)&self->_mainOsc3Params, a3);
}

- (AXMSynthOscillatorParameters)fmOperatorAParams
{
  return self->_fmOperatorAParams;
}

- (void)setFmOperatorAParams:(id)a3
{
  objc_storeStrong((id *)&self->_fmOperatorAParams, a3);
}

- (AXMSynthOscillatorParameters)fmOperatorBParams
{
  return self->_fmOperatorBParams;
}

- (void)setFmOperatorBParams:(id)a3
{
  objc_storeStrong((id *)&self->_fmOperatorBParams, a3);
}

- (AXMSynthOscillatorParameters)fmOperatorCParams
{
  return self->_fmOperatorCParams;
}

- (void)setFmOperatorCParams:(id)a3
{
  objc_storeStrong((id *)&self->_fmOperatorCParams, a3);
}

- (AXMSynthOscillatorParameters)fmOperatorDParams
{
  return self->_fmOperatorDParams;
}

- (void)setFmOperatorDParams:(id)a3
{
  objc_storeStrong((id *)&self->_fmOperatorDParams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmOperatorDParams, 0);
  objc_storeStrong((id *)&self->_fmOperatorCParams, 0);
  objc_storeStrong((id *)&self->_fmOperatorBParams, 0);
  objc_storeStrong((id *)&self->_fmOperatorAParams, 0);
  objc_storeStrong((id *)&self->_mainOsc3Params, 0);
  objc_storeStrong((id *)&self->_mainOsc2Params, 0);
  objc_storeStrong((id *)&self->_mainOsc1Params, 0);
}

@end
