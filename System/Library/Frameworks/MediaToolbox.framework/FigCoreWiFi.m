@implementation FigCoreWiFi

- (id)copyAllWiFiStats
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
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
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  if (!self->wifiStats)
    return 0;
  MEMORY[0x19402EA0C](self->_wifiStatsLock, a2);
  v3 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->wifiStats, "objectForKeyedSubscript:", *MEMORY[0x1E0D1BA00]), "copy");
  MEMORY[0x19402EA24](self->_wifiStatsLock);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v4)
    goto LABEL_8;
  MEMORY[0x19402EA0C](self->_wifiStatsLock);
  if (!self->ssid)
  {
    MEMORY[0x19402EA24](self->_wifiStatsLock);
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->ssid, 4, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25,
                 v26,
                 v27,
                 v28,
                 v29,
                 v30,
                 v31,
                 v32,
                 v33,
                 v34,
                 v35,
                 v36,
                 v37,
                 v38,
                 v39,
                 (_QWORD)v40);
  MEMORY[0x19402EA24](self->_wifiStatsLock);
  if (v5)
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(v3, "linkQualityMetricData"), "copy");
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "getBytes:length:", &v11, 5536);
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", SWORD1(v11)), CFSTR("snr"));
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "RSSI")), CFSTR("rssi"));
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "CCA")), CFSTR("cca"));
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "noise")), CFSTR("noise"));
      objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("ssid"));
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "rxRate");
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(v8, "numberWithDouble:"), CFSTR("rx_rate"));
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "txRate");
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(v9, "numberWithDouble:"), CFSTR("tx_rate"));
    }
    goto LABEL_10;
  }
LABEL_9:
  v7 = 0;
LABEL_10:

  return v4;
}

- (FigCoreWiFi)initWithError:(id *)a3
{
  FigCoreWiFi *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v11[5];
  objc_super v12;
  void *v13;

  v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)FigCoreWiFi;
  v4 = -[FigCoreWiFi init](&v12, sel_init);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v5;
  if (v4)
  {
    if (v5
      && (v7 = FigReentrantMutexCreate(), (v4->_wifiStatsLock = (OpaqueFigReentrantMutex *)v7) != 0)
      && (v8 = objc_alloc_init(MEMORY[0x1E0D1BA50]), (v4->cwfInterface = (CWFInterface *)v8) != 0))
    {
      objc_msgSend(v8, "activate");
      v9 = -[CWFInterface cachedLinkQualityMetric](v4->cwfInterface, "cachedLinkQualityMetric");
      objc_msgSend(v6, "setValue:forKey:", v9, *MEMORY[0x1E0D1BA00]);
      MEMORY[0x19402EA0C](v4->_wifiStatsLock);
      v4->wifiStats = (NSDictionary *)objc_msgSend(v6, "copy");
      v4->ssid = (NSData *)objc_msgSend((id)-[CWFInterface SSID](v4->cwfInterface, "SSID"), "copy");
      MEMORY[0x19402EA24](v4->_wifiStatsLock);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __29__FigCoreWiFi_initWithError___block_invoke;
      v11[3] = &unk_1E2FA72E0;
      v11[4] = v4;
      -[CWFInterface setEventHandler:](v4->cwfInterface, "setEventHandler:", v11);
      -[CWFInterface startMonitoringEventType:error:](v4->cwfInterface, "startMonitoringEventType:error:", 7, &v13);
      if (!v13)
        -[CWFInterface startMonitoringEventType:error:](v4->cwfInterface, "startMonitoringEventType:error:", 2, &v13);
    }
    else
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreMediaErrorDomain"), -19250, 0);
    }
  }

  *a3 = v13;
  return v4;
}

uint64_t __29__FigCoreWiFi_initWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  if (objc_msgSend(a2, "type") == 7)
  {
    MEMORY[0x19402EA0C](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend((id)objc_msgSend(a2, "info"), "copy");
    MEMORY[0x19402EA24](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
  result = objc_msgSend(a2, "type");
  if (result == 2)
  {
    MEMORY[0x19402EA0C](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "SSID"), "copy");
    JUMPOUT(0x19402EA24);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[CWFInterface stopMonitoringEventType:](self->cwfInterface, "stopMonitoringEventType:", 2);
  -[CWFInterface stopMonitoringEventType:](self->cwfInterface, "stopMonitoringEventType:", 7);
  -[CWFInterface invalidate](self->cwfInterface, "invalidate");

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigCoreWiFi;
  -[FigCoreWiFi dealloc](&v3, sel_dealloc);
}

@end
