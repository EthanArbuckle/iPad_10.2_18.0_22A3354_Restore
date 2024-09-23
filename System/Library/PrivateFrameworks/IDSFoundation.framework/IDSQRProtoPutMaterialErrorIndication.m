@implementation IDSQRProtoPutMaterialErrorIndication

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoPutMaterialErrorIndication;
  -[IDSQRProtoPutMaterialErrorIndication description](&v13, sel_description);
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
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  IDSQRProtoMaterialOwner *materialOwner;
  void *v15;
  const char *v16;
  double v17;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v6, self->_receiverParticipantId, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, CFSTR("receiver_participant_id"));

  materialOwner = self->_materialOwner;
  if (materialOwner)
  {
    objc_msgSend_dictionaryRepresentation(materialOwner, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v16, (uint64_t)v15, v17, CFSTR("material_owner"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPutMaterialErrorIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint64Field();
  if (!self->_materialOwner)
    sub_19BAF8D1C();
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  double v3;

  *((_QWORD *)a3 + 1) = self->_receiverParticipantId;
  objc_msgSend_setMaterialOwner_(a3, a2, (uint64_t)self->_materialOwner, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  _QWORD *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v12[1] = self->_receiverParticipantId;
  v15 = objc_msgSend_copyWithZone_(self->_materialOwner, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[2];
  v12[2] = v15;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  IDSQRProtoMaterialOwner *materialOwner;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) && self->_receiverParticipantId == v4[1])
  {
    materialOwner = self->_materialOwner;
    v11 = v4[2];
    if ((unint64_t)materialOwner | v11)
      isEqual = objc_msgSend_isEqual_(materialOwner, v8, v11, v9);
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
  double v3;
  unint64_t v4;

  v4 = 2654435761u * self->_receiverParticipantId;
  return objc_msgSend_hash(self->_materialOwner, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  double v5;
  IDSQRProtoMaterialOwner *materialOwner;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  self->_receiverParticipantId = v4[1];
  materialOwner = self->_materialOwner;
  v7 = v4[2];
  if (materialOwner)
  {
    if (v7)
    {
      v8 = v4;
      objc_msgSend_mergeFrom_(materialOwner, (const char *)v4, v7, v5);
LABEL_6:
      v4 = v8;
    }
  }
  else if (v7)
  {
    v8 = v4;
    objc_msgSend_setMaterialOwner_(self, (const char *)v4, v7, v5);
    goto LABEL_6;
  }

}

- (unint64_t)receiverParticipantId
{
  return self->_receiverParticipantId;
}

- (void)setReceiverParticipantId:(unint64_t)a3
{
  self->_receiverParticipantId = a3;
}

- (IDSQRProtoMaterialOwner)materialOwner
{
  return self->_materialOwner;
}

- (void)setMaterialOwner:(id)a3
{
  objc_storeStrong((id *)&self->_materialOwner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialOwner, 0);
}

@end
