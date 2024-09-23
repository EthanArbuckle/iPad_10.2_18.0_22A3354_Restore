@implementation CKDPFieldAction

- (BOOL)hasInsertIntoList
{
  return self->_insertIntoList != 0;
}

- (BOOL)hasDeleteListRange
{
  return self->_deleteListRange != 0;
}

- (BOOL)hasReplaceListRange
{
  return self->_replaceListRange != 0;
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
  v11.super_class = (Class)CKDPFieldAction;
  -[CKDPFieldAction description](&v11, sel_description);
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
  CKDPFieldActionInsertIntoList *insertIntoList;
  void *v8;
  const char *v9;
  CKDPFieldActionDeleteListRange *deleteListRange;
  void *v11;
  const char *v12;
  CKDPFieldActionReplaceListRange *replaceListRange;
  void *v14;
  const char *v15;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  insertIntoList = self->_insertIntoList;
  if (insertIntoList)
  {
    objc_msgSend_dictionaryRepresentation(insertIntoList, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("insert_into_list"));

  }
  deleteListRange = self->_deleteListRange;
  if (deleteListRange)
  {
    objc_msgSend_dictionaryRepresentation(deleteListRange, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("delete_list_range"));

  }
  replaceListRange = self->_replaceListRange;
  if (replaceListRange)
  {
    objc_msgSend_dictionaryRepresentation(replaceListRange, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("replace_list_range"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB9F2CC((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_insertIntoList)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_deleteListRange)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_replaceListRange)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPFieldActionInsertIntoList *insertIntoList;
  CKDPFieldActionDeleteListRange *deleteListRange;
  CKDPFieldActionReplaceListRange *replaceListRange;
  id v9;

  v4 = a3;
  insertIntoList = self->_insertIntoList;
  v9 = v4;
  if (insertIntoList)
  {
    objc_msgSend_setInsertIntoList_(v4, v5, (uint64_t)insertIntoList);
    v4 = v9;
  }
  deleteListRange = self->_deleteListRange;
  if (deleteListRange)
  {
    objc_msgSend_setDeleteListRange_(v9, v5, (uint64_t)deleteListRange);
    v4 = v9;
  }
  replaceListRange = self->_replaceListRange;
  if (replaceListRange)
  {
    objc_msgSend_setReplaceListRange_(v9, v5, (uint64_t)replaceListRange);
    v4 = v9;
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
  const char *v17;
  uint64_t v18;
  void *v19;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_insertIntoList, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_deleteListRange, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_replaceListRange, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPFieldActionInsertIntoList *insertIntoList;
  uint64_t v9;
  CKDPFieldActionDeleteListRange *deleteListRange;
  uint64_t v11;
  CKDPFieldActionReplaceListRange *replaceListRange;
  uint64_t v13;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((insertIntoList = self->_insertIntoList, v9 = v4[2], !((unint64_t)insertIntoList | v9))
     || objc_msgSend_isEqual_(insertIntoList, v7, v9))
    && ((deleteListRange = self->_deleteListRange, v11 = v4[1], !((unint64_t)deleteListRange | v11))
     || objc_msgSend_isEqual_(deleteListRange, v7, v11)))
  {
    replaceListRange = self->_replaceListRange;
    v13 = v4[3];
    if ((unint64_t)replaceListRange | v13)
      isEqual = objc_msgSend_isEqual_(replaceListRange, v7, v13);
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
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend_hash(self->_insertIntoList, a2, v2);
  v7 = objc_msgSend_hash(self->_deleteListRange, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_replaceListRange, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPFieldActionInsertIntoList *insertIntoList;
  uint64_t v6;
  CKDPFieldActionDeleteListRange *deleteListRange;
  uint64_t v8;
  CKDPFieldActionReplaceListRange *replaceListRange;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  insertIntoList = self->_insertIntoList;
  v6 = v4[2];
  v11 = v4;
  if (insertIntoList)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(insertIntoList, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setInsertIntoList_(self, (const char *)v4, v6);
  }
  v4 = v11;
LABEL_7:
  deleteListRange = self->_deleteListRange;
  v8 = v4[1];
  if (deleteListRange)
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_mergeFrom_(deleteListRange, (const char *)v4, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_setDeleteListRange_(self, (const char *)v4, v8);
  }
  v4 = v11;
LABEL_13:
  replaceListRange = self->_replaceListRange;
  v10 = v4[3];
  if (replaceListRange)
  {
    if (v10)
    {
      objc_msgSend_mergeFrom_(replaceListRange, (const char *)v4, v10);
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    objc_msgSend_setReplaceListRange_(self, (const char *)v4, v10);
    goto LABEL_18;
  }

}

- (CKDPFieldActionInsertIntoList)insertIntoList
{
  return self->_insertIntoList;
}

- (void)setInsertIntoList:(id)a3
{
  objc_storeStrong((id *)&self->_insertIntoList, a3);
}

- (CKDPFieldActionDeleteListRange)deleteListRange
{
  return self->_deleteListRange;
}

- (void)setDeleteListRange:(id)a3
{
  objc_storeStrong((id *)&self->_deleteListRange, a3);
}

- (CKDPFieldActionReplaceListRange)replaceListRange
{
  return self->_replaceListRange;
}

- (void)setReplaceListRange:(id)a3
{
  objc_storeStrong((id *)&self->_replaceListRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceListRange, 0);
  objc_storeStrong((id *)&self->_insertIntoList, 0);
  objc_storeStrong((id *)&self->_deleteListRange, 0);
}

@end
