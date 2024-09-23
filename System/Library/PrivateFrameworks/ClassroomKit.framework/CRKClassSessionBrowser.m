@implementation CRKClassSessionBrowser

- (void)dealloc
{
  CATNetworkReachability *mNetworkReachability;
  void *v4;
  objc_super v5;

  -[CATNetworkReachability setDelegate:](self->mNetworkReachability, "setDelegate:", 0);
  mNetworkReachability = self->mNetworkReachability;
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATNetworkReachability removeFromRunLoop:forMode:](mNetworkReachability, "removeFromRunLoop:forMode:", v4, *MEMORY[0x24BDBCA90]);

  v5.receiver = self;
  v5.super_class = (Class)CRKClassSessionBrowser;
  -[CRKClassSessionBrowser dealloc](&v5, sel_dealloc);
}

- (CRKClassSessionBrowser)init
{
  CRKClassSessionBrowser *v4;
  uint64_t v5;
  NSMutableDictionary *mClassSessionsByIdentifier;
  uint64_t v7;
  NSMutableArray *mInRangeClassSessions;
  uint64_t v9;
  NSMutableDictionary *mInvitationSessionsByEndpoint;
  uint64_t v11;
  CATNetworkReachability *mNetworkReachability;
  CATNetworkReachability *v13;
  void *v14;
  uint64_t v15;
  CRKClassSessionBeaconBrowser *mBeaconBrowser;
  uint64_t v17;
  NSMutableDictionary *mConnectWithoutBeaconAssertionCountBySessionIdentifier;
  uint64_t v19;
  NSMutableDictionary *mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint;
  void *v22;
  void *v23;
  objc_super v24;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 44, CFSTR("%@ must be called from the main thread"), v23);

  }
  v24.receiver = self;
  v24.super_class = (Class)CRKClassSessionBrowser;
  v4 = -[CRKClassSessionBrowser init](&v24, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    mClassSessionsByIdentifier = v4->mClassSessionsByIdentifier;
    v4->mClassSessionsByIdentifier = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    mInRangeClassSessions = v4->mInRangeClassSessions;
    v4->mInRangeClassSessions = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    mInvitationSessionsByEndpoint = v4->mInvitationSessionsByEndpoint;
    v4->mInvitationSessionsByEndpoint = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BE2C748], "reachabilityForLocalWiFi");
    v11 = objc_claimAutoreleasedReturnValue();
    mNetworkReachability = v4->mNetworkReachability;
    v4->mNetworkReachability = (CATNetworkReachability *)v11;

    -[CATNetworkReachability setDelegate:](v4->mNetworkReachability, "setDelegate:", v4);
    v13 = v4->mNetworkReachability;
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATNetworkReachability scheduleInRunLoop:forMode:](v13, "scheduleInRunLoop:forMode:", v14, *MEMORY[0x24BDBCA90]);

    v15 = objc_opt_new();
    mBeaconBrowser = v4->mBeaconBrowser;
    v4->mBeaconBrowser = (CRKClassSessionBeaconBrowser *)v15;

    -[CRKClassSessionBeaconBrowser setDelegate:](v4->mBeaconBrowser, "setDelegate:", v4);
    v17 = objc_opt_new();
    mConnectWithoutBeaconAssertionCountBySessionIdentifier = v4->mConnectWithoutBeaconAssertionCountBySessionIdentifier;
    v4->mConnectWithoutBeaconAssertionCountBySessionIdentifier = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint = v4->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint;
    v4->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint = (NSMutableDictionary *)v19;

  }
  return v4;
}

- (void)setOrganizationUUIDs:(id)a3
{
  void *v5;
  id v6;
  NSSet *v7;
  NSSet *organizationUUIDs;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD17F0];
  v6 = a3;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 68, CFSTR("%@ must be called from the main thread"), v10);

  }
  -[CRKClassSessionBeaconBrowser setOrganizationUUIDs:](self->mBeaconBrowser, "setOrganizationUUIDs:", v6);
  v7 = (NSSet *)objc_msgSend(v6, "copy");

  organizationUUIDs = self->_organizationUUIDs;
  self->_organizationUUIDs = v7;

}

