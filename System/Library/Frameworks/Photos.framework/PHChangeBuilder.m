@implementation PHChangeBuilder

- (PHChangeBuilder)initWithManagedObjectContext:(id)a3 library:(id)a4 options:(id)a5 enumerationContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PHChangeBuilder *v15;
  PHChangeBuilder *v16;
  NSMutableSet *v17;
  NSMutableSet *insertedObjectIDs;
  NSMutableSet *v19;
  NSMutableSet *updatedObjectIDs;
  NSMutableSet *v21;
  NSMutableSet *deletedObjectIDs;
  NSMutableDictionary *v23;
  NSMutableDictionary *deletedUuidsByObjectId;
  NSMutableDictionary *v25;
  NSMutableDictionary *attributesByOID;
  NSMutableDictionary *v27;
  NSMutableDictionary *relationshipsByOID;
  NSMutableDictionary *v29;
  NSMutableDictionary *deletedPrimaryLabelCodesByObjectId;
  PHChangeBuilder *v31;
  objc_super v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PHChangeBuilder;
  v15 = -[PHChangeBuilder init](&v33, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_library, a4);
    objc_storeStrong((id *)&v16->_fetchOptions, a5);
    objc_storeStrong((id *)&v16->_enumerationContext, a6);
    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    insertedObjectIDs = v16->_insertedObjectIDs;
    v16->_insertedObjectIDs = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    updatedObjectIDs = v16->_updatedObjectIDs;
    v16->_updatedObjectIDs = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deletedObjectIDs = v16->_deletedObjectIDs;
    v16->_deletedObjectIDs = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deletedUuidsByObjectId = v16->_deletedUuidsByObjectId;
    v16->_deletedUuidsByObjectId = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributesByOID = v16->_attributesByOID;
    v16->_attributesByOID = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    relationshipsByOID = v16->_relationshipsByOID;
    v16->_relationshipsByOID = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deletedPrimaryLabelCodesByObjectId = v16->_deletedPrimaryLabelCodesByObjectId;
    v16->_deletedPrimaryLabelCodesByObjectId = v29;

    v31 = v16;
  }

  return v16;
}

- (void)recordTransaction:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__PHChangeBuilder_recordTransaction___block_invoke;
  v7[3] = &unk_1E35DF9E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v7);

}

- (BOOL)changeCountExeedsThreshold:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v5 = -[PHPersistentChangeFetchOptions maximumChangeThreshold](self->_fetchOptions, "maximumChangeThreshold");
  if (v5)
  {
    v6 = -[PHPersistentChangeFetchOptions maximumChangeThreshold](self->_fetchOptions, "maximumChangeThreshold");
    if (v6)
      v7 = v6 >= a3;
    else
      v7 = 1;
    LOBYTE(v5) = !v7;
  }
  return v5;
}

- (void)recordNonIncrementalChanges
{
  self->_unknownMergeEvent = 1;
}

- (void)recordChangesInTransaction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  objc_msgSend(v15, "changes");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v9, "changedObjectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[PHChangeBuilder recordChange:](self, "recordChange:", v9);
        }
        else
        {
          PLBackendGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v9, "_pl_prettyDescription");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_pl_prettyDescriptionWithIndent:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v21 = v13;
            v22 = 2112;
            v23 = v14;
            _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_FAULT, "PHChangeBuilder: changedObjectID is nil\n%@%@", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }

}

- (void)recordChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "changedObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHPhotoLibrary uniquedOID:](PHPhotoLibrary, "uniquedOID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "changeType");
  switch(v6)
  {
    case 2:
      -[PHChangeBuilder _recordDeleteChange:withUniquedObjectID:](self, "_recordDeleteChange:withUniquedObjectID:", v7, v5);
      break;
    case 1:
      -[PHChangeBuilder _recordUpdateChange:withUniquedObjectID:](self, "_recordUpdateChange:withUniquedObjectID:", v7, v5);
      break;
    case 0:
      -[PHChangeBuilder _recordInsertChange:withUniquedObjectID:](self, "_recordInsertChange:withUniquedObjectID:", v7, v5);
      break;
  }

}

- (void)_recordInsertChange:(id)a3 withUniquedObjectID:(id)a4
{
  -[NSMutableSet addObject:](self->_insertedObjectIDs, "addObject:", a4);
}

- (void)_recordUpdateChange:(id)a3 withUniquedObjectID:(id)a4
{
  NSMutableSet *updatedObjectIDs;
  id v7;
  id v8;
  id v9;

  updatedObjectIDs = self->_updatedObjectIDs;
  v7 = a4;
  v8 = a3;
  -[NSMutableSet addObject:](updatedObjectIDs, "addObject:", v7);
  objc_msgSend(v8, "updatedProperties");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PHChangeBuilder _recordChangedProperties:forObjectID:](self, "_recordChangedProperties:forObjectID:", v9, v7);
}

- (void)_recordChangedProperties:(id)a3 forObjectID:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_pl_map:", &__block_literal_global_26493);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71A28], "recordChangedKeys:forObjectID:inAttributesByOID:relationshipsByOID:", v7, v6, self->_attributesByOID, self->_relationshipsByOID);

}

