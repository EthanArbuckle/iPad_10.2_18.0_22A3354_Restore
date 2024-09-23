@implementation AVHapticPlayerChannel

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
}

- (BOOL)resetAtTime:(double)a3 error:(id *)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayerChannel client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136316162;
    v21 = "AVHapticPlayer.mm";
    v22 = 1024;
    v23 = 150;
    v24 = 2080;
    v25 = "-[AVHapticPlayerChannel resetAtTime:error:]";
    v26 = 2048;
    v27 = objc_msgSend(v10, "clientID");
    v28 = 2048;
    v29 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: sending reset event: clientID: 0x%lx time: %.3f", (uint8_t *)&v20, 0x30u);

  }
LABEL_8:
  -[AVHapticPlayerChannel client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 151, "-[AVHapticPlayerChannel resetAtTime:error:]", "self.client != nil", -4804, a4);
  }
  else
  {
    -[AVHapticPlayerChannel client](self, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "clientID") == -1;

    if (v14)
    {
      _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 152, "-[AVHapticPlayerChannel resetAtTime:error:]", "self.client.clientID != kInvalidClientID", -4812, a4);
    }
    else
    {
      -[AVHapticPlayerChannel client](self, "client");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "running");

      if ((v16 & 1) != 0)
      {
        -[AVHapticPlayerChannel client](self, "client");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "resetChannel:atTime:", -[AVHapticPlayerChannel chanID](self, "chanID"), a3);

        if ((v18 & 1) != 0)
          return 1;
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 154, "-[AVHapticPlayerChannel resetAtTime:error:]", "[self.client resetChannel:self.chanID atTime:time]", -4899, a4);
      }
      else
      {
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 153, "-[AVHapticPlayerChannel resetAtTime:error:]", "self.client.running", -4805, a4);
      }
    }
  }
  return 0;
}

- (BOOL)sendEvents:(id)a3 atTime:(double)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  BOOL v21;
  int v22;
  const char *v23;
  uint64_t v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayerChannel client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 136316162;
    v27 = "AVHapticPlayer.mm";
    v28 = 1024;
    v29 = 91;
    v30 = 2080;
    v31 = "-[AVHapticPlayerChannel sendEvents:atTime:error:]";
    v32 = 2048;
    v33 = objc_msgSend(v12, "clientID");
    v34 = 2048;
    v35 = a4;
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: sending event array: clientID: 0x%lx atTime: %.3f", (uint8_t *)&v26, 0x30u);

  }
LABEL_8:
  -[AVHapticPlayerChannel client](self, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    v22 = -4804;
    v23 = "self.client != nil";
    v24 = 92;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v24, "-[AVHapticPlayerChannel sendEvents:atTime:error:]", v23, v22, a5);
    v21 = 0;
    goto LABEL_18;
  }
  -[AVHapticPlayerChannel client](self, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "clientID") == -1;

  if (v16)
  {
    v22 = -4812;
    v23 = "self.client.clientID != kInvalidClientID";
    v24 = 93;
    goto LABEL_17;
  }
  -[AVHapticPlayerChannel client](self, "client");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "running");

  if ((v18 & 1) == 0)
  {
    v22 = -4805;
    v23 = "self.client.running";
    v24 = 94;
    goto LABEL_17;
  }
  -[AVHapticPlayerChannel client](self, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "sendEvents:withImmediateParameters:atTime:channel:outToken:error:", v8, 0, -[AVHapticPlayerChannel chanID](self, "chanID"), 0, a5, a4);

  if ((v20 & 1) == 0)
  {
    v22 = -4899;
    v23 = "[self.client sendEvents:events withImmediateParameters:nil atTime:time channel:self.chanID outToken:nil error:outError]";
    v24 = 97;
    goto LABEL_17;
  }
  v21 = 1;
LABEL_18:

  return v21;
}

- (AVHapticClient)client
{
  return (AVHapticClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (unint64_t)chanID
{
  return self->_chanID;
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_client, 0);
}

- (AVHapticPlayerChannel)initWithChannelID:(id)a3 client:(id)a4
{
  id v6;

  v6 = a4;
  self->_chanID = objc_msgSend(a3, "unsignedIntegerValue");
  objc_storeWeak((id *)&self->_client, v6);
  self->_behavior = 0;

  return self;
}

- (unint64_t)eventBehavior
{
  return self->_behavior;
}

- (void)setEventBehavior:(unint64_t)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v5 = *(id *)kAVHCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayerChannel client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316418;
    v14 = "AVHapticPlayer.mm";
    v15 = 1024;
    v16 = 76;
    v17 = 2080;
    v18 = "-[AVHapticPlayerChannel setEventBehavior:]";
    v19 = 2048;
    v20 = objc_msgSend(v8, "clientID");
    v21 = 1024;
    v22 = -[AVHapticPlayerChannel chanID](self, "chanID");
    v23 = 1024;
    v24 = a3;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: clientID: 0x%lx channelID: %u behavior: %u", (uint8_t *)&v13, 0x32u);

  }