- (void)setEnrolledControlGroupIdentifiers:(id)a3
{
  NSSet *v5;
  NSSet *enrolledControlGroupIdentifiers;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 75, CFSTR("%@ must be called from the main thread"), v8);

  }
  v5 = (NSSet *)objc_msgSend(v9, "copy");
  enrolledControlGroupIdentifiers = self->_enrolledControlGroupIdentifiers;
  self->_enrolledControlGroupIdentifiers = v5;

  -[CRKClassSessionBrowser updateConnectedSessions](self, "updateConnectedSessions");
}

- (void)setAllowUnenrolledSessions:(BOOL)a3
{
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 83, CFSTR("%@ must be called from the main thread"), v7);

  }
  self->_allowUnenrolledSessions = a3;
  if (!a3)
    -[CRKClassSessionBrowser updateConnectedSessions](self, "updateConnectedSessions");
}

- (void)setAllowInvitationSessions:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 93, CFSTR("%@ must be called from the main thread"), v7);

  }
  -[CRKClassSessionBeaconBrowser setAllowInvitationSessions:](self->mBeaconBrowser, "setAllowInvitationSessions:", v3);
  self->_allowInvitationSessions = v3;
  if (!v3)
    -[CRKClassSessionBrowser updateConnectedSessions](self, "updateConnectedSessions");
}

- (void)connectToClassSessionWithIdentifier:(id)a3
{
  id v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connect");

}

- (void)classSessionInvalidated:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 111, CFSTR("%@ must be called from the main thread"), v8);

  }
  v5 = v9;
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    v5 = v9;
  }

}

- (void)classSessionRejected:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 119, CFSTR("%@ must be called from the main thread"), v8);

  }
  v5 = v9;
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rejected");

    v5 = v9;
  }

}

- (void)lostConnectionToClassSession:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 127, CFSTR("%@ must be called from the main thread"), v8);

  }
  v5 = v9;
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lostConnection");

    v5 = v9;
  }

}

- (BOOL)hasConnectionToClassWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 135, CFSTR("%@ must be called from the main thread"), v10);

    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("classIdentifier"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)invitationSessionWithEndpointInvalidated:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 141, CFSTR("%@ must be called from the main thread"), v8);

  }
  v5 = v9;
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->mInvitationSessionsByEndpoint, "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[NSMutableDictionary removeObjectForKey:](self->mInvitationSessionsByEndpoint, "removeObjectForKey:", v9);
    v5 = v9;
  }

}

- (void)lostConnectionToInvitationSessionWithEndpoint:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 150, CFSTR("%@ must be called from the main thread"), v8);

  }
  v5 = v9;
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->mInvitationSessionsByEndpoint, "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lostConnection");

    v5 = v9;
  }

}

- (void)acquireConnectWithoutBeaconAssertionForSessionIdentifier:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v15 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier"));

    v5 = 0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->mConnectWithoutBeaconAssertionCountBySessionIdentifier, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &unk_24DA080D8;
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11 + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mConnectWithoutBeaconAssertionCountBySessionIdentifier, "setObject:forKeyedSubscript:", v12, v15);

  -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassSessionBrowser updateRequiresBeaconFlagForSession:](self, "updateRequiresBeaconFlagForSession:", v13);

}

- (void)releaseConnectWithoutBeaconAssertionForSessionIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier"));

    v5 = 0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->mConnectWithoutBeaconAssertionCountBySessionIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "isEqual:", &unk_24DA080F0))
    {
      -[NSMutableDictionary removeObjectForKey:](self->mConnectWithoutBeaconAssertionCountBySessionIdentifier, "removeObjectForKey:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->mConnectWithoutBeaconAssertionCountBySessionIdentifier, "setObject:forKeyedSubscript:", v8, v11);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBrowser updateRequiresBeaconFlagForSession:](self, "updateRequiresBeaconFlagForSession:", v9);

  }
}

