@implementation NRMigrator

- (NSArray)migratableDevicesRequiringConsent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllDevicesWithArchivedDevicesMatching:", &__block_literal_global_482);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[NRMigrator migratableDevices](self, "migratableDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "minusSet:", v8);
  objc_msgSend(v5, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    v10 = v9;
  else
    v10 = 0;

  return (NSArray *)v10;
}

- (NSArray)migratableDevices
{
  void *v2;
  void *v3;
  id v4;

  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedDevicesMatching:", &__block_literal_global_485);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = 0;

  return (NSArray *)v4;
}

+ (id)sharedMigrator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__NRMigrator_sharedMigrator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE23848 != -1)
    dispatch_once(&qword_1ECE23848, block);
  return (id)qword_1ECE23840;
}

void __28__NRMigrator_sharedMigrator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECE23840;
  qword_1ECE23840 = (uint64_t)v1;

}

- (id)UDIDUUID
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)MGCopyAnswer();
    objc_msgSend(v1, "dataUsingEncoding:", 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "NRSHA256");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "subdataWithRange:", 0, 16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)devicesFromMigrationConsentRequestData:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint8_t *v8;
  id v9;
  const uint8_t *v10;
  void *v11;
  size_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NRMutableDeviceProperty *v30;
  NRMutableDeviceProperty *v31;
  NRMutableDeviceProperty *v32;
  NRPairedDeviceRegistry *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  NRPBMigrationDevices *v39;
  void *v40;
  NRPBCompressedData *v41;
  id v42;
  void *v43;
  id obj;
  _QWORD v45[5];
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[8];
  uint8_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[2];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  nr_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    nr_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_DEFAULT, "devicesFromMigrationConsentRequestData called", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v53 = buf;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__2;
  v56 = __Block_byref_object_dispose__2;
  v57 = 0;
  v7 = v42;
  if (v42)
  {
    v41 = -[NRPBCompressedData initWithData:]([NRPBCompressedData alloc], "initWithData:", v42);
    if (-[NRPBCompressedData compressed](v41, "compressed"))
    {
      v8 = (uint8_t *)malloc_type_malloc(0x2000uLL, 0x100004077774924uLL);
      if (!v8)
      {
LABEL_32:

        v7 = (void *)*((_QWORD *)v53 + 5);
        goto LABEL_33;
      }
      -[NRPBCompressedData possiblyCompressedData](v41, "possiblyCompressedData");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = (const uint8_t *)objc_msgSend(v9, "bytes");
      -[NRPBCompressedData possiblyCompressedData](v41, "possiblyCompressedData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = compression_decode_buffer(v8, 0x2000uLL, v10, objc_msgSend(v11, "length"), 0, COMPRESSION_ZLIB);

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, v12);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = 0;
      }
      free(v8);
    }
    else
    {
      -[NRPBCompressedData possiblyCompressedData](v41, "possiblyCompressedData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v40)
    {
      v39 = -[NRPBMigrationDevices initWithData:]([NRPBMigrationDevices alloc], "initWithData:", v40);
      if (!-[NRPBMigrationDevices hasPhoneUDIDHash](v39, "hasPhoneUDIDHash")
        || (-[NRPBMigrationDevices phoneUDIDHash](v39, "phoneUDIDHash"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NRMigrator UDIDUUID]((uint64_t)self),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v13, "isEqual:", v14),
            v14,
            v13,
            (v15 & 1) == 0))
      {
        v43 = (void *)objc_opt_new();
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        -[NRPBMigrationDevices devices](v39, "devices");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v49;
          obj = v16;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v49 != v18)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v20, "iD");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(v20, "name");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  objc_msgSend(v20, "advertisedName");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = v23 == 0;

                  if (!v24)
                  {
                    v58[0] = 0;
                    v58[1] = 0;
                    objc_msgSend(v20, "iD");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "getBytes:length:", v58, 16);

                    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v58);
                    objc_msgSend(v20, "name");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "advertisedName");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = (void *)objc_opt_new();
                    v30 = -[NRMutableDeviceProperty initWithValue:]([NRMutableDeviceProperty alloc], "initWithValue:", v26);
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("pairingID"));
                    v31 = -[NRMutableDeviceProperty initWithValue:]([NRMutableDeviceProperty alloc], "initWithValue:", v27);
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("name"));
                    v32 = -[NRMutableDeviceProperty initWithValue:]([NRMutableDeviceProperty alloc], "initWithValue:", v28);
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("advertisedName"));
                    objc_msgSend(v43, "setObject:forKeyedSubscript:", v29, v26);

                  }
                }
                else
                {

                }
              }
            }
            v16 = obj;
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
          }
          while (v17);
        }

        v33 = -[NRPairedDeviceRegistry initWithBoost:disconnected:]([NRPairedDeviceRegistry alloc], "initWithBoost:disconnected:", 0, 1);
        v34 = MEMORY[0x1E0C809B0];
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __53__NRMigrator_devicesFromMigrationConsentRequestData___block_invoke;
        v46[3] = &unk_1E4496990;
        v35 = v43;
        v47 = v35;
        -[NRRegistry deasyncGrabRegistryWithWriteBlock:](v33, "deasyncGrabRegistryWithWriteBlock:", v46);
        v45[0] = v34;
        v45[1] = 3221225472;
        v45[2] = __53__NRMigrator_devicesFromMigrationConsentRequestData___block_invoke_2;
        v45[3] = &unk_1E44962A0;
        v45[4] = buf;
        -[NRPairedDeviceRegistry threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:](v33, "threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:", v45);
        if (!objc_msgSend(*((id *)v53 + 5), "count"))
        {
          v36 = (void *)*((_QWORD *)v53 + 5);
          *((_QWORD *)v53 + 5) = 0;

        }
      }

    }
    goto LABEL_32;
  }
