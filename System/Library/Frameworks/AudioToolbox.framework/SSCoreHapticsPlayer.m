@implementation SSCoreHapticsPlayer

- (unint64_t)createAudioResource:(id)a3 error:(id *)a4
{
  id v6;
  CHHapticEngine *engine;
  void *v8;
  unint64_t v9;
  NSURL *audioURL;
  NSURL *v11;
  id v12;
  id v13;
  const char *v14;
  NSObject *p_super;
  os_log_type_t v16;
  uint32_t v17;
  id v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    engine = self->_engine;
    v26 = *MEMORY[0x1E0C9DC08];
    v27[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CHHapticEngine registerAudioResource:options:error:](engine, "registerAudioResource:options:error:", v6, v8, a4);

    if (!*a4)
    {
      v11 = (NSURL *)objc_msgSend(v6, "copy");
      audioURL = self->_audioURL;
      self->_audioURL = v11;
LABEL_18:

      goto LABEL_19;
    }
    if (kSystemSoundClientLogSubsystem)
    {
      audioURL = (NSURL *)*(id *)kSystemSoundClientLogSubsystem;
      if (!audioURL)
        goto LABEL_8;
    }
    else
    {
      audioURL = (NSURL *)MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(&audioURL->super, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *a4;
      v20 = 136315650;
      v21 = "SSCoreHapticsPlayer.mm";
      v22 = 1024;
      v23 = 148;
      v24 = 2112;
      v25 = v13;
      v14 = "%25s:%-5d Invalid audio resource. Not creating audio player and continue. error: %@";
      p_super = &audioURL->super;
      v16 = OS_LOG_TYPE_DEFAULT;
      v17 = 28;
LABEL_16:
      _os_log_impl(&dword_1A0F4D000, p_super, v16, v14, (uint8_t *)&v20, v17);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (!kSystemSoundClientLogSubsystem)
  {
    audioURL = (NSURL *)MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
LABEL_14:
    if (os_log_type_enabled(&audioURL->super, OS_LOG_TYPE_DEBUG))
    {
      v20 = 136315394;
      v21 = "SSCoreHapticsPlayer.mm";
      v22 = 1024;
      v23 = 141;
      v14 = "%25s:%-5d audioURL not valid";
      p_super = &audioURL->super;
      v16 = OS_LOG_TYPE_DEBUG;
      v17 = 18;
      goto LABEL_16;
    }
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  audioURL = (NSURL *)*(id *)kSystemSoundClientLogSubsystem;
  if (audioURL)
    goto LABEL_14;
LABEL_8:
  v9 = 0;
LABEL_19:

  return v9;
}

- (BOOL)createAudioPlayerAndReturnError:(id *)a3
{
  CHHapticAdvancedPatternPlayerExtended *audioPlayer;
  double v6;
  double v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  double v14;
  NSObject *v15;
  id v16;
  id v17;
  const char *v18;
  id v19;
  float audioPatternDuration;
  CHHapticAdvancedPatternPlayerExtended *v21;
  CHHapticAdvancedPatternPlayerExtended *v22;
  BOOL v23;
  id v24;
  id v25;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  double v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = 0;

  -[CHHapticEngine getDurationForResource:](self->_engine, "getDurationForResource:", self->_audioResourceID);
  v7 = v6;
  v8 = objc_alloc(MEMORY[0x1E0C9DD00]);
  v9 = objc_alloc(MEMORY[0x1E0C9DCD8]);
  v10 = (void *)objc_msgSend(v9, "initWithAudioResourceID:parameters:relativeTime:duration:", self->_audioResourceID, MEMORY[0x1E0C9AA60], 0.0, v7);
  v33[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithEvents:parameters:error:", v11, MEMORY[0x1E0C9AA60], a3);

  if (*a3)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v13 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v13)
        goto LABEL_25;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:

LABEL_25:
      v23 = 0;
      goto LABEL_26;
    }
    v17 = *a3;
    v27 = 136315650;
    v28 = "SSCoreHapticsPlayer.mm";
    v29 = 1024;
    v30 = 166;
    v31 = 2112;
    v32 = *(double *)&v17;
    v18 = "%25s:%-5d Invalid audio pattern. Not creating audio player and continue. error: %@";
LABEL_23:
    _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v27, 0x1Cu);
    goto LABEL_24;
  }
  objc_msgSend(v12, "duration");
  self->_audioPatternDuration = v14;
  if (kSystemSoundClientLogSubsystem)
  {
    v15 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v15)
      goto LABEL_15;
  }
  else
  {
    v15 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    audioPatternDuration = self->_audioPatternDuration;
    v27 = 136315650;
    v28 = "SSCoreHapticsPlayer.mm";
    v29 = 1024;
    v30 = 172;
    v31 = 2048;
    v32 = audioPatternDuration;
    _os_log_impl(&dword_1A0F4D000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d audio duration: %.2fs", (uint8_t *)&v27, 0x1Cu);
  }

LABEL_15:
  -[CHHapticEngine createAdvancedPlayerWithPattern:error:](self->_engine, "createAdvancedPlayerWithPattern:error:", v12, a3);
  v21 = (CHHapticAdvancedPatternPlayerExtended *)objc_claimAutoreleasedReturnValue();
  v22 = self->_audioPlayer;
  self->_audioPlayer = v21;

  if (*a3)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v13 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v13)
        goto LABEL_25;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v24 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v25 = *a3;
    v27 = 136315650;
    v28 = "SSCoreHapticsPlayer.mm";
    v29 = 1024;
    v30 = 175;
    v31 = 2112;
    v32 = *(double *)&v25;
    v18 = "%25s:%-5d Failed to create audio player and continue. error: %@";
    goto LABEL_23;
  }
  v23 = 1;
LABEL_26:

  return v23;
}

