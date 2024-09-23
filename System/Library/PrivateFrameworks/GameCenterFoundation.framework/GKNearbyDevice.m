@implementation GKNearbyDevice

+ (id)nearbyDeviceWithID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setDeviceID:", v4);

  objc_msgSend(v5, "setState:", 0);
  objc_msgSend(v5, "setUsePeerDiscovery:", 0);
  return v5;
}

- (void)sendDictionary:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void (**v22)(id, id);
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  void (**v35)(id, id);
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "GKMatchMaker+Nearby: sendDictionary:", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("UUID"));

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "internal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playerID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("playerID"));
  -[GKNearbyDevice deviceID](self, "deviceID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, &v36);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v36;
  if (!v17)
  {
    if (!os_log_GKGeneral)
      v29 = GKOSLoggers();
    v30 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
    {
      -[GKNearbyDevice sendDictionary:withCompletionHandler:].cold.1(v30, (uint64_t)v6, (uint64_t)v18);
      if (!v7)
        goto LABEL_22;
    }
    else if (!v7)
    {
      goto LABEL_22;
    }
    v7[2](v7, v18);
    goto LABEL_22;
  }
  if (!os_log_GKGeneral)
    v19 = GKOSLoggers();
  v20 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v20, OS_LOG_TYPE_INFO, "GKMatchMaker+Nearby: sendDictionary: Sending Dictionary to device", buf, 2u);
  }
  v31 = v18;
  if (!os_log_GKGeneral)
    v21 = GKOSLoggers();
  v22 = v7;
  v23 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    +[GKMatchmaker descriptionForNearbyDictionary:](GKMatchmaker, "descriptionForNearbyDictionary:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v25;
    v39 = 2112;
    v40 = v16;
    _os_log_impl(&dword_1BCDE3000, v24, OS_LOG_TYPE_INFO, "Sending dictionary %@ to deviceID: %@", buf, 0x16u);

  }
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "multiplayerService");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[GKNearbyDevice usePeerDiscovery](self, "usePeerDiscovery");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __55__GKNearbyDevice_sendDictionary_withCompletionHandler___block_invoke;
  v32[3] = &unk_1E75B2050;
  v33 = v6;
  v34 = v16;
  v35 = v22;
  objc_msgSend(v27, "sendDataToParticipant:deviceID:data:usePeerDiscovery:handler:", 0, v34, v17, v28, v32);

  v7 = v22;
  v18 = v31;
LABEL_22:

}

void __55__GKNearbyDevice_sendDictionary_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[16];

  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "GKMatchMaker+Nearby: sendDictionary: sendDataToParticipant", v9, 2u);
  }
  if (v3)
  {
    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    v7 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
      __55__GKNearbyDevice_sendDictionary_withCompletionHandler___block_invoke_cold_1(a1, v7, (uint64_t)v3);
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (NSData)devicePushToken
{
  return self->_devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
  objc_storeStrong((id *)&self->_devicePushToken, a3);
}

- (BOOL)usePeerDiscovery
{
  return self->_usePeerDiscovery;
}

- (void)setUsePeerDiscovery:(BOOL)a3
{
  self->_usePeerDiscovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (void)sendDictionary:(uint64_t)a3 withCompletionHandler:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  +[GKMatchmaker descriptionForNearbyDictionary:](GKMatchmaker, "descriptionForNearbyDictionary:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = a3;
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v5, v7, "GKMatchMaker+Nearby:sendDictionary: Error creating query data for dictionary: %@, error = %@", (uint8_t *)&v8);

}

void __55__GKNearbyDevice_sendDictionary_withCompletionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  +[GKMatchmaker descriptionForNearbyDictionary:](GKMatchmaker, "descriptionForNearbyDictionary:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = 138412802;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  v13 = 2112;
  v14 = a3;
  _os_log_error_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_ERROR, "Error sending dictionary %@ to deviceID: %@, error = %@", (uint8_t *)&v9, 0x20u);

}

@end
