@implementation CCItemMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerData, 0);
}

+ (id)contentMessageForItemType:(unsigned __int16)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  CCTypeIdentifierRegistryBridge();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "itemMessageSubclassForItemType:", v6);

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "contentMessageClass")), "initWithData:error:", v7, a5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided item type %hu is not a valid item identifier"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCUnrecognizedIdentifierErrorForDescription(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a5, v12);

    v10 = 0;
  }

  return v10;
}

+ (id)metaContentMessageForItemType:(unsigned __int16)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  CCTypeIdentifierRegistryBridge();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "itemMessageSubclassForItemType:", v6);

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "metaContentMessageClass")), "initWithData:error:", v7, a5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided item type %hu is not a valid item identifier"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCUnrecognizedIdentifierErrorForDescription(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a5, v12);

    v10 = 0;
  }

  return v10;
}

- (CCItemMessage)initWithData:(id)a3 error:(id *)a4
{
  id v7;
  BOOL v8;
  id v9;
  objc_class *v10;
  char IsInstanceOfExpectedClass;
  id v12;
  CCItemMessage *v13;
  NSData *innerData;
  _BOOL4 v15;
  id v16;
  CCItemMessage *v17;
  id v19;
  objc_super v20;
  id v21;
  id v22;

  v7 = a3;
  if (-[CCItemMessage isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Cannot use base classes directly. Please use CCItemMessage"));
  v22 = 0;
  v8 = CCValidateNonNilField((uint64_t)CFSTR("data"), (uint64_t)v7, &v22);
  v9 = v22;
  if (!v8)
  {
    CCSetError(a4, v9);

LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  v10 = (objc_class *)objc_opt_class();
  v21 = v9;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass(CFSTR("data"), v7, v10, &v21);
  v12 = v21;

  if ((IsInstanceOfExpectedClass & 1) == 0)
  {
    CCSetError(a4, v12);

    goto LABEL_13;
  }
  v20.receiver = self;
  v20.super_class = (Class)CCItemMessage;
  v13 = -[CCItemMessage init](&v20, sel_init);
  self = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_innerData, a3);
  innerData = self->_innerData;
  v19 = v12;
  v15 = -[CCItemMessage initializeFieldValuesFromData:error:](self, "initializeFieldValuesFromData:error:", innerData, &v19);
  v16 = v19;

  if (!v15 || v16)
  {
    CCSetError(a4, v16);

    goto LABEL_13;
  }
  self = self;
  v17 = self;
LABEL_14:

  return v17;
}

- (NSData)innerData
{
  return self->_innerData;
}

+ (unsigned)itemType
{
  return CCTypeIdentifierUnknown;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return 0;
}

+ (Class)contentMessageClass
{
  return 0;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)recursivelyEnumerateFieldsWithError:(id *)a3 usingBlock:(id)a4
{
  return -[CCItemMessage recursivelyEnumerateFieldsWithError:forParentField:isRepeatedSubMessage:repeatedSubMessageIndex:usingBlock:](self, "recursivelyEnumerateFieldsWithError:forParentField:isRepeatedSubMessage:repeatedSubMessageIndex:usingBlock:", a3, 0, 0, 0, a4);
}

- (BOOL)recursivelyEnumerateFieldsWithError:(id *)a3 forParentField:(id)a4 isRepeatedSubMessage:(BOOL)a5 repeatedSubMessageIndex:(unsigned int)a6 usingBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  uint64_t *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v11 = a4;
  v12 = a7;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__9;
  v30 = __Block_byref_object_dispose__9;
  v31 = 0;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __124__CCItemMessage_recursivelyEnumerateFieldsWithError_forParentField_isRepeatedSubMessage_repeatedSubMessageIndex_usingBlock___block_invoke;
  v21 = &unk_250991178;
  v13 = v11;
  v25 = a6;
  v22 = v13;
  v24 = &v26;
  v14 = v12;
  v23 = v14;
  v15 = (void *)MEMORY[0x23B820934](&v18);
  -[CCItemMessage enumerateFieldsUsingBlock:parentFieldType:](self, "enumerateFieldsUsingBlock:parentFieldType:", v15, objc_msgSend(v13, "fieldType", v18, v19, v20, v21));
  if (a3)
    *a3 = objc_retainAutorelease((id)v27[5]);
  v16 = v27[5] == 0;

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __124__CCItemMessage_recursivelyEnumerateFieldsWithError_forParentField_isRepeatedSubMessage_repeatedSubMessageIndex_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id obj;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "setParentMessageField:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setRepeatedSubMessageIndex:", *(unsigned int *)(a1 + 56));
  if (objc_msgSend(v3, "dataType") == 18)
  {
    objc_msgSend(v3, "subMessageValueNoCopy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v6 + 40);
    objc_msgSend(v4, "recursivelyEnumerateFieldsWithError:forParentField:isRepeatedSubMessage:repeatedSubMessageIndex:usingBlock:", &obj, v3, 0, 0, v5);
    objc_storeStrong((id *)(v6 + 40), obj);
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v3, "dataType") == 19)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v3, "repeatedSubMessageValueNoCopy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v4);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
          v13 = *(_QWORD *)(a1 + 40);
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v21 = *(id *)(v14 + 40);
          objc_msgSend(v12, "recursivelyEnumerateFieldsWithError:forParentField:isRepeatedSubMessage:repeatedSubMessageIndex:usingBlock:", &v21, v3, 1, v9 + v11, v13);
          objc_storeStrong((id *)(v14 + 40), v21);
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        v9 = (v9 + v11);
      }
      while (v8);
    }
    goto LABEL_11;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v3, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v3, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CCErrorByJoiningMismatchedFieldAccessorErrorUnderlyingErrors(v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CCItemMessage data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[CCItemMessage data](self, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToData:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CCItemMessage data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  id v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@ - itemType: %hu"), v4, objc_msgSend((id)objc_opt_class(), "itemType"));

  return v5;
}

- (id)jsonDictionary
{
  return (id)objc_opt_new();
}

- (CCItemMessage)initWithJSONDictionary:(id)a3 error:(id *)a4
{

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)-[NSData copy](self->_innerData, "copy");
  v6 = (void *)objc_msgSend(v4, "initWithData:error:", v5, 0);

  return v6;
}

@end
