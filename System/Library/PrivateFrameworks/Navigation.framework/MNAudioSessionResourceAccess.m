@implementation MNAudioSessionResourceAccess

- (MNAudioSessionResourceAccess)init
{
  MNAudioSessionResourceAccess *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  MNAudioSessionResourceAccess *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MNAudioSessionResourceAccess;
  v2 = -[MNAudioSessionResourceAccess init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.Navigation.AudioSessionQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (unint64_t)promptStyle
{
  void *v3;
  unint64_t v4;

  if ((GEOConfigGetBOOL() & 1) != 0)
    return 1936224884;
  objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "promptStyle");

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)updatePropertiesWithOptions:(id)a3 transportType:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v6 = *(_QWORD *)&a4;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)(objc_msgSend(v8, "guidanceLevelForTransportType:", v6) - 1) > 1)
    {
      v10 = 1;
    }
    else if (objc_msgSend(v9, "pauseSpokenAudio"))
    {
      v10 = 19;
    }
    else
    {
      v10 = 3;
    }
    GetAudioLogForMNAudioSessionResourceAccessCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v10;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_INFO, "Ⓓ Setting AVAudioSession category to Playback with options: 0x%x", buf, 8u);
    }

    v15 = (id)*MEMORY[0x1E0CFEFD0];
    v16 = (id)*MEMORY[0x1E0CFF0F0];
    objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v18 = objc_msgSend(v17, "setCategory:mode:options:error:", v15, v16, v10, &v25);
    v19 = v25;

    if (v19)
      v13 = 0;
    else
      v13 = v18;
    if (v13)
    {
      -[MNAudioSessionResourceAccess _changeNumChannels](self, "_changeNumChannels");
      GetAudioLogForMNAudioSessionResourceAccessCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v15;
        v30 = 2112;
        v31 = v16;
        v32 = 2048;
        v33 = v10;
        _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_INFO, "Ⓓ    Successfully set the category (%@), mode (%@), and options (0x%lX)", buf, 0x20u);
      }
    }
    else
    {
      GetAudioLogForMNAudioSessionResourceAccessCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v29 = v15;
        v30 = 2112;
        v31 = v16;
        v32 = 2048;
        v33 = v10;
        v34 = 2112;
        v35 = v19;
        _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_ERROR, "⒟    Error setting the category (%@), mode (%@), and options (0x%lX) - %@", buf, 0x2Au);
      }

      if (!a5)
        goto LABEL_23;
      v22 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0CB3388];
      v27 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v20, 3401, v23);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_23:

    goto LABEL_24;
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    NAVAudioErrorDomain();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 3400, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13 = 0;
LABEL_24:

  return v13;
}

- (void)_changeNumChannels
{
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v4 = objc_msgSend(v3, "setPreferredOutputNumberOfChannels:error:", 1, &v18);
  v5 = v18;

  GetAudioLogForMNAudioSessionResourceAccessCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    v8 = v5 == 0;
  else
    v8 = 0;
  if (v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "Ⓓ    Successfully set the channel count", buf, 2u);
    }

    -[MNAudioSessionResourceAccess delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[MNAudioSessionResourceAccess delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "audioSessionResourceAccess:didSetChannelCount:", self, 1);
      goto LABEL_13;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "⒟    Error setting the channel count: %@", buf, 0xCu);
    }

    -[MNAudioSessionResourceAccess delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x1E0CB3388];
      v20 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 3404, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[MNAudioSessionResourceAccess delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "audioSessionResourceAccess:didFailWhileSettingChannelCount:", self, v14);

LABEL_13:
    }
  }

}

- (BOOL)activate
{
  unint64_t state;
  NSObject *v4;
  NSObject *queue;
  NSObject *v6;
  unint64_t v7;
  __CFString *v8;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state == 2)
  {
    GetAudioLogForMNAudioSessionResourceAccessCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = self->_state;
      if (v7 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), self->_state);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = off_1E61D7988[v7];
      }
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "Ⓓ Activation ignored : state = %@", buf, 0xCu);

    }
  }
  else
  {
    self->_state = 1;
    GetAudioLogForMNAudioSessionResourceAccessCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "Ⓓ Attempting to activate the audio session", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__MNAudioSessionResourceAccess_activate__block_invoke;
    block[3] = &unk_1E61D23C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  return state != 2;
}

void __40__MNAudioSessionResourceAccess_activate__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  char v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v3 = objc_msgSend(v2, "setActive:error:", 1, &v11);
  v4 = v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MNAudioSessionResourceAccess_activate__block_invoke_2;
  v7[3] = &unk_1E61D1C08;
  v10 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __40__MNAudioSessionResourceAccess_activate__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48) && !*(_QWORD *)(a1 + 32))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 2;
    GetAudioLogForMNAudioSessionResourceAccessCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "Ⓓ    Audio session activation started", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "audioSessionResourceAccess:didActivateSession:", *(_QWORD *)(a1 + 40), 1);
LABEL_14:

    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 0;
    GetAudioLogForMNAudioSessionResourceAccessCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_ERROR, "⒟    Error activating audio session: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
      {
        v15 = *MEMORY[0x1E0CB3388];
        v16 = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 3403, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 3402, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "audioSessionResourceAccess:didFailWhileActivatingSession:", *(_QWORD *)(a1 + 40), v10);

      goto LABEL_14;
    }
  }
}

