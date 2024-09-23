@implementation GKCompositeTransport

- (GKCompositeTransport)initWithClientDelegate:(id)a3 matchDataDelegate:(id)a4 reporter:(id)a5 transportContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GKCompositeTransport *v14;
  uint64_t v15;
  GKTransportClientDelegate *instrumentedClientDelegate;
  uint64_t v17;
  GKMultiplayerDaemonProxy *daemonProxy;
  GKViceroyTransport *v19;
  void *v20;
  uint64_t v21;
  GKTransportProtocol *viceroyTransport;
  GKFastSyncTransport *v23;
  void *v24;
  uint64_t v25;
  GKTransportProtocol *fastSyncTransport;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)GKCompositeTransport;
  v14 = -[GKCompositeTransport init](&v28, sel_init);
  if (v14)
  {
    objc_msgSend(v12, "instrumentClientDelegate:transportContext:", v10, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    instrumentedClientDelegate = v14->_instrumentedClientDelegate;
    v14->_instrumentedClientDelegate = (GKTransportClientDelegate *)v15;

    objc_msgSend(v13, "daemonProxy");
    v17 = objc_claimAutoreleasedReturnValue();
    daemonProxy = v14->_daemonProxy;
    v14->_daemonProxy = (GKMultiplayerDaemonProxy *)v17;

    v19 = [GKViceroyTransport alloc];
    -[GKCompositeTransport instrumentedClientDelegate](v14, "instrumentedClientDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[GKViceroyTransport initWithClientDelegate:matchDataDelegate:daemonProxy:](v19, "initWithClientDelegate:matchDataDelegate:daemonProxy:", v20, v11, v14->_daemonProxy);
    viceroyTransport = v14->_viceroyTransport;
    v14->_viceroyTransport = (GKTransportProtocol *)v21;

    v23 = [GKFastSyncTransport alloc];
    -[GKCompositeTransport instrumentedClientDelegate](v14, "instrumentedClientDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[GKFastSyncTransport initWithClientDelegate:reporter:daemonProxy:](v23, "initWithClientDelegate:reporter:daemonProxy:", v24, v12, v14->_daemonProxy);
    fastSyncTransport = v14->_fastSyncTransport;
    v14->_fastSyncTransport = (GKTransportProtocol *)v25;

    objc_storeStrong((id *)&v14->_reporter, a5);
  }

  return v14;
}

- (void)disconnectAllWithTransportContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[GKCompositeTransport reporter](self, "reporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onDisconnectWithTransportContext:", v6);

  if (objc_msgSend(v6, "validTransportSelected"))
  {
    -[GKCompositeTransport transportForContext:](self, "transportForContext:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject disconnectAllWithTransportContext:completionHandler:](v9, "disconnectAllWithTransportContext:completionHandler:", v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (!os_log_GKGeneral)
    v10 = GKOSLoggers();
  v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)MEMORY[0x1E0CB3978];
    v9 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "Undefined transport or no transport has been selected when disconnecting. Context: %@.\nCall stack: %@", (uint8_t *)&v14, 0x16u);

    goto LABEL_7;
  }
LABEL_8:

}

- (id)transportForContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "selectedTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "version");

  if (v6 == 1)
  {
    -[GKCompositeTransport viceroyTransport](self, "viceroyTransport");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    -[GKCompositeTransport fastSyncTransport](self, "fastSyncTransport");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_11;
  }
  if (!os_log_GKGeneral)
    v9 = GKOSLoggers();
  v10 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)MEMORY[0x1E0CB3978];
    v12 = v10;
    objc_msgSend(v11, "callStackSymbols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v13;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "Undefined transport used from call stack: %@", buf, 0xCu);

  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Something went wrong. We got an undefined transport version from: %@"), v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/Transport/GKCompositeTransport.m");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastPathComponent");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v15, "-[GKCompositeTransport transportForContext:]", objc_msgSend(v17, "UTF8String"), 82);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v18);
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)chooseBestHostingPlayerWithTransportContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[GKCompositeTransport transportForContext:](self, "transportForContext:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[GKCompositeTransport reporter](self, "reporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instrumentBestHostElectedHandler:transportContext:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "chooseBestHostingPlayerWithTransportContext:completionHandler:", v7, v9);
}

- (void)connectToPlayersWithTransportContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[GKCompositeTransport transportForContext:](self, "transportForContext:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[GKCompositeTransport reporter](self, "reporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instrumentErrorHandler:transportContext:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "connectToPlayersWithTransportContext:completionHandler:", v7, v9);
}

