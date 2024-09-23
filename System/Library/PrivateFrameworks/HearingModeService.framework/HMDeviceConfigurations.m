@implementation HMDeviceConfigurations

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMDeviceConfigurations)init
{
  HMDeviceConfigurations *v2;
  HMDeviceConfigurations *v3;
  HMDeviceConfigurations *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDeviceConfigurations;
  v2 = -[HMDeviceConfigurations init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (HMDeviceConfigurations)initWithCoder:(id)a3
{
  id v4;
  HMDeviceConfigurations *v5;
  uint64_t v6;
  NSArray *mediaLossArrayLeft;
  uint64_t v8;
  NSArray *mediaLossArrayRight;
  uint64_t v10;
  NSArray *voiceLossArrayLeft;
  uint64_t v12;
  NSArray *voiceLossArrayRight;
  HMDeviceConfigurations *v14;

  v4 = a3;
  v5 = -[HMDeviceConfigurations init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_allowListeningModeOff = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_enablePMEMedia = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_enablePMEVoice = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_enrollPMEVoice = 0;
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    HMEarLossDataToArray(v5->_mediaLossDataLeft);
    v6 = objc_claimAutoreleasedReturnValue();
    mediaLossArrayLeft = v5->_mediaLossArrayLeft;
    v5->_mediaLossArrayLeft = (NSArray *)v6;

    HMEarLossDataToArray(v5->_mediaLossDataRight);
    v8 = objc_claimAutoreleasedReturnValue();
    mediaLossArrayRight = v5->_mediaLossArrayRight;
    v5->_mediaLossArrayRight = (NSArray *)v8;

    HMEarLossDataToArray(v5->_voiceLossDataLeft);
    v10 = objc_claimAutoreleasedReturnValue();
    voiceLossArrayLeft = v5->_voiceLossArrayLeft;
    v5->_voiceLossArrayLeft = (NSArray *)v10;

    HMEarLossDataToArray(v5->_voiceLossDataRight);
    v12 = objc_claimAutoreleasedReturnValue();
    voiceLossArrayRight = v5->_voiceLossArrayRight;
    v5->_voiceLossArrayRight = (NSArray *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *v4;
  NSData *mediaLossDataLeft;
  NSData *v6;
  NSData *mediaLossDataRight;
  NSData *v8;
  NSData *voiceLossDataLeft;
  NSData *v10;
  NSData *voiceLossDataRight;
  void *v12;
  NSData *v13;
  NSData *v14;
  NSData *v15;
  NSData *v16;
  id v17;

  v17 = a3;
  HMEarLossArrayToData(self->_mediaLossArrayLeft);
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  mediaLossDataLeft = self->_mediaLossDataLeft;
  self->_mediaLossDataLeft = v4;

  HMEarLossArrayToData(self->_mediaLossArrayRight);
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  mediaLossDataRight = self->_mediaLossDataRight;
  self->_mediaLossDataRight = v6;

  HMEarLossArrayToData(self->_voiceLossArrayLeft);
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  voiceLossDataLeft = self->_voiceLossDataLeft;
  self->_voiceLossDataLeft = v8;

  HMEarLossArrayToData(self->_voiceLossArrayRight);
  v10 = (NSData *)objc_claimAutoreleasedReturnValue();
  voiceLossDataRight = self->_voiceLossDataRight;
  self->_voiceLossDataRight = v10;

  if (self->_allowListeningModeOff)
    objc_msgSend(v17, "encodeInteger:forKey:");
  if (self->_enablePMEMedia)
    objc_msgSend(v17, "encodeInteger:forKey:");
  v12 = v17;
  if (self->_enablePMEVoice)
  {
    objc_msgSend(v17, "encodeInteger:forKey:");
    v12 = v17;
  }
  if (self->_enrollPMEVoice)
  {
    objc_msgSend(v17, "encodeInteger:forKey:");
    v12 = v17;
  }
  v13 = self->_mediaLossDataLeft;
  if (v13)
  {
    objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("mLDL"));
    v12 = v17;
  }
  v14 = self->_mediaLossDataRight;
  if (v14)
  {
    objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("mLDR"));
    v12 = v17;
  }
  v15 = self->_voiceLossDataLeft;
  if (v15)
  {
    objc_msgSend(v17, "encodeObject:forKey:", v15, CFSTR("vLDL"));
    v12 = v17;
  }
  v16 = self->_voiceLossDataRight;
  if (v16)
  {
    objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("vLDR"));
    v12 = v17;
  }

}

- (id)description
{
  return -[HMDeviceConfigurations descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v5;
  uint64_t allowListeningModeOff;
  const char *v7;
  id v8;
  uint64_t enablePMEMedia;
  const char *v10;
  id v11;
  uint64_t enablePMEVoice;
  const char *v13;
  id v14;
  uint64_t enrollPMEVoice;
  const char *v16;
  id v17;
  NSArray *mediaLossArrayLeft;
  NSArray *v19;
  id v20;
  NSArray *mediaLossArrayRight;
  NSArray *v22;
  id v23;
  NSArray *voiceLossArrayLeft;
  NSArray *v25;
  id v26;
  NSArray *voiceLossArrayRight;
  NSArray *v28;
  id v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  objc_msgSend((id)objc_opt_class(), "description");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v5 = 0;

  allowListeningModeOff = self->_allowListeningModeOff;
  if (self->_allowListeningModeOff)
  {
    if (allowListeningModeOff > 2)
      v7 = "?";
    else
      v7 = off_250EB8338[allowListeningModeOff];
    v32 = (void *)v7;
    NSAppendPrintF_safe();
    v8 = v5;

    v5 = v8;
  }
  enablePMEMedia = self->_enablePMEMedia;
  if (self->_enablePMEMedia)
  {
    if (enablePMEMedia > 2)
      v10 = "?";
    else
      v10 = off_250EB8338[enablePMEMedia];
    v32 = (void *)v10;
    NSAppendPrintF_safe();
    v11 = v5;

    v5 = v11;
  }
  enablePMEVoice = self->_enablePMEVoice;
  if (self->_enablePMEVoice)
  {
    if (enablePMEVoice > 2)
      v13 = "?";
    else
      v13 = off_250EB8338[enablePMEVoice];
    v32 = (void *)v13;
    NSAppendPrintF_safe();
    v14 = v5;

    v5 = v14;
  }
  enrollPMEVoice = self->_enrollPMEVoice;
  if (self->_enrollPMEVoice)
  {
    if (enrollPMEVoice > 2)
      v16 = "?";
    else
      v16 = off_250EB8338[enrollPMEVoice];
    v32 = (void *)v16;
    NSAppendPrintF_safe();
    v17 = v5;

    v5 = v17;
  }
  mediaLossArrayLeft = self->_mediaLossArrayLeft;
  if (mediaLossArrayLeft)
  {
    v19 = mediaLossArrayLeft;
    -[NSArray firstObject](v19, "firstObject", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v20 = v5;

    v5 = v20;
  }
  mediaLossArrayRight = self->_mediaLossArrayRight;
  if (mediaLossArrayRight)
  {
    v22 = mediaLossArrayRight;
    -[NSArray firstObject](v22, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v23 = v5;

    v5 = v23;
  }
  voiceLossArrayLeft = self->_voiceLossArrayLeft;
  if (voiceLossArrayLeft)
  {
    v25 = voiceLossArrayLeft;
    -[NSArray firstObject](v25, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v26 = v5;

    v5 = v26;
  }
  voiceLossArrayRight = self->_voiceLossArrayRight;
  if (voiceLossArrayRight)
  {
    v28 = voiceLossArrayRight;
    -[NSArray firstObject](v28, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v29 = v5;

    v5 = v29;
  }
  if (a3 < 21)
  {
    NSAppendPrintF_safe();
    v30 = v5;

    v5 = v30;
  }
  return v5;
}

- (BOOL)needsUpdateToDeviceManagerForDevice:(id)a3
{
  id v4;
  int allowListeningModeOff;
  BOOL v6;

  v4 = a3;
  if (_os_feature_enabled_impl()
    && self->_allowListeningModeOff
    && (allowListeningModeOff = self->_allowListeningModeOff,
        allowListeningModeOff != objc_msgSend(v4, "listeningModeOffAllowed")))
  {
    if (gLogCategory_HMDeviceConfigurations <= 30
      && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "listeningModeOffAllowed");
      LogPrintF();
    }
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)needsUpdateToPMEConfigurationForDevice:(id)a3
{
  id v4;
  void *v5;
  int enablePMEMedia;
  unsigned int v7;
  const char *v8;
  unint64_t v9;
  const char *v10;
  int enablePMEVoice;
  unsigned int v12;
  const char *v13;
  unint64_t v14;
  const char *v15;
  int enrollPMEVoice;
  NSData *mediaLossDataLeft;
  void *v18;
  NSData *v19;
  NSData *v20;
  NSData *v21;
  char v22;
  NSData *mediaLossDataRight;
  void *v24;
  NSData *v25;
  NSData *v26;
  NSData *v27;
  char v28;
  NSData *voiceLossDataLeft;
  void *v30;
  NSData *v31;
  NSData *v32;
  NSData *v33;
  char v34;
  NSData *voiceLossDataRight;
  void *v36;
  NSData *v37;
  NSData *v38;
  NSData *v39;
  char v40;
  const char *v42;
  const char *v43;

  v4 = a3;
  v5 = v4;
  enablePMEMedia = self->_enablePMEMedia;
  if (self->_enablePMEMedia)
  {
    if (enablePMEMedia == objc_msgSend(v4, "pmeMediaEnabled"))
    {
      LOBYTE(enablePMEMedia) = 0;
    }
    else
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        v7 = objc_msgSend(v5, "pmeMediaEnabled");
        if (v7 > 2)
          v8 = "?";
        else
          v8 = off_250EB8338[v7];
        v9 = self->_enablePMEMedia;
        if (v9 > 2)
          v10 = "?";
        else
          v10 = off_250EB8338[v9];
        v42 = v8;
        v43 = v10;
        LogPrintF();
      }
      LOBYTE(enablePMEMedia) = 1;
    }
  }
  if (self->_enablePMEVoice)
  {
    enablePMEVoice = self->_enablePMEVoice;
    if (enablePMEVoice != objc_msgSend(v5, "pmeVoiceEnabled"))
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        v12 = objc_msgSend(v5, "pmeVoiceEnabled", v42, v43);
        if (v12 > 2)
          v13 = "?";
        else
          v13 = off_250EB8338[v12];
        v14 = self->_enablePMEVoice;
        if (v14 > 2)
          v15 = "?";
        else
          v15 = off_250EB8338[v14];
        v42 = v13;
        v43 = v15;
        LogPrintF();
      }
      LOBYTE(enablePMEMedia) = 1;
    }
  }
  if (self->_enrollPMEVoice)
  {
    enrollPMEVoice = self->_enrollPMEVoice;
    if (enrollPMEVoice != objc_msgSend(v5, "pmeVoiceEnrolled"))
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v5, "pmeVoiceEnrolled", v42, v43);
        LogPrintF();
      }
      LOBYTE(enablePMEMedia) = 1;
    }
  }
  mediaLossDataLeft = self->_mediaLossDataLeft;
  if (mediaLossDataLeft)
  {
    objc_msgSend(v5, "pmeMediaLossDataLeft");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = mediaLossDataLeft;
    v20 = v18;
    if (v19 == v20)
    {

      goto LABEL_49;
    }
    v21 = v20;
    if (v20)
    {
      v22 = -[NSData isEqual:](v19, "isEqual:", v20);

      if ((v22 & 1) != 0)
        goto LABEL_49;
    }
    else
    {

    }
    if (gLogCategory_HMDeviceConfigurations <= 30
      && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LOBYTE(enablePMEMedia) = 1;
  }
LABEL_49:
  mediaLossDataRight = self->_mediaLossDataRight;
  if (!mediaLossDataRight)
    goto LABEL_61;
  objc_msgSend(v5, "pmeMediaLossDataRight");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = mediaLossDataRight;
  v26 = v24;
  if (v25 == v26)
  {

    goto LABEL_61;
  }
  v27 = v26;
  if (v26)
  {
    v28 = -[NSData isEqual:](v25, "isEqual:", v26);

    if ((v28 & 1) != 0)
      goto LABEL_61;
  }
  else
  {

  }
  if (gLogCategory_HMDeviceConfigurations <= 30
    && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  LOBYTE(enablePMEMedia) = 1;
LABEL_61:
  voiceLossDataLeft = self->_voiceLossDataLeft;
  if (!voiceLossDataLeft)
    goto LABEL_73;
  objc_msgSend(v5, "pmeVoiceLossDataLeft");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = voiceLossDataLeft;
  v32 = v30;
  if (v31 == v32)
  {

    goto LABEL_73;
  }
  v33 = v32;
  if (v32)
  {
    v34 = -[NSData isEqual:](v31, "isEqual:", v32);

    if ((v34 & 1) != 0)
      goto LABEL_73;
  }
  else
  {

  }
  if (gLogCategory_HMDeviceConfigurations <= 30
    && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  LOBYTE(enablePMEMedia) = 1;
LABEL_73:
  voiceLossDataRight = self->_voiceLossDataRight;
  if (voiceLossDataRight)
  {
    objc_msgSend(v5, "pmeVoiceLossDataRight");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = voiceLossDataRight;
    v38 = v36;
    if (v37 == v38)
    {

    }
    else
    {
      v39 = v38;
      if (v38)
      {
        v40 = -[NSData isEqual:](v37, "isEqual:", v38);

        if ((v40 & 1) != 0)
          goto LABEL_85;
      }
      else
      {

      }
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      LOBYTE(enablePMEMedia) = 1;
    }
  }
LABEL_85:

  return enablePMEMedia;
}

- (BOOL)needsUpdateToPersonalAudioForDevice:(id)a3
{
  return 0;
}

- (BOOL)restoreConfigsFromCloudRecordIfNeeded:(id)a3
{
  return 0;
}

- (char)allowListeningModeOff
{
  return self->_allowListeningModeOff;
}

- (void)setAllowListeningModeOff:(char)a3
{
  self->_allowListeningModeOff = a3;
}

- (char)enablePMEMedia
{
  return self->_enablePMEMedia;
}

- (void)setEnablePMEMedia:(char)a3
{
  self->_enablePMEMedia = a3;
}

- (char)enablePMEVoice
{
  return self->_enablePMEVoice;
}

- (void)setEnablePMEVoice:(char)a3
{
  self->_enablePMEVoice = a3;
}

- (char)enrollPMEVoice
{
  return self->_enrollPMEVoice;
}

- (void)setEnrollPMEVoice:(char)a3
{
  self->_enrollPMEVoice = a3;
}

- (NSArray)mediaLossArrayLeft
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaLossArrayLeft:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)mediaLossArrayRight
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMediaLossArrayRight:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)voiceLossArrayLeft
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVoiceLossArrayLeft:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSArray)voiceLossArrayRight
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVoiceLossArrayRight:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSData)mediaLossDataLeft
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMediaLossDataLeft:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSData)mediaLossDataRight
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMediaLossDataRight:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSData)voiceLossDataLeft
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVoiceLossDataLeft:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSData)voiceLossDataRight
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setVoiceLossDataRight:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceLossDataRight, 0);
  objc_storeStrong((id *)&self->_voiceLossDataLeft, 0);
  objc_storeStrong((id *)&self->_mediaLossDataRight, 0);
  objc_storeStrong((id *)&self->_mediaLossDataLeft, 0);
  objc_storeStrong((id *)&self->_voiceLossArrayRight, 0);
  objc_storeStrong((id *)&self->_voiceLossArrayLeft, 0);
  objc_storeStrong((id *)&self->_mediaLossArrayRight, 0);
  objc_storeStrong((id *)&self->_mediaLossArrayLeft, 0);
}

@end
