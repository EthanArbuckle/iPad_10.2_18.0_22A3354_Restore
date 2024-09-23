@implementation ARPRoutingSessionArchive

- (ARPRoutingSessionArchive)initWithSessions:(id)a3 routingSessionTimeout:(double)a4
{
  id v7;
  ARPRoutingSessionArchive *v8;
  ARPRoutingSessionArchive *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARPRoutingSessionArchive;
  v8 = -[ARPRoutingSessionArchive init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sessions, a3);
    v9->_routingSessionTimeout = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ARPRoutingSessionArchive sessions](self, "sessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPRoutingSessionArchive routingSessionTimeout](self, "routingSessionTimeout");
  v6 = (void *)objc_msgSend(v4, "initWithSessions:routingSessionTimeout:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[ARPRoutingSessionArchive sessions](self, "sessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sessions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ARPRoutingSessionArchive routingSessionTimeout](self, "routingSessionTimeout");
  v8 = v7;
  NSStringFromSelector(sel_routingSessionTimeout);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v9, v8);

}

- (ARPRoutingSessionArchive)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  ARPRoutingSessionArchive *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sessions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_routingSessionTimeout);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDoubleForKey:", v10);
  v12 = v11;

  v13 = -[ARPRoutingSessionArchive initWithSessions:routingSessionTimeout:](self, "initWithSessions:routingSessionTimeout:", v9, v12);
  return v13;
}

- (NSArray)sessions
{
  return self->_sessions;
}

- (double)routingSessionTimeout
{
  return self->_routingSessionTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end
