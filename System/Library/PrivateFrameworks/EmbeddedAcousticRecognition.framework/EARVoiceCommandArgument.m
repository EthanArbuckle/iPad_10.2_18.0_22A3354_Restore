@implementation EARVoiceCommandArgument

- (EARVoiceCommandArgument)initWithPresence:(char)a3 indexes:(id)a4 adpositionIndexes:(id)a5 text:(id)a6
{
  int v8;
  id v10;
  id v11;
  id v12;
  EARVoiceCommandArgument *v13;
  EARVoiceCommandArgument *v14;
  EARVoiceCommandArgument *v15;
  uint64_t v16;
  NSIndexSet *indexes;
  uint64_t v18;
  NSIndexSet *adpositionIndexes;
  uint64_t v20;
  NSString *text;
  objc_super v23;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)EARVoiceCommandArgument;
  v13 = -[EARVoiceCommandArgument init](&v23, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_8;
  v13->_presence = v8;
  if (v8 == 3 || v10 || v11 || v12)
  {
    v16 = objc_msgSend(v10, "copy");
    indexes = v14->_indexes;
    v14->_indexes = (NSIndexSet *)v16;

    v18 = objc_msgSend(v11, "copy");
    adpositionIndexes = v14->_adpositionIndexes;
    v14->_adpositionIndexes = (NSIndexSet *)v18;

    v20 = objc_msgSend(v12, "copy");
    text = v14->_text;
    v14->_text = (NSString *)v20;

LABEL_8:
    v15 = v14;
    goto LABEL_9;
  }
  v15 = 0;
LABEL_9:

  return v15;
}

- (EARVoiceCommandArgument)initWithPresence:(char)a3 indexes:(id)a4 adpositionIndexes:(id)a5
{
  return -[EARVoiceCommandArgument initWithPresence:indexes:adpositionIndexes:text:](self, "initWithPresence:indexes:adpositionIndexes:text:", a3, a4, a5, 0);
}

- (EARVoiceCommandArgument)initWithPresence:(char)a3 text:(id)a4
{
  return -[EARVoiceCommandArgument initWithPresence:indexes:adpositionIndexes:text:](self, "initWithPresence:indexes:adpositionIndexes:text:", a3, 0, 0, a4);
}

- (BOOL)isEqual:(id)a3
{
  EARVoiceCommandArgument *v4;
  EARVoiceCommandArgument *v5;
  EARVoiceCommandArgument *v6;
  int presence;
  NSIndexSet *indexes;
  void *v9;
  NSIndexSet *adpositionIndexes;
  void *v11;
  NSString *text;
  void *v13;
  char v14;

  v4 = (EARVoiceCommandArgument *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    presence = self->_presence;
    if (presence == -[EARVoiceCommandArgument presence](v6, "presence"))
    {
      indexes = self->_indexes;
      -[EARVoiceCommandArgument indexes](v6, "indexes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSIndexSet isEqualToIndexSet:](indexes, "isEqualToIndexSet:", v9))
      {
        adpositionIndexes = self->_adpositionIndexes;
        -[EARVoiceCommandArgument adpositionIndexes](v6, "adpositionIndexes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSIndexSet isEqualToIndexSet:](adpositionIndexes, "isEqualToIndexSet:", v11))
        {
          text = self->_text;
          -[EARVoiceCommandArgument text](v6, "text");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[NSString isEqualToString:](text, "isEqualToString:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  int presence;
  uint64_t v4;
  uint64_t v5;

  presence = self->_presence;
  v4 = -[NSIndexSet hash](self->_indexes, "hash") + 1571 * presence;
  v5 = -[NSIndexSet hash](self->_adpositionIndexes, "hash") + 1571 * v4;
  return -[NSString hash](self->_text, "hash") + 1571 * v5 + 0x58A39626DD1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t presence;
  id v5;

  presence = self->_presence;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", presence, CFSTR("presence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_indexes, CFSTR("indexes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adpositionIndexes, CFSTR("adpositionIndexes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_text, CFSTR("text"));

}

- (EARVoiceCommandArgument)initWithCoder:(id)a3
{
  id v4;
  EARVoiceCommandArgument *v5;
  uint64_t v6;
  NSIndexSet *indexes;
  uint64_t v8;
  NSIndexSet *adpositionIndexes;
  uint64_t v10;
  NSString *text;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EARVoiceCommandArgument;
  v5 = -[EARVoiceCommandArgument init](&v13, sel_init);
  if (v5)
  {
    v5->_presence = objc_msgSend(v4, "decodeIntForKey:", CFSTR("presence"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("indexes"));
    v6 = objc_claimAutoreleasedReturnValue();
    indexes = v5->_indexes;
    v5->_indexes = (NSIndexSet *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adpositionIndexes"));
    v8 = objc_claimAutoreleasedReturnValue();
    adpositionIndexes = v5->_adpositionIndexes;
    v5->_adpositionIndexes = (NSIndexSet *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v10 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (char)presence
{
  return self->_presence;
}

- (NSIndexSet)indexes
{
  return self->_indexes;
}

- (NSIndexSet)adpositionIndexes
{
  return self->_adpositionIndexes;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_adpositionIndexes, 0);
  objc_storeStrong((id *)&self->_indexes, 0);
}

@end
