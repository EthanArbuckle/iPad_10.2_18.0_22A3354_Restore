@implementation BuddyBetaEnrollmentStateManager

- (BuddyBetaEnrollmentStateManager)init
{
  id v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  Block_layout *v6;
  void *v7;
  BuddyBetaEnrollmentStateManager *v8;
  objc_super v10;
  SEL v11;
  id location;

  v11 = a2;
  location = 0;
  v10.receiver = self;
  v10.super_class = (Class)BuddyBetaEnrollmentStateManager;
  location = -[BuddyBetaEnrollmentStateManager init](&v10, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_alloc_init((Class)NSMutableDictionary);
    v3 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v2;

    v4 = dispatch_queue_create("com.apple.setup.backup_seed_enrolled", 0);
    v5 = (void *)*((_QWORD *)location + 2);
    *((_QWORD *)location + 2) = v4;

    v6 = objc_retainBlock(&stru_100282D80);
    v7 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v6;

  }
  v8 = (BuddyBetaEnrollmentStateManager *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)loadSeedEnrollmentStateForRestorables:(id)a3 incompatibleWithUpdateVersion:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t i;
  NSObject *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  void **v16;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  BuddyBetaEnrollmentStateManager *v22;
  id v23;
  os_log_type_t v24;
  os_log_t v25;
  uint8_t buf[7];
  char v27;
  os_log_t oslog;
  void **block;
  int v30;
  int v31;
  void (*v32)(id *);
  void *v33;
  BuddyBetaEnrollmentStateManager *v34;
  id v35;
  id v36;
  _QWORD __b[8];
  id v38;
  id v39;
  id v40;
  id v41;
  id location[2];
  BuddyBetaEnrollmentStateManager *v43;
  uint8_t v44[24];
  _BYTE v45[128];

  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = 0;
  objc_storeStrong(&v41, a4);
  v40 = 0;
  objc_storeStrong(&v40, a5);
  v39 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  v7 = location[0];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
  if (v8)
  {
    v9 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v8; ++i)
      {
        if (*(_QWORD *)__b[2] != v9)
          objc_enumerationMutation(v7);
        v38 = *(id *)(__b[1] + 8 * i);
        if ((objc_msgSend(v38, "isCompatible") & 1) == 0
          && (objc_msgSend(v38, "isCompatibleWithUpdateToSystemVersion:", v41) & 1) == 0)
        {
          v11 = -[BuddyBetaEnrollmentStateManager backupUDIDToSeedEnrolledMapAccessQueue](v43, "backupUDIDToSeedEnrolledMapAccessQueue");
          block = _NSConcreteStackBlock;
          v30 = -1073741824;
          v31 = 0;
          v32 = sub_1000F47A4;
          v33 = &unk_100281000;
          v34 = v43;
          v35 = v38;
          v36 = v39;
          dispatch_sync(v11, &block);

          objc_storeStrong(&v36, 0);
          objc_storeStrong(&v35, 0);
          objc_storeStrong((id *)&v34, 0);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v39, "count");
  if (v12)
  {
    v25 = (os_log_t)(id)_BYLoggingFacility(v12);
    v24 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      sub_1000342B4((uint64_t)v44, (uint64_t)objc_msgSend(v39, "count"));
      _os_log_debug_impl((void *)&_mh_execute_header, v25, v24, "Will load seed enrollment state for %lu restorable items", v44, 0xCu);
    }
    objc_storeStrong((id *)&v25, 0);
    v15 = dispatch_get_global_queue(25, 0);
    v16 = _NSConcreteStackBlock;
    v17 = -1073741824;
    v18 = 0;
    v19 = sub_1000F4840;
    v20 = &unk_100281168;
    v21 = v39;
    v22 = v43;
    v23 = v40;
    dispatch_async(v15, &v16);

    objc_storeStrong(&v23, 0);
    objc_storeStrong((id *)&v22, 0);
    objc_storeStrong(&v21, 0);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(0);
    v27 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v13 = oslog;
      v14 = v27;
      sub_100038C3C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v13, v14, "No restorable items need to load seed enrollment state", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(void))v40 + 2))();
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isRestorableSeedEnrolled:(id)a3
{
  NSObject *v3;
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  BuddyBetaEnrollmentStateManager *v10;
  id v11[4];
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  char v16;
  id location[2];
  BuddyBetaEnrollmentStateManager *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x20000000;
  v15 = 32;
  v16 = 0;
  v3 = -[BuddyBetaEnrollmentStateManager backupUDIDToSeedEnrolledMapAccessQueue](v18, "backupUDIDToSeedEnrolledMapAccessQueue");
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000F4E38;
  v9 = &unk_100281D38;
  v11[1] = &v12;
  v10 = v18;
  v11[0] = location[0];
  dispatch_sync(v3, &v5);

  LOBYTE(v3) = *((_BYTE *)v13 + 24);
  objc_storeStrong(v11, 0);
  objc_storeStrong((id *)&v10, 0);
  _Block_object_dispose(&v12, 8);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (NSMutableDictionary)backupUDIDToSeedEnrolledMap
{
  return self->_backupUDIDToSeedEnrolledMap;
}

- (void)setBackupUDIDToSeedEnrolledMap:(id)a3
{
  objc_storeStrong((id *)&self->_backupUDIDToSeedEnrolledMap, a3);
}

- (OS_dispatch_queue)backupUDIDToSeedEnrolledMapAccessQueue
{
  return self->_backupUDIDToSeedEnrolledMapAccessQueue;
}

- (void)setBackupUDIDToSeedEnrolledMapAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backupUDIDToSeedEnrolledMapAccessQueue, a3);
}

- (id)fetchBackupMetadataBlock
{
  return self->_fetchBackupMetadataBlock;
}

- (void)setFetchBackupMetadataBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchBackupMetadataBlock, 0);
  objc_storeStrong((id *)&self->_backupUDIDToSeedEnrolledMapAccessQueue, 0);
  objc_storeStrong((id *)&self->_backupUDIDToSeedEnrolledMap, 0);
}

@end
