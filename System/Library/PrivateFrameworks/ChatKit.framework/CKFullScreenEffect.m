@implementation CKFullScreenEffect

- (unint64_t)layerCount
{
  return 0;
}

- (Class)effectViewClass
{
  return 0;
}

- (BOOL)shouldDrawOverNavigationBar
{
  return 0;
}

- (BOOL)isForegroundEffect
{
  return 0;
}

- (double)duration
{
  return 0.0;
}

- (id)backgroundColor
{
  return 0;
}

- (id)messageFilters
{
  return 0;
}

- (id)soundEffectFileURL
{
  return 0;
}

- (BOOL)soundEffectHasHapticTrack
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("CKAudioSessionControllerSessionOptionsWillChangeNotification"), v4);

  v5.receiver = self;
  v5.super_class = (Class)CKFullScreenEffect;
  -[CKFullScreenEffect dealloc](&v5, sel_dealloc);
}

- (int)_filterTypeForCell:(id)a3 caresAboutOrientation:(BOOL *)a4 orientation:(char *)a5
{
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v9, "setAnimatingInDarkEffect:", -[CKFullScreenEffect effectIsDark](self, "effectIsDark"));
    objc_msgSend(v9, "balloonView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      if (a4)
        *a4 = 1;
      v12 = 3;
      if (!a5)
        goto LABEL_7;
      goto LABEL_6;
    }
    objc_msgSend(v9, "balloonView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = objc_opt_isKindOfClass();

    if ((v15 & 1) != 0
      || (objc_msgSend(v9, "balloonView"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v17 = objc_opt_isKindOfClass(),
          v16,
          (v17 & 1) != 0))
    {
      if (a4)
        *a4 = 1;
      v12 = 0;
      if (!a5)
        goto LABEL_7;
LABEL_6:
      objc_msgSend(v9, "balloonView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = objc_msgSend(v13, "orientation");

LABEL_7:
      goto LABEL_30;
    }

  }
  if (a4)
    *a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = 5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = 2;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v12 = 1;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = 1;
          else
            v12 = 999;
        }
      }
    }
  }
LABEL_30:

  return v12;
}

- (void)applyMessageFiltersToCells:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int16 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a3;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v21 = v4;
        v5 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v4);
        v26 = 0;
        v6 = -[CKFullScreenEffect _filterTypeForCell:caresAboutOrientation:orientation:](self, "_filterTypeForCell:caresAboutOrientation:orientation:", v5, (char *)&v26 + 1, &v26);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        -[CKFullScreenEffect messageFilters](self, "messageFilters");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v23 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              if (objc_msgSend(v12, "type") == v6)
              {
                if (HIBYTE(v26) && objc_msgSend(v12, "direction"))
                {
                  v13 = v26;
                  if ((_BYTE)v26)
                    goto LABEL_17;
                  if (objc_msgSend(v12, "direction") != 2)
                  {
                    v13 = v26;
LABEL_17:
                    if (v13 != 1 || objc_msgSend(v12, "direction") != 1)
                      continue;
                  }
                }
                -[CKFullScreenEffect identifier](self, "identifier");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.messages.effect.CKEchoEffect"));

                if (v15
                  && ((objc_opt_respondsToSelector() & 1) != 0
                   || (objc_opt_respondsToSelector() & 1) != 0
                   || (objc_opt_respondsToSelector() & 1) != 0))
                {
                  -[CKFullScreenEffect animateFiltersForCell:](self, "animateFiltersForCell:", v5);
                }
                objc_msgSend(v5, "addFilter:", v12);
                continue;
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
          }
          while (v9);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v5, "contentView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "layer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAllowsGroupBlending:", 0);

        }
        v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v20);
  }

}

