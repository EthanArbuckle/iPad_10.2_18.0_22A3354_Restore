@implementation GEOEnvironmentInfo

- (GEOEnvironmentInfo)initWithName:(id)a3 displayName:(id)a4 dictionaryRepresentation:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOEnvironmentInfo *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *displayName;
  uint64_t v16;
  NSString *actualName;
  uint64_t v18;
  NSDictionary *originalDictionaryRepresentation;
  GEOEnvironmentInfo *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)GEOEnvironmentInfo;
  v11 = -[GEOEnvironmentInfo init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    displayName = v11->_displayName;
    v11->_displayName = (NSString *)v14;

    v16 = objc_msgSend(v8, "copy");
    actualName = v11->_actualName;
    v11->_actualName = (NSString *)v16;

    v18 = objc_msgSend(v10, "copy");
    originalDictionaryRepresentation = v11->_originalDictionaryRepresentation;
    v11->_originalDictionaryRepresentation = (NSDictionary *)v18;

    v20 = v11;
  }

  return v11;
}

- (id)urlDictionary
{
  void *v3;
  uint64_t i;
  BOOL v5;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = 0;
  for (i = 0; i != 66; ++i)
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
    _recordForType(i, (uint64_t)&v9);
    if (DWORD2(v9))
      v5 = (_QWORD)v10 == 0;
    else
      v5 = 1;
    if (!v5)
    {
      GEODefaultsKeyStringForConfigKey(SDWORD2(v9), v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](self->_originalDictionaryRepresentation, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        if (!v3)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v6);
      }

    }
  }
  return v3;
}

- (void)_performActivation
{
  void *v3;
  void *v4;
  void *v5;
  NSProgress *v6;
  NSProgress *activationProgress;
  NSProgress *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  NSProgress *v13;
  GEOEnvironmentInfo *v14;

  -[GEOEnvironmentInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activationProgress"));
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openServerConnection");

  objc_msgSend(v3, "becomeCurrentWithPendingUnitCount:", 1);
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __40__GEOEnvironmentInfo__performActivation__block_invoke;
  v12 = &unk_1E1C0B448;
  v6 = v3;
  v13 = v6;
  v14 = self;
  objc_msgSend(v5, "updateManifest:completionHandler:", 2, &v9);

  -[NSProgress resignCurrent](v6, "resignCurrent", v9, v10, v11, v12);
  activationProgress = self->_activationProgress;
  self->_activationProgress = v6;
  v8 = v6;

  -[GEOEnvironmentInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activationProgress"));
}

void __40__GEOEnvironmentInfo__performActivation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD block[4];
  int8x16_t v6;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeServerConnection");

  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__GEOEnvironmentInfo__performActivation__block_invoke_2;
  block[3] = &unk_1E1C00738;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

_QWORD *__40__GEOEnvironmentInfo__performActivation__block_invoke_2(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  void *v4;

  result = *(_QWORD **)(a1 + 32);
  if (result[9] == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(result, "willChangeValueForKey:", CFSTR("activationProgress"));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = 0;

    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("activationProgress"));
  }
  return result;
}

- (void)makeActive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[GEOEnvironmentInfo urlDictionary](self, "urlDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  _setValue(GeoServicesConfig_DisableUpdatingActiveTileGroup, (uint64_t)off_1EDF4D548, 0, 0, 0);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("GEOVoltaireResourceManifestURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _setValue(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), 0, 0, 1);
  }
  else
  {
    _getValue(GeoServicesConfig_CustomEnvironmentURLFormat, (uint64_t)off_1EDF4CC28, 1, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _setValue(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), v4, 1, 1);

  }
  -[GEOEnvironmentInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _setValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88, v5, 1, 1);

  _setValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1EDF4E858, v7, 1, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("GEOCountryConfigurationProvidersDidChangeNotification"), self, 0);

  -[GEOEnvironmentInfo _performActivation](self, "_performActivation");
}

