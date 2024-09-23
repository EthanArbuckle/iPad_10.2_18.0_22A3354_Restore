@implementation WCSessionState

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 reachable;
  id v5;

  reachable = self->_reachable;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", reachable, CFSTR("reachable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_paired, CFSTR("paired"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_appInstalled, CFSTR("appInstalled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_complicationEnabled, CFSTR("complicationEnabled"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_remainingComplicationUserInfoTransfers, CFSTR("remainingComplicationUserInfoTransfers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_iOSDeviceNeedsFirstUnlock, CFSTR("iOSDeviceNeedsFirstUnlock"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairingID, CFSTR("pairingID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairedDevicesPairingIDs, CFSTR("pairedDevicesPairingIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appInstallationID, CFSTR("appInstallationID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_standalone, CFSTR("standalone"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_companionAppInstalled, CFSTR("companionAppInstalled"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInstallationID, 0);
  objc_storeStrong((id *)&self->_pairedDevicesPairingIDs, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
}

- (BOOL)isStandaloneApp
{
  return self->_standalone;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v16;
  void *v17;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WCSessionState isReachable](self, "isReachable"))
    v5 = "YES";
  else
    v5 = "NO";
  v16 = v5;
  if (-[WCSessionState isPaired](self, "isPaired"))
    v6 = "YES";
  else
    v6 = "NO";
  if (-[WCSessionState isAppInstalled](self, "isAppInstalled"))
    v7 = "YES";
  else
    v7 = "NO";
  if (-[WCSessionState isComplicationEnabled](self, "isComplicationEnabled"))
    v8 = "YES";
  else
    v8 = "NO";
  v9 = -[WCSessionState remainingComplicationUserInfoTransfers](self, "remainingComplicationUserInfoTransfers");
  -[WCSessionState pairingID](self, "pairingID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSessionState pairedDevicesPairingIDs](self, "pairedDevicesPairingIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WCCompactStringFromCollection(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSessionState appInstallationID](self, "appInstallationID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p, reachable: %s, paired: %s, appInstalled: %s, complicationEnabled: %s(%d), pairingID: %@, pairedDevicesPairingIDs: %@, appInstallationID: %@>"), v4, self, v16, v6, v7, v8, v9, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)remainingComplicationUserInfoTransfers
{
  return self->_remainingComplicationUserInfoTransfers;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (BOOL)isComplicationEnabled
{
  return self->_complicationEnabled;
}

- (BOOL)isAppInstalled
{
  return self->_appInstalled;
}

- (NSSet)pairedDevicesPairingIDs
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)appInstallationID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)watchDirectoryURL
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[WCSessionState pairingID](self, "pairingID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[WCSessionState appInstallationID](self, "appInstallationID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = (void *)MEMORY[0x24BDBCF48];
    NSHomeDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:isDirectory:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WCSessionState pairingID](self, "pairingID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WCWatchDirectoryLocationInContainer((uint64_t)v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WCSessionState appInstallationID](self, "appInstallationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return (NSURL *)v12;
}

- (NSString)pairingID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (WCSessionState)initWithReachable:(BOOL)a3 paired:(BOOL)a4 appInstalled:(BOOL)a5 complicationEnabled:(BOOL)a6 remainingComplicationUserInfoTransfers:(unint64_t)a7 activePairingID:(id)a8 pairedDevicesPairingIDs:(id)a9 appInstallationID:(id)a10
{
  uint64_t v11;

  LOWORD(v11) = 0;
  return -[WCSessionState initWithReachable:paired:appInstalled:complicationEnabled:remainingComplicationUserInfoTransfers:iOSDeviceNeedsFirstUnlock:pairingID:pairedDevicesPairingIDs:appInstallationID:standaloneApp:companionAppInstalled:](self, "initWithReachable:paired:appInstalled:complicationEnabled:remainingComplicationUserInfoTransfers:iOSDeviceNeedsFirstUnlock:pairingID:pairedDevicesPairingIDs:appInstallationID:standaloneApp:companionAppInstalled:", a3, a4, a5, a6, a7, 0, a8, a9, a10, v11);
}

- (WCSessionState)initWithReachable:(BOOL)a3 paired:(BOOL)a4 appInstalled:(BOOL)a5 complicationEnabled:(BOOL)a6 remainingComplicationUserInfoTransfers:(unint64_t)a7 iOSDeviceNeedsFirstUnlock:(BOOL)a8 pairingID:(id)a9 pairedDevicesPairingIDs:(id)a10 appInstallationID:(id)a11 standaloneApp:(BOOL)a12 companionAppInstalled:(BOOL)a13
{
  id v20;
  id v21;
  id v22;
  WCSessionState *v23;
  WCSessionState *v24;
  uint64_t v25;
  NSString *pairingID;
  uint64_t v27;
  NSSet *pairedDevicesPairingIDs;
  uint64_t v29;
  NSString *appInstallationID;
  objc_super v32;

  v20 = a9;
  v21 = a10;
  v22 = a11;
  v32.receiver = self;
  v32.super_class = (Class)WCSessionState;
  v23 = -[WCSessionState init](&v32, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_reachable = a3;
    v23->_paired = a4;
    v25 = objc_msgSend(v20, "copy");
    pairingID = v24->_pairingID;
    v24->_pairingID = (NSString *)v25;

    v27 = objc_msgSend(v21, "copy");
    pairedDevicesPairingIDs = v24->_pairedDevicesPairingIDs;
    v24->_pairedDevicesPairingIDs = (NSSet *)v27;

    v29 = objc_msgSend(v22, "copy");
    appInstallationID = v24->_appInstallationID;
    v24->_appInstallationID = (NSString *)v29;

    v24->_appInstalled = a5;
    v24->_complicationEnabled = a6;
    v24->_remainingComplicationUserInfoTransfers = a7;
    v24->_iOSDeviceNeedsFirstUnlock = a8;
    v24->_standalone = a12;
    v24->_companionAppInstalled = a13;
  }

  return v24;
}

- (WCSessionState)initWithCoder:(id)a3
{
  id v4;
  WCSessionState *v5;
  void *v6;
  uint64_t v7;
  NSString *pairingID;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSSet *pairedDevicesPairingIDs;
  void *v15;
  uint64_t v16;
  NSString *appInstallationID;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WCSessionState;
  v5 = -[WCSessionState init](&v19, sel_init);
  if (v5)
  {
    v5->_reachable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reachable"));
    v5->_paired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("paired"));
    v5->_appInstalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appInstalled"));
    v5->_complicationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("complicationEnabled"));
    v5->_remainingComplicationUserInfoTransfers = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remainingComplicationUserInfoTransfers"));
    v5->_iOSDeviceNeedsFirstUnlock = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("iOSDeviceNeedsFirstUnlock"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    pairingID = v5->_pairingID;
    v5->_pairingID = (NSString *)v7;

    v9 = (void *)MEMORY[0x24BDBCF20];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("pairedDevicesPairingIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    pairedDevicesPairingIDs = v5->_pairedDevicesPairingIDs;
    v5->_pairedDevicesPairingIDs = (NSSet *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appInstallationID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    appInstallationID = v5->_appInstallationID;
    v5->_appInstallationID = (NSString *)v16;

    v5->_standalone = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("standalone"));
    v5->_companionAppInstalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("companionAppInstalled"));
  }

  return v5;
}

- (WCSessionState)initWithReachable:(BOOL)a3 iOSDeviceNeedsFirstUnlock:(BOOL)a4 activePairingID:(id)a5 standaloneApp:(BOOL)a6 companionAppInstalled:(BOOL)a7
{
  uint64_t v8;

  BYTE1(v8) = a7;
  LOBYTE(v8) = a6;
  return -[WCSessionState initWithReachable:paired:appInstalled:complicationEnabled:remainingComplicationUserInfoTransfers:iOSDeviceNeedsFirstUnlock:pairingID:pairedDevicesPairingIDs:appInstallationID:standaloneApp:companionAppInstalled:](self, "initWithReachable:paired:appInstalled:complicationEnabled:remainingComplicationUserInfoTransfers:iOSDeviceNeedsFirstUnlock:pairingID:pairedDevicesPairingIDs:appInstallationID:standaloneApp:companionAppInstalled:", a3, 1, 1, 0, 0, a4, a5, 0, 0, v8);
}

- (BOOL)isCompanionAppInstalled
{
  return self->_companionAppInstalled;
}

- (BOOL)iOSDeviceNeedsFirstUnlock
{
  return self->_iOSDeviceNeedsFirstUnlock;
}

@end
