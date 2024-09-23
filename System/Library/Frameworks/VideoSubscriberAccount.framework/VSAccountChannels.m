@implementation VSAccountChannels

- (VSAccountChannels)init
{
  VSAccountChannels *v2;
  VSAccountChannels *v3;
  NSString *providerID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSAccountChannels;
  v2 = -[VSAccountChannels init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    providerID = v2->_providerID;
    v2->_providerID = (NSString *)&stru_1E93A8CC0;

  }
  return v3;
}

+ (id)deserializationResultWithData:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  VSAccountChannels *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v53 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v53);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v53;
  if (v3)
  {
    v5 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = (void *)MEMORY[0x1E0C99DA0];
        v7 = *MEMORY[0x1E0C99778];
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "raise:format:", v7, CFSTR("Unexpectedly, plist was %@, instead of NSDictionary."), v9);

      }
      v10 = v5;
      objc_msgSend(v10, "objectForKey:", CFSTR("ProviderID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("ChannelIDs"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11 && v12)
      {
        v14 = v11;
        v15 = v13;
        objc_opt_class();
        v48 = v15;
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v41 = v13;
          v42 = v11;
          v43 = v10;
          v45 = v4;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = (void *)MEMORY[0x1E0C99DA0];
            v17 = *MEMORY[0x1E0C99778];
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "raise:format:", v17, CFSTR("Unexpectedly, providerIDObject was %@, instead of NSString."), v19);

          }
          v44 = v5;
          v46 = v3;
          v40 = v14;
          v47 = v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v20 = (void *)MEMORY[0x1E0C99DA0];
            v21 = *MEMORY[0x1E0C99778];
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "raise:format:", v21, CFSTR("Unexpectedly, channelIDsObject was %@, instead of NSArray."), v23);

          }
          v24 = v15;
          v39 = objc_alloc_init(VSAccountChannels);
          -[VSAccountChannels setProviderID:](v39, "setProviderID:", v47);
          v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v26 = v24;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v50;
            v30 = *MEMORY[0x1E0C99778];
            do
            {
              v31 = 0;
              do
              {
                if (*(_QWORD *)v50 != v29)
                  objc_enumerationMutation(v26);
                v32 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v31);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v33 = (void *)MEMORY[0x1E0C99DA0];
                    v34 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v34);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "raise:format:", v30, CFSTR("Unexpectedly, channelIdentifier was %@, instead of NSString."), v35);

                  }
                  objc_msgSend(v25, "addObject:", v32);
                }
                ++v31;
              }
              while (v28 != v31);
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
            }
            while (v28);
          }

          -[VSAccountChannels setChannelIDs:](v39, "setChannelIDs:", v25);
          +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v39);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v45;
          v3 = v46;
          v10 = v43;
          v5 = v44;
          v13 = v41;
          v11 = v42;
          v14 = v40;
          v37 = v47;
        }
        else
        {
          VSPrivateError(-22, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[VSFailable failableWithError:](VSFailable, "failableWithError:", v37);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        VSPrivateError(-22, 0);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        +[VSFailable failableWithError:](VSFailable, "failableWithError:", v14);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      VSPrivateError(-22, v4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      +[VSFailable failableWithError:](VSFailable, "failableWithError:", v10);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    VSPrivateError(-22, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v36)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The result parameter must not be nil."));

  return v36;
}

- (void)setProviderID:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  NSString *v6;
  NSString *providerID;
  __CFString *v8;

  v4 = (const __CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1E93A8CC0;
  v8 = (__CFString *)v5;
  if ((-[NSString isEqual:](self->_providerID, "isEqual:") & 1) == 0)
  {
    v6 = (NSString *)-[__CFString copy](v8, "copy");
    providerID = self->_providerID;
    self->_providerID = v6;

  }
}

- (id)serializationResultWithFormat:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  id v15;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VSAccountChannels providerID](self, "providerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("ProviderID"));

  -[VSAccountChannels channelIDs](self, "channelIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("ChannelIDs"));

  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, a3, 0, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (!v10)
  {
    VSPrivateError(-21, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_6;
    goto LABEL_5;
  }
  +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The result parameter must not be nil."));
LABEL_6:

  return v12;
}

- (id)serializationResult
{
  return -[VSAccountChannels serializationResultWithFormat:](self, "serializationResultWithFormat:", 100);
}

- (id)description
{
  id v3;
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
  void *v18;
  void *v19;
  objc_super v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[VSAccountChannels providerID](self, "providerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("providerID"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[VSAccountChannels adamID](self, "adamID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("adamID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[VSAccountChannels channelIDs](self, "channelIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("channelIDs"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[VSAccountChannels providerInfo](self, "providerInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("providerInfo"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0CB3940];
  v21.receiver = self;
  v21.super_class = (Class)VSAccountChannels;
  -[VSAccountChannels description](&v21, sel_description);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ %@>"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[VSAccountChannels providerID](self, "providerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VSAccountChannels adamID](self, "adamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[VSAccountChannels channelIDs](self, "channelIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[VSAccountChannels providerInfo](self, "providerInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  VSAccountChannels *v4;
  VSAccountChannels *v5;
  VSAccountChannels *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  VSAccountChannels *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  void *v25;
  void *v26;
  id v27;

  v4 = (VSAccountChannels *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    if (v4)
    {
      v6 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        LOBYTE(v14) = 0;
LABEL_29:

        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "raise:format:", v8, CFSTR("Unexpectedly, object was %@, instead of VSAccountChannels."), v10);

      }
      v11 = v6;
      -[VSAccountChannels providerID](self, "providerID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccountChannels providerID](v11, "providerID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
      {
LABEL_28:

        goto LABEL_29;
      }
      -[VSAccountChannels adamID](self, "adamID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccountChannels adamID](v11, "adamID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v18 = v16;
      if (v17 == v18)
      {

      }
      else
      {
        v19 = v18;
        LOBYTE(v14) = 0;
        if (!v17 || !v18)
          goto LABEL_27;
        v20 = objc_msgSend(v17, "isEqual:", v18);

        if ((v20 & 1) == 0)
          goto LABEL_20;
      }
      -[VSAccountChannels channelIDs](self, "channelIDs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccountChannels channelIDs](v11, "channelIDs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v21;
      v23 = v22;
      if (v17 == v23)
      {

LABEL_22:
        -[VSAccountChannels providerInfo](self, "providerInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSAccountChannels providerInfo](v11, "providerInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v25;
        v27 = v26;
        v19 = v27;
        if (v17 == v27)
        {
          LOBYTE(v14) = 1;
        }
        else
        {
          LOBYTE(v14) = 0;
          if (v17 && v27)
            LOBYTE(v14) = objc_msgSend(v17, "isEqual:", v27);
        }
        goto LABEL_27;
      }
      v19 = v23;
      LOBYTE(v14) = 0;
      if (v17 && v23)
      {
        v24 = objc_msgSend(v17, "isEqual:", v23);

        if ((v24 & 1) == 0)
        {
LABEL_20:
          LOBYTE(v14) = 0;
          goto LABEL_28;
        }
        goto LABEL_22;
      }
LABEL_27:

      goto LABEL_28;
    }
    LOBYTE(v14) = 0;
  }
LABEL_30:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSAccountChannels *v4;
  uint64_t v5;
  NSString *providerID;
  uint64_t v7;
  NSString *adamID;
  uint64_t v9;
  NSSet *channelIDs;
  uint64_t v11;
  NSDictionary *providerInfo;

  v4 = objc_alloc_init(VSAccountChannels);
  v5 = -[NSString copy](self->_providerID, "copy");
  providerID = v4->_providerID;
  v4->_providerID = (NSString *)v5;

  v7 = -[NSString copy](self->_adamID, "copy");
  adamID = v4->_adamID;
  v4->_adamID = (NSString *)v7;

  v9 = -[NSSet copy](self->_channelIDs, "copy");
  channelIDs = v4->_channelIDs;
  v4->_channelIDs = (NSSet *)v9;

  v11 = -[NSDictionary copy](self->_providerInfo, "copy");
  providerInfo = v4->_providerInfo;
  v4->_providerInfo = (NSDictionary *)v11;

  return v4;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)channelIDs
{
  return self->_channelIDs;
}

- (void)setChannelIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)providerInfo
{
  return self->_providerInfo;
}

- (void)setProviderInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerInfo, 0);
  objc_storeStrong((id *)&self->_channelIDs, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
}

@end