LABEL_33:
  v37 = v7;
  _Block_object_dispose(buf, 8);

  return v37;
}

id __53__NRMigrator_devicesFromMigrationConsentRequestData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  +[NRMutableDeviceCollection diffFrom:to:](NRMutableDeviceCollection, "diffFrom:to:", v2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __53__NRMigrator_devicesFromMigrationConsentRequestData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a4, "allValues");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)migrationConsentRequestData
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  __int128 v28;
  int v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  id v39;
  const uint8_t *v40;
  void *v41;
  size_t v42;
  uint8_t *v43;
  uint8_t *v44;
  size_t v45;
  size_t v46;
  NSObject *v47;
  _BOOL4 v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  _BOOL4 v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  unint64_t v62;
  void *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  id v70;
  NSObject *v71;
  _BOOL4 v72;
  NSObject *v73;
  uint64_t v75;
  __int128 v76;
  void *v77;
  void *v78;
  int v80;
  uint8_t v81[16];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[8];
  uint64_t v87;
  uint8_t buf[4];
  int v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  nr_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    nr_framework_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0BDB000, v4, OS_LOG_TYPE_DEFAULT, "migrationConsentRequestData called", buf, 2u);
    }

  }
  -[NRMigrator devicesExpectedToBeMigratableAfterRestore](self, "devicesExpectedToBeMigratableAfterRestore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self
    && (v84 = 0u,
        v85 = 0u,
        v82 = 0u,
        v83 = 0u,
        (v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v82, buf, 16)) != 0))
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v83 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        nr_framework_log();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

        if (v14)
        {
          nr_framework_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v86 = 0;
            _os_log_impl(&dword_1A0BDB000, v15, OS_LOG_TYPE_DEFAULT, "NRDevice found", v86, 2u);
          }

        }
        if (objc_msgSend(v12, "canMigrate"))
        {
          nr_framework_log();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

          if (v17)
          {
            nr_framework_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v86 = 0;
              _os_log_impl(&dword_1A0BDB000, v18, OS_LOG_TYPE_DEFAULT, "NRDevice supports migration", v86, 2u);
            }

          }
          v19 = (void *)objc_opt_new();
          *(_QWORD *)v86 = 0;
          v87 = 0;
          objc_msgSend(v12, "valueForProperty:", CFSTR("pairingID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "getUUIDBytes:", v86);

          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v86, 16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setID:", v21);

          objc_msgSend(v12, "valueForProperty:", CFSTR("name"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setName:", v22);

          objc_msgSend(v12, "valueForProperty:", CFSTR("advertisedName"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setAdvertisedName:", v23);

          if (!v9)
          {
            nr_framework_log();
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

            if (v25)
            {
              nr_framework_log();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v81 = 0;
                _os_log_impl(&dword_1A0BDB000, v26, OS_LOG_TYPE_DEFAULT, "protobuf created", v81, 2u);
              }

            }
            v9 = (void *)objc_opt_new();
          }
          objc_msgSend(v9, "addDevices:", v19);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
    }
    while (v8);
    if (v9)
    {
      -[NRMigrator UDIDUUID]((uint64_t)self);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPhoneUDIDHash:", v27);

    }
  }
  else
  {
    v9 = 0;
  }

  if (!v9)
  {
    v32 = 0;
    goto LABEL_73;
  }
  v29 = 0;
  v30 = 0;
  *(_QWORD *)&v28 = 67109120;
  v76 = v28;
  v77 = v9;
  do
  {
    v80 = v29;
    v31 = v9;
    if (self)
    {
      nr_framework_log();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
        nr_framework_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v31, "data");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "length");
          *(_DWORD *)buf = v76;
          v89 = v37;
          _os_log_impl(&dword_1A0BDB000, v35, OS_LOG_TYPE_DEFAULT, "%d bytes of protobuf created", buf, 8u);

        }
      }
      v38 = (void *)objc_opt_new();
      objc_msgSend(v31, "data");
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v40 = (const uint8_t *)objc_msgSend(v39, "bytes");

      objc_msgSend(v31, "data");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "length");

      v43 = (uint8_t *)malloc_type_malloc(v42, 0x100004077774924uLL);
      v44 = v43;
      if (v43 && (v45 = compression_encode_buffer(v43, v42, v40, v42, 0, COMPRESSION_ZLIB)) != 0)
      {
        v46 = v45;
        nr_framework_log();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

        if (v48)
        {
          nr_framework_log();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v76;
            v89 = v46;
            _os_log_impl(&dword_1A0BDB000, v49, OS_LOG_TYPE_DEFAULT, "data compressed! It is now only %d bytes", buf, 8u);
          }

        }
        objc_msgSend(v38, "setCompressed:", 1, v76);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v44, v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setPossiblyCompressedData:", v50);

      }
      else
      {
        nr_framework_log();
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);

        if (v52)
        {
          nr_framework_log();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0BDB000, v53, OS_LOG_TYPE_DEFAULT, "data did not compress. Bummer.", buf, 2u);
          }

        }
        objc_msgSend(v38, "setCompressed:", 0, v76);
        objc_msgSend(v31, "data");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setPossiblyCompressedData:", v54);

        if (!v44)
          goto LABEL_53;
      }
      free(v44);
