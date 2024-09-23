@implementation VCMediaNegotiatorAudioConfiguration

- (VCMediaNegotiatorAudioConfiguration)initWithAllowAudioSwitching:(BOOL)a3 allowAudioRecording:(BOOL)a4 useSBR:(BOOL)a5 ssrc:(unsigned int)a6 audioUnitNumber:(unsigned int)a7
{
  return -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:](self, "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:", a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, 0);
}

- (VCMediaNegotiatorAudioConfiguration)initWithAllowAudioSwitching:(BOOL)a3 allowAudioRecording:(BOOL)a4 useSBR:(BOOL)a5 ssrc:(unsigned int)a6 audioUnitNumber:(unsigned int)a7 audioRuleCollection:(id)a8
{
  uint64_t v10;
  VCMediaNegotiatorAudioConfiguration *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  id obj;
  objc_super v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v10 = *(_QWORD *)&a6;
  v30 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VCMediaNegotiatorAudioConfiguration;
  v14 = -[VCMediaNegotiatorAudioConfiguration init](&v24, sel_init);
  if (v14)
  {
    v14->_audioPayloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v14->_secondaryPayloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[VCMediaNegotiatorCommonConfiguration setSsrc:](v14, "setSsrc:", v10);
    v14->_allowAudioSwitching = a3;
    v14->_allowAudioRecording = a4;
    v14->_useSBR = a5;
    v14->_audioUnitNumber = a7;
    if (a8)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = (id)objc_msgSend(a8, "rules");
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            v20 = objc_msgSend(v19, "payload");
            v21 = (void *)objc_msgSend(a8, "secondaryPayloads");
            -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v14, "addAudioPayload:isSecondary:", v20, objc_msgSend(v21, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v19, "payload"))));
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        }
        while (v16);
      }
    }
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorAudioConfiguration;
  -[VCMediaNegotiatorAudioConfiguration dealloc](&v3, sel_dealloc);
}

- (void)addAudioPayload:(int)a3 isSecondary:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (+[VCMediaNegotiationBlobAudioSettings isAudioPayloadSupported:](VCMediaNegotiationBlobAudioSettings, "isAudioPayloadSupported:"))
  {
    -[NSMutableSet addObject:](self->_audioPayloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5));
    if (v4)
      -[NSMutableSet addObject:](self->_secondaryPayloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = v7;
      v11 = 2080;
      v12 = "-[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:]";
      v13 = 1024;
      v14 = 73;
      v15 = 1024;
      v16 = v5;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Payload cannot be negotiated: %d", (uint8_t *)&v9, 0x22u);
    }
  }
}

- (BOOL)isSecondaryPayload:(int)a3
{
  return -[NSMutableSet containsObject:](self->_secondaryPayloads, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSMutableSet *audioPayloads;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:", self->_allowAudioSwitching, self->_allowAudioRecording, self->_useSBR, -[VCMediaNegotiatorCommonConfiguration ssrc](self, "ssrc"), self->_audioUnitNumber);
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    audioPayloads = self->_audioPayloads;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(audioPayloads);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "intValue");
          objc_msgSend(v4, "addAudioPayload:isSecondary:", v10, -[VCMediaNegotiatorAudioConfiguration isSecondaryPayload:](self, "isSecondaryPayload:", v10));
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v7);
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int allowAudioSwitching;
  int allowAudioRecording;
  int useSBR;
  unsigned int audioUnitNumber;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  objc_super v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)VCMediaNegotiatorAudioConfiguration;
  v5 = -[VCMediaNegotiatorCommonConfiguration isEqual:](&v20, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (allowAudioSwitching = self->_allowAudioSwitching,
          allowAudioSwitching == objc_msgSend(a3, "allowAudioSwitching"))
      && (allowAudioRecording = self->_allowAudioRecording,
          allowAudioRecording == objc_msgSend(a3, "allowAudioRecording"))
      && (useSBR = self->_useSBR, useSBR == objc_msgSend(a3, "useSBR"))
      && (audioUnitNumber = self->_audioUnitNumber, audioUnitNumber == objc_msgSend(a3, "audioUnitNumber"))
      && (v10 = -[NSMutableSet count](self->_audioPayloads, "count"),
          v10 == objc_msgSend((id)objc_msgSend(a3, "audioPayloads"), "count")))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = (void *)objc_msgSend(a3, "audioPayloads");
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
LABEL_10:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
          v17 = objc_msgSend(v16, "intValue");
          v5 = -[NSMutableSet containsObject:](self->_audioPayloads, "containsObject:", v16);
          if (!v5)
            break;
          v18 = -[VCMediaNegotiatorAudioConfiguration isSecondaryPayload:](self, "isSecondaryPayload:", v17);
          if (v18 != objc_msgSend(a3, "isSecondaryPayload:", v17))
            goto LABEL_18;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
            LOBYTE(v5) = 1;
            if (v13)
              goto LABEL_10;
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
LABEL_18:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)allowAudioSwitching
{
  return self->_allowAudioSwitching;
}

- (void)setAllowAudioSwitching:(BOOL)a3
{
  self->_allowAudioSwitching = a3;
}

- (BOOL)allowAudioRecording
{
  return self->_allowAudioRecording;
}

- (void)setAllowAudioRecording:(BOOL)a3
{
  self->_allowAudioRecording = a3;
}

- (BOOL)useSBR
{
  return self->_useSBR;
}

- (void)setUseSBR:(BOOL)a3
{
  self->_useSBR = a3;
}

- (unsigned)audioUnitNumber
{
  return self->_audioUnitNumber;
}

- (void)setAudioUnitNumber:(unsigned int)a3
{
  self->_audioUnitNumber = a3;
}

- (NSSet)audioPayloads
{
  return &self->_audioPayloads->super;
}

@end
