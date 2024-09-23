@implementation CKDVolumeManager

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  if (!qword_1ED7027F0)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_queue_create("com.apple.cloudd.volumeManager", v4);
    v3 = (void *)qword_1ED7027F0;
    qword_1ED7027F0 = (uint64_t)v2;

  }
}

+ (void)_rebuildVolumes
{
  const char *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1ED7027F0);
  objc_msgSend_mountedVolumes(CKDVolume, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)qword_1ED7027F8;
  qword_1ED7027F8 = (uint64_t)v5;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = (void *)qword_1ED702800;
  qword_1ED702800 = (uint64_t)v7;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v4;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, v30, 16);
  if (v11)
  {
    v14 = v11;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v18 = (void *)qword_1ED7027F8;
        objc_msgSend_volumeUUID(v17, v12, v13, (_QWORD)v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v18, v20, (uint64_t)v17, v19);

        if ((objc_msgSend_isRootVolume(v17, v21, v22) & 1) == 0)
        {
          v23 = (void *)qword_1ED702800;
          objc_msgSend_deviceID(v17, v12, v13);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v23, v25, (uint64_t)v17, v24);

        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v26, v30, 16);
    }
    while (v14);
  }

}

+ (id)volumeForVolumeUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1BE9BAFF8;
  v17 = sub_1BE9BADB0;
  v18 = 0;
  v5 = qword_1ED7027F0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAB31DC;
  block[3] = &unk_1E7831698;
  v11 = &v13;
  v12 = a1;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (id)volumeForDeviceID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1BE9BAFF8;
  v17 = sub_1BE9BADB0;
  v18 = 0;
  v5 = qword_1ED7027F0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAB3304;
  block[3] = &unk_1E7831698;
  v11 = &v13;
  v12 = a1;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (id)deviceIDForVolumeUUID:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_volumeForVolumeUUID_(a1, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)volumeUUIDForDeviceID:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_volumeForDeviceID_(a1, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_volumeUUID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
