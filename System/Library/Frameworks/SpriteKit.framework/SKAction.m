@implementation SKAction

+ (SKAction)play
{
  return +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", &__block_literal_global_1, 0.0);
}

void __33__SKAction_PlaybackControl__play__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v7;
    objc_msgSend(v2, "avAudioNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v2, "audioFile");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "avAudioNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scheduleFile:atTime:completionHandler:", v5, 0, 0);
      objc_msgSend(v6, "play");

    }
  }

}

+ (SKAction)pause
{
  return +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", &__block_literal_global_77, 0.0);
}

void __34__SKAction_PlaybackControl__pause__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v6;
    objc_msgSend(v2, "avAudioNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v2, "avAudioNode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pause");

    }
  }

}

+ (SKAction)stop
{
  return +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", &__block_literal_global_78, 0.0);
}

void __33__SKAction_PlaybackControl__stop__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v6;
    objc_msgSend(v2, "avAudioNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v2, "avAudioNode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stop");

    }
  }

}

+ (SKAction)changePlaybackRateTo:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[7];
  float v7;
  _QWORD v8[3];
  int v9;
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 1065353216;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SKAction_PlaybackControl__changePlaybackRateTo_duration___block_invoke;
  v6[3] = &unk_1EA4FE1A8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&v6[6] = duration;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  return (SKAction *)v4;
}

void __59__SKAction_PlaybackControl__changePlaybackRateTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  double v11;
  float v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        objc_msgSend(v8, "rate");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
      v11 = *(double *)(a1 + 48);
      v12 = 1.0;
      if (v11 > 0.0)
      {
        v13 = a3 / v11;
        if (a3 / v11 < 0.0)
          v13 = 0.0;
        if (v13 > 1.0)
          v13 = 1.0;
        v12 = v13;
      }
      v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&v14 = v14;
      objc_msgSend(v9, "setRate:", v14);

    }
  }

}

+ (SKAction)changePlaybackRateBy:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[6];
  float v7;
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SKAction_PlaybackControl__changePlaybackRateBy_duration___block_invoke;
  v6[3] = &unk_1EA4FE1D0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return (SKAction *)v4;
}

void __59__SKAction_PlaybackControl__changePlaybackRateBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = *(double *)(a1 + 40);
      v11 = 1.0;
      if (v10 > 0.0)
      {
        v12 = (a3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0)
          v12 = 0.0;
        if (v12 > 1.0)
          v12 = 1.0;
        v11 = v12;
      }
      objc_msgSend(v8, "rate");
      *(float *)&v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      objc_msgSend(v9, "setRate:", v14);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;

    }
  }

}

+ (SKAction)changeVolumeTo:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[7];
  float v7;
  _QWORD v8[3];
  int v9;
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SKAction_MixerControl__changeVolumeTo_duration___block_invoke;
  v6[3] = &unk_1EA4FE1A8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&v6[6] = duration;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  return (SKAction *)v4;
}

void __50__SKAction_MixerControl__changeVolumeTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  double v11;
  float v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        objc_msgSend(v8, "volume");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
      v11 = *(double *)(a1 + 48);
      v12 = 1.0;
      if (v11 > 0.0)
      {
        v13 = a3 / v11;
        if (a3 / v11 < 0.0)
          v13 = 0.0;
        if (v13 > 1.0)
          v13 = 1.0;
        v12 = v13;
      }
      v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&v14 = v14;
      objc_msgSend(v9, "setVolume:", v14);

    }
  }

}

+ (SKAction)changeVolumeBy:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[6];
  float v7;
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SKAction_MixerControl__changeVolumeBy_duration___block_invoke;
  v6[3] = &unk_1EA4FE1D0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return (SKAction *)v4;
}

void __50__SKAction_MixerControl__changeVolumeBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = *(double *)(a1 + 40);
      v11 = 1.0;
      if (v10 > 0.0)
      {
        v12 = (a3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0)
          v12 = 0.0;
        if (v12 > 1.0)
          v12 = 1.0;
        v11 = v12;
      }
      objc_msgSend(v8, "volume");
      *(float *)&v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      objc_msgSend(v9, "setVolume:", v14);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;

    }
  }

}

+ (SKAction)stereoPanTo:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[7];
  float v7;
  _QWORD v8[3];
  int v9;
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 1056964608;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__SKAction_SKAudioNode__stereoPanTo_duration___block_invoke;
  v6[3] = &unk_1EA4FE1A8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&v6[6] = duration;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  return (SKAction *)v4;
}

void __46__SKAction_SKAudioNode__stereoPanTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  double v11;
  float v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        objc_msgSend(v8, "pan");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
      v11 = *(double *)(a1 + 48);
      v12 = 1.0;
      if (v11 > 0.0)
      {
        v13 = a3 / v11;
        if (a3 / v11 < 0.0)
          v13 = 0.0;
        if (v13 > 1.0)
          v13 = 1.0;
        v12 = v13;
      }
      v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&v14 = v14;
      objc_msgSend(v9, "setPan:", v14);

    }
  }

}

+ (SKAction)stereoPanBy:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[6];
  float v7;
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__SKAction_SKAudioNode__stereoPanBy_duration___block_invoke;
  v6[3] = &unk_1EA4FE1D0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return (SKAction *)v4;
}

void __46__SKAction_SKAudioNode__stereoPanBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = *(double *)(a1 + 40);
      v11 = 1.0;
      if (v10 > 0.0)
      {
        v12 = (a3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0)
          v12 = 0.0;
        if (v12 > 1.0)
          v12 = 1.0;
        v11 = v12;
      }
      objc_msgSend(v8, "pan");
      *(float *)&v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      objc_msgSend(v9, "setPan:", v14);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;

    }
  }

}

+ (SKAction)changeReverbTo:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[7];
  float v7;
  _QWORD v8[3];
  int v9;
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__SKAction_SKAudioNode__changeReverbTo_duration___block_invoke;
  v6[3] = &unk_1EA4FE1A8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&v6[6] = duration;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  return (SKAction *)v4;
}

