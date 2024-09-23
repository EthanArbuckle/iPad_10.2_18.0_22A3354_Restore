@implementation CEMNetworkContentCachingDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.network.contentcaching");
}

+ (id)profileType
{
  return CFSTR("com.apple.AssetCache.managed");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[20];

  v6[19] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("AllowPersonalCaching");
  v6[1] = CFSTR("AllowSharedCaching");
  v6[2] = CFSTR("AutoActivation");
  v6[3] = CFSTR("CacheLimit");
  v6[4] = CFSTR("DataPath");
  v6[5] = CFSTR("DenyActivation");
  v6[6] = CFSTR("DenyTetheredCaching");
  v6[7] = CFSTR("ListenRanges");
  v6[8] = CFSTR("ListenRangesOnly");
  v6[9] = CFSTR("ListenWithPeersAndParents");
  v6[10] = CFSTR("LocalSubnetsOnly");
  v6[11] = CFSTR("LogClientIdentity");
  v6[12] = CFSTR("Parents");
  v6[13] = CFSTR("ParentSelectionPolicy");
  v6[14] = CFSTR("PeerFilterRanges");
  v6[15] = CFSTR("PeerListenRanges");
  v6[16] = CFSTR("PeerLocalSubnetsOnly");
  v6[17] = CFSTR("Port");
  v6[18] = CFSTR("PublicRanges");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withAllowPersonalCaching:(id)a4 withAllowSharedCaching:(id)a5 withAutoActivation:(id)a6 withCacheLimit:(id)a7 withDataPath:(id)a8 withDenyActivation:(id)a9 withDenyTetheredCaching:(id)a10 withListenRanges:(id)a11 withListenRangesOnly:(id)a12 withListenWithPeersAndParents:(id)a13 withLocalSubnetsOnly:(id)a14 withLogClientIdentity:(id)a15 withParents:(id)a16 withParentSelectionPolicy:(id)a17 withPeerFilterRanges:(id)a18 withPeerListenRanges:(id)a19 withPeerLocalSubnetsOnly:(id)a20 withPort:(id)a21 withPublicRanges:(id)a22
{
  id v22;
  id v23;
  __CFString *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  const __CFString *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  const __CFString *v45;
  id v46;
  void *v47;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  __CFString *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;

  v66 = a3;
  v65 = a22;
  v64 = a21;
  v63 = a20;
  v62 = a19;
  v61 = a18;
  v60 = (__CFString *)a17;
  v59 = a16;
  v58 = a15;
  v57 = a14;
  v56 = a13;
  v55 = a12;
  v54 = a11;
  v22 = a10;
  v23 = a9;
  v24 = (__CFString *)a8;
  v25 = a7;
  v26 = a6;
  v27 = a5;
  v28 = a4;
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setDeclarationType:", CFSTR("com.apple.configuration.network.contentcaching"));
  if (v66)
  {
    objc_msgSend(v29, "setDeclarationIdentifier:", v66);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UUIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDeclarationIdentifier:", v31);

  }
  v32 = (void *)MEMORY[0x24BDBD1C8];
  if (v28)
    v33 = v28;
  else
    v33 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v29, "setPayloadAllowPersonalCaching:", v33, a10);

  if (v27)
    v34 = v27;
  else
    v34 = v32;
  objc_msgSend(v29, "setPayloadAllowSharedCaching:", v34);

  v35 = (void *)MEMORY[0x24BDBD1C0];
  if (v26)
    v36 = v26;
  else
    v36 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v29, "setPayloadAutoActivation:", v36);

  if (v25)
    v37 = v25;
  else
    v37 = &unk_24C69CD40;
  objc_msgSend(v29, "setPayloadCacheLimit:", v37);

  if (v24)
    v38 = v24;
  else
    v38 = CFSTR("/Library/Application Support/Apple/AssetCache/Data");
  objc_msgSend(v29, "setPayloadDataPath:", v38);

  if (v23)
    v39 = v23;
  else
    v39 = v35;
  objc_msgSend(v29, "setPayloadDenyActivation:", v39);

  if (v22)
    v40 = v22;
  else
    v40 = v35;
  objc_msgSend(v29, "setPayloadDenyTetheredCaching:", v40);

  objc_msgSend(v29, "setPayloadListenRanges:", v54);
  if (v55)
    v41 = v55;
  else
    v41 = v35;
  objc_msgSend(v29, "setPayloadListenRangesOnly:", v41);

  if (v56)
    v42 = v56;
  else
    v42 = v32;
  objc_msgSend(v29, "setPayloadListenWithPeersAndParents:", v42);

  if (v57)
    v43 = v57;
  else
    v43 = v32;
  objc_msgSend(v29, "setPayloadLocalSubnetsOnly:", v43);

  if (v58)
    v44 = v58;
  else
    v44 = v35;
  objc_msgSend(v29, "setPayloadLogClientIdentity:", v44);

  objc_msgSend(v29, "setPayloadParents:", v59);
  if (v60)
    v45 = v60;
  else
    v45 = CFSTR("round-robin");
  objc_msgSend(v29, "setPayloadParentSelectionPolicy:", v45);

  objc_msgSend(v29, "setPayloadPeerFilterRanges:", v61);
  objc_msgSend(v29, "setPayloadPeerListenRanges:", v62);

  if (v63)
    v46 = v63;
  else
    v46 = v32;
  objc_msgSend(v29, "setPayloadPeerLocalSubnetsOnly:", v46);

  if (v64)
    v47 = v64;
  else
    v47 = &unk_24C69CD40;
  objc_msgSend(v29, "setPayloadPort:", v47);

  objc_msgSend(v29, "setPayloadPublicRanges:", v65);
  objc_msgSend(v29, "updateServerHash");

  return v29;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.network.contentcaching"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerHash");

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSNumber *v13;
  id v14;
  NSNumber *payloadAllowPersonalCaching;
  NSNumber *v16;
  NSNumber *payloadAllowSharedCaching;
  NSNumber *v18;
  NSNumber *payloadAutoActivation;
  NSNumber *v20;
  NSNumber *payloadCacheLimit;
  NSString *v22;
  NSString *payloadDataPath;
  NSNumber *v24;
  NSNumber *payloadDenyActivation;
  NSNumber *v26;
  NSNumber *payloadDenyTetheredCaching;
  NSArray *v28;
  NSArray *payloadListenRanges;
  NSNumber *v30;
  NSNumber *payloadListenRangesOnly;
  NSNumber *v32;
  NSNumber *payloadListenWithPeersAndParents;
  NSNumber *v34;
  NSNumber *payloadLocalSubnetsOnly;
  NSNumber *v36;
  NSNumber *payloadLogClientIdentity;
  NSArray *v38;
  NSArray *payloadParents;
  NSString *v40;
  NSString *payloadParentSelectionPolicy;
  NSArray *v42;
  NSArray *payloadPeerFilterRanges;
  NSArray *v44;
  NSArray *payloadPeerListenRanges;
  NSNumber *v46;
  NSNumber *payloadPeerLocalSubnetsOnly;
  NSNumber *v48;
  NSNumber *payloadPort;
  NSArray *v50;
  NSArray *payloadPublicRanges;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkContentCachingDeclaration allowedPayloadKeys](CEMNetworkContentCachingDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v71 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowPersonalCaching"), 0, MEMORY[0x24BDBD1C8], &v71);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v71;
  payloadAllowPersonalCaching = self->_payloadAllowPersonalCaching;
  self->_payloadAllowPersonalCaching = v13;

  if (!v14)
  {
    v70 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowSharedCaching"), 0, MEMORY[0x24BDBD1C8], &v70);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v70;
    payloadAllowSharedCaching = self->_payloadAllowSharedCaching;
    self->_payloadAllowSharedCaching = v16;

    if (!v14)
    {
      v69 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AutoActivation"), 0, MEMORY[0x24BDBD1C0], &v69);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v69;
      payloadAutoActivation = self->_payloadAutoActivation;
      self->_payloadAutoActivation = v18;

      if (!v14)
      {
        v68 = 0;
        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CacheLimit"), 0, &unk_24C69CD40, &v68);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v68;
        payloadCacheLimit = self->_payloadCacheLimit;
        self->_payloadCacheLimit = v20;

        if (!v14)
        {
          v67 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DataPath"), 0, CFSTR("/Library/Application Support/Apple/AssetCache/Data"), &v67);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v67;
          payloadDataPath = self->_payloadDataPath;
          self->_payloadDataPath = v22;

          if (!v14)
          {
            v66 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DenyActivation"), 0, MEMORY[0x24BDBD1C0], &v66);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v66;
            payloadDenyActivation = self->_payloadDenyActivation;
            self->_payloadDenyActivation = v24;

            if (!v14)
            {
              v65 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DenyTetheredCaching"), 0, MEMORY[0x24BDBD1C0], &v65);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v65;
              payloadDenyTetheredCaching = self->_payloadDenyTetheredCaching;
              self->_payloadDenyTetheredCaching = v26;

              if (!v14)
              {
                v64 = 0;
                -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("ListenRanges"), objc_opt_class(), 0, 0, 0, &v64);
                v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
                v14 = v64;
                payloadListenRanges = self->_payloadListenRanges;
                self->_payloadListenRanges = v28;

                if (!v14)
                {
                  v63 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ListenRangesOnly"), 0, MEMORY[0x24BDBD1C0], &v63);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v63;
                  payloadListenRangesOnly = self->_payloadListenRangesOnly;
                  self->_payloadListenRangesOnly = v30;

                  if (!v14)
                  {
                    v62 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ListenWithPeersAndParents"), 0, MEMORY[0x24BDBD1C8], &v62);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v62;
                    payloadListenWithPeersAndParents = self->_payloadListenWithPeersAndParents;
                    self->_payloadListenWithPeersAndParents = v32;

                    if (!v14)
                    {
                      v61 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LocalSubnetsOnly"), 0, MEMORY[0x24BDBD1C8], &v61);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v61;
                      payloadLocalSubnetsOnly = self->_payloadLocalSubnetsOnly;
                      self->_payloadLocalSubnetsOnly = v34;

                      if (!v14)
                      {
                        v60 = 0;
                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LogClientIdentity"), 0, MEMORY[0x24BDBD1C0], &v60);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v60;
                        payloadLogClientIdentity = self->_payloadLogClientIdentity;
                        self->_payloadLogClientIdentity = v36;

                        if (!v14)
                        {
                          v59 = 0;
                          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("Parents"), &__block_literal_global_18, 0, 0, &v59);
                          v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
                          v14 = v59;
                          payloadParents = self->_payloadParents;
                          self->_payloadParents = v38;

                          if (!v14)
                          {
                            v58 = 0;
                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ParentSelectionPolicy"), 0, CFSTR("round-robin"), &v58);
                            v40 = (NSString *)objc_claimAutoreleasedReturnValue();
                            v14 = v58;
                            payloadParentSelectionPolicy = self->_payloadParentSelectionPolicy;
                            self->_payloadParentSelectionPolicy = v40;

                            if (!v14)
                            {
                              v57 = 0;
                              -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("PeerFilterRanges"), objc_opt_class(), 0, 0, 0, &v57);
                              v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
                              v14 = v57;
                              payloadPeerFilterRanges = self->_payloadPeerFilterRanges;
                              self->_payloadPeerFilterRanges = v42;

                              if (!v14)
                              {
                                v56 = 0;
                                -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("PeerListenRanges"), objc_opt_class(), 0, 0, 0, &v56);
                                v44 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                v14 = v56;
                                payloadPeerListenRanges = self->_payloadPeerListenRanges;
                                self->_payloadPeerListenRanges = v44;

                                if (!v14)
                                {
                                  v55 = 0;
                                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PeerLocalSubnetsOnly"), 0, MEMORY[0x24BDBD1C8], &v55);
                                  v46 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v14 = v55;
                                  payloadPeerLocalSubnetsOnly = self->_payloadPeerLocalSubnetsOnly;
                                  self->_payloadPeerLocalSubnetsOnly = v46;

                                  if (!v14)
                                  {
                                    v54 = 0;
                                    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Port"), 0, &unk_24C69CD40, &v54);
                                    v48 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                    v14 = v54;
                                    payloadPort = self->_payloadPort;
                                    self->_payloadPort = v48;

                                    if (!v14)
                                    {
                                      v53 = 0;
                                      -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("PublicRanges"), objc_opt_class(), 0, 0, 0, &v53);
                                      v50 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                      v14 = v53;
                                      payloadPublicRanges = self->_payloadPublicRanges;
                                      self->_payloadPublicRanges = v50;

                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __57__CEMNetworkContentCachingDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *payloadListenRanges;
  uint64_t v9;
  id v10;
  NSArray *payloadPeerFilterRanges;
  id v12;
  NSArray *payloadPeerListenRanges;
  id v14;
  NSArray *payloadPublicRanges;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AllowPersonalCaching"), self->_payloadAllowPersonalCaching, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AllowSharedCaching"), self->_payloadAllowSharedCaching, 0, v6);
  v7 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AutoActivation"), self->_payloadAutoActivation, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CacheLimit"), self->_payloadCacheLimit, 0, &unk_24C69CD40);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DataPath"), self->_payloadDataPath, 0, CFSTR("/Library/Application Support/Apple/AssetCache/Data"));
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DenyActivation"), self->_payloadDenyActivation, 0, v7);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DenyTetheredCaching"), self->_payloadDenyTetheredCaching, 0, v7);
  payloadListenRanges = self->_payloadListenRanges;
  v9 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v28[3] = &unk_24C6390C8;
  v10 = v4;
  v29 = v10;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("ListenRanges"), payloadListenRanges, v28, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ListenRangesOnly"), self->_payloadListenRangesOnly, 0, v7);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ListenWithPeersAndParents"), self->_payloadListenWithPeersAndParents, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("LocalSubnetsOnly"), self->_payloadLocalSubnetsOnly, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("LogClientIdentity"), self->_payloadLogClientIdentity, 0, v7);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Parents"), self->_payloadParents, &__block_literal_global_66, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ParentSelectionPolicy"), self->_payloadParentSelectionPolicy, 0, CFSTR("round-robin"));
  payloadPeerFilterRanges = self->_payloadPeerFilterRanges;
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v26[3] = &unk_24C6390C8;
  v12 = v10;
  v27 = v12;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("PeerFilterRanges"), payloadPeerFilterRanges, v26, 0, 0);
  payloadPeerListenRanges = self->_payloadPeerListenRanges;
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_4;
  v24[3] = &unk_24C6390C8;
  v14 = v12;
  v25 = v14;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("PeerListenRanges"), payloadPeerListenRanges, v24, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("PeerLocalSubnetsOnly"), self->_payloadPeerLocalSubnetsOnly, 0, v6);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Port"), self->_payloadPort, 0, &unk_24C69CD40);
  payloadPublicRanges = self->_payloadPublicRanges;
  v19 = v9;
  v20 = 3221225472;
  v21 = __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_5;
  v22 = &unk_24C6390C8;
  v23 = v14;
  v16 = v14;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("PublicRanges"), payloadPublicRanges, &v19, 0, 0);
  v17 = (void *)objc_msgSend(v5, "copy", v19, v20, v21, v22);

  return v17;
}

