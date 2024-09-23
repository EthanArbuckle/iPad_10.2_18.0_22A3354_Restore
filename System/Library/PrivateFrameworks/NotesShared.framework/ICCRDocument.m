@implementation ICCRDocument

- (void)setRootObject:(id)a3
{
  id v5;

  v5 = a3;
  if (self->_rootObject != v5)
  {
    objc_storeStrong(&self->_rootObject, a3);
    -[ICCRDocument setDocumentFor:](self, "setDocumentFor:", v5);
  }

}

- (void)setDocumentFor:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__ICCRDocument_setDocumentFor___block_invoke;
  v3[3] = &unk_1E76CBE28;
  v3[4] = self;
  -[ICCRDocument walkGraph:root:](self, "walkGraph:root:", v3, a3);
}

- (void)walkGraph:(id)a3 root:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 514);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = (id *)&v15;
  v17 = 0x3042000000;
  v18 = __Block_byref_object_copy__32;
  v19 = __Block_byref_object_dispose__32;
  v20 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__ICCRDocument_walkGraph_root___block_invoke;
  aBlock[3] = &unk_1E76CBE00;
  v8 = v7;
  v12 = v8;
  v9 = v5;
  v13 = v9;
  v14 = &v15;
  v10 = _Block_copy(aBlock);
  objc_storeWeak(v16 + 5, v10);
  (*((void (**)(id, id))v9 + 2))(v9, v6);
  objc_msgSend(v6, "walkGraph:", v10);

  _Block_object_dispose(&v15, 8);
  objc_destroyWeak(&v20);

}

void __31__ICCRDocument_walkGraph_root___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id WeakRetained;
  void *v6;

  v3 = a2;
  if (v3)
  {
    v6 = v3;
    v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
    v3 = v6;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v6, "walkGraph:", WeakRetained);

      v3 = v6;
    }
  }

}

uint64_t __31__ICCRDocument_setDocumentFor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDocument:", *(_QWORD *)(a1 + 32));
}

- (ICCRDocument)initWithReplica:(id)a3
{
  id v4;
  ICCRVectorTimestamp *v5;
  ICCRDocument *v6;

  v4 = a3;
  v5 = objc_alloc_init(ICCRVectorTimestamp);
  v6 = -[ICCRDocument initWithVersion:startVersion:rootObject:replica:](self, "initWithVersion:startVersion:rootObject:replica:", v5, 0, 0, v4);

  return v6;
}

- (ICCRDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICCRDocument *v15;
  ICCRDocument *v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *objects;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ICCRDocument;
  v15 = -[ICCRDocument init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_version, a3);
    v17 = -[ICCRVectorTimestamp clockForUUID:](v16->_version, "clockForUUID:", v14);
    v16->_replicaClock = v17;
    v16->_unserializedReplicaClock = v17;
    objc_storeStrong((id *)&v16->_startVersion, a4);
    objc_storeStrong(&v16->_rootObject, a5);
    objc_storeStrong((id *)&v16->_replica, a6);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objects = v16->_objects;
    v16->_objects = v18;

    if (v13)
      -[ICCRDocument setDocumentFor:](v16, "setDocumentFor:", v13);
  }

  return v16;
}

+ (id)documentWithReplica:(id)a3
{
  id v3;
  ICCRDocument *v4;
  ICCRVectorTimestamp *v5;
  ICCRDocument *v6;

  v3 = a3;
  v4 = [ICCRDocument alloc];
  v5 = objc_alloc_init(ICCRVectorTimestamp);
  v6 = -[ICCRDocument initWithVersion:rootObject:replica:](v4, "initWithVersion:rootObject:replica:", v5, 0, v3);

  return v6;
}

+ (id)documentWithRootObject:(id)a3 replica:(id)a4
{
  id v5;
  id v6;
  ICCRDocument *v7;
  ICCRVectorTimestamp *v8;
  ICCRDocument *v9;

  v5 = a4;
  v6 = a3;
  v7 = [ICCRDocument alloc];
  v8 = objc_alloc_init(ICCRVectorTimestamp);
  v9 = -[ICCRDocument initWithVersion:rootObject:replica:](v7, "initWithVersion:rootObject:replica:", v8, v6, v5);

  return v9;
}

- (ICCRDocument)init
{
  void *v3;
  ICCRDocument *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICCRDocument initWithReplica:](self, "initWithReplica:", v3);

  return v4;
}

- (ICCRDocument)initWithVersion:(id)a3 rootObject:(id)a4 replica:(id)a5
{
  return -[ICCRDocument initWithVersion:startVersion:rootObject:replica:](self, "initWithVersion:startVersion:rootObject:replica:", a3, 0, a4, a5);
}

- (id)copyForReplica:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICCRDocument archivedData](self, "archivedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCRDocument unarchiveFromData:replica:](ICCRDocument, "unarchiveFromData:replica:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)archivedData
{
  -[ICCRDocument realizeLocalChanges](self, "realizeLocalChanges");
  return +[ICCRCoderArchiver encodedDataWithDocument:](ICCRCoderArchiver, "encodedDataWithDocument:", self);
}

+ (id)unarchiveFromData:(id)a3 replica:(id)a4
{
  return +[ICCRCoderUnarchiver decodedDocumentFromData:replica:](ICCRCoderUnarchiver, "decodedDocumentFromData:replica:", a3, a4);
}

- (id)localObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF532BA0))
  {
    -[ICCRDocument objects](self, "objects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = v7;
    else
      v8 = v4;
    v9 = v8;

    v4 = v9;
  }
  return v4;
}