LABEL_53:
      objc_msgSend(v38, "data");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_54;
    }
    v32 = 0;
LABEL_54:

    if ((unint64_t)objc_msgSend(v32, "length") < 0x201)
      break;
    v78 = v32;
    if (!self)
      goto LABEL_70;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    objc_msgSend(v31, "devices");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
    if (!v56)
      goto LABEL_69;
    v57 = v56;
    v58 = *(_QWORD *)v83;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v83 != v58)
          objc_enumerationMutation(v55);
        v60 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v59);
        objc_msgSend(v60, "name", v76);
        v61 = (id)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "length");
        v63 = v61;
        if (v62 < 0x15)
          goto LABEL_64;
        v64 = v62 - v62 / 3;
        v65 = malloc_type_malloc(2 * v64, 0xDCCBF1E1uLL);
        if (v65)
        {
          v66 = v65;
          objc_msgSend(v61, "getCharacters:range:", v65, 0, v64);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v66, v64);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          free(v66);
LABEL_64:
          v67 = v63;
          v68 = v67;
          goto LABEL_65;
        }
        v68 = 0;
        v67 = v61;
LABEL_65:

        objc_msgSend(v60, "setName:", v68);
        ++v59;
      }
      while (v57 != v59);
      v69 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
      v57 = v69;
    }
    while (v69);
