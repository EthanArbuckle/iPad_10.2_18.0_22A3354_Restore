@implementation RAWTIFFIFDTable

- (RAWTIFFIFDTable)initWithValueBlock:(id)a3 forwardNamespace:(id)a4 reverseNamespace:(id)a5
{
  id v8;
  id v9;
  id v10;
  RAWTIFFIFDTable *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  RAWTIFFIFDTable *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)RAWTIFFIFDTable;
  v11 = -[RAWTIFFIFDTable init](&v23, sel_init);
  v15 = v11;
  if (v11)
  {
    objc_msgSend_setMValueBlock_(v11, v12, (uint64_t)v8, v13, v14);
    objc_msgSend_setMNamespace_(v15, v16, (uint64_t)v9, v17, v18);
    objc_msgSend_setMNamespaceReverse_(v15, v19, (uint64_t)v10, v20, v21);
  }

  return v15;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  (*((void (**)(void))self->mValueBlock + 2))();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectAtIndexedSubscript_(v6, v7, a3, v8, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  NSLog(CFSTR("set"), a2, a3, a4);
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v4 = a3;
  objc_msgSend_mNamespaceReverse(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("TagID"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->mValueBlock + 2))();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_unsignedIntValue(v17, v19, v20, v21, v22);
  objc_msgSend_objectAtIndexedSubscript_(v18, v24, v23, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  NSLog(CFSTR("set"), a2, a3, a4);
}

- (id)mValueBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setMValueBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSDictionary)mNamespace
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMNamespace:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)mNamespaceReverse
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMNamespaceReverse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNamespaceReverse, 0);
  objc_storeStrong((id *)&self->mNamespace, 0);
  objc_storeStrong(&self->mValueBlock, 0);
}

@end
