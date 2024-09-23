@implementation ASDApp

- (void)setStoreFront:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)setExtensions:(int64_t)a3
{
  self->_extensions = a3;
}

- (void)setExecutablePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setBundleShortVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)setBundlePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setStoreItemID:(int64_t)a3
{
  self->_storeItemID = a3;
}

- (void)setStoreExternalVersionID:(int64_t)a3
{
  self->_storeExternalVersionID = a3;
}

- (void)setStoreCohort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (BOOL)isEqual:(id)a3
{
  ASDApp *v4;
  BOOL v5;

  v4 = (ASDApp *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ASDApp isEqualToApp:](self, "isEqualToApp:", v4);
  }

  return v5;
}

- (BOOL)isFamilyShared
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 1) & 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[ASDApp artistName](self, "artistName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v4, CFSTR("A"));

  -[ASDApp bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("B"));

  objc_msgSend(v18, "encodeInteger:forKey:", -[ASDApp extensions](self, "extensions"), CFSTR("G"));
  objc_msgSend(v18, "encodeInteger:forKey:", -[ASDApp status](self, "status"), CFSTR("L"));
  -[ASDApp installError](self, "installError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    ASDErrorWithSafeUserInfo(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("S"));

  }
  -[ASDApp bundlePath](self, "bundlePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("C"));

  -[ASDApp bundleShortVersion](self, "bundleShortVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("D"));

  -[ASDApp bundleVersion](self, "bundleVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("E"));

  -[ASDApp executablePath](self, "executablePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v12, CFSTR("T"));

  -[ASDApp localizedName](self, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("I"));

  objc_msgSend(v18, "encodeInt64:forKey:", -[ASDApp storeExternalVersionID](self, "storeExternalVersionID"), CFSTR("O"));
  objc_msgSend(v18, "encodeInt64:forKey:", -[ASDApp storeItemID](self, "storeItemID"), CFSTR("P"));
  -[ASDApp storeCohort](self, "storeCohort");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("M"));

  -[ASDApp storeFront](self, "storeFront");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("N"));

  objc_msgSend(v18, "encodeInt64:forKey:", -[ASDApp downloaderDSID](self, "downloaderDSID"), CFSTR("F"));
  objc_msgSend(v18, "encodeInt64:forKey:", -[ASDApp familyID](self, "familyID"), CFSTR("H"));
  objc_msgSend(v18, "encodeInt64:forKey:", -[ASDApp purchaserDSID](self, "purchaserDSID"), CFSTR("J"));
  -[ASDApp remoteProgress](self, "remoteProgress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v16, CFSTR("K"));

  -[ASDApp updateBuyParams](self, "updateBuyParams");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("Q"));

  objc_msgSend(v18, "encodeObject:forKey:", self->_updateInstallDate, CFSTR("W"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_rawUpdateData, CFSTR("V"));
  objc_msgSend(v18, "encodeInteger:forKey:", -[ASDApp watchApplicationMode](self, "watchApplicationMode"), CFSTR("R"));

}

- (int64_t)storeItemID
{
  return self->_storeItemID;
}

- (ASDProgress)remoteProgress
{
  ASDUnfairLock *propertyLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__ASDApp_remoteProgress__block_invoke;
  v5[3] = &unk_1E37BDC70;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDProgress *)v3;
}

void __24__ASDApp_remoteProgress__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (int64_t)storeExternalVersionID
{
  return self->_storeExternalVersionID;
}

- (NSError)installError
{
  return (NSError *)objc_getProperty(self, a2, 224, 1);
}

- (BOOL)isLaunchProhibited
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 4) & 1;
}

- (BOOL)isUpdateAvailable
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 3) & 1;
}

- (BOOL)isStoreApp
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 8) & 1;
}

- (BOOL)isBetaApp
{
  return -[ASDApp status](self, "status") & 1;
}

- (BOOL)isAppClip
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 11) & 1;
}

- (BOOL)isInstalled
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 2) & 1;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)watchApplicationMode
{
  return self->_watchApplicationMode;
}

