@implementation ANAnnouncementContent

- (ANAnnouncementContent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ANAnnouncementContent;
  return -[ANAnnouncementContent init](&v3, sel_init);
}

+ (id)contentWithAudioFileURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAudioFileURL:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ANAnnouncementContent audioFileURL](self, "audioFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementContent transcription](self, "transcription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  -[ANAnnouncementContent endpointIdentifier](self, "endpointIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementContent homeKitUserIdentifier](self, "homeKitUserIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Audio File = %@, Transcription Length = %lu, EndpointID = %@, HomeKitUserID = %@"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_endpointIdentifier, a3);
}

- (id)homeKitUserIdentifier
{
  return self->_homeKitUserIdentifier;
}

- (void)setHomeKitUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitUserIdentifier, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *audioFileURL;
  id v5;

  audioFileURL = self->_audioFileURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", audioFileURL, CFSTR("AudioFileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transcription, CFSTR("Transcription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endpointIdentifier, CFSTR("EndpointIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeKitUserIdentifier, CFSTR("HomeKitUserIdentifier"));

}

- (ANAnnouncementContent)initWithCoder:(id)a3
{
  id v4;
  ANAnnouncementContent *v5;
  uint64_t v6;
  NSURL *audioFileURL;
  uint64_t v8;
  NSString *transcription;
  uint64_t v10;
  NSString *endpointIdentifier;
  uint64_t v12;
  NSUUID *homeKitUserIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ANAnnouncementContent;
  v5 = -[ANAnnouncementContent init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AudioFileURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    audioFileURL = v5->_audioFileURL;
    v5->_audioFileURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Transcription"));
    v8 = objc_claimAutoreleasedReturnValue();
    transcription = v5->_transcription;
    v5->_transcription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EndpointIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    endpointIdentifier = v5->_endpointIdentifier;
    v5->_endpointIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HomeKitUserIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    homeKitUserIdentifier = v5->_homeKitUserIdentifier;
    v5->_homeKitUserIdentifier = (NSUUID *)v12;

  }
  return v5;
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileURL, a3);
}

- (NSString)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
  objc_storeStrong((id *)&self->_transcription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_homeKitUserIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
}

@end