void __49__SKAction_SKAudioNode__changeReverbTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  double v11;
  float v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        objc_msgSend(v8, "reverbBlend");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
      v11 = *(double *)(a1 + 48);
      v12 = 1.0;
      if (v11 > 0.0)
      {
        v13 = a3 / v11;
        if (a3 / v11 < 0.0)
          v13 = 0.0;
        if (v13 > 1.0)
          v13 = 1.0;
        v12 = v13;
      }
      v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&v14 = v14;
      objc_msgSend(v9, "setReverbBlend:", v14);

    }
  }

}

+ (SKAction)changeReverbBy:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[6];
  float v7;
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__SKAction_SKAudioNode__changeReverbBy_duration___block_invoke;
  v6[3] = &unk_1EA4FE1D0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return (SKAction *)v4;
}

void __49__SKAction_SKAudioNode__changeReverbBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = *(double *)(a1 + 40);
      v11 = 1.0;
      if (v10 > 0.0)
      {
        v12 = (a3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0)
          v12 = 0.0;
        if (v12 > 1.0)
          v12 = 1.0;
        v11 = v12;
      }
      objc_msgSend(v8, "reverbBlend");
      *(float *)&v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      objc_msgSend(v9, "setReverbBlend:", v14);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;

    }
  }

}

+ (SKAction)changeObstructionTo:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[7];
  float v7;
  _QWORD v8[3];
  int v9;
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SKAction_SKAudioNode__changeObstructionTo_duration___block_invoke;
  v6[3] = &unk_1EA4FE1A8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&v6[6] = duration;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  return (SKAction *)v4;
}

void __54__SKAction_SKAudioNode__changeObstructionTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  double v11;
  float v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        objc_msgSend(v8, "obstruction");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
      v11 = *(double *)(a1 + 48);
      v12 = 1.0;
      if (v11 > 0.0)
      {
        v13 = a3 / v11;
        if (a3 / v11 < 0.0)
          v13 = 0.0;
        if (v13 > 1.0)
          v13 = 1.0;
        v12 = v13;
      }
      v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&v14 = v14;
      objc_msgSend(v9, "setObstruction:", v14);

    }
  }

}

+ (SKAction)changeObstructionBy:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[6];
  float v7;
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SKAction_SKAudioNode__changeObstructionBy_duration___block_invoke;
  v6[3] = &unk_1EA4FE1D0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return (SKAction *)v4;
}

void __54__SKAction_SKAudioNode__changeObstructionBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = *(double *)(a1 + 40);
      v11 = 1.0;
      if (v10 > 0.0)
      {
        v12 = (a3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0)
          v12 = 0.0;
        if (v12 > 1.0)
          v12 = 1.0;
        v11 = v12;
      }
      objc_msgSend(v8, "obstruction");
      *(float *)&v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      objc_msgSend(v9, "setObstruction:", v14);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;

    }
  }

}

+ (SKAction)changeOcclusionTo:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[7];
  float v7;
  _QWORD v8[3];
  int v9;
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SKAction_SKAudioNode__changeOcclusionTo_duration___block_invoke;
  v6[3] = &unk_1EA4FE1A8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&v6[6] = duration;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  return (SKAction *)v4;
}

void __52__SKAction_SKAudioNode__changeOcclusionTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  double v11;
  float v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        objc_msgSend(v8, "occlusion");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
      v11 = *(double *)(a1 + 48);
      v12 = 1.0;
      if (v11 > 0.0)
      {
        v13 = a3 / v11;
        if (a3 / v11 < 0.0)
          v13 = 0.0;
        if (v13 > 1.0)
          v13 = 1.0;
        v12 = v13;
      }
      v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&v14 = v14;
      objc_msgSend(v9, "setOcclusion:", v14);

    }
  }

}

+ (SKAction)changeOcclusionBy:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[6];
  float v7;
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SKAction_SKAudioNode__changeOcclusionBy_duration___block_invoke;
  v6[3] = &unk_1EA4FE1D0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  v7 = v;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return (SKAction *)v4;
}

void __52__SKAction_SKAudioNode__changeOcclusionBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
    objc_msgSend(v5, "avAudioNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "avAudioNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = *(double *)(a1 + 40);
      v11 = 1.0;
      if (v10 > 0.0)
      {
        v12 = (a3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0)
          v12 = 0.0;
        if (v12 > 1.0)
          v12 = 1.0;
        v11 = v12;
      }
      objc_msgSend(v8, "occlusion");
      *(float *)&v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      objc_msgSend(v9, "setOcclusion:", v14);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;

    }
  }

}

- (SKCAction)caction
{
  return self->_caction;
}

+ (SKAction)warpTo:(SKWarpGeometry *)warp duration:(NSTimeInterval)duration
{
  +[SKAnimateWarp warpTo:duration:](SKAnimateWarp, "warpTo:duration:", warp, duration);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)animateWithWarps:(NSArray *)warps times:(NSArray *)times
{
  +[SKAnimateWarp animateWithWarps:times:restore:](SKAnimateWarp, "animateWithWarps:times:restore:", warps, times, 0);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)animateWithWarps:(NSArray *)warps times:(NSArray *)times restore:(BOOL)restore
{
  +[SKAnimateWarp animateWithWarps:times:restore:](SKAnimateWarp, "animateWithWarps:times:restore:", warps, times, restore);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)subactions
{
  return 0;
}

- (SKActionTimingFunction)timingFunction
{
  return (id)MEMORY[0x1DF0CFCB0](self->_caction->var3, a2);
}

- (void)setTimingFunction:(SKActionTimingFunction)timingFunction
{
  uint64_t v4;
  SKCAction *caction;
  id var3;

  v4 = MEMORY[0x1DF0CFCB0](timingFunction, a2);
  caction = self->_caction;
  var3 = caction->var3;
  caction->var3 = (id)v4;

}

- (NSTimeInterval)duration
{
  return self->_caction->var8;
}

