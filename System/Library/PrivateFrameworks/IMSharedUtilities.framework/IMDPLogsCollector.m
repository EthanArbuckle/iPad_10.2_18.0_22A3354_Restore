@implementation IMDPLogsCollector

- (IMDPLogsCollector)init
{
  IMDPLogsCollector *v2;
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _DPBitValueRecorder *privatizedUIInteractionRecorder;
  id v12;
  void *v13;
  uint64_t v14;
  _DPBitValueRecorder *privatizedImageReceivedRecorder;
  id v16;
  void *v17;
  uint64_t v18;
  _DPBitValueRecorder *privatizedImageSentRecorder;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)IMDPLogsCollector;
  v2 = -[IMDPLogsCollector init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "_primaryAccountCountryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCommSafetySettingsManager sharedManager](IMCommSafetySettingsManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "childIsYoungAgeGroup");
    v6 = CFSTR("ageGroup1");
    if (v5)
      v6 = CFSTR("ageGroup0");
    v7 = v6;

    if (v3)
    {
      v8 = objc_alloc(MEMORY[0x1E0D1D300]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.messages.CommunicationSafety.%@.%@.%@"), CFSTR("PrivatizedUIInteraction"), v7, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithKey:", v9);
      privatizedUIInteractionRecorder = v2->_privatizedUIInteractionRecorder;
      v2->_privatizedUIInteractionRecorder = (_DPBitValueRecorder *)v10;

      v12 = objc_alloc(MEMORY[0x1E0D1D300]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.messages.CommunicationSafety.%@.%@.%@"), CFSTR("PrivatizedImageReceived"), v7, v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "initWithKey:", v13);
      privatizedImageReceivedRecorder = v2->_privatizedImageReceivedRecorder;
      v2->_privatizedImageReceivedRecorder = (_DPBitValueRecorder *)v14;

      v16 = objc_alloc(MEMORY[0x1E0D1D300]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.messages.CommunicationSafety.%@.%@.%@"), CFSTR("PrivatizedImageSent"), v7, v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "initWithKey:", v17);
      privatizedImageSentRecorder = v2->_privatizedImageSentRecorder;
      v2->_privatizedImageSentRecorder = (_DPBitValueRecorder *)v18;

    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1ECFC7648 != -1)
    dispatch_once(&qword_1ECFC7648, &unk_1E3FB3948);
  return (id)qword_1ECFC75A8;
}

+ (id)_primaryAccountCountryCode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAuthKitAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "appleIDCountryCodeForAccount:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)logPrivatizedUIInteractionEvent:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  +[IMCommSafetySettingsManager sharedManager](IMCommSafetySettingsManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "checkSensitivePhotosAnalyticsEnabled");

  if (!v6)
    return 0;
  -[IMDPLogsCollector privatizedUIInteractionRecorder](self, "privatizedUIInteractionRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D1D358];
  v14 = CFSTR("1");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "record:metadata:", v9, v10);

  return v11;
}

- (BOOL)logPrivatizedImageReceivedEvent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  +[IMCommSafetySettingsManager sharedManager](IMCommSafetySettingsManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "checkSensitivePhotosAnalyticsEnabled");

  if (!v6)
    return 0;
  -[IMDPLogsCollector privatizedImageReceivedRecorder](self, "privatizedImageReceivedRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D1D358];
  v14 = CFSTR("1");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "record:metadata:", v9, v10);

  return v11;
}

- (BOOL)logPrivatizedImageSentEvent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  +[IMCommSafetySettingsManager sharedManager](IMCommSafetySettingsManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "checkSensitivePhotosAnalyticsEnabled");

  if (!v6)
    return 0;
  -[IMDPLogsCollector privatizedImageSentRecorder](self, "privatizedImageSentRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D1D358];
  v14 = CFSTR("1");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "record:metadata:", v9, v10);

  return v11;
}

- (_DPBitValueRecorder)privatizedUIInteractionRecorder
{
  return self->_privatizedUIInteractionRecorder;
}

- (void)setPrivatizedUIInteractionRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_privatizedUIInteractionRecorder, a3);
}

- (_DPBitValueRecorder)privatizedImageReceivedRecorder
{
  return self->_privatizedImageReceivedRecorder;
}

- (void)setPrivatizedImageReceivedRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_privatizedImageReceivedRecorder, a3);
}

- (_DPBitValueRecorder)privatizedImageSentRecorder
{
  return self->_privatizedImageSentRecorder;
}

- (void)setPrivatizedImageSentRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_privatizedImageSentRecorder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privatizedImageSentRecorder, 0);
  objc_storeStrong((id *)&self->_privatizedImageReceivedRecorder, 0);
  objc_storeStrong((id *)&self->_privatizedUIInteractionRecorder, 0);
}

@end
