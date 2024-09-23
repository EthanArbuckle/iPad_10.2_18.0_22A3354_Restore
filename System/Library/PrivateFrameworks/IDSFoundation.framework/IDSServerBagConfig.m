@implementation IDSServerBagConfig

- (NSDictionary)defaultBag
{
  return self->_defaultBag;
}

- (BOOL)validateAgainstIDSPolicy
{
  return self->_validateAgainstIDSPolicy;
}

- (NSURL)url
{
  return self->_url;
}

- (OS_os_log)logCategory
{
  return self->_logCategory;
}

- (IDSServerBagConfig)initWithURL:(id)a3 defaultsDomain:(id)a4 defaultBag:(id)a5 apsEnvironmentName:(id)a6 sosDomain:(unint64_t)a7 hashAlgorithm:(char)a8 requiresIDSHost:(BOOL)a9 validateAgainstIDSPolicy:(BOOL)a10 bagType:(int64_t)a11 bypassProcessChecks:(BOOL)a12 logCategory:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  IDSServerBagConfig *v23;
  IDSServerBagConfig *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  OS_os_log *v28;
  OS_os_log *logCategory;
  objc_super v33;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a13;
  v33.receiver = self;
  v33.super_class = (Class)IDSServerBagConfig;
  v23 = -[IDSServerBagConfig init](&v33, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_url, a3);
    objc_storeStrong((id *)&v24->_defaultsDomain, a4);
    objc_storeStrong((id *)&v24->_defaultBag, a5);
    objc_storeStrong((id *)&v24->_apsEnvironmentName, a6);
    v24->_hashAlgorithm = a8;
    v24->_requiresIDSHost = a9;
    v24->_validateAgainstIDSPolicy = a10;
    v24->_sosDomain = a7;
    v24->_bagType = a11;
    v24->_bypassProcessChecks = a12;
    if (v22)
    {
      v28 = (OS_os_log *)v22;
    }
    else
    {
      objc_msgSend_serverBag(MEMORY[0x1E0D36AA8], v25, v26, v27);
      v28 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
    }
    logCategory = v24->_logCategory;
    v24->_logCategory = v28;

  }
  return v24;
}

- (char)hashAlgorithm
{
  return self->_hashAlgorithm;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t hashAlgorithm;
  const __CFString *v9;
  const __CFString *v10;
  unint64_t sosDomain;
  int64_t bagType;
  NSString *apsEnvironmentName;
  uint64_t v14;
  const char *v15;
  __int128 v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  v7 = *(_OWORD *)&self->_url;
  v17 = v7;
  hashAlgorithm = self->_hashAlgorithm;
  if (self->_requiresIDSHost)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_validateAgainstIDSPolicy)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  sosDomain = self->_sosDomain;
  bagType = self->_bagType;
  apsEnvironmentName = self->_apsEnvironmentName;
  v14 = objc_msgSend_count(self->_defaultBag, v4, v5, *(double *)&v7);
  return (id)objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("<%@:%p; url: %@; defaultsDomain: %@; apsName: %@; sosDomain: %d; hashAlgorithm: %d; requiresIDS: %@; IDSPolicy: %@; bagType: %d; defaultBag.count: %llu"),
               *(double *)&v17,
               v6,
               self,
               v17,
               apsEnvironmentName,
               sosDomain,
               hashAlgorithm,
               v9,
               v10,
               bagType,
               v14);
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (int64_t)bagType
{
  return self->_bagType;
}

+ (id)courierConfig
{
  int v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  const char *v9;
  double v10;

  v3 = IMGetiMessageSettings();
  v4 = 0;
  v5 = 0;
  v6 = 0;
  if (v3)
  {
    if (qword_1ECDD48A8 != -1)
      dispatch_once(&qword_1ECDD48A8, &unk_1E3C1BE30);
    v7 = (id)qword_1ECDD48A0;
    v8 = objc_alloc((Class)a1);
    v6 = (void *)objc_msgSend_initWithURL_defaultsDomain_defaultBag_apsEnvironmentName_sosDomain_hashAlgorithm_requiresIDSHost_validateAgainstIDSPolicy_bagType_bypassProcessChecks_logCategory_(v8, v9, (uint64_t)v4, v10, CFSTR("com.apple.imessage.bag"), 0, v5, 1, 1, 0, 1, 0, v7);

  }
  return v6;
}

+ (id)IDSConfig
{
  int v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  const char *v9;
  double v10;

  v3 = IMGetConferenceSettings();
  v4 = 0;
  v5 = 0;
  v6 = 0;
  if (v3)
  {
    if (qword_1ECDD48D0 != -1)
      dispatch_once(&qword_1ECDD48D0, &unk_1E3C1B810);
    v7 = (id)qword_1ECDD48B8;
    v8 = objc_alloc((Class)a1);
    v6 = (void *)objc_msgSend_initWithURL_defaultsDomain_defaultBag_apsEnvironmentName_sosDomain_hashAlgorithm_requiresIDSHost_validateAgainstIDSPolicy_bagType_bypassProcessChecks_logCategory_(v8, v9, (uint64_t)v4, v10, CFSTR("com.apple.facetime.bag"), &unk_1E3C8A650, v5, 2, 1, 256, 0, 0, v7);

  }
  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;
  const __CFString *v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v6 = CFSTR("YES");
  if (self->_requiresIDSHost)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (!self->_validateAgainstIDSPolicy)
    v6 = CFSTR("NO");
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@:%p; url: %@; defaultsDomain: %@; apsName: %@; sosDomain: %d; hashAlgorithm: %d; requiresIDS: %@; IDSPolicy: %@; bagType: %d; defaultBag: %@"),
               *(double *)&self->_url,
               v4,
               self,
               *(_OWORD *)&self->_url,
               self->_apsEnvironmentName,
               self->_sosDomain,
               self->_hashAlgorithm,
               v7,
               v6,
               self->_bagType,
               self->_defaultBag);
}

- (NSString)apsEnvironmentName
{
  return self->_apsEnvironmentName;
}

- (unint64_t)sosDomain
{
  return self->_sosDomain;
}

- (BOOL)requiresIDSHost
{
  return self->_requiresIDSHost;
}

- (BOOL)bypassProcessChecks
{
  return self->_bypassProcessChecks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCategory, 0);
  objc_storeStrong((id *)&self->_apsEnvironmentName, 0);
  objc_storeStrong((id *)&self->_defaultBag, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
