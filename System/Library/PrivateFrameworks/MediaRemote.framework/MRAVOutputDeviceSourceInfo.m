@implementation MRAVOutputDeviceSourceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingContextUID, 0);
}

- (MRAVOutputDeviceSourceInfo)initWithRoutingContextUID:(id)a3 multipleBuiltInDevices:(BOOL)a4
{
  id v6;
  MRAVOutputDeviceSourceInfo *v7;
  uint64_t v8;
  NSString *routingContextUID;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRAVOutputDeviceSourceInfo;
  v7 = -[MRAVOutputDeviceSourceInfo init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    routingContextUID = v7->_routingContextUID;
    v7->_routingContextUID = (NSString *)v8;

    v7->_multipleBuiltInDevices = a4;
  }

  return v7;
}

- (BOOL)multipleBuiltInDevices
{
  return self->_multipleBuiltInDevices;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_multipleBuiltInDevices)
    v5 = "YES";
  else
    v5 = "NO";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p routingContextUID = %@, multipleBuiltIn = %s>"), v4, self, self->_routingContextUID, v5);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "routingContextUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", self->_routingContextUID))
      v7 = self->_multipleBuiltInDevices == objc_msgSend(v5, "multipleBuiltInDevices");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