- (void)createHapticPlayer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSDictionary *hapticPatternDict;
  CHHapticAdvancedPatternPlayerExtended *v13;
  CHHapticAdvancedPatternPlayerExtended *hapticPlayer;
  double v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  float hapticPatternDuration;
  CHHapticAdvancedPatternPlayerExtended *v22;
  NSDictionary *v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      hapticPatternDict = (NSDictionary *)*(id *)kSystemSoundClientLogSubsystem;
      if (!hapticPatternDict)
        goto LABEL_30;
    }
    else
    {
      hapticPatternDict = (NSDictionary *)MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(&hapticPatternDict->super, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315394;
      v25 = "SSCoreHapticsPlayer.mm";
      v26 = 1024;
      v27 = 185;
      _os_log_impl(&dword_1A0F4D000, &hapticPatternDict->super, OS_LOG_TYPE_DEFAULT, "%25s:%-5d No haptic dictionary passed in", (uint8_t *)&v24, 0x12u);
    }
    goto LABEL_29;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9DCA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[CHHapticEngine createAdvancedPlayerWithVibePatternDictionary:error:](self->_engine, "createAdvancedPlayerWithVibePatternDictionary:error:", v7, a4);
    v13 = (CHHapticAdvancedPatternPlayerExtended *)objc_claimAutoreleasedReturnValue();
    hapticPlayer = self->_hapticPlayer;
    self->_hapticPlayer = v13;

    goto LABEL_27;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD00]), "initWithDictionary:error:", v7, a4);
  v10 = v9;
  if (!*a4)
  {
    objc_msgSend(v9, "duration");
    self->_hapticPatternDuration = v15;
    if (kSystemSoundClientLogSubsystem)
    {
      v16 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v16)
      {
LABEL_24:
        -[CHHapticEngine createAdvancedPlayerWithPattern:error:](self->_engine, "createAdvancedPlayerWithPattern:error:", v10, a4);
        v22 = (CHHapticAdvancedPatternPlayerExtended *)objc_claimAutoreleasedReturnValue();
        v11 = self->_hapticPlayer;
        self->_hapticPlayer = v22;
        goto LABEL_25;
      }
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      hapticPatternDuration = self->_hapticPatternDuration;
      v24 = 136315650;
      v25 = "SSCoreHapticsPlayer.mm";
      v26 = 1024;
      v27 = 196;
      v28 = 2048;
      v29 = hapticPatternDuration;
      _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d haptic duration: %.2fs", (uint8_t *)&v24, 0x1Cu);
    }

    goto LABEL_24;
  }
  if (kSystemSoundClientLogSubsystem)
  {
    v11 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v11)
      goto LABEL_26;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *a4;
    v24 = 136315650;
    v25 = "SSCoreHapticsPlayer.mm";
    v26 = 1024;
    v27 = 192;
    v28 = 2112;
    v29 = *(double *)&v19;
    _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Invalid haptic pattern. Not creating haptic player and continue. error: %@", (uint8_t *)&v24, 0x1Cu);
  }
LABEL_25:

LABEL_26:
LABEL_27:
  if (!*a4)
  {
    v23 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v7, 1);
    hapticPatternDict = self->_hapticPatternDict;
    self->_hapticPatternDict = v23;
LABEL_29:

  }
LABEL_30:

}

- (id)setupDefaultEngineConfigBlock
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C9DCA8];
  v3 = *MEMORY[0x1E0C9DC28];
  v7[0] = *MEMORY[0x1E0C9DC20];
  v7[1] = v3;
  v8[0] = v2;
  v8[1] = v2;
  v4 = *MEMORY[0x1E0C9DC38];
  v7[2] = *MEMORY[0x1E0C9DC40];
  v7[3] = v4;
  v5 = *MEMORY[0x1E0C9DC88];
  v8[2] = *MEMORY[0x1E0C9DCB0];
  v8[3] = v5;
  v7[4] = CFSTR("UsageCategory");
  v8[4] = CFSTR("SystemSound");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)doInit:(id)a3 haptic:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id *v16;
  CHHapticEngine *v17;
  CHHapticEngine *engine;
  id *v19;
  NSObject *v20;
  unint64_t v21;
  id *v22;
  _BOOL4 v23;
  id *v24;
  void *v25;
  BOOL v26;
  id v27;
  id v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  _BYTE *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id obj;
  _BYTE location[12];
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  _BYTE buf[32];
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (kSystemSoundClientLogSubsystem)
  {
    v10 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "SSCoreHapticsPlayer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 232;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v13;
    _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Creating new system sound. Audio: %@", buf, 0x1Cu);

  }
LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__2818;
  v47 = __Block_byref_object_dispose__2819;
  v48 = 0;
  self->_audioResourceID = 0;
  *(_DWORD *)&self->_shouldPlayAudioFinal = 16842752;
  -[SSCoreHapticsPlayer setupDefaultEngineConfigBlock](self, "setupDefaultEngineConfigBlock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0C9DCD0]);
  v16 = (id *)(*(_QWORD *)&buf[8] + 40);
  obj = *(id *)(*(_QWORD *)&buf[8] + 40);
  v17 = (CHHapticEngine *)objc_msgSend(v15, "initWithAudioSession:sessionIsShared:options:error:", 0, 0, v14, &obj);
  objc_storeStrong(v16, obj);
  engine = self->_engine;
  self->_engine = v17;

  v19 = (id *)(*(_QWORD *)&buf[8] + 40);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v20 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v20)
        goto LABEL_21;
    }
    else
    {
      v20 = MEMORY[0x1E0C81028];
      v27 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v28 = *v19;
      *(_DWORD *)location = 136315650;
      *(_QWORD *)&location[4] = "SSCoreHapticsPlayer.mm";
      v42 = 1024;
      v43 = 248;
      v44 = 2112;
      v45 = v28;
      _os_log_impl(&dword_1A0F4D000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot initialize CHHapticEngine. error: %@", location, 0x1Cu);
    }

LABEL_21:
    if (a5)
    {
      v29 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
LABEL_23:
      v26 = 0;
      *a5 = v29;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (!self->_engine)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4898, 0);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_26:
    v26 = 0;
    goto LABEL_27;
  }
  v39 = 0;
  v21 = -[SSCoreHapticsPlayer createAudioResource:error:](self, "createAudioResource:error:", v8, &v39);
  objc_storeStrong(v19, v39);
  self->_audioResourceID = v21;
  if (v21)
  {
    v22 = (id *)(*(_QWORD *)&buf[8] + 40);
    v38 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v23 = -[SSCoreHapticsPlayer createAudioPlayerAndReturnError:](self, "createAudioPlayerAndReturnError:", &v38);
    objc_storeStrong(v22, v38);
    if (v23)
      -[CHHapticEngine setFollowAudioRoute:](self->_engine, "setFollowAudioRoute:", 1);
  }
  v24 = (id *)(*(_QWORD *)&buf[8] + 40);
  v37 = *(id *)(*(_QWORD *)&buf[8] + 40);
  -[SSCoreHapticsPlayer createHapticPlayer:error:](self, "createHapticPlayer:error:", v9, &v37);
  objc_storeStrong(v24, v37);
  objc_initWeak((id *)location, self);
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __43__SSCoreHapticsPlayer_doInit_haptic_error___block_invoke;
  v34 = &unk_1E450C050;
  objc_copyWeak(&v36, (id *)location);
  v35 = buf;
  -[CHHapticEngine setResetHandler:](self->_engine, "setResetHandler:", &v31);
  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)location);
  +[SSCoreHapticsInfo instance](SSCoreHapticsInfo, "instance", v31, v32, v33, v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  self->_ssid = objc_msgSend(v25, "generateNewSSIDForPlayer:", self);

  v26 = self->_ssid != 0;
LABEL_27:

  _Block_object_dispose(buf, 8);
  return v26;
}

- (id)getHapticDictionaryFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isFileURL"))
  {
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("json")))
    {

      goto LABEL_5;
    }
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ahap"));

    if (v8)
    {
LABEL_5:
      v9 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v3, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataWithContentsOfFile:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      if (kSystemSoundClientLogSubsystem)
      {
        v12 = *(id *)kSystemSoundClientLogSubsystem;
        if (!v12)
          goto LABEL_19;
      }
      else
      {
        v12 = MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "SSCoreHapticsPlayer.mm";
        v23 = 1024;
        v24 = 307;
        _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Creating haptic dictionary from JSON or AHAP...", buf, 0x12u);
      }

LABEL_19:
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v11, 0, &v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;
      if (v14)
      {
        if (kSystemSoundClientLogSubsystem)
        {
          v17 = *(id *)kSystemSoundClientLogSubsystem;
          if (!v17)
            goto LABEL_27;
        }
        else
        {
          v17 = MEMORY[0x1E0C81028];
          v18 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v22 = "SSCoreHapticsPlayer.mm";
          v23 = 1024;
          v24 = 310;
          v25 = 2112;
          v26 = v14;
          _os_log_impl(&dword_1A0F4D000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot create haptic dictionary. error: %@", buf, 0x1Cu);
        }

      }
LABEL_27:

      goto LABEL_28;
    }
  }
  if (!kSystemSoundClientLogSubsystem)
  {
    v11 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_12;
  }
  v11 = *(id *)kSystemSoundClientLogSubsystem;
  if (v11)
  {
LABEL_12:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "SSCoreHapticsPlayer.mm";
      v23 = 1024;
      v24 = 314;
      _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Incoming ahapURL not a valid file path URL or file type not supported. Not creating haptic portion", buf, 0x12u);
    }
    v13 = 0;
    v14 = 0;
    goto LABEL_27;
  }
  v13 = 0;
  v14 = 0;
LABEL_28:

  return v13;
}

- (BOOL)prepareHapticPatternFromPlayOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  CHHapticAdvancedPatternPlayerExtended *hapticPlayer;
  id v10;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  SSCoreHapticsPlayer *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("PlaySystemSoundOption_VibrationPattern"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SSCoreHapticsPlayer getHapticDictionaryFromURL:](self, "getHapticDictionaryFromURL:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v5 = v4;
  }
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToDictionary:", self->_hapticPatternDict))
    {
      if (kSystemSoundClientLogSubsystem)
      {
        v7 = *(id *)kSystemSoundClientLogSubsystem;
        if (!v7)
          goto LABEL_16;
      }
      else
      {
        v7 = MEMORY[0x1E0C81028];
        v10 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v14 = "SSCoreHapticsPlayer.mm";
        v15 = 1024;
        v16 = 343;
        v17 = 2048;
        v18 = self;
        _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d playOptions contain haptic pattern identical to the one stored in SSCoreHapticsPlayer %p. NOT recreating haptic player", buf, 0x1Cu);
      }

      goto LABEL_16;
    }
    hapticPlayer = self->_hapticPlayer;
    self->_hapticPlayer = 0;

    v12 = 0;
    -[SSCoreHapticsPlayer createHapticPlayer:error:](self, "createHapticPlayer:error:", v6, &v12);
LABEL_16:

    v8 = 1;
    goto LABEL_17;
  }
LABEL_10:
  v8 = 0;
LABEL_17:

  return v8;
}

