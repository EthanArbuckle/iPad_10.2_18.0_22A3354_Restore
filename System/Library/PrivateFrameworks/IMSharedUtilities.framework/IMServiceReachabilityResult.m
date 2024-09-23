@implementation IMServiceReachabilityResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMServiceReachabilityResult)initWithService:(id)a3 error:(int64_t)a4 handleResults:(id)a5 isFinal:(BOOL)a6 allAreReachable:(BOOL)a7 didCheckServer:(BOOL)a8
{
  id v15;
  id v16;
  IMServiceReachabilityResult *v17;
  IMServiceReachabilityResult *v18;
  objc_super v20;

  v15 = a3;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)IMServiceReachabilityResult;
  v17 = -[IMServiceReachabilityResult init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_service, a3);
    v18->_error = a4;
    objc_storeStrong((id *)&v18->_handleResults, a5);
    v18->_final = a6;
    v18->_allAreReachable = a7;
    v18->_didCheckServer = a8;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  IDSIDInfoResult *selfKTData;
  void *v5;
  NSDictionary *ktData;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", self->_service, CFSTR("s"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_error, CFSTR("e"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_handleResults, CFSTR("r"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_final, CFSTR("f"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_allAreReachable, CFSTR("ar"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_didCheckServer, CFSTR("cs"));
  selfKTData = self->_selfKTData;
  if (selfKTData)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", selfKTData, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("skd"));

  }
  ktData = self->_ktData;
  if (ktData)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", ktData, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("kd"));

  }
}

- (IMServiceReachabilityResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  IMServiceReachabilityResult *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  IDSIDInfoResult *selfKTData;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDictionary *ktData;
  uint64_t v27;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("e"));
  v7 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v7, objc_opt_class(), CFSTR("r"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IMServiceReachabilityResult initWithService:error:handleResults:isFinal:allAreReachable:didCheckServer:](self, "initWithService:error:handleResults:isFinal:allAreReachable:didCheckServer:", v5, v6, v8, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("f")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ar")), objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cs")));

  if (v9)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skd"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3710];
      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = objc_opt_class();
      v27 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, v27, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v14, v10, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      selfKTData = v9->_selfKTData;
      v9->_selfKTData = (IDSIDInfoResult *)v15;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kd"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB3710];
      v19 = (void *)MEMORY[0x1E0C99E60];
      v20 = objc_opt_class();
      v21 = objc_opt_class();
      v22 = objc_opt_class();
      objc_msgSend(v19, "setWithObjects:", v20, v21, v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v23, v17, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      ktData = v9->_ktData;
      v9->_ktData = (NSDictionary *)v24;

    }
  }

  return v9;
}

+ (id)finalResultForService:(id)a3 handleIDs:(id)a4 allAreReachable:(BOOL)a5 handleIsReachable:(id)a6 checkedServer:(BOOL)a7 error:(int64_t)a8
{
  _BOOL8 v9;
  _BOOL4 v11;
  id v13;
  id v14;
  id v15;
  IMServiceReachabilityResult *v16;
  _BOOL8 v17;
  IMServiceReachabilityResult *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  IMServiceReachabilityResult *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  IMServiceReachabilityResult *v29;
  id v30;
  id v31;
  BOOL v32;

  v9 = a7;
  v11 = a5;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = objc_alloc_init(IMServiceReachabilityResult);
  -[IMServiceReachabilityResult setService:](v16, "setService:", v13);
  -[IMServiceReachabilityResult setError:](v16, "setError:", a8);
  -[IMServiceReachabilityResult setDidCheckServer:](v16, "setDidCheckServer:", v9);
  -[IMServiceReachabilityResult setFinal:](v16, "setFinal:", 1);
  v17 = v11 && objc_msgSend(v14, "count") != 0;
  -[IMServiceReachabilityResult setAllAreReachable:](v16, "setAllAreReachable:", v17);
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = sub_19E2B8F94;
  v28 = &unk_1E3FB7380;
  v31 = v15;
  v32 = v11;
  v18 = v16;
  v29 = v18;
  v30 = v13;
  v19 = v13;
  v20 = v15;
  objc_msgSend(v14, "__imMapToDictionary:", &v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityResult setHandleResults:](v18, "setHandleResults:", v21, v25, v26, v27, v28);

  v22 = v30;
  v23 = v18;

  return v23;
}

