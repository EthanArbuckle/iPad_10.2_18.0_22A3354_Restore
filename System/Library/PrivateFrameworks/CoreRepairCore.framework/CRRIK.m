@implementation CRRIK

- (CRRIK)init
{
  CRRIK *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CRRIK *v6;
  CRRIK *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRRIK;
  v2 = -[CRRIK init](&v9, sel_init);
  v6 = v2;
  if (v2 && !objc_msgSend_create(v2, v3, v4, v5))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (CRRIK)initWithKeyBlob:(id)a3
{
  id v4;
  CRRIK *v5;
  const char *v6;
  uint64_t v7;
  CRRIK *v8;
  CRRIK *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRRIK;
  v5 = -[CRRIK init](&v11, sel_init);
  v8 = v5;
  if (v5 && !objc_msgSend_createWithKeyBlob_(v5, v6, (uint64_t)v4, v7))
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

- (id)keyBlob
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v13;

  v5 = (void *)objc_msgSend_rk(self, a2, v2, v3);
  if (v5)
  {
    v13 = 0;
    v9 = (uint64_t *)objc_msgSend_rk(self, v6, v7, v8);
    v11 = sub_21455FA18(v9, &v13);
    v5 = 0;
    if (v11)
    {
      if (v13)
      {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v10, v11, v13);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v5;
}

- (id)pubKeyBlob
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v13;

  v5 = (void *)objc_msgSend_rk(self, a2, v2, v3);
  if (v5)
  {
    v13 = 0;
    v9 = (_QWORD *)objc_msgSend_rk(self, v6, v7, v8);
    v11 = sub_21455F848(v9, &v13);
    v5 = 0;
    if (v11)
    {
      if (v13)
      {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v10, v11, v13);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v5;
}

- (id)attestationBlob
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  void *v16;

  if (!objc_msgSend_rk(self, a2, v2, v3))
    return 0;
  v15 = 0;
  v16 = 0;
  v8 = (uint64_t *)objc_msgSend_rk(self, v5, v6, v7);
  if (!sub_21455FA24(v8, 0, 0, (uint64_t)&v16, (uint64_t)&v15) && v16 && v15)
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v9, (uint64_t)v16, v15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v16;
    v12 = (void *)v10;
    if (!v16)
      return v12;
  }
  else
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_2145674F8();

    v10 = 0;
    v12 = 0;
    v11 = v16;
    if (!v16)
      return v12;
  }
  free(v11);
  v12 = (void *)v10;
  return v12;
}

- (id)sign:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;

  v4 = a3;
  v8 = objc_msgSend_rk(self, v5, v6, v7);
  if (v4 && v8)
  {
    v12 = (uint64_t *)objc_msgSend_rk(self, v9, v10, v11);
    v13 = objc_retainAutorelease(v4);
    v17 = objc_msgSend_bytes(v13, v14, v15, v16);
    objc_msgSend_length(v13, v18, v19, v20);
    sub_21455F464(v12, 0, 0, v17);
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_214567558();

  }
  return 0;
}

- (BOOL)verify:(id)a3 signature:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  _QWORD *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;

  v6 = a3;
  v7 = a4;
  v11 = objc_msgSend_rk(self, v8, v9, v10);
  v15 = 0;
  if (v7 && v6 && v11)
  {
    v16 = (_QWORD *)objc_msgSend_rk(self, v12, v13, v14);
    v17 = objc_retainAutorelease(v6);
    v21 = objc_msgSend_bytes(v17, v18, v19, v20);
    v25 = objc_msgSend_length(v17, v22, v23, v24);
    v26 = objc_retainAutorelease(v7);
    v30 = objc_msgSend_bytes(v26, v27, v28, v29);
    v34 = objc_msgSend_length(v26, v31, v32, v33);
    if (sub_21455F5E4(v16, 0, 0, v21, v25, v30, v34))
    {
      handleForCategory(0);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_2145675E8();

      v15 = 0;
    }
    else
    {
      v15 = 1;
    }
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_purge(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CRRIK;
  -[CRRIK dealloc](&v5, sel_dealloc);
}

- (BOOL)create
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void **v8;
  void **v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t v28[8];
  uint64_t v29;
  void *v30;
  void **v31;
  uint64_t v32;
  aks_ref_key_s *v33;

  v32 = 1;
  v33 = 0;
  v30 = 0;
  v31 = 0;
  v29 = 0;
  v3 = (void *)MGCopyAnswer();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_214567648(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_12;
  }
  if (objc_msgSend_BOOLValue(v3, v4, v5, v6))
    v7 = 5;
  else
    v7 = 4;
  v8 = (void **)sub_21455EA5C(0);
  v31 = v8;
  if (!v8)
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_214567678(v11, v21, v22, v23, v24, v25, v26, v27);
LABEL_12:

    v19 = 0;
    goto LABEL_13;
  }
  v9 = v8;
  if (sub_21455EC5C(v8, 9, &v32))
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_214567768();
  }
  else if (sub_21455ECD0(v9, &v30, (size_t *)&v29))
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_214567708();
  }
  else
  {
    if (!sub_21455ED30(-1, 13, v7, (uint64_t)v30, v29, (void ***)&v33))
    {
      self->_rk = v33;
      v33 = 0;
      handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "RIK created successfully", v28, 2u);
      }
      v19 = 1;
      goto LABEL_27;
    }
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_2145676A8();
  }
  v19 = 0;
LABEL_27:

  sub_21455ECD4(&v31);
LABEL_13:
  if (v30)
    free(v30);
  if (v33)
    sub_21455EF5C((uint64_t *)&v33);

  return v19;
}

- (BOOL)createWithKeyBlob:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  int v15;
  BOOL v16;
  NSObject *v17;
  uint8_t v19[8];
  aks_ref_key_s *v20;

  v4 = a3;
  v5 = v4;
  v20 = 0;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    v10 = (const void *)objc_msgSend_bytes(v6, v7, v8, v9);
    v14 = objc_msgSend_length(v6, v11, v12, v13);
    v15 = sub_21455F00C(-1, v10, v14, (uint64_t *)&v20);
    v16 = v15 == 0;
    if (v15)
    {
      handleForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_2145677C8();
    }
    else
    {
      self->_rk = v20;
      v20 = 0;
      handleForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_214503000, v17, OS_LOG_TYPE_DEFAULT, "RIK created successfully", v19, 2u);
      }
    }

    if (v20)
      sub_21455EF5C((uint64_t *)&v20);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)purge
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  if (objc_msgSend_rk(self, a2, v2, v3))
  {
    sub_21455EF5C((uint64_t *)&self->_rk);
    MEMORY[0x24BEDD108](self, sel_setRk_, 0, v5);
  }
}

- (aks_ref_key_s)rk
{
  return self->_rk;
}

- (void)setRk:(aks_ref_key_s *)a3
{
  self->_rk = a3;
}

@end
