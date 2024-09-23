@implementation HDInsertDeleteAndAssociateObjectsOperation

- (HDInsertDeleteAndAssociateObjectsOperation)initWithObjectsToInsertByDataProvenance:(id)a3 objectsToDelete:(id)a4 associations:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDInsertDeleteAndAssociateObjectsOperation *v11;
  uint64_t v12;
  NSDictionary *objectsToInsertByDataProvenance;
  uint64_t v14;
  NSArray *objectsToDelete;
  uint64_t v16;
  NSDictionary *associations;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDInsertDeleteAndAssociateObjectsOperation;
  v11 = -[HDInsertDeleteAndAssociateObjectsOperation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    objectsToInsertByDataProvenance = v11->_objectsToInsertByDataProvenance;
    v11->_objectsToInsertByDataProvenance = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    objectsToDelete = v11->_objectsToDelete;
    v11->_objectsToDelete = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    associations = v11->_associations;
    v11->_associations = (NSDictionary *)v16;

  }
  return v11;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  double Current;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSDictionary *obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_objectsToInsertByDataProvenance;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v11)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v12);
      objc_msgSend(v7, "dataManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](self->_objectsToInsertByDataProvenance, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "insertDataObjects:withProvenance:creationDate:error:", v15, v13, a5, Current);

      if (!v16)
        goto LABEL_20;
      if (v10 == ++v12)
      {
        v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v7, "dataManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "deleteDataObjects:restrictedSourceEntities:failIfNotFound:recursiveDeleteAuthorizationBlock:error:", self->_objectsToDelete, 0, 0, 0, a5);

  LOBYTE(v16) = 0;
  if (v18)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = self->_associations;
    v19 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
LABEL_12:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v22);
        -[NSDictionary objectForKeyedSubscript:](self->_associations, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        v16 = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v24, v23, 0, 0, &v27, v7, a5);

        if (!v16)
          break;
        if (v20 == ++v22)
        {
          v20 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          LOBYTE(v16) = 1;
          if (v20)
            goto LABEL_12;
          break;
        }
      }
    }
    else
    {
      LOBYTE(v16) = 1;
    }
LABEL_20:

  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertDeleteAndAssociateObjectsOperation)initWithCoder:(id)a3
{
  id v4;
  HDInsertDeleteAndAssociateObjectsOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *objectsToInsertByDataProvenance;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *objectsToDelete;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *associations;
  objc_super v22;
  _QWORD v23[3];
  _QWORD v24[2];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HDInsertDeleteAndAssociateObjectsOperation;
  v5 = -[HDInsertDeleteAndAssociateObjectsOperation init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("objectsToInsertByDataProvenance"));
    v9 = objc_claimAutoreleasedReturnValue();
    objectsToInsertByDataProvenance = v5->_objectsToInsertByDataProvenance;
    v5->_objectsToInsertByDataProvenance = (NSDictionary *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("objectsToDelete"));
    v14 = objc_claimAutoreleasedReturnValue();
    objectsToDelete = v5->_objectsToDelete;
    v5->_objectsToDelete = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("associations"));
    v19 = objc_claimAutoreleasedReturnValue();
    associations = v5->_associations;
    v5->_associations = (NSDictionary *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *objectsToInsertByDataProvenance;
  id v5;

  objectsToInsertByDataProvenance = self->_objectsToInsertByDataProvenance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", objectsToInsertByDataProvenance, CFSTR("objectsToInsertByDataProvenance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objectsToDelete, CFSTR("objectsToDelete"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associations, CFSTR("associations"));

}

- (NSDictionary)objectsToInsertByDataProvenance
{
  return self->_objectsToInsertByDataProvenance;
}

- (NSArray)objectsToDelete
{
  return self->_objectsToDelete;
}

- (NSDictionary)associations
{
  return self->_associations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associations, 0);
  objc_storeStrong((id *)&self->_objectsToDelete, 0);
  objc_storeStrong((id *)&self->_objectsToInsertByDataProvenance, 0);
}

@end
