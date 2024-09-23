@implementation CMSExtensionIntentEndpointConfiguration

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CMSExtensionEndpointConfiguration endpointURL](self, "endpointURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMSExtensionEndpointConfiguration groupHeaders](self, "groupHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMSExtensionEndpointConfiguration headers](self, "headers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CMSExtensionIntentEndpointConfiguration: endpointURL:%@ groupHeaders:%@ headers:%@ optionalMethods:%@>"), v4, v5, v6, self->_optionalMethods);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CMSExtensionIntentEndpointConfiguration)init
{
  void *v3;
  CMSExtensionIntentEndpointConfiguration *v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24E1CDD40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CMSExtensionIntentEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:](self, "initWithDictionary:endpoint:baseURL:groupHeaders:", MEMORY[0x24BDBD1B8], CFSTR("/"), v3, MEMORY[0x24BDBD1B8]);

  return v4;
}

- (CMSExtensionIntentEndpointConfiguration)initWithDictionary:(id)a3 endpoint:(id)a4 baseURL:(id)a5 groupHeaders:(id)a6
{
  id v10;
  id v11;
  CMSExtensionIntentEndpointConfiguration *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSMutableSet *optionalMethods;
  void *v28;
  CMSExtensionIntentEndpointConfiguration *v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CMSExtensionIntentEndpointConfiguration;
  v12 = -[CMSExtensionEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:](&v36, sel_initWithDictionary_endpoint_baseURL_groupHeaders_, v10, v11, a5, a6);
  if (v12)
  {
    objc_msgSend(v10, "cmsOptionalArrayOfClass:forKey:", objc_opt_class(), CFSTR("opt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v29 = v12;
      v30 = v10;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v28 = v13;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v33;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v33 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18);
            v20 = (void *)MEMORY[0x24BDD17C8];
            CMSProtocolNameForExtensionEndpoint(v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringWithFormat:", CFSTR("%@.%@"), v21, v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            CMSExtensionEndpointForProtocolMethodName(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v21) = objc_msgSend(v23, "isEqual:", v11);

            if ((_DWORD)v21)
            {
              objc_msgSend(v31, "addObject:", v22);
            }
            else
            {
              _CMSILogingFacility();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v38 = v19;
                v39 = 2114;
                v40 = v11;
              }

            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v16);
      }

      v12 = v29;
      v10 = v30;
      v13 = v28;
    }
    v25 = objc_msgSend(v31, "copy");
    optionalMethods = v12->_optionalMethods;
    v12->_optionalMethods = (NSMutableSet *)v25;

  }
  return v12;
}

- (NSMutableSet)optionalMethods
{
  return self->_optionalMethods;
}

- (void)setOptionalMethods:(id)a3
{
  objc_storeStrong((id *)&self->_optionalMethods, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalMethods, 0);
}

@end
