@implementation _HDDataEntitySyncMessageBuilder

- (NSArray)orderedProperties
{
  return (NSArray *)-[HDEntityEncoder orderedProperties](self->_entityEncoder, "orderedProperties");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_entityEncoder, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_provenanceCache, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

- (_HDDataEntitySyncMessageBuilder)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (_HDDataEntitySyncMessageBuilder)initWithProfile:(id)a3 transaction:(id)a4 entityClass:(Class)a5 version:(id)a6 provenanceCache:(id)a7 encodingOptions:(id)a8 messageHandler:(id)a9 bytesPerChangeSet:(int64_t)a10 bytesPerChange:(int64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  _HDDataEntitySyncMessageBuilder *v21;
  _HDDataEntitySyncMessageBuilder *v22;
  uint64_t v23;
  HDEntityEncoder *entityEncoder;
  id v27;
  objc_super v28;

  v17 = a3;
  v18 = a4;
  v27 = a7;
  v19 = a8;
  v20 = a9;
  v28.receiver = self;
  v28.super_class = (Class)_HDDataEntitySyncMessageBuilder;
  v21 = -[_HDDataEntitySyncMessageBuilder init](&v28, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_profile, a3);
    v22->_entityClass = a5;
    v22->_entityVersion = ($E7BD3517D03D6A5513A4727339E3F206)a6;
    objc_storeStrong((id *)&v22->_provenanceCache, a7);
    objc_storeStrong((id *)&v22->_transaction, a4);
    -[objc_class entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](a5, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v17, v18, 0, v19, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    entityEncoder = v22->_entityEncoder;
    v22->_entityEncoder = (HDEntityEncoder *)v23;

    objc_storeStrong((id *)&v22->_messageHandler, a9);
    v22->_maxEncodedBytesPerChangeSet = a10;
    v22->_maxEncodedBytesPerChange = a11;
    *(_OWORD *)&v22->_totalEncodedBytes = 0u;
    *(_OWORD *)&v22->_lastEntityAnchor = 0u;
    *(_WORD *)&v22->_hasEncodedAnyObject = 0;
  }

  return v22;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_entityClass);
}

- (int64_t)addEntity:(id)a3 row:(HDSQLiteRow *)a4 anchor:(int64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  HDEntityEncoder *entityEncoder;
  uint64_t v17;
  int64_t maxEncodedBytesPerChange;
  id v19;
  id v20;
  NSObject *v21;
  int64_t v22;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  _QWORD *v28;
  int64_t v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  char v36;
  uint8_t buf[4];
  _HDDataEntitySyncMessageBuilder *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataProvenanceCache provenanceWithID:](self->_provenanceCache, "provenanceWithID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 100, CFSTR("Failed to retrieve provenance for id %@"), v11);
LABEL_9:
    v22 = 2;
    goto LABEL_10;
  }
  -[HDDataProvenanceCache codableObjectCollectionForProvenance:profile:](self->_provenanceCache, "codableObjectCollectionForProvenance:profile:", v12, self->_profile);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 100, CFSTR("Failed to find/create codable object collection for provenance %@"), v12);
    goto LABEL_9;
  }
  v14 = v10;
  v15 = v12;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  entityEncoder = self->_entityEncoder;
  v24 = v14;
  v17 = objc_msgSend(v14, "persistentID");
  maxEncodedBytesPerChange = self->_maxEncodedBytesPerChange;
  v30 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68___HDDataEntitySyncMessageBuilder__addEntity_row_anchor_provenance___block_invoke;
  v25[3] = &unk_1E6CF9B18;
  v25[4] = self;
  v27 = &v31;
  v28 = v35;
  v29 = a5;
  v19 = v15;
  v26 = v19;
  LOBYTE(v15) = -[HDEntityEncoder generateCodableRepresentationsForPersistentID:row:maxBytesPerRepresentation:error:handler:](entityEncoder, "generateCodableRepresentationsForPersistentID:row:maxBytesPerRepresentation:error:handler:", v17, a4, maxEncodedBytesPerChange, &v30, v25);
  v20 = v30;
  if ((v15 & 1) == 0)
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v38 = self;
      v39 = 2114;
      v40 = v20;
      _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@: failed to generate codable representation for sync: %{public}@", buf, 0x16u);
    }
  }
  v22 = v32[3];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);

LABEL_10:
  return v22;
}

- (BOOL)finishAndFlushWithError:(id *)a3
{
  -[HDEntityEncoder finish](self->_entityEncoder, "finish");
  if (!self->_hasEncodedAnyObject || self->_didSendFinal)
    return 1;
  self->_didSendFinal = 1;
  return -[_HDDataEntitySyncMessageBuilder _sendCurrentCollectionIsFinal:error:]((uint64_t)self, 1, (uint64_t)a3);
}

- (uint64_t)_sendCurrentCollectionIsFinal:(uint64_t)a3 error:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v5 = result;
    objc_msgSend(*(id *)(result + 32), "allCodableObjectCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(v5 + 56), "sendCodableChange:version:resultAnchor:sequence:done:error:", v6, *(_QWORD *)(v5 + 24), *(_QWORD *)(v5 + 96), *(_QWORD *)(v5 + 104), a2, a3);
    objc_msgSend(*(id *)(v5 + 32), "clearCodableObjectCollections");
    *(_QWORD *)(v5 + 88) = 0;

    return v7;
  }
  return result;
}

@end