- (void)acquireConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v15 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endpoint"));

    v5 = 0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &unk_24DA080D8;
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11 + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint, "setObject:forKeyedSubscript:", v12, v15);

  -[NSMutableDictionary objectForKeyedSubscript:](self->mInvitationSessionsByEndpoint, "objectForKeyedSubscript:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassSessionBrowser updateRequiresBeaconFlagForSession:](self, "updateRequiresBeaconFlagForSession:", v13);

}

- (void)releaseConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endpoint"));

    v5 = 0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "isEqual:", &unk_24DA080F0))
    {
      -[NSMutableDictionary removeObjectForKey:](self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint, "removeObjectForKey:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint, "setObject:forKeyedSubscript:", v8, v11);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBrowser updateRequiresBeaconFlagForSession:](self, "updateRequiresBeaconFlagForSession:", v9);

  }
}

- (void)startBrowsing
{
  -[CRKClassSessionBeaconBrowser startBrowsing](self->mBeaconBrowser, "startBrowsing");
}

- (void)stopBrowsing
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self->mBeaconBrowser, sel_startBrowsing, 0);
  -[CRKClassSessionBeaconBrowser stopBrowsing](self->mBeaconBrowser, "stopBrowsing");
}

- (BOOL)isBrowsing
{
  return -[CRKClassSessionBeaconBrowser isBrowsing](self->mBeaconBrowser, "isBrowsing");
}

- (NSSet)inRangeClassSessionIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableArray valueForKey:](self->mInRangeClassSessions, "valueForKey:", CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)clientIdentityForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "groupIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBrowser delegateNeedsClientIdentityForGroup:](self, "delegateNeedsClientIdentityForGroup:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "endpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRKClassSessionBrowser delegateNeedsClientIdentityForInvitationSessionWithEndpoint:](self, "delegateNeedsClientIdentityForInvitationSessionWithEndpoint:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)trustedAnchorCertificatesForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBrowser delegateNeedsTrustedAnchorCertificatesForGroup:](self, "delegateNeedsTrustedAnchorCertificatesForGroup:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

- (void)sessionDidBecomeConnectable:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRKClassSessionBrowser delegateClassSessionDidBecomeConnectable:](self, "delegateClassSessionDidBecomeConnectable:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "connect");
    else
      objc_msgSend(v4, "invalidate");
  }

}

- (void)sessionDidBecomeNotConnectable:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[CRKClassSessionBrowser delegateClassSessionDidBecomeNotConnectable:](self, "delegateClassSessionDidBecomeNotConnectable:", v4);

}

- (void)session:(id)a3 didConnectWithTransport:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();

    -[CRKClassSessionBrowser delegateDidFindClassSession:transport:](self, "delegateDidFindClassSession:transport:", v7, v8);
    v6 = (id)v7;
  }
  else
  {
    -[CRKClassSessionBrowser delegateDidFindInvitationSession:transport:](self, "delegateDidFindInvitationSession:transport:", v6, v8);
  }

}

- (void)sessionDidDisconnect:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();

    -[CRKClassSessionBrowser delegateLostConnectionToClassSession:](self, "delegateLostConnectionToClassSession:", v4);
    v5 = (id)v4;
  }
  else
  {
    -[CRKClassSessionBrowser delegateLostConnectionToInvitationSession:](self, "delegateLostConnectionToInvitationSession:", v5);
  }

}

- (void)session:(id)a3 willLoseBeaconAfterTimeInterval:(double)a4
{
  -[CRKClassSessionBeaconBrowser increaseScanFrequencyForDuration:](self->mBeaconBrowser, "increaseScanFrequencyForDuration:", a3, a4);
}

- (void)sessionDidLoseBeacon:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    _CRKLogGeneral_21();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[NSObject identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v7;
      v13 = 1024;
      v14 = -[NSObject flags](v5, "flags");
      _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "Class session lost beacon %{public}@ [%d]", (uint8_t *)&v11, 0x12u);

    }
    -[NSObject identifier](v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBrowser delegateDidRemoveClassSession:](self, "delegateDidRemoveClassSession:", v8);

  }
  else
  {
    _CRKLogGeneral_21();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "endpoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Invite session lost beacon %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }

  objc_msgSend(v4, "invalidate");
}

