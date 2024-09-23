@implementation AFVoiceCommandGrammarParseResult

- (AFVoiceCommandGrammarParseResult)initWithUtterance:(id)a3 parseCandidates:(id)a4
{
  id v6;
  id v7;
  AFVoiceCommandGrammarParseResult *v8;
  uint64_t v9;
  NSString *utterance;
  uint64_t v11;
  NSArray *parseCandidates;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFVoiceCommandGrammarParseResult;
  v8 = -[AFVoiceCommandGrammarParseResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    utterance = v8->_utterance;
    v8->_utterance = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    parseCandidates = v8->_parseCandidates;
    v8->_parseCandidates = (NSArray *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AFVoiceCommandGrammarParseResult *v4;
  AFVoiceCommandGrammarParseResult *v5;
  NSString *v6;
  NSString *utterance;
  NSArray *v8;
  NSArray *parseCandidates;
  BOOL v10;

  v4 = (AFVoiceCommandGrammarParseResult *)a3;
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
      -[AFVoiceCommandGrammarParseResult utterance](v5, "utterance");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      utterance = self->_utterance;
      if (utterance == v6 || -[NSString isEqual:](utterance, "isEqual:", v6))
      {
        -[AFVoiceCommandGrammarParseResult parseCandidates](v5, "parseCandidates");
        v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
        parseCandidates = self->_parseCandidates;
        v10 = parseCandidates == v8 || -[NSArray isEqual:](parseCandidates, "isEqual:", v8);

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
  NSArray *parseCandidates;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("utterance = %@"), self->_utterance);
  parseCandidates = self->_parseCandidates;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__AFVoiceCommandGrammarParseResult_description__block_invoke;
  v7[3] = &unk_1E3A34D18;
  v5 = v3;
  v8 = v5;
  -[NSArray enumerateObjectsUsingBlock:](parseCandidates, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *parseCandidates;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKey:", self->_utterance, CFSTR("utterance"));
  if (-[NSArray count](self->_parseCandidates, "count"))
  {
    v4 = (void *)objc_opt_new();
    parseCandidates = self->_parseCandidates;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__AFVoiceCommandGrammarParseResult_dictionaryRepresentation__block_invoke;
    v8[3] = &unk_1E3A34D18;
    v9 = v4;
    v6 = v4;
    -[NSArray enumerateObjectsUsingBlock:](parseCandidates, "enumerateObjectsUsingBlock:", v8);
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("parseCandidates"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("parseCandidates"));
  }

  return v3;
}

- (AFVoiceCommandGrammarParseResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AFVoiceCommandGrammarParseResult *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceCommandGrammarParseResult::utterance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AFVoiceCommandGrammarParseResult::parseCandidates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AFVoiceCommandGrammarParseResult initWithUtterance:parseCandidates:](self, "initWithUtterance:parseCandidates:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *utterance;
  id v5;

  utterance = self->_utterance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", utterance, CFSTR("AFVoiceCommandGrammarParseResult::utterance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parseCandidates, CFSTR("AFVoiceCommandGrammarParseResult::parseCandidates"));

}

- (NSString)utterance
{
  return self->_utterance;
}

- (NSArray)parseCandidates
{
  return self->_parseCandidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseCandidates, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
}

void __60__AFVoiceCommandGrammarParseResult_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dictionaryRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __47__AFVoiceCommandGrammarParseResult_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "description");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendFormat:", CFSTR("parseCandidate[%lu] --> %@"), a3, v8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