- (NSString)updateBuyParams
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSNumber)storeFront
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (NSString)storeCohort
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (int64_t)purchaserDSID
{
  return self->_purchaserDSID;
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (int64_t)familyID
{
  return self->_familyID;
}

- (NSString)executablePath
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (int64_t)downloaderDSID
{
  return self->_downloaderDSID;
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)bundleShortVersion
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)bundlePath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)hasMessagesExtension
{
  return -[ASDApp extensions](self, "extensions") & 1;
}

- (int64_t)extensions
{
  return self->_extensions;
}

- (ASDApp)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASDApp *v6;
  uint64_t v7;
  NSString *artistName;
  uint64_t v9;
  NSError *installError;
  uint64_t v11;
  NSString *bundlePath;
  uint64_t v13;
  NSString *bundleShortVersion;
  uint64_t v15;
  NSString *bundleVersion;
  uint64_t v17;
  NSString *executablePath;
  uint64_t v19;
  NSString *localizedName;
  uint64_t v21;
  NSString *storeCohort;
  uint64_t v23;
  NSNumber *storeFront;
  uint64_t v25;
  ASDProgress *remoteProgress;
  uint64_t v27;
  NSString *updateBuyParams;
  uint64_t v29;
  NSDate *updateInstallDate;
  uint64_t v31;
  NSData *rawUpdateData;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("B"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASDApp initWithBundleID:](self, "initWithBundleID:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("A"));
    v7 = objc_claimAutoreleasedReturnValue();
    artistName = v6->_artistName;
    v6->_artistName = (NSString *)v7;

    v6->_extensions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("G"));
    v6->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("L"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("S"));
    v9 = objc_claimAutoreleasedReturnValue();
    installError = v6->_installError;
    v6->_installError = (NSError *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("C"));
    v11 = objc_claimAutoreleasedReturnValue();
    bundlePath = v6->_bundlePath;
    v6->_bundlePath = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("D"));
    v13 = objc_claimAutoreleasedReturnValue();
    bundleShortVersion = v6->_bundleShortVersion;
    v6->_bundleShortVersion = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("E"));
    v15 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v6->_bundleVersion;
    v6->_bundleVersion = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("T"));
    v17 = objc_claimAutoreleasedReturnValue();
    executablePath = v6->_executablePath;
    v6->_executablePath = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("I"));
    v19 = objc_claimAutoreleasedReturnValue();
    localizedName = v6->_localizedName;
    v6->_localizedName = (NSString *)v19;

    v6->_softwarePlatform = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("U"));
    v6->_storeExternalVersionID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("O"));
    v6->_storeItemID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("P"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("M"));
    v21 = objc_claimAutoreleasedReturnValue();
    storeCohort = v6->_storeCohort;
    v6->_storeCohort = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("N"));
    v23 = objc_claimAutoreleasedReturnValue();
    storeFront = v6->_storeFront;
    v6->_storeFront = (NSNumber *)v23;

    v6->_downloaderDSID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("F"));
    v6->_familyID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("H"));
    v6->_purchaserDSID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("J"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("K"));
    v25 = objc_claimAutoreleasedReturnValue();
    remoteProgress = v6->_remoteProgress;
    v6->_remoteProgress = (ASDProgress *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Q"));
    v27 = objc_claimAutoreleasedReturnValue();
    updateBuyParams = v6->_updateBuyParams;
    v6->_updateBuyParams = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("W"));
    v29 = objc_claimAutoreleasedReturnValue();
    updateInstallDate = v6->_updateInstallDate;
    v6->_updateInstallDate = (NSDate *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("V"));
    v31 = objc_claimAutoreleasedReturnValue();
    rawUpdateData = v6->_rawUpdateData;
    v6->_rawUpdateData = (NSData *)v31;

    v6->_watchApplicationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("R"));
  }

  return v6;
}

