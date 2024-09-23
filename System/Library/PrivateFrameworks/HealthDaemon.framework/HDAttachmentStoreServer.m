@implementation HDAttachmentStoreServer

- (void)remote_addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, id);
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  id v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *, id))a7;
  -[HDStandardTaskServer client](self, "client");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasEntitlement:", *MEMORY[0x1E0CB5990]);

  if ((v18 & 1) != 0)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "attachmentManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDStandardTaskServer client](self, "client");
    v21 = v15;
    v22 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v24 = objc_msgSend(v20, "writeAuthorizationForObjectIdentifier:schemaIdentifier:client:error:", v13, v14, v23, &v37);
    v35 = v14;
    v25 = v13;
    v26 = v24;
    v27 = v37;

    v12 = v22;
    v15 = v21;

    if ((v26 & 1) != 0)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "attachmentManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v27;
      v30 = v25;
      v31 = v25;
      v14 = v35;
      objc_msgSend(v29, "addReferenceWithAttachment:toObjectWithIdentifier:schemaIdentifier:metadata:error:", v12, v31, v35, v15, &v36);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v36;

      v16[2](v16, v32, v33);
      v27 = v33;
    }
    else
    {
      v30 = v25;
      v16[2](v16, 0, v27);
      v14 = v35;
    }

    v13 = v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 4, CFSTR("Missing required entitlement"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v34);

  }
}

- (void)remote_addAttachmentWithName:(id)a3 contentTypeIdentifier:(id)a4 fileHandle:(id)a5 toObjectWithIdentifier:(id)a6 schemaIdentifier:(id)a7 attachmentMetadata:(id)a8 referenceMetadata:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, _QWORD, void *);
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v36 = a3;
  v38 = a4;
  v37 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = (void (**)(id, _QWORD, void *))a10;
  -[HDStandardTaskServer profile](self, "profile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "daemon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "behavior");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v23, "isAppleWatch");

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 2, CFSTR("Unable to add attachments on this device"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 0, v24);

    v25 = v36;
  }
  else
  {
    v35 = v18;
    -[HDStandardTaskServer profile](self, "profile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "attachmentManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDStandardTaskServer client](self, "client");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v29 = objc_msgSend(v27, "writeAuthorizationForObjectIdentifier:schemaIdentifier:client:error:", v16, v17, v28, &v40);
    v30 = v40;

    if ((v29 & 1) != 0)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "attachmentManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v25 = v36;
      objc_msgSend(v32, "addAttachmentWithName:contentTypeIdentifier:fileHandle:toObjectWithIdentifier:schemaIdentifier:attachmentMetadata:referenceMetadata:error:", v36, v38, v37, v16, v17, v35, v19, &v39);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v39;

      ((void (**)(id, void *, void *))v20)[2](v20, v33, v34);
    }
    else
    {
      v20[2](v20, 0, v30);
      v25 = v36;
    }

    v18 = v35;
  }

}

- (void)remote_removeAllReferencesWithAttachmentIdentifier:(id)a3 objectIdentifier:(id)a4 schemaIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, id);
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, id))a6;
  -[HDStandardTaskServer profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attachmentManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer client](self, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v17 = objc_msgSend(v15, "writeAuthorizationForObjectIdentifier:schemaIdentifier:client:error:", v11, v12, v16, &v24);
  v18 = v24;

  if ((v17 & 1) != 0)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "attachmentManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v18;
    v21 = objc_msgSend(v20, "removeAllReferencesWithAttachmentIdentifier:objectIdentifier:schemaIdentifier:error:", v10, v11, v12, &v23);
    v22 = v23;

    v13[2](v13, v21, v22);
    v18 = v22;
  }
  else
  {
    v13[2](v13, 0, v18);
  }

}

