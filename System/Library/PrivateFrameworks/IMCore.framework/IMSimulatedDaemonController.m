@implementation IMSimulatedDaemonController

+ (id)sharedInstance
{
  if (qword_1ECF12530 != -1)
    dispatch_once(&qword_1ECF12530, &unk_1E471D7F8);
  return (id)qword_1ECF12580;
}

+ (void)beginSimulatingDaemon
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A20AFE0C;
  block[3] = &unk_1E471F058;
  block[4] = a1;
  if (qword_1EE65F550 != -1)
    dispatch_once(&qword_1EE65F550, block);
}

+ (id)dictionaryForChat:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("accountdID"));

  objc_msgSend(v4, "chatIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("chatIdentifier"));

  objc_msgSend(v4, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("guid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "chatStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("style"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v4, "joinState");

  objc_msgSend(v11, "numberWithInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("chatIdentifier"));

  return v5;
}

- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[IMSimulatedDaemonController listeners](self, "listeners", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "simulatedDaemon:willSendBalloonPayload:attachments:messageGUID:bundleID:", self, v10, v11, v12, v13);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5
{
  return 1;
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3
{
  return 1;
}

- (BOOL)isConnected
{
  return 1;
}

- (unsigned)capabilitiesForListenerID:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMSimulatedDaemonController;
  return *MEMORY[0x1E0D36D28] | -[IMDaemonController capabilitiesForListenerID:](&v4, sel_capabilitiesForListenerID_, a3) | *MEMORY[0x1E0D36CD0];
}

- (NSArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
