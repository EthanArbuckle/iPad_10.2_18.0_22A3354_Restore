@implementation MTActivityForName

void __MTActivityForName_block_invoke()
{
  NSObject *v0;
  os_activity_t v1;
  void *v2;
  os_activity_t v3;
  void *v4;
  os_activity_t v5;
  void *v6;
  os_activity_t v7;
  void *v8;
  os_activity_t v9;
  void *v10;
  os_activity_t v11;
  void *v12;
  os_activity_t v13;
  void *v14;
  os_activity_t v15;
  void *v16;
  os_activity_t v17;
  void *v18;
  os_activity_t v19;
  void *v20;
  os_activity_t v21;
  void *v22;
  os_activity_t v23;
  void *v24;
  os_activity_t v25;
  void *v26;
  os_activity_t v27;
  void *v28;
  os_activity_t v29;
  void *v30;
  os_activity_t v31;
  void *v32;
  os_activity_t v33;
  void *v34;
  os_activity_t v35;
  void *v36;
  os_activity_t v37;
  void *v38;

  v0 = MEMORY[0x1E0C80FC8];
  v1 = _os_activity_create(&dword_19AC4E000, "Add Alarm", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v2 = (void *)MTActivityForName_activityObjects[0];
  MTActivityForName_activityObjects[0] = (uint64_t)v1;

  v3 = _os_activity_create(&dword_19AC4E000, "Update Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v4 = (void *)qword_1ECFC3590;
  qword_1ECFC3590 = (uint64_t)v3;

  v5 = _os_activity_create(&dword_19AC4E000, "Remove Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v6 = (void *)qword_1ECFC3598;
  qword_1ECFC3598 = (uint64_t)v5;

  v7 = _os_activity_create(&dword_19AC4E000, "Dismiss Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v8 = (void *)qword_1ECFC35A0;
  qword_1ECFC35A0 = (uint64_t)v7;

  v9 = _os_activity_create(&dword_19AC4E000, "Snooze Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v10 = (void *)qword_1ECFC35A8;
  qword_1ECFC35A8 = (uint64_t)v9;

  v11 = _os_activity_create(&dword_19AC4E000, "Sync Add Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v12 = (void *)qword_1ECFC35B0;
  qword_1ECFC35B0 = (uint64_t)v11;

  v13 = _os_activity_create(&dword_19AC4E000, "Sync Update Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v14 = (void *)qword_1ECFC35B8;
  qword_1ECFC35B8 = (uint64_t)v13;

  v15 = _os_activity_create(&dword_19AC4E000, "Sync Remove Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v16 = (void *)qword_1ECFC35C0;
  qword_1ECFC35C0 = (uint64_t)v15;

  v17 = _os_activity_create(&dword_19AC4E000, "Sync Dismiss Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v18 = (void *)qword_1ECFC35C8;
  qword_1ECFC35C8 = (uint64_t)v17;

  v19 = _os_activity_create(&dword_19AC4E000, "Sync Snooze Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v20 = (void *)qword_1ECFC35D0;
  qword_1ECFC35D0 = (uint64_t)v19;

  v21 = _os_activity_create(&dword_19AC4E000, "Fire Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v22 = (void *)qword_1ECFC35D8;
  qword_1ECFC35D8 = (uint64_t)v21;

  v23 = _os_activity_create(&dword_19AC4E000, "Schedule Alarm", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v24 = (void *)qword_1ECFC35E0;
  qword_1ECFC35E0 = (uint64_t)v23;

  v25 = _os_activity_create(&dword_19AC4E000, "Add Timer", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v26 = (void *)qword_1ECFC35E8;
  qword_1ECFC35E8 = (uint64_t)v25;

  v27 = _os_activity_create(&dword_19AC4E000, "Update Timer", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v28 = (void *)qword_1ECFC35F0;
  qword_1ECFC35F0 = (uint64_t)v27;

  v29 = _os_activity_create(&dword_19AC4E000, "Remove Timer", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v30 = (void *)qword_1ECFC35F8;
  qword_1ECFC35F8 = (uint64_t)v29;

  v31 = _os_activity_create(&dword_19AC4E000, "Dismiss Timer", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v32 = (void *)qword_1ECFC3600;
  qword_1ECFC3600 = (uint64_t)v31;

  v33 = _os_activity_create(&dword_19AC4E000, "Repeat Timer", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v34 = (void *)qword_1ECFC3608;
  qword_1ECFC3608 = (uint64_t)v33;

  v35 = _os_activity_create(&dword_19AC4E000, "Schedule Timer", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v36 = (void *)qword_1ECFC3610;
  qword_1ECFC3610 = (uint64_t)v35;

  v37 = _os_activity_create(&dword_19AC4E000, "Fire Timer", v0, OS_ACTIVITY_FLAG_DEFAULT);
  v38 = (void *)qword_1ECFC3618;
  qword_1ECFC3618 = (uint64_t)v37;

}

@end
