@implementation CKDPShareIdentifier

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  v6 = (void *)MEMORY[0x1C3B83E24]();
  if (objc_msgSend_hasValue(self, v7, v8))
  {
    objc_msgSend_value(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__CKLogToFileHandle_atDepth_(v11, v12, (uint64_t)v21, (a4 + 1));

  }
  sub_1BEB2ED9C();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeData_(v21, v14, (uint64_t)v13);

  if (objc_msgSend_hasZoneIdentifier(self, v15, v16))
  {
    objc_msgSend_zoneIdentifier(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__CKLogToFileHandle_atDepth_(v19, v20, (uint64_t)v21, (a4 + 1));

  }
  objc_autoreleasePoolPop(v6);

}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPShareIdentifier;
  -[CKDPShareIdentifier description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPIdentifier *value;
  void *v8;
  const char *v9;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  void *v11;
  const char *v12;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  if (value)
  {
    objc_msgSend_dictionaryRepresentation(value, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("value"));

  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("zoneIdentifier"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPShareIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPIdentifier *value;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  id v8;

  v4 = a3;
  value = self->_value;
  v8 = v4;
  if (value)
  {
    objc_msgSend_setValue_(v4, v5, (uint64_t)value);
    v4 = v8;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v8, v5, (uint64_t)zoneIdentifier);
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_value, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPIdentifier *value;
  uint64_t v9;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((value = self->_value, v9 = v4[1], !((unint64_t)value | v9))
     || objc_msgSend_isEqual_(value, v7, v9)))
  {
    zoneIdentifier = self->_zoneIdentifier;
    v11 = v4[2];
    if ((unint64_t)zoneIdentifier | v11)
      isEqual = objc_msgSend_isEqual_(zoneIdentifier, v7, v11);
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
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_value, a2, v2);
  return objc_msgSend_hash(self->_zoneIdentifier, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPIdentifier *value;
  uint64_t v6;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  value = self->_value;
  v6 = v4[1];
  v9 = v4;
  if (value)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(value, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setValue_(self, (const char *)v4, v6);
  }
  v4 = v9;
LABEL_7:
  zoneIdentifier = self->_zoneIdentifier;
  v8 = v4[2];
  if (zoneIdentifier)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v8);
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v8);
    goto LABEL_12;
  }

}

- (CKDPIdentifier)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
