@implementation NTKSimulatedLocationManager

- (NTKSimulatedLocationManager)init
{
  NTKSimulatedLocationManager *v2;
  NSObject *v3;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKSimulatedLocationManager;
  v2 = -[NTKSimulatedLocationManager init](&v6, sel_init);
  if (v2)
  {
    _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKSimulatedLocationManager initialized.", v5, 2u);
    }

  }
  return v2;
}

- (id)startLocationUpdatesWithIdentifier:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__NTKSimulatedLocationManager_startLocationUpdatesWithIdentifier_handler___block_invoke;
  v8[3] = &unk_1E6BCE3C8;
  v8[4] = self;
  v9 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  return &stru_1E6BDC918;
}

void __74__NTKSimulatedLocationManager_startLocationUpdatesWithIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentLocation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "anyLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, _QWORD))(v2 + 16))(v2, v4, v3, 0);

}

- (id)startLocationUpdatesWithIdentifier:(id)a3 wantsGroundElevation:(BOOL)a4 handler:(id)a5
{
  return -[NTKSimulatedLocationManager startLocationUpdatesWithIdentifier:handler:](self, "startLocationUpdatesWithIdentifier:handler:", a3, a5);
}

- (id)companionLocation
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  +[NTKLocationManager fallbackLocation](NTKLocationManager, "fallbackLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v2, "coordinate");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v2, "altitude");
  v9 = v8;
  objc_msgSend(v2, "horizontalAccuracy");
  v11 = v10;
  objc_msgSend(v2, "verticalAccuracy");
  v13 = v12;
  +[CLKDate unmodifiedDate](NTKDate, "unmodifiedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v3, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v14, v5, v7, v9, v11, v13);

  return v15;
}

@end
