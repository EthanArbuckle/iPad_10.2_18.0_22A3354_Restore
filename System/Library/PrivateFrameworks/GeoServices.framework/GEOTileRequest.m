@implementation GEOTileRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_additionalInfos, 0);
  objc_storeStrong((id *)&self->_createTimes, 0);
  objc_storeStrong((id *)&self->_signpostIDs, 0);
  objc_storeStrong((id *)&self->_priorities, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_cachedEtags, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_storeStrong((id *)&self->_keyList, 0);
}

- (GEOResourceManifestConfiguration)manifestConfiguration
{
  return self->_manifestConfiguration;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (GEOTileKeyList)keyList
{
  return self->_keyList;
}

- (GEOTileKeyMap)priorities
{
  return self->_priorities;
}

- (GEOTileKeyMap)createTimes
{
  return self->_createTimes;
}

- (GEOTileRequest)initWithKeyList:(id)a3 manifestConfiguration:(id)a4 locale:(id)a5 cachedEtags:(id)a6 cachedData:(id)a7 priorities:(id)a8 signpostIDs:(id)a9 createTimes:(id)a10 additionalInfos:(id)a11 auditToken:(id)a12 constraints:(unint64_t)a13 backgroundSessionIdentifier:(id)a14 shouldParticipateInBalancer:(BOOL)a15 reason:(unsigned __int8)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  GEOTileRequest *v25;
  GEOTileRequest *v26;
  uint64_t v27;
  NSString *backgroundSessionIdentifier;
  id v31;
  id v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v40 = a3;
  v39 = a4;
  v31 = a5;
  v38 = a5;
  v37 = a6;
  v32 = a7;
  v36 = a7;
  v35 = a8;
  v34 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a14;
  v41.receiver = self;
  v41.super_class = (Class)GEOTileRequest;
  v25 = -[GEOTileRequest init](&v41, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_keyList, a3);
    objc_storeStrong((id *)&v26->_manifestConfiguration, a4);
    objc_storeStrong((id *)&v26->_locale, v31);
    objc_storeStrong((id *)&v26->_cachedEtags, a6);
    objc_storeStrong((id *)&v26->_cachedData, v32);
    objc_storeStrong((id *)&v26->_priorities, a8);
    objc_storeStrong((id *)&v26->_signpostIDs, a9);
    objc_storeStrong((id *)&v26->_createTimes, a10);
    objc_storeStrong((id *)&v26->_additionalInfos, a11);
    objc_storeStrong((id *)&v26->_auditToken, a12);
    v26->_constraints = a13 & 0xF0;
    v27 = objc_msgSend(v24, "copy");
    backgroundSessionIdentifier = v26->_backgroundSessionIdentifier;
    v26->_backgroundSessionIdentifier = (NSString *)v27;

    v26->_shouldParticipateInBalancer = a15;
    v26->_loadReason = a16;
  }

  return v26;
}

- (GEOTileKeyMap)signpostIDs
{
  return self->_signpostIDs;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (unsigned)loadReason
{
  return self->_loadReason;
}

- (unint64_t)constraints
{
  return self->_constraints;
}

- (GEOTileKeyMap)cachedEtags
{
  return self->_cachedEtags;
}

- (GEOTileKeyMap)cachedData
{
  return self->_cachedData;
}

- (NSString)backgroundSessionIdentifier
{
  return self->_backgroundSessionIdentifier;
}

- (BOOL)shouldParticipateInBalancer
{
  return self->_shouldParticipateInBalancer;
}

- (GEOTileRequest)init
{
  GEOTileRequest *result;

  result = (GEOTileRequest *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOTileRequest)initWithKeyList:(id)a3 manifestConfiguration:(id)a4 locale:(id)a5
{
  uint64_t v6;

  LOWORD(v6) = 1;
  return -[GEOTileRequest initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:](self, "initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0, 0, v6);
}

- (id)description
{
  void *v3;
  GEOTileKeyList *keyList;
  void *v5;
  void *v6;
  NSLocale *locale;
  void *v8;
  void *v9;
  void *v10;
  GEOTileKeyMap *cachedEtags;
  void *v12;
  GEOTileKeyMap *cachedData;
  void *v14;
  GEOTileKeyMap *priorities;
  void *v16;
  GEOTileKeyMap *createTimes;
  void *v18;
  GEOTileKeyMap *additionalInfos;
  void *v20;
  void *v21;
  unint64_t constraints;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  keyList = self->_keyList;
  if (keyList)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key list: %p (%zu)"), keyList, -[GEOTileKeyList count](self->_keyList, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (self->_manifestConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("manifest: %p"), self->_manifestConfiguration);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  locale = self->_locale;
  if (locale)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[NSLocale localeIdentifier](locale, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("locale: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  cachedEtags = self->_cachedEtags;
  if (cachedEtags)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cached Etags: %p (%zu)"), cachedEtags, -[GEOTileKeyMap count](self->_cachedEtags, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  cachedData = self->_cachedData;
  if (cachedData)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cached data: %p (%zu)"), cachedData, -[GEOTileKeyMap count](self->_cachedData, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  priorities = self->_priorities;
  if (priorities)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("priorities: %p (%zu)"), priorities, -[GEOTileKeyMap count](self->_priorities, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  createTimes = self->_createTimes;
  if (createTimes)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("create times: %p (%zu)"), createTimes, -[GEOTileKeyMap count](self->_createTimes, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

  }
  additionalInfos = self->_additionalInfos;
  if (additionalInfos)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("additional infos: %p (%zu)"), additionalInfos, -[GEOTileKeyMap count](self->_additionalInfos, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

  }
  if (self->_auditToken)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("audit token: %p"), self->_auditToken);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  constraints = self->_constraints;
  if ((constraints & 0x10) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("requires inexpensive network"));
    constraints = self->_constraints;
    if ((constraints & 0x20) == 0)
    {
LABEL_21:
      if ((constraints & 0x40) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((constraints & 0x20) == 0)
  {
    goto LABEL_21;
  }
  objc_msgSend(v3, "addObject:", CFSTR("requires power"));
  if ((self->_constraints & 0x40) != 0)
LABEL_22:
    objc_msgSend(v3, "addObject:", CFSTR("requires unconstrained"));
LABEL_23:
  if (self->_backgroundSessionIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("background session: %@"), self->_backgroundSessionIdentifier);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  v24 = (void *)MEMORY[0x1E0CB3940];
  v25 = objc_opt_class();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p> %@"), v25, self, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (GEOTileKeyMap)additionalInfos
{
  return self->_additionalInfos;
}

@end
