@implementation MPPlaybackSessionCommandEvent

- (MPPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPPlaybackSessionCommandEvent *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *revision;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MPPlaybackSessionCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v18, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC60]);
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC78]);
    v12 = objc_claimAutoreleasedReturnValue();
    revision = v9->_revision;
    v9->_revision = (NSString *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");
    v16 = v15 == 512;
    if (v15 == 1024)
      v16 = 2;
    v9->_priority = v16;

  }
  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)revision
{
  return self->_revision;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