- (void)setDuration:(NSTimeInterval)duration
{
  float v3;

  v3 = duration;
  self->_caction->var8 = v3;
}

- (SKActionTimingMode)timingMode
{
  return self->_caction->var14;
}

- (void)setTimingMode:(SKActionTimingMode)timingMode
{
  self->_caction->var14 = timingMode;
}

- (void)commonInit
{
  if (-[SKAction commonInit]::_tableInit != -1)
    dispatch_once(&-[SKAction commonInit]::_tableInit, &__block_literal_global_2);
}

void __22__SKAction_commonInit__block_invoke()
{
  SKThreadSafeMapTable *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SKThreadSafeMapTable alloc];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:");
  v2 = (void *)_actionTable;
  _actionTable = v1;

}

- (SKAction)init
{
  SKAction *v2;
  SKCAction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKAction;
  v2 = -[SKAction init](&v5, sel_init);
  if (v2)
  {
    v3 = (SKCAction *)operator new();
    SKCAction::SKCAction(v3);
    -[SKAction setCppAction:](v2, "setCppAction:", v3);
    -[SKAction commonInit](v2, "commonInit");
  }
  return v2;
}

- (SKAction)initWithCoder:(id)a3
{
  id v4;
  SKAction *v5;
  SKCAction *v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKAction;
  v5 = -[SKAction init](&v11, sel_init);
  if (v5)
  {
    v6 = (SKCAction *)operator new();
    SKCAction::SKCAction(v6);
    -[SKAction setCppAction:](v5, "setCppAction:", v6);
    -[SKAction commonInit](v5, "commonInit");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_duration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    *(float *)&v8 = v8;
    v5->_caction->var8 = *(float *)&v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timingMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_caction->var14 = objc_msgSend(v9, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_caction->var8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("_duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_caction->var14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_timingMode"));

}

- (BOOL)isEqualToAction:(id)a3
{
  SKCAction *caction;
  uint64_t v4;

  if (self == a3)
    return 1;
  caction = self->_caction;
  v4 = *((_QWORD *)a3 + 1);
  return (COERCE_UNSIGNED_INT(caction->var8 - *(float *)(v4 + 56)) & 0x60000000) == 0
      && caction->var14 == *(_QWORD *)(v4 + 88);
}

- (void)setSpeed:(CGFloat)speed
{
  float v3;

  v3 = speed;
  (*((void (**)(SKCAction *, float))self->_caction->var0 + 6))(self->_caction, v3);
}

- (CGFloat)speed
{
  return self->_caction->var17;
}

- (id)copy
{
  return -[SKAction copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0CF2F0](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  SKCAction *caction;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  caction = self->_caction;
  v6 = v4[1];
  *(_QWORD *)(v6 + 88) = caction->var14;
  *(_QWORD *)(v6 + 100) = *(_QWORD *)&caction->var16;
  *(_WORD *)(v6 + 72) = 0;
  *(_QWORD *)(v6 + 56) = *(_QWORD *)&caction->var8;
  -[SKAction timingFunction](self, "timingFunction");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v4[1];
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v7;

  return v4;
}

- (SKAction)reversedAction
{
  return (SKAction *)-[SKAction copy](self, "copy");
}

- (void)dealloc
{
  SKCAction *caction;
  int v4;
  objc_super v5;

  caction = self->_caction;
  if (caction)
  {
    self->_caction = 0;
    caction->var4 = 0;
    v4 = caction->var1 - 1;
    caction->var1 = v4;
    if (!v4)
      (*((void (**)(SKCAction *, SEL))caction->var0 + 1))(caction, a2);
  }
  v5.receiver = self;
  v5.super_class = (Class)SKAction;
  -[SKAction dealloc](&v5, sel_dealloc);
}

+ (SKAction)moveByX:(CGFloat)deltaX y:(CGFloat)deltaY duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKMove moveByX:y:duration:](SKMove, "moveByX:y:duration:", deltaX, deltaY, duration);
}

+ (SKAction)moveBy:(CGVector)delta duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKMove moveByX:y:duration:](SKMove, "moveByX:y:duration:", delta.dx, delta.dy, duration);
}

+ (id)moveBY:(CGVector)a3 duration:(double)a4
{
  return +[SKMove moveByX:y:duration:](SKMove, "moveByX:y:duration:", a3.dx, a3.dy, a4);
}

+ (SKAction)moveTo:(CGPoint)location duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKMove moveTo:duration:](SKMove, "moveTo:duration:", location.x, location.y, duration);
}

+ (SKAction)moveToX:(CGFloat)x duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKMove moveToX:duration:](SKMove, "moveToX:duration:", x, duration);
}

+ (SKAction)moveToY:(CGFloat)y duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKMove moveToY:duration:](SKMove, "moveToY:duration:", y, duration);
}

+ (SKAction)rotateByAngle:(CGFloat)radians duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKRotate rotateByAngle:duration:](SKRotate, "rotateByAngle:duration:", radians, duration);
}

+ (SKAction)rotateToAngle:(CGFloat)radians duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKRotate rotateToAngle:duration:](SKRotate, "rotateToAngle:duration:", radians, duration);
}

+ (SKAction)rotateToAngle:(CGFloat)radians duration:(NSTimeInterval)duration shortestUnitArc:(BOOL)shortestUnitArc
{
  return (SKAction *)+[SKRotate rotateToAngle:duration:shortestUnitArc:](SKRotate, "rotateToAngle:duration:shortestUnitArc:", shortestUnitArc, radians, duration);
}

+ (SKAction)scaleBy:(CGFloat)scale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleBy:duration:](SKScale, "scaleBy:duration:", scale, duration);
}

+ (SKAction)scaleXBy:(CGFloat)xScale y:(CGFloat)yScale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleXBy:y:duration:](SKScale, "scaleXBy:y:duration:", xScale, yScale, duration);
}

+ (SKAction)scaleTo:(CGFloat)scale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleTo:duration:](SKScale, "scaleTo:duration:", scale, duration);
}