uint64_t __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

id __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CEMNetworkContentCachingDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v44, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowPersonalCaching, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowSharedCaching, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAutoActivation, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadCacheLimit, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadDataPath, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadDenyActivation, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadDenyTetheredCaching, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSArray copy](self->_payloadListenRanges, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadListenRangesOnly, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSNumber copy](self->_payloadListenWithPeersAndParents, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSNumber copy](self->_payloadLocalSubnetsOnly, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSNumber copy](self->_payloadLogClientIdentity, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[NSArray copy](self->_payloadParents, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[NSString copy](self->_payloadParentSelectionPolicy, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  v33 = -[NSArray copy](self->_payloadPeerFilterRanges, "copy");
  v34 = (void *)v4[23];
  v4[23] = v33;

  v35 = -[NSArray copy](self->_payloadPeerListenRanges, "copy");
  v36 = (void *)v4[24];
  v4[24] = v35;

  v37 = -[NSNumber copy](self->_payloadPeerLocalSubnetsOnly, "copy");
  v38 = (void *)v4[25];
  v4[25] = v37;

  v39 = -[NSNumber copy](self->_payloadPort, "copy");
  v40 = (void *)v4[26];
  v4[26] = v39;

  v41 = -[NSArray copy](self->_payloadPublicRanges, "copy");
  v42 = (void *)v4[27];
  v4[27] = v41;

  return v4;
}

- (NSNumber)payloadAllowPersonalCaching
{
  return self->_payloadAllowPersonalCaching;
}

- (void)setPayloadAllowPersonalCaching:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowSharedCaching
{
  return self->_payloadAllowSharedCaching;
}

- (void)setPayloadAllowSharedCaching:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAutoActivation
{
  return self->_payloadAutoActivation;
}

- (void)setPayloadAutoActivation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadCacheLimit
{
  return self->_payloadCacheLimit;
}

- (void)setPayloadCacheLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadDataPath
{
  return self->_payloadDataPath;
}

- (void)setPayloadDataPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadDenyActivation
{
  return self->_payloadDenyActivation;
}

- (void)setPayloadDenyActivation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadDenyTetheredCaching
{
  return self->_payloadDenyTetheredCaching;
}

- (void)setPayloadDenyTetheredCaching:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)payloadListenRanges
{
  return self->_payloadListenRanges;
}

- (void)setPayloadListenRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadListenRangesOnly
{
  return self->_payloadListenRangesOnly;
}

- (void)setPayloadListenRangesOnly:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadListenWithPeersAndParents
{
  return self->_payloadListenWithPeersAndParents;
}

- (void)setPayloadListenWithPeersAndParents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadLocalSubnetsOnly
{
  return self->_payloadLocalSubnetsOnly;
}

- (void)setPayloadLocalSubnetsOnly:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadLogClientIdentity
{
  return self->_payloadLogClientIdentity;
}

- (void)setPayloadLogClientIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)payloadParents
{
  return self->_payloadParents;
}

