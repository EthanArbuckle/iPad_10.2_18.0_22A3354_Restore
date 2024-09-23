@implementation CRKAnnotatedCredentialManifest

+ (CRKAnnotatedCredentialManifest)manifestWithData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "cat_unarchiveObjectOfClass:withData:error:", objc_opt_class(), v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      _CRKLogASM_19();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[CRKAnnotatedCredentialManifest manifestWithData:].cold.1(v5);

    }
  }
  else
  {
    v4 = (void *)objc_opt_new();
  }

  return (CRKAnnotatedCredentialManifest *)v4;
}

- (CRKAnnotatedCredentialManifest)init
{
  CRKAnnotatedCredentialManifest *v2;
  uint64_t v3;
  NSMutableDictionary *annotationsByPersistentID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKAnnotatedCredentialManifest;
  v2 = -[CRKAnnotatedCredentialManifest init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    annotationsByPersistentID = v2->_annotationsByPersistentID;
    v2->_annotationsByPersistentID = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)dataRepresentation
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  if (-[CRKAnnotatedCredentialManifest isEmpty](self, "isEmpty"))
    return 0;
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "cat_archivedDataWithRootObject:error:", self, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _CRKLogASM_19();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CRKAnnotatedCredentialManifest dataRepresentation].cold.1(v5);

  }
  return v4;
}

- (NSSet)persistentIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[CRKAnnotatedCredentialManifest annotationsByPersistentID](self, "annotationsByPersistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)annotationForPersistentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CRKAnnotatedCredentialManifest annotationsByPersistentID](self, "annotationsByPersistentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (void)addPersistentID:(id)a3 withAnnotation:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CRKAnnotatedCredentialManifest annotationsByPersistentID](self, "annotationsByPersistentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v11);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = (uint64_t)v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!(v8 | v9))
    {
      v9 = 0;
      goto LABEL_7;
    }
  }
  if ((objc_msgSend((id)v8, "isEqual:", v9) & 1) == 0)
  {
    -[CRKAnnotatedCredentialManifest annotationsByPersistentID](self, "annotationsByPersistentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    -[CRKAnnotatedCredentialManifest setModified:](self, "setModified:", 1);
  }
LABEL_7:

}

- (void)removePersistentID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKAnnotatedCredentialManifest annotationsByPersistentID](self, "annotationsByPersistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CRKAnnotatedCredentialManifest annotationsByPersistentID](self, "annotationsByPersistentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);

    -[CRKAnnotatedCredentialManifest setModified:](self, "setModified:", 1);
  }

}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[CRKAnnotatedCredentialManifest annotationsByPersistentID](self, "annotationsByPersistentID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKAnnotatedCredentialManifest annotationsByPersistentID](self, "annotationsByPersistentID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("annotationsByPersistentID"));

}

- (CRKAnnotatedCredentialManifest)initWithCoder:(id)a3
{
  id v4;
  CRKAnnotatedCredentialManifest *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *annotationsByPersistentID;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKAnnotatedCredentialManifest;
  v5 = -[CRKAnnotatedCredentialManifest init](&v21, sel_init);
  if (v5)
  {
    v20 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    v18 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("annotationsByPersistentID"));
    v15 = objc_claimAutoreleasedReturnValue();
    annotationsByPersistentID = v5->_annotationsByPersistentID;
    v5->_annotationsByPersistentID = (NSMutableDictionary *)v15;

  }
  return v5;
}

- (NSMutableDictionary)annotationsByPersistentID
{
  return self->_annotationsByPersistentID;
}

- (BOOL)modified
{
  return self->_modified;
}

- (void)setModified:(BOOL)a3
{
  self->_modified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationsByPersistentID, 0);
}

+ (void)manifestWithData:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Failed to deserialize credential store manifest: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)dataRepresentation
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Failed to serialize credential store manifest: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
