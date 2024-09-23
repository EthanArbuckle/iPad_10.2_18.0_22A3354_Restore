@implementation MPPlaybackEQSetting

+ (MPPlaybackEQSetting)settingWithName:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  char v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  __CFString *v17;
  __CFString *v18;
  char v19;
  __CFString *v20;
  __CFString *v21;
  char v22;
  __CFString *v23;
  __CFString *v24;
  char v25;
  __CFString *v26;
  __CFString *v27;
  char v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  char v37;
  __CFString *v38;
  __CFString *v39;
  char v40;
  __CFString *v41;
  __CFString *v42;
  char v43;
  __CFString *v44;
  __CFString *v45;
  char v46;
  __CFString *v47;
  __CFString *v48;
  char v49;
  __CFString *v50;
  __CFString *v51;
  char v52;
  __CFString *v53;
  __CFString *v54;
  char v55;
  __CFString *v56;
  __CFString *v57;
  char v58;
  __CFString *v59;
  __CFString *v60;
  char v61;
  __CFString *v62;
  __CFString *v63;
  char v64;
  __CFString *v65;
  __CFString *v66;
  char v67;
  __CFString *v68;
  __CFString *v69;
  char v70;
  __CFString *v71;
  __CFString *v72;
  char v73;
  __CFString *v74;
  __CFString *v75;
  int v76;
  void *v77;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("Off")
    || (v6 = -[__CFString isEqual:](v4, "isEqual:", CFSTR("Off")), v5, (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v8 = v5;
    if (v8 == CFSTR("Acoustic")
      || (v9 = v8, v10 = -[__CFString isEqual:](v8, "isEqual:", CFSTR("Acoustic")), v9, (v10 & 1) != 0))
    {
      v7 = 100;
    }
    else
    {
      v11 = v9;
      if (v11 == CFSTR("BassBooster")
        || (v12 = v11,
            v13 = -[__CFString isEqual:](v11, "isEqual:", CFSTR("BassBooster")),
            v12,
            (v13 & 1) != 0))
      {
        v7 = 101;
      }
      else
      {
        v14 = v12;
        if (v14 == CFSTR("BassReducer")
          || (v15 = v14,
              v16 = -[__CFString isEqual:](v14, "isEqual:", CFSTR("BassReducer")),
              v15,
              (v16 & 1) != 0))
        {
          v7 = 102;
        }
        else
        {
          v17 = v15;
          if (v17 == CFSTR("Classical")
            || (v18 = v17,
                v19 = -[__CFString isEqual:](v17, "isEqual:", CFSTR("Classical")),
                v18,
                (v19 & 1) != 0))
          {
            v7 = 103;
          }
          else
          {
            v20 = v18;
            if (v20 == CFSTR("Dance")
              || (v21 = v20,
                  v22 = -[__CFString isEqual:](v20, "isEqual:", CFSTR("Dance")),
                  v21,
                  (v22 & 1) != 0))
            {
              v7 = 104;
            }
            else
            {
              v23 = v21;
              if (v23 == CFSTR("Deep")
                || (v24 = v23,
                    v25 = -[__CFString isEqual:](v23, "isEqual:", CFSTR("Deep")),
                    v24,
                    (v25 & 1) != 0))
              {
                v7 = 105;
              }
              else
              {
                v26 = v24;
                if (v26 == CFSTR("Electronic")
                  || (v27 = v26,
                      v28 = -[__CFString isEqual:](v26, "isEqual:", CFSTR("Electronic")),
                      v27,
                      (v28 & 1) != 0))
                {
                  v7 = 106;
                }
                else
                {
                  v29 = v27;
                  if (v29 == CFSTR("Flat")
                    || (v30 = v29,
                        v31 = -[__CFString isEqual:](v29, "isEqual:", CFSTR("Flat")),
                        v30,
                        (v31 & 1) != 0))
                  {
                    v7 = 107;
                  }
                  else
                  {
                    v32 = v30;
                    if (v32 == CFSTR("HipHop")
                      || (v33 = v32,
                          v34 = -[__CFString isEqual:](v32, "isEqual:", CFSTR("HipHop")),
                          v33,
                          (v34 & 1) != 0))
                    {
                      v7 = 108;
                    }
                    else
                    {
                      v35 = v33;
                      if (v35 == CFSTR("Jazz")
                        || (v36 = v35,
                            v37 = -[__CFString isEqual:](v35, "isEqual:", CFSTR("Jazz")),
                            v36,
                            (v37 & 1) != 0))
                      {
                        v7 = 109;
                      }
                      else
                      {
                        v38 = v36;
                        if (v38 == CFSTR("Latin")
                          || (v39 = v38,
                              v40 = -[__CFString isEqual:](v38, "isEqual:", CFSTR("Latin")),
                              v39,
                              (v40 & 1) != 0))
                        {
                          v7 = 110;
                        }
                        else
                        {
                          v41 = v39;
                          if (v41 == CFSTR("Loudness")
                            || (v42 = v41,
                                v43 = -[__CFString isEqual:](v41, "isEqual:", CFSTR("Loudness")),
                                v42,
                                (v43 & 1) != 0))
                          {
                            v7 = 111;
                          }
                          else
                          {
                            v44 = v42;
                            if (v44 == CFSTR("Lounge")
                              || (v45 = v44,
                                  v46 = -[__CFString isEqual:](v44, "isEqual:", CFSTR("Lounge")),
                                  v45,
                                  (v46 & 1) != 0))
                            {
                              v7 = 112;
                            }
                            else
                            {
                              v47 = v45;
                              if (v47 == CFSTR("Piano")
                                || (v48 = v47,
                                    v49 = -[__CFString isEqual:](v47, "isEqual:", CFSTR("Piano")),
                                    v48,
                                    (v49 & 1) != 0))
                              {
                                v7 = 113;
                              }
                              else
                              {
                                v50 = v48;
                                if (v50 == CFSTR("Pop")
                                  || (v51 = v50,
                                      v52 = -[__CFString isEqual:](v50, "isEqual:", CFSTR("Pop")),
                                      v51,
                                      (v52 & 1) != 0))
                                {
                                  v7 = 114;
                                }
                                else
                                {
                                  v53 = v51;
                                  if (v53 == CFSTR("R&B")
                                    || (v54 = v53,
                                        v55 = -[__CFString isEqual:](v53, "isEqual:", CFSTR("R&B")),
                                        v54,
                                        (v55 & 1) != 0))
                                  {
                                    v7 = 115;
                                  }
                                  else
                                  {
                                    v56 = v54;
                                    if (v56 == CFSTR("Rock")
                                      || (v57 = v56,
                                          v58 = -[__CFString isEqual:](v56, "isEqual:", CFSTR("Rock")),
                                          v57,
                                          (v58 & 1) != 0))
                                    {
                                      v7 = 116;
                                    }
                                    else
                                    {
                                      v59 = v57;
                                      if (v59 == CFSTR("SmallSpeakers")
                                        || (v60 = v59,
                                            v61 = -[__CFString isEqual:](v59, "isEqual:", CFSTR("SmallSpeakers")),
                                            v60,
                                            (v61 & 1) != 0))
                                      {
                                        v7 = 117;
                                      }
                                      else
                                      {
                                        v62 = v60;
                                        if (v62 == CFSTR("SpokenWord")
                                          || (v63 = v62,
                                              v64 = -[__CFString isEqual:](v62, "isEqual:", CFSTR("SpokenWord")),
                                              v63,
                                              (v64 & 1) != 0))
                                        {
                                          v7 = 118;
                                        }
                                        else
                                        {
                                          v65 = v63;
                                          if (v65 == CFSTR("TrebleBooster")
                                            || (v66 = v65,
                                                v67 = -[__CFString isEqual:](v65, "isEqual:", CFSTR("TrebleBooster")),
                                                v66,
                                                (v67 & 1) != 0))
                                          {
                                            v7 = 119;
                                          }
                                          else
                                          {
                                            v68 = v66;
                                            if (v68 == CFSTR("TrebleReducer")
                                              || (v69 = v68,
                                                  v70 = -[__CFString isEqual:](v68, "isEqual:", CFSTR("TrebleReducer")),
                                                  v69,
                                                  (v70 & 1) != 0))
                                            {
                                              v7 = 120;
                                            }
                                            else
                                            {
                                              v71 = v69;
                                              if (v71 == CFSTR("VocalBooster")
                                                || (v72 = v71,
                                                    v73 = -[__CFString isEqual:](v71, "isEqual:", CFSTR("VocalBooster")),
                                                    v72,
                                                    (v73 & 1) != 0))
                                              {
                                                v7 = 121;
                                              }
                                              else
                                              {
                                                v74 = v72;
                                                if (v74 != CFSTR("LateNightMode"))
                                                {
                                                  v75 = v74;
                                                  v76 = -[__CFString isEqual:](v74, "isEqual:", CFSTR("LateNightMode"));

                                                  if (!v76)
                                                  {
                                                    v77 = 0;
                                                    goto LABEL_74;
                                                  }
                                                }
                                                v7 = 122;
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  objc_msgSend(a1, "settingWithPreset:", v7);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_74:

  return (MPPlaybackEQSetting *)v77;
}

- (id)_initWithPreset:(int64_t)a3
{
  MPPlaybackEQSetting *v4;
  MPPlaybackEQSetting *v5;
  objc_super v7;

  if (a3 && (unint64_t)(a3 - 123) < 0xFFFFFFFFFFFFFFE9)
  {
    v4 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MPPlaybackEQSetting;
    v5 = -[MPPlaybackEQSetting init](&v7, sel_init);
    if (v5)
      v5->_preset = a3;
    self = v5;
    v4 = self;
  }

  return v4;
}

- (NSString)name
{
  int64_t preset;
  NSString *result;

  preset = self->_preset;
  switch(preset)
  {
    case 'd':
      result = (NSString *)CFSTR("Acoustic");
      break;
    case 'e':
      result = (NSString *)CFSTR("BassBooster");
      break;
    case 'f':
      result = (NSString *)CFSTR("BassReducer");
      break;
    case 'g':
      result = (NSString *)CFSTR("Classical");
      break;
    case 'h':
      result = (NSString *)CFSTR("Dance");
      break;
    case 'i':
      result = (NSString *)CFSTR("Deep");
      break;
    case 'j':
      result = (NSString *)CFSTR("Electronic");
      break;
    case 'k':
      result = (NSString *)CFSTR("Flat");
      break;
    case 'l':
      result = (NSString *)CFSTR("HipHop");
      break;
    case 'm':
      result = (NSString *)CFSTR("Jazz");
      break;
    case 'n':
      result = (NSString *)CFSTR("Latin");
      break;
    case 'o':
      result = (NSString *)CFSTR("Loudness");
      break;
    case 'p':
      result = (NSString *)CFSTR("Lounge");
      break;
    case 'q':
      result = (NSString *)CFSTR("Piano");
      break;
    case 'r':
      result = (NSString *)CFSTR("Pop");
      break;
    case 's':
      result = (NSString *)CFSTR("R&B");
      break;
    case 't':
      result = (NSString *)CFSTR("Rock");
      break;
    case 'u':
      result = (NSString *)CFSTR("SmallSpeakers");
      break;
    case 'v':
      result = (NSString *)CFSTR("SpokenWord");
      break;
    case 'w':
      result = (NSString *)CFSTR("TrebleBooster");
      break;
    case 'x':
      result = (NSString *)CFSTR("TrebleReducer");
      break;
    case 'y':
      result = (NSString *)CFSTR("VocalBooster");
      break;
    case 'z':
      result = (NSString *)CFSTR("LateNightMode");
      break;
    default:
      if (preset)
        result = (NSString *)CFSTR("Unknown");
      else
        result = (NSString *)CFSTR("Off");
      break;
  }
  return result;
}

- (NSString)localizedName
{
  void *v2;
  int64_t preset;
  void *v4;
  void *v5;
  const __CFString *v6;

  preset = self->_preset;
  switch(preset)
  {
    case 'd':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_ACOUSTIC");
      goto LABEL_27;
    case 'e':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_BASS_BOOSTER");
      goto LABEL_27;
    case 'f':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_BASS_REDUCER");
      goto LABEL_27;
    case 'g':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_CLASSICAL");
      goto LABEL_27;
    case 'h':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_DANCE");
      goto LABEL_27;
    case 'i':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_DEEP");
      goto LABEL_27;
    case 'j':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_ELECTRONIC");
      goto LABEL_27;
    case 'k':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_FLAT");
      goto LABEL_27;
    case 'l':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_HIPHOP");
      goto LABEL_27;
    case 'm':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_JAZZ");
      goto LABEL_27;
    case 'n':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_LATIN");
      goto LABEL_27;
    case 'o':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_LOUDNESS");
      goto LABEL_27;
    case 'p':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_LOUNGE");
      goto LABEL_27;
    case 'q':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_PIANO");
      goto LABEL_27;
    case 'r':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_POP");
      goto LABEL_27;
    case 's':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_RANDB");
      goto LABEL_27;
    case 't':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_ROCK");
      goto LABEL_27;
    case 'u':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_SMALL_SPEAKERS");
      goto LABEL_27;
    case 'v':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_SPOKEN_WORD");
      goto LABEL_27;
    case 'w':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_TREBLE_BOOSTER");
      goto LABEL_27;
    case 'x':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_TREBLE_REDUCER");
      goto LABEL_27;
    case 'y':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_VOCAL_BOOSTER");
      goto LABEL_27;
    case 'z':
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EQ_LATE_NIGHT");
      goto LABEL_27;
    default:
      if (preset)
        return (NSString *)v2;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("OFF");
LABEL_27:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E3163D10, CFSTR("MediaPlayer"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSString *)v2;
  }
}

- (int)avPreset
{
  int64_t preset;
  int v3;

  preset = self->_preset;
  v3 = preset - 99;
  if (preset == 122)
    v3 = 0;
  if (preset)
    return v3;
  else
    return 0;
}

- (int64_t)preset
{
  return self->_preset;
}

+ (NSArray)allSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[26];

  v29[24] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "settingWithPreset:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v28;
  objc_msgSend(a1, "settingWithPreset:", 100);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v27;
  objc_msgSend(a1, "settingWithPreset:", 101);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v26;
  objc_msgSend(a1, "settingWithPreset:", 102);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v25;
  objc_msgSend(a1, "settingWithPreset:", 103);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v24;
  objc_msgSend(a1, "settingWithPreset:", 104);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v23;
  objc_msgSend(a1, "settingWithPreset:", 105);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v22;
  objc_msgSend(a1, "settingWithPreset:", 106);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v21;
  objc_msgSend(a1, "settingWithPreset:", 107);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v20;
  objc_msgSend(a1, "settingWithPreset:", 108);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v19;
  objc_msgSend(a1, "settingWithPreset:", 109);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v18;
  objc_msgSend(a1, "settingWithPreset:", 110);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[11] = v17;
  objc_msgSend(a1, "settingWithPreset:", 111);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[12] = v16;
  objc_msgSend(a1, "settingWithPreset:", 112);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[13] = v15;
  objc_msgSend(a1, "settingWithPreset:", 113);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[14] = v3;
  objc_msgSend(a1, "settingWithPreset:", 114);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[15] = v4;
  objc_msgSend(a1, "settingWithPreset:", 115);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[16] = v5;
  objc_msgSend(a1, "settingWithPreset:", 116);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[17] = v6;
  objc_msgSend(a1, "settingWithPreset:", 117);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[18] = v7;
  objc_msgSend(a1, "settingWithPreset:", 118);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[19] = v8;
  objc_msgSend(a1, "settingWithPreset:", 119);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[20] = v9;
  objc_msgSend(a1, "settingWithPreset:", 120);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[21] = v10;
  objc_msgSend(a1, "settingWithPreset:", 121);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[22] = v11;
  objc_msgSend(a1, "settingWithPreset:", 122);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[23] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 24);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

+ (MPPlaybackEQSetting)settingWithPreset:(int64_t)a3
{
  return (MPPlaybackEQSetting *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithPreset:", a3);
}

@end