LABEL_69:

LABEL_70:
    v29 = v80 + 1;
    v9 = v77;
    v32 = v78;
    v30 = v78;
  }
  while (v80 != 9);
LABEL_73:
  if ((unint64_t)objc_msgSend(v32, "length", v76) > 0x200)
  {
    nr_framework_log();
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);

    if (v72)
    {
      nr_framework_log();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        v75 = objc_msgSend(v32, "length");
        *(_DWORD *)buf = 67109376;
        v89 = 512;
        v90 = 2048;
        v91 = v75;
        _os_log_error_impl(&dword_1A0BDB000, v73, OS_LOG_TYPE_ERROR, "migrationConsentRequestData called- could not squish protobuf data to %d bytes (it's %ld bytes). Not returning any data!", buf, 0x12u);
      }

    }
    v70 = 0;
  }
  else
  {
    v70 = v32;
  }

  return v70;
}

- (BOOL)migrationIsAvailable
{
  void *v2;
  BOOL v3;

  -[NRMigrator migratableDevices](self, "migratableDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSArray)devicesExpectedToBeMigratableAfterRestore
{
  void *v2;
  void *v3;
  id v4;

  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDevicesMatching:", &__block_literal_global_481);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = 0;

  return (NSArray *)v4;
}

uint64_t __55__NRMigrator_devicesExpectedToBeMigratableAfterRestore__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "valueForProperty:", CFSTR("isPaired"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = objc_msgSend(v2, "canMigrate");
  else
    v4 = 0;

  return v4;
}

uint64_t __47__NRMigrator_migratableDevicesRequiringConsent__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "valueForProperty:", CFSTR("isArchived"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(v2, "valueForProperty:", CFSTR("isAltAccount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __31__NRMigrator_migratableDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  v2 = a2;
  objc_msgSend(v2, "valueForProperty:", CFSTR("isAltAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "valueForProperty:", CFSTR("isArchived"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "BOOLValue"))
    {
      objc_msgSend(v2, "valueForProperty:", CFSTR("migrationConsent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "BOOLValue"))
      {
        objc_msgSend(v2, "valueForProperty:", CFSTR("migrationConsentDate"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "timeIntervalSinceNow");
          v4 = v9 >= -86400.0 && v9 <= 0.0;
        }
        else
        {
          v4 = 0;
        }

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (id)migrationDataPreRestoreForConsentedDevices:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  id v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  nr_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    nr_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v32 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_DEFAULT, "Generating pre-restore migration data blob for (%lu) devices", buf, 0xCu);
    }

  }
  v7 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "pairingID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v10);
  }

  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v26;
  nr_framework_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      nr_framework_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v32 = (uint64_t)v16;
        v33 = 2112;
        v34 = v7;
        _os_log_error_impl(&dword_1A0BDB000, v20, OS_LOG_TYPE_ERROR, "Failed to serialize with error (%@) device IDs: (%@)", buf, 0x16u);
      }

    }
    v21 = 0;
  }
  else
  {
    v22 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v22)
    {
      nr_framework_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(v15, "length");
        *(_DWORD *)buf = 134217984;
        v32 = v24;
        _os_log_impl(&dword_1A0BDB000, v23, OS_LOG_TYPE_DEFAULT, "Generated pre-restore migration data blob of length (%lu bytes)", buf, 0xCu);
      }

    }
    v21 = v15;
  }

  return v21;
}

+ (void)ingestPostRestoreMigrationDataForConsentedDevices:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  _BOOL4 v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  _BOOL4 v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  nr_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    nr_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v50 = objc_msgSend(v3, "length");
      _os_log_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_DEFAULT, "Ingesting post-restore migration data blob of length (%lu bytes)", buf, 0xCu);
    }

  }
  if (objc_msgSend(v3, "length"))
  {
    v47 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v47);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v47;
    if (v8)
    {
      nr_framework_log();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v10)
        goto LABEL_10;
      nr_framework_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 138412546;
      v50 = (uint64_t)v8;
      v51 = 2112;
      v52 = v3;
      v33 = "Failed to unserialize with error (%@) pre-restore data : (%@)";
      v34 = v11;
      v35 = 22;
      goto LABEL_45;
    }
    if (!v7)
    {
      nr_framework_log();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

      if (!v32)
        goto LABEL_10;
      nr_framework_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_WORD *)buf = 0;
      v33 = "Unserialization returned nil object without error";
      v34 = v11;
      v35 = 2;
