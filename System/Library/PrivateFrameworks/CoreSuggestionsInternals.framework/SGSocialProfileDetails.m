@implementation SGSocialProfileDetails

- (SGSocialProfileDetails)initWithUsername:(id)a3 userIdentifier:(id)a4 bundleIdentifier:(id)a5 displayName:(id)a6 service:(id)a7 teamIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SGSocialProfileDetails *v20;
  uint64_t v21;
  NSString *username;
  uint64_t v23;
  NSString *userIdentifier;
  uint64_t v25;
  NSString *bundleIdentifier;
  uint64_t v27;
  NSString *displayName;
  uint64_t v29;
  NSString *service;
  uint64_t v31;
  NSString *teamIdentifier;
  unint64_t v33;
  NSString *v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void **v42;
  uint64_t v43;
  uint64_t v44;
  NSArray *uniqueIdentifiers;
  objc_super v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v47.receiver = self;
  v47.super_class = (Class)SGSocialProfileDetails;
  v20 = -[SGSocialProfileDetails init](&v47, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    username = v20->_username;
    v20->_username = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    userIdentifier = v20->_userIdentifier;
    v20->_userIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    bundleIdentifier = v20->_bundleIdentifier;
    v20->_bundleIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    displayName = v20->_displayName;
    v20->_displayName = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    service = v20->_service;
    v20->_service = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    teamIdentifier = v20->_teamIdentifier;
    v20->_teamIdentifier = (NSString *)v31;

    v33 = 0x1E0C99000uLL;
    if (objc_msgSend(v16, "length") && objc_msgSend(v15, "length"))
    {
      v34 = v20->_bundleIdentifier;
      v51[0] = v20->_userIdentifier;
      v51[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      SGDelimitedStringsSerializeArray();
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v36 = 0;
    }
    if (objc_msgSend(v16, "length") && objc_msgSend(v14, "length"))
    {
      v37 = v20->_bundleIdentifier;
      v50[0] = v20->_username;
      v50[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      SGDelimitedStringsSerializeArray();
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0x1E0C99000;
    }
    else
    {
      -[SGSocialProfileDetails serialize](v20, "serialize");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v36)
      v40 = v36;
    else
      v40 = v39;
    objc_storeStrong((id *)&v20->_preferredUniqueIdentifier, v40);
    if (v36)
    {
      v49[0] = v36;
      v49[1] = v39;
      v41 = *(void **)(v33 + 3360);
      v42 = (void **)v49;
      v43 = 2;
    }
    else
    {
      v48 = v39;
      v41 = *(void **)(v33 + 3360);
      v42 = &v48;
      v43 = 1;
    }
    objc_msgSend(v41, "arrayWithObjects:count:", v42, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifiers = v20->_uniqueIdentifiers;
    v20->_uniqueIdentifiers = (NSArray *)v44;

  }
  return v20;
}

- (SGSocialProfileDetails)initWithSocialProfile:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  SGSocialProfileDetails *v19;
  const __CFString *v21;
  const __CFString *v22;

  v3 = a3;
  objc_msgSend(v3, "username");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E7DB83A8;
  v22 = v6;
  objc_msgSend(v3, "userIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_1E7DB83A8;
  v21 = v9;
  objc_msgSend(v3, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E7DB83A8;
  objc_msgSend(v3, "service");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_1E7DB83A8;
  objc_msgSend(v3, "teamIdentifier");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = v17;
  else
    v18 = &stru_1E7DB83A8;
  v19 = -[SGSocialProfileDetails initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:](self, "initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:", v22, v21, v10, v13, v16, v18);

  return v19;
}

- (SGSocialProfileDetails)initWithCNSocialProfile:(id)a3
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  __CFString *v18;
  const __CFString *v19;
  SGSocialProfileDetails *v20;
  const __CFString *v22;
  const __CFString *v23;
  void *v25;
  void *v26;

  v3 = a3;
  objc_msgSend(v3, "username");
  v4 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v4;
  if (v4)
    v5 = (const __CFString *)v4;
  else
    v5 = &stru_1E7DB83A8;
  v23 = v5;
  objc_msgSend(v3, "userIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E7DB83A8;
  v22 = v8;
  objc_msgSend(v3, "bundleIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E7DB83A8;
  objc_msgSend(v3, "displayname");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E7DB83A8;
  objc_msgSend(v3, "service");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_1E7DB83A8;
  objc_msgSend(v3, "teamIdentifier");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = v18;
  else
    v19 = &stru_1E7DB83A8;
  v20 = -[SGSocialProfileDetails initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:](self, "initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:", v23, v22, v11, v14, v17, v19);

  return v20;
}

- (SGSocialProfileDetails)initWithSerialized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SGSocialProfileDetails *v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SGDelimitedStringsDeserialize();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 6)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[SGSocialProfileDetails initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:](self, "initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:", v6, v7, v8, v9, v10, v11);

    v12 = self;
  }
  else
  {
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "Failed to decode socialProfileData: %@", (uint8_t *)&v15, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

- (id)serialize
{
  void *v2;
  void *v3;
  __int128 v5;
  NSString *bundleIdentifier;
  __int128 v7;
  NSString *teamIdentifier;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)&self->_username;
  bundleIdentifier = self->_bundleIdentifier;
  v7 = *(_OWORD *)&self->_displayName;
  teamIdentifier = self->_teamIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGDelimitedStringsSerializeArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSArray)uniqueIdentifiers
{
  return self->_uniqueIdentifiers;
}

- (NSString)preferredUniqueIdentifier
{
  return self->_preferredUniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
