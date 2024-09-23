@implementation NTKWidgetComplicationMigrationDefines

+ (id)migrateComplication:(id)a3 forFamily:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NTKWidgetComplicationMigrationKey *v10;
  uint64_t v11;
  void *v12;
  NTKWidgetComplicationMigrationKey *v13;
  void *v14;
  void *v15;
  void *v16;
  NTKWidgetComplicationMigrationKey *v17;
  void *v18;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "complication");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  objc_msgSend(a1, "_complicationTypeToWidgetMigrations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "migrationMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [NTKWidgetComplicationMigrationKey alloc];
  v11 = objc_msgSend(v6, "complicationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:](v10, "initWithComplicationType:family:", v11, v12);
  objc_msgSend(v9, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_5;
  objc_msgSend(a1, "_complicationTypeToWidgetMigrations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "migrationMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", objc_msgSend(v6, "complicationType"), 0);
  objc_msgSend(v16, "objectForKey:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_5:
    +[NTKWidgetComplication complicationWithDescriptor:](NTKWidgetComplication, "complicationWithDescriptor:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)hasMigratedComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a4;
  v7 = objc_msgSend(v6, "supportsWidgetMigration");
  objc_msgSend(a1, "_complicationTypeToWidgetMigrations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(v8, "migrationMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__NTKWidgetComplicationMigrationDefines_hasMigratedComplicationType_forDevice___block_invoke;
  v14[3] = &unk_1E6BD2508;
  v19 = a3;
  v17 = &v24;
  v11 = v8;
  v15 = v11;
  v18 = &v20;
  v12 = v6;
  v16 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  if (*((_BYTE *)v25 + 24))
  {
    if (!*((_BYTE *)v21 + 24))
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v7;
}

void __79__NTKWidgetComplicationMigrationDefines_hasMigratedComplicationType_forDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "complicationType") == *(_QWORD *)(a1 + 64))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 32), "deviceCapabilityMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "supportsCapability:", v7);
  }

}

+ (BOOL)hasMigratedComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a5;
  v9 = objc_msgSend(v8, "supportsWidgetMigration");
  objc_msgSend(a1, "_complicationTypeToWidgetMigrations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend(v10, "migrationMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__NTKWidgetComplicationMigrationDefines_hasMigratedComplicationType_family_forDevice___block_invoke;
  v16[3] = &unk_1E6BD2530;
  v21 = a3;
  v22 = a4;
  v19 = &v27;
  v13 = v10;
  v17 = v13;
  v20 = &v23;
  v14 = v8;
  v18 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

  if (*((_BYTE *)v28 + 24))
  {
    if (!*((_BYTE *)v24 + 24))
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v9;
}

void __86__NTKWidgetComplicationMigrationDefines_hasMigratedComplicationType_family_forDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (objc_msgSend(v13, "complicationType") == *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(v13, "family");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6
      || (v7 = (void *)v6,
          objc_msgSend(v13, "family"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "integerValue"),
          v10 = *(_QWORD *)(a1 + 72),
          v8,
          v7,
          v9 == v10))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
      objc_msgSend(*(id *)(a1 + 32), "deviceCapabilityMap");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "supportsCapability:", v12);
    }
  }

}

+ (id)_complicationTypeToWidgetMigrations
{
  NTKWidgetComplicationMigrationInfo *v2;

  if (_complicationTypeToWidgetMigrations_onceToken != -1)
    dispatch_once(&_complicationTypeToWidgetMigrations_onceToken, &__block_literal_global_54);
  v2 = objc_alloc_init(NTKWidgetComplicationMigrationInfo);
  -[NTKWidgetComplicationMigrationInfo setMigrationMap:](v2, "setMigrationMap:", _complicationTypeToWidgetMigrations_typeToDescriptor);
  -[NTKWidgetComplicationMigrationInfo setDeviceCapabilityMap:](v2, "setDeviceCapabilityMap:", _complicationTypeToWidgetMigrations_typeToCapability);
  return v2;
}

