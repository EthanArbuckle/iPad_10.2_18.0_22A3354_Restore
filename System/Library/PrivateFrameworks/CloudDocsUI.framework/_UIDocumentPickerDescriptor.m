@implementation _UIDocumentPickerDescriptor

+ (void)setHostBundleID:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)sHostBundleID != a3)
  {
    v3 = objc_msgSend(a3, "copy");
    v4 = (void *)sHostBundleID;
    sHostBundleID = v3;

  }
}

+ (id)hostBundleID
{
  return (id)sHostBundleID;
}

+ (void)setHostAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[4];
  sHostAuditToken = *(_OWORD *)a3->var0;
  unk_2554D7838 = v3;
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken
{
  __int128 v3;

  v3 = unk_2554D7838;
  *(_OWORD *)retstr->var0 = sHostAuditToken;
  *(_OWORD *)&retstr->var0[4] = v3;
  return result;
}

+ (void)setIsContentManaged:(BOOL)a3
{
  sIsContentManaged = a3;
}

+ (BOOL)isContentManaged
{
  return sIsContentManaged;
}

+ (BOOL)isInAddToiCloudDrive
{
  void *v2;
  char v3;

  objc_msgSend(a1, "hostBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.CloudDocsUI.AddToiCloudDrive"));

  return v3;
}

+ (id)allPickers
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  _UIDocumentPickerDescriptor *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  dispatch_semaphore_t dsema;
  void *v32;
  id v33;
  int v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  dispatch_semaphore_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v34 = objc_msgSend(a1, "isInAddToiCloudDrive");
  objc_msgSend(a1, "pickerOrder");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_semaphore_create(0);
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  v49 = 0;
  v4 = (void *)MEMORY[0x24BDD1550];
  v56 = *MEMORY[0x24BDD0C48];
  v57[0] = CFSTR("com.apple.fileprovider-ui");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __41___UIDocumentPickerDescriptor_allPickers__block_invoke;
  v41[3] = &unk_24E43B070;
  v43 = &v44;
  dsema = v3;
  v42 = dsema;
  objc_msgSend(v4, "extensionsWithMatchingAttributes:completion:", v5, v41);

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v45[5];
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v8 = (void *)getMCProfileConnectionClass_softClass;
  v54 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __getMCProfileConnectionClass_block_invoke;
    v50[3] = &unk_24E43B190;
    v50[4] = &v51;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v50);
    v8 = (void *)v52[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v51, 8);
  objc_msgSend(v9, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hostBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allowedAppBundleIDsForBidirectionalDataMovementAfterApplyingFilterToBundleIDs:localAppBundleID:localAccountIsManaged:", v7, v11, objc_msgSend(a1, "isContentManaged"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v55, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v38;
    v16 = *MEMORY[0x24BDF8110];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v12, "containsObject:", v19);

        if (v20)
        {
          objc_msgSend(v18, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.UIKit.fileprovider.default"));

          if ((v22 & 1) == 0)
          {
            if (!v34
              || (objc_msgSend(v18, "identifier"),
                  v23 = (void *)objc_claimAutoreleasedReturnValue(),
                  v24 = objc_msgSend(v23, "isEqualToString:", v16),
                  v23,
                  v24))
            {
              v25 = objc_alloc_init(_UIDocumentPickerDescriptor);
              -[_UIDocumentPickerDescriptor setExtension:](v25, "setExtension:", v18);
              -[_UIDocumentPickerDescriptor identifier](v25, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "isEqualToString:", v16);

              if (v27)
              {
                -[_UIDocumentPickerDescriptor setNewlyAdded:](v25, "setNewlyAdded:", 0);
              }
              else
              {
                -[_UIDocumentPickerDescriptor identifier](v25, "identifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UIDocumentPickerDescriptor setNewlyAdded:](v25, "setNewlyAdded:", objc_msgSend(v32, "containsObject:", v28) ^ 1);

              }
              objc_msgSend(v33, "addObject:", v25);

            }
          }
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v55, 16);
    }
    while (v14);
  }

  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __41___UIDocumentPickerDescriptor_allPickers__block_invoke_2;
  v35[3] = &unk_24E43B098;
  v29 = v32;
  v36 = v29;
  objc_msgSend(v33, "sortUsingComparator:", v35);

  _Block_object_dispose(&v44, 8);
  return v33;
}

