@implementation DAAssetUploader

- (DAAssetUploader)init
{
  DAAssetUploader *v2;
  uint64_t v3;
  NSMapTable *completionMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DAAssetUploader;
  v2 = -[DAAssetUploader init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithWeakToStrongObjects](NSMapTable, "mapTableWithWeakToStrongObjects"));
    completionMap = v2->_completionMap;
    v2->_completionMap = (NSMapTable *)v3;

  }
  return v2;
}

- (void)uploadAssets:(id)a3 wtihDeviceIdentity:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void (**v31)(id, void *, void *);
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void (**v51)(id, void *, void *);
  id v52;
  uint64_t v54;
  id obj;
  id obja;
  void *v57;
  id v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];

  v7 = a3;
  v58 = a4;
  v51 = (void (**)(id, void *, void *))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", DKErrorDomain, 0, 0));
    v51[2](v51, v10, v11);

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v50 = v7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "extra"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("name")));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "extra"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("encryptionKey")));

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "extra"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("token")));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "extra"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("extraHeaders")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v24));

        v26 = objc_alloc((Class)RepairToolRequestItem);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("https://genevaut-traffic.corp.apple.com/GenevaTrafficServer/PutAsset/171170.dev.asset.cosmeticInspection/"), "stringByAppendingString:", v18));
        v28 = objc_msgSend(v26, "initWithDestination:andEncryptionKey:andToken:andExtraHeaders:", v27, v20, v22, v25);
        objc_msgSend(v57, "addObject:", v28);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v13);
  }

  v29 = objc_claimAutoreleasedReturnValue(+[ASTUploadClientFactory repairToolUploadClientWithUploadRequests:andDelegate:](ASTUploadClientFactory, "repairToolUploadClientWithUploadRequests:andDelegate:", v57, self));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[DAAssetUploader completionMap](self, "completionMap"));
  v31 = objc_retainBlock(v51);
  obja = (id)v29;
  objc_msgSend(v30, "setObject:forKey:", v31, v29);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v33 = v58;
  if (v58)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "deviceIdentityCert"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "deviceIdentityPublicKeyDigest"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, CFSTR("certString"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v37, CFSTR("pubKeyDigest"));

  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v52 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "items"));
  v38 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v38)
  {
    v39 = v38;
    v54 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v39; j = (char *)j + 1)
      {
        if (*(_QWORD *)v61 != v54)
          objc_enumerationMutation(v52);
        v41 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "extra"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("name")));

        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("name"));
        if (v33)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "data"));
          v59 = 0;
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "signPayload:error:", v45, &v59));

          objc_msgSend(v44, "setObject:forKeyedSubscript:", v32, CFSTR("cert"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("pubKeyDigest")));
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v47, CFSTR("pubKeyDigest"));

          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "base64EncodedStringWithOptions:", 0));
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v48, CFSTR("sig"));

          v33 = v58;
        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "data"));
        objc_msgSend(obja, "queueUploadWithSourceData:andExtra:", v49, v44);

      }
      v39 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v39);
  }

}

- (void)ASTUploadClientDidCompleteFileUpload:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAAssetUploader completionMap](self, "completionMap"));
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v8));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAAssetUploader completionMap](self, "completionMap"));
    objc_msgSend(v6, "removeObjectForKey:", v8);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uploadStatus"));
    ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v7, 0);

  }
}

- (NSMapTable)completionMap
{
  return self->_completionMap;
}

- (void)setCompletionMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionMap, 0);
}

@end