- (ASDApp)initWithBundleID:(id)a3
{
  id v4;
  ASDApp *v5;
  uint64_t v6;
  NSString *bundleID;
  ASDUnfairLock *v8;
  ASDUnfairLock *propertyLock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDApp;
  v5 = -[ASDApp init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_openableStatus = -1;
    v8 = objc_alloc_init(ASDUnfairLock);
    propertyLock = v5->_propertyLock;
    v5->_propertyLock = v8;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ASDApp bundleID](self, "bundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  BOOL v35;
  BOOL v36;
  void *v38;
  void *v39;
  void *v40;
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

  v4 = a3;
  -[ASDApp artistName](self, "artistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6 || objc_msgSend(v5, "isEqual:", v6))
  {
    -[ASDApp bundleID](self, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v7 == v8 || objc_msgSend(v7, "isEqual:", v8))
      && (v9 = -[ASDApp extensions](self, "extensions"), v9 == objc_msgSend(v4, "extensions"))
      && (v10 = -[ASDApp status](self, "status"), v10 == objc_msgSend(v4, "status")))
    {
      -[ASDApp installError](self, "installError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "installError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12 || objc_msgSend(v11, "isEqual:", v12))
      {
        -[ASDApp bundlePath](self, "bundlePath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bundlePath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == v14 || objc_msgSend(v13, "isEqual:", v14))
        {
          v49 = v11;
          v50 = v14;
          -[ASDApp bundleShortVersion](self, "bundleShortVersion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bundleShortVersion");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v15;
          if (v15 == v16 || objc_msgSend(v15, "isEqual:", v16))
          {
            v46 = v12;
            v47 = v16;
            -[ASDApp bundleVersion](self, "bundleVersion");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "bundleVersion");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17 == v18 || objc_msgSend(v17, "isEqual:", v18))
            {
              v19 = v13;
              v45 = v18;
              -[ASDApp executablePath](self, "executablePath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "executablePath");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v20;
              if (v20 == v21 || objc_msgSend(v20, "isEqual:", v21))
              {
                v42 = v19;
                v43 = v21;
                v22 = -[ASDApp storeExternalVersionID](self, "storeExternalVersionID");
                if (v22 == objc_msgSend(v4, "storeExternalVersionID"))
                {
                  -[ASDApp storeCohort](self, "storeCohort");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "storeCohort");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v23 == v24 || objc_msgSend(v23, "isEqual:", v24))
                  {
                    v41 = v24;
                    -[ASDApp storeFront](self, "storeFront");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "storeFront");
                    v26 = objc_claimAutoreleasedReturnValue();
                    v40 = (void *)v26;
                    if (v25 == (void *)v26 || objc_msgSend(v25, "isEqual:", v26))
                    {
                      v38 = v25;
                      v39 = v23;
                      v27 = -[ASDApp storeItemID](self, "storeItemID");
                      if (v27 == objc_msgSend(v4, "storeItemID")
                        && (v28 = -[ASDApp downloaderDSID](self, "downloaderDSID"),
                            v28 == objc_msgSend(v4, "downloaderDSID"))
                        && (v29 = -[ASDApp familyID](self, "familyID"), v29 == objc_msgSend(v4, "familyID"))
                        && (v30 = -[ASDApp purchaserDSID](self, "purchaserDSID"),
                            v30 == objc_msgSend(v4, "purchaserDSID")))
                      {
                        -[ASDApp updateBuyParams](self, "updateBuyParams");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v4, "updateBuyParams");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v31 == v32 || objc_msgSend(v31, "isEqual:", v32))
                        {
                          v33 = v32;
                          v34 = -[ASDApp watchApplicationMode](self, "watchApplicationMode");
                          v35 = v34 == objc_msgSend(v4, "watchApplicationMode");
                          v32 = v33;
                          v36 = v35;
                        }
                        else
                        {
                          v36 = 0;
                        }

                      }
                      else
                      {
                        v36 = 0;
                      }
                      v19 = v42;
                      v25 = v38;
                      v23 = v39;
                    }
                    else
                    {
                      v36 = 0;
                    }

                    v24 = v41;
                  }
                  else
                  {
                    v36 = 0;
                  }

                }
                else
                {
                  v36 = 0;
                }
                v21 = v43;
              }
              else
              {
                v36 = 0;
              }

              v18 = v45;
              v13 = v19;
            }
            else
            {
              v36 = 0;
            }

            v12 = v46;
            v16 = v47;
          }
          else
          {
            v36 = 0;
          }

          v14 = v50;
          v11 = v49;
        }
        else
        {
          v36 = 0;
        }

      }
      else
      {
        v36 = 0;
      }

    }
    else
    {
      v36 = 0;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)artistName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateBuyParams, 0);
  objc_storeStrong((id *)&self->_installID, 0);
  objc_storeStrong((id *)&self->_installError, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_rawUpdateData, 0);
  objc_storeStrong((id *)&self->_updateMetadata, 0);
  objc_storeStrong((id *)&self->_updateInstallDate, 0);
  objc_storeStrong((id *)&self->_remoteProgress, 0);
  objc_storeStrong((id *)&self->_postProcessProgress, 0);
  objc_storeStrong((id *)&self->_installProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
}

