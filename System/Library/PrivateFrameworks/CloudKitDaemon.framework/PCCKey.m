@implementation PCCKey

- (PCCKey)init
{
  PCCKey *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PCCKey;
  v2 = -[PCCKey init](&v4, sel_init);
  if (v2)
    v2->_secret = (pcc_invocation_key *)sub_1BEC8AAC4();
  return v2;
}

- (id)encrypt:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v16;

  v4 = a3;
  v7 = objc_msgSend_length(v4, v5, v6);
  v8 = objc_retainAutorelease(v4);
  v11 = objc_msgSend_bytes(v8, v9, v10);

  v16 = v7 + 32;
  v12 = malloc_type_malloc(v7 + 32, 0x347E0090uLL);
  if (v12)
  {
    v13 = v12;
    if (sub_1BEC8AE4C((uint64_t)self->_secret, v11, v7, (uint64_t)v12, &v16))
    {
      free(v13);
      return 0;
    }
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v14, (uint64_t)v13, v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (id)decrypt:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *v13;
  void *v14;
  const char *v15;
  size_t v17;

  v4 = a3;
  v7 = objc_msgSend_length(v4, v5, v6);
  v8 = objc_retainAutorelease(v4);
  v11 = objc_msgSend_bytes(v8, v9, v10);

  if (v7 >= 0x20)
    v12 = v7 - 32;
  else
    v12 = 0;
  v17 = v12;
  v13 = malloc_type_malloc(v12, 0xB6BB72D3uLL);
  if (v13)
  {
    v14 = v13;
    if (sub_1BEC8AFAC((uint64_t)self->_secret, v11, v7, (uint64_t)v13, &v17))
    {
      free(v14);
      return 0;
    }
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v15, (uint64_t)v14, v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (void)clear
{
  cc_clear();
}

- (void)dealloc
{
  uint64_t v2;
  pcc_invocation_key *secret;
  objc_super v5;

  objc_msgSend_clear(self, a2, v2);
  secret = self->_secret;
  cc_clear();
  free(secret);
  v5.receiver = self;
  v5.super_class = (Class)PCCKey;
  -[PCCKey dealloc](&v5, sel_dealloc);
}

- (pcc_invocation_key)secret
{
  return self->_secret;
}

- (void)setSecret:(pcc_invocation_key *)a3
{
  self->_secret = a3;
}

@end
