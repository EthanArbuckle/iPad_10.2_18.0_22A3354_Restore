@implementation _INPBShareFileIntentResponse

- (void)setConfirm:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confirm = a3;
}

- (BOOL)hasConfirm
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConfirm:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setRecipients:(id)a3
{
  NSArray *v4;
  NSArray *recipients;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  recipients = self->_recipients;
  self->_recipients = v4;

}

- (void)clearRecipients
{
  -[NSArray removeAllObjects](self->_recipients, "removeAllObjects");
}

- (void)addRecipients:(id)a3
{
  id v4;
  NSArray *recipients;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  recipients = self->_recipients;
  v8 = v4;
  if (!recipients)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recipients;
    self->_recipients = v6;

    v4 = v8;
    recipients = self->_recipients;
  }
  -[NSArray addObject:](recipients, "addObject:", v4);

}

- (unint64_t)recipientsCount
{
  return -[NSArray count](self->_recipients, "count");
}

- (id)recipientsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_recipients, "objectAtIndexedSubscript:", a3);
}

- (void)setShareMode:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_shareMode = a3;
  }
}

- (BOOL)hasShareMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasShareMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)shareModeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E228B860[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsShareMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIRDROP")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAIL")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_success = a3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBShareFileIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBShareFileIntentResponse hasConfirm](self, "hasConfirm"))
    PBDataWriterWriteBOOLField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_recipients;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (-[_INPBShareFileIntentResponse hasShareMode](self, "hasShareMode", v10))
    PBDataWriterWriteInt32Field();
  if (-[_INPBShareFileIntentResponse hasSuccess](self, "hasSuccess"))
    PBDataWriterWriteBOOLField();

}

- (_INPBShareFileIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBShareFileIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBShareFileIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBShareFileIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBShareFileIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBShareFileIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBShareFileIntentResponse *v5;
  void *v6;

  v5 = -[_INPBShareFileIntentResponse init](+[_INPBShareFileIntentResponse allocWithZone:](_INPBShareFileIntentResponse, "allocWithZone:"), "init");
  if (-[_INPBShareFileIntentResponse hasConfirm](self, "hasConfirm"))
    -[_INPBShareFileIntentResponse setConfirm:](v5, "setConfirm:", -[_INPBShareFileIntentResponse confirm](self, "confirm"));
  v6 = (void *)-[NSArray copyWithZone:](self->_recipients, "copyWithZone:", a3);
  -[_INPBShareFileIntentResponse setRecipients:](v5, "setRecipients:", v6);

  if (-[_INPBShareFileIntentResponse hasShareMode](self, "hasShareMode"))
    -[_INPBShareFileIntentResponse setShareMode:](v5, "setShareMode:", -[_INPBShareFileIntentResponse shareMode](self, "shareMode"));
  if (-[_INPBShareFileIntentResponse hasSuccess](self, "hasSuccess"))
    -[_INPBShareFileIntentResponse setSuccess:](v5, "setSuccess:", -[_INPBShareFileIntentResponse success](self, "success"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int confirm;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int shareMode;
  int v17;
  BOOL v18;
  int success;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  v5 = -[_INPBShareFileIntentResponse hasConfirm](self, "hasConfirm");
  if (v5 != objc_msgSend(v4, "hasConfirm"))
    goto LABEL_17;
  if (-[_INPBShareFileIntentResponse hasConfirm](self, "hasConfirm"))
  {
    if (objc_msgSend(v4, "hasConfirm"))
    {
      confirm = self->_confirm;
      if (confirm != objc_msgSend(v4, "confirm"))
        goto LABEL_17;
    }
  }
  -[_INPBShareFileIntentResponse recipients](self, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBShareFileIntentResponse recipients](self, "recipients");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[_INPBShareFileIntentResponse recipients](self, "recipients");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recipients");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_17;
    }
    else
    {

    }
    v15 = -[_INPBShareFileIntentResponse hasShareMode](self, "hasShareMode");
    if (v15 == objc_msgSend(v4, "hasShareMode"))
    {
      if (!-[_INPBShareFileIntentResponse hasShareMode](self, "hasShareMode")
        || !objc_msgSend(v4, "hasShareMode")
        || (shareMode = self->_shareMode, shareMode == objc_msgSend(v4, "shareMode")))
      {
        v17 = -[_INPBShareFileIntentResponse hasSuccess](self, "hasSuccess");
        if (v17 == objc_msgSend(v4, "hasSuccess"))
        {
          if (!-[_INPBShareFileIntentResponse hasSuccess](self, "hasSuccess")
            || !objc_msgSend(v4, "hasSuccess")
            || (success = self->_success, success == objc_msgSend(v4, "success")))
          {
            v18 = 1;
            goto LABEL_18;
          }
        }
      }
    }
  }
  else
  {

  }
LABEL_17:
  v18 = 0;
LABEL_18:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (-[_INPBShareFileIntentResponse hasConfirm](self, "hasConfirm"))
    v3 = 2654435761 * self->_confirm;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_recipients, "hash");
  if (-[_INPBShareFileIntentResponse hasShareMode](self, "hasShareMode"))
    v5 = 2654435761 * self->_shareMode;
  else
    v5 = 0;
  if (-[_INPBShareFileIntentResponse hasSuccess](self, "hasSuccess"))
    v6 = 2654435761 * self->_success;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBShareFileIntentResponse hasConfirm](self, "hasConfirm"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBShareFileIntentResponse confirm](self, "confirm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("confirm"));

  }
  if (-[NSArray count](self->_recipients, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_recipients;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("recipients"));
  }
  if (-[_INPBShareFileIntentResponse hasShareMode](self, "hasShareMode"))
  {
    v12 = -[_INPBShareFileIntentResponse shareMode](self, "shareMode");
    if (v12 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E228B860[v12];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("shareMode"));

  }
  if (-[_INPBShareFileIntentResponse hasSuccess](self, "hasSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBShareFileIntentResponse success](self, "success"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("success"));

  }
  return v3;
}

- (BOOL)confirm
{
  return self->_confirm;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (int)shareMode
{
  return self->_shareMode;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
}

+ (Class)recipientsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
