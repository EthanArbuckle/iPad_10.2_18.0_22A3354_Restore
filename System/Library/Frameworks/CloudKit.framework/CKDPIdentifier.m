@implementation CKDPIdentifier

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  uint64_t v3;

  if ((a3 - 1) < 8)
    return off_1E1F65230[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("record"), v5) & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("device"), v7) & 1) != 0)
  {
    v8 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("subscription"), v10) & 1) != 0)
  {
    v8 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("share"), v12) & 1) != 0)
  {
    v8 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("comment"), v14) & 1) != 0)
  {
    v8 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("recordZone"), v16) & 1) != 0)
  {
    v8 = 6;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("user"), v18) & 1) != 0)
  {
    v8 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, (uint64_t)CFSTR("mergeableValue"), v20))
  {
    v8 = 8;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CKDPIdentifier;
  -[CKDPIdentifier description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSString *name;
  unsigned int v10;
  __CFString *v11;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  name = self->_name;
  if (name)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)name, (uint64_t)CFSTR("name"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = self->_type - 1;
    if (v10 >= 8)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_type);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E1F65230[v10];
    }
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)v11, (uint64_t)CFSTR("type"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSString *name;
  id v8;

  v4 = a3;
  name = self->_name;
  if (name)
  {
    v8 = v4;
    objc_msgSend_setName_(v4, v5, (uint64_t)name, v6);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_type;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_name, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 16) = self->_type;
    *(_BYTE *)(v12 + 20) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  BOOL v12;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_8;
  name = self->_name;
  v11 = v4[1];
  if ((unint64_t)name | v11)
  {
    if (!objc_msgSend_isEqual_(name, v8, v11, v9))
      goto LABEL_8;
  }
  v12 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_type == *((_DWORD *)v4 + 4))
    {
      v12 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v12 = 0;
  }
LABEL_9:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_hash(self->_name, a2, v2, v3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_type;
  else
    v6 = 0;
  return v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v7 = *((_QWORD *)v4 + 1);
  if (v7)
  {
    v8 = v4;
    objc_msgSend_setName_(self, v5, v7, v6);
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

@end
