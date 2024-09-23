@implementation _EXSceneSessionConnectionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXSceneSessionConnectionRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXSceneSessionConnectionRequest;
  return -[_EXSceneSessionConnectionRequest init](&v3, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  NSXPCListenerEndpoint *hostEndpoint;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  hostEndpoint = self->_hostEndpoint;
  if (hostEndpoint)
    objc_msgSend(v5, "encodeObject:forKey:", hostEndpoint, CFSTR("hostEndpoint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));

}

- (_EXSceneSessionConnectionRequest)initWithCoder:(id)a3
{
  id v4;
  _EXSceneSessionConnectionRequest *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSXPCListenerEndpoint *hostEndpoint;
  uint64_t v10;
  _EXSceneSessionParameters *parameters;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EXSceneSessionConnectionRequest;
  v5 = -[_EXSceneSessionConnectionRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostEndpoint"));
    v8 = objc_claimAutoreleasedReturnValue();
    hostEndpoint = v5->_hostEndpoint;
    v5->_hostEndpoint = (NSXPCListenerEndpoint *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameters"));
    v10 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (_EXSceneSessionParameters *)v10;

  }
  return v5;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSXPCListenerEndpoint)hostEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHostEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (_EXSceneSessionParameters)parameters
{
  return (_EXSceneSessionParameters *)objc_getProperty(self, a2, 24, 1);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_hostEndpoint, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
