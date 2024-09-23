@implementation AFSpeechInfoPackage

- (AFSpeechInfoPackage)initWithCommandGrammarParsePackage:(id)a3
{
  return -[AFSpeechInfoPackage initWithCommandGrammarParsePackage:debugInfo:](self, "initWithCommandGrammarParsePackage:debugInfo:", a3, 0);
}

- (AFSpeechInfoPackage)initWithCommandGrammarParsePackage:(id)a3 debugInfo:(id)a4
{
  id v6;
  id v7;
  AFSpeechInfoPackage *v8;
  uint64_t v9;
  AFVoiceCommandGrammarParsePackage *commandGrammarParsePackage;
  uint64_t v11;
  AFVoiceCommandDebugInfo *debugInfo;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFSpeechInfoPackage;
  v8 = -[AFSpeechInfoPackage init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    commandGrammarParsePackage = v8->_commandGrammarParsePackage;
    v8->_commandGrammarParsePackage = (AFVoiceCommandGrammarParsePackage *)v9;

    v11 = objc_msgSend(v7, "copy");
    debugInfo = v8->_debugInfo;
    v8->_debugInfo = (AFVoiceCommandDebugInfo *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AFSpeechInfoPackage *v4;
  AFSpeechInfoPackage *v5;
  AFVoiceCommandGrammarParsePackage *v6;
  AFVoiceCommandGrammarParsePackage *commandGrammarParsePackage;
  AFVoiceCommandDebugInfo *v8;
  AFVoiceCommandDebugInfo *debugInfo;
  BOOL v10;

  v4 = (AFSpeechInfoPackage *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFSpeechInfoPackage commandGrammarParsePackage](v5, "commandGrammarParsePackage");
      v6 = (AFVoiceCommandGrammarParsePackage *)objc_claimAutoreleasedReturnValue();
      commandGrammarParsePackage = self->_commandGrammarParsePackage;
      if (commandGrammarParsePackage == v6
        || -[AFVoiceCommandGrammarParsePackage isEqual:](commandGrammarParsePackage, "isEqual:", v6))
      {
        -[AFSpeechInfoPackage debugInfo](v5, "debugInfo");
        v8 = (AFVoiceCommandDebugInfo *)objc_claimAutoreleasedReturnValue();
        debugInfo = self->_debugInfo;
        v10 = debugInfo == v8 || -[AFVoiceCommandDebugInfo isEqual:](debugInfo, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFVoiceCommandGrammarParsePackage description](self->_commandGrammarParsePackage, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[CommandGrammarParsePackage = %@]"), v4);

  -[AFVoiceCommandDebugInfo description](self->_debugInfo, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[DebugInfo = %@]"), v5);

  return v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("commandGrammarParsePackage");
  -[AFVoiceCommandGrammarParsePackage dictionaryRepresentation](self->_commandGrammarParsePackage, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("debugInfo");
  v8[0] = v3;
  -[AFVoiceCommandDebugInfo dictionaryRepresentation](self->_debugInfo, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AFSpeechInfoPackage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFSpeechInfoPackage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechInfoPackage::CommandGrammarParsePackage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechInfoPackage::DebugInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AFSpeechInfoPackage initWithCommandGrammarParsePackage:debugInfo:](self, "initWithCommandGrammarParsePackage:debugInfo:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  AFVoiceCommandGrammarParsePackage *commandGrammarParsePackage;
  id v5;

  commandGrammarParsePackage = self->_commandGrammarParsePackage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", commandGrammarParsePackage, CFSTR("AFSpeechInfoPackage::CommandGrammarParsePackage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_debugInfo, CFSTR("AFSpeechInfoPackage::DebugInfo"));

}

- (AFVoiceCommandGrammarParsePackage)commandGrammarParsePackage
{
  return self->_commandGrammarParsePackage;
}

- (AFVoiceCommandDebugInfo)debugInfo
{
  return self->_debugInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_commandGrammarParsePackage, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
