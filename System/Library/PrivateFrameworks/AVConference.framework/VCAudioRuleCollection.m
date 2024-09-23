@implementation VCAudioRuleCollection

- (VCAudioRuleCollection)init
{
  VCAudioRuleCollection *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCAudioRuleCollection;
  v2 = -[VCAudioRuleCollection init](&v4, sel_init);
  if (v2)
  {
    v2->_rules = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_secondaryPayloads = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v2;
}

- (VCAudioRuleCollection)initWithPhoneContinuity:(BOOL)a3 allowAudioSwitching:(BOOL)a4 sbr:(BOOL)a5 aacBlockSize:(int)a6
{
  _BOOL8 v7;
  _BOOL8 v9;
  VCAudioRuleCollection *v10;
  VCAudioRuleCollection *v11;

  v7 = a5;
  v9 = a3;
  v10 = -[VCAudioRuleCollection init](self, "init");
  v11 = v10;
  if (v10)
  {
    v10->_aacBlockSize = a6;
    v10->_allowAudioSwitching = a4;
    -[VCAudioRuleCollection setupAudioRulesWithSBR:isContinuity:](v10, "setupAudioRulesWithSBR:isContinuity:", v7, v9);
  }
  return v11;
}

- (VCAudioRuleCollection)initWithPhoneContinuity:(BOOL)a3 allowAudioSwitching:(BOOL)a4 sbr:(BOOL)a5 aacBlockSize:(int)a6 isLowLatencyAudio:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  VCAudioRuleCollection *v9;
  VCAudioRuleCollection *v10;

  v7 = a7;
  v8 = a5;
  v9 = -[VCAudioRuleCollection initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:](self, "initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:", a3, a4, a5, *(_QWORD *)&a6);
  v10 = v9;
  if (v9 && v7)
    -[VCAudioRuleCollection addAudioPayload:isSecondary:sbr:](v9, "addAudioPayload:isSecondary:sbr:", 101, 0, v8);
  return v10;
}

- (id)initPrimaryPayload:(int)a3 dtxPayload:(int)a4 redPayload:(int)a5 secondaryPayloads:(id)a6 allowAudioSwitching:(BOOL)a7 sbr:(BOOL)a8 aacBlockSize:(int)a9
{
  _BOOL8 v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  VCAudioRuleCollection *v15;
  VCAudioRuleCollection *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v9 = a8;
  v12 = *(_QWORD *)&a5;
  v13 = *(_QWORD *)&a4;
  v14 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  v15 = -[VCAudioRuleCollection init](self, "init");
  v16 = v15;
  if (v15)
  {
    v15->_aacBlockSize = a9;
    v15->_allowAudioSwitching = a7;
    -[VCAudioRuleCollection addAudioPayload:isSecondary:sbr:](v15, "addAudioPayload:isSecondary:sbr:", v14, 0, v9);
    if ((_DWORD)v13 != 128)
      -[VCAudioRuleCollection addAudioPayload:isSecondary:sbr:](v16, "addAudioPayload:isSecondary:sbr:", v13, 1, v9);
    if ((_DWORD)v12 != 128)
      -[VCAudioRuleCollection addAudioPayload:isSecondary:sbr:](v16, "addAudioPayload:isSecondary:sbr:", v12, 1, 0);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v17 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(a6);
          -[VCAudioRuleCollection addAudioPayload:isSecondary:sbr:](v16, "addAudioPayload:isSecondary:sbr:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20++), "unsignedIntValue"), 1, v9);
        }
        while (v18 != v20);
        v18 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      }
      while (v18);
    }
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioRuleCollection;
  -[VCAudioRuleCollection dealloc](&v3, sel_dealloc);
}