- (BOOL)isActive
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  _getValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88, 1, 0, &v7, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (unint64_t)(v7 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    -[GEOEnvironmentInfo name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", v5);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GEOResourceManifestDownload)resourceManifest
{
  return -[GEOResourceManifestDownload initWithResourceManifestData:]([GEOResourceManifestDownload alloc], "initWithResourceManifestData:", self->_manifestData);
}

- (id)_manifestURLString
{
  GEOResourceManifestConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(GEOResourceManifestConfiguration);
  -[GEOEnvironmentInfo name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManifestConfiguration setEnvironment:](v3, "setEnvironment:", v4);

  _getValue(GeoServicesConfig_CustomEnvironmentURLFormat, (uint64_t)off_1EDF4CC28, 1, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    GEOResourceManifestURLTokenQueryItems(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "_geo_URLWithString:tokenSubstitutions:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)reloadManifestDataWithCompletionHandler:(id)a3
{
  id v4;
  NSError *lastLoadingError;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  GEOEnvironmentInfo *v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  lastLoadingError = self->_lastLoadingError;
  self->_lastLoadingError = 0;

  -[GEOEnvironmentInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
  self->_state = 1;
  -[GEOEnvironmentInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
  v6 = (void *)MEMORY[0x1E0C99E98];
  -[GEOEnvironmentInfo _manifestURLString](self, "_manifestURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39E0]), "initWithURL:", v8);
  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestCounterTicketForType:auditToken:traits:", 3, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__87;
  v29 = __Block_byref_object_dispose__87;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E1C15268;
  v14 = v12;
  v24 = &v25;
  v20 = v14;
  v21 = self;
  v15 = v4;
  v23 = v15;
  v16 = v8;
  v22 = v16;
  objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v9, v19);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v26[5];
  v26[5] = v17;

  objc_msgSend(v14, "startingRequestWithTask:", v26[5]);
  objc_msgSend((id)v26[5], "resume");
  _Block_object_dispose(&v25, 8);

}

void __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "requestCompleted:", v7);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E1BFFC90;
    block[4] = *(_QWORD *)(a1 + 40);
    v15 = v7;
    v16 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v10 = v15;
  }
  else
  {
    v11 = v6;
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    geo_dispatch_async_qos();

    v10 = v11;
  }

}

uint64_t __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("state"));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 3;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("state"));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  BOOL IsValid;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;
  id v7;
  BOOL v8;

  IsValid = GEOResourceManifestDataIsValid(*(void **)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E1C15240;
  v8 = IsValid;
  v3 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("state"));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 48));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 2;
    GEOReleaseInfoForManifestData(*(void **)(a1 + 48));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v2;

    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("state"));
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Invalid manifest data for environment: %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    NSLog(CFSTR("%@"), v8);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = (id)*MEMORY[0x1E0C9AFA8];
    v11 = *MEMORY[0x1E0CB2D68];
    v17[0] = v10;
    v17[1] = v11;
    v18[0] = v8;
    v18[1] = CFSTR("Invalid Data");
    v17[2] = *MEMORY[0x1E0CB32F0];
    v18[2] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "GEOErrorWithCode:userInfo:", -11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 56);
    *(_QWORD *)(v14 + 56) = v13;

    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("state"));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 3;
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("state"));
    v16 = *(_QWORD *)(a1 + 56);
    if (v16)
      (*(void (**)(void))(v16 + 16))();

  }
}

- (id)serviceURLs
{
  void *manifestData;

  manifestData = self->_manifestData;
  if (manifestData)
  {
    _GEOGetURLInfoFromResourceManifest(manifestData, &__block_literal_global_161);
    manifestData = (void *)objc_claimAutoreleasedReturnValue();
  }
  return manifestData;
}

- (id)overrideURLs
{
  return 0;
}

- (id)useProxyAuth
{
  void *manifestData;

  manifestData = self->_manifestData;
  if (manifestData)
  {
    _GEOGetURLInfoFromResourceManifest(manifestData, &__block_literal_global_85_0);
    manifestData = (void *)objc_claimAutoreleasedReturnValue();
  }
  return manifestData;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)releaseName
{
  return self->_releaseName;
}

- (NSString)actualName
{
  return self->_actualName;
}

- (int64_t)state
{
  return self->_state;
}

- (NSError)lastLoadingError
{
  return self->_lastLoadingError;
}

- (NSProgress)activationProgress
{
  return self->_activationProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationProgress, 0);
  objc_storeStrong((id *)&self->_originalDictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_lastLoadingError, 0);
  objc_storeStrong((id *)&self->_manifestData, 0);
  objc_storeStrong((id *)&self->_actualName, 0);
  objc_storeStrong((id *)&self->_releaseName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
