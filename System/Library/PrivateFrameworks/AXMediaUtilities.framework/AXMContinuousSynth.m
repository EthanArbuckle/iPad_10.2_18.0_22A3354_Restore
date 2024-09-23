@implementation AXMContinuousSynth

- (AXMContinuousSynth)initWithSampleRate:(double)a3 envelope:(id)a4 keyPitches:(id)a5
{
  id v9;
  AXMContinuousSynth *v10;
  AXMContinuousSynth *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AXMContinuousSynth;
  v10 = -[AXMSynth initWithSampleRate:envelope:](&v13, sel_initWithSampleRate_envelope_, a4, a3);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_keyPitches, a5);

  return v11;
}

- (void)renderInBuffer:(void *)a3 atFrame:(unint64_t)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  id obj;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[AXMSynth envelope](self, "envelope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lengthMS");
  v7 = v6;
  -[AXMSynth sampleRate](self, "sampleRate");
  v9 = (double)a4 + v7 / 1000.0 * v8;
  v10 = (double)(unint64_t)((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
  if (v9 < v10)
  {
    -[AXMSynth envelope](self, "envelope");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lengthMS");
    v13 = v12;
    -[AXMSynth sampleRate](self, "sampleRate");
    v10 = (double)a4 + v13 / 1000.0 * v14;

  }
  v39 = (void *)-[NSArray mutableCopy](self->_keyPitches, "mutableCopy");
  objc_msgSend(v39, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v39, "removeObjectAtIndex:", 0);
  objc_msgSend(v39, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AXMContinuousSynth _bufferFrameForKeyPitch:](self, "_bufferFrameForKeyPitch:", v15);
  v18 = -[AXMContinuousSynth _bufferFrameForKeyPitch:](self, "_bufferFrameForKeyPitch:", v16);
  objc_msgSend(v15, "frequency");
  -[AXMSynth setBaseFrequency:](self, "setBaseFrequency:");
  -[AXMSynth bypassEnvelopes](self, "bypassEnvelopes");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[AXMSynth allOscillators](self, "allOscillators");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v19)
  {
    v37 = *(_QWORD *)v43;
    v34 = (unint64_t)v10;
    v40 = (unint64_t)v10 - a4;
    do
    {
      v20 = 0;
      v38 = v19;
      do
      {
        if (*(_QWORD *)v43 != v37)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v20);
        objc_msgSend(v21, "updateCache", v34);
        if ((objc_msgSend(v21, "isBypassed") & 1) == 0 && v34 > a4)
        {
          v22 = 0;
          do
          {
            if (v22 == v18)
            {
              v23 = v16;

              if (v23)
                objc_msgSend(v39, "removeObjectAtIndex:", 0);
              objc_msgSend(v39, "firstObject");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              v24 = -[AXMContinuousSynth _bufferFrameForKeyPitch:](self, "_bufferFrameForKeyPitch:", v16);
              objc_msgSend(v23, "frequency");
              -[AXMSynth setBaseFrequency:](self, "setBaseFrequency:");
              v15 = v23;
              v17 = v18;
              v18 = v24;
            }
            else
            {
              v25 = (double)(v22 - v17) / (double)(v18 - v17);
              if (v25 > 0.0)
              {
                objc_msgSend(v15, "frequency");
                v27 = v26;
                objc_msgSend(v16, "frequency");
                v29 = v28;
                objc_msgSend(v15, "frequency");
                -[AXMSynth setBaseFrequency:](self, "setBaseFrequency:", v27 + v25 * (v29 - v30));
              }
            }
            objc_msgSend(v21, "getNextSample");
            v32 = v31;
            -[AXMSynth gain](self, "gain");
            *(_DWORD *)(*(_QWORD *)a3 + 4 * a4 + 4 * v22++) += (int)(v32 * 32500.0 * v33);
          }
          while (v40 != v22);
        }
        ++v20;
      }
      while (v20 != v38);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v19);
  }

}

- (unint64_t)_bufferFrameForKeyPitch:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "timeOffsetMS");
  v6 = v5;
  -[AXMSynth sampleRate](self, "sampleRate");
  v8 = (unint64_t)(v6 / 1000.0 * v7);

  return v8;
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (double)phase
{
  return self->_phase;
}

- (unint64_t)framesRendered
{
  return self->_framesRendered;
}

- (void)setFramesRendered:(unint64_t)a3
{
  self->_framesRendered = a3;
}

- (BOOL)releasing
{
  return self->_releasing;
}

- (void)setReleasing:(BOOL)a3
{
  self->_releasing = a3;
}

- (unint64_t)releaseFrame
{
  return self->_releaseFrame;
}

- (void)setReleaseFrame:(unint64_t)a3
{
  self->_releaseFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPitches, 0);
}

@end