+ (SKAction)scaleXTo:(CGFloat)xScale y:(CGFloat)yScale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleXTo:y:duration:](SKScale, "scaleXTo:y:duration:", xScale, yScale, duration);
}

+ (SKAction)scaleXTo:(CGFloat)scale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleXTo:duration:](SKScale, "scaleXTo:duration:", scale, duration);
}

+ (SKAction)scaleYTo:(CGFloat)scale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleYTo:duration:](SKScale, "scaleYTo:duration:", scale, duration);
}

+ (SKAction)scaleToSize:(CGSize)size duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleToSize:duration:](SKScale, "scaleToSize:duration:", size.width, size.height, duration);
}

+ (SKAction)resizeByWidth:(CGFloat)width height:(CGFloat)height duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKResize resizeByWidth:height:duration:](SKResize, "resizeByWidth:height:duration:", width, height, duration);
}

+ (SKAction)resizeToWidth:(CGFloat)width height:(CGFloat)height duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKResize resizeToWidth:height:duration:](SKResize, "resizeToWidth:height:duration:", width, height, duration);
}

+ (SKAction)resizeToWidth:(CGFloat)width duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKResize resizeToWidth:duration:](SKResize, "resizeToWidth:duration:", width, duration);
}

+ (SKAction)resizeToHeight:(CGFloat)height duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKResize resizeToHeight:duration:](SKResize, "resizeToHeight:duration:", height, duration);
}

+ (SKAction)sequence:(NSArray *)actions
{
  +[SKSequence sequenceWithActions:](SKSequence, "sequenceWithActions:", actions);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)group:(NSArray *)actions
{
  +[SKGroup groupWithActions:](SKGroup, "groupWithActions:", actions);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)repeatAction:(SKAction *)action count:(NSUInteger)count
{
  +[SKRepeat repeatAction:count:](SKRepeat, "repeatAction:count:", action, count);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)repeatActionForever:(SKAction *)action
{
  +[SKRepeat repeatActionForever:](SKRepeat, "repeatActionForever:", action);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)fadeInWithDuration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFade fadeInWithDuration:](SKFade, "fadeInWithDuration:", duration);
}

+ (SKAction)fadeOutWithDuration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFade fadeOutWithDuration:](SKFade, "fadeOutWithDuration:", duration);
}

+ (SKAction)fadeAlphaBy:(CGFloat)factor duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFade fadeAlphaBy:duration:](SKFade, "fadeAlphaBy:duration:", factor, duration);
}

+ (SKAction)fadeAlphaTo:(CGFloat)alpha duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFade fadeAlphaTo:duration:](SKFade, "fadeAlphaTo:duration:", alpha, duration);
}

+ (SKAction)falloffTo:(float)falloff duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFalloff falloffTo:duration:](SKFalloff, "falloffTo:duration:", falloff, duration);
}

+ (SKAction)falloffBy:(float)falloff duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFalloff falloffBy:duration:](SKFalloff, "falloffBy:duration:", falloff, duration);
}

+ (SKAction)hide
{
  return (SKAction *)+[SKHide hide](SKHide, "hide");
}

+ (SKAction)unhide
{
  return (SKAction *)+[SKHide unhide](SKHide, "unhide");
}

+ (SKAction)setTexture:(SKTexture *)texture
{
  SKTexture *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = texture;
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAnimate animateWithTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithTextures:timePerFrame:resize:restore:", v4, 0, 0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKAction *)v5;
}

+ (SKAction)setNormalTexture:(SKTexture *)texture
{
  SKTexture *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = texture;
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAnimate animateWithNormalTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithNormalTextures:timePerFrame:resize:restore:", v4, 0, 0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKAction *)v5;
}

+ (SKAction)setTexture:(SKTexture *)texture resize:(BOOL)resize
{
  SKTexture *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = texture;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAnimate animateWithTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithTextures:timePerFrame:resize:restore:", v5, 1, 0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKAction *)v6;
}

+ (SKAction)setNormalTexture:(SKTexture *)texture resize:(BOOL)resize
{
  SKTexture *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = texture;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAnimate animateWithNormalTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithNormalTextures:timePerFrame:resize:restore:", v5, 1, 0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKAction *)v6;
}

