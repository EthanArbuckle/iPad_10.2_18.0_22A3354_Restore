@implementation AXMSynth

- (AXMSynth)initWithSampleRate:(double)a3 envelope:(id)a4
{
  id v7;
  AXMSynth *v8;
  uint64_t v9;
  AXMSynthMainParameters *parameters;
  double v11;
  AXMOscillator *v12;
  void *v13;
  uint64_t v14;
  AXMOscillator *oscillator1;
  AXMOscillator *v16;
  void *v17;
  uint64_t v18;
  AXMOscillator *oscillator2;
  AXMOscillator *v20;
  void *v21;
  uint64_t v22;
  AXMOscillator *oscillator3;
  AXMOscillator *v24;
  void *v25;
  uint64_t v26;
  AXMOscillator *operator1;
  AXMOscillator *v28;
  void *v29;
  uint64_t v30;
  AXMOscillator *operator2;
  AXMOscillator *v32;
  void *v33;
  uint64_t v34;
  AXMOscillator *operator3;
  AXMOscillator *v36;
  void *v37;
  uint64_t v38;
  AXMOscillator *operator4;
  double v40;
  double v41;
  objc_super v43;

  v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)AXMSynth;
  v8 = -[AXMSynth init](&v43, sel_init);
  if (v8)
  {
    +[AXMSynthMainParameters defaultParameters](AXMSynthMainParameters, "defaultParameters");
    v9 = objc_claimAutoreleasedReturnValue();
    parameters = v8->_parameters;
    v8->_parameters = (AXMSynthMainParameters *)v9;

    *(float *)&v11 = a3;
    -[AXMSynthMainParameters setSampleRate:](v8->_parameters, "setSampleRate:", v11);
    objc_storeStrong((id *)&v8->_envelope, a4);
    v8->_gain = 0.707945784;
    v8->_sampleRate = a3;
    v12 = [AXMOscillator alloc];
    -[AXMSynthMainParameters mainOsc1Params](v8->_parameters, "mainOsc1Params");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[AXMOscillator initWithParameters:parentSynth:](v12, "initWithParameters:parentSynth:", v13, v8);
    oscillator1 = v8->_oscillator1;
    v8->_oscillator1 = (AXMOscillator *)v14;

    v16 = [AXMOscillator alloc];
    -[AXMSynthMainParameters mainOsc2Params](v8->_parameters, "mainOsc2Params");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[AXMOscillator initWithParameters:parentSynth:](v16, "initWithParameters:parentSynth:", v17, v8);
    oscillator2 = v8->_oscillator2;
    v8->_oscillator2 = (AXMOscillator *)v18;

    v20 = [AXMOscillator alloc];
    -[AXMSynthMainParameters mainOsc3Params](v8->_parameters, "mainOsc3Params");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[AXMOscillator initWithParameters:parentSynth:](v20, "initWithParameters:parentSynth:", v21, v8);
    oscillator3 = v8->_oscillator3;
    v8->_oscillator3 = (AXMOscillator *)v22;

    v24 = [AXMOscillator alloc];
    -[AXMSynthMainParameters fmOperatorAParams](v8->_parameters, "fmOperatorAParams");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[AXMOscillator initWithParameters:parentSynth:](v24, "initWithParameters:parentSynth:", v25, v8);
    operator1 = v8->_operator1;
    v8->_operator1 = (AXMOscillator *)v26;

    v28 = [AXMOscillator alloc];
    -[AXMSynthMainParameters fmOperatorBParams](v8->_parameters, "fmOperatorBParams");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[AXMOscillator initWithParameters:parentSynth:](v28, "initWithParameters:parentSynth:", v29, v8);
    operator2 = v8->_operator2;
    v8->_operator2 = (AXMOscillator *)v30;

    v32 = [AXMOscillator alloc];
    -[AXMSynthMainParameters fmOperatorCParams](v8->_parameters, "fmOperatorCParams");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[AXMOscillator initWithParameters:parentSynth:](v32, "initWithParameters:parentSynth:", v33, v8);
    operator3 = v8->_operator3;
    v8->_operator3 = (AXMOscillator *)v34;

    v36 = [AXMOscillator alloc];
    -[AXMSynthMainParameters fmOperatorDParams](v8->_parameters, "fmOperatorDParams");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[AXMOscillator initWithParameters:parentSynth:](v36, "initWithParameters:parentSynth:", v37, v8);
    operator4 = v8->_operator4;
    v8->_operator4 = (AXMOscillator *)v38;

    -[AXMOscillator setIsBypassed:](v8->_oscillator1, "setIsBypassed:", 0);
    -[AXMOscillator setWaveform:](v8->_oscillator1, "setWaveform:", 0);
    -[AXMOscillator setIsBypassed:](v8->_operator1, "setIsBypassed:", 0);
    -[AXMOscillator setWaveform:](v8->_operator1, "setWaveform:", 1);
    LODWORD(v40) = 0.5;
    -[AXMOscillator setFrequencyRatio:](v8->_operator1, "setFrequencyRatio:", v40);
    LODWORD(v41) = 1061997773;
    -[AXMOscillator setGain:](v8->_operator1, "setGain:", v41);
    -[AXMOscillator routeTo:](v8->_operator1, "routeTo:", v8->_oscillator1);
    v8->_sampleBuffer = (double *)malloc_type_malloc(0x8000uLL, 0x100004000313F17uLL);
  }

  return v8;
}

