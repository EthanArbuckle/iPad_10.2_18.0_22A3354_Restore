@implementation IDSQRProtoMaterialOwner

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoMaterialOwner;
  -[IDSQRProtoMaterialOwner dealloc](&v3, sel_dealloc);
}

- (unint64_t)materialTypesCount
{
  return self->_materialTypes.count;
}

- (int)materialTypes
{
  return self->_materialTypes.list;
}

- (void)clearMaterialTypes
{
  PBRepeatedInt32Clear();
}

- (void)addMaterialType:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)materialTypeAtIndex:(unint64_t)a3
{
  double v3;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_materialTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;

  p_materialTypes = &self->_materialTypes;
  count = self->_materialTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), v3, a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v12, v13, v14, v15);

  }
  return p_materialTypes->list[a3];
}

- (void)setMaterialTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)materialTypesAsString:(int)a3
{
  double v3;
  __CFString *v4;

  if (a3 < 0xF && ((0x78E1u >> a3) & 1) != 0)
  {
    v4 = off_1E3C213A8[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsMaterialTypes:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  int v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("UNDEFINED"), v5) & 1) != 0)
  {
    v8 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("PREKEY"), v7) & 1) != 0)
  {
    v8 = 11;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("AVCBLOB"), v10) & 1) != 0)
  {
    v8 = 12;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("MKM"), v12) & 1) != 0)
  {
    v8 = 13;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("SKM"), v14) & 1) != 0)
  {
    v8 = 14;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("MIRAGEKEY"), v16) & 1) != 0)
  {
    v8 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("MIRAGEBLOB"), v18) & 1) != 0)
  {
    v8 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, (uint64_t)CFSTR("IDS_CONTEXT_BLOB"), v20))
  {
    v8 = 7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

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
  v13.super_class = (Class)IDSQRProtoMaterialOwner;
  -[IDSQRProtoMaterialOwner description](&v13, sel_description);
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
  double v12;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_materialTypes;
  unint64_t count;
  const char *v15;
  void *v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  __CFString *v20;
  const char *v21;
  double v22;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v6, self->_participantId, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, CFSTR("participant_id"));

  p_materialTypes = &self->_materialTypes;
  count = self->_materialTypes.count;
  if (count)
  {
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v11, count, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (p_materialTypes->count)
    {
      v18 = 0;
      do
      {
        v19 = p_materialTypes->list[v18];
        if (v19 < 0xF && ((0x78E1u >> v19) & 1) != 0)
        {
          v20 = off_1E3C213A8[v19];
          objc_msgSend_addObject_(v16, v15, (uint64_t)v20, v17);
        }
        else
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("(unknown: %i)"), v17, p_materialTypes->list[v18]);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v16, v21, (uint64_t)v20, v22);
        }

        ++v18;
      }
      while (v18 < p_materialTypes->count);
    }
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v16, v17, CFSTR("material_type"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoMaterialOwnerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_materialTypes;
  unint64_t v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteUint64Field();
  p_materialTypes = &self->_materialTypes;
  if (p_materialTypes->count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < p_materialTypes->count);
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  const char *v19;
  double v20;
  _QWORD *v21;

  v21 = a3;
  v21[4] = self->_participantId;
  if (objc_msgSend_materialTypesCount(self, v4, v5, v6))
  {
    objc_msgSend_clearMaterialTypes(v21, v7, v8, v9);
    v13 = objc_msgSend_materialTypesCount(self, v10, v11, v12);
    if (v13)
    {
      v16 = v13;
      for (i = 0; i != v16; ++i)
      {
        v18 = objc_msgSend_materialTypeAtIndex_(self, v14, i, v15);
        objc_msgSend_addMaterialType_(v21, v19, v18, v20);
      }
    }
  }

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

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v12[4] = self->_participantId;
  PBRepeatedInt32Copy();
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  char IsEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) && self->_participantId == v4[4])
    IsEqual = PBRepeatedInt32IsEqual();
  else
    IsEqual = 0;

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = 2654435761u * self->_participantId;
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  const char *v14;
  double v15;
  id v16;

  v4 = a3;
  self->_participantId = v4[4];
  v16 = v4;
  v8 = objc_msgSend_materialTypesCount(v4, v5, v6, v7);
  if (v8)
  {
    v11 = v8;
    for (i = 0; i != v11; ++i)
    {
      v13 = objc_msgSend_materialTypeAtIndex_(v16, v9, i, v10);
      objc_msgSend_addMaterialType_(self, v14, v13, v15);
    }
  }

}

- (unint64_t)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(unint64_t)a3
{
  self->_participantId = a3;
}

@end