- (void)setupLooping
{
  double hapticPatternDuration;
  CHHapticAdvancedPatternPlayerExtended *hapticPlayer;
  double audioPatternDuration;

  if (self->_shouldPlayAudioFinal)
  {
    if (self->_shouldPlayHapticsFinal)
    {
      if (self->_audioPatternDuration < self->_hapticPatternDuration)
        hapticPatternDuration = self->_hapticPatternDuration;
      else
        hapticPatternDuration = self->_audioPatternDuration;
      -[CHHapticAdvancedPatternPlayerExtended setLoopEnd:](self->_audioPlayer, "setLoopEnd:", hapticPatternDuration);
      hapticPlayer = self->_hapticPlayer;
      audioPatternDuration = hapticPatternDuration;
    }
    else
    {
      -[CHHapticAdvancedPatternPlayerExtended setLoopEnabled:](self->_audioPlayer, "setLoopEnabled:", 1);
      hapticPlayer = self->_audioPlayer;
      audioPatternDuration = self->_audioPatternDuration;
    }
  }
  else
  {
    if (!self->_shouldPlayHapticsFinal)
      return;
    -[CHHapticAdvancedPatternPlayerExtended setLoopEnabled:](self->_hapticPlayer, "setLoopEnabled:", 1);
    hapticPlayer = self->_hapticPlayer;
    audioPatternDuration = self->_hapticPatternDuration;
  }
  -[CHHapticAdvancedPatternPlayerExtended setLoopEnd:](hapticPlayer, "setLoopEnd:", audioPatternDuration);
}

- (BOOL)startPlayerAtTime:(double)a3 forAudio:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  unint64_t ssid;
  const __CFString *v15;
  id v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  SSCoreHapticsPlayer *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = 16;
  if (a4)
    v9 = 8;
  v10 = *(id *)((char *)&self->super.isa + v9);
  objc_msgSend(v10, "startAtTime:error:", a5, a3);
  v11 = *a5;
  if (*a5)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v12 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v12)
      {
LABEL_13:
        -[SSCoreHapticsPlayer registerCompletionPortion:](self, "registerCompletionPortion:", v6);
        goto LABEL_14;
      }
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      ssid = self->_ssid;
      v15 = CFSTR("haptics");
      v16 = *a5;
      if (v6)
        v15 = CFSTR("audio");
      v18 = 136316418;
      v19 = "SSCoreHapticsPlayer.mm";
      v20 = 1024;
      v21 = 386;
      v22 = 2112;
      v23 = v15;
      v24 = 1024;
      v25 = ssid;
      v26 = 2048;
      v27 = self;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot start %@ portion for SSID %d, SSCoreHapticsPlayer %p, error %@", (uint8_t *)&v18, 0x36u);
    }

    goto LABEL_13;
  }
LABEL_14:

  return v11 == 0;
}

- (void)handleFinish
{
  CHHapticEngine *engine;
  _QWORD v3[5];

  if (self->_audioPlaybackFinished && self->_hapticPlaybackFinished)
  {
    engine = self->_engine;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __35__SSCoreHapticsPlayer_handleFinish__block_invoke;
    v3[3] = &unk_1E450C078;
    v3[4] = self;
    -[CHHapticEngine stopWithCompletionHandler:](engine, "stopWithCompletionHandler:", v3);
  }
}

- (void)registerCompletionPortion:(BOOL)a3
{
  _BOOL4 v3;
  BOOL *p_audioPlaybackFinished;
  NSObject *v6;
  NSObject *v7;
  id v8;
  const __CFString *v9;
  unint64_t v10;
  id v11;
  const __CFString *v12;
  unint64_t ssid;
  _BYTE v14[18];
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  SSCoreHapticsPlayer *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!self->_audioPlayer)
      return;
    p_audioPlaybackFinished = &self->_audioPlaybackFinished;
    if (!self->_audioPlaybackFinished)
      goto LABEL_4;
  }
  else
  {
    if (!self->_hapticPlayer)
      return;
    p_audioPlaybackFinished = &self->_hapticPlaybackFinished;
    if (!self->_hapticPlaybackFinished)
    {
LABEL_4:
      *p_audioPlaybackFinished = 1;
      if (kSystemSoundClientLogSubsystem)
      {
        v6 = *(id *)kSystemSoundClientLogSubsystem;
        if (!v6)
        {
LABEL_24:
          -[SSCoreHapticsPlayer handleFinish](self, "handleFinish", *(_OWORD *)v14);
          return;
        }
      }
      else
      {
        v6 = MEMORY[0x1E0C81028];
        v11 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = CFSTR("Haptics");
        ssid = self->_ssid;
        *(_QWORD *)&v14[4] = "SSCoreHapticsPlayer.mm";
        *(_DWORD *)v14 = 136316162;
        *(_WORD *)&v14[12] = 1024;
        if (v3)
          v12 = CFSTR("Audio");
        *(_DWORD *)&v14[14] = 415;
        v15 = 2112;
        v16 = v12;
        v17 = 1024;
        v18 = ssid;
        v19 = 2048;
        v20 = self;
        _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ completed for SSID %d, SSCoreHapticsPlayer %p", v14, 0x2Cu);
      }

      goto LABEL_24;
    }
  }
  if (kSystemSoundClientLogSubsystem)
  {
    v7 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v7)
      return;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("Haptics");
    v10 = self->_ssid;
    *(_QWORD *)&v14[4] = "SSCoreHapticsPlayer.mm";
    *(_DWORD *)v14 = 136316162;
    *(_WORD *)&v14[12] = 1024;
    if (v3)
      v9 = CFSTR("Audio");
    *(_DWORD *)&v14[14] = 410;
    v15 = 2112;
    v16 = v9;
    v17 = 1024;
    v18 = v10;
    v19 = 2048;
    v20 = self;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@ for SSID %d, SSCoreHapticsPlayer %p has already finished or never started", v14, 0x2Cu);
  }

}

