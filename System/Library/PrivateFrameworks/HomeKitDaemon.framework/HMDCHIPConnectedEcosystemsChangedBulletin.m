@implementation HMDCHIPConnectedEcosystemsChangedBulletin

- (HMDCHIPConnectedEcosystemsChangedBulletin)initWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5 dateOfOccurrence:(id)a6 userInfo:(id)a7 isTimeSensitive:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMDCHIPConnectedEcosystemsChangedBulletin *v20;
  uint64_t v21;
  NSString *title;
  uint64_t v23;
  NSString *body;
  uint64_t v25;
  NSString *threadIdentifier;
  uint64_t v27;
  NSDate *dateOfOccurrence;
  uint64_t v29;
  NSDictionary *userInfo;
  HMDCHIPConnectedEcosystemsChangedBulletin *v32;
  SEL v33;
  id v34;
  id v35;
  objc_super v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v19 = v18;
  if (!v18)
  {
LABEL_13:
    v32 = (HMDCHIPConnectedEcosystemsChangedBulletin *)_HMFPreconditionFailure();
    return -[HMDCHIPConnectedEcosystemsChangedBulletin initWithAddedPairing:accessory:](v32, v33, v34, v35);
  }
  v36.receiver = self;
  v36.super_class = (Class)HMDCHIPConnectedEcosystemsChangedBulletin;
  v20 = -[HMDCHIPConnectedEcosystemsChangedBulletin init](&v36, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    title = v20->_title;
    v20->_title = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    body = v20->_body;
    v20->_body = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    threadIdentifier = v20->_threadIdentifier;
    v20->_threadIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    dateOfOccurrence = v20->_dateOfOccurrence;
    v20->_dateOfOccurrence = (NSDate *)v27;

    v29 = objc_msgSend(v19, "copy");
    userInfo = v20->_userInfo;
    v20->_userInfo = (NSDictionary *)v29;

    v20->_timeSensitive = a8;
  }

  return v20;
}

- (HMDCHIPConnectedEcosystemsChangedBulletin)initWithAddedPairing:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDCHIPConnectedEcosystemsChangedBulletin *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  HMDCHIPConnectedEcosystemsChangedBulletin *v52;
  void *v53;
  void *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_10;
  v9 = (void *)objc_opt_class();
  objc_msgSend(v6, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ecosystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vendor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedTitleForAddedEcosystemName:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = objc_claimAutoreleasedReturnValue();
  v53 = v6;
  v54 = (void *)v14;
  if (!v16)
  {

    goto LABEL_7;
  }
  v17 = (void *)v16;
  objc_msgSend(v6, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (!v20)
  {
LABEL_7:
    HMDLocalizedStringForKey(CFSTR("BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_DEFAULT_HOME"));
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v6, "home");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "name");
  v22 = objc_claimAutoreleasedReturnValue();

LABEL_8:
  v50 = (void *)v22;
  v23 = (void *)objc_opt_class();
  objc_msgSend(v8, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "category");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedDescription");
  v52 = self;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedBodyForAddedEcosystemHomeName:accessoryName:accessoryCategory:", v22, v24, v26);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "home");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x24BDD74F0];
  objc_msgSend(v8, "contextSPIUniqueIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "UUIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "tupleWithQueryType:uuidString:", 1, v30);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x24BDD74F0];
  objc_msgSend(v27, "contextSPIUniqueIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "UUIDString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "tupleWithQueryType:uuidString:", 0, v33);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x24BDBCF20];
  v55[0] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  generateURLForHomeKitObject();
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "accessoryBulletinContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "mutableCopy");

  objc_msgSend(v37, "absoluteString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v40, *MEMORY[0x24BDD7120]);

  v41 = v8;
  v42 = v27;
  objc_msgSend(v27, "uuid");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "UUIDString");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[HMDCHIPConnectedEcosystemsChangedBulletin initWithTitle:body:threadIdentifier:dateOfOccurrence:userInfo:isTimeSensitive:](v52, "initWithTitle:body:threadIdentifier:dateOfOccurrence:userInfo:isTimeSensitive:", v54, v51, v44, v45, v39, 1);

  return v46;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCHIPConnectedEcosystemsChangedBulletin title](self, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Title"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCHIPConnectedEcosystemsChangedBulletin body](self, "body");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Body"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCHIPConnectedEcosystemsChangedBulletin threadIdentifier](self, "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Thread ID"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCHIPConnectedEcosystemsChangedBulletin dateOfOccurrence](self, "dateOfOccurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Date"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCHIPConnectedEcosystemsChangedBulletin userInfo](self, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("User Info"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCHIPConnectedEcosystemsChangedBulletin isTimeSensitive](self, "isTimeSensitive");
  HMFBooleanToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Time Sensitive"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isTimeSensitive
{
  return self->_timeSensitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)localizedTitleForAddedEcosystemName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C8];
  HMDLocalizedStringForKey(CFSTR("BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), &v14, v3);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  v8 = v6;
  if (!v6)
  {
    v9 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v16 = v11;
      v17 = 2112;
      v18 = CFSTR("BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_TITLE");
      v19 = 2112;
      v20 = CFSTR("%@");
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    v8 = CFSTR("BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_TITLE");
  }
  v12 = v8;

  return v12;
}

+ (id)localizedBodyForAddedEcosystemHomeName:(id)a3 accessoryName:(id)a4 accessoryCategory:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD17C8];
  HMDLocalizedStringForKey(CFSTR("BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v10, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@ %@ %@"), &v20, v8, v9, v7);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v20;

  v14 = v12;
  if (!v12)
  {
    v15 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v17;
      v23 = 2112;
      v24 = CFSTR("BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY");
      v25 = 2112;
      v26 = CFSTR("%@ %@ %@");
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    v14 = CFSTR("BULLETIN_CONNECTED_CHIP_ECOSYSTEMS_ADDED_BODY");
  }
  v18 = v14;

  return v18;
}

@end
