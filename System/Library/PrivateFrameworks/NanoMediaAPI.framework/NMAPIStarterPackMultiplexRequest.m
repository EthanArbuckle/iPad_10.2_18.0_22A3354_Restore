@implementation NMAPIStarterPackMultiplexRequest

- (NMAPIStarterPackMultiplexRequest)initWithUnderageUser:(BOOL)a3
{
  _BOOL8 v3;
  NMAPIStarterPackMultiplexRequest *v4;
  void *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NMAPIStarterPackMultiplexRequest;
  v4 = -[MPStoreModelRequest init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Multiplex Identifier For Underage User: (%d)"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMAPIStarterPackMultiplexRequest setLabel:](v4, "setLabel:", v5);

    -[NMAPIStarterPackMultiplexRequest setUnderageUser:](v4, "setUnderageUser:", v3);
  }
  return v4;
}

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString **v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  objc_super v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  MusicURLPathStorefrontWithURLBag(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "dictionaryForBagKey:", *MEMORY[0x24BEC86F0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_underageUser)
      v9 = MediaAPIStarterPackUnder13MultiplexBagKey;
    else
      v9 = MediaAPIStarterPackOver13MultiplexBagKey;
    v10 = *v9;
    objc_msgSend(v8, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v19.receiver = self;
      v19.super_class = (Class)NMAPIStarterPackMultiplexRequest;
      -[NMAPIRequest urlComponentsWithStoreURLBag:error:](&v19, sel_urlComponentsWithStoreURLBag_error_, v6, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD17C8];
      v20[0] = CFSTR("/v1/editorial");
      v20[1] = v7;
      v20[2] = CFSTR("multiplex");
      v20[3] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pathWithComponents:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPath:", v15);

    }
    else
    {
      NMLogForCategory(9);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[NMAPIStarterPackMultiplexRequest urlComponentsWithStoreURLBag:error:].cold.2((uint64_t)v10, v17);

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
    }

  }
  else
  {
    NMLogForCategory(9);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[NMAPIStarterPackMultiplexRequest urlComponentsWithStoreURLBag:error:].cold.1(v16);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NMAPIStarterPackMultiplexRequest;
  result = -[NMAPIRequest copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
    *((_BYTE *)result + 128) = self->_underageUser;
  return result;
}

- (BOOL)isUnderageUser
{
  return self->_underageUser;
}

- (void)setUnderageUser:(BOOL)a3
{
  self->_underageUser = a3;
}

- (void)urlComponentsWithStoreURLBag:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A803000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing musicURLPath.", v1, 2u);
}

- (void)urlComponentsWithStoreURLBag:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21A803000, a2, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing musicStarterPack bag key: %@", (uint8_t *)&v2, 0xCu);
}

@end
