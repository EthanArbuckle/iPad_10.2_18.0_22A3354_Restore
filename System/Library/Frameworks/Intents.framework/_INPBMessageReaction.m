@implementation _INPBMessageReaction

- (void)setEmoji:(id)a3
{
  NSString *v4;
  NSString *emoji;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  emoji = self->_emoji;
  self->_emoji = v4;

}

- (BOOL)hasEmoji
{
  return self->_emoji != 0;
}

- (void)setReactionDescription:(id)a3
{
  NSString *v4;
  NSString *reactionDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  reactionDescription = self->_reactionDescription;
  self->_reactionDescription = v4;

}

- (BOOL)hasReactionDescription
{
  return self->_reactionDescription != 0;
}

- (void)setReactionType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_reactionType = a3;
  }
}

- (BOOL)hasReactionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReactionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)reactionTypeAsString:(int)a3
{
  if ((a3 - 1) < 0xB)
    return off_1E228E830[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReactionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_LIKED_REACTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_DISLIKED_REACTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_EMPHASIZED_REACTION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_LOVED_REACTION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_QUESTIONED_REACTION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_LAUGHED_REACTION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DROPPED_STICKER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_STICKER")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_GENERATED_EMOJI")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMOJI")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GENERIC")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSticker:(id)a3
{
  objc_storeStrong((id *)&self->_sticker, a3);
}

- (BOOL)hasSticker
{
  return self->_sticker != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMessageReactionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_INPBMessageReaction emoji](self, "emoji");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBMessageReaction reactionDescription](self, "reactionDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_INPBMessageReaction hasReactionType](self, "hasReactionType"))
    PBDataWriterWriteInt32Field();
  -[_INPBMessageReaction sticker](self, "sticker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[_INPBMessageReaction sticker](self, "sticker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (_INPBMessageReaction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBMessageReaction *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBMessageReaction *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBMessageReaction *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBMessageReaction initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBMessageReaction data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBMessageReaction *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = -[_INPBMessageReaction init](+[_INPBMessageReaction allocWithZone:](_INPBMessageReaction, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_emoji, "copyWithZone:", a3);
  -[_INPBMessageReaction setEmoji:](v5, "setEmoji:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_reactionDescription, "copyWithZone:", a3);
  -[_INPBMessageReaction setReactionDescription:](v5, "setReactionDescription:", v7);

  if (-[_INPBMessageReaction hasReactionType](self, "hasReactionType"))
    -[_INPBMessageReaction setReactionType:](v5, "setReactionType:", -[_INPBMessageReaction reactionType](self, "reactionType"));
  v8 = -[_INPBSticker copyWithZone:](self->_sticker, "copyWithZone:", a3);
  -[_INPBMessageReaction setSticker:](v5, "setSticker:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int reactionType;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[_INPBMessageReaction emoji](self, "emoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emoji");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBMessageReaction emoji](self, "emoji");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBMessageReaction emoji](self, "emoji");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emoji");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBMessageReaction reactionDescription](self, "reactionDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reactionDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBMessageReaction reactionDescription](self, "reactionDescription");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBMessageReaction reactionDescription](self, "reactionDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reactionDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_21;
  }
  else
  {

  }
  v17 = -[_INPBMessageReaction hasReactionType](self, "hasReactionType");
  if (v17 != objc_msgSend(v4, "hasReactionType"))
    goto LABEL_21;
  if (-[_INPBMessageReaction hasReactionType](self, "hasReactionType"))
  {
    if (objc_msgSend(v4, "hasReactionType"))
    {
      reactionType = self->_reactionType;
      if (reactionType != objc_msgSend(v4, "reactionType"))
        goto LABEL_21;
    }
  }
  -[_INPBMessageReaction sticker](self, "sticker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sticker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBMessageReaction sticker](self, "sticker");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBMessageReaction sticker](self, "sticker");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sticker");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_emoji, "hash");
  v4 = -[NSString hash](self->_reactionDescription, "hash");
  if (-[_INPBMessageReaction hasReactionType](self, "hasReactionType"))
    v5 = 2654435761 * self->_reactionType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[_INPBSticker hash](self->_sticker, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_emoji)
  {
    -[_INPBMessageReaction emoji](self, "emoji");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("emoji"));

  }
  if (self->_reactionDescription)
  {
    -[_INPBMessageReaction reactionDescription](self, "reactionDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("reactionDescription"));

  }
  if (-[_INPBMessageReaction hasReactionType](self, "hasReactionType"))
  {
    v8 = -[_INPBMessageReaction reactionType](self, "reactionType");
    if ((v8 - 1) >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E228E830[(v8 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("reactionType"));

  }
  -[_INPBMessageReaction sticker](self, "sticker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sticker"));

  return v3;
}

- (NSString)emoji
{
  return self->_emoji;
}

- (NSString)reactionDescription
{
  return self->_reactionDescription;
}

- (int)reactionType
{
  return self->_reactionType;
}

- (_INPBSticker)sticker
{
  return self->_sticker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sticker, 0);
  objc_storeStrong((id *)&self->_reactionDescription, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