void __76__NTKWidgetComplicationMigrationDefines__complicationTypeToWidgetMigrations__block_invoke()
{
  void *v0;
  NTKWidgetComplicationMigrationKey *v1;
  void *v2;
  NTKWidgetComplicationMigrationKey *v3;
  void *v4;
  NTKWidgetComplicationMigrationKey *v5;
  void *v6;
  NTKWidgetComplicationMigrationKey *v7;
  void *v8;
  NTKWidgetComplicationMigrationKey *v9;
  void *v10;
  NTKWidgetComplicationMigrationKey *v11;
  void *v12;
  NTKWidgetComplicationMigrationKey *v13;
  void *v14;
  NTKWidgetComplicationMigrationKey *v15;
  void *v16;
  NTKWidgetComplicationMigrationKey *v17;
  void *v18;
  NTKWidgetComplicationMigrationKey *v19;
  void *v20;
  NTKWidgetComplicationMigrationKey *v21;
  void *v22;
  NTKWidgetComplicationMigrationKey *v23;
  void *v24;
  NTKWidgetComplicationMigrationKey *v25;
  void *v26;
  NTKWidgetComplicationMigrationKey *v27;
  void *v28;
  NTKWidgetComplicationMigrationKey *v29;
  void *v30;
  NTKWidgetComplicationMigrationKey *v31;
  void *v32;
  NTKWidgetComplicationMigrationKey *v33;
  void *v34;
  NTKWidgetComplicationMigrationKey *v35;
  void *v36;
  NTKWidgetComplicationMigrationKey *v37;
  void *v38;
  NTKWidgetComplicationMigrationKey *v39;
  void *v40;
  NTKWidgetComplicationMigrationKey *v41;
  void *v42;
  NTKWidgetComplicationMigrationKey *v43;
  void *v44;
  NTKWidgetComplicationMigrationKey *v45;
  void *v46;
  NTKWidgetComplicationMigrationKey *v47;
  void *v48;
  NTKWidgetComplicationMigrationKey *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;

  v55 = (id)objc_opt_new();
  v0 = (void *)objc_opt_new();
  v1 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 28, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v1, CFSTR("com.apple.NanoHome.NanoHomeWidgets"), CFSTR("com.apple.NanoHome"), CFSTR("NanoHomeWidget"), v2);

  v3 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 27, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v3, CFSTR("com.apple.NanoMail.NanoMailComplications"), CFSTR("com.apple.NanoMail"), CFSTR("NanoMailAppLauncher"), v4);

  v5 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 33, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v5, CFSTR("com.apple.tincan.TinCan-Widget"), CFSTR("com.apple.tincan"), CFSTR("TinCan_Widget"), v6);

  v7 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 46, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v7, CFSTR("com.apple.NanoHeartRhythm.NanoElectrocardiogramWidgetExtension"), CFSTR("com.apple.NanoHeartRhythm"), CFSTR("NanoElectrocardiogramWidgetExtension"), v8);

  v9 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 21, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v9, CFSTR("com.apple.NanoRemote.NanoRemoteWidget"), CFSTR("com.apple.NanoRemote"), CFSTR("NanoRemoteWidget"), v10);

  v11 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 24, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v11, CFSTR("com.apple.NanoPhone.Complication"), CFSTR("com.apple.NanoPhone"), CFSTR("Complication"), v12);

  if (_os_feature_enabled_impl())
  {
    v13 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 20, 0);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
    _AddWidgetMigration(v55, v0, v13, CFSTR("com.apple.NanoReminders.WidgetExtension"), CFSTR("com.apple.NanoReminders"), CFSTR("com.apple.reminders.widget.today"), v14);

  }
  v15 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 26, &unk_1E6C9E740);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v15, CFSTR("com.apple.nanonews.widget"), CFSTR("com.apple.nanonews"), CFSTR("NewsButtonWidget"), v16);

  v17 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 26, &unk_1E6C9E758);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v17, CFSTR("com.apple.nanonews.widget"), CFSTR("com.apple.nanonews"), CFSTR("NewsButtonWidget"), v18);

  v19 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 26, &unk_1E6C9E770);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v19, CFSTR("com.apple.nanonews.widget"), CFSTR("com.apple.nanonews"), CFSTR("NewsButtonWidget"), v20);

  v21 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 26, &unk_1E6C9E788);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v21, CFSTR("com.apple.nanonews.widget"), CFSTR("com.apple.nanonews"), CFSTR("NewsButtonWidget"), v22);

  v23 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 26, &unk_1E6C9E7A0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v23, CFSTR("com.apple.nanonews.widget"), CFSTR("com.apple.nanonews"), CFSTR("NewsArticleWidget"), v24);

  v25 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 26, &unk_1E6C9E7B8);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v25, CFSTR("com.apple.nanonews.widget"), CFSTR("com.apple.nanonews"), CFSTR("NewsArticleWidget"), v26);

  v27 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 26, &unk_1E6C9E7D0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v27, CFSTR("com.apple.nanonews.widget"), CFSTR("com.apple.nanonews"), CFSTR("NewsArticleWidget"), v28);

  v29 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 15, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v29, CFSTR("com.apple.HeartRate.HeartRateWidgetExtension"), CFSTR("com.apple.HeartRate"), CFSTR("HeartRateWidgetExtension"), v30);

  v31 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 25, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v31, CFSTR("com.apple.NanoMaps.NanoMapsWidgetKitComplications"), CFSTR("com.apple.NanoMaps"), CFSTR("MapsLauncherComplication"), v32);

  v33 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 2, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9107296E-53BE-49DA-88A8-8C9A1BF81CFD"));
  _AddWidgetMigration(v55, v0, v33, CFSTR("com.apple.NanoAlarm.NanoAlarmWidgetExtension"), CFSTR("com.apple.NanoAlarm"), CFSTR("NanoAlarmComplication"), v34);

  v35 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 34, &unk_1E6C9E7A0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"));
  _AddWidgetMigration(v55, v0, v35, CFSTR("com.apple.NanoNowPlaying.widgets"), CFSTR("com.apple.NanoNowPlaying"), CFSTR("com.apple.NanoNowPlaying.widgets.media-suggestions"), v36);

  v37 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 34, &unk_1E6C9E7E8);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"));
  _AddWidgetMigration(v55, v0, v37, CFSTR("com.apple.NanoNowPlaying.widgets"), CFSTR("com.apple.NanoNowPlaying"), CFSTR("com.apple.NanoNowPlaying.widgets.media-suggestions"), v38);

  v39 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 17, &unk_1E6C9E7D0);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"));
  _AddWidgetMigration(v55, v0, v39, CFSTR("com.apple.NanoMusic.widgets"), CFSTR("com.apple.NanoMusic"), CFSTR("com.apple.NanoMusic.widgets.recently-played"), v40);

  v41 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 17, &unk_1E6C9E7A0);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"));
  _AddWidgetMigration(v55, v0, v41, CFSTR("com.apple.NanoMusic.widgets"), CFSTR("com.apple.NanoMusic"), CFSTR("com.apple.NanoMusic.widgets.recently-played"), v42);

  v43 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 17, &unk_1E6C9E7B8);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"));
  _AddWidgetMigration(v55, v0, v43, CFSTR("com.apple.NanoMusic.widgets"), CFSTR("com.apple.NanoMusic"), CFSTR("com.apple.NanoMusic.widgets.recently-played"), v44);

  v45 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 42, &unk_1E6C9E7D0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"));
  _AddWidgetMigration(v55, v0, v45, CFSTR("com.apple.podcasts.widget"), CFSTR("com.apple.podcasts"), CFSTR("com.apple.podcasts.widget.upnext"), v46);

  v47 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 42, &unk_1E6C9E7A0);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"));
  _AddWidgetMigration(v55, v0, v47, CFSTR("com.apple.podcasts.widget"), CFSTR("com.apple.podcasts"), CFSTR("com.apple.podcasts.widget.upnext"), v48);

  v49 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", 42, &unk_1E6C9E7B8);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"));
  _AddWidgetMigration(v55, v0, v49, CFSTR("com.apple.podcasts.widget"), CFSTR("com.apple.podcasts"), CFSTR("com.apple.podcasts.widget.upnext"), v50);

  v51 = objc_msgSend(v55, "copy");
  v52 = (void *)_complicationTypeToWidgetMigrations_typeToDescriptor;
  _complicationTypeToWidgetMigrations_typeToDescriptor = v51;

  v53 = objc_msgSend(v0, "copy");
  v54 = (void *)_complicationTypeToWidgetMigrations_typeToCapability;
  _complicationTypeToWidgetMigrations_typeToCapability = v53;

}

@end
