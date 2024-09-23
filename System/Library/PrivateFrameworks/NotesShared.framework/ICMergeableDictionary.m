@implementation ICMergeableDictionary

- (ICMergeableDictionary)initWithData:(id)a3 replicaID:(id)a4
{
  id v6;
  id v7;
  ICMergeableDictionary *v8;
  uint64_t v9;
  ICCRDocument *v10;
  uint64_t v11;
  ICCRDictionary *v12;
  ICMergeableDictionary *v13;
  ICCRDocument *v14;
  ICCRDocument *document;
  ICCRDictionary *v16;
  ICCRDictionary *dictionary;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICMergeableDictionary;
  v8 = -[ICMergeableDictionary init](&v19, sel_init);
  if (!v8)
    goto LABEL_6;
  if (!v6)
  {
    v14 = -[ICCRDocument initWithReplica:]([ICCRDocument alloc], "initWithReplica:", v7);
    document = v8->_document;
    v8->_document = v14;

    v16 = -[ICCRDictionary initWithDocument:]([ICCRDictionary alloc], "initWithDocument:", v8->_document);
    dictionary = v8->_dictionary;
    v8->_dictionary = v16;

    -[ICCRDocument setRootObject:](v8->_document, "setRootObject:", v8->_dictionary);
    goto LABEL_6;
  }
  +[ICCRCoderUnarchiver decodedDocumentFromData:replica:](ICCRCoderUnarchiver, "decodedDocumentFromData:replica:", v6, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v8->_document;
  v8->_document = (ICCRDocument *)v9;

  -[ICCRDocument rootObject](v8->_document, "rootObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v8->_dictionary;
  v8->_dictionary = (ICCRDictionary *)v11;

  if (v8->_document)
  {
LABEL_6:
    v13 = v8;
    goto LABEL_7;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

- (id)description
{
  void *v2;
  void *v3;

  -[ICMergeableDictionary dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)allKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[ICMergeableDictionary dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ICMergeableDictionary dictionary](self, "dictionary", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return (NSArray *)v5;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICMergeableDictionary dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ICMergeableDictionary objectForKey:](self, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[ICMergeableDictionary removeObjectForKey:](self, "removeObjectForKey:", v6);
  if (v9)
  {
    -[ICMergeableDictionary dictionary](self, "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v6);

  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICMergeableDictionary dictionary](self, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)removeAllObjects
{
  id v2;

  -[ICMergeableDictionary dictionary](self, "dictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSUUID)replicaID
{
  void *v2;
  void *v3;

  -[ICMergeableDictionary document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replica");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)encodedData
{
  void *v2;
  void *v3;

  -[ICMergeableDictionary document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "archivedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)mergeWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;

  v4 = a3;
  -[ICMergeableDictionary document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "archivedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "mergeWithData:", v7);

  if (v8 == 2)
  {
    v10 = 2;
  }
  else if (v8)
  {
    v10 = 1;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICMergeableDictionary mergeWithDictionary:].cold.1((uint64_t)self, (uint64_t)v4, v9);

    v10 = 0;
  }

  return v10;
}

- (ICCRDocument)document
{
  return self->_document;
}

- (ICCRDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

- (void)mergeWithDictionary:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Failed to merge %@ with %@", (uint8_t *)&v3, 0x16u);
}

@end