- (void)registerCompletionAndStop
{
  *(_WORD *)&self->_audioPlaybackFinished = 257;
  -[SSCoreHapticsPlayer handleFinish](self, "handleFinish");
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  void *v5;
  CHHapticEngine *engine;
  CHHapticAdvancedPatternPlayerExtended *audioPlayer;
  CHHapticAdvancedPatternPlayerExtended *hapticPlayer;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  SSCoreHapticsPlayer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (kSystemSoundClientLogSubsystem)
  {
    v3 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "SSCoreHapticsPlayer.mm";
    v12 = 1024;
    v13 = 429;
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d Destroying SSCoreHapticsPlayer %p", buf, 0x1Cu);
  }

LABEL_8:
  +[SSCoreHapticsInfo instance](SSCoreHapticsInfo, "instance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterSSID:", self->_ssid);

  engine = self->_engine;
  self->_engine = 0;

  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = 0;

  hapticPlayer = self->_hapticPlayer;
  self->_hapticPlayer = 0;

  v9.receiver = self;
  v9.super_class = (Class)SSCoreHapticsPlayer;
  -[SSCoreHapticsPlayer dealloc](&v9, sel_dealloc);
}

- (SSCoreHapticsPlayer)init
{

  return 0;
}

- (SSCoreHapticsPlayer)initWithAudio:(id)a3 haptic:(id)a4 error:(id *)a5
{
  unint64_t v8;
  unint64_t v9;
  SSCoreHapticsPlayer *v10;
  SSCoreHapticsPlayer *v11;
  void *v12;
  SSCoreHapticsPlayer *v13;
  objc_super v15;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)SSCoreHapticsPlayer;
    v10 = -[SSCoreHapticsPlayer init](&v15, sel_init);
    v11 = v10;
    if (v10)
    {
      -[SSCoreHapticsPlayer getHapticDictionaryFromURL:](v10, "getHapticDictionaryFromURL:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[SSCoreHapticsPlayer doInit:haptic:error:](v11, "doInit:haptic:error:", v8, v12, a5))
      {

        v11 = 0;
      }

    }
    self = v11;
    v13 = self;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4813, 0);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (SSCoreHapticsPlayer)initWithAudio:(id)a3 hapticDictionary:(id)a4 error:(id *)a5
{
  unint64_t v8;
  unint64_t v9;
  SSCoreHapticsPlayer *v10;
  SSCoreHapticsPlayer *v11;
  SSCoreHapticsPlayer *v12;
  objc_super v14;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)SSCoreHapticsPlayer;
    v10 = -[SSCoreHapticsPlayer init](&v14, sel_init);
    v11 = v10;
    if (v10 && !-[SSCoreHapticsPlayer doInit:haptic:error:](v10, "doInit:haptic:error:", v8, v9, a5))
    {

      v11 = 0;
    }
    self = v11;
    v12 = self;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4813, 0);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)playWithOptions:(id)a3 completionCallbackToken:(unsigned int)a4 error:(id *)a5
{
  const __CFDictionary *v7;
  PlatformUtilities *v8;
  _BOOL4 v9;
  float v10;
  float v11;
  id v12;
  id v13;
  NSObject *v14;
  unint64_t ssid;
  void **v16;
  CHHapticAdvancedPatternPlayerExtended *audioPlayer;
  CHHapticAdvancedPatternPlayerExtended *hapticPlayer;
  _BOOL4 shouldPlayAudioFinal;
  char v20;
  NSObject *v21;
  id v22;
  unint64_t v23;
  NSObject *v24;
  id v25;
  unint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  unint64_t v30;
  _BOOL4 v31;
  _BOOL4 shouldPlayHapticsFinal;
  uint64_t v33;
  CHHapticEngine *engine;
  id v35;
  BOOL v36;
  NSObject *v38;
  id v39;
  unint64_t v40;
  _QWORD v41[5];
  const __CFDictionary *v42;
  id v43;
  void **v44;
  _BYTE *v45;
  __int128 v46;
  __int128 v47;
  void *__p;
  void **p_p;
  uint64_t v50;
  char v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id location;
  __int128 v57;
  __int128 v58;
  _BYTE buf[24];
  __int128 v60;
  id v61;
  _BYTE v62[10];
  _BYTE v63[10];
  __int16 v64;
  int v65;
  __int16 v66;
  SSCoreHapticsPlayer *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = (const __CFDictionary *)a3;
  v8 = (PlatformUtilities *)getpid();
  self->_clientCompletionToken = a4;
  v9 = -[SSCoreHapticsPlayer prepareHapticPatternFromPlayOptions:](self, "prepareHapticPatternFromPlayOptions:", v7);
  SSClientPlayOptions::SSClientPlayOptions((SSClientPlayOptions *)&v57, self->_ssid, v7);
  if (*((float *)&v57 + 3) < 0.0)
    HIDWORD(v57) = 0;
  v10 = 0.0;
  if (*(float *)&v58 < 0.0 || (v10 = 1.0, *(float *)&v58 > 1.0))
    *(float *)&v58 = v10;
  v11 = -1.0;
  if (*((float *)&v58 + 1) < -1.0 || (v11 = 1.0, *((float *)&v58 + 1) > 1.0))
    *((float *)&v58 + 1) = v11;
  if (*((float *)&v58 + 2) < 0.0)
    DWORD2(v58) = 0;
  if (kSystemSoundClientLogSubsystem)
  {
    v12 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v12)
      goto LABEL_22;
  }
  else
  {
    v12 = (id)MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  v14 = v12;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    ssid = self->_ssid;
    PlatformUtilities::processName(v8);
    v16 = v50 >= 0 ? &__p : (void **)__p;
    *(_DWORD *)buf = 136317698;
    *(_QWORD *)&buf[4] = "SSCoreHapticsPlayer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 489;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = ssid;
    LOWORD(v60) = 1024;
    *(_DWORD *)((char *)&v60 + 2) = (_DWORD)v8;
    WORD3(v60) = 2080;
    *((_QWORD *)&v60 + 1) = v16;
    LOWORD(v61) = 1024;
    *(_DWORD *)((char *)&v61 + 2) = DWORD1(v57);
    HIWORD(v61) = 1024;
    *(_DWORD *)v62 = v9;
    *(_WORD *)&v62[4] = 1024;
    *(_DWORD *)&v62[6] = BYTE12(v58);
    *(_WORD *)v63 = 2048;
    *(double *)&v63[2] = *((float *)&v57 + 3);
    v64 = 1024;
    v65 = DWORD2(v57);
    v66 = 2048;
    v67 = self;
    _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d -> Incoming Request : SSID %d, inClientPID %d(%s), behaviorID %d, customHapticsProvided %d, loop %d, loopPeriod %f, inFlags %u, SSCoreHapticsPlayer %p", buf, 0x54u);
    if (SHIBYTE(v50) < 0)
      operator delete(__p);
  }