LABEL_8:
  if (self->_behavior == a3)
    return;
  if (a3 >= 8)
  {
    if (kAVHCScope)
    {
      v11 = *(id *)kAVHCScope;
      if (!v11)
        return;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315906;
      v14 = "AVHapticPlayer.mm";
      v15 = 1024;
      v16 = 79;
      v17 = 2080;
      v18 = "-[AVHapticPlayerChannel setEventBehavior:]";
      v19 = 1024;
      LODWORD(v20) = a3;
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal event behavior: %u", (uint8_t *)&v13, 0x22u);
    }

  }
  else
  {
    -[AVHapticPlayerChannel client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "setChannelEventBehavior:channel:", a3, -[AVHapticPlayerChannel chanID](self, "chanID"));

    if (v10)
      self->_behavior = a3;
  }
}

- (BOOL)sendEvents:(id)a3 withImmediateParameters:(id)a4 atTime:(double)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  BOOL v24;
  int v25;
  const char *v26;
  uint64_t v27;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (kAVHCScope)
  {
    v12 = *(id *)kAVHCScope;
    if (!v12)
      goto LABEL_8;
  }
  else
  {
    v12 = (id)MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  v14 = v12;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayerChannel client](self, "client");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 136316162;
    v30 = "AVHapticPlayer.mm";
    v31 = 1024;
    v32 = 103;
    v33 = 2080;
    v34 = "-[AVHapticPlayerChannel sendEvents:withImmediateParameters:atTime:error:]";
    v35 = 2048;
    v36 = objc_msgSend(v15, "clientID");
    v37 = 2048;
    v38 = a5;
    _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: sending event array: clientID: 0x%lx atTime: %.3f", (uint8_t *)&v29, 0x30u);

  }
LABEL_8:
  -[AVHapticPlayerChannel client](self, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (v17)
  {
    v25 = -4804;
    v26 = "self.client != nil";
    v27 = 104;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v27, "-[AVHapticPlayerChannel sendEvents:withImmediateParameters:atTime:error:]", v26, v25, a6);
    v24 = 0;
    goto LABEL_18;
  }
  -[AVHapticPlayerChannel client](self, "client");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "clientID") == -1;

  if (v19)
  {
    v25 = -4812;
    v26 = "self.client.clientID != kInvalidClientID";
    v27 = 105;
    goto LABEL_17;
  }
  -[AVHapticPlayerChannel client](self, "client");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "running");

  if ((v21 & 1) == 0)
  {
    v25 = -4805;
    v26 = "self.client.running";
    v27 = 106;
    goto LABEL_17;
  }
  -[AVHapticPlayerChannel client](self, "client");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "sendEvents:withImmediateParameters:atTime:channel:outToken:error:", v10, v11, -[AVHapticPlayerChannel chanID](self, "chanID"), 0, a6, a5);

  if ((v23 & 1) == 0)
  {
    v25 = -4899;
    v26 = "[self.client sendEvents:events withImmediateParameters:immediateParameters atTime:time channel:self.chanID out"
          "Token:nil error:outError]";
    v27 = 109;
    goto LABEL_17;
  }
  v24 = 1;
LABEL_18:

  return v24;
}

- (BOOL)clearEvents:(double)a3 error:(id *)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayerChannel client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136316162;
    v21 = "AVHapticPlayer.mm";
    v22 = 1024;
    v23 = 115;
    v24 = 2080;
    v25 = "-[AVHapticPlayerChannel clearEvents:error:]";
    v26 = 2048;
    v27 = objc_msgSend(v10, "clientID");
    v28 = 2048;
    v29 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: clearing events: clientID: 0x%lx fromTime: %.3f", (uint8_t *)&v20, 0x30u);

  }
