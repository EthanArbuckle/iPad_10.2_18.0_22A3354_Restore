@implementation MNAudioSystemEvent

- (MNAudioSystemEvent)initWithUtterance:(id)a3 andShortPrompt:(unint64_t)a4 andVoiceGuidanceLevel:(unint64_t)a5 andCompletion:(id)a6
{
  id v10;
  id v11;
  NSString *v12;
  NSString *utterance;
  void *v14;
  id handler;
  MNAudioSystemEvent *v16;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  if (objc_msgSend(v10, "length") | a4
    && (v18.receiver = self,
        v18.super_class = (Class)MNAudioSystemEvent,
        (self = -[MNAudioSystemEvent init](&v18, sel_init)) != 0))
  {
    self->_isPrivate = objc_msgSend(v10, "_navigation_isPrivate");
    objc_msgSend(v10, "_navigation_stringByStrippingPrivateTag");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    utterance = self->_utterance;
    self->_utterance = v12;

    self->_shortPrompt = a4;
    self->_guidanceLevel = a5;
    v14 = (void *)objc_msgSend(v11, "copy");
    handler = self->_handler;
    self->_handler = v14;

    self = self;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)hasSoundEffect
{
  return (self->_shortPrompt & 0x30) != 0;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;

  v4 = a3;
  if (!v4 || !objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[MNAudioSystemEvent utterance](self, "utterance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  objc_msgSend(v4, "utterance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    if (objc_msgSend(v7, "length"))
    {

    }
    else
    {
      v11 = objc_msgSend(v4, "shortPrompt");
      v12 = -[MNAudioSystemEvent shortPrompt](self, "shortPrompt");

      if (v11 == v12)
        goto LABEL_9;
    }
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  -[MNAudioSystemEvent utterance](self, "utterance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
    goto LABEL_10;
LABEL_9:
  v13 = 1;
LABEL_11:

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v14.receiver = self;
  v14.super_class = (Class)MNAudioSystemEvent;
  -[MNAudioSystemEvent description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNAudioSystemEvent utterance](self, "utterance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[MNAudioSystemEvent utterance](self, "utterance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" utterance: '%@'"), v8);

  }
  if (-[MNAudioSystemEvent shortPrompt](self, "shortPrompt"))
  {
    MNInstructionsShortPromptTypeToString(-[MNAudioSystemEvent shortPrompt](self, "shortPrompt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" instructions: %@"), v9);

  }
  -[MNAudioSystemEvent handler](self, "handler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("with completion handler");
  if (!v10)
    v11 = CFSTR("with no completion handler");
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v11);

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (NSString)utterance
{
  return self->_utterance;
}

- (unint64_t)shortPrompt
{
  return self->_shortPrompt;
}

- (unint64_t)guidanceLevel
{
  return self->_guidanceLevel;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
}

@end