- (void)sessionDidInvalidate:(id)a3
{
  NSMutableDictionary *mClassSessionsByIdentifier;
  id v5;
  void *v6;
  NSMutableDictionary *mInvitationSessionsByEndpoint;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mClassSessionsByIdentifier = self->mClassSessionsByIdentifier;
    v5 = v9;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](mClassSessionsByIdentifier, "removeObjectForKey:", v6);

    -[CRKClassSessionBrowser removeInRangeClassSession:](self, "removeInRangeClassSession:", v5);
  }
  else
  {
    mInvitationSessionsByEndpoint = self->mInvitationSessionsByEndpoint;
    objc_msgSend(v9, "endpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](mInvitationSessionsByEndpoint, "removeObjectForKey:", v8);

    -[CRKClassSessionBrowser delegateDidRemoveInvitationSession:](self, "delegateDidRemoveInvitationSession:", v9);
  }

}

- (void)session:(id)a3 encounteredUntrustedConnectionForASMInstructorIdentifier:(id)a4 decisionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRKClassSessionBrowser handleUntrustedInvitationSession:decisionHandler:](self, "handleUntrustedInvitationSession:decisionHandler:", v10, v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CRKClassSessionBrowser handleUntrustedClassSession:ASMInstructorIdentifier:decisionHandler:](self, "handleUntrustedClassSession:ASMInstructorIdentifier:decisionHandler:", v10, v8, v9);
    else
      v9[2](v9, 0);
  }

}

- (void)handleUntrustedInvitationSession:(id)a3 decisionHandler:(id)a4
{
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a4;
  if (-[CRKClassSessionBrowser allowInvitationSessions](self, "allowInvitationSessions"))
    v5 = 2;
  else
    v5 = 0;
  v6[2](v6, v5);

}

- (void)handleUntrustedClassSession:(id)a3 ASMInstructorIdentifier:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CRKClassSessionBrowser delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "browser:encounteredUntrustedClassSession:ASMInstructorIdentifier:decisionHandler:", self, v11, v9, v8);
}

- (void)beaconBrowser:(id)a3 didFailWithError:(id)a4
{
  -[CRKClassSessionBrowser delegateDidFailWithError:](self, "delegateDidFailWithError:", a4);
}

- (void)beaconBrowser:(id)a3 didFindBeaconForClassSession:(id)a4 flags:(unsigned __int16)a5
{
  uint64_t v5;
  CRKClassSession *v8;
  void *v9;
  void *v10;
  BOOL v11;
  CRKClassSession *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  CRKClassSession *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x24BDAC8D0];
  v8 = (CRKClassSession *)a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 348, CFSTR("%@ must be called from the main thread"), v16);

  }
  -[CRKClassSessionBrowser enrolledControlGroupIdentifiers](self, "enrolledControlGroupIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassSession groupIdentifier](v8, "groupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v10) & 1) != 0)
  {

  }
  else
  {
    v11 = -[CRKClassSessionBrowser allowUnenrolledSessions](self, "allowUnenrolledSessions");

    if ((v5 & 1) == 0 || !v11)
      goto LABEL_15;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v8);
  v12 = (CRKClassSession *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    _CRKLogGeneral_21();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 1024;
      v20 = v5;
      _os_log_impl(&dword_218C99000, v13, OS_LOG_TYPE_INFO, "Found class session with beacon %{public}@ [%d]", buf, 0x12u);
    }

    v12 = -[CRKClassSession initWithIdentifier:]([CRKClassSession alloc], "initWithIdentifier:", v8);
    -[CRKSession setDelegate:](v12, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->mClassSessionsByIdentifier, "setObject:forKeyedSubscript:", v12, v8);
    -[CRKClassSessionBrowser updateRequiresBeaconFlagForSession:](self, "updateRequiresBeaconFlagForSession:", v12);
    if ((-[CATNetworkReachability isReachable](self->mNetworkReachability, "isReachable") & 1) == 0)
      -[CRKSession localWiFiBecameUnavailable](v12, "localWiFiBecameUnavailable");
  }
  -[CRKClassSessionBrowser addInRangeClassSession:](self, "addInRangeClassSession:", v12);
  _CRKLogGeneral_21();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 1024;
    v20 = v5;
    _os_log_impl(&dword_218C99000, v14, OS_LOG_TYPE_INFO, "Telling class session %{public}@ that we found beacon with flags [%d]", buf, 0x12u);
  }

  -[CRKClassSession foundBeaconWithFlags:](v12, "foundBeaconWithFlags:", v5);