LABEL_22:
  audioPlayer = self->_audioPlayer;
  hapticPlayer = self->_hapticPlayer;
  shouldPlayAudioFinal = audioPlayer != 0;
  self->_shouldPlayAudioFinal = shouldPlayAudioFinal;
  self->_shouldPlayHapticsFinal = hapticPlayer != 0;
  v20 = BYTE8(v57);
  if ((BYTE8(v57) & 1) == 0)
    goto LABEL_32;
  if (audioPlayer)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v21 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v21)
        goto LABEL_31;
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_ssid;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "SSCoreHapticsPlayer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 499;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v23;
      LOWORD(v60) = 2048;
      *(_QWORD *)((char *)&v60 + 2) = self;
      _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disabling audio for SSID %d, SSCoreHapticsPlayer %p as suppress audio flag is set", buf, 0x22u);
    }

  }
LABEL_31:
  shouldPlayAudioFinal = 0;
  self->_shouldPlayAudioFinal = 0;
LABEL_32:
  if ((v20 & 2) != 0)
  {
    if (!self->_shouldPlayHapticsFinal)
    {
LABEL_42:
      self->_shouldPlayHapticsFinal = 0;
      goto LABEL_43;
    }
    if (kSystemSoundClientLogSubsystem)
    {
      v24 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v24)
      {
LABEL_41:
        shouldPlayAudioFinal = self->_shouldPlayAudioFinal;
        goto LABEL_42;
      }
    }
    else
    {
      v24 = MEMORY[0x1E0C81028];
      v25 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = self->_ssid;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "SSCoreHapticsPlayer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 503;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v26;
      LOWORD(v60) = 2048;
      *(_QWORD *)((char *)&v60 + 2) = self;
      _os_log_impl(&dword_1A0F4D000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disabling haptics for SSID %d, SSCoreHapticsPlayer %p as suppress haptic flag is set", buf, 0x22u);
    }

    goto LABEL_41;
  }
LABEL_43:
  if (!shouldPlayAudioFinal && !self->_shouldPlayHapticsFinal)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v38 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v38)
      {
LABEL_63:
        -[SSCoreHapticsPlayer registerCompletionAndStop](self, "registerCompletionAndStop");
        v36 = 1;
        goto LABEL_55;
      }
    }
    else
    {
      v38 = MEMORY[0x1E0C81028];
      v39 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v40 = self->_ssid;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "SSCoreHapticsPlayer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 508;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v40;
      LOWORD(v60) = 1024;
      *(_DWORD *)((char *)&v60 + 2) = DWORD1(v57);
      WORD3(v60) = 2048;
      *((_QWORD *)&v60 + 1) = self;
      _os_log_impl(&dword_1A0F4D000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Both sound and haptic flags are false for SSID %d, behaviorID: %d, SSCoreHapticsPlayer %p", buf, 0x28u);
    }

    goto LABEL_63;
  }
  v27 = (void *)objc_opt_new();
  self->_audioPlaybackFinished = !self->_shouldPlayAudioFinal;
  self->_hapticPlaybackFinished = !self->_shouldPlayHapticsFinal;
  if (!kSystemSoundClientLogSubsystem)
  {
    v28 = MEMORY[0x1E0C81028];
    v29 = MEMORY[0x1E0C81028];
    goto LABEL_49;
  }
  v28 = *(id *)kSystemSoundClientLogSubsystem;
  if (v28)
  {
LABEL_49:
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->_ssid;
      v31 = self->_shouldPlayAudioFinal;
      shouldPlayHapticsFinal = self->_shouldPlayHapticsFinal;
      *(_DWORD *)buf = 136317186;
      *(_QWORD *)&buf[4] = "SSCoreHapticsPlayer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 523;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v30;
      LOWORD(v60) = 2048;
      *(_QWORD *)((char *)&v60 + 2) = self;
      WORD5(v60) = 1024;
      HIDWORD(v60) = v31;
      LOWORD(v61) = 1024;
      *(_DWORD *)((char *)&v61 + 2) = shouldPlayHapticsFinal;
      HIWORD(v61) = 2048;
      *(double *)v62 = *(float *)&v58;
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)v63 = 0;
      *(_WORD *)&v63[4] = 1024;
      *(_DWORD *)&v63[6] = 0;
      _os_log_impl(&dword_1A0F4D000, v28, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SSID %d, SSCoreHapticsPlayer %p, shouldPlayAudio %d, shouldPlayHaptics %d, clientVolumeScalar %f, needsUnduckCall %d, interruptCurrentSystemSounds %d", buf, 0x44u);
    }

  }
  objc_initWeak(&location, self);
  v33 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke;
  v54[3] = &unk_1E450C0A0;
  objc_copyWeak(&v55, &location);
  -[CHHapticAdvancedPatternPlayerExtended setCompletionHandler:](self->_audioPlayer, "setCompletionHandler:", v54);
  v52[0] = v33;
  v52[1] = 3221225472;
  v52[2] = __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke_54;
  v52[3] = &unk_1E450C0A0;
  objc_copyWeak(&v53, &location);
  -[CHHapticAdvancedPatternPlayerExtended setCompletionHandler:](self->_hapticPlayer, "setCompletionHandler:", v52);
  if (BYTE12(v58))
    -[SSCoreHapticsPlayer setupLooping](self, "setupLooping");
  __p = 0;
  p_p = &__p;
  v50 = 0x2020000000;
  v51 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v60 = __Block_byref_object_copy__2818;
  *((_QWORD *)&v60 + 1) = __Block_byref_object_dispose__2819;
  v61 = 0;
  engine = self->_engine;
  v41[0] = v33;
  v41[1] = 3221225472;
  v41[2] = __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke_55;
  v41[3] = &unk_1E450C0C8;
  v41[4] = self;
  v44 = &__p;
  v47 = v58;
  v46 = v57;
  v42 = v7;
  v45 = buf;
  v35 = v27;
  v43 = v35;
  -[CHHapticEngine startWithCompletionHandler:](engine, "startWithCompletionHandler:", v41);
  v36 = *((_BYTE *)p_p + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&__p, 8);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&location);

