@implementation CKDPSiteIdentifier

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasModifier
{
  return self->_modifier != 0;
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
  v13.super_class = (Class)CKDPSiteIdentifier;
  -[CKDPSiteIdentifier description](&v13, sel_description);
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
  void *v7;
  NSData *identifier;
  NSData *modifier;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)identifier, (uint64_t)CFSTR("identifier"));
  modifier = self->_modifier;
  if (modifier)
    objc_msgSend_setObject_forKey_(v7, v6, (uint64_t)modifier, (uint64_t)CFSTR("modifier"));
  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPSiteIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_modifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSData *identifier;
  NSData *modifier;
  id v9;

  v4 = a3;
  identifier = self->_identifier;
  v9 = v4;
  if (identifier)
  {
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier, v6);
    v4 = v9;
  }
  modifier = self->_modifier;
  if (modifier)
  {
    objc_msgSend_setModifier_(v9, v5, (uint64_t)modifier, v6);
    v4 = v9;
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
  _QWORD *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_identifier, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[1];
  v12[1] = v15;

  v19 = objc_msgSend_copyWithZone_(self->_modifier, v17, (uint64_t)a3, v18);
  v20 = (void *)v12[2];
  v12[2] = v19;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *identifier;
  uint64_t v11;
  NSData *modifier;
  uint64_t v13;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((identifier = self->_identifier, v11 = v4[1], !((unint64_t)identifier | v11))
     || objc_msgSend_isEqual_(identifier, v8, v11, v9)))
  {
    modifier = self->_modifier;
    v13 = v4[2];
    if ((unint64_t)modifier | v13)
      isEqual = objc_msgSend_isEqual_(modifier, v8, v13, v9);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend_hash(self->_identifier, a2, v2, v3);
  return objc_msgSend_hash(self->_modifier, v6, v7, v8) ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v7 = v4[1];
  v9 = v4;
  if (v7)
  {
    objc_msgSend_setIdentifier_(self, v5, v7, v6);
    v4 = v9;
  }
  v8 = v4[2];
  if (v8)
  {
    objc_msgSend_setModifier_(self, v5, v8, v6);
    v4 = v9;
  }

}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)modifier
{
  return self->_modifier;
}

- (void)setModifier:(id)a3
{
  objc_storeStrong((id *)&self->_modifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