- (void)addAudioPayload:(int)a3 isSecondary:(BOOL)a4 sbr:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  uint64_t v7;
  VCAudioRule *v9;
  uint64_t aacBlockSize;
  _BOOL8 v12;
  VCAudioRule *v13;

  v5 = a5;
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v9 = [VCAudioRule alloc];
  aacBlockSize = 0;
  if ((v7 - 101) <= 5 && ((1 << (v7 - 101)) & 0x39) != 0)
    aacBlockSize = self->_aacBlockSize;
  v12 = ((_DWORD)v7 == 101 || (v7 - 104) < 3) && v5;
  v13 = -[VCAudioRule initWithPayload:isSecondary:sbr:samplesPerBlock:](v9, "initWithPayload:isSecondary:sbr:samplesPerBlock:", v7, v6, v12, aacBlockSize);
  -[VCAudioRuleCollection addAudioRule:](self, "addAudioRule:", v13);

}

- (void)setupAudioRulesWithSBR:(BOOL)a3 isContinuity:(BOOL)a4
{
  _BOOL8 v5;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  VCAudioRule *v17;

  v5 = a3;
  v7 = +[VCAudioRuleCollection getForcedPayload](VCAudioRuleCollection, "getForcedPayload");
  if ((_DWORD)v7 != 128)
  {
    v17 = -[VCAudioRule initWithPayload:isSecondary:sbr:samplesPerBlock:]([VCAudioRule alloc], "initWithPayload:isSecondary:sbr:samplesPerBlock:", v7, 0, v5, self->_aacBlockSize);
    -[VCAudioRuleCollection addAudioRule:](self, "addAudioRule:", v17);

    return;
  }
  v8 = +[GKSConnectivitySettings supportsEVSCodec](GKSConnectivitySettings, "supportsEVSCodec");
  v9 = +[GKSConnectivitySettings supportsRedAudio](GKSConnectivitySettings, "supportsRedAudio");
  v10 = v9;
  if (a4)
  {
    if (v8)
    {
      v11 = (void *)objc_msgSend(&unk_1E9EF9B18, "arrayByAddingObject:", &unk_1E9EF3BC0);
      if (!v10)
        goto LABEL_14;
    }
    else
    {
      v11 = &unk_1E9EF9B18;
      if (!v9)
        goto LABEL_14;
    }
  }
  else
  {
    if (v8)
      v11 = (void *)objc_msgSend(&unk_1E9EF9B00, "arrayByAddingObject:", &unk_1E9EF3BC0);
    else
      v11 = &unk_1E9EF9B00;
    if (!v10)
      goto LABEL_14;
  }
  v11 = (void *)objc_msgSend(v11, "arrayByAddingObject:", &unk_1E9EF3BD8);
LABEL_14:
  v12 = self->_allowAudioSwitching && v8;
  if (self->_allowAudioSwitching)
    v13 = &unk_1E9EF9B30;
  else
    v13 = 0;
  if (v12)
    v13 = (void *)objc_msgSend(&unk_1E9EF9B30, "arrayByAddingObject:", &unk_1E9EF3BC0);
  if (objc_msgSend(v11, "count"))
  {
    v14 = 0;
    v15 = 1;
    do
    {
      -[VCAudioRuleCollection addAudioPayload:isSecondary:sbr:](self, "addAudioPayload:isSecondary:sbr:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", v14), "unsignedIntValue"), objc_msgSend(v13, "containsObject:", objc_msgSend(v11, "objectAtIndexedSubscript:", v14)), v5);
      v14 = v15;
    }
    while (objc_msgSend(v11, "count") > (unint64_t)v15++);
  }
}

+ (int)getForcedPayload
{
  unsigned int v2;
  int v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = -[VCDefaults forceAudioPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPayload");
  v3 = v2;
  if (v2 - 97 <= 0x1F)
  {
    if (((1 << (v2 - 97)) & 0x3418B93) != 0)
    {
LABEL_8:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315906;
          v11 = v5;
          v12 = 2080;
          v13 = "+[VCAudioRuleCollection getForcedPayload]";
          v14 = 1024;
          v15 = 225;
          v16 = 1024;
          v17 = v3;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing audio payload: %d", (uint8_t *)&v10, 0x22u);
        }
      }
      return v3;
    }
    if (v2 == 128)
      return v3;
  }
  if (v2 <= 0xD && ((1 << v2) & 0x2201) != 0)
    goto LABEL_8;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v7;
      v12 = 2080;
      v13 = "+[VCAudioRuleCollection getForcedPayload]";
      v14 = 1024;
      v15 = 230;
      v16 = 1024;
      v17 = v3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid payload (%d) for forceAudioPayload. Forcing PureVoice.", (uint8_t *)&v10, 0x22u);
    }
  }
  return 128;
}

