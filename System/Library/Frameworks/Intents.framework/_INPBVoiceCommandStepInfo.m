@implementation _INPBVoiceCommandStepInfo

- (void)setApplicationIdentifier:(id)a3
{
  NSString *v4;
  NSString *applicationIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  applicationIdentifier = self->_applicationIdentifier;
  self->_applicationIdentifier = v4;

}

- (BOOL)hasApplicationIdentifier
{
  return self->_applicationIdentifier != 0;
}

- (void)setCategory:(int)a3
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
    self->_category = a3;
  }
}

- (BOOL)hasCategory
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCategory:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)categoryAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0x15 && ((0x1FFDFFu >> v3) & 1) != 0)
  {
    v4 = off_1E2293348[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_INFORMATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_PLAY_AUDIO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_PLAY_VIDEO")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_ORDER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_NAVIGATION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_START")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_SHARE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CREATE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_SEARCH")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_TOGGLE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_DOWNLOAD")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_LOG")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CHECK_IN")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_WORKFLOW")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_REQUEST")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_SET")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CALL_AUDIO")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CALL_VIDEO")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_PLAY_SOUND")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_USER_ACTIVITY")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBVoiceCommandStepInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_INPBVoiceCommandStepInfo applicationIdentifier](self, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_INPBVoiceCommandStepInfo hasCategory](self, "hasCategory"))
    PBDataWriterWriteInt32Field();
  -[_INPBVoiceCommandStepInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (_INPBVoiceCommandStepInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBVoiceCommandStepInfo *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBVoiceCommandStepInfo *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBVoiceCommandStepInfo *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBVoiceCommandStepInfo initWithData:](self, "initWithData:", v6);

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
  -[_INPBVoiceCommandStepInfo data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBVoiceCommandStepInfo *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBVoiceCommandStepInfo init](+[_INPBVoiceCommandStepInfo allocWithZone:](_INPBVoiceCommandStepInfo, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_applicationIdentifier, "copyWithZone:", a3);
  -[_INPBVoiceCommandStepInfo setApplicationIdentifier:](v5, "setApplicationIdentifier:", v6);

  if (-[_INPBVoiceCommandStepInfo hasCategory](self, "hasCategory"))
    -[_INPBVoiceCommandStepInfo setCategory:](v5, "setCategory:", -[_INPBVoiceCommandStepInfo category](self, "category"));
  v7 = (void *)-[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  -[_INPBVoiceCommandStepInfo setName:](v5, "setName:", v7);

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
  int v12;
  int category;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[_INPBVoiceCommandStepInfo applicationIdentifier](self, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_15;
  -[_INPBVoiceCommandStepInfo applicationIdentifier](self, "applicationIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBVoiceCommandStepInfo applicationIdentifier](self, "applicationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_16;
  }
  else
  {

  }
  v12 = -[_INPBVoiceCommandStepInfo hasCategory](self, "hasCategory");
  if (v12 != objc_msgSend(v4, "hasCategory"))
    goto LABEL_16;
  if (-[_INPBVoiceCommandStepInfo hasCategory](self, "hasCategory"))
  {
    if (objc_msgSend(v4, "hasCategory"))
    {
      category = self->_category;
      if (category != objc_msgSend(v4, "category"))
        goto LABEL_16;
    }
  }
  -[_INPBVoiceCommandStepInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBVoiceCommandStepInfo name](self, "name");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[_INPBVoiceCommandStepInfo name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_applicationIdentifier, "hash");
  if (-[_INPBVoiceCommandStepInfo hasCategory](self, "hasCategory"))
    v4 = 2654435761 * self->_category;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_name, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applicationIdentifier)
  {
    -[_INPBVoiceCommandStepInfo applicationIdentifier](self, "applicationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("applicationIdentifier"));

  }
  if (-[_INPBVoiceCommandStepInfo hasCategory](self, "hasCategory"))
  {
    v6 = -[_INPBVoiceCommandStepInfo category](self, "category");
    v7 = v6 - 1;
    if ((v6 - 1) < 0x15 && ((0x1FFDFFu >> v7) & 1) != 0)
    {
      v8 = off_1E2293348[v7];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("category"));

  }
  if (self->_name)
  {
    -[_INPBVoiceCommandStepInfo name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

  }
  return v3;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (int)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
