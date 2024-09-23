@implementation ASDemoData

+ (id)_activitySnapshotForFriendOneWithFriendUUID:(id)a3 sourceUUID:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(0));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  _ActivitySnapshot(0, v7, v6, 70, 30, 6, 12, 10532, 630.0, 400.0, 0.0, 0.0, 7.4, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(1));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  _ActivitySnapshot(1, v7, v6, 76, 30, 13, 12, 12849, 515.0, 400.0, 0.0, 0.0, 8.5, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(2));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  _ActivitySnapshot(2, v7, v6, 55, 30, 12, 12, 9845, 380.0, 400.0, 0.0, 0.0, 6.2, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v8;
  _ActivitySnapshot(3, v7, v6, 45, 30, 10, 12, 10003, 550.0, 400.0, 0.0, 0.0, 6.8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v10;
  _ActivitySnapshot(4, v7, v6, 78, 30, 14, 12, 12849, 472.0, 400.0, 0.0, 0.0, 7.2, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(5));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v12;
  _ActivitySnapshot(5, v7, v6, 63, 30, 12, 12, 11536, 611.0, 400.0, 0.0, 0.0, 6.3, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(6));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v14;
  _ActivitySnapshot(6, v7, v6, 72, 30, 10, 12, 10305, 500.0, 400.0, 0.0, 0.0, 6.8, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25[6] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_activitySnapshotForFriendTwoWithFriendUUID:(id)a3 sourceUUID:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(0));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  _ActivitySnapshot(0, v7, v6, 52, 30, 4, 12, 4523, 923.0, 850.0, 0.0, 0.0, 9.2, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(1));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  _ActivitySnapshot(1, v7, v6, 56, 30, 12, 12, 9042, 720.0, 850.0, 0.0, 0.0, 5.6, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(2));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  _ActivitySnapshot(2, v7, v6, 44, 30, 14, 12, 8573, 878.0, 850.0, 0.0, 0.0, 5.2, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v8;
  _ActivitySnapshot(3, v7, v6, 28, 30, 13, 12, 7523, 700.0, 850.0, 0.0, 0.0, 4.9, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v10;
  _ActivitySnapshot(4, v7, v6, 33, 30, 15, 12, 4073, 710.0, 850.0, 0.0, 0.0, 2.8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(5));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v12;
  _ActivitySnapshot(5, v7, v6, 45, 30, 10, 12, 9500, 689.0, 850.0, 0.0, 0.0, 6.0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(6));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v14;
  _ActivitySnapshot(6, v7, v6, 40, 30, 8, 12, 8294, 566.0, 850.0, 0.0, 0.0, 5.7, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25[6] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_activitySnapshotForFriendThreeWithFriendUUID:(id)a3 sourceUUID:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(0));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  _ActivitySnapshot(0, v7, v6, 10, 30, 2, 12, 3038, 100.0, 250.0, 0.0, 0.0, 1.5, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(1));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  _ActivitySnapshot(1, v7, v6, 15, 30, 8, 12, 3489, 120.0, 250.0, 0.0, 0.0, 1.8, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(2));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  _ActivitySnapshot(2, v7, v6, 12, 30, 6, 12, 2855, 90.0, 250.0, 0.0, 0.0, 1.3, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v8;
  _ActivitySnapshot(3, v7, v6, 5, 30, 6, 12, 4180, 169.0, 250.0, 0.0, 0.0, 2.4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v10;
  _ActivitySnapshot(4, v7, v6, 19, 30, 3, 12, 3767, 145.0, 250.0, 0.0, 0.0, 2.1, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(5));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v12;
  _ActivitySnapshot(5, v7, v6, 15, 30, 9, 12, 3611, 110.0, 250.0, 0.0, 0.0, 1.7, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(6));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v14;
  _ActivitySnapshot(6, v7, v6, 13, 30, 4, 12, 6412, 200.0, 250.0, 0.0, 0.0, 3.0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25[6] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_activitySnapshotForFitnessJrFriendWithFriendUUID:(id)a3 sourceUUID:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(0));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  _ActivitySnapshot(0, v7, v6, 56, 60, 11, 10, 5527, 0.0, 0.0, 122.0, 120.0, 3.2, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(1));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  _ActivitySnapshot(1, v7, v6, 82, 60, 12, 10, 6143, 0.0, 0.0, 135.0, 120.0, 3.7, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(2));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  _ActivitySnapshot(2, v7, v6, 54, 60, 11, 10, 5496, 0.0, 0.0, 120.0, 120.0, 3.1, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v8;
  _ActivitySnapshot(3, v7, v6, 47, 60, 11, 10, 4438, 0.0, 0.0, 101.0, 120.0, 2.5, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v10;
  _ActivitySnapshot(4, v7, v6, 73, 60, 12, 10, 5986, 0.0, 0.0, 128.0, 120.0, 3.4, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(5));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v12;
  _ActivitySnapshot(5, v7, v6, 131, 60, 14, 10, 10091, 0.0, 0.0, 183.0, 120.0, 6.9, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(6));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v14;
  _ActivitySnapshot(6, v7, v6, 115, 60, 13, 10, 9002, 0.0, 0.0, 174.0, 120.0, 5.5, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25[6] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_activitySnapshotForFriendWithIndex:(int64_t)a3 friendUUID:(id)a4 sourceUUID:(id)a5
{
  id v7;
  id v8;
  int64_t v9;
  uint64_t v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  if (a3 <= 0)
    v9 = -(-a3 & 3);
  else
    v9 = a3 & 3;
  if (v9 == 2)
  {
    objc_msgSend((id)objc_opt_class(), "_activitySnapshotForFriendThreeWithFriendUUID:sourceUUID:", v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (v9 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "_activitySnapshotForFriendTwoWithFriendUUID:sourceUUID:", v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
      objc_msgSend((id)objc_opt_class(), "_activitySnapshotForFitnessJrFriendWithFriendUUID:sourceUUID:", v7, v8);
    else
      objc_msgSend((id)objc_opt_class(), "_activitySnapshotForFriendOneWithFriendUUID:sourceUUID:", v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

+ (id)_achievementsForFriendTwoWithFriendUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v4;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = (void *)MEMORY[0x24BDD41E8];
  v7 = v3;
  DailyMoveRecordTemplate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _CacheIndexForDayWithOffsetFromCurrentDay(0);
  _HKStartDateForSnapshotIndex();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "achievementWithTemplateUniqueName:completedDate:value:friendUUID:", v9, v10, &unk_24D067C78, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(1));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v13;
  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = (void *)MEMORY[0x24BDD41E8];
  v16 = v7;
  DailyExerciseRecordTemplate();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uniqueName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _CacheIndexForDayWithOffsetFromCurrentDay(1);
  _HKStartDateForSnapshotIndex();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "achievementWithTemplateUniqueName:completedDate:value:friendUUID:", v18, v19, &unk_24D067C78, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setWithObject:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)_achievementsForFriendWithIndex:(int64_t)a3 friendUUID:(id)a4
{
  id v4;
  void *v5;

  if ((a3 & 0x8000000000000003) == 1)
  {
    v4 = a4;
    objc_msgSend((id)objc_opt_class(), "_achievementsForFriendTwoWithFriendUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1B8];
  }
  return v5;
}

+ (id)_workoutsForFriendOneWithFriendUUID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a3;
  objc_msgSend(v3, "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v6 = (void *)MEMORY[0x24BDBCF20];
  _CreatePedestrianWorkout(v4, 0, 52, 2, 1800.0, 2.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(2));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  v10 = (void *)MEMORY[0x24BDBCF20];
  _CreatePedestrianWorkout(v4, 2, 37, 1, 1800.0, 3.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(5));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v13;
  v14 = (void *)MEMORY[0x24BDBCF20];
  _CreatePedestrianWorkout(v4, 5, 37, 1, 2200.0, 3.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_workoutsForFriendTwoWithFriendUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(0));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _CreatePedestrianWorkout(v18, 0, 37, 1, 2760.0, 6.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _CreatePedestrianWorkout(v7, 1, 37, 1, 1200.0, 2.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  v11 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _CreatePedestrianWorkout(v12, 4, 52, 2, 1600.0, 2.8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_workoutsForFitnessJrFriendTwoWithFriendUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(1));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateFitnessJrWorkout(v18, 1, 32, 2, 900.0, 0.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(5));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateFitnessJrWorkout(v7, 5, 41, 2, 5400.0, 3.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(6));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  v11 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateFitnessJrWorkout(v12, 6, 37, 1, 720.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_workoutsForFriendWithIndex:(int64_t)a3 friendUUID:(id)a4
{
  id v5;
  int64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  if (a3 <= 0)
    v6 = -(-a3 & 3);
  else
    v6 = a3 & 3;
  if (v6 == 2)
  {
    v8 = (void *)MEMORY[0x24BDBD1B8];
  }
  else
  {
    if (v6 == 1)
    {
      objc_msgSend((id)objc_opt_class(), "_workoutsForFriendTwoWithFriendUUID:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6)
        objc_msgSend((id)objc_opt_class(), "_workoutsForFitnessJrFriendTwoWithFriendUUID:", v5);
      else
        objc_msgSend((id)objc_opt_class(), "_workoutsForFriendOneWithFriendUUID:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
  }

  return v8;
}

+ (id)createMeWithModel:(id)a3
{
  id v3;
  ASFriend *v4;
  ASFriend *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [ASFriend alloc];
  v5 = -[ASFriend initWithActivitySnapshots:friendAchievements:friendWorkouts:contact:competitions:](v4, "initWithActivitySnapshots:friendAchievements:friendWorkouts:contact:competitions:", 0, 0, 0, 0, MEMORY[0x24BDBD1A8]);
  v6 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __32__ASDemoData_createMeWithModel___block_invoke;
  v14[3] = &unk_24D057F80;
  v16 = &v17;
  v7 = v6;
  v15 = v7;
  v8 = (void *)MEMORY[0x2199B71D0](v14);
  objc_msgSend(v3, "startCurrentActivitySummaryQueryWithHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v3, "stopCurrentActivitySummaryQueryForClientToken:", v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", _CacheIndexForDayWithOffsetFromCurrentDay(0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18[5];
  v23 = v10;
  v24[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASFriend setSnapshots:](v5, "setSnapshots:", v12);

  _Block_object_dispose(&v17, 8);
  return v5;
}

intptr_t __32__ASDemoData_createMeWithModel___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD41F0], "snapshotWithActivitySummary:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)fakeAppFriendListForMarketing
{
  return (id)objc_msgSend(a1, "_fakeFriendListWithDemoFileName:", CFSTR("fakefriends.plist"));
}

+ (id)fakeFirstGlanceFriendListForMarketing
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_fakeFriendListWithDemoFileName:", CFSTR("fakefriends_firstglance.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_filter:", &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __51__ASDemoData_fakeFirstGlanceFriendListForMarketing__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "currentCompetition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stage") == 1;

  return v3;
}

+ (id)_fakeFriendListWithDemoFileName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  ASContact *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  ASRelationship *v40;
  ASRelationshipEvent *v41;
  void *v42;
  ASRelationshipStorage *v43;
  ASFriend *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  ASCompetition *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  ASFriend *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  ASFriend *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[8];
  _QWORD v100[8];
  _QWORD v101[8];
  _QWORD v102[8];
  _QWORD v103[8];
  _QWORD v104[8];
  _QWORD v105[8];
  _QWORD v106[8];
  _QWORD v107[4];
  _QWORD v108[3];

  v108[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v90 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/ActivityDemoData/"), 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v3;
  objc_msgSend(v85, "URLByAppendingPathComponent:isDirectory:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v5);
  v84 = v5;
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v4;
  LODWORD(v4) = objc_msgSend(v4, "fileExistsAtPath:", v7);

  v83 = v6;
  if ((_DWORD)v4)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("demodata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = MEMORY[0x24BDBD1C8];
    v105[0] = CFSTR("name");
    v105[1] = CFSTR("email");
    v106[0] = CFSTR("Jane");
    v106[1] = CFSTR("janedaniels@icloud.com");
    v105[2] = CFSTR("competition");
    v105[3] = CFSTR("myScores");
    v106[2] = MEMORY[0x24BDBD1C8];
    v106[3] = &unk_24D067DA8;
    v105[4] = CFSTR("opponentScores");
    v105[5] = CFSTR("myWins");
    v106[4] = &unk_24D067DC0;
    v106[5] = &unk_24D067B40;
    v105[6] = CFSTR("opponentWins");
    v105[7] = CFSTR("dayOfCompetition");
    v106[6] = &unk_24D067B58;
    v106[7] = &unk_24D067B70;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v106, v105, 8);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v97;
    v103[0] = CFSTR("name");
    v103[1] = CFSTR("email");
    v104[0] = CFSTR("Allen");
    v104[1] = CFSTR("abuchinski@icloud.com");
    v103[2] = CFSTR("competition");
    v103[3] = CFSTR("myScores");
    v104[2] = v9;
    v104[3] = &unk_24D067DD8;
    v103[4] = CFSTR("opponentScores");
    v103[5] = CFSTR("myWins");
    v104[4] = &unk_24D067DF0;
    v104[5] = &unk_24D067BA0;
    v103[6] = CFSTR("opponentWins");
    v103[7] = CFSTR("dayOfCompetition");
    v104[6] = &unk_24D067BB8;
    v104[7] = &unk_24D067BD0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v104, v103, 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v107[1] = v10;
    v101[0] = CFSTR("name");
    v101[1] = CFSTR("email");
    v102[0] = CFSTR("Emily");
    v102[1] = CFSTR("emily_parker@icloud.com");
    v101[2] = CFSTR("competition");
    v101[3] = CFSTR("myScores");
    v102[2] = MEMORY[0x24BDBD1C8];
    v102[3] = &unk_24D067E08;
    v101[4] = CFSTR("opponentScores");
    v101[5] = CFSTR("myWins");
    v102[4] = &unk_24D067E20;
    v102[5] = &unk_24D067BB8;
    v101[6] = CFSTR("opponentWins");
    v101[7] = CFSTR("dayOfCompetition");
    v102[6] = &unk_24D067BB8;
    v102[7] = &unk_24D067B40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v107[2] = v11;
    v99[0] = CFSTR("name");
    v99[1] = CFSTR("email");
    v100[0] = CFSTR("Doug");
    v100[1] = CFSTR("doug_FAH_renheit@icloud.com");
    v99[2] = CFSTR("competition");
    v99[3] = CFSTR("myScores");
    v100[2] = MEMORY[0x24BDBD1C8];
    v100[3] = &unk_24D067E38;
    v99[4] = CFSTR("opponentScores");
    v99[5] = CFSTR("myWins");
    v100[4] = &unk_24D067E50;
    v100[5] = &unk_24D067BB8;
    v99[6] = CFSTR("opponentWins");
    v99[7] = CFSTR("dayOfCompetition");
    v100[6] = &unk_24D067BA0;
    v100[7] = &unk_24D067BA0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v100, v99, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v107[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v107, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v8, "count"))
  {
    v13 = 0;
    v88 = *MEMORY[0x24BDBA2E0];
    v89 = v8;
    do
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "objectForKey:", CFSTR("name"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "objectForKey:", CFSTR("email"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = (void *)v15;
      objc_msgSend((id)objc_opt_class(), "_activitySnapshotForFriendWithIndex:friendUUID:sourceUUID:", v13, v14, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_achievementsForFriendWithIndex:friendUUID:", v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = (void *)v14;
      objc_msgSend((id)objc_opt_class(), "_workoutsForFriendWithIndex:friendUUID:", v13, v14);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17;
      v21 = v16;
      v22 = v18;
      v23 = v19;
      v24 = objc_alloc_init(ASContact);
      -[ASContact setShortName:](v24, "setShortName:", v21);
      v93 = v21;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASContact setDestinations:](v24, "setDestinations:", v25);

      v26 = _FetchLinkedContactStoreIdentifierForEmail_onceToken;
      v27 = v20;
      if (v26 != -1)
        dispatch_once(&_FetchLinkedContactStoreIdentifierForEmail_onceToken, &__block_literal_global_325);
      objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingEmailAddress:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)_FetchLinkedContactStoreIdentifierForEmail___contactStore;
      v108[0] = v88;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "unifiedContactsMatchingPredicate:keysToFetch:error:", v28, v30, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[ASContact setLinkedContactStoreIdentifier:](v24, "setLinkedContactStoreIdentifier:", v33);
      v34 = arc4random_uniform(4u) + 6;
      LODWORD(v28) = arc4random_uniform(0x3Cu);
      LODWORD(v33) = arc4random_uniform(0x18u);
      v35 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v35, "setDay:", -v34);
      objc_msgSend(v35, "setMinute:", -(uint64_t)v28);
      objc_msgSend(v35, "setHour:", -(uint64_t)v33);
      objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "dateByAddingComponents:toDate:options:", v35, v37, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = v38;
      v40 = objc_alloc_init(ASRelationship);
      v41 = -[ASRelationshipEvent initWithType:anchor:timestamp:]([ASRelationshipEvent alloc], "initWithType:anchor:timestamp:", 103, 0, v39);

      v108[0] = v41;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASRelationship setRelationshipEvents:](v40, "setRelationshipEvents:", v42);

      v43 = objc_alloc_init(ASRelationshipStorage);
      -[ASRelationshipStorage setLegacyRelationship:](v43, "setLegacyRelationship:", v40);
      -[ASRelationshipStorage setLegacyRemoteRelationship:](v43, "setLegacyRemoteRelationship:", v40);
      -[ASRelationship setCloudType:](v40, "setCloudType:", 1);
      -[ASRelationshipStorage setSecureCloudRelationship:](v43, "setSecureCloudRelationship:", v40);
      -[ASRelationshipStorage setSecureCloudRemoteRelationship:](v43, "setSecureCloudRemoteRelationship:", v40);
      -[ASContact setRelationshipStorage:](v24, "setRelationshipStorage:", v43);
      v44 = [ASFriend alloc];
      v91 = -[ASFriend initWithActivitySnapshots:friendAchievements:friendWorkouts:contact:competitions:](v44, "initWithActivitySnapshots:friendAchievements:friendWorkouts:contact:competitions:", v22, v23, v92, v24, MEMORY[0x24BDBD1A8]);

      v8 = v89;
      objc_msgSend(v89, "objectAtIndexedSubscript:", v13);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKey:", CFSTR("myWins"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "integerValue");

      objc_msgSend(v89, "objectAtIndexedSubscript:", v13);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKey:", CFSTR("opponentWins"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "integerValue");

      _FakeHistoricalCompetitionsWithWinner(v47, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBD1A8], "arrayByAddingObjectsFromArray:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      _FakeHistoricalCompetitionsWithWinner(v50, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "arrayByAddingObjectsFromArray:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v89, "objectAtIndexedSubscript:", v13);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKey:", CFSTR("competition"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v50) = objc_msgSend(v56, "BOOLValue");

      if ((_DWORD)v50)
      {
        v57 = objc_alloc_init(ASCompetition);
        objc_msgSend(v89, "objectAtIndexedSubscript:", v13);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKey:", CFSTR("myScores"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCompetition setScores:](v57, "setScores:", v59);

        objc_msgSend(v89, "objectAtIndexedSubscript:", v13);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKey:", CFSTR("opponentScores"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCompetition setOpponentScores:](v57, "setOpponentScores:", v61);

        ASCompetitionDurationDateComponentsForNewCompetitions();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCompetition setDurationDateComponents:](v57, "setDurationDateComponents:", v62);

        -[ASCompetition setMaximumNumberOfPointsPerDay:](v57, "setMaximumNumberOfPointsPerDay:", ASCompetitionMaximumPointsPerDayForNewCompetitions());
        objc_msgSend(v89, "objectAtIndexedSubscript:", v13);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKey:", CFSTR("dayOfCompetition"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "integerValue");

        v66 = 1 - v65;
        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "dateByAddingUnit:value:toDate:options:", 16, v66, v68, 0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        _HKActivityCacheDateComponentsFromDate();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCompetition setStartDateComponents:](v57, "setStartDateComponents:", v71);

        objc_msgSend(v54, "arrayByAddingObject:", v57);
        v72 = objc_claimAutoreleasedReturnValue();

        v73 = v91;
        -[ASFriend contact](v91, "contact");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "primaryRelationship");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v75, "insertEventWithType:", 11);
        -[ASFriend contact](v91, "contact");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "relationshipStorage");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v77, "updateRelationship:cloudType:", v75, objc_msgSend(v75, "cloudType"));
        -[ASFriend contact](v91, "contact");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setRelationshipStorage:", v77);

        v54 = (void *)v72;
        v80 = v96;
        v79 = v98;
      }
      else
      {
        v80 = v96;
        v79 = v98;
        v73 = v91;
      }
      -[ASFriend setCompetitions:](v73, "setCompetitions:", v54);
      objc_msgSend(v90, "addObject:", v73);

      ++v13;
    }
    while (v13 < objc_msgSend(v89, "count"));
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v90);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  return v81;
}

+ (id)_appleWatchSourceRevision
{
  const __CFString *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
    v2 = CFSTR("iPod6,3");
  else
    v2 = CFSTR("Watch");
  objc_msgSend(MEMORY[0x24BDD3FC0], "_sourceWithBundleIdentifier:name:productType:options:", CFSTR("Watch"), CFSTR("Watch"), v2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3FD0]), "initWithSource:version:", v3, CFSTR("1"));

  return v4;
}

+ (id)_fakeAchievementDuringDayStartingAtDate:(id)a3 personUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v18 = a4;
  v5 = a3;
  FirstWorkoutTemplateForWorkoutActivityType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  FirstWorkoutTemplateForWorkoutActivityType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  DailyMoveRecordTemplate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v11;
  DailyExerciseRecordTemplate();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v14, "count")));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD41E8], "achievementWithTemplateUniqueName:completedDate:value:friendUUID:", v15, v5, &unk_24D067E98, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_fakeWorkoutDuringDayStartingAtDate:(id)a3 personUUID:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  _OWORD v37[2];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37[0] = xmmword_213864630;
  v37[1] = xmmword_213864640;
  v38 = 3000;
  v5 = a4;
  v6 = a3;
  v35 = *((_QWORD *)v37 + arc4random_uniform(4u));
  v7 = (double)(arc4random_uniform(0xFD20u) + 21600);
  v8 = (double)(arc4random_uniform(0x1644u) + 1500);
  objc_msgSend(v6, "dateByAddingTimeInterval:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dateByAddingTimeInterval:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v8 / 20.0 * (double)(arc4random_uniform(6u) + 1);
  v12 = v8 / 20.0 * (double)(arc4random_uniform(6u) + 1);
  v13 = (void *)MEMORY[0x24BDD41F8];
  v14 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "quantityWithUnit:doubleValue:", v18, v11 * 0.6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "quantityWithUnit:doubleValue:", v21, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v34) = 1;
  v23 = v13;
  v24 = (void *)v10;
  objc_msgSend(v23, "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", v35, v5, v9, v10, v16, v19, v8, v22, *MEMORY[0x24BDD4500], 0, CFSTR("com.apple.SessionTrackerApp"), v34, 0, 0, 1,
    0,
    0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_appleWatchSourceRevision");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_setSourceRevision:", v26);

  objc_msgSend(v25, "setGoalType:", arc4random_uniform(4u));
  v27 = objc_msgSend(v25, "goalType");
  switch(v27)
  {
    case 3:
      v28 = v11 + (double)arc4random_uniform((v11 * 0.75));
      v29 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
      v30 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      v28 = v12 + (double)arc4random_uniform((v12 * 0.75));
      v29 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
      v30 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      v28 = v8 + (double)arc4random_uniform((v8 * 0.75));
      v29 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v30 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v31 = (void *)v30;
      objc_msgSend(v29, "quantityWithUnit:doubleValue:", v30, v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setGoal:", v32);

      break;
  }

  return v25;
}

+ (id)_fakeWorkoutsForIndex:(int64_t)a3 personUUID:(id)a4
{
  id v6;
  void *v7;
  uint32_t v8;
  void *i;
  void *v10;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = arc4random_uniform(4u);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", v8);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v8; --v8)
  {
    objc_msgSend(a1, "_fakeWorkoutDuringDayStartingAtDate:personUUID:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v10);

  }
  return i;
}

+ (id)_fakeWorkoutsForLastWeekWithPersonUUID:(id)a3 dailySnapshotProbability:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 1.0 - a4;
  do
  {
    if ((double)arc4random() * 2.32830644e-10 > v9)
    {
      v10 = _CacheIndexForDayWithOffsetFromCurrentDay(v8);
      objc_msgSend(a1, "_fakeWorkoutsForIndex:personUUID:", v10, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v12);

    }
    ++v8;
  }
  while (v8 != 7);

  return v7;
}

@end
