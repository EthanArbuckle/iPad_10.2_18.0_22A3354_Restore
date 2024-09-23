@implementation GEOResumeRouteHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOResumeRouteHandle)initWithGEOStorageResumeRouteHandle:(id)a3
{
  id v4;
  GEOResumeRouteHandle *v5;
  void *v6;
  uint64_t v7;
  GEOOriginalWaypointRoute *routeGeometry;
  void *v9;
  uint64_t v10;
  NSData *serverSessionState;
  GEOResumeRouteHandle *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOResumeRouteHandle;
  v5 = -[GEOResumeRouteHandle init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "routeGeometry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    routeGeometry = v5->_routeGeometry;
    v5->_routeGeometry = (GEOOriginalWaypointRoute *)v7;

    objc_msgSend(v4, "serverSessionState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    serverSessionState = v5->_serverSessionState;
    v5->_serverSessionState = (NSData *)v10;

    v5->_hasVisitedFirstStop = objc_msgSend(v4, "hasVisitedFirstStop");
    v12 = v5;
  }

  return v5;
}

- (id)resumeRouteHandleStorage
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)-[GEOOriginalWaypointRoute copy](self->_routeGeometry, "copy");
  objc_msgSend(v3, "setRouteGeometry:", v4);

  v5 = (void *)-[NSData copy](self->_serverSessionState, "copy");
  objc_msgSend(v3, "setServerSessionState:", v5);

  objc_msgSend(v3, "setHasVisitedFirstStop:", self->_hasVisitedFirstStop);
  return v3;
}

- (GEOResumeRouteHandle)initWithCoder:(id)a3
{
  id v4;
  GEOResumeRouteHandle *v5;
  uint64_t v6;
  GEOOriginalWaypointRoute *routeGeometry;
  uint64_t v8;
  NSData *serverSessionState;
  GEOResumeRouteHandle *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOResumeRouteHandle;
  v5 = -[GEOResumeRouteHandle init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeGeometry"));
    v6 = objc_claimAutoreleasedReturnValue();
    routeGeometry = v5->_routeGeometry;
    v5->_routeGeometry = (GEOOriginalWaypointRoute *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverSessionState"));
    v8 = objc_claimAutoreleasedReturnValue();
    serverSessionState = v5->_serverSessionState;
    v5->_serverSessionState = (NSData *)v8;

    v5->_hasVisitedFirstStop = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasVisitedFirstStop"));
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOOriginalWaypointRoute *routeGeometry;
  id v5;

  routeGeometry = self->_routeGeometry;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", routeGeometry, CFSTR("_routeGeometry"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverSessionState, CFSTR("_serverSessionState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasVisitedFirstStop, CFSTR("_hasVisitedFirstStop"));

}

- (id)description
{
  NSData *serverSessionState;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  serverSessionState = self->_serverSessionState;
  if (serverSessionState)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Session state: %d bytes"), -[NSData length](serverSessionState, "length"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("Session state: (null)");
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[GEOOriginalWaypointRoute routeLegs](self->_routeGeometry, "routeLegs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@, route legs: %d, has visited first stop: %d"), v4, objc_msgSend(v6, "count"), self->_hasVisitedFirstStop);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  NSData *serverSessionState;
  __CFString *v4;
  void *v5;
  _BOOL8 hasVisitedFirstStop;
  void *v7;
  void *v8;

  serverSessionState = self->_serverSessionState;
  if (serverSessionState)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Session state: %d bytes"), -[NSData length](serverSessionState, "length"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("Session state: (null)");
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  hasVisitedFirstStop = self->_hasVisitedFirstStop;
  -[GEOOriginalWaypointRoute formattedText](self->_routeGeometry, "formattedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ | has visited first stop: %d | %@"), v4, hasVisitedFirstStop, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)resumeRouteHandleStorageFromResumeRouteHandle:(id)a3
{
  return (id)objc_msgSend(a3, "resumeRouteHandleStorage");
}

- (GEOOriginalWaypointRoute)routeGeometry
{
  return self->_routeGeometry;
}

- (void)setRouteGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_routeGeometry, a3);
}

- (NSData)serverSessionState
{
  return self->_serverSessionState;
}

- (void)setServerSessionState:(id)a3
{
  objc_storeStrong((id *)&self->_serverSessionState, a3);
}

- (BOOL)hasVisitedFirstStop
{
  return self->_hasVisitedFirstStop;
}

- (void)setHasVisitedFirstStop:(BOOL)a3
{
  self->_hasVisitedFirstStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSessionState, 0);
  objc_storeStrong((id *)&self->_routeGeometry, 0);
}

@end
