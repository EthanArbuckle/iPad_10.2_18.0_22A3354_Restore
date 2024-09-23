@implementation GTLaunchRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTLaunchRequest)init
{
  GTLaunchRequest *v2;
  GTLaunchRequest *v3;
  NSDictionary *environment;
  NSArray *arguments;
  uint64_t v6;
  NSString *deviceUDID;
  uint64_t v8;
  NSUUID *sessionUUID;
  GTLaunchRequest *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GTLaunchRequest;
  v2 = -[GTLaunchRequest init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    environment = v2->_environment;
    v2->_environment = (NSDictionary *)MEMORY[0x24BDBD1B8];

    arguments = v3->_arguments;
    v3->_arguments = (NSArray *)MEMORY[0x24BDBD1A8];

    +[GTDeviceProperties uniqueDeviceID](GTDeviceProperties, "uniqueDeviceID");
    v6 = objc_claimAutoreleasedReturnValue();
    deviceUDID = v3->_deviceUDID;
    v3->_deviceUDID = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v3->_sessionUUID;
    v3->_sessionUUID = (NSUUID *)v8;

    v10 = v3;
  }

  return v3;
}

- (GTLaunchRequest)initWithCoder:(id)a3
{
  id v4;
  GTLaunchRequest *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *environment;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  char isKindOfClass;
  NSDictionary *v16;
  void *v17;
  char v18;
  uint64_t v19;
  NSArray *arguments;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  NSArray *v26;
  uint64_t v27;
  NSString *deviceUDID;
  uint64_t v29;
  NSString *v30;
  uint64_t v31;
  NSUUID *sessionUUID;
  void *v33;
  uint64_t v34;
  NSUUID *v35;
  GTLaunchRequest *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)GTLaunchRequest;
  v5 = -[GTLaunchRequest init](&v46, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("environment"));
    v7 = objc_claimAutoreleasedReturnValue();
    environment = v5->_environment;
    v5->_environment = (NSDictionary *)v7;

    v9 = v5->_environment;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v9 = v5->_environment;
        v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v43;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v43 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              v16 = v5->_environment;
              if ((isKindOfClass & 1) == 0)
                goto LABEL_17;
              -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v18 = objc_opt_isKindOfClass();

              if ((v18 & 1) == 0)
              {
                v16 = v5->_environment;
LABEL_17:
                v5->_environment = (NSDictionary *)MEMORY[0x24BDBD1B8];

                goto LABEL_18;
              }
            }
            v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_18:

        objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("arguments"));
        v19 = objc_claimAutoreleasedReturnValue();
        arguments = v5->_arguments;
        v5->_arguments = (NSArray *)v19;

        v21 = v5->_arguments;
        if (v21)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v21 = v5->_arguments;
            v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v39;
              while (2)
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v39 != v24)
                    objc_enumerationMutation(v21);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v26 = v5->_arguments;
                    v5->_arguments = (NSArray *)MEMORY[0x24BDBD1A8];

                    goto LABEL_32;
                  }
                }
                v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
                if (v23)
                  continue;
                break;
              }
            }
LABEL_32:

            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceUDID"));
            v27 = objc_claimAutoreleasedReturnValue();
            deviceUDID = v5->_deviceUDID;
            v5->_deviceUDID = (NSString *)v27;

            if (!v5->_deviceUDID || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              +[GTDeviceProperties uniqueDeviceID](GTDeviceProperties, "uniqueDeviceID", v38);
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = v5->_deviceUDID;
              v5->_deviceUDID = (NSString *)v29;

            }
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionUUID"));
            v31 = objc_claimAutoreleasedReturnValue();
            sessionUUID = v5->_sessionUUID;
            v5->_sessionUUID = (NSUUID *)v31;

            v33 = (void *)MEMORY[0x24BDD1880];
            if (v5->_sessionUUID)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
LABEL_39:
                v36 = v5;
                goto LABEL_40;
              }
              v33 = (void *)MEMORY[0x24BDD1880];
            }
            objc_msgSend(v33, "UUID", v38);
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = v5->_sessionUUID;
            v5->_sessionUUID = (NSUUID *)v34;

            goto LABEL_39;
          }
          v21 = v5->_arguments;
        }
        v5->_arguments = (NSArray *)MEMORY[0x24BDBD1A8];
        goto LABEL_32;
      }
      v9 = v5->_environment;
    }
    v5->_environment = (NSDictionary *)MEMORY[0x24BDBD1B8];
    goto LABEL_18;
  }
LABEL_40:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *environment;
  id v5;

  environment = self->_environment;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", environment, CFSTR("environment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arguments, CFSTR("arguments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceUDID, CFSTR("deviceUDID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionUUID, CFSTR("sessionUUID"));

}

- (NSDictionary)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
