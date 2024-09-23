@implementation AXMOscillator

- (void)updateCache
{
  NSArray *v3;
  NSArray *cachedFMOperators;
  float v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AXMOscillator fmOperators](self, "fmOperators");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cachedFMOperators = self->_cachedFMOperators;
  self->_cachedFMOperators = v3;

  -[AXMOscillator sampleRate](self, "sampleRate");
  self->_cachedSampleRate = v5;
  -[AXMOscillator gain](self, "gain");
  self->_cachedGain = v6;
  -[AXMOscillator baseFrequency](self, "baseFrequency");
  self->_cachedBaseFrequency = v7;
  -[AXMOscillator frequencyRatio](self, "frequencyRatio");
  self->_cachedFrequencyRatio = v8;
  self->_cachedWaveform = -[AXMOscillator waveform](self, "waveform");
  self->_cachedIsBypassed = -[AXMOscillator isBypassed](self, "isBypassed");
  -[AXMOscillator envelope](self, "envelope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedEnvelopeIsBypassed = objc_msgSend(v9, "isBypassed");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = self->_cachedFMOperators;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "updateCache", (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (AXMOscillator)initWithParameters:(id)a3 parentSynth:(id)a4
{
  id v7;
  id v8;
  AXMOscillator *v9;
  AXMOscillator *v10;
  AXMOscillatorADSREnvelope *v11;
  void *v12;
  uint64_t v13;
  AXMOscillatorADSREnvelope *envelope;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXMOscillator;
  v9 = -[AXMOscillator init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_parentSynth, v8);
    objc_storeStrong((id *)&v10->_parameters, a3);
    v10->_sampleBuffer = (double *)malloc_type_malloc(0x8000uLL, 0x100004000313F17uLL);
    v11 = [AXMOscillatorADSREnvelope alloc];
    objc_msgSend(v7, "envelopeParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AXMOscillatorADSREnvelope initWithParameters:parentSynth:](v11, "initWithParameters:parentSynth:", v12, v8);
    envelope = v10->_envelope;
    v10->_envelope = (AXMOscillatorADSREnvelope *)v13;

  }
  return v10;
}

- (AXMOscillator)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  double v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  double v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  double v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  double v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterDetuning"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMOscillator setDetuning:](self, "setDetuning:", (int)objc_msgSend(v5, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterLowpassCutoff"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  -[AXMOscillator setLowpassCutoff:](self, "setLowpassCutoff:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterFrequencyRatio"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  -[AXMOscillator setFrequencyRatio:](self, "setFrequencyRatio:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterWaveform"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMOscillator setWaveform:](self, "setWaveform:", (int)objc_msgSend(v8, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMOscillator setIdentifier:](self, "setIdentifier:", v10);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterBypass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMOscillator setIsBypassed:](self, "setIsBypassed:", objc_msgSend(v11, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterADSREnvelope"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kSynthParameterEnvelopeAttackTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;
  -[AXMOscillator envelope](self, "envelope");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = v15;
  objc_msgSend(v16, "setAttackMS:", v17);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kSynthParameterEnvelopeAttackLevel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;
  -[AXMOscillator envelope](self, "envelope");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = v20;
  objc_msgSend(v21, "setAttackLevel:", v22);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kSynthParameterEnvelopeReleaseTime"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v25 = v24;
  -[AXMOscillator envelope](self, "envelope");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = v25;
  objc_msgSend(v26, "setReleaseMS:", v27);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kSynthParameterEnvelopeSustainLevel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  v30 = v29;
  -[AXMOscillator envelope](self, "envelope");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = v30;
  objc_msgSend(v31, "setSustainLevel:", v32);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kSynthParameterEnvelopeDecayTime"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");
  v35 = v34;
  -[AXMOscillator envelope](self, "envelope");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = v35;
  objc_msgSend(v36, "setDecayMS:", v37);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSynthParameterFMOperatorIdentifiers"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "count"))
  {
    -[AXMOscillator parentSynth](self, "parentSynth");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "oscillatorWithIdentifier:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "routeTo:", self);
  }

  return self;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sampleBuffer);
  v3.receiver = self;
  v3.super_class = (Class)AXMOscillator;
  -[AXMOscillator dealloc](&v3, sel_dealloc);
}

- (void)start
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
  -[AXMOscillatorADSREnvelope activate](self->_envelope, "activate");
}

- (void)routeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AXMOscillator parameters](self, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeTo:", v5);

}

- (void)stop
{
  self->_startTime = 0.0;
  -[AXMOscillatorADSREnvelope deactivate](self->_envelope, "deactivate");
}

