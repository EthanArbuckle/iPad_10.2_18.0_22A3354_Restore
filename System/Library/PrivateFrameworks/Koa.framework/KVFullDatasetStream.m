@implementation KVFullDatasetStream

- (BOOL)registerItem:(id)a3 error:(id *)a4
{
  const char *v6;
  void *v7;
  char v8;

  objc_msgSend__cascadeItemFromItem_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = objc_msgSend_registerCascadeItem_error_(self, v6, (uint64_t)v7, (uint64_t)a4);
  else
    v8 = 0;

  return v8;
}

- (BOOL)registerCascadeItem:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a3;
  objc_msgSend_donation(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v12 = objc_msgSend_registerItem_error_(v10, v11, (uint64_t)v6, (uint64_t)&v17);

  v13 = v17;
  if ((v12 & 1) == 0)
  {
    sub_1B70E8948(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4 && v14)
      *a4 = objc_retainAutorelease(v14);

  }
  return v12;
}

- (unsigned)errorCode
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int16 v9;

  objc_msgSend_donation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_errorCode(v4, v5, v6, v7);
  if ((unint64_t)(v8 - 1) >= 0xB)
    v9 = 0;
  else
    v9 = v8 + 6;

  return v9;
}

@end
