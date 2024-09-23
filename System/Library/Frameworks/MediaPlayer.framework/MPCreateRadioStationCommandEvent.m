@implementation MPCreateRadioStationCommandEvent

- (MPCreateRadioStationCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPCreateRadioStationCommandEvent *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURL *stationURL;
  void *v14;
  objc_super v16;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCreateRadioStationCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v16, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CD18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      stationURL = v9->_stationURL;
      v9->_stationURL = (NSURL *)v12;

    }
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CCE0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_requestingPlaybackInitialization = objc_msgSend(v14, "BOOLValue");

  }
  return v9;
}

- (NSURL)stationURL
{
  return self->_stationURL;
}

- (BOOL)isRequestingPlaybackInitialization
{
  return self->_requestingPlaybackInitialization;
}

- (NSNumber)privateListeningOverride
{
  return self->_privateListeningOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateListeningOverride, 0);
  objc_storeStrong((id *)&self->_stationURL, 0);
}

@end