- (NSArray)fmOperators
{
  void *v3;
  void *v4;
  void *v5;

  -[AXMOscillator parentSynth](self, "parentSynth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMOscillator fmOperatorIdentifiers](self, "fmOperatorIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oscillatorsWithIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (AXMOscillator)fmTarget
{
  void *v3;
  void *v4;
  void *v5;

  -[AXMOscillator parentSynth](self, "parentSynth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMOscillator fmTargetIdentifier](self, "fmTargetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oscillatorWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXMOscillator *)v5;
}

- (double)getNextSample
{
  double result;
  NSArray *v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t i;
  double v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float cachedSampleRate;
  float cachedGain;
  double v20;
  float v21;
  float v22;
  float v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  result = 0.0;
  if (!self->_cachedIsBypassed)
  {
    v4 = self->_cachedFMOperators;
    v5 = -[NSArray count](v4, "count");
    if (v5)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v6 = v4;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v26;
        v9 = 0.0;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v26 != v8)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "getNextSample", (_QWORD)v25);
            v9 = v11 + v9;
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v7);
      }
      else
      {
        v9 = 0.0;
      }

    }
    else
    {
      v9 = 0.0;
    }
    -[AXMOscillator baseFrequency](self, "baseFrequency", (_QWORD)v25);
    v13 = v12;
    -[AXMOscillator fmRootFrequencyRatio](self, "fmRootFrequencyRatio");
    v15 = v13 * v14;
    if (v5)
    {
      v16 = v15 + v9 * 1000.0;
      v17 = v16;
    }
    else
    {
      v17 = v15;
    }
    cachedSampleRate = self->_cachedSampleRate;
    cachedGain = self->_cachedGain;
    switch(self->_cachedWaveform)
    {
      case 0:
        v20 = sin(self->_currentPhase * 6.28318531);
        goto LABEL_25;
      case 1:
        v20 = fabs(fmod(self->_currentPhase, 1.0) * 2.0 + -1.0) * 2.0 + -1.0;
        goto LABEL_25;
      case 2:
        v20 = 1.0;
        if (self->_currentPhase > 0.5)
          v20 = 0.0;
        goto LABEL_25;
      case 3:
        v20 = fmod(self->_currentPhase, 1.0);
LABEL_25:
        v21 = v20 * cachedGain;
        break;
      case 4:
        v21 = cachedGain * (float)((float)rand() * 4.6566e-10);
        break;
      default:
        v21 = 0.0;
        break;
    }
    v22 = 1.0 / cachedSampleRate * v17;
    v23 = self->_currentPhase + v22;
    if (v23 > 1.0)
      v23 = v23 + -1.0;
    self->_currentPhase = v23;
    if (!self->_cachedEnvelopeIsBypassed)
    {
      -[AXMOscillatorADSREnvelope getNextSample](self->_envelope, "getNextSample");
      v21 = v24 * v21;
    }

    return v21;
  }
  return result;
}

- (float)fmRootFrequencyRatio
{
  float v3;
  float v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  uint64_t v9;

  -[AXMOscillator frequencyRatio](self, "frequencyRatio");
  v4 = v3;
  -[AXMOscillator parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fmTargetParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    do
    {
      objc_msgSend(v6, "frequencyRatio");
      v8 = v7;
      objc_msgSend(v6, "fmTargetParameters");
      v9 = objc_claimAutoreleasedReturnValue();
      v4 = v4 * v8;

      v6 = (void *)v9;
    }
    while (v9);
  }
  return v4;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AXMOscillator parameters](self, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

}

- (int64_t)waveform
{
  void *v2;
  int64_t v3;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "waveform");

  return v3;
}

- (void)setWaveform:(int64_t)a3
{
  id v4;

  -[AXMOscillator parameters](self, "parameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWaveform:", a3);

}

- (float)sampleRate
{
  void *v2;
  float v3;
  float v4;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleRate");
  v4 = v3;

  return v4;
}

- (float)baseFrequency
{
  void *v2;
  float v3;
  float v4;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseFrequency");
  v4 = v3;

  return v4;
}

- (float)frequencyRatio
{
  void *v2;
  float v3;
  float v4;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frequencyRatio");
  v4 = v3;

  return v4;
}

- (void)setFrequencyRatio:(float)a3
{
  double v4;
  id v5;

  -[AXMOscillator parameters](self, "parameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFrequencyRatio:", v4);

}

- (NSArray)fmOperatorIdentifiers
{
  void *v2;
  void *v3;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fmOperatorIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)fmTargetIdentifier
{
  void *v2;
  void *v3;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fmTargetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (float)gain
{
  void *v2;
  float v3;
  float v4;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gain");
  v4 = v3;

  return v4;
}

- (void)setGain:(float)a3
{
  double v4;
  id v5;

  -[AXMOscillator parameters](self, "parameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setGain:", v4);

}

- (int64_t)detuning
{
  void *v2;
  int64_t v3;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "detuning");

  return v3;
}

- (void)setDetuning:(int64_t)a3
{
  id v4;

  -[AXMOscillator parameters](self, "parameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetuning:", a3);

}

- (BOOL)isBypassed
{
  void *v2;
  char v3;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBypassed");

  return v3;
}

- (void)setIsBypassed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AXMOscillator parameters](self, "parameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsBypassed:", v3);

}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[AXMOscillator parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AXMOscillator displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p name=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (AXMSynth)parentSynth
{
  return (AXMSynth *)objc_loadWeakRetained((id *)&self->_parentSynth);
}

- (void)setParentSynth:(id)a3
{
  objc_storeWeak((id *)&self->_parentSynth, a3);
}

- (AXMSynthOscillatorParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (BOOL)isUsingFM
{
  return self->_isUsingFM;
}

- (AXMOscillatorADSREnvelope)envelope
{
  return self->_envelope;
}

- (void)setFmTarget:(id)a3
{
  objc_storeWeak((id *)&self->_fmTarget, a3);
}

- (float)lowpassCutoff
{
  return self->_lowpassCutoff;
}

- (void)setLowpassCutoff:(float)a3
{
  self->_lowpassCutoff = a3;
}

- (float)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(float)a3
{
  self->_currentPhase = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (float)phaseIncrement
{
  return self->_phaseIncrement;
}

- (double)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(double *)a3
{
  self->_sampleBuffer = a3;
}

- (AXMOscillator)rootOscillator
{
  return self->_rootOscillator;
}

- (float)rootFrequency
{
  return self->_rootFrequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootOscillator, 0);
  objc_destroyWeak((id *)&self->_fmTarget);
  objc_storeStrong((id *)&self->_envelope, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_destroyWeak((id *)&self->_parentSynth);
  objc_storeStrong((id *)&self->_cachedFMOperators, 0);
}

@end
