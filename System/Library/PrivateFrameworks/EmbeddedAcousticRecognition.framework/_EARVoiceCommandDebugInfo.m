@implementation _EARVoiceCommandDebugInfo

- (_EARVoiceCommandDebugInfo)initWithPrecedingUtterance:(id)a3 commandUtterance:(id)a4 target:(id)a5 payload:(id)a6 hasVoiceCommandInExhaustiveParses:(BOOL)a7 hasVoiceCommandParses:(BOOL)a8 hasVoiceCommandEditIntent:(BOOL)a9 hasVoiceCommandAfterReranking:(BOOL)a10 hasNoVoiceCommandAfterRespeakCheck:(BOOL)a11 commandParserMachContinuousStartTicks:(unint64_t)a12 commandParserMachContinuousEndTicks:(unint64_t)a13 commandParserMachAbsoluteStartTicks:(unint64_t)a14 commandParserMachAbsoluteEndTicks:(unint64_t)a15
{
  id v22;
  id v23;
  id v24;
  _EARVoiceCommandDebugInfo *v25;
  _EARVoiceCommandDebugInfo *v26;
  id v28;
  objc_super v29;

  v22 = a3;
  v23 = a4;
  v24 = a5;
  v28 = a6;
  v29.receiver = self;
  v29.super_class = (Class)_EARVoiceCommandDebugInfo;
  v25 = -[_EARVoiceCommandDebugInfo init](&v29, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_precedingUtterance, a3);
    objc_storeStrong((id *)&v26->_commandUtterance, a4);
    objc_storeStrong((id *)&v26->_target, a5);
    objc_storeStrong((id *)&v26->_payload, a6);
    v26->_hasVoiceCommandInExhaustiveParses = a7;
    v26->_hasVoiceCommandParses = a8;
    v26->_hasVoiceCommandEditIntent = a9;
    v26->_hasVoiceCommandAfterReranking = a10;
    v26->_hasNoVoiceCommandAfterRespeakCheck = a11;
    v26->_commandParserMachContinuousStartTicks = a12;
    v26->_commandParserMachContinuousEndTicks = a13;
    v26->_commandParserMachAbsoluteStartTicks = a14;
    v26->_commandParserMachAbsoluteEndTicks = a15;
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  _EARVoiceCommandDebugInfo *v5;
  _EARVoiceCommandDebugInfo *v6;
  _EARVoiceCommandDebugInfo *v7;
  NSString *precedingUtterance;
  NSString *v9;
  NSString *v10;
  void *v11;
  BOOL v12;
  NSString *commandUtterance;
  NSString *v14;
  NSString *v15;
  NSString *target;
  NSString *v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  void *v21;
  NSString *payload;
  NSString *v23;
  NSString *v24;
  _BOOL4 hasVoiceCommandInExhaustiveParses;
  _BOOL4 hasVoiceCommandParses;
  _BOOL4 hasVoiceCommandEditIntent;
  _BOOL4 hasVoiceCommandAfterReranking;
  _BOOL4 hasNoVoiceCommandAfterRespeakCheck;
  unint64_t commandParserMachContinuousStartTicks;
  unint64_t commandParserMachContinuousEndTicks;
  unint64_t commandParserMachAbsoluteStartTicks;
  unint64_t commandParserMachAbsoluteEndTicks;
  BOOL v34;
  void *v36;
  void *v37;
  NSString *v38;
  void *v39;
  NSString *v40;
  void *v41;

  v5 = (_EARVoiceCommandDebugInfo *)a3;
  v6 = v5;
  if (v5 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        precedingUtterance = self->_precedingUtterance;
        -[_EARVoiceCommandDebugInfo precedingUtterance](v7, "precedingUtterance");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (precedingUtterance != v9)
        {
          v10 = self->_precedingUtterance;
          -[_EARVoiceCommandDebugInfo precedingUtterance](v7, "precedingUtterance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqual:](v10, "isEqual:", v11))
          {
            v12 = 0;
            goto LABEL_38;
          }
          v41 = v11;
        }
        commandUtterance = self->_commandUtterance;
        -[_EARVoiceCommandDebugInfo commandUtterance](v7, "commandUtterance");
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (commandUtterance != v14)
        {
          v15 = self->_commandUtterance;
          -[_EARVoiceCommandDebugInfo commandUtterance](v7, "commandUtterance");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqual:](v15, "isEqual:", v3))
          {
            v12 = 0;
LABEL_36:

LABEL_37:
            v11 = v41;
            if (precedingUtterance == v9)
            {
LABEL_39:

              goto LABEL_40;
            }
LABEL_38:

            goto LABEL_39;
          }
        }
        target = self->_target;
        -[_EARVoiceCommandDebugInfo target](v7, "target");
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        v40 = target;
        if (target != v17)
        {
          v18 = self->_target;
          -[_EARVoiceCommandDebugInfo target](v7, "target");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v18;
          v21 = (void *)v19;
          if (!-[NSString isEqual:](v20, "isEqual:", v19))
          {
            v12 = 0;
LABEL_34:

LABEL_35:
            if (commandUtterance == v14)
              goto LABEL_37;
            goto LABEL_36;
          }
          v37 = v21;
        }
        v39 = v3;
        payload = self->_payload;
        -[_EARVoiceCommandDebugInfo payload](v7, "payload");
        v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        v38 = payload;
        if (payload == v23
          || (v24 = self->_payload,
              -[_EARVoiceCommandDebugInfo payload](v7, "payload"),
              v36 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSString isEqual:](v24, "isEqual:")))
        {
          hasVoiceCommandInExhaustiveParses = self->_hasVoiceCommandInExhaustiveParses;
          if (hasVoiceCommandInExhaustiveParses == -[_EARVoiceCommandDebugInfo hasVoiceCommandInExhaustiveParses](v7, "hasVoiceCommandInExhaustiveParses")&& (hasVoiceCommandParses = self->_hasVoiceCommandParses, hasVoiceCommandParses == -[_EARVoiceCommandDebugInfo hasVoiceCommandParses](v7, "hasVoiceCommandParses"))&& (hasVoiceCommandEditIntent = self->_hasVoiceCommandEditIntent, hasVoiceCommandEditIntent == -[_EARVoiceCommandDebugInfo hasVoiceCommandEditIntent](v7, "hasVoiceCommandEditIntent"))&& (hasVoiceCommandAfterReranking = self->_hasVoiceCommandAfterReranking, hasVoiceCommandAfterReranking == -[_EARVoiceCommandDebugInfo hasVoiceCommandAfterReranking](v7, "hasVoiceCommandAfterReranking"))&& (hasNoVoiceCommandAfterRespeakCheck = self->_hasNoVoiceCommandAfterRespeakCheck, hasNoVoiceCommandAfterRespeakCheck == -[_EARVoiceCommandDebugInfo hasNoVoiceCommandAfterRespeakCheck](v7, "hasNoVoiceCommandAfterRespeakCheck"))&& (commandParserMachContinuousStartTicks = self->_commandParserMachContinuousStartTicks, commandParserMachContinuousStartTicks == -[_EARVoiceCommandDebugInfo commandParserMachContinuousStartTicks](v7,
                                                           "commandParserMachContinuousStartTicks"))
            && (commandParserMachContinuousEndTicks = self->_commandParserMachContinuousEndTicks,
                commandParserMachContinuousEndTicks == -[_EARVoiceCommandDebugInfo commandParserMachContinuousEndTicks](v7, "commandParserMachContinuousEndTicks"))&& (commandParserMachAbsoluteStartTicks = self->_commandParserMachAbsoluteStartTicks, commandParserMachAbsoluteStartTicks == -[_EARVoiceCommandDebugInfo commandParserMachAbsoluteStartTicks](v7, "commandParserMachAbsoluteStartTicks")))
          {
            commandParserMachAbsoluteEndTicks = self->_commandParserMachAbsoluteEndTicks;
            v12 = commandParserMachAbsoluteEndTicks == -[_EARVoiceCommandDebugInfo commandParserMachAbsoluteEndTicks](v7, "commandParserMachAbsoluteEndTicks");
            v34 = v12;
          }
          else
          {
            v12 = 0;
            v34 = 0;
          }
          if (v38 == v23)
          {

            v12 = v34;
LABEL_33:
            v3 = v39;
            v21 = v37;
            if (v40 == v17)
              goto LABEL_35;
            goto LABEL_34;
          }
        }
        else
        {
          v12 = 0;
        }

        goto LABEL_33;
      }
    }
    v12 = 0;
  }