- (int64_t)progressPhase
{
  return self->_progressPhase;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasUnknownDistributor
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 15) & 1;
}

- (BOOL)isArcadeOpenable
{
  return -[ASDApp _cachedOpenableStatus](self) & 1;
}

- (uint64_t)_cachedOpenableStatus
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  _BYTE v10[24];
  void *v11;
  _QWORD *v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "executablePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
  {
    v4 = -[ASDApp _openableStatus]((uint64_t)a1);
    if ((_DWORD)v4 == 255)
    {
      v5 = +[ASDAppLibrary openableStatusForExecutableAtPath:](ASDAppLibrary, "openableStatusForExecutableAtPath:", v3);
      v8 = (void *)a1[2];
      *(_QWORD *)v10 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v10[8] = 3221225472;
      *(_QWORD *)&v10[16] = __29__ASDApp__setOpenableStatus___block_invoke;
      v11 = &unk_1E37BE338;
      v12 = a1;
      v13 = v5;
      ASDWithLock(v8, v10);
      ASDLogHandleForCategory(12);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v10 = 138412546;
        *(_QWORD *)&v10[4] = v3;
        *(_WORD *)&v10[12] = 1024;
        *(_DWORD *)&v10[14] = v5;
        v7 = "[Library] Loaded openable status for '%@': %i";
        goto LABEL_13;
      }
    }
    else
    {
      v5 = v4;
      ASDLogHandleForCategory(12);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v10 = 138412546;
        *(_QWORD *)&v10[4] = v3;
        *(_WORD *)&v10[12] = 1024;
        *(_DWORD *)&v10[14] = v5;
        v7 = "[Library] Cached openable status for '%@': %i";
LABEL_13:
        _os_log_debug_impl(&dword_19A03B000, v6, OS_LOG_TYPE_DEBUG, v7, v10, 0x12u);
      }
    }

    goto LABEL_10;
  }
  v5 = 255;
LABEL_10:

  return v5;
}

- (BOOL)isOpenable
{
  return (-[ASDApp _cachedOpenableStatus](self) >> 1) & 1;
}

- (BOOL)isOcelot
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 5) & 1;
}

- (BOOL)isPlaceholder
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 7) & 1;
}

- (BOOL)isSystemApp
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 9) & 1;
}

- (BOOL)isWrapped
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 12) & 1;
}

- (NSProgress)progress
{
  ASDUnfairLock *propertyLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __18__ASDApp_progress__block_invoke;
  v5[3] = &unk_1E37BDC70;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSProgress *)v3;
}

void __18__ASDApp_progress__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)setProgress:(id)a3
{
  id v4;
  ASDUnfairLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__ASDApp_setProgress___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  ASDWithLock(propertyLock, v7);

}

void __22__ASDApp_setProgress___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (NSProgress)downloadProgress
{
  ASDUnfairLock *propertyLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__ASDApp_downloadProgress__block_invoke;
  v5[3] = &unk_1E37BDC70;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSProgress *)v3;
}

void __26__ASDApp_downloadProgress__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)setDownloadProgress:(id)a3
{
  id v4;
  ASDUnfairLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__ASDApp_setDownloadProgress___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  ASDWithLock(propertyLock, v7);

}

void __30__ASDApp_setDownloadProgress___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (BOOL)hasPostProcessing
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 13) & 1;
}

- (void)setHasPostProcessing:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[ASDApp status](self, "status") & 0xFFFFFFFFFFFFDFFFLL;
  v6 = 0x2000;
  if (!v3)
    v6 = 0;
  -[ASDApp setStatus:](self, "setStatus:", v5 | v6);
}

