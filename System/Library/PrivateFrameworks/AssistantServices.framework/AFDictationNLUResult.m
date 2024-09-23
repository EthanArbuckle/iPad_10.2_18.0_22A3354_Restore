@implementation AFDictationNLUResult

- (AFDictationNLUResult)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AFDictationNLUResult;
  return -[AFDictationNLUResult init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AFDictationNLUResult nluResponse](self, "nluResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setNluResponse:", v6);

  -[AFDictationNLUResult commandGrammarParsePackage](self, "commandGrammarParsePackage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCommandGrammarParsePackage:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  AFDictationNLUResult *v4;
  uint64_t v5;
  BOOL v6;
  AFVoiceCommandGrammarParsePackage *v7;
  AFVoiceCommandGrammarParsePackage *commandGrammarParsePackage;

  v4 = (AFDictationNLUResult *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[AFDictationNLUResult commandGrammarParsePackage](v4, "commandGrammarParsePackage");
      v7 = (AFVoiceCommandGrammarParsePackage *)objc_claimAutoreleasedReturnValue();
      commandGrammarParsePackage = self->_commandGrammarParsePackage;
      v6 = commandGrammarParsePackage == v7
        || -[AFVoiceCommandGrammarParsePackage isEqual:](commandGrammarParsePackage, "isEqual:", v7);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  SIRINLUEXTERNALCDMNluResponse *nluResponse;
  id v5;

  nluResponse = self->_nluResponse;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", nluResponse, CFSTR("_nluResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commandGrammarParsePackage, CFSTR("_commandGrammarParsePackage"));

}

- (AFDictationNLUResult)initWithCoder:(id)a3
{
  id v4;
  AFDictationNLUResult *v5;
  id SIRINLUEXTERNALCDMNluResponseClass;
  uint64_t v7;
  SIRINLUEXTERNALCDMNluResponse *nluResponse;
  uint64_t v9;
  AFVoiceCommandGrammarParsePackage *commandGrammarParsePackage;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFDictationNLUResult;
  v5 = -[AFDictationNLUResult init](&v12, sel_init);
  if (v5)
  {
    SIRINLUEXTERNALCDMNluResponseClass = getSIRINLUEXTERNALCDMNluResponseClass();
    if (SIRINLUEXTERNALCDMNluResponseClass)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", SIRINLUEXTERNALCDMNluResponseClass, CFSTR("_nluResponse"));
      v7 = objc_claimAutoreleasedReturnValue();
      nluResponse = v5->_nluResponse;
      v5->_nluResponse = (SIRINLUEXTERNALCDMNluResponse *)v7;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_commandGrammarParsePackage"));
    v9 = objc_claimAutoreleasedReturnValue();
    commandGrammarParsePackage = v5->_commandGrammarParsePackage;
    v5->_commandGrammarParsePackage = (AFVoiceCommandGrammarParsePackage *)v9;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[NluResponse = %@]"), self->_nluResponse);
  objc_msgSend(v3, "appendString:", CFSTR("\n<CommandGrammarParsePackage>\n"));
  -[AFVoiceCommandGrammarParsePackage description](self->_commandGrammarParsePackage, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR("\n</CommandGrammarParsePackage>\n"));
  return v3;
}

- (SIRINLUEXTERNALCDMNluResponse)nluResponse
{
  return self->_nluResponse;
}

- (void)setNluResponse:(id)a3
{
  objc_storeStrong((id *)&self->_nluResponse, a3);
}

- (AFVoiceCommandGrammarParsePackage)commandGrammarParsePackage
{
  return self->_commandGrammarParsePackage;
}

- (void)setCommandGrammarParsePackage:(id)a3
{
  objc_storeStrong((id *)&self->_commandGrammarParsePackage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandGrammarParsePackage, 0);
  objc_storeStrong((id *)&self->_nluResponse, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
