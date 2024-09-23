@implementation MRNowPlayingAudioFormatContentInfo

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRNowPlayingAudioFormatContentInfo protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (_MRMRNowPlayingAudioFormatContentInfoProtobuf)protobuf
{
  _MRMRNowPlayingAudioFormatContentInfoProtobuf *v3;
  NSNumber *audioSessionID;
  NSNumber *audioFormat;
  NSNumber *channelCount;

  v3 = objc_alloc_init(_MRMRNowPlayingAudioFormatContentInfoProtobuf);
  -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setBundleID:](v3, "setBundleID:", self->_bundleID);
  audioSessionID = self->_audioSessionID;
  if (audioSessionID)
    -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setAudioSessionID:](v3, "setAudioSessionID:", -[NSNumber unsignedIntValue](audioSessionID, "unsignedIntValue"));
  audioFormat = self->_audioFormat;
  if (audioFormat)
    -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setAudioFormat:](v3, "setAudioFormat:", -[NSNumber unsignedIntValue](audioFormat, "unsignedIntValue"));
  channelCount = self->_channelCount;
  if (channelCount)
    -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setChannelCount:](v3, "setChannelCount:", -[NSNumber unsignedIntValue](channelCount, "unsignedIntValue"));
  -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setBestAvailableContent:](v3, "setBestAvailableContent:", self->_bestAvailableContent);
  -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setEligibleForSpatialization:](v3, "setEligibleForSpatialization:", self->_eligibleForSpatialization);
  -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setSpatialized:](v3, "setSpatialized:", self->_spatialized);
  -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setIntendedSpatialExperience:](v3, "setIntendedSpatialExperience:", self->_intendedSpatialExperience);
  -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setResolvedSpatialExperience:](v3, "setResolvedSpatialExperience:", self->_resolvedSpatialExperience);
  -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setPid:](v3, "setPid:", self->_pid);
  -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setRenderingMode:](v3, "setRenderingMode:", self->_renderingMode);
  return v3;
}

- (BOOL)isMultichannel
{
  return -[NSNumber unsignedIntValue](self->_channelCount, "unsignedIntValue") > 2;
}