- (unint64_t)mergeResultForMergingWithDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  unint64_t v21;

  v4 = a3;
  objc_opt_class();
  -[ICCRDocument rootObject](self, "rootObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "rootObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    objc_msgSend(v6, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_11;
  }
  objc_msgSend(v4, "startVersion");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_8;
  v14 = (void *)v13;
  objc_msgSend(v4, "startVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRDocument version](self, "version");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "compare:", v16);

  if ((v17 & 4) != 0)
  {
LABEL_11:
    v21 = 0;
  }
  else
  {
LABEL_8:
    -[ICCRDocument version](self, "version");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "compare:", v19);

    if ((v20 & 1) != 0)
      v21 = 2;
    else
      v21 = 1;
  }

  return v21;
}

- (void)mergeTimestampWithDocument:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICCRDocument version](self, "version");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mergeWith:", v5);
}

- (unint64_t)mergeWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  NSObject *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCRDocument replica](self, "replica");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCRDocument unarchiveFromData:replica:](ICCRDocument, "unarchiveFromData:replica:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCRDocument realizeLocalChanges](self, "realizeLocalChanges");
  v7 = -[ICCRDocument mergeResultForMergingWithDocument:](self, "mergeResultForMergingWithDocument:", v6);
  if (v7 == 2)
  {
    v27 = v4;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[ICCRDocument objects](self, "objects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v9, "objectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
          objc_msgSend(v6, "objects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "mergeWith:", v18);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v12);
    }

    -[ICCRDocument rootObject](self, "rootObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mergeWith:", v20);

    -[ICCRDocument mergeTimestampWithDocument:](self, "mergeTimestampWithDocument:", v6);
    -[ICCRDocument version](self, "version");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRDocument replica](self, "replica");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "clockForUUID:", v22);
    v24 = -[ICCRDocument replicaClock](self, "replicaClock");

    v4 = v27;
    if (v23 != v24)
    {
      v25 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[ICCRDocument mergeWithData:].cold.1(self);

    }
    -[ICCRDocument updateGraphDocumentPointers](self, "updateGraphDocumentPointers");
    -[ICCRDocument updateObjectsSet](self, "updateObjectsSet");
    v7 = 2;
  }

  return v7;
}

- (void)realizeLocalChanges
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "replicaClock");
  objc_msgSend(a1, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replica");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clockForUUID:", v3);
  OUTLINED_FUNCTION_1(&dword_1BD918000, v4, v5, "Version clock should equal cached replica clock: %ld => %ld", v6, v7, v8, v9, 0);

}

uint64_t __35__ICCRDocument_realizeLocalChanges__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "realizeLocalChangesIn:", *(_QWORD *)(a1 + 32));
}

- (void)updateGraphDocumentPointers
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__ICCRDocument_updateGraphDocumentPointers__block_invoke;
  v4[3] = &unk_1E76CBE28;
  v4[4] = self;
  -[ICCRDocument rootObject](self, "rootObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRDocument walkGraph:root:](self, "walkGraph:root:", v4, v3);

}

uint64_t __43__ICCRDocument_updateGraphDocumentPointers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDocument:", *(_QWORD *)(a1 + 32));
}

- (void)updateObjectsSet
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[ICCRDocument objects](self, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__ICCRDocument_updateObjectsSet__block_invoke;
  v5[3] = &unk_1E76CBE28;
  v5[4] = self;
  -[ICCRDocument rootObject](self, "rootObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRDocument walkGraph:root:](self, "walkGraph:root:", v5, v4);

}

void __32__ICCRDocument_updateObjectsSet__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF532BA0))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v7;
    objc_msgSend(v3, "objects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
}

- (unint64_t)mergeWithDocument:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "archivedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICCRDocument mergeWithData:](self, "mergeWithData:", v4);

  return v5;
}

- (id)deltaSince:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  ICCRDocument *v10;
  void *v11;
  void *v12;
  ICCRDocument *v13;

  v4 = a3;
  -[ICCRDocument realizeLocalChanges](self, "realizeLocalChanges");
  -[ICCRDocument version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  if ((v6 & 1) != 0)
  {
    -[ICCRDocument rootObject](self, "rootObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deltaSince:in:", v4, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [ICCRDocument alloc];
    -[ICCRDocument version](self, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRDocument replica](self, "replica");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICCRDocument initWithVersion:startVersion:rootObject:replica:](v10, "initWithVersion:startVersion:rootObject:replica:", v11, v4, v9, v12);

    -[ICCRDocument archivedData](v13, "archivedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRDocument version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRDocument rootObject](self, "rootObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p version=%@ root=%@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ICCRVectorTimestamp)version
{
  return self->_version;
}

- (ICCRVectorTimestamp)startVersion
{
  return self->_startVersion;
}

- (NSUUID)replica
{
  return self->_replica;
}

- (id)rootObject
{
  return self->_rootObject;
}

- (NSMutableDictionary)objects
{
  return self->_objects;
}

- (int64_t)replicaClock
{
  return self->_replicaClock;
}

- (int64_t)unserializedReplicaClock
{
  return self->_unserializedReplicaClock;
}

- (void)setUnserializedReplicaClock:(int64_t)a3
{
  self->_unserializedReplicaClock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong(&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_replica, 0);
  objc_storeStrong((id *)&self->_startVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)mergeWithData:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replica");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clockForUUID:", v3);
  objc_msgSend(a1, "replicaClock");
  OUTLINED_FUNCTION_1(&dword_1BD918000, v4, v5, "Merging should not modify local replica clock: %ld => %ld", v6, v7, v8, v9, 0);

}

@end