- (void)remote_attachmentReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  char v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attachmentManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer client](self, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v14 = objc_msgSend(v12, "readAuthorizationForObjectIdentifier:schemaIdentifier:client:error:", v8, v9, v13, &v43);
  v15 = v43;

  if ((v14 & 1) != 0)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = v15;
    if (self)
    {
      v17 = v9;
      -[HDStandardTaskServer profile](self, "profile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "attachmentManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "schemaProviderForIdentifier:error:", v17, &v42);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v42;
    }
    else
    {
      v20 = 0;
      v21 = v15;
    }
    v22 = v21;

    if (v20)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v24 = objc_msgSend(v20, "schemaVersionForObjectIdentifier:profile:error:", v8, v23, &v41);
      v25 = v41;

      if (v24 <= 0)
      {
        v10[2](v10, 0, v25);
        v32 = 0;
      }
      else
      {
        v35 = v25;
        -[HDStandardTaskServer profile](self, "profile");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "attachmentManager");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v16;
        v29 = (void *)v27;
        v39 = v24;
        v40 = 0;
        v37[1] = 3221225472;
        v37[2] = __102__HDAttachmentStoreServer_remote_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke;
        v37[3] = &unk_1E6CF27C0;
        v36 = v28;
        v37[0] = MEMORY[0x1E0C809B0];
        v30 = v28;
        v38 = v30;
        v31 = objc_msgSend(v29, "attachmentReferencesForObjectIdentifier:schemaIdentifier:error:enumerationHandler:", v8, v9, &v40, v37);
        v32 = v40;

        if ((v31 & 1) != 0)
        {
          v33 = v30;
          v34 = 0;
        }
        else
        {
          v33 = 0;
          v34 = v32;
        }
        ((void (**)(id, id, id))v10)[2](v10, v33, v34);

        v25 = v35;
        v16 = v36;
      }

    }
    else
    {
      v10[2](v10, 0, v22);
    }

  }
  else
  {
    v10[2](v10, 0, v15);
    v22 = v15;
  }

}

uint64_t __102__HDAttachmentStoreServer_remote_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 >= objc_msgSend(v5, "schemaVersion"))
  {
    objc_msgSend(v5, "hkAttachmentReferenceWithAttachment:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

  }
  return 1;
}

- (void)remote_streamDataForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  uint8_t buf[4];
  HDAttachmentStoreServer *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __58__HDAttachmentStoreServer_remote_streamDataForAttachment___block_invoke;
  v29[3] = &unk_1E6CE8030;
  v29[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  +[HDAttachmentEntity attachmentWithIdentifier:profile:error:](HDAttachmentEntity, "attachmentWithIdentifier:profile:error:", v6, v7, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;

  if (v8)
  {
    v27 = v9;
    v10 = -[HDAttachmentStoreServer _isAuthorizedToReadAttachment:error:](self, v8, (uint64_t)&v27);
    v11 = v27;

    if ((v10 & 1) != 0)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attachmentManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v11;
      objc_msgSend(v13, "readerForAttachment:error:", v8, &v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26;

      if (v14)
      {
        v16 = *MEMORY[0x1E0CB47C0];
        v25 = v15;
        objc_msgSend(v14, "readDataUpToLength:offset:error:", v16, 0, &v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v25;

        if (v17)
        {
          v19 = 0;
          while (objc_msgSend(v17, "length"))
          {
            objc_msgSend(v5, "clientRemote_streamDataForAttachment:dataChunk:error:done:", v4, v17, 0, 0);
            v19 += objc_msgSend(v17, "length");

            v25 = v18;
            objc_msgSend(v14, "readDataUpToLength:offset:error:", v16, v19, &v25);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v25;

            v18 = v15;
            if (!v17)
              goto LABEL_14;
          }
          objc_msgSend(v14, "close");
          objc_msgSend(v5, "clientRemote_streamDataForAttachment:dataChunk:error:done:", v4, v17, 0, 1);

          v15 = v18;
          goto LABEL_18;
        }
        v15 = v18;
LABEL_14:
        _HKInitializeLogging();
        v22 = (void *)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          v23 = v22;
          objc_msgSend(v4, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = self;
          v32 = 2114;
          v33 = v24;
          v34 = 2114;
          v35 = v15;
          _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to read file for attachment %{public}@. %{public}@", buf, 0x20u);

        }
        objc_msgSend(v14, "close");
      }
      objc_msgSend(v5, "clientRemote_streamDataForAttachment:dataChunk:error:done:", v4, 0, v15, 1);
LABEL_18:

      v11 = v15;
      goto LABEL_19;
    }
    objc_msgSend(v5, "clientRemote_streamDataForAttachment:dataChunk:error:done:", v4, 0, v11, 1);
  }
  else
  {
    if (!v9)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v4, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hk_error:format:", 118, CFSTR("The attachment with identifier %@ was not found."), v21);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "clientRemote_streamDataForAttachment:dataChunk:error:done:", v4, 0, v9, 1);
    v11 = v9;
  }
LABEL_19:

}

void __58__HDAttachmentStoreServer_remote_streamDataForAttachment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to get HKAttachmentStore remote object proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (uint64_t)_isAuthorizedToReadAttachment:(uint64_t)a3 error:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  id v25;
  void *v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v26 = v5;
  if (a1)
  {
    v6 = v5;
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachmentManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __63__HDAttachmentStoreServer__isAuthorizedToReadAttachment_error___block_invoke;
    v33[3] = &unk_1E6CF27E8;
    v10 = v7;
    v34 = v10;
    v11 = objc_msgSend(v9, "attachmentReferencesForAttachment:error:enumerationHandler:", v6, a3, v33);

    if (v11)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      obj = v10;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v12)
      {
        v13 = v12;
        v25 = v10;
        v28 = a3;
        v14 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(a1, "profile", v25, v26);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "attachmentManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "schemaIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "client");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v18, "readAuthorizationForObjectIdentifier:schemaIdentifier:client:error:", v19, v20, v21, v28);

            if ((v22 & 1) != 0)
            {
              v23 = 1;
              goto LABEL_14;
            }
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          if (v13)
            continue;
          break;
        }
        v23 = 0;
