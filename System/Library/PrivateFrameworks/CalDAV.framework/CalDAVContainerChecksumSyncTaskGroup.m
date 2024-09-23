@implementation CalDAVContainerChecksumSyncTaskGroup

- (CalDAVContainerChecksumSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 accountInfoProvider:(id)a7 taskManager:(id)a8 appSpecificCalendarItemClass:(Class)a9
{
  CalDAVContainerChecksumSyncTaskGroup *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  v9 = -[CalDAVContainerSyncTaskGroup initWithFolderURL:previousCTag:previousSyncToken:actions:accountInfoProvider:taskManager:appSpecificCalendarItemClass:](&v15, sel_initWithFolderURL_previousCTag_previousSyncToken_actions_accountInfoProvider_taskManager_appSpecificCalendarItemClass_, a3, a4, a5, a6, a7, a8, a9);
  v10 = (int)*MEMORY[0x24BE1AC40];
  objc_storeStrong((id *)&v9->_unusedCTag, *(id *)((char *)&v9->super.super.super.super.isa + v10));
  v11 = *(Class *)((char *)&v9->super.super.super.super.isa + v10);
  *(Class *)((char *)&v9->super.super.super.super.isa + v10) = 0;

  v12 = (int)*MEMORY[0x24BE1AC48];
  objc_storeStrong((id *)&v9->_unusedSyncToken, *(id *)((char *)&v9->super.super.super.super.isa + v12));
  v13 = *(Class *)((char *)&v9->super.super.super.super.isa + v12);
  *(Class *)((char *)&v9->super.super.super.super.isa + v12) = 0;

  *((_BYTE *)&v9->super.super.super.super.isa + (int)*MEMORY[0x24BE1AC58]) = 0;
  *((_BYTE *)&v9->super.super.super.super.isa + (int)*MEMORY[0x24BE1AC20]) = 1;
  v9->_mismatchDetected = 0;
  return v9;
}

- (void)_handleResponseToChecksumPropfind:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (int)*MEMORY[0x24BE1AC90];
  if (objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v5), "containsObject:", v4))
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v5), "removeObject:", v4);
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1AAB8]))
  {
    v8 = objc_msgSend(v6, "code");

    if (v8 == 503)
    {
      -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v6);
      goto LABEL_18;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1ADC8], CFSTR("checksum-versions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_preferredChecksumVersions;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v9, "supportsVersion:", v15))
        {
          -[CalDAVContainerChecksumSyncTaskGroup setBestServerChecksumVersion:](self, "setBestServerChecksumVersion:", v15);
          goto LABEL_17;
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_17:

  v16.receiver = self;
  v16.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  -[CoreDAVContainerSyncTaskGroup startTaskGroup](&v16, sel_startTaskGroup);

LABEL_18:
}

- (id)_calculatedCalendarHome
{
  return (id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE1AC28]), "CDVURLByDeletingLastPathComponent");
}

- (BOOL)_hadOutOfDateCollectionToken
{
  NSString *unusedSyncToken;
  NSString *unusedCTag;

  unusedSyncToken = self->_unusedSyncToken;
  if (unusedSyncToken
    && *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE1AC38])
    && !-[NSString isEqualToString:](unusedSyncToken, "isEqualToString:"))
  {
    return 1;
  }
  unusedCTag = self->_unusedCTag;
  if (unusedCTag)
  {
    if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE1AC30])
      && !-[NSString isEqualToString:](unusedCTag, "isEqualToString:"))
    {
      return 1;
    }
  }
  if (self->_unusedSyncToken)
    return 0;
  return self->_unusedCTag == 0;
}

- (void)_serverChecksumSupportPropfind
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id from;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ADC8], CFSTR("checksum-versions"), objc_opt_class());
  v4 = objc_alloc(MEMORY[0x24BE1ABA0]);
  -[CalDAVContainerChecksumSyncTaskGroup _calculatedCalendarHome](self, "_calculatedCalendarHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPropertiesToFind:atURL:withDepth:", v3, v5, 2);

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE1AC50]), "addObject:", v6);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v6, "setAccountInfoProvider:", WeakRetained);

  objc_msgSend(v6, "setTimeoutInterval:", *(double *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE1ACA0]));
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __70__CalDAVContainerChecksumSyncTaskGroup__serverChecksumSupportPropfind__block_invoke;
  v11 = &unk_24C1FB248;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  objc_msgSend(v6, "setCompletionBlock:", &v8);
  -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks", v8, v9, v10, v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __70__CalDAVContainerChecksumSyncTaskGroup__serverChecksumSupportPropfind__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleResponseToChecksumPropfind:", v2);

}

- (void)startTaskGroup
{
  objc_super v3;

  if (-[NSArray count](self->_preferredChecksumVersions, "count"))
  {
    -[CalDAVContainerChecksumSyncTaskGroup _serverChecksumSupportPropfind](self, "_serverChecksumSupportPropfind");
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
    -[CoreDAVContainerSyncTaskGroup startTaskGroup](&v3, sel_startTaskGroup);
  }
}

