@implementation CMIOExtensionInfo

+ (id)infoWithEndpoint:(id)a3 bundleID:(id)a4 bundleInfo:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEndpoint:bundleID:bundleInfo:", a3, a4, a5);
}

- (CMIOExtensionInfo)initWithEndpoint:(id)a3 bundleID:(id)a4 bundleInfo:(id)a5
{
  CMIOExtensionInfo *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMIOExtensionInfo;
  v8 = -[CMIOExtensionInfo init](&v10, sel_init);
  if (v8)
  {
    if (a3)
      v8->_endpoint = (OS_xpc_object *)xpc_retain(a3);
    v8->_bundleID = (NSString *)objc_msgSend(a4, "copy");
    v8->_bundleInfo = (NSDictionary *)objc_msgSend(a5, "copy");
    v8->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionInfo: ID %@>"), v8->_bundleID);
    v8->_redactedDescription = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionInfo: ID ->"));
  }
  return v8;
}

- (void)dealloc
{
  OS_xpc_object *endpoint;
  objc_super v4;

  endpoint = self->_endpoint;
  if (endpoint)
    xpc_release(endpoint);

  v4.receiver = self;
  v4.super_class = (Class)CMIOExtensionInfo;
  -[CMIOExtensionInfo dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (id)redactedDescription
{
  return self->_redactedDescription;
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDictionary)bundleInfo
{
  return self->_bundleInfo;
}

@end