- (BOOL)pickerEnabledForMode:(unint64_t)a3 documentTypes:(id)a4 reason:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  const __CFString *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  BOOL v23;
  id v24;
  id *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (-[_UIDocumentPickerDescriptor supportsPickerMode:](self, "supportsPickerMode:", a3))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[_UIDocumentPickerDescriptor supportedContentTypes](self, "supportedContentTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v28)
    {
      v10 = *(_QWORD *)v34;
      v26 = a5;
      v27 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v9);
          v12 = *(const __CFString **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v13 = v8;
          v14 = v8;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v30;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v30 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(const __CFString **)(*((_QWORD *)&v29 + 1) + 8 * j);
                if (a3 <= 1 && UTTypeConformsTo(v12, *(CFStringRef *)(*((_QWORD *)&v29 + 1) + 8 * j))
                  || UTTypeConformsTo(v19, v12))
                {

                  v23 = 1;
                  v8 = v13;
                  goto LABEL_30;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v16)
                continue;
              break;
            }
          }

          v8 = v13;
          v10 = v27;
        }
        a5 = v26;
        v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v28);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = CFSTR("Doesn’t support the file type");
LABEL_26:
    objc_msgSend(v20, "localizedStringForKey:value:table:", v22, v22, CFSTR("Localizable"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
      *a5 = v24;

  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = CFSTR("Doesn’t support importing files");
        goto LABEL_26;
      case 1uLL:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = CFSTR("Doesn’t support opening files");
        goto LABEL_26;
      case 2uLL:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = CFSTR("Doesn’t support exporting files");
        goto LABEL_26;
      case 3uLL:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = CFSTR("Doesn’t support moving files");
        goto LABEL_26;
      default:
        break;
    }
  }
  v23 = 0;
LABEL_30:

  return v23;
}

+ (id)allPickersForMode:(unint64_t)a3 documentTypes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  unint64_t v18;

  v6 = a4;
  objc_msgSend(a1, "allPickers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1758];
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __63___UIDocumentPickerDescriptor_allPickersForMode_documentTypes___block_invoke;
  v16 = &unk_24E43B0C0;
  v17 = v6;
  v18 = a3;
  v9 = v6;
  objc_msgSend(v8, "predicateWithBlock:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v10, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)filteredPickersForPickers:(id)a3 filter:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = &__block_literal_global_40;
  }
  else
  {
    v6 = &__block_literal_global_6;
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

+ (id)enabledPickersForMode:(unint64_t)a3 documentTypes:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "allPickersForMode:documentTypes:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredPickersForPickers:filter:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)manageablePickersForMode:(unint64_t)a3 documentTypes:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "allPickersForMode:documentTypes:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredPickersForPickers:filter:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultPickerIdentifierForMode:(unint64_t)a3 documentTypes:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "enabledPickersForMode:documentTypes:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)descriptorWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "allPickers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56___UIDocumentPickerDescriptor_descriptorWithIdentifier___block_invoke;
  v10[3] = &unk_24E43B168;
  v6 = v4;
  v11 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (void)__updateCloudEnabledStatus
{
  objc_msgSend(a1, "hostAuditToken");
  _UIDocumentPickerCloudEnabledStatus = BRGetCloudEnabledStatusForAuditToken();
}

+ (void)_updateCloudEnabledStatus
{
  int v3;
  id v4;

  v3 = _UIDocumentPickerCloudEnabledStatus;
  objc_msgSend(a1, "__updateCloudEnabledStatus");
  if (v3 != _UIDocumentPickerCloudEnabledStatus)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("_UIDocumentPickerDescriptorCloudEnabledStatusDidChange"), a1);

  }
}

+ (char)cloudEnabledStatus
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49___UIDocumentPickerDescriptor_cloudEnabledStatus__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cloudEnabledStatus_onceToken != -1)
    dispatch_once(&cloudEnabledStatus_onceToken, block);
  return _UIDocumentPickerCloudEnabledStatus;
}

+ (char)cloudMigrationStatus
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  char v6;

  BRPrimaryiCloudAccountCopyStatus();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (!v2)
  {
    cdui_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      +[_UIDocumentPickerDescriptor cloudMigrationStatus].cold.1((uint64_t)v3, v4);

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE17278]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  int64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[_UIDocumentPickerDescriptor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDF8110];
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF8110]);

  if ((v7 & 1) != 0)
  {
    v8 = -1;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v6);

    if ((v10 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[_UIDocumentPickerDescriptor localizedName](self, "localizedName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "localizedCaseInsensitiveCompare:", v12);

    }
  }

  return v8;
}