- (BOOL)sendScopedData:(id)a3 toPlayers:(id)a4 dataMode:(int64_t)a5 dataScope:(int64_t)a6 transportContext:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;

  v14 = a7;
  v15 = a4;
  v16 = a3;
  -[GKCompositeTransport transportForContext:](self, "transportForContext:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "sendScopedData:toPlayers:dataMode:dataScope:transportContext:error:", v16, v15, a5, a6, v14, a8);

  if (a8 && *a8)
  {
    -[GKCompositeTransport reporter](self, "reporter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "onTransportError:transportContext:", *a8, v14);

    -[GKCompositeTransport fileMultiplayerTTRWith:](self, "fileMultiplayerTTRWith:", *a8);
  }

  return v18;
}

- (BOOL)sendScopedDataToAll:(id)a3 dataMode:(int64_t)a4 dataScope:(int64_t)a5 transportContext:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;

  v12 = a6;
  v13 = a3;
  -[GKCompositeTransport transportForContext:](self, "transportForContext:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "sendScopedDataToAll:dataMode:dataScope:transportContext:error:", v13, a4, a5, v12, a7);

  if (a7 && *a7)
  {
    -[GKCompositeTransport reporter](self, "reporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "onTransportError:transportContext:", *a7, v12);

    -[GKCompositeTransport fileMultiplayerTTRWith:](self, "fileMultiplayerTTRWith:", *a7);
  }

  return v15;
}

- (id)voiceChatWithName:(id)a3 players:(id)a4 transportContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[GKCompositeTransport transportForContext:](self, "transportForContext:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "voiceChatWithName:players:transportContext:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSData)nearbyConnectionData
{
  void *v2;
  void *v3;

  -[GKCompositeTransport viceroyTransport](self, "viceroyTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nearbyConnectionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKCompositeTransport viceroyTransport](self, "viceroyTransport");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectToNearbyPlayer:withConnectionData:", v7, v6);

}

- (BOOL)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[GKCompositeTransport viceroyTransport](self, "viceroyTransport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "connectToGuestPlayer:withHostPlayer:", v7, v6);

  return v9;
}

- (id)enrichPeerDictionariesForPlayersConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKCompositeTransport viceroyTransport](self, "viceroyTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enrichPeerDictionariesForPlayersConnection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)localConnectionDataWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKCompositeTransport viceroyTransport](self, "viceroyTransport");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localConnectionDataWithCompletionHandler:", v4);

}

- (void)acceptRelayResponse:(id)a3 playerID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKCompositeTransport viceroyTransport](self, "viceroyTransport");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acceptRelayResponse:playerID:", v7, v6);

}

- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[GKCompositeTransport viceroyTransport](self, "viceroyTransport");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleRelayPushData:onlyIfPreemptive:", v6, v4);

}

- (void)preemptRelay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKCompositeTransport viceroyTransport](self, "viceroyTransport");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preemptRelay:", v4);

}

- (void)fileMultiplayerTTRWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if (!-[GKCompositeTransport hasPromptedTTR](self, "hasPromptedTTR"))
  {
    objc_initWeak(&location, self);
    -[GKCompositeTransport daemonProxy](self, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tap here to report an issue helpful for multiplayer instrumentation. Error: %@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__GKCompositeTransport_fileMultiplayerTTRWith___block_invoke;
    v7[3] = &unk_1E75B3670;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v5, "fileMultiplayerTTRWithCallBackIdentifier:descriptionAddition:handler:", 0, v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __47__GKCompositeTransport_fileMultiplayerTTRWith___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHasPromptedTTR:", 1);

}

- (GKMultiplayerActivityReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (GKTransportClientDelegate)instrumentedClientDelegate
{
  return self->_instrumentedClientDelegate;
}

- (void)setInstrumentedClientDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentedClientDelegate, a3);
}

- (GKTransportProtocol)viceroyTransport
{
  return self->_viceroyTransport;
}

- (void)setViceroyTransport:(id)a3
{
  objc_storeStrong((id *)&self->_viceroyTransport, a3);
}

- (GKTransportProtocol)fastSyncTransport
{
  return self->_fastSyncTransport;
}

- (void)setFastSyncTransport:(id)a3
{
  objc_storeStrong((id *)&self->_fastSyncTransport, a3);
}

- (GKMultiplayerDaemonProxy)daemonProxy
{
  return self->_daemonProxy;
}

- (void)setDaemonProxy:(id)a3
{
  objc_storeStrong((id *)&self->_daemonProxy, a3);
}

- (BOOL)hasPromptedTTR
{
  return self->_hasPromptedTTR;
}

- (void)setHasPromptedTTR:(BOOL)a3
{
  self->_hasPromptedTTR = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonProxy, 0);
  objc_storeStrong((id *)&self->_fastSyncTransport, 0);
  objc_storeStrong((id *)&self->_viceroyTransport, 0);
  objc_storeStrong((id *)&self->_instrumentedClientDelegate, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
}

@end
