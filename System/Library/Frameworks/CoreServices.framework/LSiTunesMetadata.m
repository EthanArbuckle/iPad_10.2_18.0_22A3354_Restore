@implementation LSiTunesMetadata

- (id)_initWithContext:(LSContext *)a3 bundleData:(const LSBundleData *)a4
{
  LSiTunesMetadata *v6;
  LSiTunesMetadata *v7;
  uint64_t v8;
  NSString *artistName;
  uint64_t v10;
  NSString *itemName;
  uint64_t v12;
  uint64_t v13;
  NSString *variantID;
  uint64_t v15;
  NSString *managementDeclarationIdentifier;
  uint64_t v17;
  NSString *genre;
  void *v19;
  int bundleFlags_high;
  uint64_t v21;
  NSString *storeCohort;
  uint64_t v23;
  uint64_t v24;
  NSArray *subgenres;
  uint64_t v26;
  NSString *ratingLabel;
  uint64_t v28;
  NSString *sourceApp;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  MIStoreMetadataDistributor *distributorInfo;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)LSiTunesMetadata;
  v6 = -[LSiTunesMetadata init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_storeItemIdentifier = a4->compatibilityState;
    v8 = _CSStringCopyCFString();
    artistName = v7->_artistName;
    v7->_artistName = (NSString *)v8;

    v10 = _CSStringCopyCFString();
    itemName = v7->_itemName;
    v7->_itemName = (NSString *)v10;

    v12 = 64;
    if ((*(_QWORD *)(&a4->_clas + 1) & 0x200000) == 0)
      v12 = 56;
    *(Class *)((char *)&v7->super.isa + v12) = *(Class *)(&a4->itemName + 1);
    v7->_storeFront = *(unint64_t *)((char *)&a4->familyID + 4);
    v13 = _CSStringCopyCFString();
    variantID = v7->_variantID;
    v7->_variantID = (NSString *)v13;

    v15 = _CSStringCopyCFString();
    managementDeclarationIdentifier = v7->_managementDeclarationIdentifier;
    v7->_managementDeclarationIdentifier = (NSString *)v15;

    v7->_deviceBasedVPP = (*(_QWORD *)(&a4->_clas + 1) & 0x8000000000000) != 0;
    v17 = _CSStringCopyCFString();
    genre = v7->_genre;
    v7->_genre = (NSString *)v17;

    v7->_genreIdentifier = *(_QWORD *)(&a4->managementDeclarationIdentifier + 1);
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a4->base.infoDictionary);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    bundleFlags_high = HIDWORD(a4->_bundleFlags);
    if ((bundleFlags_high & 0x4000) != 0)
    {
      objc_msgSend(v19, "objectForKey:ofClass:", CFSTR("storeCohort"), objc_opt_class());
      v21 = objc_claimAutoreleasedReturnValue();
      storeCohort = v7->_storeCohort;
      v7->_storeCohort = (NSString *)v21;

      bundleFlags_high = HIDWORD(a4->_bundleFlags);
    }
    if ((bundleFlags_high & 0x20000) != 0)
    {
      v23 = objc_opt_class();
      objc_msgSend(v19, "objectForKey:ofClass:valuesOfClass:", CFSTR("subgenres"), v23, objc_opt_class());
      v24 = objc_claimAutoreleasedReturnValue();
      subgenres = v7->_subgenres;
      v7->_subgenres = (NSArray *)v24;

    }
    if (!v7->_subgenres)
    {
      v7->_subgenres = (NSArray *)MEMORY[0x1E0C9AA60];

    }
    v7->_ratingRank = *(_QWORD *)&a4->sourceAppBundleID;
    v26 = _CSStringCopyCFString();
    ratingLabel = v7->_ratingLabel;
    v7->_ratingLabel = (NSString *)v26;

    v28 = _CSStringCopyCFString();
    sourceApp = v7->_sourceApp;
    v7->_sourceApp = (NSString *)v28;

    v30 = *(_QWORD *)(&a4->_clas + 1);
    v7->_purchasedRedownload = (v30 & 0x400000) != 0;
    v7->_gameCenterEnabled = (v30 & 0x2000000000000) != 0;
    v7->_gameCenterEverEnabled = (v30 & 0x4000000000000) != 0;
    v31 = (void *)MEMORY[0x186DAE7A0]();
    _LSPlistGet((uint64_t)a3->db, a4->ratingLabel);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _LSPlistDataGetDictionary(v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3AD70]), "initWithDictionary:", v33);
      distributorInfo = v7->_distributorInfo;
      v7->_distributorInfo = (MIStoreMetadataDistributor *)v34;

    }
    objc_autoreleasePoolPop(v31);

  }
  return v7;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (unint64_t)storeFront
{
  return self->_storeFront;
}