- (BOOL)supportsPickerMode:(unint64_t)a3
{
  __CFString *v3;
  void *v4;
  char v5;

  if (a3 > 3)
    v3 = 0;
  else
    v3 = off_24E43B1C8[a3];
  -[_UIDocumentPickerDescriptor _extensionValueOfClass:forKey:](self, "_extensionValueOfClass:forKey:", objc_opt_class(), CFSTR("UIDocumentPickerModes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (id)_ownBundle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDC1588];
  -[_UIDocumentPickerDescriptor extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginKitProxyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_parentApp
{
  void *v2;
  void *v3;

  -[_UIDocumentPickerDescriptor _ownBundle](self, "_ownBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containingBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  -[_UIDocumentPickerDescriptor extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BDF8110];
  v6 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDF8110]);

  if (v6)
  {
    v7 = v5;
  }
  else
  {
    -[_UIDocumentPickerDescriptor _parentApp](self, "_parentApp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

- (id)nonUIBundle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDC1538];
  -[_UIDocumentPickerDescriptor _parentApp](self, "_parentApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationProxyForBundleURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "plugInKitPlugins", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("NSExtensionPointIdentifier"), objc_opt_class(), 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.fileprovider-nonui")) & 1) != 0)
        {
          v13 = v11;

          goto LABEL_11;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (NSString)fileProviderDocumentGroup
{
  void *v2;
  void *v3;

  -[_UIDocumentPickerDescriptor nonUIBundle](self, "nonUIBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("NSExtensionFileProviderDocumentGroup"), objc_opt_class(), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)nonUIIdentifier
{
  void *v2;
  void *v3;

  -[_UIDocumentPickerDescriptor nonUIBundle](self, "nonUIBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  -[_UIDocumentPickerDescriptor _ownBundle](self, "_ownBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (-[_UIDocumentPickerDescriptor _ownBundle](self, "_ownBundle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "bundleIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v4, "isEqualToString:", v6),
        v6,
        v5,
        v7))
  {
    -[_UIDocumentPickerDescriptor _parentApp](self, "_parentApp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedName");
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  return (NSString *)v4;
}

- (id)imageWithScale:(double)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[_UIDocumentPickerDescriptor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF8110]);

  v7 = (void *)MEMORY[0x24BDF6AC8];
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("OpeniCloud"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithRenderingMode:", 2);
  }
  else
  {
    -[_UIDocumentPickerDescriptor _parentApp](self, "_parentApp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 0, a3);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_extensionValueOfClass:(Class)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  -[_UIDocumentPickerDescriptor extension](self, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61___UIDocumentPickerDescriptor__extensionValueOfClass_forKey___block_invoke;
    v11[3] = &unk_24E43A858;
    v11[4] = self;
    v12 = v5;
    if (_extensionValueOfClass_forKey__onceToken != -1)
      dispatch_once(&_extensionValueOfClass_forKey__onceToken, v11);

    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (NSArray)supportedContentTypes
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[_UIDocumentPickerDescriptor _extensionValueOfClass:forKey:](self, "_extensionValueOfClass:forKey:", objc_opt_class(), CFSTR("UIDocumentPickerSupportedFileTypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v7[0] = *MEMORY[0x24BDC1740];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSArray *)v5;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[_UIDocumentPickerDescriptor extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "attemptOptIn:", 0);
  else
    objc_msgSend(v4, "attemptOptOut:", 0);

}

- (BOOL)enabled
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;

  -[_UIDocumentPickerDescriptor identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF8110]);

  if (v4)
  {
    if (objc_msgSend((id)objc_opt_class(), "cloudEnabledStatus") != 1)
      return 0;
    objc_msgSend(MEMORY[0x24BE175F8], "allContainersByContainerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE17550]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6 != 0;
  }
  else
  {
    -[_UIDocumentPickerDescriptor extension](self, "extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "optedIn");
  }

  return v7;
}

+ (id)pickerOrder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  objc_msgSend(v2, "objectForKey:", CFSTR("_UIDocumentPickerSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("order"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = *MEMORY[0x24BDF8110];
  objc_msgSend(v8, "removeObject:", *MEMORY[0x24BDF8110]);
  objc_msgSend(v8, "insertObject:atIndex:", v9, 0);

  return v8;
}

+ (void)setOrderFromPickers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(a1, "allPickers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  objc_msgSend(v5, "objectForKey:", CFSTR("_UIDocumentPickerSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v12, "valueForKey:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("order"));
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("_UIDocumentPickerSettings"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_UIDocumentPickerDescriptor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIDocumentPickerDescriptor identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 1;
    else
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

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
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[_UIDocumentPickerDescriptor localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIDocumentPickerDescriptor enabled](self, "enabled");
  v7 = CFSTR("disabled");
  if (v6)
    v7 = CFSTR("enabled");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@, %@"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isNewlyAdded
{
  return self->_newlyAdded;
}

- (void)setNewlyAdded:(BOOL)a3
{
  self->_newlyAdded = a3;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
}

+ (void)cloudMigrationStatus
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_21F506000, a2, OS_LOG_TYPE_FAULT, "[ERROR] Could not get iCloud account status: %@", (uint8_t *)&v2, 0xCu);
}

@end
