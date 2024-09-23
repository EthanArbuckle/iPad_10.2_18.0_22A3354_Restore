@implementation CKDPListRange

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  int isReversed;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  id v46;

  v46 = a3;
  if (objc_msgSend_hasLeft(self, v6, v7) && objc_msgSend_hasRight(self, v8, v9))
  {
    objc_msgSend_left(self, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_index(v11, v12, v13);
    objc_msgSend_right(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == objc_msgSend_index(v17, v18, v19))
    {
      objc_msgSend_left(self, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      isReversed = objc_msgSend_isReversed(v22, v23, v24);
      objc_msgSend_right(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_isReversed(v28, v29, v30);

      if (isReversed == v31)
      {
        objc_msgSend_left(self, v8, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__CKLogToFileHandle_atDepth_(v33, v34, (uint64_t)v46, (a4 + 1));

        goto LABEL_14;
      }
    }
    else
    {

    }
  }
  if (qword_1ED702A60 != -1)
    dispatch_once(&qword_1ED702A60, &unk_1E7834300);
  objc_msgSend_writeData_(v46, v8, qword_1ED702A58);
  objc_msgSend_left(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (a4 + 1);
  objc_msgSend__CKLogToFileHandle_atDepth_(v37, v39, (uint64_t)v46, v38);

  if (qword_1ED702A70 != -1)
    dispatch_once(&qword_1ED702A70, &unk_1E7834320);
  objc_msgSend_writeData_(v46, v40, qword_1ED702A68);
  objc_msgSend_right(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__CKLogToFileHandle_atDepth_(v43, v44, (uint64_t)v46, v38);

  if (qword_1ED702A80 != -1)
    dispatch_once(&qword_1ED702A80, &unk_1E7834340);
  objc_msgSend_writeData_(v46, v45, qword_1ED702A78);
LABEL_14:

}

- (BOOL)hasLeft
{
  return self->_left != 0;
}

- (BOOL)hasRight
{
  return self->_right != 0;
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
  v11.super_class = (Class)CKDPListRange;
  -[CKDPListRange description](&v11, sel_description);
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
  CKDPListPosition *left;
  void *v8;
  const char *v9;
  CKDPListPosition *right;
  void *v11;
  const char *v12;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  left = self->_left;
  if (left)
  {
    objc_msgSend_dictionaryRepresentation(left, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("left"));

  }
  right = self->_right;
  if (right)
  {
    objc_msgSend_dictionaryRepresentation(right, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("right"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBC0194((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_left)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_right)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPListPosition *left;
  CKDPListPosition *right;
  id v8;

  v4 = a3;
  left = self->_left;
  v8 = v4;
  if (left)
  {
    objc_msgSend_setLeft_(v4, v5, (uint64_t)left);
    v4 = v8;
  }
  right = self->_right;
  if (right)
  {
    objc_msgSend_setRight_(v8, v5, (uint64_t)right);
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
  v12 = objc_msgSend_copyWithZone_(self->_left, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_right, v14, (uint64_t)a3);
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
  CKDPListPosition *left;
  uint64_t v9;
  CKDPListPosition *right;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((left = self->_left, v9 = v4[1], !((unint64_t)left | v9))
     || objc_msgSend_isEqual_(left, v7, v9)))
  {
    right = self->_right;
    v11 = v4[2];
    if ((unint64_t)right | v11)
      isEqual = objc_msgSend_isEqual_(right, v7, v11);
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

  v4 = objc_msgSend_hash(self->_left, a2, v2);
  return objc_msgSend_hash(self->_right, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPListPosition *left;
  uint64_t v6;
  CKDPListPosition *right;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  left = self->_left;
  v6 = v4[1];
  v9 = v4;
  if (left)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(left, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setLeft_(self, (const char *)v4, v6);
  }
  v4 = v9;
LABEL_7:
  right = self->_right;
  v8 = v4[2];
  if (right)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(right, (const char *)v4, v8);
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setRight_(self, (const char *)v4, v8);
    goto LABEL_12;
  }

}

- (CKDPListPosition)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
  objc_storeStrong((id *)&self->_left, a3);
}

- (CKDPListPosition)right
{
  return self->_right;
}

- (void)setRight:(id)a3
{
  objc_storeStrong((id *)&self->_right, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

@end