- (NSProgress)installProgress
{
  ASDUnfairLock *propertyLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__ASDApp_installProgress__block_invoke;
  v5[3] = &unk_1E37BDC70;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSProgress *)v3;
}

void __25__ASDApp_installProgress__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)setInstallProgress:(id)a3
{
  id v4;
  ASDUnfairLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__ASDApp_setInstallProgress___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  ASDWithLock(propertyLock, v7);

}

void __29__ASDApp_setInstallProgress___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (NSProgress)postProcessProgress
{
  ASDUnfairLock *propertyLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__ASDApp_postProcessProgress__block_invoke;
  v5[3] = &unk_1E37BDC70;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSProgress *)v3;
}

void __29__ASDApp_postProcessProgress__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)setPostProcessProgress:(id)a3
{
  id v4;
  ASDUnfairLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__ASDApp_setPostProcessProgress___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  ASDWithLock(propertyLock, v7);

}

void __33__ASDApp_setPostProcessProgress___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void)setRemoteProgress:(id)a3
{
  id v4;
  ASDUnfairLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__ASDApp_setRemoteProgress___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  ASDWithLock(propertyLock, v7);

}

void __28__ASDApp_setRemoteProgress___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

- (BOOL)autoUpdateEnabled
{
  return ((unint64_t)-[ASDApp status](self, "status") >> 14) & 1;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[ASDApp status](self, "status") & 0xFFFFFFFFFFFFBFFFLL;
  v6 = 0x4000;
  if (!v3)
    v6 = 0;
  -[ASDApp setStatus:](self, "setStatus:", v5 | v6);
}

- (NSDate)updateInstallDate
{
  ASDUnfairLock *propertyLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__ASDApp_updateInstallDate__block_invoke;
  v5[3] = &unk_1E37BDC70;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __27__ASDApp_updateInstallDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)setUpdateInstallDate:(id)a3
{
  id v4;
  ASDUnfairLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__ASDApp_setUpdateInstallDate___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  ASDWithLock(propertyLock, v7);

}

void __31__ASDApp_setUpdateInstallDate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