LABEL_45:
      _os_log_error_impl(&dword_1A0BDB000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v3;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (!v13)
        goto LABEL_35;
      v14 = v13;
      v15 = *(_QWORD *)v44;
      while (1)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v44 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
            if (v18)
            {
              +[NRMigrator sharedMigrator](NRMigrator, "sharedMigrator");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v41[0] = MEMORY[0x1E0C809B0];
              v41[1] = 3221225472;
              v41[2] = __64__NRMigrator_ingestPostRestoreMigrationDataForConsentedDevices___block_invoke;
              v41[3] = &unk_1E4496A18;
              v42 = v18;
              objc_msgSend(v19, "setMigrationConsented:forDeviceID:withBlock:", 1, v42, v41);

              v20 = v42;
            }
            else
            {
              nr_framework_log();
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

              if (!v27)
              {
                v18 = 0;
                goto LABEL_28;
              }
              nr_framework_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v50 = v17;
                v24 = v20;
                v25 = "Failed to convert unserialized deviceID (%@) into a UUID";
LABEL_33:
                _os_log_error_impl(&dword_1A0BDB000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);
              }
            }

            goto LABEL_28;
          }
          nr_framework_log();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

          if (!v22)
            goto LABEL_29;
          nr_framework_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v23 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v50 = (uint64_t)v23;
            v20 = v23;
            v24 = v18;
            v25 = "Unserialization deviceID not a string: (%@)";
            goto LABEL_33;
          }
LABEL_28:

LABEL_29:
          ++v16;
        }
        while (v14 != v16);
        v28 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        v14 = v28;
        if (!v28)
        {
LABEL_35:

          nr_framework_log();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

          v3 = v40;
          if (v30)
          {
            nr_framework_log();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A0BDB000, v11, OS_LOG_TYPE_DEFAULT, "Ingesting post-restore migration data complete", buf, 2u);
            }
            goto LABEL_9;
          }
          goto LABEL_10;
        }
      }
    }
    nr_framework_log();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

    if (v37)
    {
      nr_framework_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v38 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v50 = (uint64_t)v38;
        v39 = v38;
        _os_log_error_impl(&dword_1A0BDB000, v11, OS_LOG_TYPE_ERROR, "Unserialized root object not an array (%@)", buf, 0xCu);

      }
LABEL_9:

    }
LABEL_10:

  }
}

void __64__NRMigrator_ingestPostRestoreMigrationDataForConsentedDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    nr_framework_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      nr_framework_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = 138412546;
        v9 = v3;
        v10 = 2112;
        v11 = v7;
        _os_log_error_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_ERROR, "Failed with error: (%@) to apply consent for deviceID: %@", (uint8_t *)&v8, 0x16u);
      }

    }
  }

}

- (void)setMigrationConsented:(BOOL)a3 forDevice:(id)a4 withBlock:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a5;
  v8 = a4;
  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pairingID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setMigrationConsented:forDeviceID:withBlock:", v6, v9, v7);
}

- (void)setMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = a5;
  v8 = a4;
  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMigrationConsented:forDeviceID:withBlock:", v6, v8, v7);

}

- (void)beginMigrationWithDevice:(id)a3 passcode:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginMigrationWithDevice:passcode:withBlock:", v9, v8, v7);

}

- (void)beginMigrationWithDevice:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginMigrationWithDevice:withCompletion:", v6, v5);

}

- (id)lastMigrationRequestPhoneName
{
  void *v2;
  void *v3;

  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastMigrationRequestPhoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "isPhoneReadyToMigrateDevice:withCompletion:", v6, v5);

}

- (NRDevice)migratingDevice
{
  return self->_migratingDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migratingDevice, 0);
}

@end
