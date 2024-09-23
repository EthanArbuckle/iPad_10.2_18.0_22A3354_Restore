@implementation AFSpeechInfo

- (AFSpeechInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSpeechInfoMutation *);
  AFSpeechInfo *v5;
  AFSpeechInfo *v6;
  _AFSpeechInfoMutation *v7;
  void *v8;
  uint64_t v9;
  SASSpeechRecognized *speechRecognizedCommand;
  objc_super v12;

  v4 = (void (**)(id, _AFSpeechInfoMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSpeechInfo;
  v5 = -[AFSpeechInfo init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSpeechInfoMutation initWithBase:]([_AFSpeechInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSpeechInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFSpeechInfoMutation getSpeechRecognizedCommand](v7, "getSpeechRecognizedCommand");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      speechRecognizedCommand = v6->_speechRecognizedCommand;
      v6->_speechRecognizedCommand = (SASSpeechRecognized *)v9;

    }
  }

  return v6;
}

- (AFSpeechInfo)init
{
  return -[AFSpeechInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSpeechInfo)initWithSpeechRecognizedCommand:(id)a3
{
  id v4;
  id v5;
  AFSpeechInfo *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__AFSpeechInfo_initWithSpeechRecognizedCommand___block_invoke;
  v8[3] = &unk_1E3A2E348;
  v9 = v4;
  v5 = v4;
  v6 = -[AFSpeechInfo initWithBuilder:](self, "initWithBuilder:", v8);

  return v6;
}

- (NSString)description
{
  return (NSString *)-[AFSpeechInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFSpeechInfo;
  -[AFSpeechInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {speechRecognizedCommand = %@}"), v5, self->_speechRecognizedCommand);

  return v6;
}

- (unint64_t)hash
{
  return -[SASSpeechRecognized hash](self->_speechRecognizedCommand, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFSpeechInfo *v4;
  SASSpeechRecognized *v5;
  SASSpeechRecognized *speechRecognizedCommand;
  BOOL v7;

  v4 = (AFSpeechInfo *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AFSpeechInfo speechRecognizedCommand](v4, "speechRecognizedCommand");
      v5 = (SASSpeechRecognized *)objc_claimAutoreleasedReturnValue();
      speechRecognizedCommand = self->_speechRecognizedCommand;
      v7 = speechRecognizedCommand == v5
        || -[SASSpeechRecognized isEqual:](speechRecognizedCommand, "isEqual:", v5);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (AFSpeechInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AFSpeechInfo *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechInfo::speechRecognizedCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AFSpeechInfo initWithSpeechRecognizedCommand:](self, "initWithSpeechRecognizedCommand:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_speechRecognizedCommand, CFSTR("AFSpeechInfo::speechRecognizedCommand"));
}

- (AFSpeechInfo)initWithDictionaryRepresentation:(id)a3
{
  void *v4;
  void *v5;
  AFSpeechInfo *v6;

  if (a3)
  {
    objc_msgSend(a3, "objectForKey:", CFSTR("speechRecognizedCommand"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D883E0], "aceObjectWithDictionary:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    self = -[AFSpeechInfo initWithSpeechRecognizedCommand:](self, "initWithSpeechRecognizedCommand:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  SASSpeechRecognized *speechRecognizedCommand;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  speechRecognizedCommand = self->_speechRecognizedCommand;
  if (speechRecognizedCommand)
  {
    -[SASSpeechRecognized dictionary](speechRecognizedCommand, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("speechRecognizedCommand"));

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (SASSpeechRecognized)speechRecognizedCommand
{
  return self->_speechRecognizedCommand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechRecognizedCommand, 0);
}

uint64_t __48__AFSpeechInfo_initWithSpeechRecognizedCommand___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSpeechRecognizedCommand:", *(_QWORD *)(a1 + 32));
}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFSpeechInfoMutation *);
  _AFSpeechInfoMutation *v5;
  AFSpeechInfo *v6;
  void *v7;
  uint64_t v8;
  SASSpeechRecognized *speechRecognizedCommand;

  v4 = (void (**)(id, _AFSpeechInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSpeechInfoMutation initWithBase:]([_AFSpeechInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSpeechInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSpeechInfo);
      -[_AFSpeechInfoMutation getSpeechRecognizedCommand](v5, "getSpeechRecognizedCommand");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      speechRecognizedCommand = v6->_speechRecognizedCommand;
      v6->_speechRecognizedCommand = (SASSpeechRecognized *)v8;

    }
    else
    {
      v6 = (AFSpeechInfo *)-[AFSpeechInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSpeechInfo *)-[AFSpeechInfo copy](self, "copy");
  }

  return v6;
}

@end
