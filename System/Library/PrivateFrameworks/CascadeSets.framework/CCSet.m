@implementation CCSet

- (unsigned)itemType
{
  return self->_itemType;
}

- (NSString)encodedDescriptors
{
  return self->_encodedDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedDescriptors, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_hash, 0);
}

- (CCSet)initWithItemType:(unsigned __int16)a3 encodedDescriptors:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  CCSet *v10;

  v6 = a3;
  v8 = a4;
  +[BMResourceDescriptor descriptorsFromEncodedString:error:](CCSetDescriptor, "descriptorsFromEncodedString:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self = -[CCSet initWithItemType:encodedDescriptors:descriptors:error:](self, "initWithItemType:encodedDescriptors:descriptors:error:", v6, v8, v9, a5);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CCSet)initWithItemType:(unsigned __int16)a3 encodedDescriptors:(id)a4 descriptors:(id)a5 error:(id *)a6
{
  uint64_t v9;
  id v11;
  id v12;
  CCSet *v13;
  CCSet *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BMAccount *account;
  uint64_t v19;
  NSNumber *hash;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CCSet *v26;
  void *v27;
  objc_super v29;

  v9 = a3;
  v11 = a4;
  v12 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CCSet;
  v13 = -[CCSet init](&v29, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_itemType = v9;
    objc_msgSend((id)objc_opt_class(), "descriptorWithKey:descriptors:", 0x2509935D0, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE0C088]), "initWithAccountIdentifier:", v16);
      account = v14->_account;
      v14->_account = (BMAccount *)v17;

    }
    objc_storeStrong((id *)&v14->_descriptors, a5);
    objc_storeStrong((id *)&v14->_encodedDescriptors, a4);
    objc_msgSend((id)objc_opt_class(), "_setHashFromItemType:encodedDescriptors:", v14->_itemType, v14->_encodedDescriptors);
    v19 = objc_claimAutoreleasedReturnValue();
    hash = v14->_hash;
    v14->_hash = (NSNumber *)v19;

  }
  CCTypeIdentifierRegistryBridge();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isValidItemType:", v9);

  if ((v22 & 1) != 0
    && (CCTypeIdentifierRegistryBridge(),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v23, "setIdentifierForItemType:", v9),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v24, "length"),
        v24,
        v23,
        v25))
  {
    v26 = v14;
  }
  else
  {
    CCInvalidSetItemTypeIdentifierErrorForIdentifier(v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a6, v27);

    v26 = 0;
  }

  return v26;
}

+ (id)descriptorWithKey:(id)a3 descriptors:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "key", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)setEnumerator
{
  return (id)objc_msgSend(a1, "setEnumeratorWithUseCase:", *MEMORY[0x24BE0C050]);
}

+ (id)setEnumeratorWithUseCase:(id)a3
{
  return +[CCDatabaseSetEnumerator defaultEnumeratorWithUseCase:](CCDatabaseSetEnumerator, "defaultEnumeratorWithUseCase:", a3);
}

+ (id)serializedSetEnumerator:(id)a3
{
  id v3;
  CCSerializedSetEnumerator *v4;

  v3 = a3;
  v4 = -[CCSerializedSetEnumerator initWithSerializedSetData:]([CCSerializedSetEnumerator alloc], "initWithSerializedSetData:", v3);

  return v4;
}

- (CCSet)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)_setHashFromItemType:(unsigned __int16)a3 encodedDescriptors:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v9;

  v9 = a3;
  v4 = a4;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "appendBytes:length:", &v9, 2);
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendData:", v6);
  CCHash64(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CCSet)initWithItemType:(unsigned __int16)a3 descriptors:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  CCSet *v10;

  v6 = a3;
  v8 = a4;
  +[BMResourceDescriptor encodedStringFromDescriptors:error:](CCSetDescriptor, "encodedStringFromDescriptors:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self = -[CCSet initWithItemType:encodedDescriptors:descriptors:error:](self, "initWithItemType:encodedDescriptors:descriptors:error:", v6, v9, v8, a5);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)descriptorWithKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "descriptorWithKey:descriptors:", v4, self->_descriptors);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)prefixedSharedIdentifier:(id)a3
{
  NSNumber *hash;
  void *v4;
  void *v5;

  hash = self->_hash;
  objc_msgSend(a3, "sharedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CCConcatenateHash64(hash, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)prefixedInstanceIdentifier:(id)a3
{
  NSNumber *hash;
  void *v4;
  void *v5;

  hash = self->_hash;
  objc_msgSend(a3, "instanceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CCConcatenateHash64(hash, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)changePublisher
{
  return -[CCSet changePublisherWithUseCase:](self, "changePublisherWithUseCase:", *MEMORY[0x24BE0C050]);
}

- (id)changePublisherWithUseCase:(id)a3
{
  return +[CCSetChangePublisher publisherForSet:useCase:](CCSetChangePublisher, "publisherForSet:useCase:", self, a3);
}

- (id)serializeWithUseCase:(id)a3 error:(id *)a4
{
  return -[CCSet serializeWithUseCase:enumerateToBookmark:error:](self, "serializeWithUseCase:enumerateToBookmark:error:", a3, 0, a4);
}

- (id)serializeWithUseCase:(id)a3 enumerateToBookmark:(id)a4 error:(id *)a5
{
  id v7;
  CCSerializedSet *v8;
  CCSerializedSet *v9;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = self;
  else
    v8 = -[CCSerializedSet initWithSet:useCase:error:]([CCSerializedSet alloc], "initWithSet:useCase:error:", self, v7, a5);
  v9 = v8;

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  CCTypeIdentifierRegistryBridge();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionForTypeIdentifier:", self->_itemType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_encodedDescriptors, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", descriptors: [%@]"), self->_encodedDescriptors);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("{itemType: %@%@}"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("{itemType: %@%@}"), v5, &stru_250991730);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CCSet *v4;
  CCSet *v5;
  BOOL v6;

  v4 = (CCSet *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCSet isEqualToSet:](self, "isEqualToSet:", v5);

  return v6;
}

- (BOOL)isEqualToSet:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[CCSet hash](self, "hash");
  v6 = objc_msgSend(v4, "hash");

  return v5 == v6;
}

- (NSNumber)identifier
{
  return self->_hash;
}

- (unint64_t)hash
{
  return -[NSNumber unsignedLongLongValue](self->_hash, "unsignedLongLongValue");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CCSet)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CCSet *v6;
  unsigned __int16 v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t"));
  if (v5 == (unsigned __int16)CCTypeIdentifierUnknown)
  {
    v6 = 0;
  }
  else
  {
    v7 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      self = -[CCSet initWithItemType:encodedDescriptors:error:](self, "initWithItemType:encodedDescriptors:error:", v7, v8, 0);
      v6 = self;
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t itemType;
  id v5;

  itemType = self->_itemType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", itemType, CFSTR("t"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encodedDescriptors, CFSTR("d"));

}

- (BMAccount)account
{
  return self->_account;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

@end