+ (SKAction)animateWithTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec
{
  +[SKAnimate animateWithTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithTextures:timePerFrame:resize:restore:", textures, 0, 0, sec);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)animateWithNormalTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec
{
  +[SKAnimate animateWithNormalTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithNormalTextures:timePerFrame:resize:restore:", textures, 0, 0, sec);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)animateWithTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec resize:(BOOL)resize restore:(BOOL)restore
{
  +[SKAnimate animateWithTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithTextures:timePerFrame:resize:restore:", textures, resize, restore, sec);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)animateWithNormalTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec resize:(BOOL)resize restore:(BOOL)restore
{
  +[SKAnimate animateWithNormalTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithNormalTextures:timePerFrame:resize:restore:", textures, resize, restore, sec);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)playSoundFileNamed:(id)a3
{
  +[SKPlaySound playSoundFileNamed:atPosition:waitForCompletion:](SKPlaySound, "playSoundFileNamed:atPosition:waitForCompletion:", a3, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)playSoundFileNamed:(NSString *)soundFile waitForCompletion:(BOOL)wait
{
  +[SKPlaySound playSoundFileNamed:atPosition:waitForCompletion:](SKPlaySound, "playSoundFileNamed:atPosition:waitForCompletion:", soundFile, wait, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)playSoundFileNamed:(id)a3 atPosition:(CGPoint)a4 waitForCompletion:(BOOL)a5
{
  +[SKPlaySound playSoundFileNamed:atPosition:waitForCompletion:](SKPlaySound, "playSoundFileNamed:atPosition:waitForCompletion:", a3, a5, a4.x, a4.y);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)colorizeWithColor:(UIColor *)color colorBlendFactor:(CGFloat)colorBlendFactor duration:(NSTimeInterval)duration
{
  +[SKColorize colorizeWithColor:colorBlendFactor:duration:](SKColorize, "colorizeWithColor:colorBlendFactor:duration:", color, colorBlendFactor, duration);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)colorizeWithColorBlendFactor:(CGFloat)colorBlendFactor duration:(NSTimeInterval)sec
{
  return (SKAction *)+[SKColorize colorizeWithColorBlendFactor:duration:](SKColorize, "colorizeWithColorBlendFactor:duration:", colorBlendFactor, sec);
}

+ (SKAction)followPath:(CGPathRef)path duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFollowPath followPath:duration:](SKFollowPath, "followPath:duration:", path, duration);
}

+ (SKAction)followPath:(CGPathRef)path asOffset:(BOOL)offset orientToPath:(BOOL)orient duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFollowPath followPath:asOffset:orientToPath:duration:](SKFollowPath, "followPath:asOffset:orientToPath:duration:", path, offset, orient, duration);
}

+ (SKAction)followPath:(CGPathRef)path speed:(CGFloat)speed
{
  return (SKAction *)+[SKFollowPath followPath:speed:](SKFollowPath, "followPath:speed:", path, speed);
}

+ (SKAction)followPath:(CGPathRef)path asOffset:(BOOL)offset orientToPath:(BOOL)orient speed:(CGFloat)speed
{
  return (SKAction *)+[SKFollowPath followPath:asOffset:orientToPath:speed:](SKFollowPath, "followPath:asOffset:orientToPath:speed:", path, offset, orient, speed);
}

+ (SKAction)speedBy:(CGFloat)speed duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKSpeed speedBy:duration:](SKSpeed, "speedBy:duration:", speed, duration);
}

+ (SKAction)speedTo:(CGFloat)speed duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKSpeed speedTo:duration:](SKSpeed, "speedTo:duration:", speed, duration);
}

+ (SKAction)strengthTo:(float)strength duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKStrength strengthTo:duration:](SKStrength, "strengthTo:duration:", strength, duration);
}

+ (SKAction)strengthBy:(float)strength duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKStrength strengthBy:duration:](SKStrength, "strengthBy:duration:", strength, duration);
}

+ (SKAction)reachTo:(CGPoint)position rootNode:(SKNode *)root duration:(NSTimeInterval)duration
{
  +[SKReach reachTo:rootNode:duration:](SKReach, "reachTo:rootNode:duration:", root, position.x, position.y, duration);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)reachTo:(CGPoint)position rootNode:(SKNode *)root velocity:(CGFloat)velocity
{
  +[SKReach reachTo:rootNode:velocity:](SKReach, "reachTo:rootNode:velocity:", root, position.x, position.y, velocity);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)reachToNode:(SKNode *)node rootNode:(SKNode *)root duration:(NSTimeInterval)sec
{
  SKNode *v6;
  SKNode *v7;
  void *v8;

  v6 = node;
  v7 = root;
  -[SKNode position](v6, "position");
  +[SKAction reachTo:rootNode:duration:](SKAction, "reachTo:rootNode:duration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKAction *)v8;
}

+ (SKAction)reachToNode:(SKNode *)node rootNode:(SKNode *)root velocity:(CGFloat)velocity
{
  SKNode *v6;
  SKNode *v7;
  void *v8;

  v6 = node;
  v7 = root;
  -[SKNode position](v6, "position");
  +[SKAction reachTo:rootNode:velocity:](SKAction, "reachTo:rootNode:velocity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKAction *)v8;
}

+ (SKAction)waitForDuration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKWait waitForDuration:](SKWait, "waitForDuration:", duration);
}

+ (SKAction)waitForDuration:(NSTimeInterval)duration withRange:(NSTimeInterval)durationRange
{
  return (SKAction *)+[SKWait waitForDuration:withRange:](SKWait, "waitForDuration:withRange:", duration, durationRange);
}

+ (SKAction)removeFromParent
{
  return (SKAction *)+[SKRemove removeFromParent](SKRemove, "removeFromParent");
}

