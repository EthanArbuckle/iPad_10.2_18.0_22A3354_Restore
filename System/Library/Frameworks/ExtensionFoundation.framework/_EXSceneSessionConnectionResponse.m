@implementation _EXSceneSessionConnectionResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXSceneSessionConnectionResponse)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXSceneSessionConnectionResponse;
  return -[_EXSceneSessionConnectionResponse init](&v3, sel_init);
}

- (_EXSceneSessionConnectionResponse)initWithCoder:(id)a3
{
  id v4;
  _EXSceneSessionConnectionResponse *v5;
  uint64_t v6;
  NSXPCListenerEndpoint *sceneEndpoint;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXSceneSessionConnectionResponse;
  v5 = -[_EXSceneSessionConnectionResponse init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scenenEndpoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    sceneEndpoint = v5->_sceneEndpoint;
    v5->_sceneEndpoint = (NSXPCListenerEndpoint *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sceneEndpoint, CFSTR("scenenEndpoint"));
}

- (NSXPCListenerEndpoint)sceneEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSceneEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneEndpoint, 0);
}

@end