- (BOOL)deactivate
{
  return -[MNAudioSessionResourceAccess deactivateWithForce:](self, "deactivateWithForce:", 0);
}

- (BOOL)deactivateWithForce:(BOOL)a3
{
  NSObject *v5;
  NSObject *queue;
  NSObject *v7;
  unint64_t state;
  __CFString *v9;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_state)
    a3 = 1;
  if (a3)
  {
    self->_state = 1;
    GetAudioLogForMNAudioSessionResourceAccessCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "Ⓓ Attempting to deactivate the audio session", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MNAudioSessionResourceAccess_deactivateWithForce___block_invoke;
    block[3] = &unk_1E61D23C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    GetAudioLogForMNAudioSessionResourceAccessCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      state = self->_state;
      if (state >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), self->_state);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E61D7988[state];
      }
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "Ⓓ Deactivation ignored : state = %@", buf, 0xCu);

    }
  }
  return a3;
}

void __52__MNAudioSessionResourceAccess_deactivateWithForce___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  char v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v3 = objc_msgSend(v2, "setActive:error:", 0, &v11);
  v4 = v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__MNAudioSessionResourceAccess_deactivateWithForce___block_invoke_2;
  v7[3] = &unk_1E61D1C08;
  v10 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __52__MNAudioSessionResourceAccess_deactivateWithForce___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48) && !*(_QWORD *)(a1 + 32))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 0;
    GetAudioLogForMNAudioSessionResourceAccessCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_INFO, "Ⓓ    Audio session deactivation started", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "audioSessionResourceAccess:didDeactivateSession:", *(_QWORD *)(a1 + 40), 1);
LABEL_19:

    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 2;
    v2 = *(_QWORD *)(a1 + 32);
    GetAudioLogForMNAudioSessionResourceAccessCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v2)
    {
      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 40), "_stringForAVAudioSessionErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(*(id *)(a1 + 32), "code") >> 24;
        v7 = (objc_msgSend(*(id *)(a1 + 32), "code") >> 16);
        v8 = ((unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "code") >> 8);
        v9 = objc_msgSend(*(id *)(a1 + 32), "code");
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138413570;
        v26 = v5;
        v27 = 1024;
        v28 = v6;
        v29 = 1024;
        v30 = v7;
        v31 = 1024;
        v32 = v8;
        v33 = 1024;
        v34 = v9;
        v35 = 2112;
        v36 = v10;
        _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "⒟    Error deactivating audio session (error code %@ '%c%c%c%c') : %@", buf, 0x2Eu);

      }
      v11 = 3406;
    }
    else
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "⒟    Error deactivating audio session (no error given)", buf, 2u);
      }
      v11 = 3405;
    }

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      if (v16)
      {
        v23 = *MEMORY[0x1E0CB3388];
        v24 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v11, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v11, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "audioSessionResourceAccess:didFailWhileDeactivatingSession:", *(_QWORD *)(a1 + 40), v18);

      goto LABEL_19;
    }
  }
}

- (id)_stringForAVAudioSessionErrorCode:(int64_t)a3
{
  __CFString *v3;

  if (a3 <= 561145186)
  {
    if (a3 <= 560161139)
    {
      switch(a3)
      {
        case -50:
          return CFSTR("AVAudioSessionErrorCodeBadParam");
        case 0:
          return CFSTR("AVAudioSessionErrorCodeNone");
        case 560030580:
          return CFSTR("AVAudioSessionErrorCodeIsBusy");
      }
    }
    else if (a3 > 561015904)
    {
      if (a3 == 561015905)
        return CFSTR("AVAudioSessionErrorCodeCannotStartPlaying");
      if (a3 == 561017449)
        return CFSTR("AVAudioSessionErrorCodeInsufficientPriority");
    }
    else
    {
      if (a3 == 560161140)
        return CFSTR("AVAudioSessionErrorCodeIncompatibleCategory");
      if (a3 == 560557684)
        return CFSTR("AVAudioSessionErrorCodeCannotInterruptOthers");
    }
    goto LABEL_39;
  }
  if (a3 > 1768841570)
  {
    if (a3 > 1936290408)
    {
      if (a3 == 1936290409)
        return CFSTR("AVAudioSessionErrorCodeSiriIsRecording");
      if (a3 == 2003329396)
        return CFSTR("AVAudioSessionErrorCodeUnspecified");
    }
    else
    {
      if (a3 == 1768841571)
        return CFSTR("AVAudioSessionErrorCodeSessionNotActive");
      if (a3 == 1836282486)
        return CFSTR("AVAudioSessionErrorCodeMediaServicesFailed");
    }
    goto LABEL_39;
  }
  if (a3 > 561210738)
  {
    if (a3 == 561210739)
      return CFSTR("AVAudioSessionErrorCodeExpiredSession");
    if (a3 == 1701737535)
      return CFSTR("AVAudioSessionErrorCodeMissingEntitlement");
    goto LABEL_39;
  }
  if (a3 == 561145187)
    return CFSTR("AVAudioSessionErrorCodeCannotStartRecording");
  if (a3 != 561145203)
  {
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %ld"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("AVAudioSessionErrorCodeResourceNotAvailable");
  return v3;
}

+ (BOOL)headphonesAreInUse
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isHeadphones") & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (BOOL)deviceSpeakerIsInUse
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0CFF138];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "portType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v8);

        if ((v11 & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (MNAudioSessionAccessDelegate)delegate
{
  return (MNAudioSessionAccessDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