- (MIStoreMetadataDistributor)distributorInfo
{
  return (MIStoreMetadataDistributor *)(id)-[MIStoreMetadataDistributor copy](self->_distributorInfo, "copy");
}

- (unint64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementDeclarationIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceApp, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_subgenres, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_distributorInfo, 0);
}

- (LSiTunesMetadata)initWithCoder:(id)a3
{
  LSiTunesMetadata *v4;
  uint64_t v5;
  NSString *artistName;
  uint64_t v7;
  NSString *itemName;
  uint64_t v9;
  NSString *storeCohort;
  uint64_t v11;
  NSString *variantID;
  uint64_t v13;
  NSString *genre;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *v24;
  void *subgenres;
  uint64_t v26;
  NSString *ratingLabel;
  uint64_t v28;
  NSString *sourceApp;
  uint64_t v30;
  MIStoreMetadataDistributor *distributorInfo;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)LSiTunesMetadata;
  v4 = -[LSiTunesMetadata init](&v37, sel_init);
  if (v4)
  {
    v4->_storeItemIdentifier = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("storeItemIdentifier"));
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artistName"));
    v5 = objc_claimAutoreleasedReturnValue();
    artistName = v4->_artistName;
    v4->_artistName = (NSString *)v5;

    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemName"));
    v7 = objc_claimAutoreleasedReturnValue();
    itemName = v4->_itemName;
    v4->_itemName = (NSString *)v7;

    v4->_versionIdentifier = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("versionIdentifier"));
    v4->_betaVersionIdentifier = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("betaVersionIdentifier"));
    v4->_storeFront = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("storeFront"));
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeCohort"));
    v9 = objc_claimAutoreleasedReturnValue();
    storeCohort = v4->_storeCohort;
    v4->_storeCohort = (NSString *)v9;

    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variantID"));
    v11 = objc_claimAutoreleasedReturnValue();
    variantID = v4->_variantID;
    v4->_variantID = (NSString *)v11;

    v4->_deviceBasedVPP = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("deviceBasedVPP"));
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genre"));
    v13 = objc_claimAutoreleasedReturnValue();
    genre = v4->_genre;
    v4->_genre = (NSString *)v13;

    v4->_genreIdentifier = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("genreIdentifier"));
    XNSGetPropertyListClasses();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "ls_decodeObjectOfClasses:forKey:", v15, CFSTR("subgenres"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    v18 = _LSIsArrayWithValuesOfClasses(v16, v17);

    if (v18)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v20 = v16;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v34;
        while (2)
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v20);
            if ((_LSIsDictionaryWithKeysAndValuesOfClasses(*(void **)(*((_QWORD *)&v33 + 1) + 8 * v23), v19, 0) & 1) == 0)
            {

              goto LABEL_13;
            }
            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          if (v21)
            continue;
          break;
        }
      }

      v24 = (NSArray *)v20;
      subgenres = v4->_subgenres;
      v4->_subgenres = v24;
    }
    else
    {
LABEL_13:
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4864, (uint64_t)"-[LSiTunesMetadata initWithCoder:]", 229, 0);
      subgenres = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "failWithError:", subgenres);
    }

    v4->_ratingRank = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("ratingRank"));
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ratingLabel"));
    v26 = objc_claimAutoreleasedReturnValue();
    ratingLabel = v4->_ratingLabel;
    v4->_ratingLabel = (NSString *)v26;

    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceApp"));
    v28 = objc_claimAutoreleasedReturnValue();
    sourceApp = v4->_sourceApp;
    v4->_sourceApp = (NSString *)v28;

    v4->_purchasedRedownload = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("purchasedRedownload"));
    v4->_gameCenterEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("gameCenterEnabled"));
    v4->_gameCenterEverEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("gameCenterEverEnabled"));
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distributorInfo"));
    v30 = objc_claimAutoreleasedReturnValue();
    distributorInfo = v4->_distributorInfo;
    v4->_distributorInfo = (MIStoreMetadataDistributor *)v30;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_storeItemIdentifier, CFSTR("storeItemIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_artistName, CFSTR("artistName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_itemName, CFSTR("itemName"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_versionIdentifier, CFSTR("versionIdentifier"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_betaVersionIdentifier, CFSTR("betaVersionIdentifier"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_storeFront, CFSTR("storeFront"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_storeCohort, CFSTR("storeCohort"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_variantID, CFSTR("variantID"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_deviceBasedVPP, CFSTR("deviceBasedVPP"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_genre, CFSTR("genre"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_genreIdentifier, CFSTR("genreIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_subgenres, CFSTR("subgenres"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_ratingRank, CFSTR("ratingRank"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ratingLabel, CFSTR("ratingLabel"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_sourceApp, CFSTR("sourceApp"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_purchasedRedownload, CFSTR("purchasedRedownload"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_gameCenterEnabled, CFSTR("gameCenterEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_gameCenterEverEnabled, CFSTR("gameCenterEverEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_distributorInfo, CFSTR("distributorInfo"));
}

- (NSString)genre
{
  return self->_genre;
}

- (NSArray)subgenres
{
  return self->_subgenres;
}

- (unint64_t)genreIdentifier
{
  return self->_genreIdentifier;
}

- (unint64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (NSString)storeCohort
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v9;

  v9 = 0;
  -[LSiTunesMetadata storeCohortWithError:](self, "storeCohortWithError:", &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;
  v4 = v3;
  if (!v2)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", CFSTR("LSApplicationWorkspaceErrorDomain")) & 1) != 0)
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == 113)
        goto LABEL_9;
    }
    else
    {

    }
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[LSiTunesMetadata storeCohort].cold.1((uint64_t)v4, v7);

  }
LABEL_9:

  return (NSString *)v2;
}

- (id)storeCohortWithError:(id *)a3
{
  NSString *v4;
  id v5;

  v4 = self->_storeCohort;
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), 113, (uint64_t)"-[LSiTunesMetadata storeCohortWithError:]", 259, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v5 = objc_retainAutorelease(v5);
      *a3 = v5;
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (LSiTunesMetadata)new
{
  abort();
}

- (LSiTunesMetadata)init
{
  abort();
}

- (NSString)itemName
{
  return self->_itemName;
}

- (unint64_t)betaVersionIdentifier
{
  return self->_betaVersionIdentifier;
}

- (NSString)variantID
{
  return self->_variantID;
}

- (BOOL)isDeviceBasedVPP
{
  return self->_deviceBasedVPP;
}

- (unint64_t)ratingRank
{
  return self->_ratingRank;
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (NSString)sourceApp
{
  return self->_sourceApp;
}

- (BOOL)isPurchasedRedownload
{
  return self->_purchasedRedownload;
}

- (BOOL)isGameCenterEnabled
{
  return self->_gameCenterEnabled;
}

- (BOOL)wasGameCenterEverEnabled
{
  return self->_gameCenterEverEnabled;
}

- (NSString)managementDeclarationIdentifier
{
  return self->_managementDeclarationIdentifier;
}

- (void)storeCohort
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Because a caller called the deprecated method storeCohort, the error %@ is being dropped on the floor. That caller should use storeCohortWithError: instead.", (uint8_t *)&v2, 0xCu);
}

@end