- (double)baseFrequency
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[AXMSynth parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueForParameter:", CFSTR("kSynthParameterBaseFrequency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setBaseFrequency:(double)a3
{
  void *v4;
  id v5;

  -[AXMSynth parameters](self, "parameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forParameter:", v4, CFSTR("kSynthParameterBaseFrequency"));

}

- (void)setSampleRate:(double)a3
{
  void *v4;
  id v5;

  -[AXMSynth parameters](self, "parameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forParameter:", v4, CFSTR("kSynthParameterSampleRate"));

}

- (float)mainVolume
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[AXMSynth parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueForParameter:", CFSTR("kSynthParameterMainVolume"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setMainVolume:(float)a3
{
  double v4;
  void *v5;
  id v6;

  -[AXMSynth parameters](self, "parameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forParameter:", v5, CFSTR("kSynthParameterMainVolume"));

}

- (void)playNote:(float)a3
{
  -[AXMSynth setBaseFrequency:](self, "setBaseFrequency:", a3);
  -[AXMSynth enumerateOscillatorsWithBlock:](self, "enumerateOscillatorsWithBlock:", &__block_literal_global_21);
}

uint64_t __21__AXMSynth_playNote___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "start");
}

- (void)releaseNote
{
  -[AXMSynth enumerateOscillatorsWithBlock:](self, "enumerateOscillatorsWithBlock:", &__block_literal_global_62);
}

uint64_t __23__AXMSynth_releaseNote__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

- (void)enumerateOscillatorsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[AXMSynth allOscillators](self, "allOscillators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynth allOperators](self, "allOperators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSArray)allOscillators
{
  __int128 v3;
  AXMOscillator *oscillator3;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->_oscillator1;
  oscillator3 = self->_oscillator3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)allOperators
{
  AXMOscillator *operator1;
  __int128 v4;
  AXMOscillator *operator4;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  operator1 = self->_operator1;
  v4 = *(_OWORD *)&self->_operator2;
  operator4 = self->_operator4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &operator1, 4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)allOscillatorsAndOperators
{
  void *v3;
  void *v4;
  void *v5;

  -[AXMSynth allOscillators](self, "allOscillators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynth allOperators](self, "allOperators");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)oscillatorWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AXMSynth allOscillatorsAndOperators](self, "allOscillatorsAndOperators", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)oscillatorsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynth allOscillators](self, "allOscillators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynth allOperators](self, "allOperators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "identifier", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v4, "containsObject:", v14);

        if (v15)
          objc_msgSend(v5, "addObject:", v13);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v5, "copy");
  return v16;
}

- (void)bypassAllOperatorsAndOscillators
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[AXMSynth allOscillatorsAndOperators](self, "allOscillatorsAndOperators", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setIsBypassed:", 1);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)bypassEnvelopes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AXMSynth allOscillatorsAndOperators](self, "allOscillatorsAndOperators", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "envelope");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setIsBypassed:", 1);

        objc_msgSend(v6, "updateCache");
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

- (double)getNextSample
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  uint64_t i;
  double v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AXMSynth allOscillators](self, "allOscillators");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    v5 = 0.0;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "getNextSample", (_QWORD)v9);
        v5 = v7 + v5;
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }
  else
  {
    v5 = 0.0;
  }

  return fminf(v5, 1.0);
}

- (void)loadPreset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  float v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterMainVolume"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  -[AXMSynth setMainVolume:](self, "setMainVolume:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterBaseFrequency"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  -[AXMSynth setBaseFrequency:](self, "setBaseFrequency:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterSampleRate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  -[AXMSynth setSampleRate:](self, "setSampleRate:", v9);

  -[AXMSynth bypassAllOperatorsAndOscillators](self, "bypassAllOperatorsAndOscillators");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthEnabledOscillators"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "valueForKey:", CFSTR("kSynthParameterIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMSynth oscillatorWithIdentifier:](self, "oscillatorWithIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v16;
        v18 = (void *)objc_msgSend(v17, "initWithDictionary:", v14);

        objc_msgSend(v18, "setIsBypassed:", 0);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (AXMADSREnvelope)envelope
{
  return self->_envelope;
}

- (double)gain
{
  return self->_gain;
}

- (void)setGain:(double)a3
{
  self->_gain = a3;
}

- (AXMSynthMainParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (AXMOscillator)oscillator1
{
  return self->_oscillator1;
}

- (void)setOscillator1:(id)a3
{
  objc_storeStrong((id *)&self->_oscillator1, a3);
}

- (AXMOscillator)oscillator2
{
  return self->_oscillator2;
}

- (void)setOscillator2:(id)a3
{
  objc_storeStrong((id *)&self->_oscillator2, a3);
}

- (AXMOscillator)oscillator3
{
  return self->_oscillator3;
}

- (void)setOscillator3:(id)a3
{
  objc_storeStrong((id *)&self->_oscillator3, a3);
}

- (AXMOscillator)operator1
{
  return self->_operator1;
}

- (void)setOperator1:(id)a3
{
  objc_storeStrong((id *)&self->_operator1, a3);
}

- (AXMOscillator)operator2
{
  return self->_operator2;
}

- (void)setOperator2:(id)a3
{
  objc_storeStrong((id *)&self->_operator2, a3);
}

- (AXMOscillator)operator3
{
  return self->_operator3;
}

- (void)setOperator3:(id)a3
{
  objc_storeStrong((id *)&self->_operator3, a3);
}

- (AXMOscillator)operator4
{
  return self->_operator4;
}

- (void)setOperator4:(id)a3
{
  objc_storeStrong((id *)&self->_operator4, a3);
}

- (double)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(double *)a3
{
  self->_sampleBuffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operator4, 0);
  objc_storeStrong((id *)&self->_operator3, 0);
  objc_storeStrong((id *)&self->_operator2, 0);
  objc_storeStrong((id *)&self->_operator1, 0);
  objc_storeStrong((id *)&self->_oscillator3, 0);
  objc_storeStrong((id *)&self->_oscillator2, 0);
  objc_storeStrong((id *)&self->_oscillator1, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_envelope, 0);
}

@end
