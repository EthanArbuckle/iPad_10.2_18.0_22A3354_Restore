@implementation HMDServiceNameComponents

- (HMDServiceNameComponents)initWithRawServiceName:(id)a3 rawRoomName:(id)a4 localizedFormat:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDServiceNameComponents *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)HMDServiceNameComponents;
  v11 = -[HMDServiceNameComponents init](&v37, sel_init);
  if (v11)
  {
    v12 = (void *)objc_msgSend(v8, "copy");
    -[HMDServiceNameComponents setRawServiceName:](v11, "setRawServiceName:", v12);

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDServiceNameComponents setServiceName:](v11, "setServiceName:", v14);

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDServiceNameComponents setRoomName:](v11, "setRoomName:", v16);

    if (v10)
    {
      v17 = (void *)objc_msgSend(v10, "copy");
      -[HMDServiceNameComponents setFormat:](v11, "setFormat:", v17);

    }
    else
    {
      -[HMDServiceNameComponents setFormat:](v11, "setFormat:", CFSTR("%@ %@"));
    }
    -[HMDServiceNameComponents serviceName](v11, "serviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "length"))
      goto LABEL_13;
    -[HMDServiceNameComponents roomName](v11, "roomName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      -[HMDServiceNameComponents serviceName](v11, "serviceName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDServiceNameComponents roomName](v11, "roomName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "rangeOfString:options:", v22, 129);
      v25 = v24;

      if (v25)
      {
        if (!v23
          || (-[HMDServiceNameComponents serviceName](v11, "serviceName"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend(v26, "length"),
              v26,
              v23 + v25 == v27))
        {
          -[HMDServiceNameComponents serviceName](v11, "serviceName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "substringFromIndex:", v23 + v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "rangeOfCharacterFromSet:options:", v30, 0);

          if (v31)
          {
            -[HMDServiceNameComponents setRoomName:](v11, "setRoomName:", 0);
            goto LABEL_14;
          }
          -[HMDServiceNameComponents serviceName](v11, "serviceName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringByReplacingCharactersInRange:withString:", v23, v25, &stru_24E79DB48);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDServiceNameComponents setServiceName:](v11, "setServiceName:", v33);

          -[HMDServiceNameComponents serviceName](v11, "serviceName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDServiceNameComponents setServiceName:](v11, "setServiceName:", v35);

LABEL_13:
        }
      }
    }
  }
LABEL_14:

  return v11;
}

- (id)composedName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  -[HMDServiceNameComponents serviceName](self, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceNameComponents serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[HMDServiceNameComponents roomName](self, "roomName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      -[HMDServiceNameComponents format](self, "format");
      v8 = objc_claimAutoreleasedReturnValue();
      -[HMDServiceNameComponents roomName](self, "roomName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDServiceNameComponents serviceName](self, "serviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@ %@"), 0, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v8;
LABEL_7:

      v3 = (void *)v11;
      return v3;
    }
  }
  else
  {

  }
  -[HMDServiceNameComponents roomName](self, "roomName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    -[HMDServiceNameComponents roomName](self, "roomName");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return v3;
}

- (NSString)rawServiceName
{
  return self->_rawServiceName;
}

- (void)setRawServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_rawServiceName, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_rawServiceName, 0);
}

+ (id)componentsWithRawServiceName:(id)a3 rawRoomName:(id)a4
{
  return +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", a3, a4, 0);
}

+ (id)componentsWithRawServiceName:(id)a3 rawRoomName:(id)a4 localizedFormat:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDServiceNameComponents *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDServiceNameComponents initWithRawServiceName:rawRoomName:localizedFormat:]([HMDServiceNameComponents alloc], "initWithRawServiceName:rawRoomName:localizedFormat:", v9, v8, v7);

  return v10;
}

@end
