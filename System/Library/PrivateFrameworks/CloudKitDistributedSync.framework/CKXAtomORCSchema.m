@implementation CKXAtomORCSchema

- (CKXAtomORCSchema)initWithBinding:(id)a3 formatVersion:(unsigned __int8)a4
{
  unsigned int v4;
  id v7;
  const char *v8;
  uint64_t v9;
  CKXAtomORCSchema *v10;
  CKXAtomORCSchemaFormatVersionORCv2 *v11;
  const char *v12;
  uint64_t v13;
  void *implementation;
  const char *v15;
  void *v16;
  const char *v17;
  CKXAtomORCSchemaFormatVersionORC *v18;
  const char *v19;
  objc_super v21;

  v4 = a4;
  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKXAtomORCSchema;
  v10 = -[CKXAtomORCSchema init](&v21, sel_init);
  if (v10)
  {
    if (v4 < 2)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
      implementation = (void *)objc_claimAutoreleasedReturnValue();
      CKDSStringForBackingStoreFormatVersion(v4, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(implementation, v17, (uint64_t)a2, v10, CFSTR("CKXAtomORCSchema.mm"), 471, CFSTR("Invalid format version for ORC schema: %@"), v16);

LABEL_9:
      goto LABEL_10;
    }
    if (v4 == 2)
    {
      v18 = [CKXAtomORCSchemaFormatVersionORC alloc];
      v13 = objc_msgSend_initWithBinding_(v18, v19, (uint64_t)v7);
      goto LABEL_8;
    }
    if (v4 == 3)
    {
      v11 = [CKXAtomORCSchemaFormatVersionORCv2 alloc];
      v13 = objc_msgSend_initWithBinding_(v11, v12, (uint64_t)v7);
LABEL_8:
      implementation = v10->_implementation;
      v10->_implementation = (CKXORCHelpers *)v13;
      goto LABEL_9;
    }
  }
LABEL_10:

  return v10;
}

- (id)generateSchema
{
  uint64_t v2;

  return (id)objc_msgSend_generateSchema(self->_implementation, a2, v2);
}

- (void)configureColumnsWithRootColumn:(void *)a3
{
  objc_msgSend_configureColumnsWithRootColumn_(self->_implementation, a2, (uint64_t)a3);
}

- (unint64_t)topLevelIndexForStruct:(unint64_t)a3
{
  return objc_msgSend_topLevelIndexForStruct_(self->_implementation, a2, a3);
}

- (unint64_t)structReferenceIndexForReference:(unint64_t)a3
{
  return objc_msgSend_structReferenceIndexForReference_(self->_implementation, a2, a3);
}

- (unint64_t)listColumnIndexForReference:(unint64_t)a3
{
  return objc_msgSend_listColumnIndexForReference_(self->_implementation, a2, a3);
}

- (unint64_t)valueColumnIndexForField:(unint64_t)a3
{
  return objc_msgSend_valueColumnIndexForField_(self->_implementation, a2, a3);
}

- (CKXORCHelpers)implementation
{
  return self->_implementation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
}

@end