- (void)setPayloadParents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)payloadParentSelectionPolicy
{
  return self->_payloadParentSelectionPolicy;
}

- (void)setPayloadParentSelectionPolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)payloadPeerFilterRanges
{
  return self->_payloadPeerFilterRanges;
}

- (void)setPayloadPeerFilterRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)payloadPeerListenRanges
{
  return self->_payloadPeerListenRanges;
}

- (void)setPayloadPeerListenRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)payloadPeerLocalSubnetsOnly
{
  return self->_payloadPeerLocalSubnetsOnly;
}

- (void)setPayloadPeerLocalSubnetsOnly:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSArray)payloadPublicRanges
{
  return self->_payloadPublicRanges;
}

- (void)setPayloadPublicRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPublicRanges, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadPeerLocalSubnetsOnly, 0);
  objc_storeStrong((id *)&self->_payloadPeerListenRanges, 0);
  objc_storeStrong((id *)&self->_payloadPeerFilterRanges, 0);
  objc_storeStrong((id *)&self->_payloadParentSelectionPolicy, 0);
  objc_storeStrong((id *)&self->_payloadParents, 0);
  objc_storeStrong((id *)&self->_payloadLogClientIdentity, 0);
  objc_storeStrong((id *)&self->_payloadLocalSubnetsOnly, 0);
  objc_storeStrong((id *)&self->_payloadListenWithPeersAndParents, 0);
  objc_storeStrong((id *)&self->_payloadListenRangesOnly, 0);
  objc_storeStrong((id *)&self->_payloadListenRanges, 0);
  objc_storeStrong((id *)&self->_payloadDenyTetheredCaching, 0);
  objc_storeStrong((id *)&self->_payloadDenyActivation, 0);
  objc_storeStrong((id *)&self->_payloadDataPath, 0);
  objc_storeStrong((id *)&self->_payloadCacheLimit, 0);
  objc_storeStrong((id *)&self->_payloadAutoActivation, 0);
  objc_storeStrong((id *)&self->_payloadAllowSharedCaching, 0);
  objc_storeStrong((id *)&self->_payloadAllowPersonalCaching, 0);
}

@end
