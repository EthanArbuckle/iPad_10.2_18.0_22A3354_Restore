@implementation CKXVersionedReaderWriterStore

+ (BOOL)versionSupported:(unsigned __int8)a3
{
  return (a3 & 0xFE) == 2;
}

- (CKXVersionedReaderWriterStore)initWithBinding:(id)a3 optionsByReaderWriterClass:(id)a4
{
  id v7;
  id v8;
  CKXVersionedReaderWriterStore *v9;
  CKXVersionedReaderWriterStore *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKXVersionedReaderWriterStore;
  v9 = -[CKXVersionedReaderWriterStore init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_binding, a3);
    objc_storeStrong((id *)&v10->_optionsByReaderWriterClass, a4);
  }

  return v10;
}

- (id)readerForVersion:(unsigned __int8)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_createReaderForVersionIfNecessary_, a3);
}

- (id)writerForVersion:(unsigned __int8)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_createWriterForVersionIfNecessary_, a3);
}

- (id)createReaderForVersionIfNecessary:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  CKXORCReader *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;

  v3 = a3;
  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_versionSupported_(v5, v6, v3);
  v10 = 0;
  if ((v3 & 0xFE) == 2 && v9)
  {
    objc_msgSend_orcReader(self, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v14 = [CKXORCReader alloc];
      objc_msgSend_binding(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_schema(v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_binding(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_orcHelpers(v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_optionsByReaderWriterClass(self, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v29, v32, (uint64_t)v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend_initWithSchema_helpers_options_(v14, v34, (uint64_t)v20, v26, v33);
      objc_msgSend_setOrcReader_(self, v36, (uint64_t)v35);

    }
    objc_msgSend_orcReader(self, v12, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createWriterForVersionIfNecessary:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  CKXORCWriter *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;

  v3 = a3;
  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_versionSupported_(v5, v6, v3);
  v10 = 0;
  if ((v3 & 0xFE) == 2 && v9)
  {
    objc_msgSend_orcWriter(self, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v14 = [CKXORCWriter alloc];
      objc_msgSend_binding(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_schema(v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_binding(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_orcHelpers(v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_optionsByReaderWriterClass(self, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v29, v32, (uint64_t)v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend_initWithSchema_helpers_options_(v14, v34, (uint64_t)v20, v26, v33);
      objc_msgSend_setOrcWriter_(self, v36, (uint64_t)v35);

    }
    objc_msgSend_orcWriter(self, v12, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (CKXORCReader)orcReader
{
  return self->_orcReader;
}

- (void)setOrcReader:(id)a3
{
  objc_storeStrong((id *)&self->_orcReader, a3);
}

- (CKXORCWriter)orcWriter
{
  return self->_orcWriter;
}

- (void)setOrcWriter:(id)a3
{
  objc_storeStrong((id *)&self->_orcWriter, a3);
}

- (CKXBinding)binding
{
  return self->_binding;
}

- (void)setBinding:(id)a3
{
  objc_storeStrong((id *)&self->_binding, a3);
}

- (NSDictionary)optionsByReaderWriterClass
{
  return self->_optionsByReaderWriterClass;
}

- (void)setOptionsByReaderWriterClass:(id)a3
{
  objc_storeStrong((id *)&self->_optionsByReaderWriterClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsByReaderWriterClass, 0);
  objc_storeStrong((id *)&self->_binding, 0);
  objc_storeStrong((id *)&self->_orcWriter, 0);
  objc_storeStrong((id *)&self->_orcReader, 0);
}

@end