- (void)setRules:(id)a3
{
  if (self->_rules != a3)
  {
    -[VCAudioRuleCollection clearAudioRules](self, "clearAudioRules");
    -[VCAudioRuleCollection addAudioRules:](self, "addAudioRules:", a3);
  }
}

- (void)addAudioRule:(id)a3
{
  -[NSMutableArray addObject:](self->_rules, "addObject:");
  if (objc_msgSend(a3, "isSecondary"))
    -[NSMutableArray addObject:](self->_secondaryPayloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "payload")));
}

- (void)addAudioRules:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        -[VCAudioRuleCollection addAudioRule:](self, "addAudioRule:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (void)clearAudioRules
{
  -[NSMutableArray removeAllObjects](self->_rules, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_secondaryPayloads, "removeAllObjects");
}

- (BOOL)isPayloadSupported:(int)a3
{
  NSMutableArray *rules;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  rules = self->_rules;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rules, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(rules);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "payload") == a3)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rules, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  int allowAudioRecording;
  int allowAudioSwitching;
  uint64_t v8;
  NSMutableArray *rules;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    allowAudioRecording = self->_allowAudioRecording;
    if (allowAudioRecording == objc_msgSend(a3, "allowAudioRecording")
      && (allowAudioSwitching = self->_allowAudioSwitching,
          allowAudioSwitching == objc_msgSend(a3, "allowAudioSwitching"))
      && (v8 = -[NSMutableArray count](self->_rules, "count"), v8 == objc_msgSend((id)objc_msgSend(a3, "rules"), "count")))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      rules = self->_rules;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rules, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
LABEL_7:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(rules);
          v5 = objc_msgSend((id)objc_msgSend(a3, "rules"), "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
          if (!v5)
            break;
          if (v11 == ++v13)
          {
            v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rules, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
            LOBYTE(v5) = 1;
            if (v11)
              goto LABEL_7;
            return v5;
          }
        }
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VCAudioRuleCollection *v4;
  NSMutableArray *rules;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = -[VCAudioRuleCollection init](+[VCAudioRuleCollection allocWithZone:](VCAudioRuleCollection, "allocWithZone:", a3), "init");
  -[VCAudioRuleCollection setAllowAudioRecording:](v4, "setAllowAudioRecording:", self->_allowAudioRecording);
  -[VCAudioRuleCollection setAllowAudioSwitching:](v4, "setAllowAudioSwitching:", self->_allowAudioSwitching);
  -[VCAudioRuleCollection setAacBlockSize:](v4, "setAacBlockSize:", self->_aacBlockSize);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  rules = self->_rules;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rules, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(rules);
        -[VCAudioRuleCollection addAudioRule:](v4, "addAudioRule:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rules, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v7);
  }
  return v4;
}

- (NSArray)rules
{
  return &self->_rules->super;
}

- (NSArray)secondaryPayloads
{
  return &self->_secondaryPayloads->super;
}

- (BOOL)allowAudioRecording
{
  return self->_allowAudioRecording;
}

- (void)setAllowAudioRecording:(BOOL)a3
{
  self->_allowAudioRecording = a3;
}

- (BOOL)allowAudioSwitching
{
  return self->_allowAudioSwitching;
}

- (void)setAllowAudioSwitching:(BOOL)a3
{
  self->_allowAudioSwitching = a3;
}

- (int)aacBlockSize
{
  return self->_aacBlockSize;
}

- (void)setAacBlockSize:(int)a3
{
  self->_aacBlockSize = a3;
}

- (BOOL)isHigherAudioREDCutoverU1Enabled
{
  return self->_isHigherAudioREDCutoverU1Enabled;
}

- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3
{
  self->_isHigherAudioREDCutoverU1Enabled = a3;
}

@end
