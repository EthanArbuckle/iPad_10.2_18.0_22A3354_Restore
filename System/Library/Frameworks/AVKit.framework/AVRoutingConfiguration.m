@implementation AVRoutingConfiguration

+ (id)defaultConfiguration
{
  AVRoutingConfiguration *v2;

  v2 = objc_alloc_init(AVRoutingConfiguration);
  v2->_isDefault = 1;
  return v2;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (NSString)outputContextID
{
  return self->_outputContextID;
}

- (unint64_t)sharingPolicy
{
  return self->_sharingPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContextID, 0);
}

+ (AVRoutingConfiguration)configurationWithOutputContextID:(id)a3 sharingPolicy:(unint64_t)a4
{
  NSString *v5;
  AVRoutingConfiguration *v6;
  NSString *outputContextID;

  v5 = (NSString *)a3;
  v6 = objc_alloc_init(AVRoutingConfiguration);
  outputContextID = v6->_outputContextID;
  v6->_outputContextID = v5;

  v6->_sharingPolicy = a4;
  return v6;
}

@end