+ (SKAction)performSelector:(SEL)selector onTarget:(id)target
{
  +[SKPerformSelector perfromSelector:onTarget:](SKPerformSelector, "perfromSelector:onTarget:", selector, target);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)runBlock:(dispatch_block_t)block
{
  +[SKRunBlock runBlock:queue:](SKRunBlock, "runBlock:queue:", block, 0);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)runBlock:(dispatch_block_t)block queue:(dispatch_queue_t)queue
{
  +[SKRunBlock runBlock:queue:](SKRunBlock, "runBlock:queue:", block, queue);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)runAction:(SKAction *)action onChildWithName:(NSString *)name
{
  +[SKRunAction runAction:onFirstChildWithName:](SKRunAction, "runAction:onFirstChildWithName:", action, name);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)javaScriptActionWithDuration:(double)a3 script:(id)a4
{
  +[SKJavaScriptAction javaScriptActionWithDuration:script:](SKJavaScriptAction, "javaScriptActionWithDuration:script:", a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)customActionWithDuration:(NSTimeInterval)duration actionBlock:(void *)block
{
  +[SKCustomAction customActionWithDuration:actionBlock:](SKCustomAction, "customActionWithDuration:actionBlock:", block, duration);
  return (SKAction *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKAction)actionNamed:(NSString *)name
{
  NSString *v4;
  void *v5;

  v4 = name;
  objc_msgSend((id)_actionTable, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "findNamedActionInBundle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (SKAction *)v5;
}

+ (SKAction)actionNamed:(NSString *)name duration:(NSTimeInterval)duration
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "actionNamed:", name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(a1, "convertAction:toDuration:", v8, duration);
  }
  else
  {
    v8 = 0;
  }
  return (SKAction *)v8;
}

+ (SKAction)actionNamed:(NSString *)name fromURL:(NSURL *)url
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v6 = name;
  v7 = (void *)MEMORY[0x1E0C99D50];
  -[NSURL path](url, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataWithContentsOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  v22 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, &v22);
  v13 = v22;
  objc_msgSend(v12, "setRequiresSecureCoding:", 0);
  v14 = *MEMORY[0x1E0CB2CD0];
  v21 = v13;
  objc_msgSend(v12, "decodeTopLevelObjectOfClasses:forKey:error:", v10, v14, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("actions"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(a1, "addActionsToCachedActionTable:", v17);
      goto LABEL_8;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
    goto LABEL_10;
  }
  v17 = v15;
  objc_msgSend(v17, "actionForName:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v17, "actionTableDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addActionsToCachedActionTable:", v19);

  }
LABEL_8:

LABEL_10:
  return (SKAction *)v18;
}

+ (SKAction)actionNamed:(NSString *)name fromURL:(NSURL *)url duration:(NSTimeInterval)duration
{
  void *v7;

  objc_msgSend(a1, "actionNamed:fromURL:", name, url);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(a1, "convertAction:toDuration:", v7, duration);
  return (SKAction *)v7;
}

+ (id)recursivePathsForResourcesOfType:(id)a3 inDirectory:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumeratorAtPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
LABEL_2:

  v11 = v10;
  while (1)
  {
    objc_msgSend(v9, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      break;
    objc_msgSend(v10, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "caseInsensitiveCompare:", v5);

    v11 = v10;
    if (!v13)
    {
      objc_msgSend(v6, "stringByAppendingPathComponent:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);
      goto LABEL_2;
    }
  }
  v14 = (void *)MEMORY[0x1E0C99E20];
  SKGetResourceBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pathsForResourcesOfType:inDirectory:", CFSTR("sks"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unionSet:", v18);

  objc_msgSend(v17, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)findNamedActionInBundle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t j;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  void *v25;
  char v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  char v48;
  id v50;
  id v51;
  uint64_t v52;
  id v54;
  uint64_t v55;
  id obj;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[3];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  SKGetResourceBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recursivePathsForResourcesOfType:inDirectory:", CFSTR("sks"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (!v6)
    goto LABEL_50;
  v58 = *(_QWORD *)v62;
  v52 = *MEMORY[0x1E0CB2CD0];
  do
  {
    v59 = v6;
    for (i = 0; i != v59; ++i)
    {
      if (*(_QWORD *)v62 != v58)
        objc_enumerationMutation(obj);
      v8 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("$objects"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && (unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("$class"));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        v57 = v12;
        if (!v13)
          goto LABEL_21;
        v15 = *(unsigned int *)(v13 + 16);
        if (objc_msgSend(v11, "count") <= v15)
          goto LABEL_21;
        objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("$classname"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("NSDictionary"));

        if ((v18 & 1) != 0)
        {
          objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("NS.keys"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v54 = v19;
          v20 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
          if (v20)
          {
            v55 = *(_QWORD *)v66;
            while (2)
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v66 != v55)
                  objc_enumerationMutation(v54);
                v22 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j) + 16);
                v23 = objc_msgSend(v11, "count");
                v24 = v23 > v22;
                if (v23 > v22)
                {
                  objc_msgSend(v11, "objectAtIndexedSubscript:", v22);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("actions"));

                  if ((v26 & 1) == 0)
                    continue;
                }
                v27 = 0;
                goto LABEL_35;
              }
              v20 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
              v24 = 0;
              v27 = 1;
              if (v20)
                continue;
              break;
            }
          }
          else
          {
            v24 = 0;
            v27 = 1;
          }
LABEL_35:

          if ((v27 & 1) == 0)
          {

            if (v24)
              goto LABEL_37;
            goto LABEL_23;
          }
        }
        else
        {
LABEL_21:

        }
      }

LABEL_23:
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("$objects"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (!v28 || (unint64_t)objc_msgSend(v28, "count") < 2)
        goto LABEL_30;
      objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("$class"));
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (!v31)
        goto LABEL_29;
      v33 = *(unsigned int *)(v31 + 16);
      if (objc_msgSend(v29, "count") <= v33
        || (objc_msgSend(v29, "objectAtIndexedSubscript:", v33),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("$classname")),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("SKActionTable")),
            v35,
            v34,
            !v36))
      {
LABEL_29:

LABEL_30:
        goto LABEL_31;
      }

LABEL_37:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v8);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_alloc(MEMORY[0x1E0CB3710]);
      v60 = 0;
      v39 = (void *)objc_msgSend(v38, "initForReadingFromData:error:", v37, &v60);
      v40 = v60;
      objc_msgSend(v39, "setRequiresSecureCoding:", 0);
      objc_msgSend(v39, "setDelegate:", a1);
      v41 = (void *)MEMORY[0x1E0C99E60];
      v69[0] = objc_opt_class();
      v69[1] = objc_opt_class();
      v69[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setWithArray:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "decodeObjectOfClasses:forKey:", v43, v52);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("actions"));
        v45 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKeyedSubscript:", v51);
        v46 = objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend(a1, "addActionsToCachedActionTable:", v45);
LABEL_43:
          v48 = 0;
          v50 = (id)v46;
LABEL_45:

          goto LABEL_47;
        }
        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = v44;
        objc_msgSend(v45, "actionForName:", v51);
        v46 = objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend(v45, "actionTableDictionary");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "addActionsToCachedActionTable:", v47);

          goto LABEL_43;
        }
LABEL_44:
        v48 = 1;
        goto LABEL_45;
      }
      v48 = 1;
LABEL_47:

      if ((v48 & 1) == 0)
      {

        goto LABEL_51;
      }
LABEL_31:

    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  }
  while (v6);
LABEL_50:
  v50 = 0;
LABEL_51:

  return v50;
}

+ (void)addActionsToCachedActionTable:(id)a3
{
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_102);
}

uint64_t __53__SKAction_SKActions__addActionsToCachedActionTable___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)_actionTable, "setObject:forKey:", a3, a2);
}