- (NSDictionary)updateMetadata
{
  ASDUnfairLock *propertyLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__ASDApp_updateMetadata__block_invoke;
  v5[3] = &unk_1E37BF008;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __24__ASDApp_updateMetadata__block_invoke(uint64_t a1)
{
  -[ASDApp _loadUpdateMetadataIfNecessary](*(_QWORD *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)_loadUpdateMetadataIfNecessary
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (a1 && !*(_QWORD *)(a1 + 80))
  {
    if (objc_msgSend(*(id *)(a1 + 88), "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", *(_QWORD *)(a1 + 88), 0, 0);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v2;

    }
    else if (!*(_BYTE *)(a1 + 8))
    {
      if (*(_QWORD *)(a1 + 104))
      {
        *(_BYTE *)(a1 + 8) = 1;
        +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "getUpdatesServiceWithError:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = MEMORY[0x1E0C809B0];
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __40__ASDApp__loadUpdateMetadataIfNecessary__block_invoke;
        v10[3] = &unk_1E37BDDB0;
        v10[4] = a1;
        objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = *(_QWORD *)(a1 + 104);
        v9[0] = v6;
        v9[1] = 3221225472;
        v9[2] = __40__ASDApp__loadUpdateMetadataIfNecessary__block_invoke_4;
        v9[3] = &unk_1E37BF030;
        v9[4] = a1;
        objc_msgSend(v7, "getUpdateMetadataForBundleID:withReplyHandler:", v8, v9);

      }
    }
  }
}

- (void)setUpdateMetadata:(id)a3
{
  id v4;
  ASDUnfairLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__ASDApp_setUpdateMetadata___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  ASDWithLock(propertyLock, v7);

}

void __28__ASDApp_setUpdateMetadata___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

- (NSData)rawUpdateData
{
  ASDUnfairLock *propertyLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__ASDApp_rawUpdateData__block_invoke;
  v5[3] = &unk_1E37BDC70;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __23__ASDApp_rawUpdateData__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)setRawUpdateData:(id)a3
{
  id v4;
  ASDUnfairLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__ASDApp_setRawUpdateData___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  ASDWithLock(propertyLock, v7);

}

void __27__ASDApp_setRawUpdateData___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

- (uint64_t)_openableStatus
{
  void *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -1;
  v1 = *(void **)(a1 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__ASDApp__openableStatus__block_invoke;
  v4[3] = &unk_1E37BDC70;
  v4[4] = a1;
  v4[5] = &v5;
  ASDWithLock(v1, v4);
  v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __25__ASDApp__openableStatus__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __29__ASDApp__setOpenableStatus___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = *(_BYTE *)(result + 40);
  return result;
}

- (void)loadUpdateMetadataIfNecessary
{
  ASDUnfairLock *propertyLock;
  _QWORD v3[5];

  propertyLock = self->_propertyLock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__ASDApp_loadUpdateMetadataIfNecessary__block_invoke;
  v3[3] = &unk_1E37BDD60;
  v3[4] = self;
  ASDWithLock(propertyLock, v3);
}

void __39__ASDApp_loadUpdateMetadataIfNecessary__block_invoke(uint64_t a1)
{
  -[ASDApp _loadUpdateMetadataIfNecessary](*(_QWORD *)(a1 + 32));
}

void __40__ASDApp__loadUpdateMetadataIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2114;
    v8 = v2;
    v4 = v6;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: Error fetching updates service: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

void __40__ASDApp__loadUpdateMetadataIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "length"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v4;

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  objc_super v44;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ASDApp bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("bundleID = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  if (-[ASDApp hasUnknownDistributor](self, "hasUnknownDistributor"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasUnknownDistributor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[ASDApp isStoreApp](self, "isStoreApp"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storeItemID = %lld"), -[ASDApp storeItemID](self, "storeItemID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

    -[ASDApp storeCohort](self, "storeCohort");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[ASDApp storeCohort](self, "storeCohort");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("storeCohort = %@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v12);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storeExternalVersionID = %lld"), -[ASDApp storeExternalVersionID](self, "storeExternalVersionID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

    if (!-[ASDApp isBetaApp](self, "isBetaApp") && !-[ASDApp isSystemApp](self, "isSystemApp"))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = -[ASDApp isUpdateAvailable](self, "isUpdateAvailable");
      v16 = CFSTR("NO");
      if (v15)
        v16 = CFSTR("YES");
      objc_msgSend(v14, "stringWithFormat:", CFSTR("update available = %@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v17);

    }
  }
  -[ASDApp progress](self, "progress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "fractionCompleted");
    objc_msgSend(v20, "stringWithFormat:", CFSTR("fractionCompleted = %.2f"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);
  }
  else
  {
    -[ASDApp remoteProgress](self, "remoteProgress");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v23;
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("completedUnitCount = %lld"), objc_msgSend(v23, "completedUnitCount"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v24);

    }
  }

  v25 = (void *)MEMORY[0x1E0CB3940];
  -[ASDApp bundlePath](self, "bundlePath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("path = %@"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("installed = %d"), -[ASDApp isInstalled](self, "isInstalled"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  if (-[ASDApp isOcelot](self, "isOcelot"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("ocelot = 1"));
    v29 = -[ASDApp _openableStatus]((uint64_t)self);
    if (v29 == 255)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("arcadeOpenable = ?"), v43);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("arcadeOpenable = %d"), v29 & 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  if (-[ASDApp watchApplicationMode](self, "watchApplicationMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("watch application mode = %ld"), -[ASDApp watchApplicationMode](self, "watchApplicationMode"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v31);

  }
  -[ASDApp installError](self, "installError");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    -[ASDApp installError](self, "installError");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("installError = %@"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v35);

  }
  if (self->_updateInstallDate)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updateInstallDate: %@"), self->_updateInstallDate);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v36);

  }
  if (self->_updateMetadata)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updateMetadata: %@"), self->_updateMetadata);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v37);

  }
  v38 = (void *)MEMORY[0x1E0CB3940];
  v44.receiver = self;
  v44.super_class = (Class)ASDApp;
  -[ASDApp description](&v44, sel_description);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: {%@}"), v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDApp *v5;
  void *v6;
  ASDApp *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v26;

  v5 = +[ASDApp allocWithZone:](ASDApp, "allocWithZone:");
  -[ASDApp bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASDApp initWithBundleID:](v5, "initWithBundleID:", v6);

  -[ASDApp artistName](self, "artistName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[ASDApp setArtistName:](v7, "setArtistName:", v9);

  -[ASDApp setExtensions:](v7, "setExtensions:", -[ASDApp extensions](self, "extensions"));
  -[ASDApp setStatus:](v7, "setStatus:", -[ASDApp status](self, "status"));
  -[ASDApp installError](self, "installError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDApp setInstallError:](v7, "setInstallError:", v10);

  -[ASDApp bundlePath](self, "bundlePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  -[ASDApp setBundlePath:](v7, "setBundlePath:", v12);

  -[ASDApp bundleShortVersion](self, "bundleShortVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  -[ASDApp setBundleShortVersion:](v7, "setBundleShortVersion:", v14);

  -[ASDApp bundleVersion](self, "bundleVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
  -[ASDApp setBundleVersion:](v7, "setBundleVersion:", v16);

  -[ASDApp executablePath](self, "executablePath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copyWithZone:", a3);
  -[ASDApp setExecutablePath:](v7, "setExecutablePath:", v18);

  -[ASDApp setStoreExternalVersionID:](v7, "setStoreExternalVersionID:", -[ASDApp storeExternalVersionID](self, "storeExternalVersionID"));
  -[ASDApp setStoreItemID:](v7, "setStoreItemID:", -[ASDApp storeItemID](self, "storeItemID"));
  -[ASDApp storeCohort](self, "storeCohort");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copyWithZone:", a3);
  -[ASDApp setStoreCohort:](v7, "setStoreCohort:", v20);

  -[ASDApp storeFront](self, "storeFront");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copyWithZone:", a3);
  -[ASDApp setStoreFront:](v7, "setStoreFront:", v22);

  -[ASDApp setDownloaderDSID:](v7, "setDownloaderDSID:", -[ASDApp downloaderDSID](self, "downloaderDSID"));
  -[ASDApp setFamilyID:](v7, "setFamilyID:", -[ASDApp familyID](self, "familyID"));
  -[ASDApp setPurchaserDSID:](v7, "setPurchaserDSID:", -[ASDApp purchaserDSID](self, "purchaserDSID"));
  -[ASDApp remoteProgress](self, "remoteProgress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copyWithZone:", a3);
  -[ASDApp setRemoteProgress:](v7, "setRemoteProgress:", v24);

  -[ASDApp updateBuyParams](self, "updateBuyParams");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copyWithZone:", a3);
  -[ASDApp setUpdateBuyParams:](v7, "setUpdateBuyParams:", v26);

  -[ASDApp setWatchApplicationMode:](v7, "setWatchApplicationMode:", -[ASDApp watchApplicationMode](self, "watchApplicationMode"));
  return v7;
}

- (int64_t)softwarePlatform
{
  return self->_softwarePlatform;
}

- (void)setSoftwarePlatform:(int64_t)a3
{
  self->_softwarePlatform = a3;
}

- (void)setDownloaderDSID:(int64_t)a3
{
  self->_downloaderDSID = a3;
}

- (void)setFamilyID:(int64_t)a3
{
  self->_familyID = a3;
}

- (void)setPurchaserDSID:(int64_t)a3
{
  self->_purchaserDSID = a3;
}

- (int64_t)essentialBackgroundAssetDownloadEstimate
{
  return self->_essentialBackgroundAssetDownloadEstimate;
}

- (void)setEssentialBackgroundAssetDownloadEstimate:(int64_t)a3
{
  self->_essentialBackgroundAssetDownloadEstimate = a3;
}

- (void)setInstallError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSUUID)installID
{
  return (NSUUID *)objc_getProperty(self, a2, 232, 1);
}

- (void)setProgressPhase:(int64_t)a3
{
  self->_progressPhase = a3;
}

- (void)setUpdateBuyParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (void)setWatchApplicationMode:(int64_t)a3
{
  self->_watchApplicationMode = a3;
}

@end
