@implementation AXMOscillatorADSREnvelope

- (AXMOscillatorADSREnvelope)initWithParameters:(id)a3 parentSynth:(id)a4
{
  id v7;
  id v8;
  AXMOscillatorADSREnvelope *v9;
  AXMOscillatorADSREnvelope *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXMOscillatorADSREnvelope;
  v9 = -[AXMOscillatorADSREnvelope init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_parentSynth, v8);
    objc_storeStrong((id *)&v10->_parameters, a3);
    v10->_currentSampleIndex = 0;
    v10->_sampleBuffer = (double *)malloc_type_malloc(0x8000uLL, 0x100004000313F17uLL);
    objc_storeStrong((id *)&v10->_parameters, a3);
    objc_msgSend(v8, "parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMSynthEnvelopeParameters setMainParameters:](v10->_parameters, "setMainParameters:", v11);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sampleBuffer);
  v3.receiver = self;
  v3.super_class = (Class)AXMOscillatorADSREnvelope;
  -[AXMOscillatorADSREnvelope dealloc](&v3, sel_dealloc);
}

- (void)activate
{
  float v3;

  -[AXMOscillatorADSREnvelope sustainLevel](self, "sustainLevel");
  self->_shouldSustain = v3 > 0.0;
  self->_currentSampleIndex = 0;
}

- (void)deactivate
{
  self->_sustainEndTime = CFAbsoluteTimeGetCurrent();
  self->_shouldSustain = 0;
  self->_releasePhaseSampleIndex = 0;
}

- (double)getNextSample
{
  double v3;
  float v4;
  float v5;
  float v6;
  double v7;
  float v8;
  float v9;
  float v10;
  unint64_t v11;
  unint64_t releasePhaseSampleIndex;
  unint64_t v13;
  unint64_t currentSampleIndex;
  float v15;
  float v16;
  unint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double result;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;

  -[AXMOscillatorADSREnvelope sampleRate](self, "sampleRate");
  v4 = v3;
  -[AXMOscillatorADSREnvelope attackMS](self, "attackMS");
  v6 = v5;
  v7 = v4;
  -[AXMOscillatorADSREnvelope decayMS](self, "decayMS");
  v9 = v8;
  -[AXMOscillatorADSREnvelope releaseMS](self, "releaseMS");
  v11 = (unint64_t)(v10 / 1000.0 * v7);
  releasePhaseSampleIndex = self->_releasePhaseSampleIndex;
  if (releasePhaseSampleIndex < v11 || self->_shouldSustain)
  {
    v13 = (unint64_t)(v6 / 1000.0 * v7);
    currentSampleIndex = self->_currentSampleIndex;
    if (currentSampleIndex >= v13)
    {
      v17 = (unint64_t)(v9 / 1000.0 * v7);
      if (currentSampleIndex >= v17 + v13)
      {
        if (!self->_shouldSustain)
        {
          result = 0.0;
          if (releasePhaseSampleIndex < v11)
          {
            v23 = (float)releasePhaseSampleIndex;
            v24 = (float)v11;
            -[AXMOscillatorADSREnvelope sustainLevel](self, "sustainLevel", 0.0);
            v26 = v25;
            -[AXMOscillatorADSREnvelope sustainLevel](self, "sustainLevel");
            result = (float)(v26 + (float)((float)((float)-v23 / v24) * v27));
            ++self->_releasePhaseSampleIndex;
          }
          goto LABEL_10;
        }
        -[AXMOscillatorADSREnvelope sustainLevel](self, "sustainLevel");
      }
      else
      {
        v18 = (float)(currentSampleIndex - v13) / (float)v17;
        -[AXMOscillatorADSREnvelope attackLevel](self, "attackLevel");
        v20 = v19;
        -[AXMOscillatorADSREnvelope sustainLevel](self, "sustainLevel");
        v16 = v20 + (float)(v18 * (float)(v21 - v20));
      }
    }
    else
    {
      -[AXMOscillatorADSREnvelope attackLevel](self, "attackLevel");
      v16 = (float)(v15 * (float)self->_currentSampleIndex) / (float)v13;
    }
    result = v16;
LABEL_10:
    ++self->_currentSampleIndex;
    return result;
  }
  return 0.0;
}

- (double)sampleRate
{
  void *v2;
  float v3;
  double v4;

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
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

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attackMS");
  v4 = v3;

  return v4;
}

- (void)setAttackTime:(float)a3
{
  double v4;
  id v5;

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setAttackMS:", v4);

}

- (float)attackLevel
{
  void *v2;
  float v3;
  float v4;

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attackLevel");
  v4 = v3;

  return v4;
}

- (void)setAttackLevel:(float)a3
{
  double v4;
  id v5;

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setAttackLevel:", v4);

}

- (float)decayMS
{
  void *v2;
  float v3;
  float v4;

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decayMS");
  v4 = v3;

  return v4;
}

- (void)setDecayTime:(float)a3
{
  double v4;
  id v5;

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setDecayMS:", v4);

}

- (float)sustainLevel
{
  void *v2;
  float v3;
  float v4;

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sustainLevel");
  v4 = v3;

  return v4;
}

- (void)setSustainLevel:(float)a3
{
  double v4;
  id v5;

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setSustainLevel:", v4);

}

- (float)releaseMS
{
  void *v2;
  float v3;
  float v4;

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseMS");
  v4 = v3;

  return v4;
}

- (void)setReleaseTime:(float)a3
{
  double v4;
  id v5;

  -[AXMOscillatorADSREnvelope parameters](self, "parameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setReleaseMS:", v4);

}

- (AXMSynth)parentSynth
{
  return (AXMSynth *)objc_loadWeakRetained((id *)&self->_parentSynth);
}

- (void)setParentSynth:(id)a3
{
  objc_storeWeak((id *)&self->_parentSynth, a3);
}

- (AXMSynthEnvelopeParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (BOOL)isBypassed
{
  return self->_isBypassed;
}

- (void)setIsBypassed:(BOOL)a3
{
  self->_isBypassed = a3;
}

- (double)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unint64_t)currentSampleIndex
{
  return self->_currentSampleIndex;
}

- (void)setCurrentSampleIndex:(unint64_t)a3
{
  self->_currentSampleIndex = a3;
}

- (BOOL)shouldSustain
{
  return self->_shouldSustain;
}

- (void)setShouldSustain:(BOOL)a3
{
  self->_shouldSustain = a3;
}

- (double)sustainEndTime
{
  return self->_sustainEndTime;
}

- (void)setSustainEndTime:(double)a3
{
  self->_sustainEndTime = a3;
}

- (unint64_t)releasePhaseSampleIndex
{
  return self->_releasePhaseSampleIndex;
}

- (void)setReleasePhaseSampleIndex:(unint64_t)a3
{
  self->_releasePhaseSampleIndex = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_destroyWeak((id *)&self->_parentSynth);
}

@end