LABEL_15:

}

- (void)beaconBrowser:(id)a3 didFindBeaconForInvitationSessionWithEndpoint:(id)a4
{
  id v6;
  CRKInvitationSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 376, CFSTR("%@ must be called from the main thread"), v11);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->mInvitationSessionsByEndpoint, "objectForKeyedSubscript:", v6);
  v7 = (CRKInvitationSession *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _CRKLogGeneral_21();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_218C99000, v8, OS_LOG_TYPE_INFO, "Found invitation session with ip %{public}@", buf, 0xCu);

    }
    v7 = -[CRKSession initWithEndpoint:]([CRKInvitationSession alloc], "initWithEndpoint:", v6);
    -[CRKSession setDelegate:](v7, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->mInvitationSessionsByEndpoint, "setObject:forKeyedSubscript:", v7, v6);
    -[CRKClassSessionBrowser updateRequiresBeaconFlagForSession:](self, "updateRequiresBeaconFlagForSession:", v7);
    if ((-[CATNetworkReachability isReachable](self->mNetworkReachability, "isReachable") & 1) == 0)
      -[CRKSession localWiFiBecameUnavailable](v7, "localWiFiBecameUnavailable");
  }
  -[CRKSession foundBeacon](v7, "foundBeacon");

}

- (void)reachabilityDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "isReachable"))
  {
    if (-[CRKClassSessionBeaconBrowser isBrowsing](self->mBeaconBrowser, "isBrowsing"))
    {
      -[CRKClassSessionBeaconBrowser stopBrowsing](self->mBeaconBrowser, "stopBrowsing");
      objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self->mBeaconBrowser, sel_startBrowsing, 0);
      -[CRKClassSessionBeaconBrowser performSelector:withObject:afterDelay:](self->mBeaconBrowser, "performSelector:withObject:afterDelay:", sel_startBrowsing, 0, 1.0);
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NSMutableDictionary allValues](self->mClassSessionsByIdentifier, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v36 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "localWiFiBecameAvailable");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v6);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[NSMutableDictionary allValues](self->mInvitationSessionsByEndpoint, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "localWiFiBecameAvailable");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v11);
    }
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[NSMutableDictionary allValues](self->mClassSessionsByIdentifier, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * k), "localWiFiBecameUnavailable");
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
      }
      while (v16);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[NSMutableDictionary allValues](self->mInvitationSessionsByEndpoint, "allValues", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        for (m = 0; m != v20; ++m)
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * m), "localWiFiBecameUnavailable");
        }
        v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
      }
      while (v20);
    }
  }

}

- (void)addInRangeClassSession:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->mInRangeClassSessions, "containsObject:") & 1) == 0)
  {
    -[NSMutableArray addObject:](self->mInRangeClassSessions, "addObject:", v4);
    -[CRKClassSessionBrowser delegateInRangeClassSessionsDidChange](self, "delegateInRangeClassSessionsDidChange");
  }

}

- (void)removeInRangeClassSession:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->mInRangeClassSessions, "containsObject:"))
  {
    -[NSMutableArray removeObject:](self->mInRangeClassSessions, "removeObject:", v4);
    -[CRKClassSessionBrowser delegateInRangeClassSessionsDidChange](self, "delegateInRangeClassSessionsDidChange");
  }

}

