@implementation PHASEExternalStreamGroupDebugInfo

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[PHASEExternalStreamGroupDebugInfo isControlled](self, "isControlled");
  if (v5 == objc_msgSend(v4, "isControlled")
    && (v6 = -[PHASEExternalStreamGroupDebugInfo isControllerPaused](self, "isControllerPaused"),
        v6 == objc_msgSend(v4, "isControllerPaused")))
  {
    -[PHASEExternalStreamGroupDebugInfo streams](self, "streams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "streams");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToDictionary:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_controlled, CFSTR("controlled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_controllerPaused, CFSTR("controllerPaused"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_streams, CFSTR("streams"));

}

- (PHASEExternalStreamGroupDebugInfo)initWithCoder:(id)a3
{
  id v4;
  PHASEExternalStreamGroupDebugInfo *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *streams;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHASEExternalStreamGroupDebugInfo;
  v5 = -[PHASEExternalStreamGroupDebugInfo init](&v14, sel_init);
  if (v5)
  {
    v5->_controlled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("controlled"));
    v5->_controllerPaused = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("controllerPaused"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("streams"));
    v11 = objc_claimAutoreleasedReturnValue();
    streams = v5->_streams;
    v5->_streams = (NSDictionary *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<PHASEExternalStreamGroupDebugInfo:%p, isControlled=%d, isControllerPaused=%d, streams:"), self, self->_controlled, self->_controllerPaused);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_streams;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_streams, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\r%@ : %@"), v8, v9);

      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (void)setControlled:(BOOL)a3
{
  self->_controlled = a3;
}

- (void)setControllerPaused:(BOOL)a3
{
  self->_controllerPaused = a3;
}

- (void)setStreams:(id)a3
{
  NSDictionary *v4;
  NSDictionary *streams;
  id v6;

  v6 = a3;
  v4 = (NSDictionary *)objc_msgSend(v6, "copy");
  streams = self->_streams;
  self->_streams = v4;

}

- (BOOL)isControlled
{
  return self->_controlled;
}

- (BOOL)isControllerPaused
{
  return self->_controllerPaused;
}

- (NSDictionary)streams
{
  return self->_streams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streams, 0);
}

@end
