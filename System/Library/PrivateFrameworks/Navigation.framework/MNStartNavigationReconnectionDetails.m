@implementation MNStartNavigationReconnectionDetails

- (id)copyWithZone:(_NSZone *)a3
{
  MNStartNavigationReconnectionDetails *v4;
  MNStartNavigationReconnectionDetails *v5;
  uint64_t v6;
  NSArray *spokenAnnouncements;
  uint64_t v8;
  NSData *serverSessionState;
  MNStartNavigationReconnectionDetails *v10;

  v4 = -[MNStartNavigationReconnectionDetails init](+[MNStartNavigationReconnectionDetails allocWithZone:](MNStartNavigationReconnectionDetails, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v4->_isReconnecting = self->_isReconnecting;
    v4->_initialRouteSource = self->_initialRouteSource;
    v4->_targetLegIndex = self->_targetLegIndex;
    v6 = -[NSArray copy](self->_spokenAnnouncements, "copy");
    spokenAnnouncements = v5->_spokenAnnouncements;
    v5->_spokenAnnouncements = (NSArray *)v6;

    v8 = -[NSData copy](self->_serverSessionState, "copy");
    serverSessionState = v5->_serverSessionState;
    v5->_serverSessionState = (NSData *)v8;

    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNStartNavigationReconnectionDetails)initWithCoder:(id)a3
{
  id v4;
  MNStartNavigationReconnectionDetails *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *spokenAnnouncements;
  uint64_t v11;
  NSData *serverSessionState;
  MNStartNavigationReconnectionDetails *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MNStartNavigationReconnectionDetails;
  v5 = -[MNStartNavigationReconnectionDetails init](&v15, sel_init);
  if (v5)
  {
    v5->_isReconnecting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isReconnecting"));
    v5->_initialRouteSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_initialRouteSource"));
    v5->_targetLegIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_targetLegIndex"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_spokenAnnouncements"));
    v9 = objc_claimAutoreleasedReturnValue();
    spokenAnnouncements = v5->_spokenAnnouncements;
    v5->_spokenAnnouncements = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverSessionState"));
    v11 = objc_claimAutoreleasedReturnValue();
    serverSessionState = v5->_serverSessionState;
    v5->_serverSessionState = (NSData *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isReconnecting;
  id v5;

  isReconnecting = self->_isReconnecting;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isReconnecting, CFSTR("_isReconnecting"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_initialRouteSource, CFSTR("_initialRouteSource"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_targetLegIndex, CFSTR("_targetLegIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spokenAnnouncements, CFSTR("_spokenAnnouncements"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverSessionState, CFSTR("_serverSessionState"));

}

- (BOOL)isReconnecting
{
  return self->_isReconnecting;
}

- (void)setIsReconnecting:(BOOL)a3
{
  self->_isReconnecting = a3;
}

- (unint64_t)initialRouteSource
{
  return self->_initialRouteSource;
}

- (void)setInitialRouteSource:(unint64_t)a3
{
  self->_initialRouteSource = a3;
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  self->_targetLegIndex = a3;
}

- (NSArray)spokenAnnouncements
{
  return self->_spokenAnnouncements;
}

- (void)setSpokenAnnouncements:(id)a3
{
  objc_storeStrong((id *)&self->_spokenAnnouncements, a3);
}

- (NSData)serverSessionState
{
  return self->_serverSessionState;
}

- (void)setServerSessionState:(id)a3
{
  objc_storeStrong((id *)&self->_serverSessionState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSessionState, 0);
  objc_storeStrong((id *)&self->_spokenAnnouncements, 0);
}

@end