+ (void)convertAction:(id)a3 toDuration:(double)a4
{
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _OWORD v29[2];
  __int128 v30;
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  objc_msgSend(v31, "duration");
  v6 = v5;
  v30 = 0u;
  memset(v29, 0, sizeof(v29));
  std::deque<SKAction * {__strong}>::push_back(v29, &v31);
  while (*((_QWORD *)&v30 + 1))
  {
    v7 = objc_retain(*(id *)(*(_QWORD *)(*((_QWORD *)&v29[0] + 1)
                                       + (((unint64_t)(*((_QWORD *)&v30 + 1) + v30 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                           + 8 * ((*((_QWORD *)&v30 + 1) + v30 - 1) & 0x1FF)));
    std::deque<SKAction * {__strong}>::pop_back(v29);
    objc_msgSend(v7, "duration");
    if (v8 > v6)
    {
      objc_msgSend(v7, "duration");
      v6 = v9;
    }
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v7, "subactions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          v28 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
          std::deque<SKAction * {__strong}>::push_back(v29, &v28);
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

  }
  if (v6 != 0.0)
  {
    std::deque<SKAction * {__strong}>::push_back(v29, &v31);
    while (*((_QWORD *)&v30 + 1))
    {
      v14 = objc_retain(*(id *)(*(_QWORD *)(*((_QWORD *)&v29[0] + 1)
                                          + (((unint64_t)(*((_QWORD *)&v30 + 1) + v30 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                              + 8 * ((*((_QWORD *)&v30 + 1) + v30 - 1) & 0x1FF)));
      std::deque<SKAction * {__strong}>::pop_back(v29);
      objc_msgSend(v14, "duration");
      objc_msgSend(v14, "setDuration:", v15 / v6 * a4);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v14, "subactions", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v21;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v21 != v18)
              objc_enumerationMutation(v16);
            v28 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * j);
            std::deque<SKAction * {__strong}>::push_back(v29, &v28);
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        }
        while (v17);
      }

    }
  }
  std::deque<SKAction * {__strong}>::~deque[abi:ne180100](v29);

}

+ (void)clearActionTableCache
{
  if (_actionTable)
    objc_msgSend((id)_actionTable, "removeAllObjects");
}

+ (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  id v5;
  NSString *v6;
  void *v7;

  v5 = a5;
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", 1);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (Class)v7;
}

- (void)setCppAction:(void *)a3
{
  SKCAction *caction;
  int v6;

  ++*((_DWORD *)a3 + 2);
  caction = self->_caction;
  if (caction)
  {
    v6 = caction->var1 - 1;
    caction->var1 = v6;
    if (!v6)
      (*((void (**)(SKCAction *, SEL))caction->var0 + 1))(caction, a2);
  }
  self->_caction = (SKCAction *)a3;
  *((_QWORD *)a3 + 3) = self;
}

- (void)wasPausedWithTarget:(id)a3 atTime:(double)a4
{
  self->_caction->var7 = a4;
}

- (void)willResumeWithTarget:(id)a3 atTime:(double)a4
{
  self->_caction->var6 = self->_caction->var6 + a4 - self->_caction->var7;
}

- (BOOL)finished
{
  return self->_caction->var11;
}

- (void)setFinished:(BOOL)a3
{
  self->_caction->var11 = a3;
}

- (double)ratioForTime:(double)a3
{
  float v3;

  SKCAction::ratioForTime(self->_caction, a3);
  return v3;
}

- (void)wasAddedToTarget:(id)a3 atTime:(double)a4
{
  SKCAction *caction;
  float var8;
  float var9;
  float v8;

  caction = self->_caction;
  caction->var11 = 0;
  var8 = caction->var8;
  var9 = caction->var9;
  if ((LODWORD(var9) & 0x60000000) != 0)
  {
    v8 = (float)(var8 - (float)(var9 * 0.5))
       + (float)((float)((float)rand() * 4.6566e-10)
               * (float)((float)((float)(var9 * 0.5) + var8) - (float)(var8 - (float)(var9 * 0.5))));
    if (v8 < 0.0)
      v8 = 0.0;
    self->_caction->var2 = v8;
  }
  else
  {
    caction->var2 = var8;
  }
}

- (void)wasRemovedFromTarget:(id)a3 atTime:(double)a4
{
  *(_WORD *)&self->_caction->var11 = 1;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  SKCAction *caction;

  caction = self->_caction;
  caction->var6 = a4;
  caction->var15 = 0.0;
  *(_WORD *)&caction->var11 = 256;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  float v6;
  id v7;

  v7 = a3;
  SKCAction::ratioForTime(self->_caction, a4);
  if (v6 >= 1.0)
    SKCAction::didFinishWithTargetAtTime(self->_caction, (SKCNode *)objc_msgSend(v7, "_backingNode"), a4);

}

+ (SKAction)changeChargeTo:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[7];
  float v7;
  _QWORD v8[3];
  int v9;
  _QWORD v10[4];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SKAction_NodeWithPhysicsBody__changeChargeTo_duration___block_invoke;
  v6[3] = &unk_1EA4FE1A8;
  v6[4] = v10;
  v6[5] = v8;
  v7 = v;
  *(NSTimeInterval *)&v6[6] = duration;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  return (SKAction *)v4;
}

void __57__SKAction_NodeWithPhysicsBody__changeChargeTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  float v6;
  void *v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v5 = a2;
  v14 = v5;
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0.0)
  {
    v6 = *(float *)(a1 + 56);
    objc_msgSend(v5, "physicsBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "charge");
    *(float *)&v8 = v6 - v8;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = LODWORD(v8);

    v5 = v14;
  }
  objc_msgSend(v5, "physicsBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v12 = *(double *)(a1 + 48);
  objc_msgSend(v9, "charge");
  objc_msgSend(v9, "setCharge:", v13 + (a3 - v11) * v10 / v12);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)changeChargeBy:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[6];
  float v7;
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SKAction_NodeWithPhysicsBody__changeChargeBy_duration___block_invoke;
  v6[3] = &unk_1EA4FE1D0;
  v7 = v;
  v6[4] = v8;
  *(NSTimeInterval *)&v6[5] = duration;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return (SKAction *)v4;
}

void __57__SKAction_NodeWithPhysicsBody__changeChargeBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v5;
  float v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a2, "physicsBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(float *)(a1 + 48);
  v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v8 = *(double *)(a1 + 40);
  objc_msgSend(v5, "charge");
  objc_msgSend(v5, "setCharge:", v9 + (a3 - v7) * v6 / v8);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)changeMassTo:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[7];
  float v7;
  _QWORD v8[3];
  int v9;
  _QWORD v10[4];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SKAction_NodeWithPhysicsBody__changeMassTo_duration___block_invoke;
  v6[3] = &unk_1EA4FE1A8;
  v6[4] = v10;
  v6[5] = v8;
  v7 = v;
  *(NSTimeInterval *)&v6[6] = duration;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  return (SKAction *)v4;
}