LABEL_55:
  return v36;
}

- (void)stop:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  unint64_t ssid;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  SSCoreHapticsPlayer *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (!kSystemSoundClientLogSubsystem)
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
LABEL_6:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      ssid = self->_ssid;
      v8 = 136316162;
      v9 = "SSCoreHapticsPlayer.mm";
      v10 = 1024;
      v11 = 585;
      v12 = 1024;
      v13 = ssid;
      v14 = 2048;
      v15 = self;
      v16 = 1024;
      v17 = v3;
      _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Stopping SSID %u, SSCoreHapticsPlayer %p. stopNow: %d", (uint8_t *)&v8, 0x28u);
    }

    if (v3)
      goto LABEL_4;
    goto LABEL_9;
  }
  v5 = *(id *)kSystemSoundClientLogSubsystem;
  if (v5)
    goto LABEL_6;
  if (v3)
  {
LABEL_4:
    -[SSCoreHapticsPlayer registerCompletionAndStop](self, "registerCompletionAndStop");
    return;
  }
LABEL_9:
  if (self->_shouldPlayAudioFinal)
    -[CHHapticAdvancedPatternPlayerExtended setLoopEnabled:](self->_audioPlayer, "setLoopEnabled:", 0);
  if (self->_shouldPlayHapticsFinal)
    -[CHHapticAdvancedPatternPlayerExtended setLoopEnabled:](self->_hapticPlayer, "setLoopEnabled:", 0);
}

- (void)prewarm:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  const __CFString *v7;
  unint64_t ssid;
  CHHapticEngine *engine;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  SSCoreHapticsPlayer *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (kSystemSoundClientLogSubsystem)
  {
    v5 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Unprewarming");
    ssid = self->_ssid;
    v10 = 136316162;
    v11 = "SSCoreHapticsPlayer.mm";
    v12 = 1024;
    if (v3)
      v7 = CFSTR("Prewarming");
    v13 = 603;
    v14 = 2112;
    v15 = v7;
    v16 = 1024;
    v17 = ssid;
    v18 = 2048;
    v19 = self;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ SSID %u, SSCoreHapticsPlayer %p", (uint8_t *)&v10, 0x2Cu);
  }

LABEL_10:
  engine = self->_engine;
  if (v3)
    -[CHHapticEngine prewarmWithCompletionHandler:](engine, "prewarmWithCompletionHandler:", 0);
  else
    -[CHHapticEngine stopPrewarm](engine, "stopPrewarm");
}

- (CHHapticEngine)engine
{
  return (CHHapticEngine *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)ssid
{
  return self->_ssid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_hapticPatternDict, 0);
  objc_storeStrong((id *)&self->_audioURL, 0);
  objc_storeStrong((id *)&self->_hapticPlayer, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
}

void __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  id v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (kSystemSoundClientLogSubsystem)
  {
    v2 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = WeakRetained[10];
    v5 = 136315650;
    v6 = "SSCoreHapticsPlayer.mm";
    v7 = 1024;
    v8 = 529;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_1A0F4D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Audio player completion handler called. SSID %d", (uint8_t *)&v5, 0x18u);
  }

LABEL_8:
  objc_msgSend(WeakRetained, "registerCompletionPortion:", 1);

}

void __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke_54(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  id v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (kSystemSoundClientLogSubsystem)
  {
    v2 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = WeakRetained[10];
    v5 = 136315650;
    v6 = "SSCoreHapticsPlayer.mm";
    v7 = 1024;
    v8 = 534;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_1A0F4D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Haptic player completion handler called. SSID %d", (uint8_t *)&v5, 0x18u);
  }

LABEL_8:
  objc_msgSend(WeakRetained, "registerCompletionPortion:", 0);

}

void __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  uint64_t v40;
  char v41;
  id v42;
  id v43;
  id v44;
  id obj;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  _BYTE v51[10];
  _BYTE v52[20];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v4 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v4)
      {
LABEL_9:
        objc_msgSend(*(id *)(a1 + 32), "registerCompletionAndStop");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        goto LABEL_10;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 80);
      *(_DWORD *)buf = 136316162;
      v47 = "SSCoreHapticsPlayer.mm";
      v48 = 1024;
      v49 = 548;
      v50 = 2048;
      *(_QWORD *)v51 = v6;
      *(_WORD *)&v51[8] = 1024;
      *(_DWORD *)v52 = v7;
      *(_WORD *)&v52[4] = 2112;
      *(_QWORD *)&v52[6] = v3;
      _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot start SSCoreHapticsPlayer %p for SSID %d, error %@", buf, 0x2Cu);
    }

    goto LABEL_9;
  }
