@implementation MPVocalsControlCommandEvent

- (MPVocalsControlCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPVocalsControlCommandEvent *v9;
  uint64_t v10;
  NSNumber *active;
  uint64_t v12;
  NSNumber *level;
  objc_super v15;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPVocalsControlCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v15, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CD38]);
    v10 = objc_claimAutoreleasedReturnValue();
    active = v9->_active;
    v9->_active = (NSNumber *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CD40]);
    v12 = objc_claimAutoreleasedReturnValue();
    level = v9->_level;
    v9->_level = (NSNumber *)v12;

  }
  return v9;
}

- (NSNumber)active
{
  return self->_active;
}

- (NSNumber)level
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_active, 0);
}

@end
