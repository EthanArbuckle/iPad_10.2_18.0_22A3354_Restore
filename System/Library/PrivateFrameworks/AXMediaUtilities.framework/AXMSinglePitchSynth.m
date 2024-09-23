@implementation AXMSinglePitchSynth

- (AXMSinglePitchSynth)initWithFrequency:(double)a3 sampleRate:(double)a4 envelope:(id)a5
{
  id v8;
  AXMSinglePitchSynth *v9;
  AXMSinglePitchSynth *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)AXMSinglePitchSynth;
  v9 = -[AXMSynth initWithSampleRate:envelope:](&v12, sel_initWithSampleRate_envelope_, v8, a4);
  v10 = v9;
  if (v9)
    -[AXMSynth setBaseFrequency:](v9, "setBaseFrequency:", a3);

  return v10;
}

- (void)renderInBuffer:(void *)a3 atFrame:(unint64_t)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  char v23;
  char v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[AXMSynth envelope](self, "envelope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lengthMS");
  v9 = v8;
  -[AXMSynth sampleRate](self, "sampleRate");
  v11 = (double)a4 + v9 / 1000.0 * v10;
  v12 = (double)(unint64_t)((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
  if (v11 < v12)
  {
    -[AXMSynth envelope](self, "envelope");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lengthMS");
    v15 = v14;
    -[AXMSynth sampleRate](self, "sampleRate");
    v12 = (double)a4 + v15 / 1000.0 * v16;

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[AXMSynth allOscillators](self, "allOscillators", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = (unint64_t)v12;
    v20 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v22, "updateCache");
        v23 = objc_msgSend(v22, "isBypassed");
        if (v19 <= a4)
          v24 = 1;
        else
          v24 = v23;
        v25 = a4;
        if ((v24 & 1) == 0)
        {
          do
          {
            objc_msgSend(v22, "getNextSample");
            v27 = v26;
            -[AXMSynth gain](self, "gain");
            *(_DWORD *)(*(_QWORD *)a3 + 4 * v25++) += (int)(v27 * 32500.0 * v28);
          }
          while (v19 != v25);
        }
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v18);
  }

}

@end