LABEL_10:
  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v8 + 68))
    goto LABEL_24;
  if (!kSystemSoundClientLogSubsystem)
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_15;
  }
  v9 = *(id *)kSystemSoundClientLogSubsystem;
  if (v9)
  {
LABEL_15:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(v11 + 80);
      v13 = *(_DWORD *)(a1 + 76);
      v14 = *(float *)(a1 + 88);
      *(_DWORD *)buf = 136316418;
      v47 = "SSCoreHapticsPlayer.mm";
      v48 = 1024;
      v49 = 555;
      v50 = 1024;
      *(_DWORD *)v51 = v12;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = v13;
      *(_WORD *)v52 = 2048;
      *(_QWORD *)&v52[2] = v11;
      *(_WORD *)&v52[10] = 2048;
      *(double *)&v52[12] = v14;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Starting audio: SSID %u, behaviorID %u, SSCoreHapticsPlayer %p, clientVolumeScalar %f", buf, 0x32u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("PlaySystemSoundOption_UnduckTime"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "doubleValue");
    if (v17 > 0.00999999978)
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 8);
      objc_msgSend(*(id *)(v18 + 72), "currentTime");
      v21 = v20;
      objc_msgSend(v16, "doubleValue");
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v23 + 40);
      objc_msgSend(v19, "earlyUnduckAudioAtTime:error:", &obj, v21 + v22);
      objc_storeStrong((id *)(v23 + 40), obj);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "currentTime");
  v25 = v24 + 0.03;
  v26 = *(void **)(a1 + 32);
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v44 = *(id *)(v27 + 40);
  v28 = objc_msgSend(v26, "startPlayerAtTime:forAudio:error:", 1, &v44, v24 + 0.03);
  objc_storeStrong((id *)(v27 + 40), v44);
  if ((v28 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v29 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v30 = *(_QWORD *)(a1 + 48);
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v43 = *(id *)(v31 + 40);
  objc_msgSend(v29, "sendParameters:atTime:error:", v30, &v43, v25);
  objc_storeStrong((id *)(v31 + 40), v43);

  v8 = *(_QWORD *)(a1 + 32);
LABEL_24:
  if (!*(_BYTE *)(v8 + 69))
    goto LABEL_34;
  objc_msgSend(*(id *)(v8 + 72), "currentTime");
  v33 = v32;
  if (!kSystemSoundClientLogSubsystem)
  {
    v34 = MEMORY[0x1E0C81028];
    v35 = MEMORY[0x1E0C81028];
    goto LABEL_29;
  }
  v34 = *(id *)kSystemSoundClientLogSubsystem;
  if (v34)
  {
LABEL_29:
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(_QWORD *)(a1 + 32);
      v37 = *(_QWORD *)(v36 + 80);
      v38 = *(_DWORD *)(a1 + 76);
      *(_DWORD *)buf = 136316162;
      v47 = "SSCoreHapticsPlayer.mm";
      v48 = 1024;
      v49 = 573;
      v50 = 1024;
      *(_DWORD *)v51 = v37;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = v38;
      *(_WORD *)v52 = 2048;
      *(_QWORD *)&v52[2] = v36;
      _os_log_impl(&dword_1A0F4D000, v34, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Starting haptics: SSID %u, behaviorID %u, SSCoreHapticsPlayer %p", buf, 0x28u);
    }

  }
  v39 = *(void **)(a1 + 32);
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v42 = *(id *)(v40 + 40);
  v41 = objc_msgSend(v39, "startPlayerAtTime:forAudio:error:", 0, &v42, v33 + 0.03);
  objc_storeStrong((id *)(v40 + 40), v42);
  if ((v41 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_34:

}

void __35__SSCoreHapticsPlayer_handleFinish__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  SSClientCompletion *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kSystemSoundClientLogSubsystem)
  {
    v4 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 80);
    v9 = 136315906;
    v10 = "SSCoreHapticsPlayer.mm";
    v11 = 1024;
    v12 = 397;
    v13 = 1024;
    v14 = v7;
    v15 = 2048;
    v16 = v6;
    _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d System sound finished playing, SSID %d, SSCoreHapticsPlayer %p", (uint8_t *)&v9, 0x22u);
  }

LABEL_8:
  v8 = (SSClientCompletion *)CADeprecated::TSingleton<SSClientCompletion>::instance();
  SSClientCompletion::SendClientCompletion(v8, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80));

}

void __43__SSCoreHapticsPlayer_doInit_haptic_error___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id obj;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _QWORD *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (kSystemSoundClientLogSubsystem)
  {
    v3 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "SSCoreHapticsPlayer.mm";
    v21 = 1024;
    v22 = 271;
    v23 = 2048;
    v24 = WeakRetained;
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SSCoreHapticsPlayer %p: Lost connection with server. re-creating players", buf, 0x1Cu);
  }

LABEL_8:
  v5 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;

  v6 = (void *)WeakRetained[9];
  v7 = WeakRetained[4];
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "unregisterAudioResource:error:", v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  v9 = WeakRetained[3];
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v17 = *(id *)(v10 + 40);
  v11 = objc_msgSend(WeakRetained, "createAudioResource:error:", v9, &v17);
  objc_storeStrong((id *)(v10 + 40), v17);
  WeakRetained[4] = v11;
  if (v11)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(id *)(v12 + 40);
    objc_msgSend(WeakRetained, "createAudioPlayerAndReturnError:", &v16);
    objc_storeStrong((id *)(v12 + 40), v16);
  }
  v13 = WeakRetained[5];
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(id *)(v14 + 40);
  objc_msgSend(WeakRetained, "createHapticPlayer:error:", v13, &v15);
  objc_storeStrong((id *)(v14 + 40), v15);

}

@end
