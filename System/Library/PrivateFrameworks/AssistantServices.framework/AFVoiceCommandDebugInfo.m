@implementation AFVoiceCommandDebugInfo

- (AFVoiceCommandDebugInfo)initWithHasVoiceCommandInExhaustiveParses:(BOOL)a3 hasVoiceCommandParses:(BOOL)a4 hasVoiceCommandEditIntent:(BOOL)a5 hasVoiceCommandAfterReranking:(BOOL)a6 hasNoVoiceCommandAfterRespeakCheck:(BOOL)a7
{
  AFVoiceCommandDebugInfo *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AFVoiceCommandDebugInfo;
  result = -[AFVoiceCommandDebugInfo init](&v13, sel_init);
  if (result)
  {
    result->_hasVoiceCommandInExhaustiveParses = a3;
    result->_hasVoiceCommandParses = a4;
    result->_hasVoiceCommandEditIntent = a5;
    result->_hasVoiceCommandAfterReranking = a6;
    result->_hasNoVoiceCommandAfterRespeakCheck = a7;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setHasVoiceCommandInExhaustiveParses:", self->_hasVoiceCommandInExhaustiveParses);
  objc_msgSend(v4, "setHasVoiceCommandParses:", self->_hasVoiceCommandParses);
  objc_msgSend(v4, "setHasVoiceCommandEditIntent:", self->_hasVoiceCommandEditIntent);
  objc_msgSend(v4, "setHasVoiceCommandAfterReranking:", self->_hasVoiceCommandAfterReranking);
  objc_msgSend(v4, "setHasNoVoiceCommandAfterRespeakCheck:", self->_hasNoVoiceCommandAfterRespeakCheck);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 hasVoiceCommandInExhaustiveParses;
  id v5;

  hasVoiceCommandInExhaustiveParses = self->_hasVoiceCommandInExhaustiveParses;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", hasVoiceCommandInExhaustiveParses, CFSTR("hasVoiceCommandInExhaustiveParses"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasVoiceCommandParses, CFSTR("hasVoiceCommandParses"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasVoiceCommandEditIntent, CFSTR("hasVoiceCommandEditIntent"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasVoiceCommandAfterReranking, CFSTR("hasVoiceCommandAfterReranking"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasNoVoiceCommandAfterRespeakCheck, CFSTR("hasNoVoiceCommandAfterRespeakCheck"));

}

- (AFVoiceCommandDebugInfo)initWithCoder:(id)a3
{
  id v4;
  AFVoiceCommandDebugInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AFVoiceCommandDebugInfo;
  v5 = -[AFVoiceCommandDebugInfo init](&v7, sel_init);
  if (v5)
  {
    v5->_hasVoiceCommandInExhaustiveParses = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasVoiceCommandInExhaustiveParses"));
    v5->_hasVoiceCommandParses = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasVoiceCommandParses"));
    v5->_hasVoiceCommandEditIntent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasVoiceCommandEditIntent"));
    v5->_hasVoiceCommandAfterReranking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasVoiceCommandAfterReranking"));
    v5->_hasNoVoiceCommandAfterRespeakCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasNoVoiceCommandAfterRespeakCheck"));
  }

  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[hasVoiceCommandInExhaustiveParses = %u]"), self->_hasVoiceCommandInExhaustiveParses);
  objc_msgSend(v3, "appendFormat:", CFSTR("[hasVoiceCommandParses = %u]"), self->_hasVoiceCommandParses);
  objc_msgSend(v3, "appendFormat:", CFSTR("[hasVoiceCommandEditIntent = %u]"), self->_hasVoiceCommandEditIntent);
  objc_msgSend(v3, "appendFormat:", CFSTR("[hasVoiceCommandAfterReranking = %u]"), self->_hasVoiceCommandAfterReranking);
  objc_msgSend(v3, "appendFormat:", CFSTR("[hasNoVoiceCommandAfterRespeakCheck = %u]"), self->_hasNoVoiceCommandAfterRespeakCheck);
  return v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("hasVoiceCommandInExhaustiveParses");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasVoiceCommandInExhaustiveParses);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("hasVoiceCommandParses");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasVoiceCommandParses);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("hasVoiceCommandEditIntent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasVoiceCommandEditIntent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("hasVoiceCommandAfterReranking");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasVoiceCommandAfterReranking);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("hasNoVoiceCommandAfterRespeakCheck");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasNoVoiceCommandAfterRespeakCheck);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AFVoiceCommandDebugInfo *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (AFVoiceCommandDebugInfo *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class()
      && v4->_hasVoiceCommandInExhaustiveParses == self->_hasVoiceCommandInExhaustiveParses
      && v4->_hasVoiceCommandParses == self->_hasVoiceCommandParses
      && v4->_hasVoiceCommandEditIntent == self->_hasVoiceCommandEditIntent
      && v4->_hasVoiceCommandAfterReranking == self->_hasVoiceCommandAfterReranking
      && v4->_hasNoVoiceCommandAfterRespeakCheck == self->_hasNoVoiceCommandAfterRespeakCheck;
  }

  return v6;
}

- (BOOL)hasVoiceCommandInExhaustiveParses
{
  return self->_hasVoiceCommandInExhaustiveParses;
}

- (void)setHasVoiceCommandInExhaustiveParses:(BOOL)a3
{
  self->_hasVoiceCommandInExhaustiveParses = a3;
}

- (BOOL)hasVoiceCommandParses
{
  return self->_hasVoiceCommandParses;
}

- (void)setHasVoiceCommandParses:(BOOL)a3
{
  self->_hasVoiceCommandParses = a3;
}

- (BOOL)hasVoiceCommandEditIntent
{
  return self->_hasVoiceCommandEditIntent;
}

- (void)setHasVoiceCommandEditIntent:(BOOL)a3
{
  self->_hasVoiceCommandEditIntent = a3;
}

- (BOOL)hasVoiceCommandAfterReranking
{
  return self->_hasVoiceCommandAfterReranking;
}

- (void)setHasVoiceCommandAfterReranking:(BOOL)a3
{
  self->_hasVoiceCommandAfterReranking = a3;
}

- (BOOL)hasNoVoiceCommandAfterRespeakCheck
{
  return self->_hasNoVoiceCommandAfterRespeakCheck;
}

- (void)setHasNoVoiceCommandAfterRespeakCheck:(BOOL)a3
{
  self->_hasNoVoiceCommandAfterRespeakCheck = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