- (MRNowPlayingAudioFormatContentInfo)initWithData:(id)a3
{
  id v4;
  _MRMRNowPlayingAudioFormatContentInfoProtobuf *v5;
  MRNowPlayingAudioFormatContentInfo *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRMRNowPlayingAudioFormatContentInfoProtobuf initWithData:]([_MRMRNowPlayingAudioFormatContentInfoProtobuf alloc], "initWithData:", v4);

    self = -[MRNowPlayingAudioFormatContentInfo initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRNowPlayingAudioFormatContentInfo)initWithProtobuf:(id)a3
{
  id v4;
  MRNowPlayingAudioFormatContentInfo *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSNumber *audioSessionID;
  uint64_t v10;
  NSNumber *audioFormat;
  uint64_t v12;
  NSNumber *channelCount;
  uint64_t v14;
  NSString *bestAvailableContent;
  MRNowPlayingAudioFormatContentInfo *v16;
  objc_super v18;

  v4 = a3;
  if (v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)MRNowPlayingAudioFormatContentInfo;
    v5 = -[MRNowPlayingAudioFormatContentInfo init](&v18, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "bundleID");
      v6 = objc_claimAutoreleasedReturnValue();
      bundleID = v5->_bundleID;
      v5->_bundleID = (NSString *)v6;

      if (objc_msgSend(v4, "hasAudioSessionID"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "audioSessionID"));
        v8 = objc_claimAutoreleasedReturnValue();
        audioSessionID = v5->_audioSessionID;
        v5->_audioSessionID = (NSNumber *)v8;

      }
      if (objc_msgSend(v4, "hasAudioFormat"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "audioFormat"));
        v10 = objc_claimAutoreleasedReturnValue();
        audioFormat = v5->_audioFormat;
        v5->_audioFormat = (NSNumber *)v10;

      }
      if (objc_msgSend(v4, "hasChannelCount"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "channelCount"));
        v12 = objc_claimAutoreleasedReturnValue();
        channelCount = v5->_channelCount;
        v5->_channelCount = (NSNumber *)v12;

      }
      objc_msgSend(v4, "bestAvailableContent");
      v14 = objc_claimAutoreleasedReturnValue();
      bestAvailableContent = v5->_bestAvailableContent;
      v5->_bestAvailableContent = (NSString *)v14;

      v5->_eligibleForSpatialization = objc_msgSend(v4, "eligibleForSpatialization");
      v5->_spatialized = objc_msgSend(v4, "spatialized");
      v5->_intendedSpatialExperience = objc_msgSend(v4, "intendedSpatialExperience");
      v5->_resolvedSpatialExperience = objc_msgSend(v4, "resolvedSpatialExperience");
      v5->_pid = objc_msgSend(v4, "pid");
      v5->_renderingMode = objc_msgSend(v4, "renderingMode");
    }
    self = v5;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)bestAvailableAudioFormatDescription
{
  int64_t v3;
  __CFString *v4;
  void *v5;

  v3 = -[MRNowPlayingAudioFormatContentInfo bestAvailableAudioFormat](self, "bestAvailableAudioFormat");
  if (v3 == 1)
  {
    v4 = CFSTR("MULTICHANNEL_AVAILABLE");
  }
  else
  {
    if (v3 != 2)
    {
      -[MRNowPlayingAudioFormatContentInfo audioFormatDescription](self, "audioFormatDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v5;
    }
    v4 = CFSTR("SPATIAL_ATMOS_AVAILABLE");
  }
  MRLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSNumber *audioSessionID;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  audioSessionID = self->_audioSessionID;
  -[MRNowPlayingAudioFormatContentInfo audioFormatDescription](self, "audioFormatDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("Yes");
  if (self->_eligibleForSpatialization)
    v9 = CFSTR("Yes");
  else
    v9 = CFSTR("No");
  if (!self->_spatialized)
    v8 = CFSTR("No");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p | session id: %@ | audio format: %@ - %@ | channel #: %@ | available: %@ | eligible: %@ | active: %@ | intended :%ld | resolved :%ld | pid: %i | bundleID: %@>"), v4, self, audioSessionID, v6, *(_OWORD *)&self->_audioFormat, self->_bestAvailableContent, v9, v8, self->_intendedSpatialExperience, self->_resolvedSpatialExperience, self->_pid, self->_bundleID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)audioFormatDescription
{
  int v3;
  void *v4;
  int v6;
  id v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  DWORD2(v8) = -[NSNumber unsignedIntValue](self->_audioFormat, "unsignedIntValue");
  HIDWORD(v9) = -[NSNumber unsignedIntValue](self->_channelCount, "unsignedIntValue");
  v7 = 0;
  v6 = 8;
  v3 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkAudioFormatGetProperty[0])(1634100078, 40, (uint64_t)&v8, (uint64_t)&v6, (uint64_t)&v7);
  v4 = 0;
  if (!v3)
    v4 = (void *)objc_msgSend(v7, "copy");
  return (NSString *)v4;
}

- (int64_t)bestAvailableAudioFormat
{
  NSString *bestAvailableContent;
  void *v4;
  NSString *v6;
  void *v7;

  bestAvailableContent = self->_bestAvailableContent;
  getkMXSession_SourceFormatInfoKey_BestAvailableContentType_Multichannel[0]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(bestAvailableContent) = -[NSString isEqualToString:](bestAvailableContent, "isEqualToString:", v4);

  if ((bestAvailableContent & 1) != 0)
    return 1;
  v6 = self->_bestAvailableContent;
  getkMXSession_SourceFormatInfoKey_BestAvailableContentType_Atmos[0]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

  if ((_DWORD)v6)
    return 2;
  else
    return 0;
}

- (BOOL)isEqual:(id)a3
{
  MRNowPlayingAudioFormatContentInfo *v4;
  MRNowPlayingAudioFormatContentInfo *v5;
  int v6;
  int pid;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  BOOL v23;

  v4 = (MRNowPlayingAudioFormatContentInfo *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MRNowPlayingAudioFormatContentInfo pid](v5, "pid");
      pid = self->_pid;
      -[MRNowPlayingAudioFormatContentInfo bundleID](v5, "bundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", self->_bundleID);
      if (v6 == pid)
        v10 = v9;
      else
        v10 = 0;

      -[MRNowPlayingAudioFormatContentInfo audioSessionID](v5, "audioSessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntValue");
      if (v12 != -[NSNumber unsignedIntValue](self->_audioSessionID, "unsignedIntValue"))
        v10 = 0;

      -[MRNowPlayingAudioFormatContentInfo audioFormat](v5, "audioFormat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntValue");
      if (v14 != -[NSNumber unsignedIntValue](self->_audioFormat, "unsignedIntValue"))
        v10 = 0;

      -[MRNowPlayingAudioFormatContentInfo channelCount](v5, "channelCount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntValue");
      if (v16 == -[NSNumber unsignedIntValue](self->_channelCount, "unsignedIntValue"))
        v17 = v10;
      else
        v17 = 0;

      -[MRNowPlayingAudioFormatContentInfo bestAvailableContent](v5, "bestAvailableContent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v17 & objc_msgSend(v18, "isEqualToString:", self->_bestAvailableContent);

      if (self->_eligibleForSpatialization == -[MRNowPlayingAudioFormatContentInfo isEligibleForSpatialization](v5, "isEligibleForSpatialization"))v20 = v19;
      else
        v20 = 0;
      if (self->_spatialized != -[MRNowPlayingAudioFormatContentInfo isSpatialized](v5, "isSpatialized"))
        v20 = 0;
      if (-[MRNowPlayingAudioFormatContentInfo intendedSpatialExperience](v5, "intendedSpatialExperience") != self->_intendedSpatialExperience)
        v20 = 0;
      v21 = -[MRNowPlayingAudioFormatContentInfo resolvedSpatialExperience](v5, "resolvedSpatialExperience") == self->_resolvedSpatialExperience
         && v20;
      v22 = -[MRNowPlayingAudioFormatContentInfo renderingMode](v5, "renderingMode");

      v23 = v22 == self->_renderingMode && v21;
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (BOOL)isEligibleForSpatialization
{
  return self->_eligibleForSpatialization;
}

- (NSString)bundleID
{
  NSString *bundleID;
  NSString *v4;
  NSString *v5;

  bundleID = self->_bundleID;
  if (!bundleID)
  {
    BSBundleIDForPID();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bundleID;
    self->_bundleID = v4;

    bundleID = self->_bundleID;
  }
  return bundleID;
}

- (BOOL)isSpatialized
{
  return self->_spatialized;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (int64_t)resolvedSpatialExperience
{
  return self->_resolvedSpatialExperience;
}

- (int)pid
{
  return self->_pid;
}

- (int64_t)intendedSpatialExperience
{
  return self->_intendedSpatialExperience;
}

- (NSNumber)channelCount
{
  return self->_channelCount;
}

- (NSString)bestAvailableContent
{
  return self->_bestAvailableContent;
}

- (NSNumber)audioSessionID
{
  return self->_audioSessionID;
}

- (NSNumber)audioFormat
{
  return self->_audioFormat;
}

- (void)setRenderingMode:(int64_t)a3
{
  self->_renderingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestAvailableContent, 0);
  objc_storeStrong((id *)&self->_channelCount, 0);
  objc_storeStrong((id *)&self->_audioFormat, 0);
  objc_storeStrong((id *)&self->_audioSessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (MRNowPlayingAudioFormatContentInfo)initWithPid:(int)a3 bundleID:(id)a4 audioSessionID:(id)a5 audioFormat:(id)a6 channelCount:(id)a7 bestAvailableContent:(id)a8 isEligibleForSpatialization:(id)a9 isSpatialized:(id)a10
{
  id v17;
  id v18;
  id v19;
  MRNowPlayingAudioFormatContentInfo *v20;
  MRNowPlayingAudioFormatContentInfo *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)MRNowPlayingAudioFormatContentInfo;
  v20 = -[MRNowPlayingAudioFormatContentInfo init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_pid = a3;
    objc_storeStrong((id *)&v20->_bundleID, a4);
    objc_storeStrong((id *)&v21->_audioSessionID, a5);
    objc_storeStrong((id *)&v21->_audioFormat, a6);
    objc_storeStrong((id *)&v21->_channelCount, a7);
    objc_storeStrong((id *)&v21->_bestAvailableContent, a8);
    v21->_spatialized = objc_msgSend(v19, "BOOLValue", v23, v24, v25, v26);
    v21->_eligibleForSpatialization = objc_msgSend(v18, "BOOLValue");
  }

  return v21;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setIntendedSpatialExperience:(int64_t)a3
{
  self->_intendedSpatialExperience = a3;
}

- (void)setResolvedSpatialExperience:(int64_t)a3
{
  self->_resolvedSpatialExperience = a3;
}

@end