LABEL_8:
  -[AVHapticPlayerChannel client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 116, "-[AVHapticPlayerChannel clearEvents:error:]", "self.client != nil", -4804, a4);
  }
  else
  {
    -[AVHapticPlayerChannel client](self, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "clientID") == -1;

    if (v14)
    {
      _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 117, "-[AVHapticPlayerChannel clearEvents:error:]", "self.client.clientID != kInvalidClientID", -4812, a4);
    }
    else
    {
      -[AVHapticPlayerChannel client](self, "client");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "running");

      if ((v16 & 1) != 0)
      {
        -[AVHapticPlayerChannel client](self, "client");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "clearEventsFromTime:channel:", -[AVHapticPlayerChannel chanID](self, "chanID"), a3);

        if ((v18 & 1) != 0)
          return 1;
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 121, "-[AVHapticPlayerChannel clearEvents:error:]", "[self.client clearEventsFromTime:fromTime channel:self.chanID]", -4899, a4);
      }
      else
      {
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 118, "-[AVHapticPlayerChannel clearEvents:error:]", "self.client.running", -4805, a4);
      }
    }
  }
  return 0;
}

- (BOOL)setParameter:(unint64_t)a3 value:(float)a4 atTime:(double)a5 error:(id *)a6
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  void *v21;
  unint64_t v22;
  double v23;
  char v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v11 = *(id *)kAVHCScope;
    if (!v11)
      goto LABEL_8;
  }
  else
  {
    v11 = (id)MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  v13 = v11;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayerChannel client](self, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 136316674;
    v27 = "AVHapticPlayer.mm";
    v28 = 1024;
    v29 = 127;
    v30 = 2080;
    v31 = "-[AVHapticPlayerChannel setParameter:value:atTime:error:]";
    v32 = 2048;
    v33 = objc_msgSend(v14, "clientID");
    v34 = 1024;
    v35 = a3;
    v36 = 2048;
    v37 = a4;
    v38 = 2048;
    v39 = a5;
    _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: setting param: clientID: 0x%lx type: %u value: %.2f atTime: %.3f", (uint8_t *)&v26, 0x40u);

  }
LABEL_8:
  -[AVHapticPlayerChannel client](self, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v16)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 128, "-[AVHapticPlayerChannel setParameter:value:atTime:error:]", "self.client != nil", -4804, a6);
  }
  else
  {
    -[AVHapticPlayerChannel client](self, "client");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "clientID") == -1;

    if (v18)
    {
      _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 129, "-[AVHapticPlayerChannel setParameter:value:atTime:error:]", "self.client.clientID != kInvalidClientID", -4812, a6);
    }
    else
    {
      -[AVHapticPlayerChannel client](self, "client");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "running");

      if ((v20 & 1) != 0)
      {
        -[AVHapticPlayerChannel client](self, "client");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[AVHapticPlayerChannel chanID](self, "chanID");
        *(float *)&v23 = a4;
        v24 = objc_msgSend(v21, "setParameter:atTime:value:channel:", a3, v22, a5, v23);

        if ((v24 & 1) != 0)
          return 1;
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 133, "-[AVHapticPlayerChannel setParameter:value:atTime:error:]", "[self.client setParameter:type atTime:time value:value channel:self.chanID]", -4899, a6);
      }
      else
      {
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 130, "-[AVHapticPlayerChannel setParameter:value:atTime:error:]", "self.client.running", -4805, a6);
      }
    }
  }
  return 0;
}

- (BOOL)scheduleParameterCurve:(unint64_t)a3 curve:(id)a4 atTime:(double)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  BOOL v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v10 = a4;
  -[AVHapticPlayerChannel client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v19 = -4804;
    v20 = "self.client != nil";
    v21 = 139;
LABEL_10:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v21, "-[AVHapticPlayerChannel scheduleParameterCurve:curve:atTime:error:]", v20, v19, a6);
    v18 = 0;
    goto LABEL_11;
  }
  -[AVHapticPlayerChannel client](self, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "clientID");

  if (v13 == -1)
  {
    v19 = -4812;
    v20 = "self.client.clientID != kInvalidClientID";
    v21 = 140;
    goto LABEL_10;
  }
  -[AVHapticPlayerChannel client](self, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "running");

  if ((v15 & 1) == 0)
  {
    v19 = -4805;
    v20 = "self.client.running";
    v21 = 141;
    goto LABEL_10;
  }
  -[AVHapticPlayerChannel client](self, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "scheduleParameterCurve:curve:atTime:channel:error:", a3, v10, -[AVHapticPlayerChannel chanID](self, "chanID"), a6, a5);

  if ((v17 & 1) == 0)
  {
    v19 = -4899;
    v20 = "[self.client scheduleParameterCurve:type curve:parameterCurve atTime:time channel:self.chanID error:outError]";
    v21 = 144;
    goto LABEL_10;
  }
  v18 = 1;
LABEL_11:

  return v18;
}

- (void)setChanID:(unint64_t)a3
{
  self->_chanID = a3;
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

@end