- (void)updateRequiresBeaconFlagForSession:(id)a3
{
  id v4;
  NSMutableDictionary *mConnectWithoutBeaconAssertionCountBySessionIdentifier;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      mConnectWithoutBeaconAssertionCountBySessionIdentifier = self->mConnectWithoutBeaconAssertionCountBySessionIdentifier;
      objc_msgSend(v9, "identifier");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = 0;
        goto LABEL_8;
      }
      mConnectWithoutBeaconAssertionCountBySessionIdentifier = self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint;
      objc_msgSend(v9, "endpoint");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    -[NSMutableDictionary objectForKeyedSubscript:](mConnectWithoutBeaconAssertionCountBySessionIdentifier, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    objc_msgSend(v9, "setRequiresBeacon:", objc_msgSend(v8, "unsignedIntegerValue") == 0);

    v4 = v9;
  }

}

- (id)stateDictionariesByClassSessionIdentifierString
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = self->mClassSessionsByIdentifier;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stateDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v6);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSMutableDictionary allValues](self->mInvitationSessionsByEndpoint, "allValues", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(v18, "stateDictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "endpoint");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v15);
  }

  return v3;
}

- (id)browserStateDictionary
{
  return -[CRKClassSessionBeaconBrowser stateDictionary](self->mBeaconBrowser, "stateDictionary");
}

- (void)updateConnectedSessions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  NSObject *v28;
  __int128 v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[CRKClassSessionBrowser enrolledControlGroupIdentifiers](self, "enrolledControlGroupIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[NSMutableDictionary allValues](self->mClassSessionsByIdentifier, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "groupIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v4, "containsObject:", v12) & 1) == 0
          && (!-[CRKClassSessionBrowser allowUnenrolledSessions](self, "allowUnenrolledSessions")
           || (objc_msgSend(v10, "flags") & 1) == 0))
        {
          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v7);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v36;
    *(_QWORD *)&v15 = 138543362;
    v29 = v15;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v19, v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _CRKLogGeneral_21();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v29;
          v45 = v20;
          _os_log_impl(&dword_218C99000, v21, OS_LOG_TYPE_INFO, "Invalidating session because we are no longer enrolled: %{public}@", buf, 0xCu);
        }

        -[CRKClassSessionBrowser delegateDidRemoveClassSession:](self, "delegateDidRemoveClassSession:", v19);
        objc_msgSend(v20, "invalidate");

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v16);
  }

  if (!-[CRKClassSessionBrowser allowInvitationSessions](self, "allowInvitationSessions"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[NSMutableDictionary allValues](self->mInvitationSessionsByEndpoint, "allValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * k);
          _CRKLogGeneral_21();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v27;
            _os_log_impl(&dword_218C99000, v28, OS_LOG_TYPE_INFO, "Invalidating invitation session because we are not browsing for invitations: %{public}@", buf, 0xCu);
          }

          objc_msgSend(v27, "invalidate");
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v24);
    }

  }
}

- (void)delegateDidFailWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKClassSessionBrowser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKClassSessionBrowser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "browser:didFailWithError:", self, v7);

  }
}

- (id)delegateNeedsClientIdentityForGroup:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CRKClassSessionBrowser delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRKClassSessionBrowser delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "browser:clientIdentityForGroup:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)delegateNeedsTrustedAnchorCertificatesForGroup:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBrowser.m"), 532, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifier"));

  }
  -[CRKClassSessionBrowser delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CRKClassSessionBrowser delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "browser:trustedAnchorCertificatesForGroup:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)delegateClassSessionDidBecomeConnectable:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CRKClassSessionBrowser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKClassSessionBrowser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "browser:classSessionDidBecomeConnectable:withFlags:", self, v7, objc_msgSend(v8, "flags"));

  }
}

- (void)delegateClassSessionDidBecomeNotConnectable:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CRKClassSessionBrowser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKClassSessionBrowser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "browser:classSessionDidBecomeNotConnectable:withFlags:", self, v7, objc_msgSend(v8, "flags"));

  }
}