- (void)animateFiltersForCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BYTE v39[80];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.colorMatrix.inputColorMatrix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D20];
  *(_DWORD *)v39 = 1065353216;
  *(_OWORD *)&v39[4] = 0uLL;
  *(_QWORD *)&v39[20] = 0x3F80000000000000;
  *(_OWORD *)&v39[28] = 0uLL;
  *(_OWORD *)&v39[44] = 0x3F80000000000000uLL;
  *(_QWORD *)&v39[60] = 0;
  *(_DWORD *)&v39[68] = 0;
  *(_QWORD *)&v39[72] = 1065353216;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)v39 = xmmword_18E7CAF30;
  *(_OWORD *)&v39[16] = xmmword_18E7CAF40;
  *(_OWORD *)&v39[32] = xmmword_18E7CAF50;
  *(_OWORD *)&v39[48] = xmmword_18E7CAF60;
  *(_OWORD *)&v39[64] = xmmword_18E7CAF70;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v39);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)v39 = xmmword_18E7CAF30;
  *(_OWORD *)&v39[16] = xmmword_18E7CAF40;
  *(_OWORD *)&v39[32] = xmmword_18E7CAF50;
  *(_OWORD *)&v39[48] = xmmword_18E7CAF60;
  *(_OWORD *)&v39[64] = xmmword_18E7CAF70;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v39 = 1065353216;
  *(_QWORD *)&v39[12] = 0;
  *(_QWORD *)&v39[4] = 0;
  *(_QWORD *)&v39[20] = 0x3F80000000000000;
  *(_OWORD *)&v39[28] = 0uLL;
  *(_OWORD *)&v39[44] = 0x3F80000000000000uLL;
  *(_QWORD *)&v39[60] = 0;
  *(_DWORD *)&v39[68] = 0;
  *(_QWORD *)&v39[72] = 1065353216;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObjects:", v6, v7, v8, v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v12) = 1008981770;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1041865114;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 0.75;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 1065185444;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithObjects:", v13, v15, v17, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayWithObjects:", v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)v10;
  objc_msgSend(v4, "setValues:", v10);
  objc_msgSend(v4, "setKeyTimes:", v20);
  objc_msgSend(v4, "setTimingFunctions:", v23);
  objc_msgSend(v4, "setDuration:", 4.5);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v26) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "arrayWithObjects:", v27, v29, v31, v33, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setValues:", v34);
  objc_msgSend(v24, "setKeyTimes:", v20);
  objc_msgSend(v24, "setTimingFunctions:", v23);
  objc_msgSend(v24, "setDuration:", 4.5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "imageView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v36 = v35;
    objc_msgSend(v35, "addAnimation:forKey:", v4, CFSTR("matrixAnimation"));
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "balloonView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v3, "statusButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAnimation:forKey:", v24, CFSTR("opacityFade"));

LABEL_6:
LABEL_7:

}

- (void)applyMessageFiltersToTriggeringCell:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  char isKindOfClass;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CKFullScreenEffect messageFilters](self, "messageFilters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 6)
        {
          v11 = v4;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "balloonView");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
              objc_msgSend(v11, "addFilter:fromTriggeringMessage:", v10, 1);
          }

          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)clearMessageFiltersFromCells:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "clearFilters");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    continue;
                }
              }
            }
          }
        }
        objc_msgSend(v8, "contentView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAllowsGroupBlending:", 1);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_ensureAudioPlayer
{
  void *v3;
  CKFullScreenEffectMediaObject *v4;
  CKAudioController *v5;
  void *v6;
  CKAudioController *v7;
  CKAudioController *audioController;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[CKFullScreenEffect _supportsSoundEffects](self, "_supportsSoundEffects") && !self->_audioController)
  {
    -[CKFullScreenEffect soundEffectFileURL](self, "soundEffectFileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = -[CKFullScreenEffectMediaObject initWithFullScreenEffectAudioFileURL:]([CKFullScreenEffectMediaObject alloc], "initWithFullScreenEffectAudioFileURL:", v3);
      v5 = [CKAudioController alloc];
      v12[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CKAudioController initWithMediaObjects:](v5, "initWithMediaObjects:", v6);
      audioController = self->_audioController;
      self->_audioController = v7;

      if (-[CKFullScreenEffect soundEffectHasHapticTrack](self, "soundEffectHasHapticTrack"))
        v9 = CKSupportsAdvancedHaptics();
      else
        v9 = 0;
      -[CKAudioController setShouldUseAVPlayer:](self->_audioController, "setShouldUseAVPlayer:", v9);
      -[CKAudioController setDelegate:](self->_audioController, "setDelegate:", self);
      -[CKAudioController setShouldStopPlayingWhenSilent:](self->_audioController, "setShouldStopPlayingWhenSilent:", 1);
      -[CKAudioController setShouldDuckOthers:](self->_audioController, "setShouldDuckOthers:", 1);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__audioSessionOptionsWillChange_, CFSTR("CKAudioSessionControllerSessionOptionsWillChangeNotification"), v11);

    }
  }
}

