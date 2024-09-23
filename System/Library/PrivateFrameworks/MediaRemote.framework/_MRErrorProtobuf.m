@implementation _MRErrorProtobuf

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
}

- (BOOL)hasLocalizedFailureReason
{
  return self->_localizedFailureReason != 0;
}

- (void)clearUnderlyingErrors
{
  -[NSMutableArray removeAllObjects](self->_underlyingErrors, "removeAllObjects");
}

- (void)addUnderlyingErrors:(id)a3
{
  id v4;
  NSMutableArray *underlyingErrors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  underlyingErrors = self->_underlyingErrors;
  v8 = v4;
  if (!underlyingErrors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_underlyingErrors;
    self->_underlyingErrors = v6;

    v4 = v8;
    underlyingErrors = self->_underlyingErrors;
  }
  -[NSMutableArray addObject:](underlyingErrors, "addObject:", v4);

}

- (unint64_t)underlyingErrorsCount
{
  return -[NSMutableArray count](self->_underlyingErrors, "count");
}

- (id)underlyingErrorsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_underlyingErrors, "objectAtIndex:", a3);
}

+ (Class)underlyingErrorsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRErrorProtobuf;
  -[_MRErrorProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRErrorProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *domain;
  void *v6;
  NSString *localizedDescription;
  NSString *localizedFailureReason;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_code);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("code"));

  }
  localizedDescription = self->_localizedDescription;
  if (localizedDescription)
    objc_msgSend(v4, "setObject:forKey:", localizedDescription, CFSTR("localizedDescription"));
  localizedFailureReason = self->_localizedFailureReason;
  if (localizedFailureReason)
    objc_msgSend(v4, "setObject:forKey:", localizedFailureReason, CFSTR("localizedFailureReason"));
  if (-[NSMutableArray count](self->_underlyingErrors, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_underlyingErrors, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_underlyingErrors;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("underlyingErrors"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRErrorProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
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
  if (self->_domain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_localizedDescription)
    PBDataWriterWriteStringField();
  if (self->_localizedFailureReason)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_underlyingErrors;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_code;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_localizedDescription)
    objc_msgSend(v9, "setLocalizedDescription:");
  if (self->_localizedFailureReason)
    objc_msgSend(v9, "setLocalizedFailureReason:");
  if (-[_MRErrorProtobuf underlyingErrorsCount](self, "underlyingErrorsCount"))
  {
    objc_msgSend(v9, "clearUnderlyingErrors");
    v5 = -[_MRErrorProtobuf underlyingErrorsCount](self, "underlyingErrorsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[_MRErrorProtobuf underlyingErrorsAtIndex:](self, "underlyingErrorsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addUnderlyingErrors:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_code;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_localizedFailureReason, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_underlyingErrors;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addUnderlyingErrors:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *domain;
  NSString *localizedDescription;
  NSString *localizedFailureReason;
  NSMutableArray *underlyingErrors;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_code != *((_DWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](localizedDescription, "isEqual:"))
  {
    goto LABEL_15;
  }
  localizedFailureReason = self->_localizedFailureReason;
  if ((unint64_t)localizedFailureReason | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](localizedFailureReason, "isEqual:"))
      goto LABEL_15;
  }
  underlyingErrors = self->_underlyingErrors;
  if ((unint64_t)underlyingErrors | *((_QWORD *)v4 + 5))
    v9 = -[NSMutableArray isEqual:](underlyingErrors, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_domain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_code;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_localizedDescription, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_localizedFailureReason, "hash");
  return v7 ^ -[NSMutableArray hash](self->_underlyingErrors, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[_MRErrorProtobuf setDomain:](self, "setDomain:");
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_code = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[_MRErrorProtobuf setLocalizedDescription:](self, "setLocalizedDescription:");
  if (*((_QWORD *)v4 + 4))
    -[_MRErrorProtobuf setLocalizedFailureReason:](self, "setLocalizedFailureReason:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[_MRErrorProtobuf addUnderlyingErrors:](self, "addUnderlyingErrors:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (int)code
{
  return self->_code;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (NSString)localizedFailureReason
{
  return self->_localizedFailureReason;
}

- (void)setLocalizedFailureReason:(id)a3
{
  objc_storeStrong((id *)&self->_localizedFailureReason, a3);
}

- (NSMutableArray)underlyingErrors
{
  return self->_underlyingErrors;
}

- (void)setUnderlyingErrors:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingErrors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingErrors, 0);
  objc_storeStrong((id *)&self->_localizedFailureReason, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
