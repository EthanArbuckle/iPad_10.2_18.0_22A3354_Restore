@implementation CEMApplicationListActiveNSExtensionsCommand_StatusExtensionsItem

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("BundleIdentifier");
  v6[1] = CFSTR("ExtensionPoint");
  v6[2] = CFSTR("DisplayName");
  v6[3] = CFSTR("ContainerDisplayName");
  v6[4] = CFSTR("ContainerIdentifier");
  v6[5] = CFSTR("Path");
  v6[6] = CFSTR("Version");
  v6[7] = CFSTR("UserElection");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithBundleIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5 withContainerDisplayName:(id)a6 withContainerIdentifier:(id)a7 withPath:(id)a8 withVersion:(id)a9 withUserElection:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setStatusBundleIdentifier:", v23);

  objc_msgSend(v24, "setStatusExtensionPoint:", v22);
  objc_msgSend(v24, "setStatusDisplayName:", v21);

  objc_msgSend(v24, "setStatusContainerDisplayName:", v20);
  objc_msgSend(v24, "setStatusContainerIdentifier:", v19);

  objc_msgSend(v24, "setStatusPath:", v18);
  objc_msgSend(v24, "setStatusVersion:", v17);

  objc_msgSend(v24, "setStatusUserElection:", v16);
  return v24;
}

+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5 withPath:(id)a6 withVersion:(id)a7 withUserElection:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setStatusBundleIdentifier:", v18);

  objc_msgSend(v19, "setStatusExtensionPoint:", v17);
  objc_msgSend(v19, "setStatusDisplayName:", v16);

  objc_msgSend(v19, "setStatusPath:", v15);
  objc_msgSend(v19, "setStatusVersion:", v14);

  objc_msgSend(v19, "setStatusUserElection:", v13);
  return v19;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSString *v15;
  NSString *statusBundleIdentifier;
  NSString *v17;
  NSString *statusExtensionPoint;
  NSString *v19;
  NSString *statusDisplayName;
  NSString *v21;
  NSString *statusContainerDisplayName;
  NSString *v23;
  NSString *statusContainerIdentifier;
  NSString *v25;
  NSString *statusPath;
  NSString *v27;
  NSString *statusVersion;
  NSString *v29;
  NSString *statusUserElection;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationListActiveNSExtensionsCommand_StatusExtensionsItem allowedStatusKeys](CEMApplicationListActiveNSExtensionsCommand_StatusExtensionsItem, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_17;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v41[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v39 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BundleIdentifier"), 1, 0, &v39);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = v39;
    statusBundleIdentifier = self->_statusBundleIdentifier;
    self->_statusBundleIdentifier = v15;

    if (!v12)
    {
      v38 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ExtensionPoint"), 1, 0, &v38);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      v12 = v38;
      statusExtensionPoint = self->_statusExtensionPoint;
      self->_statusExtensionPoint = v17;

      if (!v12)
      {
        v37 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisplayName"), 1, 0, &v37);
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = v37;
        statusDisplayName = self->_statusDisplayName;
        self->_statusDisplayName = v19;

        if (!v12)
        {
          v36 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ContainerDisplayName"), 0, 0, &v36);
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          v12 = v36;
          statusContainerDisplayName = self->_statusContainerDisplayName;
          self->_statusContainerDisplayName = v21;

          if (!v12)
          {
            v35 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ContainerIdentifier"), 0, 0, &v35);
            v23 = (NSString *)objc_claimAutoreleasedReturnValue();
            v12 = v35;
            statusContainerIdentifier = self->_statusContainerIdentifier;
            self->_statusContainerIdentifier = v23;

            if (!v12)
            {
              v34 = 0;
              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Path"), 1, 0, &v34);
              v25 = (NSString *)objc_claimAutoreleasedReturnValue();
              v12 = v34;
              statusPath = self->_statusPath;
              self->_statusPath = v25;

              if (!v12)
              {
                v33 = 0;
                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Version"), 1, 0, &v33);
                v27 = (NSString *)objc_claimAutoreleasedReturnValue();
                v12 = v33;
                statusVersion = self->_statusVersion;
                self->_statusVersion = v27;

                if (!v12)
                {
                  v32 = 0;
                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UserElection"), 1, 0, &v32);
                  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v12 = v32;
                  statusUserElection = self->_statusUserElection;
                  self->_statusUserElection = v29;

                }
              }
            }
          }
        }
      }
    }
    v14 = v12 == 0;
    if (a4 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a4 = v12;
    }
  }

LABEL_17:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("BundleIdentifier"), self->_statusBundleIdentifier, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ExtensionPoint"), self->_statusExtensionPoint, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DisplayName"), self->_statusDisplayName, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ContainerDisplayName"), self->_statusContainerDisplayName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ContainerIdentifier"), self->_statusContainerIdentifier, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Path"), self->_statusPath, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Version"), self->_statusVersion, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("UserElection"), self->_statusUserElection, 1, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CEMApplicationListActiveNSExtensionsCommand_StatusExtensionsItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v22, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusBundleIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_statusExtensionPoint, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_statusDisplayName, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_statusContainerDisplayName, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_statusContainerIdentifier, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_statusPath, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSString copy](self->_statusVersion, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSString copy](self->_statusUserElection, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  return v4;
}

- (NSString)statusBundleIdentifier
{
  return self->_statusBundleIdentifier;
}

- (void)setStatusBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)statusExtensionPoint
{
  return self->_statusExtensionPoint;
}

- (void)setStatusExtensionPoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)statusDisplayName
{
  return self->_statusDisplayName;
}

- (void)setStatusDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)statusContainerDisplayName
{
  return self->_statusContainerDisplayName;
}

- (void)setStatusContainerDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)statusContainerIdentifier
{
  return self->_statusContainerIdentifier;
}

- (void)setStatusContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)statusPath
{
  return self->_statusPath;
}

- (void)setStatusPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)statusVersion
{
  return self->_statusVersion;
}

- (void)setStatusVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)statusUserElection
{
  return self->_statusUserElection;
}

- (void)setStatusUserElection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUserElection, 0);
  objc_storeStrong((id *)&self->_statusVersion, 0);
  objc_storeStrong((id *)&self->_statusPath, 0);
  objc_storeStrong((id *)&self->_statusContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_statusContainerDisplayName, 0);
  objc_storeStrong((id *)&self->_statusDisplayName, 0);
  objc_storeStrong((id *)&self->_statusExtensionPoint, 0);
  objc_storeStrong((id *)&self->_statusBundleIdentifier, 0);
}

@end
