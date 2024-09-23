@implementation ATXAVRouteInfo

- (ATXAVRouteInfo)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ATXAVRouteInfo *v9;
  NSObject *v10;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXAVRouteInfo initWithProto:].cold.1((uint64_t)self, v10);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isExternalRoute");

  self = -[ATXAVRouteInfo initWithDeviceName:deviceID:isExternalRoute:](self, "initWithDeviceName:deviceID:isExternalRoute:", v6, v7, v8);
  v9 = self;
LABEL_8:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (ATXAVRouteInfo)initWithDeviceName:(id)a3 deviceID:(id)a4 isExternalRoute:(BOOL)a5
{
  id v9;
  id v10;
  ATXAVRouteInfo *v11;
  ATXAVRouteInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAVRouteInfo;
  v11 = -[ATXAVRouteInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_deviceName, a3);
    objc_storeStrong((id *)&v12->_deviceID, a4);
    v12->_isExternalRoute = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  id v5;

  deviceName = self->_deviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceID, CFSTR("deviceID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isExternalRoute, CFSTR("isExternalRoute"));

}

- (ATXAVRouteInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  ATXAVRouteInfo *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isExternalRoute"));

  v8 = -[ATXAVRouteInfo initWithDeviceName:deviceID:isExternalRoute:](self, "initWithDeviceName:deviceID:isExternalRoute:", v5, v6, v7);
  return v8;
}

- (ATXAVRouteInfo)initWithProtoData:(id)a3
{
  id v4;
  ATXPBAVRouteInfo *v5;
  ATXAVRouteInfo *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBAVRouteInfo initWithData:]([ATXPBAVRouteInfo alloc], "initWithData:", v4);

    self = -[ATXAVRouteInfo initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXAVRouteInfo proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)proto
{
  ATXPBAVRouteInfo *v3;

  v3 = objc_alloc_init(ATXPBAVRouteInfo);
  -[ATXPBAVRouteInfo setDeviceName:](v3, "setDeviceName:", self->_deviceName);
  -[ATXPBAVRouteInfo setDeviceID:](v3, "setDeviceID:", self->_deviceID);
  -[ATXPBAVRouteInfo setIsExternalRoute:](v3, "setIsExternalRoute:", self->_isExternalRoute);
  return v3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (BOOL)isExternalRoute
{
  return self->_isExternalRoute;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBAVRouteInfo proto", (uint8_t *)&v5, 0xCu);

}

@end