LABEL_40:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *precedingUtterance;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  precedingUtterance = self->_precedingUtterance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", precedingUtterance, CFSTR("precedingUtterance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commandUtterance, CFSTR("commandUtterance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_target, CFSTR("target"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payload, CFSTR("payload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasVoiceCommandParses, CFSTR("hasVoiceCommandParses"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasVoiceCommandInExhaustiveParses, CFSTR("hasVoiceCommandInExhaustiveParses"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasVoiceCommandEditIntent, CFSTR("hasVoiceCommandEditIntent"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasVoiceCommandAfterReranking, CFSTR("hasVoiceCommandAfterReranking"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasNoVoiceCommandAfterRespeakCheck, CFSTR("hasNoVoiceCommandAfterRespeakCheck"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_commandParserMachContinuousStartTicks);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("commandParserMachContinuousStartTicks"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_commandParserMachContinuousEndTicks);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("commandParserMachContinuousEndTicks"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_commandParserMachAbsoluteStartTicks);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("commandParserMachAbsoluteStartTicks"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_commandParserMachAbsoluteEndTicks);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("commandParserMachAbsoluteEndTicks"));

}

- (_EARVoiceCommandDebugInfo)initWithCoder:(id)a3
{
  id v4;
  _EARVoiceCommandDebugInfo *v5;
  uint64_t v6;
  NSString *precedingUtterance;
  uint64_t v8;
  NSString *commandUtterance;
  uint64_t v10;
  NSString *target;
  uint64_t v12;
  NSString *payload;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_EARVoiceCommandDebugInfo;
  v5 = -[_EARVoiceCommandDebugInfo init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("precedingUtterance"));
    v6 = objc_claimAutoreleasedReturnValue();
    precedingUtterance = v5->_precedingUtterance;
    v5->_precedingUtterance = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandUtterance"));
    v8 = objc_claimAutoreleasedReturnValue();
    commandUtterance = v5->_commandUtterance;
    v5->_commandUtterance = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target"));
    v10 = objc_claimAutoreleasedReturnValue();
    target = v5->_target;
    v5->_target = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
    v12 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSString *)v12;

    v5->_hasVoiceCommandInExhaustiveParses = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasVoiceCommandInExhaustiveParses"));
    v5->_hasVoiceCommandParses = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasVoiceCommandParses"));
    v5->_hasVoiceCommandEditIntent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasVoiceCommandEditIntent"));
    v5->_hasVoiceCommandAfterReranking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasVoiceCommandAfterReranking"));
    v5->_hasNoVoiceCommandAfterRespeakCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasNoVoiceCommandAfterRespeakCheck"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandParserMachContinuousStartTicks"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_commandParserMachContinuousStartTicks = objc_msgSend(v14, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandParserMachContinuousEndTicks"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_commandParserMachContinuousEndTicks = objc_msgSend(v15, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandParserMachAbsoluteStartTicks"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_commandParserMachAbsoluteStartTicks = objc_msgSend(v16, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandParserMachAbsoluteEndTicks"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_commandParserMachAbsoluteEndTicks = objc_msgSend(v17, "unsignedLongLongValue");

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)precedingUtterance
{
  return self->_precedingUtterance;
}

- (NSString)commandUtterance
{
  return self->_commandUtterance;
}

- (NSString)target
{
  return self->_target;
}

- (NSString)payload
{
  return self->_payload;
}

- (BOOL)hasVoiceCommandInExhaustiveParses
{
  return self->_hasVoiceCommandInExhaustiveParses;
}

- (BOOL)hasVoiceCommandParses
{
  return self->_hasVoiceCommandParses;
}

- (BOOL)hasVoiceCommandEditIntent
{
  return self->_hasVoiceCommandEditIntent;
}

- (BOOL)hasVoiceCommandAfterReranking
{
  return self->_hasVoiceCommandAfterReranking;
}

- (BOOL)hasNoVoiceCommandAfterRespeakCheck
{
  return self->_hasNoVoiceCommandAfterRespeakCheck;
}

- (unint64_t)commandParserMachContinuousStartTicks
{
  return self->_commandParserMachContinuousStartTicks;
}

- (unint64_t)commandParserMachContinuousEndTicks
{
  return self->_commandParserMachContinuousEndTicks;
}

- (unint64_t)commandParserMachAbsoluteStartTicks
{
  return self->_commandParserMachAbsoluteStartTicks;
}

- (unint64_t)commandParserMachAbsoluteEndTicks
{
  return self->_commandParserMachAbsoluteEndTicks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_commandUtterance, 0);
  objc_storeStrong((id *)&self->_precedingUtterance, 0);
}

@end
