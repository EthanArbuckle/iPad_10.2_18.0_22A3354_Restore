@implementation CCRapportDevice

- (CCRapportDevice)initWithRPCompanionLinkDevice:(id)a3
{
  id v5;
  CCRapportDevice *v6;
  CCRapportDevice *v7;
  uint64_t v8;
  NSString *rapportIdentifier;
  uint64_t v10;
  NSMutableArray *requestQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCRapportDevice;
  v6 = -[CCRapportDevice init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    objc_msgSend(v5, "CC_companionLinkDeviceIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    rapportIdentifier = v7->_rapportIdentifier;
    v7->_rapportIdentifier = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = (NSMutableArray *)v10;

  }
  return v7;
}

- (NSString)shortenedRapportIdentifier
{
  return -[NSString substringToIndex:](self->_rapportIdentifier, "substringToIndex:", 8);
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[CCRapportDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)model
{
  void *v2;
  void *v3;

  -[CCRapportDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)serviceTypes
{
  void *v2;
  void *v3;

  -[CCRapportDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)platform
{
  void *v2;
  void *v3;
  int64_t v4;

  -[CCRapportDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BMDevicePlatformFromModelString();

  return v4;
}

- (void)invalidateClientWithError:(id)a3
{
  RPCompanionLinkClient *client;
  NSObject *v5;
  id v6;

  client = self->_client;
  if (client)
  {
    v6 = a3;
    -[RPCompanionLinkClient dispatchQueue](client, "dispatchQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    -[RPCompanionLinkClient setInvalidationHandler:](self->_client, "setInvalidationHandler:", 0);
    -[RPCompanionLinkClient invalidate](self->_client, "invalidate");
    -[CCRapportDevice handleInvalidationWithError:](self, "handleInvalidationWithError:", v6);

  }
}

- (void)handleInvalidationWithError:(id)a3
{
  id v4;
  RPCompanionLinkClient *client;
  NSObject *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  RPCompanionLinkClient *v15;
  NSObject *v16;
  CCRapportDevice *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  client = self->_client;
  if (client)
  {
    -[RPCompanionLinkClient dispatchQueue](client, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = self;
    v7 = self->_requestQueue;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("~~RESPONSE_HANDLER~~"));
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v12;
          if (v12)
          {
            if (v4)
            {
              (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v12 + 16))(v12, 0, 0, v4);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CCRapportErrorDomain"), 0, 0);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, _QWORD, _QWORD, void *))v13)[2](v13, 0, 0, v14);

            }
          }

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    -[NSMutableArray removeAllObjects](v17->_requestQueue, "removeAllObjects");
    v15 = v17->_client;
    v17->_client = 0;

    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[CCRapportDevice handleInvalidationWithError:].cold.1(v17, v16);

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "rapportIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCRapportDevice rapportIdentifier](self, "rapportIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CCRapportDevice rapportIdentifier](self, "rapportIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[CCRapportDevice shortenedRapportIdentifier](self, "shortenedRapportIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCRapportDevice rapportIdentifier](self, "rapportIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCRapportDevice ccDeviceIdentifier](self, "ccDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCRapportDevice model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCRapportDevice name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("CCRapportDevice[%@]: id=%@ ccID=%@ model=%@ name=%@"), v4, v5, v6, v7, v8);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CCRapportDevice *v3;

  v3 = self;
  return -[CCRapportDevice initWithRPCompanionLinkDevice:](v3, "initWithRPCompanionLinkDevice:", v3->_device);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CCRapportDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CCRapportDevice *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CCRapportDevice initWithRPCompanionLinkDevice:](self, "initWithRPCompanionLinkDevice:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CCRapportDevice device](self, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("device"));

}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (NSString)ccDeviceIdentifier
{
  return self->_ccDeviceIdentifier;
}

- (void)setCcDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ccDeviceIdentifier, a3);
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (unint64_t)linkState
{
  return self->_linkState;
}

- (void)setLinkState:(unint64_t)a3
{
  self->_linkState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_ccDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
}

- (void)handleInvalidationWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortenedRapportIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_237B02000, a2, OS_LOG_TYPE_DEBUG, "CCRapportDevice[%@]: invalidated", v4);

  OUTLINED_FUNCTION_7();
}

@end