+ (id)finalResultForService:(id)a3 handleIDs:(id)a4 allAreReachable:(BOOL)a5 checkedServer:(BOOL)a6 error:(int64_t)a7
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_finalResultForService_handleIDs_allAreReachable_handleIsReachable_checkedServer_error_);
}

- (id)copyWithZone:(_NSZone *)a3
{
  IMServiceReachabilityResult *v4;

  v4 = -[IMServiceReachabilityResult initWithService:error:handleResults:isFinal:allAreReachable:didCheckServer:]([IMServiceReachabilityResult alloc], "initWithService:error:handleResults:isFinal:allAreReachable:didCheckServer:", self->_service, self->_error, self->_handleResults, self->_final, self->_allAreReachable, self->_didCheckServer);
  -[IMServiceReachabilityResult setKtData:](v4, "setKtData:", self->_ktData);
  -[IMServiceReachabilityResult setSelfKTData:](v4, "setSelfKTData:", self->_selfKTData);
  return v4;
}

- (id)createDictionary
{
  id v3;
  void *v4;
  NSString *service;
  void *v6;
  NSDictionary *handleResults;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  service = self->_service;
  if (service)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", service, CFSTR("s"));
  if (self->_error)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("e"));

  }
  handleResults = self->_handleResults;
  if (handleResults)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](handleResults, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[NSDictionary allValues](self->_handleResults, "allValues", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v14, "createDictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    v17 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("r"));

  }
  if (self->_final)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("f"));

  }
  if (self->_didCheckServer)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("cs"));

  }
  v20 = (void *)objc_msgSend(v4, "copy");

  return v20;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("YES");
  if (-[IMServiceReachabilityResult isFinal](self, "isFinal"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[IMServiceReachabilityResult service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMServiceReachabilityResult allAreReachable](self, "allAreReachable"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!-[IMServiceReachabilityResult didCheckServer](self, "didCheckServer"))
    v5 = CFSTR("NO");
  -[IMServiceReachabilityResult handleResults](self, "handleResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [isFinal: %@ service: %@ allAreReachable: %@ didCheckServer: %@ handleResults: %@]>"), v4, self, v6, v7, v8, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (int64_t)error
{
  return self->_error;
}

- (void)setError:(int64_t)a3
{
  self->_error = a3;
}

- (NSDictionary)handleResults
{
  return self->_handleResults;
}

- (void)setHandleResults:(id)a3
{
  objc_storeStrong((id *)&self->_handleResults, a3);
}

- (BOOL)isFinal
{
  return self->_final;
}

- (void)setFinal:(BOOL)a3
{
  self->_final = a3;
}

- (BOOL)allAreReachable
{
  return self->_allAreReachable;
}

- (void)setAllAreReachable:(BOOL)a3
{
  self->_allAreReachable = a3;
}

- (BOOL)didCheckServer
{
  return self->_didCheckServer;
}

- (void)setDidCheckServer:(BOOL)a3
{
  self->_didCheckServer = a3;
}

- (IDSIDInfoResult)selfKTData
{
  return self->_selfKTData;
}

- (void)setSelfKTData:(id)a3
{
  objc_storeStrong((id *)&self->_selfKTData, a3);
}

- (NSDictionary)ktData
{
  return self->_ktData;
}

- (void)setKtData:(id)a3
{
  objc_storeStrong((id *)&self->_ktData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktData, 0);
  objc_storeStrong((id *)&self->_selfKTData, 0);
  objc_storeStrong((id *)&self->_handleResults, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