LABEL_14:
        v10 = v25;
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)remote_getDataChunkForAttachment:(id)a3 chunkSize:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, id);
  NSMutableDictionary *openReadersByAttachment;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  id v39;
  id v40;
  _BYTE buf[12];
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, _QWORD, id))a6;
  os_unfair_lock_lock(&self->_lock);
  openReadersByAttachment = self->_openReadersByAttachment;
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](openReadersByAttachment, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (v14)
  {
    v15 = 0;
    goto LABEL_16;
  }
  v36 = a5;
  v37 = a4;
  v40 = 0;
  v38 = v10;
  objc_msgSend(v38, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  +[HDAttachmentEntity attachmentWithIdentifier:profile:error:](HDAttachmentEntity, "attachmentWithIdentifier:profile:error:", v16, v17, buf);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(id *)buf;

  if (!v18)
  {
    if (v19)
    {
      v25 = v19;
      v23 = v38;
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v23 = v38;
      objc_msgSend(v38, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "hk_error:format:", 118, CFSTR("The attachment with identifier %@ was not found."), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v28;
      if (!v25)
      {
        v19 = 0;
        goto LABEL_13;
      }
    }
    v19 = objc_retainAutorelease(v25);
    v40 = v19;

LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  if (!-[HDAttachmentStoreServer _isAuthorizedToReadAttachment:error:](self, v18, (uint64_t)&v40))
  {
    v14 = 0;
    goto LABEL_10;
  }
  -[HDStandardTaskServer profile](self, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "attachmentManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "readerForAttachment:error:", v18, &v40);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_10:
    v23 = v38;
    goto LABEL_14;
  }
  os_unfair_lock_lock(&self->_lock);
  v22 = self->_openReadersByAttachment;
  v23 = v38;
  objc_msgSend(v38, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v14, v24);

  os_unfair_lock_unlock(&self->_lock);
LABEL_14:

  v15 = v40;
  if (!v14)
  {
    v11[2](v11, 0, v15);
    goto LABEL_24;
  }
  a5 = v36;
  a4 = v37;
LABEL_16:
  v29 = v15;
  v39 = v15;
  objc_msgSend(v14, "readDataUpToLength:offset:error:", a4, a5, &v39);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v39;

  if (v30)
  {
    ((void (**)(id, void *, id))v11)[2](v11, v30, 0);
    if (!objc_msgSend(v30, "length") || objc_msgSend(v30, "length") < a4)
    {
      objc_msgSend(v10, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDAttachmentStoreServer _lock_closeReaderForAttachmentIdentifier:]((uint64_t)self, v31);

    }
  }
  else
  {
    objc_msgSend(v10, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDAttachmentStoreServer _lock_closeReaderForAttachmentIdentifier:]((uint64_t)self, v32);

    _HKInitializeLogging();
    v33 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v34 = v33;
      objc_msgSend(v10, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      v42 = 2114;
      v43 = v35;
      v44 = 2114;
      v45 = v15;
      _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to read file for attachment %{public}@. %{public}@", buf, 0x20u);

    }
    v11[2](v11, 0, v15);
  }

LABEL_24:
}

- (void)_lock_closeReaderForAttachmentIdentifier:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;
  id v5;

  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 48);
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "close");
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", 0, v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

uint64_t __63__HDAttachmentStoreServer__isAuthorizedToReadAttachment_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB47D0];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB62E8], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB62E8], "clientInterface");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openReadersByAttachment, 0);
}

@end
