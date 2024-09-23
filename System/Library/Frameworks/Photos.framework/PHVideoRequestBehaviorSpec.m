@implementation PHVideoRequestBehaviorSpec

- (id)shortDescription
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t version;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  _BOOL4 v13;
  const __CFAllocator *v14;
  __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  CMTimeRange range;

  if (self->_networkAccessAllowed)
    v3 = CFSTR("Y");
  else
    v3 = CFSTR("N");
  v22 = v3;
  v23 = (void *)MEMORY[0x1E0CB3940];
  if (self->_streamingAllowed)
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  v21 = v4;
  _PHStreamingVideoIntentName(self->_streamingVideoIntent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PHDownloadIntentName(self->_downloadIntent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _PHDownloadPriorityName(self->_downloadPriority);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  version = self->_version;
  switch(version)
  {
    case 8:
      v9 = CFSTR("penult");
      goto LABEL_13;
    case 1:
      v9 = CFSTR("orig");
      goto LABEL_13;
    case 0:
      v9 = CFSTR("curr");
LABEL_13:
      v20 = v9;
      goto LABEL_15;
  }
  v20 = 0;
LABEL_15:
  if (self->_restrictToPlayableOnCurrentDevice)
    v10 = CFSTR("Y");
  else
    v10 = CFSTR("N");
  v11 = CFSTR("auto");
  switch(self->_deliveryMode)
  {
    case 0:
      break;
    case 1:
      v11 = CFSTR("high");
      break;
    case 2:
      if (self->_mediumHighQualityAllowed)
        v12 = CFSTR("med-hi");
      else
        v12 = CFSTR("med");
      v11 = v12;
      break;
    case 3:
      v11 = CFSTR("fast");
      break;
    case 4:
      v11 = CFSTR("large");
      break;
    default:
      v11 = CFSTR("unknown");
      break;
  }
  v13 = -[PHVideoRequestBehaviorSpec hasValidTimeRange](self, "hasValidTimeRange");
  if (v13)
  {
    v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    -[PHVideoRequestBehaviorSpec timeRange](self, "timeRange");
    v15 = (__CFString *)CMTimeRangeCopyDescription(v14, &range);
  }
  else
  {
    v15 = CFSTR("none");
  }
  if (self->_restrictToStreamable)
    v16 = CFSTR("Y");
  else
    v16 = CFSTR("N");
  if (self->_restrictToEncryptedStream)
    v17 = CFSTR("Y");
  else
    v17 = CFSTR("N");
  objc_msgSend(v23, "stringWithFormat:", CFSTR("net: %@, stream: %@, streamingIntent: %@, downloadIntent: %@, downloadPriority: %@, ver: %@, playable: %@, delivery: %@, timeRange: %@ streamOnly: %@ encryptedOnly: %@"), v22, v21, v5, v6, v7, v20, v10, v11, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)

  return v18;
}

- (int64_t)videoDeliveryMode
{
  unint64_t deliveryMode;

  deliveryMode = self->_deliveryMode;
  if (deliveryMode > 4)
    return 2;
  else
    return qword_19944AC18[deliveryMode];
}

- (int64_t)videoVersion
{
  int64_t version;

  version = self->_version;
  if (version == 8)
    return 2;
  else
    return version == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHVideoRequestBehaviorSpec *v4;
  _OWORD v6[6];

  v4 = objc_alloc_init(PHVideoRequestBehaviorSpec);
  -[PHVideoRequestBehaviorSpec setDeliveryMode:](v4, "setDeliveryMode:", -[PHVideoRequestBehaviorSpec deliveryMode](self, "deliveryMode"));
  -[PHVideoRequestBehaviorSpec setVersion:](v4, "setVersion:", -[PHVideoRequestBehaviorSpec version](self, "version"));
  -[PHVideoRequestBehaviorSpec setNetworkAccessAllowed:](v4, "setNetworkAccessAllowed:", -[PHVideoRequestBehaviorSpec isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  -[PHVideoRequestBehaviorSpec setStreamingAllowed:](v4, "setStreamingAllowed:", -[PHVideoRequestBehaviorSpec isStreamingAllowed](self, "isStreamingAllowed"));
  -[PHVideoRequestBehaviorSpec setStreamingVideoIntent:](v4, "setStreamingVideoIntent:", -[PHVideoRequestBehaviorSpec streamingVideoIntent](self, "streamingVideoIntent"));
  -[PHVideoRequestBehaviorSpec setVideoComplementAllowed:](v4, "setVideoComplementAllowed:", -[PHVideoRequestBehaviorSpec isVideoComplementAllowed](self, "isVideoComplementAllowed"));
  -[PHVideoRequestBehaviorSpec setMediumHighQualityAllowed:](v4, "setMediumHighQualityAllowed:", -[PHVideoRequestBehaviorSpec isMediumHighQualityAllowed](self, "isMediumHighQualityAllowed"));
  -[PHVideoRequestBehaviorSpec setRestrictToPlayableOnCurrentDevice:](v4, "setRestrictToPlayableOnCurrentDevice:", -[PHVideoRequestBehaviorSpec restrictToPlayableOnCurrentDevice](self, "restrictToPlayableOnCurrentDevice"));
  -[PHVideoRequestBehaviorSpec setRestrictToStreamable:](v4, "setRestrictToStreamable:", -[PHVideoRequestBehaviorSpec restrictToStreamable](self, "restrictToStreamable"));
  -[PHVideoRequestBehaviorSpec setRestrictToEncryptedStream:](v4, "setRestrictToEncryptedStream:", -[PHVideoRequestBehaviorSpec restrictToEncryptedStream](self, "restrictToEncryptedStream"));
  -[PHVideoRequestBehaviorSpec setDownloadIntent:](v4, "setDownloadIntent:", -[PHVideoRequestBehaviorSpec downloadIntent](self, "downloadIntent"));
  -[PHVideoRequestBehaviorSpec setDownloadPriority:](v4, "setDownloadPriority:", -[PHVideoRequestBehaviorSpec downloadPriority](self, "downloadPriority"));
  -[PHVideoRequestBehaviorSpec timeRange](self, "timeRange");
  v6[0] = v6[3];
  v6[1] = v6[4];
  v6[2] = v6[5];
  -[PHVideoRequestBehaviorSpec setTimeRange:](v4, "setTimeRange:", v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t deliveryMode;
  id v5;
  __int128 v6;
  _OWORD v7[3];

  deliveryMode = self->_deliveryMode;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", deliveryMode, CFSTR("deliveryMode"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_networkAccessAllowed, CFSTR("networkAccessAllowed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_streamingAllowed, CFSTR("streamingAllowed"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_streamingVideoIntent, CFSTR("streamingVideoIntent"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_videoComplementAllowed, CFSTR("videoComplementAllowed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_mediumHighQualityAllowed, CFSTR("mediumHighQualityAllowed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_restrictToPlayableOnCurrentDevice, CFSTR("restrictToPlayableOnCurrentDevice"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_restrictToStreamable, CFSTR("restrictToStreamable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_restrictToEncryptedStream, CFSTR("restrictToEncryptedStream"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_downloadIntent, CFSTR("downloadIntent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_downloadPriority, CFSTR("downloadPriority"));
  v6 = *(_OWORD *)&self->_timeRange.start.epoch;
  v7[0] = *(_OWORD *)&self->_timeRange.start.value;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  objc_msgSend(v5, "encodeCMTimeRange:forKey:", v7, CFSTR("timeRange"));

}

- (PHVideoRequestBehaviorSpec)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHVideoRequestBehaviorSpec;
  v5 = -[PHVideoRequestBehaviorSpec init](&v10, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 2) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deliveryMode"));
    *((_QWORD *)v5 + 3) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("version"));
    v5[8] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("networkAccessAllowed"));
    v5[9] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("streamingAllowed"));
    *((_QWORD *)v5 + 4) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamingVideoIntent"));
    v5[10] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("videoComplementAllowed"));
    v5[11] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mediumHighQualityAllowed"));
    v5[12] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restrictToPlayableOnCurrentDevice"));
    v5[13] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restrictToStreamable"));
    v5[14] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restrictToEncryptedStream"));
    *((_QWORD *)v5 + 5) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadIntent"));
    *((_QWORD *)v5 + 6) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadPriority"));
    if (v4)
    {
      objc_msgSend(v4, "decodeCMTimeRangeForKey:", CFSTR("timeRange"));
    }
    else
    {
      v8 = 0u;
      v9 = 0u;
      v7 = 0u;
    }
    *(_OWORD *)(v5 + 56) = v7;
    *(_OWORD *)(v5 + 72) = v8;
    *(_OWORD *)(v5 + 88) = v9;
  }

  return (PHVideoRequestBehaviorSpec *)v5;
}

- (BOOL)hasValidTimeRange
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  -[PHVideoRequestBehaviorSpec timeRange](self, "timeRange");
  if ((v7 & 1) == 0)
    return 0;
  -[PHVideoRequestBehaviorSpec timeRange](self, "timeRange");
  if ((v6 & 1) == 0)
    return 0;
  -[PHVideoRequestBehaviorSpec timeRange](self, "timeRange");
  if (v5)
    return 0;
  -[PHVideoRequestBehaviorSpec timeRange](self, "timeRange");
  return v4 >= 0;
}

- (BOOL)streamingIntentAllowsFallbackToDownload
{
  return (unint64_t)(self->_streamingVideoIntent - 7) < 0xFFFFFFFFFFFFFFFBLL;
}

- (BOOL)isExplicitUserAction
{
  return (self->_downloadIntent < 0xDuLL) & (0x238u >> self->_downloadIntent);
}

- (int64_t)deliveryMode
{
  return self->_deliveryMode;
}

- (void)setDeliveryMode:(int64_t)a3
{
  self->_deliveryMode = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (BOOL)isStreamingAllowed
{
  return self->_streamingAllowed;
}

- (void)setStreamingAllowed:(BOOL)a3
{
  self->_streamingAllowed = a3;
}

- (int64_t)streamingVideoIntent
{
  return self->_streamingVideoIntent;
}

- (void)setStreamingVideoIntent:(int64_t)a3
{
  self->_streamingVideoIntent = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- ($C628252E21E0084D991546AFB91829E6)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (BOOL)isVideoComplementAllowed
{
  return self->_videoComplementAllowed;
}

- (void)setVideoComplementAllowed:(BOOL)a3
{
  self->_videoComplementAllowed = a3;
}

- (BOOL)isMediumHighQualityAllowed
{
  return self->_mediumHighQualityAllowed;
}

- (void)setMediumHighQualityAllowed:(BOOL)a3
{
  self->_mediumHighQualityAllowed = a3;
}

- (BOOL)restrictToPlayableOnCurrentDevice
{
  return self->_restrictToPlayableOnCurrentDevice;
}

- (void)setRestrictToPlayableOnCurrentDevice:(BOOL)a3
{
  self->_restrictToPlayableOnCurrentDevice = a3;
}

- (BOOL)restrictToStreamable
{
  return self->_restrictToStreamable;
}

- (void)setRestrictToStreamable:(BOOL)a3
{
  self->_restrictToStreamable = a3;
}

- (BOOL)restrictToEncryptedStream
{
  return self->_restrictToEncryptedStream;
}

- (void)setRestrictToEncryptedStream:(BOOL)a3
{
  self->_restrictToEncryptedStream = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