void __55__SKAction_NodeWithPhysicsBody__changeMassTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  float v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  float v17;
  id v18;

  v5 = a2;
  v18 = v5;
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0.0)
  {
    v6 = *(float *)(a1 + 56);
    objc_msgSend(v5, "physicsBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mass");
    *(float *)&v8 = v6 - v8;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = LODWORD(v8);

    v5 = v18;
  }
  objc_msgSend(v5, "physicsBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mass");
  v11 = v10;
  v12 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v14 = *(double *)(a1 + 48);

  objc_msgSend(v18, "physicsBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = v11 + (a3 - v13) * v12 / v14;
  if (v17 < 0.00001)
    v17 = 0.00001;
  objc_msgSend(v15, "setMass:", v17);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)changeMassBy:(float)v duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[6];
  float v7;
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SKAction_NodeWithPhysicsBody__changeMassBy_duration___block_invoke;
  v6[3] = &unk_1EA4FE1D0;
  v7 = v;
  v6[4] = v8;
  *(NSTimeInterval *)&v6[5] = duration;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return (SKAction *)v4;
}

void __55__SKAction_NodeWithPhysicsBody__changeMassBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v5;
  double v6;
  double v7;
  float v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  float v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "physicsBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mass");
  v7 = v6;
  v8 = *(float *)(a1 + 48);
  v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v10 = *(double *)(a1 + 40);

  objc_msgSend(v14, "physicsBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v7 + (a3 - v9) * v8 / v10;
  if (v13 < 0.00001)
    v13 = 0.00001;
  objc_msgSend(v11, "setMass:", v13);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)applyForce:(CGVector)force duration:(NSTimeInterval)duration
{
  return +[SKAction applyImpulse:duration:](SKAction, "applyImpulse:duration:", force.dx * duration, force.dy * duration);
}

+ (SKAction)applyForce:(CGVector)force atPoint:(CGPoint)point duration:(NSTimeInterval)duration
{
  return +[SKAction applyImpulse:atPoint:duration:](SKAction, "applyImpulse:atPoint:duration:", force.dx * duration, force.dy * duration, point.x, point.y);
}

+ (SKAction)applyTorque:(CGFloat)torque duration:(NSTimeInterval)duration
{
  return +[SKAction applyAngularImpulse:duration:](SKAction, "applyAngularImpulse:duration:", torque * duration);
}

+ (SKAction)applyImpulse:(CGVector)impulse duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[6];
  CGVector v7;
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SKAction_NodeWithPhysicsBody__applyImpulse_duration___block_invoke;
  v6[3] = &unk_1EA500C78;
  v6[4] = v8;
  *(NSTimeInterval *)&v6[5] = duration;
  v7 = impulse;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return (SKAction *)v4;
}

void __55__SKAction_NodeWithPhysicsBody__applyImpulse_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  double v5;
  double v6;
  void *v7;
  float v8;

  v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v6 = *(double *)(a1 + 40);
  objc_msgSend(a2, "physicsBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (a3 - v5) / v6;
  objc_msgSend(v7, "applyImpulse:", *(double *)(a1 + 48) * v8, *(double *)(a1 + 56) * v8);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)applyImpulse:(CGVector)impulse atPoint:(CGPoint)point duration:(NSTimeInterval)duration
{
  void *v5;
  _QWORD v7[6];
  CGVector v8;
  CGPoint v9;
  _QWORD v10[4];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SKAction_NodeWithPhysicsBody__applyImpulse_atPoint_duration___block_invoke;
  v7[3] = &unk_1EA500CA0;
  v7[4] = v10;
  *(NSTimeInterval *)&v7[5] = duration;
  v8 = impulse;
  v9 = point;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v7, duration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v10, 8);
  return (SKAction *)v5;
}

void __63__SKAction_NodeWithPhysicsBody__applyImpulse_atPoint_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  double v5;
  double v6;
  void *v7;
  float v8;

  v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v6 = *(double *)(a1 + 40);
  objc_msgSend(a2, "physicsBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (a3 - v5) / v6;
  objc_msgSend(v7, "applyImpulse:atPoint:", *(double *)(a1 + 48) * v8, *(double *)(a1 + 56) * v8, *(double *)(a1 + 64), *(double *)(a1 + 72));

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)applyAngularImpulse:(CGFloat)impulse duration:(NSTimeInterval)duration
{
  void *v4;
  _QWORD v6[7];
  _QWORD v7[4];

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SKAction_NodeWithPhysicsBody__applyAngularImpulse_duration___block_invoke;
  v6[3] = &unk_1EA500CC8;
  v6[4] = v7;
  *(NSTimeInterval *)&v6[5] = duration;
  *(CGFloat *)&v6[6] = impulse;
  +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v6, duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v7, 8);
  return (SKAction *)v4;
}

void __62__SKAction_NodeWithPhysicsBody__applyAngularImpulse_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  double v5;
  double v6;
  void *v7;
  float v8;

  v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v6 = *(double *)(a1 + 40);
  objc_msgSend(a2, "physicsBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (a3 - v5) / v6;
  objc_msgSend(v7, "applyAngularImpulse:", *(double *)(a1 + 48) * v8);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
}

@end
