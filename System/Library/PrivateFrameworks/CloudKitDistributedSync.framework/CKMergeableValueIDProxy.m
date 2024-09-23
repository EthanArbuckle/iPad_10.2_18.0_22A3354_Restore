@implementation CKMergeableValueIDProxy

- (unint64_t)size
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend_identifierSize(self, a2, v2);
  v7 = objc_msgSend_zoneNameSize(self, v5, v6) + v4;
  return v7 + objc_msgSend_zoneOwnerNameSize(self, v8, v9);
}

- (unint64_t)identifierSize
{
  uint64_t v3;
  char v4;

  v4 = 0;
  v3 = 0;
  objc_msgSend_copyIdentifierBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4)
    return 0;
  else
    return v3 + 8;
}

- (id)identifier
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  const char *v9;
  void *v10;

  objc_msgSend_backingStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataForToken_(self, v9, v8[21]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyIdentifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD *v12;
  const char *v13;
  void *v14;

  objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = v9;
    objc_msgSend_binding(v9, v10, v11);
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[21]);

    v9 = v14;
  }
  else
  {
    if (a4)
      *a4 = 0;
    if (a5)
      *a5 = 1;
  }

}

- (unint64_t)zoneNameSize
{
  uint64_t v3;
  char v4;

  v4 = 0;
  v3 = 0;
  objc_msgSend_copyZoneNameBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4)
    return 0;
  else
    return v3 + 8;
}

- (id)zoneName
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  const char *v9;
  void *v10;

  objc_msgSend_backingStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForToken_(self, v9, v8[22]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyZoneNameBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD *v12;
  const char *v13;
  void *v14;

  objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = v9;
    objc_msgSend_binding(v9, v10, v11);
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[22]);

    v9 = v14;
  }
  else
  {
    if (a4)
      *a4 = 0;
    if (a5)
      *a5 = 1;
  }

}

- (unint64_t)zoneOwnerNameSize
{
  uint64_t v3;
  char v4;

  v4 = 0;
  v3 = 0;
  objc_msgSend_copyZoneOwnerNameBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4)
    return 0;
  else
    return v3 + 8;
}

- (id)zoneOwnerName
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  const char *v9;
  void *v10;

  objc_msgSend_backingStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForToken_(self, v9, v8[23]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyZoneOwnerNameBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD *v12;
  const char *v13;
  void *v14;

  objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = v9;
    objc_msgSend_binding(v9, v10, v11);
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[23]);

    v9 = v14;
  }
  else
  {
    if (a4)
      *a4 = 0;
    if (a5)
      *a5 = 1;
  }

}

- (id)mergeableValueID
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = objc_alloc(MEMORY[0x1E0C94ED8]);
  objc_msgSend_identifier(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneOwnerName(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithData_zoneName_zoneOwner_(v3, v13, (uint64_t)v6, v9, v12);

  return v14;
}

@end
