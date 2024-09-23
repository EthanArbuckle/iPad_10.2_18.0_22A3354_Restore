@implementation AFCoreAnalyticsCrossDeviceEvent

- (AFCoreAnalyticsCrossDeviceEvent)init
{

  return 0;
}

- (AFCoreAnalyticsCrossDeviceEvent)initWithNearbyDevicesLoggingID:(id)a3
{
  id v4;
  AFCoreAnalyticsCrossDeviceEvent *v5;
  uint64_t v6;
  NSString *nearbyDevicesLoggingID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFCoreAnalyticsCrossDeviceEvent;
  v5 = -[AFCoreAnalyticsCrossDeviceEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    nearbyDevicesLoggingID = v5->_nearbyDevicesLoggingID;
    v5->_nearbyDevicesLoggingID = (NSString *)v6;

  }
  return v5;
}

- (void)addNearbyDeviceContexts:(id)a3 proximityInfo:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  AFCoreAnalyticsCrossDeviceEvent *v13;
  id v14;

  v10 = a4;
  if (v10)
  {
    v6 = (objc_class *)MEMORY[0x1E0C99E08];
    v7 = a3;
    v8 = objc_alloc_init(v6);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__AFCoreAnalyticsCrossDeviceEvent_addNearbyDeviceContexts_proximityInfo___block_invoke;
    v11[3] = &unk_1E3A30D38;
    v12 = v10;
    v13 = self;
    v14 = v8;
    v9 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

    -[AFCoreAnalyticsCrossDeviceEvent setNearbyDevicesPayloads:](self, "setNearbyDevicesPayloads:", v9);
  }

}

- (void)_setTargetedDeviceContextIdentifier:(id)a3 withAction:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__AFCoreAnalyticsCrossDeviceEvent__setTargetedDeviceContextIdentifier_withAction_payload___block_invoke;
  v12[3] = &unk_1E3A30D60;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  objc_msgSend(a5, "mutatedCopyWithMutator:", v12);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_nearbyDevicesPayloads, "setObject:forKey:", v11, v10);

}

- (void)addCoreAnalyticsDeviceTargetedWithContextIdentifier:(id)a3 commandResultDescription:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *nearbyDevicesPayloads;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  AFCoreAnalyticsCrossDeviceEvent *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  nearbyDevicesPayloads = self->_nearbyDevicesPayloads;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __112__AFCoreAnalyticsCrossDeviceEvent_addCoreAnalyticsDeviceTargetedWithContextIdentifier_commandResultDescription___block_invoke;
  v11[3] = &unk_1E3A30D88;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nearbyDevicesPayloads, "enumerateKeysAndObjectsUsingBlock:", v11);

}

- (id)copyWithZone:(_NSZone *)a3
{
  AFCoreAnalyticsCrossDeviceEvent *v4;

  v4 = -[AFCoreAnalyticsCrossDeviceEvent initWithNearbyDevicesLoggingID:](+[AFCoreAnalyticsCrossDeviceEvent allocWithZone:](AFCoreAnalyticsCrossDeviceEvent, "allocWithZone:", a3), "initWithNearbyDevicesLoggingID:", self->_nearbyDevicesLoggingID);
  -[AFCoreAnalyticsCrossDeviceEvent setNearbyDevicesPayloads:](v4, "setNearbyDevicesPayloads:", self->_nearbyDevicesPayloads);
  return v4;
}

- (id)description
{
  return -[AFCoreAnalyticsCrossDeviceEvent _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16.receiver = self;
  v16.super_class = (Class)AFCoreAnalyticsCrossDeviceEvent;
  -[AFCoreAnalyticsCrossDeviceEvent description](&v16, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_nearbyDevicesLoggingID, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("nearbyDevicesLoggingID = %@"), v7);
  v17[0] = v8;
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSMutableDictionary description](self->_nearbyDevicesPayloads, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("nearbyDevicesPayloads = %@"), v10);
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {%@}"), v5, v13);

  return v14;
}

- (NSString)nearbyDevicesLoggingID
{
  return self->_nearbyDevicesLoggingID;
}

- (NSMutableDictionary)nearbyDevicesPayloads
{
  return self->_nearbyDevicesPayloads;
}

- (void)setNearbyDevicesPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyDevicesPayloads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDevicesPayloads, 0);
  objc_storeStrong((id *)&self->_nearbyDevicesLoggingID, 0);
}

void __112__AFCoreAnalyticsCrossDeviceEvent_addCoreAnalyticsDeviceTargetedWithContextIdentifier_commandResultDescription___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v4;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a2;
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(v8, "proximity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("primary");
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("primary")) & 1) != 0)
    {

      goto LABEL_7;
    }
    v10 = *(void **)(a1 + 32);
  }
  objc_msgSend(v10, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v14);

  if (!v9)
  {

    if ((v13 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v13)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "_setTargetedDeviceContextIdentifier:withAction:payload:", v14, *(_QWORD *)(a1 + 48), v8);
    *a4 = 1;
  }
LABEL_8:

}

uint64_t __90__AFCoreAnalyticsCrossDeviceEvent__setTargetedDeviceContextIdentifier_withAction_payload___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTargetedResult:", *(_QWORD *)(a1 + 32));
}

void __73__AFCoreAnalyticsCrossDeviceEvent_addNearbyDeviceContexts_proximityInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "deviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "integerValue"),
        v6,
        v5,
        !v7))
  {
    objc_msgSend(v3, "deviceInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "idsDeviceUniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "integerValue");

    }
    else
    {
      v7 = 0;
    }

  }
  AFCoreAnalyticsPayloadCreateForDeviceContext(v3, v7, *(void **)(*(_QWORD *)(a1 + 40) + 8));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v16 = v12;
    objc_msgSend(v3, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315650;
    v20 = "-[AFCoreAnalyticsCrossDeviceEvent addNearbyDeviceContexts:proximityInfo:]_block_invoke";
    v21 = 2112;
    v22 = v18;
    v23 = 2112;
    v24 = v11;
    _os_log_debug_impl(&dword_19AF50000, v16, OS_LOG_TYPE_DEBUG, "%s payload for %@: %@", (uint8_t *)&v19, 0x20u);

  }
  v13 = *(void **)(a1 + 48);
  objc_msgSend(v3, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v11, v15);

}

@end