- (void)_recordDeleteChange:(id)a3 withUniquedObjectID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[NSMutableSet addObject:](self->_deletedObjectIDs, "addObject:", v6);
  -[PHChangeBuilder _uuidForDeleteChange:uniquedObjectID:](self, "_uuidForDeleteChange:uniquedObjectID:", v14, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary _pl_setNonNilObject:forKey:](self->_deletedUuidsByObjectId, "_pl_setNonNilObject:forKey:", v7, v6);
  objc_msgSend(v6, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71788], "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    objc_msgSend(v14, "tombstone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKey:", CFSTR("primaryLabelCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "unsignedIntValue"))
      -[NSMutableDictionary _pl_setNonNilObject:forKey:](self->_deletedPrimaryLabelCodesByObjectId, "_pl_setNonNilObject:forKey:", v13, v6);

  }
}

- (id)_uuidForDeleteChange:(id)a3 uniquedObjectID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71788], "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    objc_msgSend(v5, "tombstone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("uuid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[objc_class entityKeyForPropertyKey:](+[PHPhotoLibrary PHObjectClassForOID:](PHPhotoLibrary, "PHObjectClassForOID:", v6), "entityKeyForPropertyKey:", CFSTR("uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tombstone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)buildChange
{
  PHChange *v3;
  uint64_t v5;

  v3 = [PHChange alloc];
  LOBYTE(v5) = self->_unknownMergeEvent;
  return -[PHChange initWithInsertedObjectIDs:updatedObjectIDs:deletedObjectIDs:deletedUuidsByObjectId:deletedPrimaryLabelCodesByOID:changedAttributesByOID:changedRelationshipsByOID:unknownMergeEvent:changeToken:fetchOptions:library:managedObjectContext:enumerationContext:](v3, "initWithInsertedObjectIDs:updatedObjectIDs:deletedObjectIDs:deletedUuidsByObjectId:deletedPrimaryLabelCodesByOID:changedAttributesByOID:changedRelationshipsByOID:unknownMergeEvent:changeToken:fetchOptions:library:managedObjectContext:enumerationContext:", self->_insertedObjectIDs, self->_updatedObjectIDs, self->_deletedObjectIDs, self->_deletedUuidsByObjectId, self->_deletedPrimaryLabelCodesByObjectId, self->_attributesByOID, self->_relationshipsByOID, v5, self->_changeToken, self->_fetchOptions, self->_library, self->_context, self->_enumerationContext);
}

- (id)buildPersistentChange
{
  void *v2;
  PHPersistentChange *v3;

  -[PHChangeBuilder buildChange](self, "buildChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PHPersistentChange initWithChange:]([PHPersistentChange alloc], "initWithChange:", v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedPrimaryLabelCodesByObjectId, 0);
  objc_storeStrong((id *)&self->_relationshipsByOID, 0);
  objc_storeStrong((id *)&self->_attributesByOID, 0);
  objc_storeStrong((id *)&self->_deletedUuidsByObjectId, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_updatedObjectIDs, 0);
  objc_storeStrong((id *)&self->_insertedObjectIDs, 0);
  objc_storeStrong((id *)&self->_enumerationContext, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __56__PHChangeBuilder__recordChangedProperties_forObjectID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

void __37__PHChangeBuilder_recordTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 40), "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHPersistentChangeToken tokenWithPersistentHistoryToken:](PHPersistentChangeToken, "tokenWithPersistentHistoryToken:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  objc_msgSend(*(id *)(a1 + 40), "changes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "changeCountExeedsThreshold:", objc_msgSend(v8, "count"));
  v7 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v7, "recordNonIncrementalChanges");
  else
    objc_msgSend(v7, "recordChangesInTransaction:", *(_QWORD *)(a1 + 40));

}

+ (id)changeWithManagedObjectContext:(id)a3 library:(id)a4 options:(id)a5 transaction:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v15;
  id v16;
  id v17;
  id v18;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v9 = v18;
  v10 = v17;
  v11 = v16;
  v12 = v15;
  pl_result_with_autoreleasepool();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)persistentChangeWithManagedObjectContext:(id)a3 library:(id)a4 options:(id)a5 transaction:(id)a6 enumerationContext:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHChangeBuilder.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

  }
  objc_msgSend(v16, "token");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHChangeBuilder.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction.token"));

  }
  v28 = v13;
  v29 = v14;
  v30 = v15;
  v31 = v17;
  v32 = v16;
  v19 = v16;
  v20 = v17;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  pl_result_with_autoreleasepool();
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id __107__PHChangeBuilder_persistentChangeWithManagedObjectContext_library_options_transaction_enumerationContext___block_invoke(_QWORD *a1)
{
  PHChangeBuilder *v2;
  void *v3;

  v2 = -[PHChangeBuilder initWithManagedObjectContext:library:options:enumerationContext:]([PHChangeBuilder alloc], "initWithManagedObjectContext:library:options:enumerationContext:", a1[4], a1[5], a1[6], a1[7]);
  -[PHChangeBuilder recordTransaction:](v2, "recordTransaction:", a1[8]);
  -[PHChangeBuilder buildPersistentChange](v2, "buildPersistentChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __78__PHChangeBuilder_changeWithManagedObjectContext_library_options_transaction___block_invoke(_QWORD *a1)
{
  PHChangeBuilder *v2;
  void *v3;

  v2 = -[PHChangeBuilder initWithManagedObjectContext:library:options:enumerationContext:]([PHChangeBuilder alloc], "initWithManagedObjectContext:library:options:enumerationContext:", a1[4], a1[5], a1[6], 0);
  -[PHChangeBuilder recordTransaction:](v2, "recordTransaction:", a1[7]);
  -[PHChangeBuilder buildChange](v2, "buildChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