- (id)copyAdditionalResourcePropertiesToFetch
{
  id v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  v3 = -[CalDAVContainerSyncTaskGroup copyAdditionalResourcePropertiesToFetch](&v7, sel_copyAdditionalResourcePropertiesToFetch);
  v4 = v3;
  if (self->_bestServerChecksumVersion)
  {
    v5 = (id)objc_opt_new();
    objc_msgSend(v5, "setSet:", v4);
    objc_msgSend(v5, "addObject:", self->_bestServerChecksumVersion);
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (void)receivedPropertiesToValues:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  CoreDAVItemParserMapping *bestServerChecksumVersion;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *serverURLsToChecksums;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  -[CoreDAVContainerSyncTaskGroup receivedPropertiesToValues:forURL:](&v16, sel_receivedPropertiesToValues_forURL_, v6, v7);
  bestServerChecksumVersion = self->_bestServerChecksumVersion;
  if (bestServerChecksumVersion)
  {
    -[CoreDAVItemParserMapping nameSpace](bestServerChecksumVersion, "nameSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItemParserMapping name](self->_bestServerChecksumVersion, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CDVObjectForKeyWithNameSpace:andName:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "payloadAsString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      serverURLsToChecksums = self->_serverURLsToChecksums;
      if (!serverURLsToChecksums)
      {
        v14 = (NSMutableDictionary *)objc_opt_new();
        v15 = self->_serverURLsToChecksums;
        self->_serverURLsToChecksums = v14;

        serverURLsToChecksums = self->_serverURLsToChecksums;
      }
      -[NSMutableDictionary setObject:forKey:](serverURLsToChecksums, "setObject:forKey:", v12, v7);
    }

  }
}

- (BOOL)shouldDownloadResource:(id)a3 localETag:(id)a4 serverETag:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *localURLsToChecksums;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  if (-[CoreDAVContainerSyncTaskGroup shouldDownloadResource:localETag:serverETag:](&v21, sel_shouldDownloadResource_localETag_serverETag_, v8, v9, v10))
  {
    v11 = 1;
    if (!-[CalDAVContainerChecksumSyncTaskGroup _hadOutOfDateCollectionToken](self, "_hadOutOfDateCollectionToken"))
    {
      self->_mismatchDetected = 1;
      -[CoreDAVTaskGroup delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = 2 * (v9 != 0);
      objc_msgSend(v12, "reportMismatchedETag:forURL:inFolderWithURL:cTag:syncToken:eTag:mismatchType:", v10, v8, *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE1AC28]), self->_unusedCTag, self->_unusedSyncToken, v9, v20);
LABEL_16:

    }
  }
  else
  {
    if (self->_bestServerChecksumVersion)
    {
      if (!self->_localURLsToChecksums)
      {
        -[CoreDAVTaskGroup delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (NSDictionary *)objc_msgSend(v13, "copyLocalChecksumsForFolderWithURL:checksumVersion:", *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE1AC28]), self->_bestServerChecksumVersion);
        localURLsToChecksums = self->_localURLsToChecksums;
        self->_localURLsToChecksums = v14;

      }
      -[NSMutableDictionary objectForKey:](self->_serverURLsToChecksums, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](self->_localURLsToChecksums, "objectForKey:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        v17 = v12 == 0;
      else
        v17 = 1;
      if (v17 || (objc_msgSend(v12, "isEqualToString:", v16) & 1) != 0)
      {
        v11 = 0;
      }
      else
      {
        -[CoreDAVTaskGroup delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "reportMismatchedChecksum:forURL:inFolderWithURL:checksumVersion:eTag:", v12, v8, *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE1AC28]), self->_bestServerChecksumVersion, v10);

        v11 = 1;
      }

      goto LABEL_16;
    }
    v11 = 0;
  }

  return v11;
}

- (void)deleteResourceURLs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id obj;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[CalDAVContainerChecksumSyncTaskGroup _hadOutOfDateCollectionToken](self, "_hadOutOfDateCollectionToken"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      v8 = (int *)MEMORY[0x24BE1AC28];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          self->_mismatchDetected = 1;
          -[CoreDAVTaskGroup delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v12) = 1;
          objc_msgSend(v11, "reportMismatchedETag:forURL:inFolderWithURL:cTag:syncToken:eTag:mismatchType:", 0, v10, *(Class *)((char *)&self->super.super.super.super.isa + *v8), self->_unusedCTag, self->_unusedSyncToken, 0, v12);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)CalDAVContainerChecksumSyncTaskGroup;
  -[CoreDAVContainerSyncTaskGroup deleteResourceURLs:](&v14, sel_deleteResourceURLs_, v4);

}

- (NSArray)preferredChecksumVersions
{
  return self->_preferredChecksumVersions;
}

- (void)setPreferredChecksumVersions:(id)a3
{
  objc_storeStrong((id *)&self->_preferredChecksumVersions, a3);
}

- (CoreDAVItemParserMapping)bestServerChecksumVersion
{
  return self->_bestServerChecksumVersion;
}

- (void)setBestServerChecksumVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bestServerChecksumVersion, a3);
}

- (BOOL)mismatchDetected
{
  return self->_mismatchDetected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestServerChecksumVersion, 0);
  objc_storeStrong((id *)&self->_preferredChecksumVersions, 0);
  objc_storeStrong((id *)&self->_localURLsToChecksums, 0);
  objc_storeStrong((id *)&self->_serverURLsToChecksums, 0);
  objc_storeStrong((id *)&self->_unusedCTag, 0);
  objc_storeStrong((id *)&self->_unusedSyncToken, 0);
}

@end