- (void)delegateDidFindClassSession:(id)a3 transport:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CRKClassSessionBrowser delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    _CRKLogGeneral_21();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_218C99000, v10, OS_LOG_TYPE_INFO, "Found class session %{public}@", (uint8_t *)&v12, 0xCu);
    }

    -[CRKClassSessionBrowser delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "browser:didFindClassSession:transport:", self, v6, v7);

  }
}

- (void)delegateLostConnectionToClassSession:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKClassSessionBrowser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKClassSessionBrowser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "browser:lostConnectionToClassSession:", self, v7);

  }
}

- (void)delegateDidRemoveClassSession:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRKClassSessionBrowser delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    _CRKLogGeneral_21();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "Removed class session %{public}@", (uint8_t *)&v9, 0xCu);
    }

    -[CRKClassSessionBrowser delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "browser:didRemoveClassSession:", self, v4);

  }
}

- (void)delegateInRangeClassSessionsDidChange
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[CRKClassSessionBrowser delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CRKClassSessionBrowser delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBrowser inRangeClassSessionIdentifiers](self, "inRangeClassSessionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "browser:didUpdateInRangeClassSessions:", self, v5);

  }
}

- (id)delegateNeedsClientIdentityForInvitationSessionWithEndpoint:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CRKClassSessionBrowser invitationSessionDelegate](self, "invitationSessionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRKClassSessionBrowser invitationSessionDelegate](self, "invitationSessionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "browser:needsClientIdentityForEndpoint:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)delegateDidFindInvitationSession:(id)a3 transport:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CRKClassSessionBrowser invitationSessionDelegate](self, "invitationSessionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    _CRKLogGeneral_21();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "endpoint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_218C99000, v10, OS_LOG_TYPE_INFO, "Found invitation session %{public}@", (uint8_t *)&v15, 0xCu);

    }
    -[CRKClassSessionBrowser invitationSessionDelegate](self, "invitationSessionDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endpoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "browser:didFindInvitationSessionWithEndpoint:transport:", self, v14, v7);

  }
}

- (void)delegateLostConnectionToInvitationSession:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CRKClassSessionBrowser invitationSessionDelegate](self, "invitationSessionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKClassSessionBrowser invitationSessionDelegate](self, "invitationSessionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "browser:lostConnectionToInvitationSessionWithEndpoint:", self, v7);

  }
}

- (void)delegateDidRemoveInvitationSession:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CRKClassSessionBrowser invitationSessionDelegate](self, "invitationSessionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKClassSessionBrowser invitationSessionDelegate](self, "invitationSessionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "browser:didRemoveInvitationSessionWithEndpoint:", self, v7);

  }
}

- (CRKClassSessionBrowserDelegate)delegate
{
  return (CRKClassSessionBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRKInvitationSessionBrowserDelegate)invitationSessionDelegate
{
  return (CRKInvitationSessionBrowserDelegate *)objc_loadWeakRetained((id *)&self->_invitationSessionDelegate);
}

- (void)setInvitationSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_invitationSessionDelegate, a3);
}

- (NSSet)organizationUUIDs
{
  return self->_organizationUUIDs;
}

- (NSSet)enrolledControlGroupIdentifiers
{
  return self->_enrolledControlGroupIdentifiers;
}

- (BOOL)allowInvitationSessions
{
  return self->_allowInvitationSessions;
}

- (BOOL)allowUnenrolledSessions
{
  return self->_allowUnenrolledSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrolledControlGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_organizationUUIDs, 0);
  objc_destroyWeak((id *)&self->_invitationSessionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint, 0);
  objc_storeStrong((id *)&self->mConnectWithoutBeaconAssertionCountBySessionIdentifier, 0);
  objc_storeStrong((id *)&self->mNetworkReachability, 0);
  objc_storeStrong((id *)&self->mBeaconBrowser, 0);
  objc_storeStrong((id *)&self->mInvitationSessionsByEndpoint, 0);
  objc_storeStrong((id *)&self->mInRangeClassSessions, 0);
  objc_storeStrong((id *)&self->mClassSessionsByIdentifier, 0);
}

@end
