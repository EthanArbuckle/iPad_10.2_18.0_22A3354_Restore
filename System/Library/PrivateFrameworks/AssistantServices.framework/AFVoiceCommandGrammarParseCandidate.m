@implementation AFVoiceCommandGrammarParseCandidate

- (AFVoiceCommandGrammarParseCandidate)initWithCommandId:(id)a3 isComplete:(BOOL)a4 paramMatches:(id)a5
{
  return -[AFVoiceCommandGrammarParseCandidate initWithVoiceCommandUUID:commandId:isComplete:paramMatches:](self, "initWithVoiceCommandUUID:commandId:isComplete:paramMatches:", 0, a3, a4, a5);
}

- (AFVoiceCommandGrammarParseCandidate)initWithVoiceCommandUUID:(id)a3 commandId:(id)a4 isComplete:(BOOL)a5 paramMatches:(id)a6
{
  id v10;
  id v11;
  id v12;
  AFVoiceCommandGrammarParseCandidate *v13;
  uint64_t v14;
  NSUUID *voiceCommandUUID;
  uint64_t v16;
  NSString *commandId;
  uint64_t v18;
  NSDictionary *paramMatches;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AFVoiceCommandGrammarParseCandidate;
  v13 = -[AFVoiceCommandGrammarParseCandidate init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    voiceCommandUUID = v13->_voiceCommandUUID;
    v13->_voiceCommandUUID = (NSUUID *)v14;

    v16 = objc_msgSend(v11, "copy");
    commandId = v13->_commandId;
    v13->_commandId = (NSString *)v16;

    v13->_isComplete = a5;
    v18 = objc_msgSend(v12, "copy");
    paramMatches = v13->_paramMatches;
    v13->_paramMatches = (NSDictionary *)v18;

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  AFVoiceCommandGrammarParseCandidate *v4;
  AFVoiceCommandGrammarParseCandidate *v5;
  _BOOL4 isComplete;
  NSUUID *v7;
  NSUUID *voiceCommandUUID;
  NSString *v9;
  NSString *commandId;
  NSDictionary *v11;
  NSDictionary *paramMatches;
  BOOL v13;

  v4 = (AFVoiceCommandGrammarParseCandidate *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isComplete = self->_isComplete;
      if (isComplete == -[AFVoiceCommandGrammarParseCandidate isComplete](v5, "isComplete"))
      {
        -[AFVoiceCommandGrammarParseCandidate voiceCommandUUID](v5, "voiceCommandUUID");
        v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        voiceCommandUUID = self->_voiceCommandUUID;
        if (voiceCommandUUID == v7 || -[NSUUID isEqual:](voiceCommandUUID, "isEqual:", v7))
        {
          -[AFVoiceCommandGrammarParseCandidate commandId](v5, "commandId");
          v9 = (NSString *)objc_claimAutoreleasedReturnValue();
          commandId = self->_commandId;
          if (commandId == v9 || -[NSString isEqual:](commandId, "isEqual:", v9))
          {
            -[AFVoiceCommandGrammarParseCandidate paramMatches](v5, "paramMatches");
            v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            paramMatches = self->_paramMatches;
            v13 = paramMatches == v11 || -[NSDictionary isEqual:](paramMatches, "isEqual:", v11);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  NSDictionary *paramMatches;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("["));
  objc_msgSend(v3, "appendFormat:", CFSTR("voiceCommandUUID = %@"), self->_voiceCommandUUID);
  objc_msgSend(v3, "appendFormat:", CFSTR("commandId = %@"), self->_commandId);
  if (self->_isComplete)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(", isComplete = %@"), v4);
  paramMatches = self->_paramMatches;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__AFVoiceCommandGrammarParseCandidate_description__block_invoke;
  v8[3] = &unk_1E3A311F8;
  v6 = v3;
  v9 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](paramMatches, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(v6, "appendFormat:", CFSTR("]"));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSDictionary *paramMatches;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__18819;
  v13 = __Block_byref_object_dispose__18820;
  v14 = (id)objc_opt_new();
  objc_msgSend((id)v10[5], "setObject:forKey:", self->_commandId, CFSTR("commandId"));
  v3 = (void *)v10[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isComplete);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("isComplete"));

  paramMatches = self->_paramMatches;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__AFVoiceCommandGrammarParseCandidate_dictionaryRepresentation__block_invoke;
  v8[3] = &unk_1E3A31220;
  v8[4] = &v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](paramMatches, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (AFVoiceCommandGrammarParseCandidate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  AFVoiceCommandGrammarParseCandidate *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceCommandGrammarParseCandidate::voiceCommandUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceCommandGrammarParseCandidate::commandId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceCommandGrammarParseCandidate::isComplete"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("AFVoiceCommandGrammarParseCandidate::paramMatches"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[AFVoiceCommandGrammarParseCandidate initWithVoiceCommandUUID:commandId:isComplete:paramMatches:](self, "initWithVoiceCommandUUID:commandId:isComplete:paramMatches:", v5, v6, v8, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *voiceCommandUUID;
  void *v5;
  id v6;

  voiceCommandUUID = self->_voiceCommandUUID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", voiceCommandUUID, CFSTR("AFVoiceCommandGrammarParseCandidate::voiceCommandUUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_commandId, CFSTR("AFVoiceCommandGrammarParseCandidate::commandId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isComplete);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AFVoiceCommandGrammarParseCandidate::isComplete"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_paramMatches, CFSTR("AFVoiceCommandGrammarParseCandidate::paramMatches"));
}

- (NSUUID)voiceCommandUUID
{
  return self->_voiceCommandUUID;
}

- (NSString)commandId
{
  return self->_commandId;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (NSDictionary)paramMatches
{
  return self->_paramMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paramMatches, 0);
  objc_storeStrong((id *)&self->_commandId, 0);
  objc_storeStrong((id *)&self->_voiceCommandUUID, 0);
}

void __63__AFVoiceCommandGrammarParseCandidate_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6 = a2;
  objc_msgSend(v9, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v9, "text");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v6);

}

void __50__AFVoiceCommandGrammarParseCandidate_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "description");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", %@ : %@"), v5, v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