- (void)prepareSoundEffect
{
  void *v3;

  if (-[CKFullScreenEffect _supportsSoundEffects](self, "_supportsSoundEffects")
    && (-[CKFullScreenEffect soundEffectFileURL](self, "soundEffectFileURL"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[CKFullScreenEffect _ensureAudioPlayer](self, "_ensureAudioPlayer");
    -[CKAudioController prepareToPlay](self->_audioController, "prepareToPlay");
  }
  else
  {
    -[CKFullScreenEffect _didPrepareSoundEffect](self, "_didPrepareSoundEffect");
  }
}

- (BOOL)_isPlaySoundEnabled
{
  return *MEMORY[0x1E0D37348];
}

- (void)playSoundEffect
{
  if (-[CKFullScreenEffect _isPlaySoundEnabled](self, "_isPlaySoundEnabled"))
  {
    -[CKFullScreenEffect _ensureAudioPlayer](self, "_ensureAudioPlayer");
    self->_currentVolume = 0.0;
    -[CKAudioController play](self->_audioController, "play");
  }
}

- (void)stopSoundEffect
{
  if (-[CKFullScreenEffect _isPlaySoundEnabled](self, "_isPlaySoundEnabled"))
  {
    -[CKAudioController pause](self->_audioController, "pause");
    -[CKAudioController stop](self->_audioController, "stop");
  }
}

- (void)audioController:(id)a3 mediaObjectProgressDidChange:(id)a4 currentTime:(double)a5 duration:(double)a6
{
  float v7;

  if (self->_currentVolume <= 1.0)
  {
    -[CKAudioController setVolume:](self->_audioController, "setVolume:", a3, a4);
    v7 = self->_currentVolume + 0.2;
    self->_currentVolume = v7;
  }
}

- (void)_didPrepareSoundEffect
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CKFullScreenEffect__didPrepareSoundEffect__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __44__CKFullScreenEffect__didPrepareSoundEffect__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "fullScreenEffectDidPrepareSoundEffect:", *(_QWORD *)(a1 + 32));

}

- (void)_audioSessionOptionsWillChange:(id)a3
{
  void *v4;
  void *v5;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CKAudioSessionControllerSessionNotificationOptionsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "unsignedIntegerValue") & 2) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__CKFullScreenEffect__audioSessionOptionsWillChange___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __53__CKFullScreenEffect__audioSessionOptionsWillChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopSoundEffect");
}

- (BOOL)_supportsSoundEffects
{
  if (_supportsSoundEffects_onceToken != -1)
    dispatch_once(&_supportsSoundEffects_onceToken, &__block_literal_global_106);
  return _supportsSoundEffects_supportsSoundEffects;
}

void __43__CKFullScreenEffect__supportsSoundEffects__block_invoke()
{
  _supportsSoundEffects_supportsSoundEffects = 1;
}

- (BOOL)effectIsDark
{
  void *v3;
  void *v4;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  -[CKFullScreenEffect backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CKFullScreenEffect backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getHue:saturation:brightness:alpha:", 0, 0, &v7, &v6);

  return v7 < 0.5 && v6 > 0.5;
}

+ (id)_monochromeDimmingFilterWithType:(int)a3
{
  uint64_t v3;
  void *v4;
  CKFullscreenEffectMessageFilter *v5;
  void *v6;
  _QWORD v8[2];

  v3 = *(_QWORD *)&a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", &unk_1E28712C0, CFSTR("inputBias"));
  objc_msgSend(v4, "setValue:forKey:", &unk_1E28712D0, CFSTR("inputAmount"));
  v5 = objc_alloc_init(CKFullscreenEffectMessageFilter);
  -[CKFullscreenEffectMessageFilter setType:](v5, "setType:", v3);
  -[CKFullscreenEffectMessageFilter setContentAlpha:](v5, "setContentAlpha:", 0.300000012);
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullscreenEffectMessageFilter setBalloonFilters:](v5, "setBalloonFilters:", v6);

  return v5;
}

+ (id)bigEmojiFilter
{
  return (id)objc_msgSend(a1, "_monochromeDimmingFilterWithType:", 3);
}

+ (id)tapBackFilter
{
  CKFullscreenEffectMessageFilter *v2;

  v2 = objc_alloc_init(CKFullscreenEffectMessageFilter);
  -[CKFullscreenEffectMessageFilter setType:](v2, "setType:", 4);
  -[CKFullscreenEffectMessageFilter setContentAlpha:](v2, "setContentAlpha:", 0.0);
  return v2;
}

+ (id)stickerFilter
{
  return (id)objc_msgSend(a1, "_monochromeDimmingFilterWithType:", 5);
}

- (char)messageOrientation
{
  return self->messageOrientation;
}

- (void)setMessageOrientation:(char)a3
{
  self->messageOrientation = a3;
}

- (BOOL)triggeredByResponseKit
{
  return self->_triggeredByResponseKit;
}

- (void)setTriggeredByResponseKit:(BOOL)a3
{
  self->_triggeredByResponseKit = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKMessagePartChatItem)triggeringChatItem
{
  return self->_triggeringChatItem;
}

- (void)setTriggeringChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_triggeringChatItem, a3);
}

- (CKFullScreenEffectDelegate)delegate
{
  return (CKFullScreenEffectDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_triggeringChatItem, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
}

@end
