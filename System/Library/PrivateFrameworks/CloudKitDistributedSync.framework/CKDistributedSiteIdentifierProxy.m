@implementation CKDistributedSiteIdentifierProxy

- (unint64_t)size
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_identifierSize(self, a2, v2);
  return objc_msgSend_modifierSize(self, v5, v6) + v4;
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
    objc_msgSend_dataForToken_(self, v9, v8[2]);
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
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[2]);

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

- (unint64_t)modifierSize
{
  uint64_t v3;
  char v4;

  v4 = 0;
  v3 = 0;
  objc_msgSend_copyModifierBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4)
    return 0;
  else
    return v3 + 8;
}

- (id)modifier
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
    objc_msgSend_dataForToken_(self, v9, v8[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyModifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
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
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[3]);

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

- (id)siteIdentifier
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0C94CF8]);
  objc_msgSend_identifier(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifier(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithIdentifier_modifier_(v3, v10, (uint64_t)v6, v9);

  return v11;
}

@end
