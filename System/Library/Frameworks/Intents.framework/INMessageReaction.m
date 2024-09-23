@implementation INMessageReaction

- (INMessageReaction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INMessageReaction;
  return -[INMessageReaction init](&v3, sel_init);
}

- (INMessageReaction)initWithReactionType:(int64_t)a3 reactionDescription:(id)a4 emoji:(id)a5
{
  id v8;
  id v9;
  INMessageReaction *v10;
  INMessageReaction *v11;
  uint64_t v12;
  NSString *reactionDescription;
  uint64_t v14;
  NSString *emoji;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INMessageReaction;
  v10 = -[INMessageReaction init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_reactionType = a3;
    v12 = objc_msgSend(v8, "copy");
    reactionDescription = v11->_reactionDescription;
    v11->_reactionDescription = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    emoji = v11->_emoji;
    v11->_emoji = (NSString *)v14;

  }
  return v11;
}

- (INMessageReaction)initWithReactionType:(int64_t)a3 reactionDescription:(id)a4 emoji:(id)a5 sticker:(id)a6
{
  id v10;
  id v11;
  id v12;
  INMessageReaction *v13;
  INMessageReaction *v14;
  uint64_t v15;
  NSString *reactionDescription;
  uint64_t v17;
  NSString *emoji;
  uint64_t v19;
  INSticker *sticker;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)INMessageReaction;
  v13 = -[INMessageReaction init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_reactionType = a3;
    v15 = objc_msgSend(v10, "copy");
    reactionDescription = v14->_reactionDescription;
    v14->_reactionDescription = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    emoji = v14->_emoji;
    v14->_emoji = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    sticker = v14->_sticker;
    v14->_sticker = (INSticker *)v19;

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reactionType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_reactionDescription, "hash");
  v6 = v5 ^ -[NSString hash](self->_emoji, "hash");
  v7 = v6 ^ -[INSticker hash](self->_sticker, "hash") ^ v4;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  INMessageReaction *v4;
  INMessageReaction *v5;
  NSString *reactionDescription;
  NSString *emoji;
  INSticker *sticker;
  BOOL v9;

  v4 = (INMessageReaction *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9 = 0;
      if (self->_reactionType == v5->_reactionType)
      {
        reactionDescription = self->_reactionDescription;
        if (reactionDescription == v5->_reactionDescription
          || -[NSString isEqual:](reactionDescription, "isEqual:"))
        {
          emoji = self->_emoji;
          if (emoji == v5->_emoji || -[NSString isEqual:](emoji, "isEqual:"))
          {
            sticker = self->_sticker;
            if (sticker == v5->_sticker || -[INSticker isEqual:](sticker, "isEqual:"))
              v9 = 1;
          }
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INMessageReaction)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  INMessageReaction *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reactionType"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("reactionDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("emoji"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sticker"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[INMessageReaction initWithReactionType:reactionDescription:emoji:sticker:](self, "initWithReactionType:reactionDescription:emoji:sticker:", v5, v9, v13, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t reactionType;
  id v5;

  reactionType = self->_reactionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", reactionType, CFSTR("reactionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reactionDescription, CFSTR("reactionDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emoji, CFSTR("emoji"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sticker, CFSTR("sticker"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INMessageReactionTypeGetName(self->_reactionType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("reactionType"));

  objc_msgSend(v6, "encodeObject:", self->_reactionDescription);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("reactionDescription"));

  objc_msgSend(v6, "encodeObject:", self->_emoji);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("emoji"));

  objc_msgSend(v6, "encodeObject:", self->_sticker);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("sticker"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INMessageReaction descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INMessageReaction;
  -[INMessageReaction description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INMessageReaction _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSString *reactionDescription;
  void *v5;
  NSString *emoji;
  void *v7;
  INSticker *sticker;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("reactionType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reactionType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("reactionDescription");
  reactionDescription = self->_reactionDescription;
  v5 = reactionDescription;
  if (!reactionDescription)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v5;
  v12[2] = CFSTR("emoji");
  emoji = self->_emoji;
  v7 = emoji;
  if (!emoji)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v7;
  v12[3] = CFSTR("sticker");
  sticker = self->_sticker;
  v9 = sticker;
  if (!sticker)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (sticker)
  {
    if (emoji)
      goto LABEL_9;
LABEL_12:

    if (reactionDescription)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!emoji)
    goto LABEL_12;
LABEL_9:
  if (!reactionDescription)
    goto LABEL_13;
LABEL_10:

  return v10;
}

- (int64_t)reactionType
{
  return self->_reactionType;
}

- (NSString)reactionDescription
{
  return self->_reactionDescription;
}

- (NSString)emoji
{
  return self->_emoji;
}

- (INSticker)sticker
{
  return self->_sticker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sticker, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_reactionDescription, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reactionType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = INMessageReactionTypeWithString(v9);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reactionDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("emoji"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sticker"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReactionType:reactionDescription:emoji:sticker:", v10, v11, v12, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
