@implementation ATXMinimalAction

- (ATXMinimalAction)initWithBundleId:(id)a3 actionType:(id)a4 paramHash:(int64_t)a5
{
  id v8;
  id v9;
  ATXMinimalAction *v10;
  uint64_t v11;
  NSString *bundleId;
  uint64_t v13;
  NSString *actionType;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXMinimalAction;
  v10 = -[ATXMinimalAction init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    bundleId = v10->_bundleId;
    v10->_bundleId = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    actionType = v10->_actionType;
    v10->_actionType = (NSString *)v13;

    v10->_paramHash = a5;
  }

  return v10;
}

- (id)actionFromDatastoreLookup
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "datastore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMinimalAction actionFromDatastoreLookupForDatastore:](self, "actionFromDatastoreLookupForDatastore:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)datastore
{
  return +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
}

- (id)actionFromDatastoreLookupForDatastore:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ATXMinimalAction *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__33;
  v16 = __Block_byref_object_dispose__33;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke;
  v8[3] = &unk_1E82DCC50;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  objc_msgSend(v5, "_doSync:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[4];
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_2;
  v6[3] = &unk_1E82DCBD8;
  v3 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 40);
  v4[4] = v7;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_3;
  v5[3] = &unk_1E82DCC00;
  v5[4] = v3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_4;
  v4[3] = &unk_1E82DCC28;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT slotSetKey.uuid, alog.slots FROM alog, slotSetKey, alogBundleId, alogAction WHERE alog.id = slotSetKey.alogId AND alog.bundleId = alogBundleId.id AND alog.actionType = alogAction.id AND alogBundleId.bundleId=? AND alogAction.actionType=? AND slotSetKey.paramHash=? ORDER BY date DESC LIMIT 1"), v6, v5, v4);

}

void __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v4, "bindParam:toNSString:", 1, v3);
  objc_msgSend(v4, "bindParam:toNSString:", 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v4, "bindParam:toInt64:", 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

}

uint64_t __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getNSDataForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v4), "bytes"));
  else
    v5 = 0;
  v33 = 0;
  objc_msgSend(v3, "getNSDataForColumn:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    ATXSlotSetsDeserialize();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v7, "first");
  v8 = objc_claimAutoreleasedReturnValue();
  v28 = a1;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(v7, "second");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  v13 = v11;
  if (v12)
  {
    v14 = v12;
    v26 = v4;
    v27 = v3;
    v15 = *(_QWORD *)v30;
LABEL_9:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v16);
      objc_msgSend(v17, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqual:", v5);

      if ((v19 & 1) != 0)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v14)
          goto LABEL_9;
        v13 = v11;
        v4 = v26;
        v3 = v27;
        goto LABEL_18;
      }
    }
    v13 = v17;

    v4 = v26;
    v3 = v27;
    if (!v13)
      goto LABEL_19;
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(v28 + 32) + 8) + 40);
    objc_msgSend(v13, "parameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "copyWithParameterWhitelist:", v21);
    v23 = *(_QWORD *)(*(_QWORD *)(v28 + 32) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
LABEL_18:

LABEL_19:
  return *MEMORY[0x1E0D81788];
}

uint64_t __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned __int8 *v5;

  v3 = a2;
  __atxlog_handle_relevance_model();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_4_cold_1(a1, (uint64_t)v3, v4);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  if (a4 == 1)
  {
    v5 = a3;
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)jsonDict
{
  NSString *actionType;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("bundleId");
  v6[1] = CFSTR("actionType");
  actionType = self->_actionType;
  v7[0] = self->_bundleId;
  v7[1] = actionType;
  v6[2] = CFSTR("paramHash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_paramHash);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXMinimalAction jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXMinimalAction *v4;
  ATXMinimalAction *v5;
  BOOL v6;

  v4 = (ATXMinimalAction *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXMinimalAction isEqualToATXMinimalAction:](self, "isEqualToATXMinimalAction:", v5);

  return v6;
}

- (BOOL)isEqualToATXMinimalAction:(id)a3
{
  id *v4;
  NSString *bundleId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *actionType;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  BOOL v15;

  v4 = (id *)a3;
  bundleId = self->_bundleId;
  v6 = (NSString *)v4[1];
  if (bundleId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = bundleId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  actionType = self->_actionType;
  v11 = (NSString *)v4[2];
  if (actionType == v11)
  {

    goto LABEL_9;
  }
  v12 = v11;
  v13 = actionType;
  v14 = -[NSString isEqual:](v13, "isEqual:", v12);

  if ((v14 & 1) != 0)
  {
LABEL_9:
    v15 = self->_paramHash == (_QWORD)v4[3];
    goto LABEL_10;
  }
LABEL_7:
  v15 = 0;
LABEL_10:

  return v15;
}

- (ATXMinimalAction)initWithProtoData:(id)a3
{
  id v4;
  ATXPBMinimalAction *v5;
  ATXMinimalAction *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBMinimalAction initWithData:]([ATXPBMinimalAction alloc], "initWithData:", v4);

    self = -[ATXMinimalAction initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXMinimalAction proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXMinimalAction)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ATXMinimalAction *v9;
  NSObject *v10;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_relevance_model();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXMinimalAction initWithProto:].cold.1((uint64_t)self, v10);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "paramHash");

  self = -[ATXMinimalAction initWithBundleId:actionType:paramHash:](self, "initWithBundleId:actionType:paramHash:", v6, v7, v8);
  v9 = self;
LABEL_8:

  return v9;
}

- (id)proto
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setBundleId:", self->_bundleId);
  objc_msgSend(v3, "setActionType:", self->_actionType);
  objc_msgSend(v3, "setParamHash:", self->_paramHash);
  return v3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (int64_t)paramHash
{
  return self->_paramHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

void __58__ATXMinimalAction_actionFromDatastoreLookupForDatastore___block_invoke_4_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Unable to fetch action corresponding to minimalAction %@. Error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);

}

@end
