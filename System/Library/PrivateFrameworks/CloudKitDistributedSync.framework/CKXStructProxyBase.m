@implementation CKXStructProxyBase

- (id)initInternal
{
  _QWORD *v2;
  CKXStructProxyChildCache *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKXStructProxyBase;
  v2 = -[CKXProxyBase initInternal](&v8, sel_initInternal);
  if (v2)
  {
    v3 = [CKXStructProxyChildCache alloc];
    v5 = objc_msgSend_initWithProxy_(v3, v4, (uint64_t)v2);
    v6 = (void *)v2[4];
    v2[4] = v5;

  }
  return v2;
}

- (void)associateWithStructInstance:(id *)a3
{
  unint64_t var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_structInstance.structToken = *(_OWORD *)&a3->var0;
  self->_structInstance.offset = var2;
}

- (void)reset
{
  const char *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKXStructProxyBase;
  -[CKXProxyBase reset](&v5, sel_reset);
  self->_structInstance.structToken = -1;
  objc_msgSend_reset(self->_childProxyCache, v3, v4);
}

- (void)copyBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5 forToken:(unint64_t)a6
{
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  char IsNull_inStruct;
  const char *v23;
  void *v24;
  const char *v25;
  unint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  _OWORD v30[2];
  _OWORD v31[2];
  _BYTE v32[24];
  _BYTE v33[24];
  __int128 v34;
  __int128 v35;

  objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  objc_msgSend_readerForProxy_(v11, v12, (uint64_t)self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_structInstance(self, v14, v15);
  if (v13)
  {
    objc_msgSend_referencedListForReference_inStruct_(v13, v16, a6, v33);
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }

  objc_msgSend_readerForProxy_(v11, v17, (uint64_t)self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_structInstance(self, v19, v20);
  IsNull_inStruct = objc_msgSend_referenceIsNull_inStruct_(v18, v21, a6, v32);

  objc_msgSend_readerForProxy_(v11, v23, (uint64_t)self);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v34;
  v31[1] = v35;
  v26 = objc_msgSend_lengthForList_(v24, v25, (uint64_t)v31);

  objc_msgSend_readerForProxy_(v11, v27, (uint64_t)self);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v34;
  v30[1] = v35;
  objc_msgSend_copyData_forList_(v28, v29, (uint64_t)a3, v30);

  if (a4)
    *a4 = v26;
  if (a5)
    *a5 = IsNull_inStruct;

}

- (id)dataForToken:(unint64_t)a3
{
  void *v5;
  void *v6;
  const char *v7;
  id v8;
  const char *v9;
  char v11;
  size_t count;

  count = 0;
  v11 = 0;
  objc_msgSend_copyBytes_length_isNull_forToken_(self, a2, 0, &count, &v11, a3);
  v5 = 0;
  if (!v11)
  {
    v6 = malloc_type_calloc(count, 1uLL, 0x100004077774924uLL);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v7, (uint64_t)v6, 0, 0, a3);
    v8 = objc_alloc(MEMORY[0x1E0C99D50]);
    v5 = (void *)objc_msgSend_initWithBytesNoCopy_length_(v8, v9, (uint64_t)v6, count);
  }
  return v5;
}

- (id)stringForToken:(unint64_t)a3
{
  void *v5;
  void *v6;
  const char *v7;
  id v8;
  const char *v9;
  char v11;
  size_t count;

  count = 0;
  v11 = 0;
  objc_msgSend_copyBytes_length_isNull_forToken_(self, a2, 0, &count, &v11, a3);
  v5 = 0;
  if (!v11)
  {
    v6 = malloc_type_calloc(count, 1uLL, 0x100004077774924uLL);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v7, (uint64_t)v6, 0, 0, a3);
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (void *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v8, v9, (uint64_t)v6, count, 4, 1);
  }
  return v5;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)structInstance
{
  *($AD4A14DED6A629483A3530B31B20959D *)retstr = *($AD4A14DED6A629483A3530B31B20959D *)((char *)self + 40);
  return self;
}

- (CKXStructProxyChildCache)childProxyCache
{
  return self->_childProxyCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childProxyCache, 0);
}

@end
