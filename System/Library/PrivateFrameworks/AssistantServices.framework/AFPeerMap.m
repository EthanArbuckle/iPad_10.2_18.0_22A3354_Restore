@implementation AFPeerMap

- (AFPeerMap)init
{
  AFPeerMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *objectsByUUID;
  NSMutableDictionary *v5;
  NSMutableDictionary *uuidsByAssistantIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *uuidsByRapportIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *uuidsByIdsDeviceIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *uuidsByHomeKitIdentifier;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AFPeerMap;
  v2 = -[AFPeerMap init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objectsByUUID = v2->_objectsByUUID;
    v2->_objectsByUUID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    uuidsByAssistantIdentifier = v2->_uuidsByAssistantIdentifier;
    v2->_uuidsByAssistantIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    uuidsByRapportIdentifier = v2->_uuidsByRapportIdentifier;
    v2->_uuidsByRapportIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    uuidsByIdsDeviceIdentifier = v2->_uuidsByIdsDeviceIdentifier;
    v2->_uuidsByIdsDeviceIdentifier = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    uuidsByHomeKitIdentifier = v2->_uuidsByHomeKitIdentifier;
    v2->_uuidsByHomeKitIdentifier = v11;

  }
  return v2;
}

- (id)objectForPeerInfo:(id)a3
{
  void *v4;
  void *v5;

  -[AFPeerMap _getUUIDAndUpdateIDMapsForPeerInfo:](self, "_getUUIDAndUpdateIDMapsForPeerInfo:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_objectsByUUID, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setObject:(id)a3 forPeerInfo:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[AFPeerMap _getUUIDAndUpdateIDMapsForPeerInfo:](self, "_getUUIDAndUpdateIDMapsForPeerInfo:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_objectsByUUID, "setObject:forKey:", v6, v7);

}

- (void)removeObjectForPeerInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFPeerMap _getUUIDAndUpdateIDMapsForPeerInfo:](self, "_getUUIDAndUpdateIDMapsForPeerInfo:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_objectsByUUID, "removeObjectForKey:", v5);
  -[AFPeerMap _cleanUpUUIDMapsForPeerInfo:](self, "_cleanUpUUIDMapsForPeerInfo:", v4);

}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_objectsByUUID, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_getUUIDAndUpdateIDMapsForPeerInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD);
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[5];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__42393;
  v56 = __Block_byref_object_dispose__42394;
  v57 = 0;
  objc_msgSend(v4, "assistantIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_uuidsByAssistantIdentifier, "objectForKey:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v53[5];
    v53[5] = v6;

  }
  else
  {
    v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[AFPeerMap _getUUIDAndUpdateIDMapsForPeerInfo:]";
      v60 = 2112;
      v61 = v4;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s Missing assistantId in %@", buf, 0x16u);
    }
  }
  v9 = (void *)v53[5];
  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke;
    v51[3] = &unk_1E3A36DE8;
    v51[4] = &v52;
    v12 = (void *)MEMORY[0x1A1AC0C3C](v51);
    v49[0] = v11;
    v49[1] = 3221225472;
    v49[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_2;
    v49[3] = &unk_1E3A36F30;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v50 = v13;
    v14 = (void (**)(_QWORD))MEMORY[0x1A1AC0C3C](v49);
    v46[0] = v11;
    v46[1] = 3221225472;
    v46[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_3;
    v46[3] = &unk_1E3A36E10;
    v15 = v12;
    v48 = v15;
    v46[4] = self;
    v47 = v5;
    v16 = (void *)MEMORY[0x1A1AC0C3C](v46);
    objc_msgSend(v13, "addObject:", v16);

    objc_msgSend(v4, "rapportEffectiveIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[NSMutableDictionary objectForKey:](self->_uuidsByRapportIdentifier, "objectForKey:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v53[5];
      v53[5] = v18;

    }
    else
    {
      v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "-[AFPeerMap _getUUIDAndUpdateIDMapsForPeerInfo:]";
        v60 = 2112;
        v61 = v4;
        _os_log_error_impl(&dword_19AF50000, v20, OS_LOG_TYPE_ERROR, "%s Missing rapportId in %@", buf, 0x16u);
      }
    }
    if (v53[5])
    {
      v14[2](v14);
      v10 = (id)v53[5];
    }
    else
    {
      v43[0] = v11;
      v43[1] = 3221225472;
      v43[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_3;
      v43[3] = &unk_1E3A36E10;
      v21 = v15;
      v45 = v21;
      v43[4] = self;
      v44 = v17;
      v22 = (void *)MEMORY[0x1A1AC0C3C](v43);
      objc_msgSend(v13, "addObject:", v22);

      objc_msgSend(v4, "idsDeviceUniqueIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[NSMutableDictionary objectForKey:](self->_uuidsByIdsDeviceIdentifier, "objectForKey:", v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v53[5];
        v53[5] = v24;

      }
      if (v53[5])
      {
        v14[2](v14);
        v10 = (id)v53[5];
      }
      else
      {
        v40[0] = v11;
        v40[1] = 3221225472;
        v40[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_2_4;
        v40[3] = &unk_1E3A36E10;
        v36 = v21;
        v42 = v36;
        v40[4] = self;
        v35 = v23;
        v41 = v35;
        v26 = (void *)MEMORY[0x1A1AC0C3C](v40);
        objc_msgSend(v13, "addObject:", v26);

        objc_msgSend(v4, "homeKitAccessoryIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          -[NSMutableDictionary objectForKey:](self->_uuidsByHomeKitIdentifier, "objectForKey:", v27);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v53[5];
          v53[5] = v28;

        }
        if (!v53[5])
        {
          v37[0] = v11;
          v37[1] = 3221225472;
          v37[2] = __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_3_5;
          v37[3] = &unk_1E3A36E10;
          v39 = v36;
          v37[4] = self;
          v38 = v35;
          v30 = (void *)MEMORY[0x1A1AC0C3C](v37);
          objc_msgSend(v13, "addObject:", v30);

          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "UUIDString");
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v53[5];
          v53[5] = v32;

        }
        v14[2](v14);
        v10 = (id)v53[5];

      }
    }

  }
  _Block_object_dispose(&v52, 8);

  return v10;
}

- (void)_cleanUpUUIDMapsForPeerInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "assistantIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableDictionary removeObjectForKey:](self->_uuidsByAssistantIdentifier, "removeObjectForKey:", v4);
  objc_msgSend(v8, "rapportEffectiveIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[NSMutableDictionary removeObjectForKey:](self->_uuidsByRapportIdentifier, "removeObjectForKey:", v5);
  objc_msgSend(v8, "idsDeviceUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSMutableDictionary removeObjectForKey:](self->_uuidsByIdsDeviceIdentifier, "removeObjectForKey:", v6);
  objc_msgSend(v8, "homeKitAccessoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[NSMutableDictionary removeObjectForKey:](self->_uuidsByHomeKitIdentifier, "removeObjectForKey:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidsByHomeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_uuidsByIdsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_uuidsByRapportIdentifier, 0);
  objc_storeStrong((id *)&self->_uuidsByAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_objectsByUUID, 0);
}

void __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);

}

void __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], *(_QWORD *)(a1[4] + 16), a1[5]);
}

{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], *(_QWORD *)(a1[4] + 24), a1[5]);
}

uint64_t __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_2_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], *(_QWORD *)(a1[4] + 32), a1[5]);
}

uint64_t __48__AFPeerMap__getUUIDAndUpdateIDMapsForPeerInfo___block_invoke_3_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], *(_QWORD *)(a1[4] + 40), a1[5]);
}

@end
