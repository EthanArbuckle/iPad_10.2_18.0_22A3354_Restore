uint64_t ASActivitySharingDaemonEnabled()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ActivitySharing"));
  v1 = objc_msgSend(v0, "hk_BOOLForKey:defaultValue:", CFSTR("ActivitySharingDaemonEnabled"), 1);

  return v1;
}

id ASFriendsFromCodableFriendList(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "friends");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hk_mapToSet:", &__block_literal_global_223);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

ASCodableFriendList *ASCodableFriendListFromFriends(void *a1, uint64_t a2)
{
  id v3;
  ASCodableFriendList *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = objc_alloc_init(ASCodableFriendList);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "codableFriendIncludingCloudKitFields:", a2, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCodableFriendList addFriend:](v4, "addFriend:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

id ActivitySharingBundle()
{
  if (ActivitySharingBundle_onceToken != -1)
    dispatch_once(&ActivitySharingBundle_onceToken, &__block_literal_global_13);
  return (id)ActivitySharingBundle_bundle;
}

void ASLoggingInitialize()
{
  if (ASLoggingInitialize_onceToken != -1)
    dispatch_once(&ASLoggingInitialize_onceToken, &__block_literal_global_12);
}

uint64_t ASCodableFriendListReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ASCodableFriend *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ASCodableFriend);
        objc_msgSend(a1, "addFriend:", v17);
        if (!PBReaderPlaceMark() || !ASCodableFriendReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASCodableActivityDataPreviewReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  ASCodableCloudKitActivitySnapshot *v18;
  uint64_t result;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = objc_alloc_init(ASCodableCloudKitActivitySnapshot);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (PBReaderPlaceMark() && (ASCodableCloudKitActivitySnapshotReadFrom((uint64_t)v18, a2) & 1) != 0)
          goto LABEL_29;
        goto LABEL_37;
      case 2u:
        v18 = objc_alloc_init(ASCodableCloudKitWorkout);
        objc_msgSend((id)a1, "addWorkouts:", v18);
        if (!PBReaderPlaceMark() || (ASCodableCloudKitWorkoutReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_37;
        goto LABEL_29;
      case 3u:
        v18 = objc_alloc_init(ASCodableCloudKitAchievement);
        objc_msgSend((id)a1, "addAchievements:", v18);
        if (PBReaderPlaceMark() && (ASCodableCloudKitAchievementReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_35:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_37:

        return 0;
      case 4u:
        *(_BYTE *)(a1 + 40) |= 1u;
        v20 = *v3;
        v21 = *(_QWORD *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        *(_QWORD *)(a1 + 8) = v22;
        goto LABEL_35;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_35;
    }
  }
}

id _ASCreateRecordsFromCloudKitCodablesAndRecordZoneID(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "recordWithZoneID:recordEncryptionType:", v6, a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayByAddingObject:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v10;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

id _ASCreateActivityDataRootRecordWithID(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x24BDB91D8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithRecordType:recordID:", CFSTR("ActivitySharingActivityDataRootRecord"), v2);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24D0679D8, CFSTR("Version"));
  return v3;
}

uint64_t _ASCloudKitSchemaVersionForRecord(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v1 = a1;
  objc_msgSend(v1, "encryptedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("EncryptedVersion"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
  {
    v5 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Version"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    v5 = objc_msgSend(v7, "integerValue");
  }

  return v5;
}

ASCodableCloudKitSample *_ASCodableCloudKitSampleForSample(void *a1)
{
  id v1;
  ASCodableCloudKitSample *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = objc_alloc_init(ASCodableCloudKitSample);
  objc_msgSend(v1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitSample setUuid:](v2, "setUuid:", v4);

  objc_msgSend(v1, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[ASCodableCloudKitSample setStartDate:](v2, "setStartDate:");

  objc_msgSend(v1, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  -[ASCodableCloudKitSample setEndDate:](v2, "setEndDate:");

  return v2;
}

void _ASUpdateSchemaVersionOnRecord(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  objc_msgSend(v5, "numberWithInteger:", a1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    objc_msgSend(v6, "encryptedValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("EncryptedVersion"));
    v6 = v7;
  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("Version"));
  }

}

id ASCodableAchievementsFromAchievements(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      v8 = v2;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "codableAchievement", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setByAddingObject:", v9);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v2;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v2;
}

id ASAchievementsFromCodableAchievements(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x24BDD41E8], "fitnessFriendAchievementWithCodableAchievement:friendUUID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), v4, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v5, "setByAddingObject:", v11);
          v12 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v12;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

id ASWorkoutRecordIDForUUID(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDB91E8];
  v4 = a2;
  v5 = a1;
  v6 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("ActivitySharingWorkout"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithRecordName:zoneID:", v7, v4);
  return v8;
}

id ASCodableWorkoutsFromWorkouts(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      v8 = v2;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "codableWorkout", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setByAddingObject:", v9);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v2;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v2;
}

id ASWorkoutsFromCodableWorkouts(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x24BDD41F8], "fitnessFriendWorkoutWithCodableWorkout:friendUUID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), v4, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setByAddingObject:", v12);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

id ASWorkoutNotificationRecordIDForType(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%ld-%@"), CFSTR("ActivitySharingEvent"), a1, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", v7, v6);

  return v8;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id OUTLINED_FUNCTION_8(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_12()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

uint64_t OUTLINED_FUNCTION_17()
{
  void *v0;

  return objc_msgSend(v0, "isWatchWorkout");
}

const __CFString *ASStringForReachabilityStatus(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("reachable");
  if (a1 == 2)
    return CFSTR("unreachable");
  else
    return v1;
}

id ASSecureUnarchiveClassWithData(objc_class *a1, void *a2)
{
  return ASSecureUnarchiveClassWithDataAndStrictness(a1, a2, 0);
}

id ASSecureUnarchiveClassWithDataAndStrictness(objc_class *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x24BDD1620];
    if (a3)
    {
      v7 = (void *)MEMORY[0x24BDBCF20];
      v16[0] = a1;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v6, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v9, v5, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;

      if (!v11)
        goto LABEL_9;
    }
    else
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a1, v5, &v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14;
      if (!v11)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    ASLoggingInitialize();
    v12 = (void *)ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR))
      ASSecureUnarchiveClassWithDataAndStrictness_cold_1(v12, a1, (uint64_t)v11);
    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

id ASSecureUnarchiveClassesWithData(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;

  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v15 = 0;
      v9 = (id *)&v15;
      objc_msgSend(v7, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v8, v6, &v15);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
      v9 = (id *)&v14;
      objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v8, v6, &v14);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
    v12 = *v9;

    if (v12)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR))
        ASSecureUnarchiveClassesWithData_cold_1();
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

ASCodableContactList *ASCodableContactListFromContacts(void *a1, uint64_t a2)
{
  id v3;
  ASCodableContactList *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = objc_alloc_init(ASCodableContactList);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "codableContactIncludingCloudKitFields:", a2, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCodableContactList addContacts:](v4, "addContacts:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

id ASContactsFromCodableContactList(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "contacts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hk_mapToSet:", &__block_literal_global_226);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t ASCodableCloudKitCompetitionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  int v19;
  uint64_t v21;
  void *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  ASCodableCloudKitDateComponents *v45;
  uint64_t v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  v8 = 0x254D05000uLL;
  v9 = 0x254D05000uLL;
  v10 = 0x254D05000uLL;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *v3;
      v15 = *(_QWORD *)(a2 + v14);
      if (v15 == -1 || v15 >= *(_QWORD *)(a2 + *v4))
        break;
      v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v15);
      *(_QWORD *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0)
        goto LABEL_12;
      v11 += 7;
      v17 = v12++ >= 9;
      if (v17)
      {
        v13 = 0;
        v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v13 = 0;
LABEL_14:
    v19 = v13 & 7;
    if (v18 || v19 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(a1 + 112);
        *(_QWORD *)(a1 + 112) = v21;

        goto LABEL_115;
      case 2u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 120) |= 1u;
        while (2)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 1;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if (v28 < 0)
            {
              v23 += 7;
              v17 = v24++ >= 9;
              if (v17)
              {
                v25 = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_84:
        v58 = 80;
        goto LABEL_89;
      case 3u:
        if (v19 != 2)
        {
          v59 = 0;
          v60 = 0;
          v61 = 0;
          while (1)
          {
            v62 = *v3;
            v63 = *(_QWORD *)(a2 + v62);
            if (v63 == -1 || v63 >= *(_QWORD *)(a2 + *v4))
              goto LABEL_104;
            v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v63);
            *(_QWORD *)(a2 + v62) = v63 + 1;
            v61 |= (unint64_t)(v64 & 0x7F) << v59;
            if (v64 < 0)
            {
              v59 += 7;
              v17 = v60++ >= 9;
              if (!v17)
                continue;
            }
            goto LABEL_105;
          }
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v30 = 0;
          v31 = 0;
          v32 = 0;
          while (1)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
              break;
            v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              v17 = v31++ >= 9;
              if (!v17)
                continue;
            }
            goto LABEL_41;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
          PBRepeatedInt64Add();
        }
        goto LABEL_73;
      case 4u:
        if (v19 != 2)
        {
          v65 = 0;
          v66 = 0;
          v67 = 0;
          while (1)
          {
            v68 = *v3;
            v69 = *(_QWORD *)(a2 + v68);
            if (v69 == -1 || v69 >= *(_QWORD *)(a2 + *v4))
              break;
            v70 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v69);
            *(_QWORD *)(a2 + v68) = v69 + 1;
            v67 |= (unint64_t)(v70 & 0x7F) << v65;
            if (v70 < 0)
            {
              v65 += 7;
              v17 = v66++ >= 9;
              if (!v17)
                continue;
            }
            goto LABEL_105;
          }
LABEL_104:
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_105:
          PBRepeatedInt64Add();
          goto LABEL_115;
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v36 = 0;
          v37 = 0;
          v38 = 0;
          while (1)
          {
            v39 = *v3;
            v40 = *(_QWORD *)(a2 + v39);
            if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
              break;
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 1;
            v38 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              v17 = v37++ >= 9;
              if (!v17)
                continue;
            }
            goto LABEL_54;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
          PBRepeatedInt64Add();
        }
        goto LABEL_73;
      case 5u:
        v42 = v10;
        v43 = v9;
        v44 = v8;
        v45 = objc_alloc_init(ASCodableCloudKitDateComponents);
        v46 = 104;
        goto LABEL_57;
      case 6u:
        v42 = v10;
        v43 = v9;
        v44 = v8;
        v45 = objc_alloc_init(ASCodableCloudKitDateComponents);
        v46 = 96;
LABEL_57:
        objc_storeStrong((id *)(a1 + v46), v45);
        if (PBReaderPlaceMark() && ASCodableCloudKitDateComponentsReadFrom((uint64_t)v45, a2))
        {
          PBReaderRecallMark();

          v8 = v44;
          v9 = v43;
          v10 = v42;
LABEL_115:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 7u:
        if (v19 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v47 = 0;
            v48 = 0;
            v49 = 0;
            while (1)
            {
              v50 = *v3;
              v51 = *(_QWORD *)(a2 + v50);
              if (v51 == -1 || v51 >= *(_QWORD *)(a2 + *v4))
                break;
              v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v51);
              *(_QWORD *)(a2 + v50) = v51 + 1;
              v49 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                v17 = v48++ >= 9;
                if (!v17)
                  continue;
              }
              goto LABEL_72;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_72:
            PBRepeatedInt32Add();
          }
LABEL_73:
          PBReaderRecallMark();
        }
        else
        {
          v71 = 0;
          v72 = 0;
          v73 = 0;
          while (1)
          {
            v74 = *v3;
            v75 = *(_QWORD *)(a2 + v74);
            if (v75 == -1 || v75 >= *(_QWORD *)(a2 + *v4))
              break;
            v76 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v75);
            *(_QWORD *)(a2 + v74) = v75 + 1;
            v73 |= (unint64_t)(v76 & 0x7F) << v71;
            if (v76 < 0)
            {
              v71 += 7;
              v17 = v72++ >= 9;
              if (!v17)
                continue;
            }
            goto LABEL_114;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_114:
          PBRepeatedInt32Add();
        }
        goto LABEL_115;
      case 8u:
        v53 = 0;
        v54 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 120) |= 2u;
        while (2)
        {
          v55 = *v3;
          v56 = *(_QWORD *)(a2 + v55);
          if (v56 == -1 || v56 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v57 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v56);
            *(_QWORD *)(a2 + v55) = v56 + 1;
            v25 |= (unint64_t)(v57 & 0x7F) << v53;
            if (v57 < 0)
            {
              v53 += 7;
              v17 = v54++ >= 9;
              if (v17)
              {
                v25 = 0;
                goto LABEL_88;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_88:
        v58 = 88;
LABEL_89:
        *(_QWORD *)(a1 + v58) = v25;
        goto LABEL_115;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_115;
    }
  }
}

const __CFString *NSStringFromASRelationshipEventType(int a1)
{
  const __CFString *result;
  int v2;

  if (a1 <= 199)
  {
    v2 = a1 - 1;
    result = CFSTR("SentInviteRequest");
    switch(v2)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("SentInviteResponse");
        break;
      case 2:
        result = CFSTR("WithdrewInviteRequest");
        break;
      case 3:
        result = CFSTR("EndedFriendship");
        break;
      case 4:
        result = CFSTR("BeganHidingActivityData");
        break;
      case 5:
        result = CFSTR("StoppedHidingActivityData");
        break;
      case 6:
        result = CFSTR("IgnoredInviteRequest");
        break;
      case 7:
        result = CFSTR("BeganMutingNotifications");
        break;
      case 8:
        result = CFSTR("StoppedMutingNotifications");
        break;
      case 9:
        result = CFSTR("SentCompetitionRequest");
        break;
      case 10:
        result = CFSTR("AcceptedCompetitionRequest");
        break;
      case 11:
        result = CFSTR("IgnoredCompetitionRequest");
        break;
      case 12:
        result = CFSTR("SavedFinalCompetitionScore");
        break;
      case 13:
        result = CFSTR("CompletedCompetition");
        break;
      case 14:
        result = CFSTR("UpdatedSupportedFeatures");
        break;
      default:
        switch(CFSTR("SentInviteRequest"))
        {
          case 'd':
            result = CFSTR("ReceivedInviteRequest");
            break;
          case 'e':
            result = CFSTR("ReceivedInviteResponse");
            break;
          case 'f':
            result = CFSTR("InviteRequestWasWithdrawnRemotely");
            break;
          case 'g':
            result = CFSTR("FriendshipDidBegin");
            break;
          case 'h':
            result = CFSTR("FriendshipWasEndedRemotely");
            break;
          case 'i':
            result = CFSTR("ReceivedCompetitionRequest");
            break;
          case 'j':
            result = CFSTR("CompetitionRequestWasAcceptedRemotely");
            break;
          default:
LABEL_47:
            result = CFSTR("UnknownEventType");
            break;
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 200:
        result = CFSTR("SentSecureCloudInviteRequest");
        break;
      case 201:
        result = CFSTR("SecureCloudUpgradeAvailable");
        break;
      case 202:
        result = CFSTR("SecureCloudUpgradeUnavailable");
        break;
      case 203:
        result = CFSTR("SentSecureCloudUpgradeRequest");
        break;
      case 204:
        result = CFSTR("SecureCloudUpgradeFailed");
        break;
      case 205:
        result = CFSTR("SecureCloudMigrationAvailable");
        break;
      case 206:
        result = CFSTR("SecureCloudMigrationStarted");
        break;
      case 207:
        result = CFSTR("SecureCloudMigrationFailed");
        break;
      case 208:
        result = CFSTR("SecureCloudDowngradeRequested");
        break;
      case 209:
        result = CFSTR("SecureCloudDowngradeStarted");
        break;
      case 210:
        result = CFSTR("SecureCloudDowngradeFailed");
        break;
      case 211:
        result = CFSTR("SecureCloudDowngradeNeedsAcknowledgement");
        break;
      case 212:
        result = CFSTR("SecureCloudDowngradeAcknowledged");
        break;
      case 213:
        result = CFSTR("SecureCloudDowngradeRequestRescinded");
        break;
      case 214:
        result = CFSTR("SecureCloudNeedsZoneDeletion");
        break;
      case 215:
        result = CFSTR("SecureCloudNeedsRepair");
        break;
      case 216:
        result = CFSTR("SentSecureCloudRepairRequest");
        break;
      case 217:
        result = CFSTR("SecureCloudRepairFailed");
        break;
      case 218:
        result = CFSTR("SecureCloudRepairComplete");
        break;
      default:
        switch(a1)
        {
          case 300:
            result = CFSTR("ReceivedSecureCloudInviteRequest");
            break;
          case 301:
            result = CFSTR("ReceivedSecureCloudUpgradeRequest");
            break;
          case 302:
            result = CFSTR("SecureCloudUpgradeFailedRemotely");
            break;
          case 303:
            result = CFSTR("SecureCloudUpgradeCompleted");
            break;
          case 304:
            result = CFSTR("SecureCloudMigrationCompleted");
            break;
          case 305:
            result = CFSTR("SecureCloudDowngradeCompleted");
            break;
          case 306:
            result = CFSTR("ReceivedSecureCloudRepairRequest");
            break;
          default:
            goto LABEL_47;
        }
        break;
    }
  }
  return result;
}

BOOL ASCodableContactReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  ASCodableRelationshipContainer *v19;
  uint64_t v20;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 3;
        goto LABEL_33;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 2;
        goto LABEL_33;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 9;
        goto LABEL_33;
      case 4u:
        PBReaderReadString();
        v19 = (ASCodableRelationshipContainer *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(a1, "addDestinations:", v19);
        goto LABEL_37;
      case 5u:
        v19 = objc_alloc_init(ASCodableRelationshipContainer);
        v20 = 6;
        goto LABEL_28;
      case 6u:
        v19 = objc_alloc_init(ASCodableRelationshipContainer);
        v20 = 8;
LABEL_28:
        objc_storeStrong(&a1[v20], v19);
        if (!PBReaderPlaceMark() || (ASCodableRelationshipContainerReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_41;
        goto LABEL_36;
      case 7u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 5;
        goto LABEL_33;
      case 8u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 4;
LABEL_33:
        v19 = (ASCodableRelationshipContainer *)a1[v18];
        a1[v18] = (id)v17;
        goto LABEL_37;
      case 9u:
        v19 = objc_alloc_init(ASCodableRelationshipStorage);
        objc_storeStrong(a1 + 7, v19);
        if (PBReaderPlaceMark() && ASCodableRelationshipStorageReadFrom((uint64_t)v19, a2))
        {
LABEL_36:
          PBReaderRecallMark();
LABEL_37:

LABEL_38:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_41:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_38;
    }
  }
}

id _ASCelebrationAssetURLWithFileName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(CFSTR("/System/Library/Health/Assets/ActivitySharingAssets.bundle"), "stringByAppendingPathComponent:", CFSTR("CelebrationMovies"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id ASCompetitionVictoryCelebrationAssetURL()
{
  return _ASCelebrationAssetURLWithFileName(CFSTR("CompetitionVictory.mov"));
}

id ASCompetitionScoreCapCelebrationAssetURL()
{
  return _ASCelebrationAssetURLWithFileName(CFSTR("ScoreCapCelebration.mov"));
}

BOOL ASCodableRelationshipStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ASCodableRelationshipContainer *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(ASCodableRelationshipContainer);
        v18 = 8;
        goto LABEL_25;
      case 2u:
        v17 = objc_alloc_init(ASCodableRelationshipContainer);
        v18 = 16;
        goto LABEL_25;
      case 3u:
        v17 = objc_alloc_init(ASCodableRelationshipContainer);
        v18 = 24;
        goto LABEL_25;
      case 4u:
        v17 = objc_alloc_init(ASCodableRelationshipContainer);
        v18 = 32;
LABEL_25:
        objc_storeStrong((id *)(a1 + v18), v17);
        if (PBReaderPlaceMark() && (ASCodableRelationshipContainerReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_28:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_28;
    }
  }
}

BOOL ASCodableFriendReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ASCodableContact *v17;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(ASCodableContact);
        objc_storeStrong(a1 + 3, v17);
        if (PBReaderPlaceMark() && ASCodableContactReadFrom((id *)&v17->super.super.isa, a2))
          goto LABEL_35;
        goto LABEL_39;
      case 2u:
        v17 = objc_alloc_init(ASCodableCloudKitActivitySnapshot);
        objc_msgSend(a1, "addSnapshots:", v17);
        if (!PBReaderPlaceMark()
          || (ASCodableCloudKitActivitySnapshotReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 3u:
        v17 = objc_alloc_init(ASCodableCloudKitWorkout);
        objc_msgSend(a1, "addWorkouts:", v17);
        if (!PBReaderPlaceMark() || (ASCodableCloudKitWorkoutReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_39;
        goto LABEL_35;
      case 4u:
        v17 = objc_alloc_init(ASCodableCloudKitAchievement);
        objc_msgSend(a1, "addAchievements:", v17);
        if (!PBReaderPlaceMark() || (ASCodableCloudKitAchievementReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_39;
        goto LABEL_35;
      case 5u:
        v17 = objc_alloc_init(ASCodableCloudKitCompetition);
        objc_msgSend(a1, "addCompetitions:", v17);
        if (PBReaderPlaceMark() && (ASCodableCloudKitCompetitionReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_35:
          PBReaderRecallMark();

LABEL_36:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_39:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_36;
    }
  }
}

id _MostRecentEventsWithCount(void *a1, unint64_t a2)
{
  void *v3;
  unint64_t v4;
  void *v5;

  objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 < a2)
    a2 = v4;
  objc_msgSend(v3, "subarrayWithRange:", objc_msgSend(v3, "count") - a2, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_2138321C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t ASCodableWithdrawInviteRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ASCodableCloudKitDateComponentsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  char v44;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 0x10u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__year;
              goto LABEL_61;
            }
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              break;
            v17 += 7;
            v23 = v18++ > 8;
            if (v23)
            {
              v19 = 0;
              v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__year;
              goto LABEL_64;
            }
          }
          v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__year;
          goto LABEL_62;
        case 2u:
          v25 = 0;
          v26 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 8u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__month;
              goto LABEL_61;
            }
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v23 = v26++ > 8;
              if (v23)
              {
                v19 = 0;
                v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__month;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__month;
          goto LABEL_62;
        case 3u:
          v30 = 0;
          v31 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          while (2)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__day;
              goto LABEL_61;
            }
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v23 = v31++ > 8;
              if (v23)
              {
                v19 = 0;
                v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__day;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__day;
          goto LABEL_62;
        case 4u:
          v35 = 0;
          v36 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 4u;
          while (2)
          {
            v37 = *v3;
            v38 = *(_QWORD *)(a2 + v37);
            if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__hour;
              goto LABEL_61;
            }
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 1;
            v19 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              v23 = v36++ > 8;
              if (v23)
              {
                v19 = 0;
                v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__hour;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__hour;
          goto LABEL_62;
        case 5u:
          v40 = 0;
          v41 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 2u;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
          return 0;
      }
      while (1)
      {
        v42 = *v3;
        v43 = *(_QWORD *)(a2 + v42);
        if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v4))
          break;
        v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
        *(_QWORD *)(a2 + v42) = v43 + 1;
        v19 |= (unint64_t)(v44 & 0x7F) << v40;
        if ((v44 & 0x80) == 0)
        {
          v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__era;
          goto LABEL_62;
        }
        v40 += 7;
        v23 = v41++ > 8;
        if (v23)
        {
          v19 = 0;
          v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__era;
          goto LABEL_64;
        }
      }
      v24 = &OBJC_IVAR___ASCodableCloudKitDateComponents__era;
LABEL_61:
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_62:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_64:
      *(_QWORD *)(a1 + *v24) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASCodableCloudKitCompetitionListReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  ASCodableCloudKitCompetition *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_35;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            v21 = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_37:
        *(_QWORD *)(a1 + 8) = v21;
      }
      else if ((_DWORD)v17 == 2)
      {
        PBReaderReadData();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v25;

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(ASCodableCloudKitCompetition);
        objc_msgSend((id)a1, "addCompetitions:", v18);
        if (!PBReaderPlaceMark() || (ASCodableCloudKitCompetitionReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASDestinationIsEmail(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("@")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "containsString:", CFSTR("mailto:"));

  return v2;
}

uint64_t ASDestinationIsPhoneNumber(void *a1)
{
  id v1;
  char v2;
  int IsEmail;
  void *v4;
  uint64_t v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "containsString:", CFSTR("tel:"));
  IsEmail = ASDestinationIsEmail(v1);
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v1, "rangeOfCharacterFromSet:", v4);

  if ((v2 & 1) != 0)
    return 1;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return IsEmail ^ 1u;
}

uint64_t ASDestinationIsMako(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasSuffix:", CFSTR("inbox.appleid.apple.com"));
}

id ASSanitizedContactDestination(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  _RawAddressForDestination(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (ASDestinationIsPhoneNumber(v1))
  {
    v3 = (void *)MEMORY[0x2199B6CA8](v2, 0, 1);
LABEL_5:
    v4 = v3;
    _RawAddressForDestination(v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
    goto LABEL_6;
  }
  if (ASDestinationIsEmail(v1))
  {
    v3 = (void *)MEMORY[0x2199B6C90](v2);
    goto LABEL_5;
  }
LABEL_6:

  return v2;
}

id _RawAddressForDestination(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("tel:")) & 1) != 0
    || objc_msgSend(v1, "containsString:", CFSTR("mailto:")))
  {
    v2 = (id)IDSCopyRawAddressForDestination();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

id ASSanitizedContactDestinations(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        ASSanitizedContactDestination(*(void **)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8, (_QWORD)v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id ASContactStorePredicateForDestination(void *a1)
{
  id v1;
  void *v2;
  int IsEmail;
  void *v4;
  void *v5;

  v1 = a1;
  ASSanitizedContactDestination(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsEmail = ASDestinationIsEmail(v1);

  if (IsEmail)
  {
    objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingEmailAddress:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBAD88], "phoneNumberWithStringValue:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingPhoneNumber:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id ASShortNameForContactStoreContact(void *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", a1, 1000);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id ASFullNameForContactStoreContact(void *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", a1, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t ASCodableRelationshipContainerReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  BOOL v18;
  unint64_t v19;
  unint64_t v20;
  _BYTE *v21;
  uint64_t result;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = 0x24D056000uLL;
    v8 = 0x254D05000uLL;
    v9 = (int *)MEMORY[0x24BE7AF30];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v10 = 0;
        v11 = 0;
        v12 = 0;
        while (1)
        {
          v13 = *v3;
          v14 = *(_QWORD *)(a2 + v13);
          if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
            break;
          v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
          *(_QWORD *)(a2 + v13) = v14 + 1;
          v12 |= (unint64_t)(v15 & 0x7F) << v10;
          if ((v15 & 0x80) == 0)
            goto LABEL_12;
          v10 += 7;
          v16 = v11++ >= 9;
          if (v16)
          {
            v12 = 0;
            v17 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v17 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v12 = 0;
LABEL_14:
        if (v17)
          v18 = 1;
        else
          v18 = (v12 & 7) == 4;
        if (!v18)
        {
          switch((v12 >> 3))
          {
            case 1u:
              v19 = v8;
              v20 = v7;
              v21 = objc_alloc_init(*(Class *)(v7 + 2464));
              objc_storeStrong((id *)(a1 + 16), v21);
              if (PBReaderPlaceMark() && (ASCodableCloudKitRelationshipReadFrom(v21, a2) & 1) != 0)
              {
                PBReaderRecallMark();

                v7 = v20;
                v8 = v19;
                goto LABEL_38;
              }

              return 0;
            case 2u:
              v23 = 0;
              v24 = 0;
              v25 = 0;
              *(_BYTE *)(a1 + *(int *)(v8 + 2984)) |= 1u;
              break;
            case 3u:
              PBReaderReadData();
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = 64;
              goto LABEL_37;
            case 4u:
              PBReaderReadData();
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = 24;
              goto LABEL_37;
            case 5u:
              PBReaderReadData();
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = 48;
              goto LABEL_37;
            case 6u:
              PBReaderReadData();
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = 40;
              goto LABEL_37;
            case 7u:
              PBReaderReadData();
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = 32;
              goto LABEL_37;
            case 8u:
              PBReaderReadData();
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = 56;
LABEL_37:
              v31 = *(void **)(a1 + v30);
              *(_QWORD *)(a1 + v30) = v29;

              goto LABEL_38;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_38:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
          while (1)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
              break;
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 1;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if ((v28 & 0x80) == 0)
              goto LABEL_41;
            v23 += 7;
            v16 = v24++ >= 9;
            if (v16)
            {
              v25 = 0;
              goto LABEL_43;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
          if (*(_BYTE *)(a2 + *v5))
            v25 = 0;
LABEL_43:
          *(_QWORD *)(a1 + 8) = v25;
          goto LABEL_38;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id ASContactSanitizedDestination(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (ASDestinationIsPhoneNumber(v1))
  {
    v2 = IDSCopyIDForPhoneNumber();
LABEL_5:
    v3 = (void *)v2;
    goto LABEL_7;
  }
  if (ASDestinationIsEmail(v1))
  {
    v2 = MEMORY[0x2199B6C90](v1);
    goto LABEL_5;
  }
  v3 = 0;
LABEL_7:
  v4 = (void *)IDSCopyRawAddressForDestination();

  ASLoggingInitialize();
  v5 = ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21381F000, v5, OS_LOG_TYPE_DEFAULT, "The final destination after cleanup is: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

id _FindIntersectingDestination(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v4, "containsObject:", v9, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t ASCodableDatabaseCompetitionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  ASCodableCloudKitCompetition *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = objc_alloc_init(ASCodableCloudKitCompetition);
        objc_storeStrong((id *)(a1 + 16), v20);
        if (!PBReaderPlaceMark() || (ASCodableCloudKitCompetitionReadFrom((uint64_t)v20, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 2)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
            break;
          v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0)
            goto LABEL_35;
          v21 += 7;
          v14 = v22++ >= 9;
          if (v14)
          {
            v23 = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_37:
        *(_QWORD *)(a1 + 8) = v23;
      }
      else if ((_DWORD)v17 == 1)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v18;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id ASCompetitionParticipationTemplate()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v0 = objc_alloc_init(MEMORY[0x24BE01850]);
  objc_msgSend(v0, "setUniqueName:", CFSTR("CompetitionParticipation"));
  objc_msgSend(v0, "setSourceName:", CFSTR("ActivitySharingCompetitions"));
  objc_msgSend(v0, "setVersion:", 1);
  objc_msgSend(v0, "setMinimumEngineVersion:", 1);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setPredicate:", v2);

  objc_msgSend(v0, "setValueExpression:", &stru_24D059A78);
  objc_msgSend(v0, "setTriggers:", 0);
  objc_msgSend(v0, "setEarnLimit:", *MEMORY[0x24BE01610]);
  objc_msgSend(v0, "setDuplicateRemovalStrategy:", 3);
  objc_msgSend(v0, "setDuplicateRemovalCalendarUnit:", 16);
  objc_msgSend(v0, "setEarnDateStrategy:", 1);
  objc_msgSend(v0, "setDisplayOrder:", 1);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setVisibilityPredicate:", v4);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setAlertabilityPredicate:", v6);

  objc_msgSend(v0, "setDisplaysEarnedInstanceCount:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setCanonicalUnit:", v7);

  return v0;
}

id ASCompetitionVictoryTemplateForFriend(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x24BE01850];
  v4 = a1;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("CompetitionVictory"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUniqueName:", v6);

  objc_msgSend(v5, "setSourceName:", CFSTR("ActivitySharingCompetitions"));
  objc_msgSend(v5, "setVersion:", 2);
  objc_msgSend(v5, "setMinimumEngineVersion:", 1);
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v7);
  objc_msgSend(v5, "setValueExpression:", &stru_24D059A78);
  objc_msgSend(v5, "setTriggers:", 0);
  objc_msgSend(v5, "setEarnLimit:", *MEMORY[0x24BE01610]);
  objc_msgSend(v5, "setDuplicateRemovalStrategy:", 1);
  objc_msgSend(v5, "setDuplicateRemovalCalendarUnit:", 16);
  objc_msgSend(v5, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisibilityPredicate:", v9);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlertabilityPredicate:", v11);

  objc_msgSend(v5, "setDisplaysEarnedInstanceCount:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCanonicalUnit:", v12);

  objc_msgSend(v5, "setDisplayOrder:", a2 + 2);
  return v5;
}

uint64_t ASCompetitionVictoryTemplateNameForFriend(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("CompetitionVictory"), a1);
}

id ASCompetitionVictoryFriendUUIDFromTemplate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = a1;
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@_"), CFSTR("CompetitionVictory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rangeOfString:", v3);
  objc_msgSend(v2, "substringFromIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v5);
  return v6;
}

uint64_t ASIsCompetitionVictoryTemplate(void *a1, const char *a2)
{
  return objc_msgSend(a1, "containsString:", CFSTR("CompetitionVictory"));
}

uint64_t ASIsAchievementValidForCompetitionSuggestion(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
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

  v1 = a1;
  MoveGoal200PercentTemplate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    MoveGoal300PercentTemplate();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v1, "isEqualToString:", v6) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      MoveGoal400PercentTemplate();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v1, "isEqualToString:", v8) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        DailyMoveRecordTemplate();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uniqueName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v1, "isEqualToString:", v10) & 1) != 0)
        {
          v4 = 1;
        }
        else
        {
          DailyExerciseRecordTemplate();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "uniqueName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v1, "isEqualToString:") & 1) != 0)
          {
            v4 = 1;
          }
          else
          {
            NewMoveGoalAchievedTemplate();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "uniqueName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v1, "isEqualToString:") & 1) != 0)
            {
              v4 = 1;
            }
            else
            {
              PerfectWeekMoveTemplate();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "uniqueName");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v1, "isEqualToString:") & 1) != 0)
              {
                v4 = 1;
              }
              else
              {
                PerfectWeekStandTemplate();
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "uniqueName");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v1, "isEqualToString:") & 1) != 0)
                {
                  v4 = 1;
                }
                else
                {
                  PerfectWeekExerciseTemplate();
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "uniqueName");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v1, "isEqualToString:") & 1) != 0)
                  {
                    v4 = 1;
                  }
                  else
                  {
                    PerfectWeekAllTemplate();
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "uniqueName");
                    v12 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v1, "isEqualToString:") & 1) != 0)
                      v4 = 1;
                    else
                      v4 = objc_msgSend(v1, "containsString:", CFSTR("CompetitionVictory"));

                  }
                }

              }
            }

          }
        }

      }
    }

  }
  return v4;
}

uint64_t ASCompetitionVictoryStyleForBadge(int a1, int a2)
{
  return a2 | (a1 << 16);
}

uint64_t ASCompetitionVictoryBadgeModelFromStyle(unsigned int a1)
{
  return HIWORD(a1);
}

uint64_t ASCompetitionVictoryBadgeColorFromStyle(uint64_t result)
{
  return (unsigned __int16)result;
}

uint64_t ASNumberOfCompetitionVictoryColorsForBadgeModel()
{
  return 10;
}

uint64_t ASFormattedVictoryBadgeStyle(unsigned int a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%d.%d]"), HIWORD(a1), (unsigned __int16)a1);
}

id ASFormattedVictoryBadgeStyles(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hk_map:", &__block_literal_global_4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsJoinedByString:", &stru_24D059A78);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id ASPreferredCompetitionVictoryBadgeStylesForFriend(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  unsigned __int16 v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id obj;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  __int16 v87;
  _QWORD v88[4];
  __int16 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  _BYTE v100[128];
  uint64_t v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;
  uint8_t v105[128];
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  void *v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  ASLoggingInitialize();
  v5 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v3, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v107 = v7;
    v108 = 2112;
    v109 = v8;
    _os_log_impl(&dword_21381F000, v6, OS_LOG_TYPE_DEFAULT, "Computing preferred victory badge style for friend: %{public}@ - %@", buf, 0x16u);

  }
  v9 = v3;
  v98[0] = MEMORY[0x24BDAC760];
  v98[1] = 3221225472;
  v98[2] = __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke;
  v98[3] = &unk_24D0575F0;
  v65 = v9;
  v99 = v9;
  objc_msgSend(v4, "hk_filter:", v98);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ASFriendsSortedByEarliestCompetitionVictoryOrPotentialVictoryDate(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = v12;
  objc_msgSend(v12, "hk_map:", &__block_literal_global_202);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "hk_map:", &__block_literal_global_205);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ASLoggingInitialize();
  v14 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    ASFormattedSequence(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v107 = v16;
    _os_log_impl(&dword_21381F000, v15, OS_LOG_TYPE_DEFAULT, "Used badge models: %{public}@", buf, 0xCu);

  }
  ASLinearSequenceWithCount(5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ASShuffledArray(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  ASUniqueItemsInArrayPreferringLastOccurance(v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v18;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v95 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i);
        if ((objc_msgSend(v19, "containsObject:", v24) & 1) == 0)
        {
          v104 = v24;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v104, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v19);
          v26 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v26;
        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
    }
    while (v21);
  }

  ASLoggingInitialize();
  v27 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    ASFormattedSequence(v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v107 = v29;
    _os_log_impl(&dword_21381F000, v28, OS_LOG_TYPE_DEFAULT, "Preferred badge model order: %{public}@", buf, 0xCu);

  }
  v66 = v4;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v67 = v19;
  v72 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
  if (v72)
  {
    v30 = (void *)MEMORY[0x24BDBD1A8];
    v69 = *(_QWORD *)v91;
    v70 = v13;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v91 != v69)
          objc_enumerationMutation(v67);
        v77 = v31;
        v32 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v31);
        v33 = objc_msgSend(v32, "unsignedIntValue");
        v34 = MEMORY[0x24BDAC760];
        v88[0] = MEMORY[0x24BDAC760];
        v88[1] = 3221225472;
        v88[2] = __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_207;
        v88[3] = &__block_descriptor_34_e28___NSNumber_16__0__NSNumber_8l;
        v89 = v33;
        objc_msgSend(v71, "hk_map:", v88);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v86[0] = v34;
        v86[1] = 3221225472;
        v86[2] = __ASPreferredCompetitionVictoryBadgeStylesForFriend_block_invoke_2_208;
        v86[3] = &__block_descriptor_34_e28___NSNumber_16__0__NSNumber_8l;
        v73 = v33;
        v87 = v33;
        objc_msgSend(v71, "hk_map:", v86);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        ASLoggingInitialize();
        v37 = (void *)ASLogAchievements;
        if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v37;
          ASFormattedSequence(v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v107 = v32;
          v108 = 2114;
          v109 = v39;
          _os_log_impl(&dword_21381F000, v38, OS_LOG_TYPE_DEFAULT, "Used colors for badge %{public}@: %{public}@", buf, 0x16u);

        }
        ASLinearSequenceWithCount(10);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        ASShuffledArray(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v75 = v36;
        v76 = v35;
        objc_msgSend(v36, "arrayByAddingObjectsFromArray:", v35);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        ASUniqueItemsInArrayPreferringLastOccurance(v74);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v43 = v41;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v83;
          do
          {
            for (j = 0; j != v45; ++j)
            {
              if (*(_QWORD *)v83 != v46)
                objc_enumerationMutation(v43);
              v48 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
              if ((objc_msgSend(v42, "containsObject:", v48) & 1) == 0)
              {
                v101 = v48;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v101, 1);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v42);
                v50 = objc_claimAutoreleasedReturnValue();

                v42 = (void *)v50;
              }
            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
          }
          while (v45);
        }

        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v51 = v42;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v78, v100, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v79;
          do
          {
            v55 = 0;
            v56 = v30;
            do
            {
              if (*(_QWORD *)v79 != v54)
                objc_enumerationMutation(v51);
              v57 = objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * v55), "unsignedIntValue");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v57 | (v73 << 16));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "arrayByAddingObject:", v58);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              ++v55;
              v56 = v30;
            }
            while (v53 != v55);
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v78, v100, 16);
          }
          while (v53);
        }

        v31 = v77 + 1;
        v13 = v70;
      }
      while (v77 + 1 != v72);
      v72 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
    }
    while (v72);
  }
  else
  {
    v30 = (void *)MEMORY[0x24BDBD1A8];
  }

  ASLoggingInitialize();
  v59 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    v60 = v59;
    ASFormattedVictoryBadgeStyles(v30);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v107 = v61;
    _os_log_impl(&dword_21381F000, v60, OS_LOG_TYPE_DEFAULT, "Resulting preferred styles: %{public}@", buf, 0xCu);

  }
  return v30;
}

uint64_t ASBestCompetitionVictoryBadgeStyleForPreferredStyles(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t i;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  ASLoggingInitialize();
  v5 = ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21381F000, v5, OS_LOG_TYPE_DEFAULT, "Searching for best style given preferred styles", buf, 2u);
  }
  ASLoggingInitialize();
  v6 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    ASFormattedVictoryBadgeStyles(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v8;
    _os_log_impl(&dword_21381F000, v7, OS_LOG_TYPE_DEFAULT, "Styles: %@", buf, 0xCu);

  }
  ASLoggingInitialize();
  v9 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    ASFormattedVictoryBadgeStyles(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v11;
    _os_log_impl(&dword_21381F000, v10, OS_LOG_TYPE_DEFAULT, "Other styles: %@", buf, 0xCu);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v3;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    v16 = &unk_24D0679F0;
    v17 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v20 = objc_msgSend(v12, "indexOfObject:", v19);
        v21 = objc_msgSend(v4, "indexOfObject:", v19);
        v22 = (unint64_t)((double)v20 * (double)v20 + (double)v21 * (double)v21);
        if (v17 > v22)
        {
          v23 = v19;

          v17 = v22;
          v16 = v23;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v14);
  }
  else
  {
    v16 = &unk_24D0679F0;
  }

  ASLoggingInitialize();
  v24 = (void *)ASLogAchievements;
  if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = objc_msgSend(v16, "unsignedIntValue");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%d.%d]"), HIWORD(v26), (unsigned __int16)v26, (_QWORD)v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v27;
    _os_log_impl(&dword_21381F000, v25, OS_LOG_TYPE_DEFAULT, "Picked style: %@", buf, 0xCu);

  }
  v28 = objc_msgSend(v16, "unsignedIntValue");

  return v28;
}

id IDSDestinationForString(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("@")) & 1) != 0
    || objc_msgSend(v1, "containsString:", CFSTR("mailto:")))
  {
    v2 = MEMORY[0x2199B6C90](v1);
LABEL_8:
    v5 = (void *)v2;
    goto LABEL_9;
  }
  if ((objc_msgSend(v1, "containsString:", CFSTR("tel:")) & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v1, "rangeOfCharacterFromSet:", v3),
        v3,
        v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v2 = IDSCopyIDForPhoneNumber();
    goto LABEL_8;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

id _RichMessagePayload(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  _QWORD v34[7];

  v34[6] = *MEMORY[0x24BDAC8D0];
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = a2;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%ld"), a1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("type"), v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("message"), v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v13, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "queryItemWithName:value:", CFSTR("friendUUID"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("recipient"), v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%f"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("timestamp"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setScheme:", CFSTR("data"));
  objc_msgSend(v29, "setHost:", CFSTR("activity-sharing"));
  v34[0] = v18;
  v34[1] = v19;
  v34[2] = v20;
  v34[3] = v23;
  v34[4] = v24;
  v34[5] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setQueryItems:", v30);

  objc_msgSend(v29, "URL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

id ASRichMessagePayloadForAchievement(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(a1, "codableAchievement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _RichMessagePayload(1, CFSTR("achievement"), v11, v9, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id ASRichMessagePayloadForGoalCompletion(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(a1, "codableSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _RichMessagePayload(0, CFSTR("snapshot"), v11, v9, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id ASRichMessagePayloadForWorkout(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(a1, "codableWorkout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _RichMessagePayload(2, CFSTR("workout"), v11, v9, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id ASRichMessagePayloadForCompetitionAccepted(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(a1, "codableCompetition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _RichMessagePayload(3, CFSTR("competition"), v11, v9, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id ASRichMessagePayloadForCompetitionScore(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(a1, "codableCompetition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _RichMessagePayload(4, CFSTR("competition"), v11, v9, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id _FindQueryItemValue(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "queryItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v3);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v10, "value");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

id _FindQueryItemData(void *a1, void *a2)
{
  void *v2;
  void *v3;

  _FindQueryItemValue(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v2, 0);
  else
    v3 = 0;

  return v3;
}

BOOL _ASRichMessageTypeIsSupported(unint64_t a1)
{
  return a1 < 5;
}

unint64_t ASRichMessageTypeFromRichMessagePayload(void *a1)
{
  void *v1;
  void *v2;
  unint64_t v3;

  _FindQueryItemValue(CFSTR("type"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || (v3 = objc_msgSend(v1, "integerValue"), v3 >= 5))
    v3 = -1;

  return v3;
}

id ASAchievementFromRichMessagePayload(void *a1)
{
  void *v1;
  ASCodableCloudKitAchievement *v2;
  void *v3;

  _FindQueryItemData(CFSTR("achievement"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = -[ASCodableCloudKitAchievement initWithData:]([ASCodableCloudKitAchievement alloc], "initWithData:", v1);
    objc_msgSend(MEMORY[0x24BDD41E8], "fitnessFriendAchievementWithCodableAchievement:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id ASSnapshotFromRichMessagePayload(void *a1)
{
  void *v1;
  ASCodableCloudKitActivitySnapshot *v2;
  void *v3;

  _FindQueryItemData(CFSTR("snapshot"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = -[ASCodableCloudKitActivitySnapshot initWithData:]([ASCodableCloudKitActivitySnapshot alloc], "initWithData:", v1);
    objc_msgSend(MEMORY[0x24BDD41F0], "fitnessFriendActivitySnapshotWithCodableSnapshot:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id ASWorkoutFromRichMessagePayload(void *a1)
{
  void *v1;
  ASCodableCloudKitWorkout *v2;
  void *v3;

  _FindQueryItemData(CFSTR("workout"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = -[ASCodableCloudKitWorkout initWithData:]([ASCodableCloudKitWorkout alloc], "initWithData:", v1);
    objc_msgSend(MEMORY[0x24BDD41F8], "fitnessFriendWorkoutWithCodableWorkout:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id ASCompetitionFromRichMessagePayload(void *a1)
{
  void *v1;
  ASCodableCloudKitCompetition *v2;
  void *v3;

  _FindQueryItemData(CFSTR("competition"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = -[ASCodableCloudKitCompetition initWithData:]([ASCodableCloudKitCompetition alloc], "initWithData:", v1);
    +[ASCompetition competitionWithCodableCompetition:](ASCompetition, "competitionWithCodableCompetition:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id ASMessageFromRichMessagePayload(void *a1)
{
  return _FindQueryItemValue(CFSTR("message"), a1);
}

id ASRecipientAddressFromRichMessagePayload(void *a1)
{
  return _FindQueryItemValue(CFSTR("recipient"), a1);
}

id ASFriendUUIDFromRichMessagePayload(void *a1)
{
  void *v1;
  void *v2;

  _FindQueryItemValue(CFSTR("friendUUID"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v1);
  else
    v2 = 0;

  return v2;
}

id ASTimestampFromRichMessagePayload(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _FindQueryItemValue(CFSTR("timestamp"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v1, "doubleValue");
    objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id ASShuffledArray(void *a1)
{
  void *v1;
  unint64_t v2;
  unint64_t v3;
  void *v4;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  v2 = objc_msgSend(v1, "count");
  if (v2 >= 2)
  {
    do
    {
      v3 = v2 - 1;
      objc_msgSend(v1, "exchangeObjectAtIndex:withObjectAtIndex:", v2 - 1, arc4random_uniform(v2));
      v2 = v3;
    }
    while (v3 > 1);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id ASUniqueItemsInArrayPreferringLastOccurance(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v1, "reverseObjectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v6 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v8) & 1) == 0)
        {
          objc_msgSend(v6, "arrayByAddingObject:", v8);
          v9 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v9;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  objc_msgSend(v6, "reverseObjectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id ASLinearSequenceWithCount(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v2 = 0;
    v3 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "arrayByAddingObject:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      ++v2;
      v3 = v5;
    }
    while (a1 != v2);
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v5;
}

id ASFormattedSequence(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hk_map:", &__block_literal_global_5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsJoinedByString:", &stru_24D059A78);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id ASCompetitionCalculateStartDateComponentsForFriend(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  ASLoggingInitialize();
  v2 = (void *)ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(v1, "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v4;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_21381F000, v3, OS_LOG_TYPE_DEFAULT, "Computing competition start day for friend: %{public}@ - %@", (uint8_t *)&v25, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, 1, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDD44A8];
  objc_msgSend(v9, "components:fromDate:", *MEMORY[0x24BDD44A8], v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ASLoggingInitialize();
  v12 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v8;
    _os_log_impl(&dword_21381F000, v12, OS_LOG_TYPE_DEFAULT, "My next day is %@", (uint8_t *)&v25, 0xCu);
  }
  objc_msgSend(v1, "currentDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateFromComponents:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateByAddingUnit:value:toDate:options:", 16, 1, v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "components:fromDate:", v10, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  ASLoggingInitialize();
  v20 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v17;
    _os_log_impl(&dword_21381F000, v20, OS_LOG_TYPE_DEFAULT, "Friend next day is %@", (uint8_t *)&v25, 0xCu);
  }
  if (objc_msgSend(v17, "hk_isAfterDate:", v8))
    v21 = v19;
  else
    v21 = v11;
  v22 = v21;
  ASLoggingInitialize();
  v23 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v22;
    _os_log_impl(&dword_21381F000, v23, OS_LOG_TYPE_DEFAULT, "Latest day is %@", (uint8_t *)&v25, 0xCu);
  }

  return v22;
}

id ASCompetitionCalculateStartDateComponentsForFriendWithProposedStartDate(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  ASCompetitionCalculateStartDateComponentsForFriend(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "hk_isAfterDate:", v6))
    v9 = v3;
  else
    v9 = v4;
  v10 = v9;

  return v10;
}

uint64_t _ASNumberOfDaysSinceCompetitionStart()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  _HKActivityCacheDateComponentsFromCacheIndex();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _HKActivityCacheDateComponentsFromCacheIndex();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v3, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "day");
  return v8;
}

uint64_t _ASIntegerFromUserDefaultsWithDefaultValue(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (objc_class *)MEMORY[0x24BDBCF50];
  v4 = a1;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.ActivitySharing"));
  v6 = objc_msgSend(v5, "integerForKey:", v4);

  if (v6)
    a2 = v6;

  return a2;
}

id ASCompetitionDurationDateComponentsForNewCompetitions()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = _ASIntegerFromUserDefaultsWithDefaultValue(CFSTR("CompetitionDurationNumberOfDays"), 7);
  v1 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v1, "setDay:", v0);
  objc_msgSend(v1, "setMonth:", 0);
  objc_msgSend(v1, "setYear:", 0);
  objc_msgSend(v1, "setEra:", 0);
  ASLoggingInitialize();
  v2 = (void *)ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v5 = 134217984;
    v6 = objc_msgSend(v1, "day");
    _os_log_impl(&dword_21381F000, v3, OS_LOG_TYPE_DEFAULT, "Competition duration is %ld days", (uint8_t *)&v5, 0xCu);

  }
  return v1;
}

uint64_t ASCompetitionRequestHasExpired(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  v2 = _ASIntegerFromUserDefaultsWithDefaultValue(CFSTR("CompetitionRequestExpirationNumberOfSeconds"), 172800);
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 128, v2, v1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hk_isAfterOrEqualToDate:", v4);

  return v6;
}

uint64_t ASCompetitionRequestIsStillVisible(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  v2 = _ASIntegerFromUserDefaultsWithDefaultValue(CFSTR("CompetitionRequestExpirationNumberOfSeconds"), 172800);
  v3 = _ASIntegerFromUserDefaultsWithDefaultValue(CFSTR("CompetitionRequestVisibilityAfterExpirationNumberOfSeconds"), 259200)+ v2;
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 128, v3, v1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hk_isBeforeOrEqualToDate:", v5);

  return v7;
}

double ASCompetitionRequestTimeIntervalUntilExpiration(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v1 = a1;
  v2 = _ASIntegerFromUserDefaultsWithDefaultValue(CFSTR("CompetitionRequestExpirationNumberOfSeconds"), 172800);
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 128, v2, v1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  return v6;
}

unint64_t ASCompetitionRequestHoursUntilExpiration(void *a1)
{
  return llround(ASCompetitionRequestTimeIntervalUntilExpiration(a1) / 3600.0);
}

unint64_t ASCompetitionRequestMinutesUntilExpiration(void *a1)
{
  return vcvtpd_u64_f64(ASCompetitionRequestTimeIntervalUntilExpiration(a1) / 60.0);
}

uint64_t ASCompetitionIsReadyToComplete(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = a1;
  ASLoggingInitialize();
  v8 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21381F000, v8, OS_LOG_TYPE_DEFAULT, "Evaluating if competition is ready to complete", buf, 2u);
  }
  objc_msgSend(v7, "primaryRelationship");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "isCompetitionActive");
  if ((v10 & 1) == 0)
  {
    ASLoggingInitialize();
    v12 = ASLogCompetitions;
    v11 = 0;
    if (!os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v18 = 0;
    v13 = "No active competition, not ready to complete";
    v14 = (uint8_t *)&v18;
LABEL_13:
    _os_log_impl(&dword_21381F000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    v11 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(v5, "hasPushedFinalScore") & 1) == 0)
  {
    ASLoggingInitialize();
    v12 = ASLogCompetitions;
    v11 = 0;
    if (!os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v17 = 0;
    v13 = "We've not yet pushed a final score, not ready to complete";
    v14 = (uint8_t *)&v17;
    goto LABEL_13;
  }
  if ((objc_msgSend(v6, "hasPushedFinalScore") & 1) == 0)
  {
    ASLoggingInitialize();
    v12 = ASLogCompetitions;
    v11 = 0;
    if (!os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v16 = 0;
    v13 = "Opponent has not yet pushed a final score, not ready to complete";
    v14 = (uint8_t *)&v16;
    goto LABEL_13;
  }
  v11 = 1;
LABEL_14:

  return v11;
}

uint64_t _ASCompetitionScoreForActivitySummary(void *a1, unint64_t a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  unint64_t v14;

  v3 = a1;
  objc_msgSend(v3, "_activeEnergyCompletionPercentage");
  v5 = v4;
  objc_msgSend(v3, "_moveMinutesCompletionPercentage");
  v7 = v5 + v6;
  objc_msgSend(v3, "_exerciseTimeCompletionPercentage");
  v9 = v7 + v8;
  objc_msgSend(v3, "_standHoursCompletionPercentage");
  v11 = v10;

  v12 = llround((v9 + v11) * 100.0);
  v13 = fmin((double)v12, (double)a2);
  if (a2)
    v14 = (unint64_t)v13;
  else
    v14 = v12;
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
}

uint64_t ASCompetitionNeedsScoreUpdateForSummary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "startDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _HKCacheIndexFromDateComponents();

  if (objc_msgSend(v4, "isPaused"))
  {
    ASLoggingInitialize();
    v7 = ASLogCompetitions;
    v8 = 0;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v9 = "Current activity summary is paused, not updating";
      v10 = (uint8_t *)&v17;
LABEL_14:
      _os_log_impl(&dword_21381F000, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      v8 = 0;
    }
  }
  else if (objc_msgSend(v4, "_activitySummaryIndex") >= v6)
  {
    v11 = objc_msgSend(v4, "_activitySummaryIndex");
    if (v11 >= objc_msgSend(v3, "currentCacheIndex"))
    {
      v12 = objc_msgSend(v3, "currentCacheIndex");
      if (v12 >= objc_msgSend(v3, "endDateCacheIndex"))
      {
        ASLoggingInitialize();
        v7 = ASLogCompetitions;
        v8 = 0;
        if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 0;
          v9 = "Competition current cache index is greater than competition end cache index, not updating";
          v10 = (uint8_t *)&v14;
          goto LABEL_14;
        }
      }
      else
      {
        v8 = 1;
      }
    }
    else
    {
      ASLoggingInitialize();
      v7 = ASLogCompetitions;
      v8 = 0;
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 0;
        v9 = "Current activity summary index is less than competition current cache index, not updating";
        v10 = (uint8_t *)&v15;
        goto LABEL_14;
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    v7 = ASLogCompetitions;
    v8 = 0;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v9 = "Current activity summary index is less than competition start index, not updating";
      v10 = (uint8_t *)&v16;
      goto LABEL_14;
    }
  }

  return v8;
}

id ASCompetitionCalculateUpdatedScores(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HKCacheIndexFromDateComponents();

  objc_msgSend(v6, "_activitySummaryIndex");
  v29 = _ASNumberOfDaysSinceCompetitionStart();
  objc_msgSend(v7, "_activitySummaryIndex");
  v9 = _ASNumberOfDaysSinceCompetitionStart();
  objc_msgSend(v5, "endDateCacheIndex");
  v10 = _ASNumberOfDaysSinceCompetitionStart();
  v30 = v9;
  if (v10 >= v9 + 1)
    v11 = v9 + 1;
  else
    v11 = v10;
  objc_msgSend(v5, "scores");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  _ASCompetitionScoreForActivitySummary(v6, objc_msgSend(v5, "maximumNumberOfPointsPerDay"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  v32 = v7;
  _ASCompetitionScoreForActivitySummary(v7, objc_msgSend(v5, "maximumNumberOfPointsPerDay"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v13, "count") < v11)
  {
    ASLoggingInitialize();
    v16 = (void *)ASLogCompetitions;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134217984;
      v34 = v18;
      _os_log_impl(&dword_21381F000, v17, OS_LOG_TYPE_DEFAULT, "Adding score for day %lu", buf, 0xCu);

    }
    objc_msgSend(v13, "addObject:", &unk_24D067A08);
  }
  if (v29 < objc_msgSend(v13, "count"))
  {
    ASLoggingInitialize();
    v19 = ASLogCompetitions;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21381F000, v19, OS_LOG_TYPE_DEFAULT, "Updating yesterday score", buf, 2u);
    }
    v20 = objc_msgSend(v14, "unsignedIntegerValue");
    objc_msgSend(v13, "objectAtIndexedSubscript:", v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    if (v20 >= v22)
    {
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v14, v29);
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
        ASCompetitionCalculateUpdatedScores_cold_2();
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
        ASCompetitionCalculateUpdatedScores_cold_3();
    }
  }
  if (v30 < objc_msgSend(v13, "count"))
  {
    ASLoggingInitialize();
    v23 = ASLogCompetitions;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21381F000, v23, OS_LOG_TYPE_DEFAULT, "Updating today score", buf, 2u);
    }
    v24 = objc_msgSend(v15, "unsignedIntegerValue");
    objc_msgSend(v13, "objectAtIndexedSubscript:", v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedIntegerValue");

    if (v24 >= v26)
    {
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v15, v30);
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
        ASCompetitionCalculateUpdatedScores_cold_2();
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
        ASCompetitionCalculateUpdatedScores_cold_1();
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t ASCompetitionCalculateTotalScore(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hk_foldRightFrom:with:", &unk_24D067A08, &__block_literal_global_6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

unint64_t ASCompetitionCalculateDailyAverageScore(void *a1)
{
  id v1;
  unint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
    v2 = llround((float)((float)(unint64_t)ASCompetitionCalculateTotalScore(v1)
                       / (float)(unint64_t)objc_msgSend(v1, "count")));
  else
    v2 = 0;

  return v2;
}

uint64_t ASCompetitionDailyScoreForParticipantWithCacheIndex(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a1;
  objc_msgSend(v3, "startDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HKCacheIndexFromDateComponents();

  if (a2)
    objc_msgSend(v3, "opponentScores");
  else
    objc_msgSend(v3, "scores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = _ASNumberOfDaysSinceCompetitionStart();
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

  }
  return v8;
}

uint64_t ASCompetitionCurrentScoreDelta(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "myTotalScore");
  v3 = objc_msgSend(v1, "opponentTotalScore");

  if (v2 - v3 >= 0)
    return v2 - v3;
  else
    return v3 - v2;
}

BOOL ASCompetitionScoresAreWithinClosenessThreshold(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  _BOOL8 v4;

  v1 = a1;
  v2 = vcvtmd_u64_f64((double)(unint64_t)objc_msgSend(v1, "opponentTotalScore") * 0.97);
  v3 = objc_msgSend(v1, "opponentTotalScore");
  v4 = objc_msgSend(v1, "myTotalScore") > v2 && objc_msgSend(v1, "myTotalScore") < vcvtpd_u64_f64((double)v3 * 1.03);

  return v4;
}

id ASCompetitionDayWithHighestScoreForParticipant(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a1;
  v4 = v3;
  if (a2)
    objc_msgSend(v3, "opponentScores");
  else
    objc_msgSend(v3, "scores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_11;
  v6 = 0;
  v7 = 0;
  v8 = -1;
  do
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (v10 > v7)
    {
      v7 = v10;
      v8 = v6;
    }
    ++v6;
  }
  while (v6 < objc_msgSend(v5, "count"));
  if (v7 > 299)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, v8, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_11:
    v13 = 0;
  }

  return v13;
}

id ASCompetitionWinningDayWithHighestScoreForParticipant(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = v3;
  if (a2)
    objc_msgSend(v3, "opponentScores");
  else
    objc_msgSend(v3, "scores");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daysWonByParticipant:", a2);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v4;
        objc_msgSend(v4, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "components:fromDate:toDate:options:", 16, v14, v11, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v15, "day"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        if (v17 > v8)
        {
          v18 = v11;

          v7 = v18;
          v8 = v17;
        }

        v4 = v13;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t ASCompetitionMaximumPointsPerDayForNewCompetitions()
{
  uint64_t v0;
  NSObject *v1;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v0 = _ASIntegerFromUserDefaultsWithDefaultValue(CFSTR("CompetitionMaximumPointsPerDay"), 600);
  ASLoggingInitialize();
  v1 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134217984;
    v4 = v0;
    _os_log_impl(&dword_21381F000, v1, OS_LOG_TYPE_DEFAULT, "Competition max num points per day is %lu", (uint8_t *)&v3, 0xCu);
  }
  return v0;
}

uint64_t ASCompetitionWinCountForParticipant(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __ASCompetitionWinCountForParticipant_block_invoke;
  v5[3] = &__block_descriptor_40_e23_B16__0__ASCompetition_8l;
  v5[4] = a2;
  objc_msgSend(a1, "hk_filter:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

uint64_t ASDidLosePreviousCompetitionWithFriend(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "completedCompetitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    objc_msgSend(v1, "completedCompetitions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "completedCompetitions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v5, "count") - 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v6, "isParticipantWinning:", 1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL ASCompetitionParticipantHasCrossedMercyThresholdOnLastDayForCompetition(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "opponentTotalScore");
    v6 = objc_msgSend(v4, "myTotalScore");
  }
  else
  {
    v5 = objc_msgSend(v3, "myTotalScore");
    v6 = objc_msgSend(v4, "opponentTotalScore");
  }
  v7 = v6;
  if (objc_msgSend(v4, "isDailyScoreCapped"))
    v8 = objc_msgSend(v4, "maximumNumberOfPointsPerDay");
  else
    v8 = ASCompetitionMaximumPointsPerDayForNewCompetitions();
  v9 = v8;
  v10 = a1 == 0;
  objc_msgSend(v4, "lastDayOfCompetition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "dailyScoreForParticipant:onDate:", a1, v11);

  objc_msgSend(v4, "lastDayOfCompetition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "dailyScoreForParticipant:onDate:", v10, v13);

  return v7 + v12 - v5 - v14 > v9;
}

uint64_t ASFriendsWithCompetitionsStartingToday(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hk_filter:", &__block_literal_global_12);
}

uint64_t ASFriendsWithCompetitionsEndingToday(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hk_filter:", &__block_literal_global_13);
}

uint64_t _ASFriendsSortedByComparator(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a1;
  v6 = a2;
  v7 = (*(uint64_t (**)(uint64_t, id, id))(a3 + 16))(a3, v5, v6);
  if (!v7)
  {
    objc_msgSend(v5, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uppercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "compare:", v11);

    if (!v7)
    {
      objc_msgSend(v5, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v13, "compare:", v15);

    }
  }

  return v7;
}

uint64_t ASFriendsSortedByEarliestCompetitionVictoryOrPotentialVictoryDate(void *a1, const char *a2)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_15);
}

uint64_t ASFriendsSortedByCompetitionEndDate(void *a1, const char *a2)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_17);
}

id ASFriendsSortedByCompetitionEndDateForFirstGlanceType(void *a1, uint64_t a2)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = a2 & 0xFFFFFFFFFFFFFFFELL;
  objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 != 2)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v3);
    objc_msgSend(v3, "hk_filter:", &__block_literal_global_12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v4, "removeObject:", v10);
          objc_msgSend(v4, "insertObject:atIndex:", v10, 0);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
  }
  return v3;
}

uint64_t ASCompetitionsSortedByEndDate(void *a1, const char *a2)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_21);
}

uint64_t ASValidateEligibilityForOutgoingCompetitionRequest(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(v3, "primaryRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryRemoteRelationship");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_msgSend(v4, "isCompetitionActive") & 1) != 0 || objc_msgSend(v5, "isCompetitionActive"))
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
        ASValidateEligibilityForOutgoingCompetitionRequest_cold_2();
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = 3;
    }
    else if (objc_msgSend(v4, "isHidingActivityData"))
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
        ASValidateEligibilityForOutgoingCompetitionRequest_cold_3();
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = 7;
    }
    else
    {
      if ((objc_msgSend(v5, "supportsCompetitions") & 1) != 0)
      {
        v10 = 1;
        goto LABEL_15;
      }
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
        ASValidateEligibilityForOutgoingCompetitionRequest_cold_4();
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = 8;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
      ASValidateEligibilityForOutgoingCompetitionRequest_cold_1();
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = 1;
  }
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivitySharing"), v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v9 = objc_retainAutorelease(v8);
      *a2 = v9;
    }
    else
    {
      _HKLogDroppedError();
    }
  }

  v10 = 0;
LABEL_15:

  return v10;
}

uint64_t ASValidateEligibilityForIncomingCompetitionRequest(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  v3 = a1;
  objc_msgSend(v3, "primaryRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryRemoteRelationship");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
      ASValidateEligibilityForIncomingCompetitionRequest_cold_1();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivitySharing"), 1, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_23;
    if (a2)
      goto LABEL_22;
LABEL_13:
    _HKLogDroppedError();
    goto LABEL_23;
  }
  if (!objc_msgSend(v4, "isFriendshipActive") || (objc_msgSend(v5, "isFriendshipActive") & 1) == 0)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
      ASValidateEligibilityForIncomingCompetitionRequest_cold_3();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivitySharing"), 2, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v6);
      else
        _HKLogDroppedError();
    }

  }
  if ((objc_msgSend(v4, "isCompetitionActive") & 1) == 0 && !objc_msgSend(v5, "isCompetitionActive"))
  {
    v8 = 1;
    goto LABEL_24;
  }
  ASLoggingInitialize();
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
    ASValidateEligibilityForOutgoingCompetitionRequest_cold_2();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivitySharing"), 3, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
    {
LABEL_22:
      v7 = objc_retainAutorelease(v7);
      *a2 = v7;
      goto LABEL_23;
    }
    goto LABEL_13;
  }
LABEL_23:

  v8 = 0;
LABEL_24:

  return v8;
}

uint64_t ASValidateEligibilityForAcceptingCompetitionRequest(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(v3, "primaryRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if ((objc_msgSend(v4, "hasIncomingCompetitionRequest") & 1) != 0)
    {
      if (objc_msgSend(v5, "isCompetitionActive"))
      {
        ASLoggingInitialize();
        if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
          ASValidateEligibilityForAcceptingCompetitionRequest_cold_2();
        v6 = (void *)MEMORY[0x24BDD1540];
        v7 = 3;
      }
      else
      {
        if (!objc_msgSend(v5, "isHidingActivityData"))
        {
          v10 = 1;
          goto LABEL_22;
        }
        ASLoggingInitialize();
        if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
          ASValidateEligibilityForOutgoingCompetitionRequest_cold_3();
        v6 = (void *)MEMORY[0x24BDD1540];
        v7 = 7;
      }
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
        ASValidateEligibilityForAcceptingCompetitionRequest_cold_4();
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = 0;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
      ASValidateEligibilityForAcceptingCompetitionRequest_cold_1();
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = 1;
  }
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivitySharing"), v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v9 = objc_retainAutorelease(v8);
      *a2 = v9;
    }
    else
    {
      _HKLogDroppedError();
    }
  }

  v10 = 0;
LABEL_22:

  return v10;
}

id ASCompetitionsEligibleForArchival(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  v1 = a1;
  ASLoggingInitialize();
  v2 = ASLogCompetitions;
  if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21381F000, v2, OS_LOG_TYPE_DEFAULT, "Validating competitions for archival", v5, 2u);
  }
  objc_msgSend(v1, "hk_filter:", &__block_literal_global_23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t ASIgnoredMostRecentCompetitionRequestFromContact(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  objc_msgSend(v1, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasIgnoredCompetitionRequest"))
  {
    objc_msgSend(v2, "dateForLatestIgnoredCompetitionRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "primaryRemoteRelationship");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateForLatestOutgoingCompetitionRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v3, "hk_isAfterDate:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t ASPairedDeviceSupportsCompetitions()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getPairedDevices");
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        NRWatchOSVersionForRemoteDevice();
        if ((NRVersionIsGreaterThanOrEqual() & 1) != 0)
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

NSString *ASClientTaskIdentifier()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

uint64_t ASServerInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D153A8);
}

uint64_t ASCodableCloudKitActivitySnapshotReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  unint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  ASCodableCloudKitSample *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t result;
  uint64_t v78;
  uint64_t v79;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x254D05000uLL;
  v8 = 0x254D05000uLL;
  v9 = (int *)MEMORY[0x24BE7AF30];
  v10 = 0x254D05000uLL;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *v3;
      v15 = *(_QWORD *)(a2 + v14);
      v16 = v15 + 1;
      if (v15 == -1 || v16 > *(_QWORD *)(a2 + *v4))
        break;
      v17 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v15);
      *(_QWORD *)(a2 + v14) = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0)
        goto LABEL_12;
      v11 += 7;
      v18 = v12++ >= 9;
      if (v18)
      {
        v13 = 0;
        v19 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v19 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v13 = 0;
LABEL_14:
    if (v19 || (v13 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    v21 = v13 >> 3;
    if ((int)(v13 >> 3) > 40)
    {
      if ((int)v21 <= 60)
      {
        if ((int)v21 > 50)
        {
          if ((_DWORD)v21 == 51)
          {
            *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x800u;
            v71 = *v3;
            v72 = *(_QWORD *)(a2 + v71);
            if (v72 <= 0xFFFFFFFFFFFFFFF7 && v72 + 8 <= *(_QWORD *)(a2 + *v4))
            {
              v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v72);
              *(_QWORD *)(a2 + v71) = v72 + 8;
            }
            else
            {
              *(_BYTE *)(a2 + *v5) = 1;
              v28 = 0;
            }
            v79 = 96;
          }
          else
          {
            if ((_DWORD)v21 != 60)
              goto LABEL_103;
            *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x200u;
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
            {
              v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 8;
            }
            else
            {
              *(_BYTE *)(a2 + *v5) = 1;
              v28 = 0;
            }
            v79 = 80;
          }
        }
        else if ((_DWORD)v21 == 41)
        {
          *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 2u;
          v61 = *v3;
          v62 = *(_QWORD *)(a2 + v61);
          if (v62 <= 0xFFFFFFFFFFFFFFF7 && v62 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v62);
            *(_QWORD *)(a2 + v61) = v62 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v28 = 0;
          }
          v79 = 16;
        }
        else
        {
          if ((_DWORD)v21 != 50)
            goto LABEL_103;
          *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x2000u;
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v28 = 0;
          }
          v79 = 112;
        }
        goto LABEL_144;
      }
      if ((int)v21 > 70)
      {
        if ((_DWORD)v21 == 71)
        {
          *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x80u;
          v75 = *v3;
          v76 = *(_QWORD *)(a2 + v75);
          if (v76 <= 0xFFFFFFFFFFFFFFF7 && v76 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v76);
            *(_QWORD *)(a2 + v75) = v76 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v28 = 0;
          }
          v79 = 64;
LABEL_144:
          *(_QWORD *)(a1 + v79) = v28;
          goto LABEL_145;
        }
        if ((_DWORD)v21 != 72)
        {
LABEL_103:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          goto LABEL_145;
        }
        v37 = 0;
        v38 = 0;
        v39 = 0;
        *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 4u;
        while (1)
        {
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          v42 = v41 + 1;
          if (v41 == -1 || v42 > *(_QWORD *)(a2 + *v4))
            break;
          v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v41);
          *(_QWORD *)(a2 + v40) = v42;
          v39 |= (unint64_t)(v43 & 0x7F) << v37;
          if ((v43 & 0x80) == 0)
            goto LABEL_106;
          v37 += 7;
          v18 = v38++ >= 9;
          if (v18)
          {
            v39 = 0;
            goto LABEL_108;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_106:
        if (*(_BYTE *)(a2 + *v5))
          v39 = 0;
LABEL_108:
        v78 = 24;
      }
      else
      {
        if ((_DWORD)v21 != 61)
        {
          if ((_DWORD)v21 != 70)
            goto LABEL_103;
          *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x100u;
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v28 = 0;
          }
          v79 = 72;
          goto LABEL_144;
        }
        v65 = 0;
        v66 = 0;
        v39 = 0;
        *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x4000u;
        while (1)
        {
          v67 = *v3;
          v68 = *(_QWORD *)(a2 + v67);
          v69 = v68 + 1;
          if (v68 == -1 || v69 > *(_QWORD *)(a2 + *v4))
            break;
          v70 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v68);
          *(_QWORD *)(a2 + v67) = v69;
          v39 |= (unint64_t)(v70 & 0x7F) << v65;
          if ((v70 & 0x80) == 0)
            goto LABEL_118;
          v65 += 7;
          v18 = v66++ >= 9;
          if (v18)
          {
            v39 = 0;
            goto LABEL_120;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_118:
        if (*(_BYTE *)(a2 + *v5))
          v39 = 0;
LABEL_120:
        v78 = 120;
      }
LABEL_121:
      *(_QWORD *)(a1 + v78) = v39;
      goto LABEL_145;
    }
    if ((int)v21 > 20)
    {
      if ((int)v21 > 30)
      {
        if ((_DWORD)v21 == 31)
        {
          *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x10u;
          v73 = *v3;
          v74 = *(_QWORD *)(a2 + v73);
          if (v74 <= 0xFFFFFFFFFFFFFFF7 && v74 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v74);
            *(_QWORD *)(a2 + v73) = v74 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v28 = 0;
          }
          v79 = 40;
        }
        else
        {
          if ((_DWORD)v21 != 40)
            goto LABEL_103;
          *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 1u;
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v28 = 0;
          }
          v79 = 8;
        }
      }
      else if ((_DWORD)v21 == 21)
      {
        *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x40u;
        v63 = *v3;
        v64 = *(_QWORD *)(a2 + v63);
        if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v64);
          *(_QWORD *)(a2 + v63) = v64 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        v79 = 56;
      }
      else
      {
        if ((_DWORD)v21 != 30)
          goto LABEL_103;
        *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 8u;
        v29 = *v3;
        v30 = *(_QWORD *)(a2 + v29);
        if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v30);
          *(_QWORD *)(a2 + v29) = v30 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        v79 = 32;
      }
      goto LABEL_144;
    }
    switch((int)v21)
    {
      case 1:
        v22 = v7;
        v23 = v10;
        v24 = v8;
        v25 = objc_alloc_init(ASCodableCloudKitSample);
        objc_storeStrong((id *)(a1 + 128), v25);
        if (PBReaderPlaceMark() && (ASCodableCloudKitSampleReadFrom((uint64_t)v25, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v8 = v24;
          v10 = v23;
          v7 = v22;
LABEL_145:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 2:
        PBReaderReadData();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = *(int *)(v10 + 3168);
        v48 = *(void **)(a1 + v47);
        *(_QWORD *)(a1 + v47) = v46;

        goto LABEL_145;
      case 3:
        v49 = 0;
        v50 = 0;
        v39 = 0;
        *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x400u;
        while (2)
        {
          v51 = *v3;
          v52 = *(_QWORD *)(a2 + v51);
          v53 = v52 + 1;
          if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v52);
            *(_QWORD *)(a2 + v51) = v53;
            v39 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              v18 = v50++ >= 9;
              if (v18)
              {
                v39 = 0;
                goto LABEL_112;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v39 = 0;
LABEL_112:
        v78 = 88;
        goto LABEL_121;
      case 4:
        v55 = 0;
        v56 = 0;
        v39 = 0;
        *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x1000u;
        while (2)
        {
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          v59 = v58 + 1;
          if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v58);
            *(_QWORD *)(a2 + v57) = v59;
            v39 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              v18 = v56++ >= 9;
              if (v18)
              {
                v39 = 0;
                goto LABEL_116;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v39 = 0;
LABEL_116:
        v78 = 104;
        goto LABEL_121;
      default:
        if ((_DWORD)v21 != 20)
          goto LABEL_103;
        *(_WORD *)(a1 + *(int *)(v7 + 3172)) |= 0x20u;
        v44 = *v3;
        v45 = *(_QWORD *)(a2 + v44);
        if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v45);
          *(_QWORD *)(a2 + v44) = v45 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        v79 = *(int *)(v8 + 3184);
        goto LABEL_144;
    }
  }
}

uint64_t ASCodableDatabaseCompetitionListEntryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_30;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_41:
          v32 = 16;
          goto LABEL_46;
        case 3u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
LABEL_30:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 4u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v29 = *v3;
        v30 = *(_QWORD *)(a2 + v29);
        if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          break;
        v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
        *(_QWORD *)(a2 + v29) = v30 + 1;
        v22 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0)
          goto LABEL_43;
        v27 += 7;
        v14 = v28++ >= 9;
        if (v14)
        {
          v22 = 0;
          goto LABEL_45;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_45:
      v32 = 8;
LABEL_46:
      *(_QWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASCodableCloudKitSampleReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t result;
  uint64_t v27;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(_BYTE *)(a1 + 32) |= 1u;
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        v27 = 8;
      }
      else
      {
        if ((_DWORD)v18 != 2)
        {
          if ((_DWORD)v18 == 1)
          {
            PBReaderReadData();
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = *(void **)(a1 + 24);
            *(_QWORD *)(a1 + 24) = v19;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        *(_BYTE *)(a1 + 32) |= 2u;
        v21 = *v3;
        v22 = *(_QWORD *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        v27 = 16;
      }
      *(_QWORD *)(a1 + v27) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ASCodableMigrationAvailableItemContainerReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ASCodableCloudKitMigrationAvailableItem *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ASCodableCloudKitMigrationAvailableItem);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !ASCodableCloudKitMigrationAvailableItemReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(ASCodableCloudKitMigrationAvailableItem **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id ASSnapshotDictionaryByIndex(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[ASSampleCollector sampleDictionaryByIndex:sampleIndexBlock:](ASSampleCollector, "sampleDictionaryByIndex:sampleIndexBlock:", a1, &__block_literal_global_7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7), (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BDD41F0];
        objc_msgSend(v8, "allObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_mostSignificantSnapshotAmongSnapshots:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v11, "snapshotIndex"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v11, v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id ASWorkoutDictionaryByIndex(uint64_t a1)
{
  return +[ASSampleCollector sampleDictionaryByIndex:sampleIndexBlock:](ASSampleCollector, "sampleDictionaryByIndex:sampleIndexBlock:", a1, &__block_literal_global_10);
}

id ASAchievementDictionaryByIndex(uint64_t a1)
{
  return +[ASSampleCollector sampleDictionaryByIndex:sampleIndexBlock:](ASSampleCollector, "sampleDictionaryByIndex:sampleIndexBlock:", a1, &__block_literal_global_12_0);
}

BOOL ASCodableSecureCloudShareItemReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 8;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ASCodableFinalizeHandshakeReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  ASCodableShareLocations *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        v19 = objc_alloc_init(ASCodableShareLocations);
        objc_storeStrong((id *)(a1 + 24), v19);
        if (!PBReaderPlaceMark() || !ASCodableShareLocationsReadFrom((uint64_t)v19, a2))
          goto LABEL_33;
LABEL_27:
        PBReaderRecallMark();
        goto LABEL_28;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(ASCodableShareLocations **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v18;
LABEL_28:

        goto LABEL_30;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_30:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v19 = objc_alloc_init(ASCodableActivityDataPreview);
    objc_storeStrong((id *)(a1 + 8), v19);
    if (!PBReaderPlaceMark() || (ASCodableActivityDataPreviewReadFrom((uint64_t)v19, a2) & 1) == 0)
    {
LABEL_33:

      return 0;
    }
    goto LABEL_27;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASCodableBulletinReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 80) |= 4u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_46;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_48;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_48:
          v38 = 24;
          goto LABEL_53;
        case 2u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 64;
          goto LABEL_34;
        case 3u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 48;
          goto LABEL_34;
        case 4u:
          PBReaderReadData();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 40;
          goto LABEL_34;
        case 5u:
          PBReaderReadData();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 32;
          goto LABEL_34;
        case 6u:
          PBReaderReadData();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 72;
          goto LABEL_34;
        case 7u:
          PBReaderReadData();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 56;
LABEL_34:
          v28 = *(void **)(a1 + v27);
          *(_QWORD *)(a1 + v27) = v26;

          continue;
        case 8u:
          *(_BYTE *)(a1 + 80) |= 2u;
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v31 = 0;
          }
          *(_QWORD *)(a1 + 16) = v31;
          continue;
        case 9u:
          v32 = 0;
          v33 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 80) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        v36 = v35 + 1;
        if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v36;
        v20 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_50;
        v32 += 7;
        v15 = v33++ >= 9;
        if (v15)
        {
          v20 = 0;
          goto LABEL_52;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
      if (*(_BYTE *)(a2 + *v5))
        v20 = 0;
LABEL_52:
      v38 = 8;
LABEL_53:
      *(_QWORD *)(a1 + v38) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASCodableDatabaseCompetitionPreferredVictoryBadgeStylesReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  BOOL v13;
  int v14;
  int v15;
  uint64_t result;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v6 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *v3;
        v11 = *(_QWORD *)(a2 + v10);
        if (v11 == -1 || v11 >= *(_QWORD *)(a2 + *v4))
          break;
        v12 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v11);
        *(_QWORD *)(a2 + v10) = v11 + 1;
        v9 |= (unint64_t)(v12 & 0x7F) << v7;
        if ((v12 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        v13 = v8++ >= 9;
        if (v13)
        {
          v9 = 0;
          v14 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v14 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v9 = 0;
LABEL_14:
      v15 = v9 & 7;
      if (v14 || v15 == 4)
        break;
      if ((v9 >> 3) == 1)
      {
        if (v15 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if (v23 < 0)
              {
                v18 += 7;
                v13 = v19++ >= 9;
                if (!v13)
                  continue;
              }
              goto LABEL_31;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v24 = 0;
          v25 = 0;
          v26 = 0;
          while (1)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
              break;
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              v13 = v25++ >= 9;
              if (!v13)
                continue;
            }
            goto LABEL_43;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
          PBRepeatedInt32Add();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASCodableDatabaseCompetitionScoreReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  BOOL v13;
  int v14;
  int v15;
  uint64_t result;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v6 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *v3;
        v11 = *(_QWORD *)(a2 + v10);
        if (v11 == -1 || v11 >= *(_QWORD *)(a2 + *v4))
          break;
        v12 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v11);
        *(_QWORD *)(a2 + v10) = v11 + 1;
        v9 |= (unint64_t)(v12 & 0x7F) << v7;
        if ((v12 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        v13 = v8++ >= 9;
        if (v13)
        {
          v9 = 0;
          v14 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v14 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v9 = 0;
LABEL_14:
      v15 = v9 & 7;
      if (v14 || v15 == 4)
        break;
      if ((v9 >> 3) == 1)
      {
        if (v15 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if (v23 < 0)
              {
                v18 += 7;
                v13 = v19++ >= 9;
                if (!v13)
                  continue;
              }
              goto LABEL_31;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedInt64Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v24 = 0;
          v25 = 0;
          v26 = 0;
          while (1)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
              break;
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              v13 = v25++ >= 9;
              if (!v13)
                continue;
            }
            goto LABEL_43;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
          PBRepeatedInt64Add();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _IsNotificationEventDateBeforeRelationshipBeganWithFriend(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "isFriendshipCurrentlyActive")
    && (objc_msgSend(v4, "dateForLatestRelationshipStart"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_msgSend(v4, "dateForLatestRelationshipStart");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "hk_isBeforeDate:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

__CFString *ASAchievementPathComponentForTemplate(void *a1)
{
  __CFString *v1;
  const char *v2;
  __CFString *v3;
  __CFString *v4;

  v1 = a1;
  if (ASIsCompetitionVictoryTemplate(v1, v2))
    v3 = CFSTR("CompetitionVictory");
  else
    v3 = v1;
  v4 = v3;

  return v4;
}

id ASBundlePathForTemplate(void *a1)
{
  void *v1;
  void *v2;

  ASAchievementPathComponentForTemplate(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/System/Library/Health/Assets/ActivitySharingAssets.bundle"), "stringByAppendingPathComponent:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id ASBundleURLForResource(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  ASBundlePathForTemplate(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id ASCompetitionVictoryPropertyListPathForStyle(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("color_%d"), ASCompetitionVictoryBadgeColorFromStyle(a1));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDBCF48];
  ASBundlePathForTemplate(CFSTR("CompetitionVictory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ASCompetitionVictoryResourcePathForStyle(unsigned int a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("badgemodel_%d"), ASCompetitionVictoryBadgeModelFromStyle(a1));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  ASBundleURLForResource(CFSTR("CompetitionVictory"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id ASAchievementLocalizationPathForTemplate(void *a1)
{
  return ASBundleURLForResource(a1, CFSTR("localization"));
}

id ASCompetitionParticipationResourcePath()
{
  return ASBundleURLForResource(CFSTR("CompetitionParticipation"), CFSTR("badgemodel"));
}

id ASFriendAchievementFromTemplateAndEarnedInstance(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earnedDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0.0;
  if (v9)
  {
    objc_msgSend(v3, "canonicalUnit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "canonicalUnit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isCompatibleWithUnit:", v13);

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v4, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "canonicalUnit");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValueForUnit:", v16);
        v10 = v17;

      }
      else
      {
        ASLoggingInitialize();
        v33 = ASLogAchievements;
        if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_ERROR))
          ASFriendAchievementFromTemplateAndEarnedInstance_cold_5(v33, v34, v35, v36, v37, v38, v39, v40);
        ASLoggingInitialize();
        v41 = ASLogAchievements;
        if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_ERROR))
          ASFriendAchievementFromTemplateAndEarnedInstance_cold_1((uint64_t)v3, v41, v42, v43, v44, v45, v46, v47);
        ASLoggingInitialize();
        v48 = ASLogAchievements;
        if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_ERROR))
          ASFriendAchievementFromTemplateAndEarnedInstance_cold_3((uint64_t)v4, v48, v49, v50, v51, v52, v53, v54);
      }
    }
    else
    {
      ASLoggingInitialize();
      v18 = ASLogAchievements;
      if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_ERROR))
        ASFriendAchievementFromTemplateAndEarnedInstance_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
      ASLoggingInitialize();
      v26 = ASLogAchievements;
      if (os_log_type_enabled((os_log_t)ASLogAchievements, OS_LOG_TYPE_ERROR))
        ASFriendAchievementFromTemplateAndEarnedInstance_cold_1((uint64_t)v3, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  v55 = (void *)MEMORY[0x24BDD41E8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "achievementWithTemplateUniqueName:completedDate:value:friendUUID:", v5, v8, v56, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

id ASEphemeralEarnedAchievement(void *a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = (objc_class *)MEMORY[0x24BE01830];
  v7 = a3;
  v8 = a2;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v5, "template");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTemplateUniqueName:", v11);

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:", *MEMORY[0x24BE012A8], v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setEarnedDateComponents:", v13);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCreatedDate:", v14);

  v15 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(v5, "template");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "canonicalUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v19 = v18;

  objc_msgSend(v15, "quantityWithUnit:doubleValue:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:", v20);

  if (ACHShouldUseNewAwardsSystem())
  {
    objc_msgSend(v5, "shallowCopyWithRelevantEarnedInstance:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shallowCopyReplacingEarnedInstances:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

id ASEphemeralEarnedAchievementForFriendAchievement(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "completedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ASEphemeralEarnedAchievement(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ASEphemeralCompetitionVictoryAchievementForStyle(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  ASCompetitionVictoryTemplateForFriend(a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ACHShouldUseNewAwardsSystem();
  v5 = objc_alloc(MEMORY[0x24BE017A8]);
  if (v4)
    v6 = objc_msgSend(v5, "initWithTemplate:relevantEarnedInstance:earnedInstanceCount:", v3, 0, 0);
  else
    v6 = objc_msgSend(v5, "initWithTemplate:earnedInstances:", v3, MEMORY[0x24BDBD1A8]);
  v7 = (void *)v6;
  ASCompetitionVictoryResourcePathForStyle(a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResourceBundleURL:", v8);

  ASCompetitionVictoryPropertyListPathForStyle(a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertyListBundleURL:", v9);

  objc_msgSend(v3, "uniqueName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ASBundleURLForResource(v10, CFSTR("localization"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizationBundleURL:", v11);

  ACHApplyBadgePropertiesToAchievement();
  return v7;
}

id ASEphemeralCompetitionVictoryAchievementForFriendAchievement(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  objc_msgSend(v1, "templateUniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ASCompetitionVictoryFriendUUIDFromTemplate(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ASEphemeralCompetitionVictoryAchievementForStyle(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id ASAchievementThumbnailPathForStyle(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = ASCompetitionVictoryBadgeColorFromStyle(a1);
  ASCompetitionVictoryResourcePathForStyle(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
    v7 = CFSTR("LargeThumbnails");
  else
    v7 = CFSTR("SmallThumbnails");
  objc_msgSend(v5, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BadgeThumbnail_%d.png"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filePathURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id ASBuildFriendAchievementsToShare(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  _HKStartDateForSnapshotIndex();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ASLoggingInitialize();
  v5 = ASLogActivityData;
  if (os_log_type_enabled((os_log_t)ASLogActivityData, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v15 = a2;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_21381F000, v5, OS_LOG_TYPE_DEFAULT, "Looking for achievements for snapshot index: %lld, date: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __ASBuildFriendAchievementsToShare_block_invoke;
  v11[3] = &unk_24D057F38;
  v12 = v6;
  v13 = v4;
  v7 = v4;
  v8 = v6;
  objc_msgSend(v3, "hk_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t ASCacheIndexForLocalDate(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = ASCacheIndexForLocalDate_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ASCacheIndexForLocalDate_onceToken, &__block_literal_global_9);
  v3 = _HKCacheIndexFromDate();

  return v3;
}

void ASCleanSnapshotForUpload(void *a1)
{
  id v1;

  v1 = a1;
  if (objc_msgSend(v1, "amm") == 2)
  {
    objc_msgSend(v1, "setEnergyBurned:", 0.0);
    objc_msgSend(v1, "setEnergyBurnedGoal:", 0.0);
  }

}

double _ASMoveValueForSnapshot(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  if (objc_msgSend(v1, "isAmm"))
    objc_msgSend(v1, "mmv");
  else
    objc_msgSend(v1, "energyBurned");
  v3 = v2;

  return v3;
}

double _ASMoveGoalForSnapshot(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  if (objc_msgSend(v1, "isAmm"))
    objc_msgSend(v1, "mmg");
  else
    objc_msgSend(v1, "energyBurnedGoal");
  v3 = v2;

  return v3;
}

BOOL ASAllGoalsMetForSnapshot(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;

  v1 = a1;
  objc_msgSend(v1, "activeHours");
  v3 = v2;
  objc_msgSend(v1, "activeHoursGoal");
  v9 = v3 >= v4
    && (objc_msgSend(v1, "briskMinutes"), v6 = v5, objc_msgSend(v1, "briskMinutesGoal"), v6 >= v7)
    && (v8 = _ASMoveGoalForSnapshot(v1), v8 > 0.0)
    && _ASMoveValueForSnapshot(v1) >= v8;

  return v9;
}

uint64_t _CacheIndexForDayWithOffsetFromCurrentDay(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, -a1, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _HKActivityCacheDateComponentsFromDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _HKCacheIndexFromDateComponents();

  return v7;
}

id _ActivitySnapshot(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, uint64_t a14)
{
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v24 = a3;
  v25 = a2;
  v26 = _CacheIndexForDayWithOffsetFromCurrentDay(a1);
  _HKStartDateForSnapshotIndex();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dateByAddingTimeInterval:", (double)arc4random_uniform(0x15180u));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x24BDD41F0];
  _HKEndDateForSnapshotIndex();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_fitnessFriendActivitySnapshotWithFriendUUID:sourceUUID:startDate:endDate:snapshotIndex:snapshotUploadedDate:", v25, v24, v27, v30, v26, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setEnergyBurned:", a9);
  objc_msgSend(v31, "setEnergyBurnedGoal:", a10);
  objc_msgSend(v31, "setMmv:", a11);
  objc_msgSend(v31, "setMmg:", a12);
  objc_msgSend(v31, "setBriskMinutes:", (double)a4);
  objc_msgSend(v31, "setBriskMinutesGoal:", (double)a5);
  objc_msgSend(v31, "setActiveHours:", (double)a6);
  objc_msgSend(v31, "setActiveHoursGoal:", (double)a7);
  v32 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "quantityWithUnit:doubleValue:", v33, a13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setStepCount:", (double)a8);
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValueForUnit:", v35);
  objc_msgSend(v31, "setWalkingAndRunningDistance:");

  objc_msgSend(v31, "setPushCount:", (double)a8);
  objc_msgSend(v31, "setAmm:", a14);

  return v31;
}

id _CreatePedestrianWorkout(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  double v26;
  void *v27;
  void *v28;
  uint64_t v30;
  id v31;
  void *v34;

  v31 = a1;
  _CacheIndexForDayWithOffsetFromCurrentDay(a2);
  _HKStartDateForSnapshotIndex();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dateByAddingTimeInterval:", (double)(arc4random_uniform(0xFD20u) + 21600));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD41F8];
  v12 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13, a6 * 100.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "quantityWithUnit:doubleValue:", v16, a6 * 100.0 * 0.6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "quantityWithUnit:doubleValue:", v19, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v30) = 1;
  objc_msgSend(v11, "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", a3, v31, v9, v10, v14, v17, a5, v20, *MEMORY[0x24BDD4500], 0, CFSTR("com.apple.SessionTrackerApp"), v30, 0, 0, 1,
    0,
    0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setGoalType:", a4);
  if (a4 == 2)
  {
    v27 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v27;
    v25 = v23;
    v26 = a5;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v22 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22;
    v25 = v23;
    v26 = a6;
LABEL_5:
    objc_msgSend(v24, "quantityWithUnit:doubleValue:", v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setGoal:", v28);

  }
  return v21;
}

id _CreateFitnessJrWorkout(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  id v11;
  void *v12;
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
  double v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;

  v11 = a1;
  _CacheIndexForDayWithOffsetFromCurrentDay(a2);
  _HKStartDateForSnapshotIndex();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dateByAddingTimeInterval:", (double)(arc4random_uniform(0xFD20u) + 21600));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD41F8];
  v15 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "quantityWithUnit:doubleValue:", v16, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v27) = 1;
  objc_msgSend(v14, "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", a3, v11, v12, v13, 0, 0, a5, v17, *MEMORY[0x24BDD4500], 0, CFSTR("com.apple.SessionTrackerApp"), v27, 0, 0, 2,
    0,
    0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setGoalType:", a4);
  if (a4 == 2)
  {
    v24 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v22 = v20;
    v23 = a5;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v19 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    v22 = v20;
    v23 = a6;
LABEL_5:
    objc_msgSend(v21, "quantityWithUnit:doubleValue:", v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setGoal:", v25);

  }
  return v18;
}

void sub_21384E76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id _FakeHistoricalCompetitionsWithWinner(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  ASCompetition *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v3 = a1;
    v4 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      v5 = objc_alloc_init(ASCompetition);
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _HKActivityCacheDateComponentsFromDate();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCompetition setStartDateComponents:](v5, "setStartDateComponents:", v8);

      ASCompetitionDurationDateComponentsForNewCompetitions();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCompetition setDurationDateComponents:](v5, "setDurationDateComponents:", v9);

      if (a2)
        -[ASCompetition setOpponentScores:](v5, "setOpponentScores:", &unk_24D067E80);
      else
        -[ASCompetition setScores:](v5, "setScores:", &unk_24D067E68);
      objc_msgSend(v4, "arrayByAddingObject:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v10;
      --v3;
    }
    while (v3);
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v10;
}

uint64_t ASCodableCloudKitRelationshipReadFrom(_BYTE *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  ASCodableCloudKitRelationshipEvent *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 112;
        goto LABEL_64;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 48;
        goto LABEL_64;
      case 5u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 56;
        goto LABEL_64;
      case 7u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_64;
      case 8u:
        PBReaderReadString();
        v20 = (ASCodableCloudKitRelationshipEvent *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(a1, "addAddresses:", v20);
        goto LABEL_32;
      case 0xAu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 64;
        goto LABEL_64;
      case 0xBu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 72;
        goto LABEL_64;
      case 0xEu:
        v20 = objc_alloc_init(ASCodableCloudKitRelationshipEvent);
        objc_msgSend(a1, "addEvents:", v20);
        if (PBReaderPlaceMark()
          && (ASCodableCloudKitRelationshipEventReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_32:

LABEL_65:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 0xFu:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        a1[120] |= 2u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                v23 = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_70:
        v44 = 16;
        goto LABEL_84;
      case 0x11u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        a1[120] |= 4u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v14 = v28++ >= 9;
              if (v14)
              {
                LODWORD(v29) = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_74:
        v45 = 104;
        goto LABEL_79;
      case 0x12u:
        v33 = 0;
        v34 = 0;
        v29 = 0;
        a1[120] |= 8u;
        while (2)
        {
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 1;
            v29 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v33 += 7;
              v14 = v34++ >= 9;
              if (v14)
              {
                LODWORD(v29) = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_78:
        v45 = 108;
LABEL_79:
        *(_DWORD *)&a1[v45] = v29;
        goto LABEL_65;
      case 0x13u:
        v38 = 0;
        v39 = 0;
        v23 = 0;
        a1[120] |= 1u;
        while (2)
        {
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
            *(_QWORD *)(a2 + v40) = v41 + 1;
            v23 |= (unint64_t)(v42 & 0x7F) << v38;
            if (v42 < 0)
            {
              v38 += 7;
              v14 = v39++ >= 9;
              if (v14)
              {
                v23 = 0;
                goto LABEL_83;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_83:
        v44 = 8;
LABEL_84:
        *(_QWORD *)&a1[v44] = v23;
        goto LABEL_65;
      case 0x14u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 88;
        goto LABEL_64;
      case 0x15u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 96;
        goto LABEL_64;
      case 0x16u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 80;
LABEL_64:
        v43 = *(void **)&a1[v18];
        *(_QWORD *)&a1[v18] = v17;

        goto LABEL_65;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_65;
    }
  }
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id _ActivityAppQueryItemsForFriendOnDate(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v4)
  {
    v9 = (void *)MEMORY[0x24BDBD1A8];
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("timestamp"), v7);
  objc_msgSend(MEMORY[0x24BDBD1A8], "arrayByAddingObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
LABEL_3:
    v10 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(v3, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("uuid"), v11);

    objc_msgSend(v9, "arrayByAddingObject:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
LABEL_4:

  return v9;
}

id _FindQueryItemValueWithName(void *a1, void *a2)
{
  id v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  v4 = (objc_class *)MEMORY[0x24BDD1808];
  v5 = a1;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:resolvingAgainstBaseURL:", v5, 0);

  objc_msgSend(v6, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1758];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = ___FindQueryItemValueWithName_block_invoke;
  v15[3] = &unk_24D058078;
  v16 = v3;
  v9 = v3;
  objc_msgSend(v8, "predicateWithBlock:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id ASActivityAppLaunchURLForMeOnDate(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  v1 = (objc_class *)MEMORY[0x24BDD1808];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(v3, "setScheme:", CFSTR("activitysharing"));
  objc_msgSend(v3, "setHost:", CFSTR("me"));
  _ActivityAppQueryItemsForFriendOnDate(0, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setQueryItems:", v4);
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ASActivityAppLaunchURLForFriendOnDate(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDD1808];
  v4 = a2;
  v5 = a1;
  v6 = objc_alloc_init(v3);
  objc_msgSend(v6, "setScheme:", CFSTR("activitysharing"));
  objc_msgSend(v6, "setHost:", CFSTR("friend"));
  _ActivityAppQueryItemsForFriendOnDate(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setQueryItems:", v7);
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id ASActivityAppLaunchURLForSharingFriendList()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v0, "setScheme:", CFSTR("activitysharing"));
  objc_msgSend(v0, "setHost:", CFSTR("list"));
  objc_msgSend(v0, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id ASActivityAppLaunchURLForSharingInbox()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v0, "setScheme:", CFSTR("activitysharing"));
  objc_msgSend(v0, "setHost:", CFSTR("inbox"));
  objc_msgSend(v0, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id ASDateFromActivityAppLaunchURL(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _FindQueryItemValueWithName(a1, CFSTR("timestamp"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "doubleValue");
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id ASFriendUUIDFromActivityAppLaunchURL(void *a1)
{
  void *v1;
  void *v2;

  _FindQueryItemValueWithName(a1, CFSTR("uuid"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v1);
  else
    v2 = 0;

  return v2;
}

uint64_t ASIsM8Device()
{
  if (ASIsM8Device_onceToken != -1)
    dispatch_once(&ASIsM8Device_onceToken, &__block_literal_global_11);
  return ASIsM8Device___isM8Device;
}

uint64_t ASIsM9Device()
{
  if (ASIsM9Device_onceToken != -1)
    dispatch_once(&ASIsM9Device_onceToken, &__block_literal_global_8);
  return ASIsM9Device___isM9Device;
}

BOOL ASShouldReducePeriodUpdateFrequency()
{
  if (ASIsM8Device_onceToken != -1)
    dispatch_once(&ASIsM8Device_onceToken, &__block_literal_global_11);
  if (ASIsM8Device___isM8Device)
    return 1;
  if (ASIsM9Device_onceToken != -1)
    dispatch_once(&ASIsM9Device_onceToken, &__block_literal_global_8);
  return ASIsM9Device___isM9Device != 0;
}

uint64_t ASCodableCloudKitRelationshipEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t result;
  uint64_t v36;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        *(_BYTE *)(a1 + 32) |= 2u;
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        *(_QWORD *)(a1 + 16) = v28;
      }
      else
      {
        if ((_DWORD)v18 == 2)
        {
          v29 = 0;
          v30 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 32) |= 4u;
          while (1)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)(a2 + *v4))
              break;
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v33;
            v21 |= (unint64_t)(v34 & 0x7F) << v29;
            if ((v34 & 0x80) == 0)
              goto LABEL_45;
            v29 += 7;
            v15 = v30++ >= 9;
            if (v15)
            {
              v21 = 0;
              goto LABEL_47;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          if (*(_BYTE *)(a2 + *v5))
            v21 = 0;
LABEL_47:
          v36 = 24;
        }
        else
        {
          if ((_DWORD)v18 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          while (1)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            v24 = v23 + 1;
            if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
              break;
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v24;
            v21 |= (unint64_t)(v25 & 0x7F) << v19;
            if ((v25 & 0x80) == 0)
              goto LABEL_41;
            v19 += 7;
            v15 = v20++ >= 9;
            if (v15)
            {
              v21 = 0;
              goto LABEL_43;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
          if (*(_BYTE *)(a2 + *v5))
            v21 = 0;
LABEL_43:
          v36 = 8;
        }
        *(_QWORD *)(a1 + v36) = v21;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASCodableCloudKitWorkoutReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  unint64_t v20;
  unint64_t v21;
  id v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t result;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  void *v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = 0x24D056000uLL;
    v8 = 0x254D05000uLL;
    v9 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v3;
        v14 = *(_QWORD *)(a2 + v13);
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)(a2 + *v4))
          break;
        v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
        *(_QWORD *)(a2 + v13) = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_12;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v18 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v12 = 0;
LABEL_14:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v20 = v8;
          v21 = v7;
          v22 = objc_alloc_init(*(Class *)(v7 + 2480));
          objc_storeStrong((id *)(a1 + 96), v22);
          if (PBReaderPlaceMark() && (ASCodableCloudKitSampleReadFrom((uint64_t)v22, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            v7 = v21;
            v8 = v20;
            continue;
          }

          return 0;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3464)) |= 0x80u;
          while (1)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
              break;
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v27);
            *(_QWORD *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0)
              goto LABEL_81;
            v23 += 7;
            v17 = v24++ >= 9;
            if (v17)
            {
              v25 = 0;
              goto LABEL_83;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_81:
          if (*(_BYTE *)(a2 + *v5))
            v25 = 0;
LABEL_83:
          v71 = 64;
          goto LABEL_101;
        case 5u:
          *(_WORD *)(a1 + *(int *)(v8 + 3464)) |= 2u;
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v33 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v33 = 0;
          }
          v74 = 16;
          goto LABEL_112;
        case 6u:
          *(_WORD *)(a1 + *(int *)(v8 + 3464)) |= 0x40u;
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v33 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v33 = 0;
          }
          v74 = 56;
          goto LABEL_112;
        case 7u:
          *(_WORD *)(a1 + *(int *)(v8 + 3464)) |= 0x10u;
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v33 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v33 = 0;
          }
          v74 = 40;
          goto LABEL_112;
        case 8u:
          *(_WORD *)(a1 + *(int *)(v8 + 3464)) |= 0x20u;
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v33 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v33 = 0;
          }
          v74 = 48;
          goto LABEL_112;
        case 9u:
          v40 = 0;
          v41 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3464)) |= 8u;
          while (2)
          {
            v42 = *v3;
            v43 = *(_QWORD *)(a2 + v42);
            v44 = v43 + 1;
            if (v43 == -1 || v44 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v43);
              *(_QWORD *)(a2 + v42) = v44;
              v25 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                v17 = v41++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v25 = 0;
LABEL_87:
          v71 = 32;
          goto LABEL_101;
        case 0xAu:
          *(_WORD *)(a1 + *(int *)(v8 + 3464)) |= 4u;
          v46 = *v3;
          v47 = *(_QWORD *)(a2 + v46);
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v33 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v47);
            *(_QWORD *)(a2 + v46) = v47 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v33 = 0;
          }
          v74 = 24;
LABEL_112:
          *(_QWORD *)(a1 + v74) = v33;
          continue;
        case 0xBu:
          PBReaderReadString();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = 72;
          goto LABEL_79;
        case 0xCu:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3464)) |= 0x200u;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            v55 = v54 + 1;
            if (v54 == -1 || v55 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v54);
              *(_QWORD *)(a2 + v53) = v55;
              v52 |= (unint64_t)(v56 & 0x7F) << v50;
              if (v56 < 0)
              {
                v50 += 7;
                v17 = v51++ >= 9;
                if (v17)
                {
                  v52 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v52 = 0;
LABEL_91:
          v72 = v52 != 0;
          v73 = 121;
          goto LABEL_96;
        case 0xDu:
          v57 = 0;
          v58 = 0;
          v59 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3464)) |= 0x100u;
          while (2)
          {
            v60 = *v3;
            v61 = *(_QWORD *)(a2 + v60);
            v62 = v61 + 1;
            if (v61 == -1 || v62 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v61);
              *(_QWORD *)(a2 + v60) = v62;
              v59 |= (unint64_t)(v63 & 0x7F) << v57;
              if (v63 < 0)
              {
                v57 += 7;
                v17 = v58++ >= 9;
                if (v17)
                {
                  v59 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v59 = 0;
LABEL_95:
          v72 = v59 != 0;
          v73 = 120;
LABEL_96:
          *(_BYTE *)(a1 + v73) = v72;
          continue;
        case 0xEu:
          PBReaderReadString();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = 80;
          goto LABEL_79;
        case 0xFu:
          PBReaderReadString();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = 88;
          goto LABEL_79;
        case 0x10u:
          v64 = 0;
          v65 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3464)) |= 1u;
          break;
        case 0x11u:
          PBReaderReadString();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = 104;
          goto LABEL_79;
        case 0x12u:
          PBReaderReadString();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = 112;
LABEL_79:
          v70 = *(void **)(a1 + v49);
          *(_QWORD *)(a1 + v49) = v48;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v66 = *v3;
        v67 = *(_QWORD *)(a2 + v66);
        v68 = v67 + 1;
        if (v67 == -1 || v68 > *(_QWORD *)(a2 + *v4))
          break;
        v69 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v67);
        *(_QWORD *)(a2 + v66) = v68;
        v25 |= (unint64_t)(v69 & 0x7F) << v64;
        if ((v69 & 0x80) == 0)
          goto LABEL_98;
        v64 += 7;
        v17 = v65++ >= 9;
        if (v17)
        {
          v25 = 0;
          goto LABEL_100;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_98:
      if (*(_BYTE *)(a2 + *v5))
        v25 = 0;
LABEL_100:
      v71 = 8;
LABEL_101:
      *(_QWORD *)(a1 + v71) = v25;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASAlwaysFetchOnPeriodicUpdate()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ActivitySharing"));
  v1 = objc_msgSend(v0, "hk_BOOLForKey:defaultValue:", CFSTR("AlwaysFetchOnPeriodicUpdate"), 0);

  return v1;
}

const __CFString *NSStringFromASCloudType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unexpected");
  if (a1 == 1)
    v1 = CFSTR("secureCloud");
  if (a1)
    return v1;
  else
    return CFSTR("legacy");
}

uint64_t ASUseLegacyDevelopmentContainer()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ActivitySharing"));
  v1 = objc_msgSend(v0, "hk_BOOLForKey:defaultValue:", CFSTR("UseLegacyDevelopmentContainer"), 0);

  return v1;
}

uint64_t ASSecureCloudEnabled()
{
  void *v1;
  uint64_t v2;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ActivitySharing"));
  v2 = objc_msgSend(v1, "hk_BOOLForKey:defaultValue:", CFSTR("SecureCloudEnabled"), 0);

  return v2;
}

id ASActivityDataZoneNames()
{
  _QWORD v1[7];

  v1[6] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("Achievements");
  v1[1] = CFSTR("AchievementNotifications");
  v1[2] = CFSTR("ActivitySnapshots");
  v1[3] = CFSTR("ActivitySnapshotNotifications");
  v1[4] = CFSTR("Workouts");
  v1[5] = CFSTR("WorkoutNotifications");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t ASNumberOfNewFriendsAllowedForFriends(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = (void *)MEMORY[0x24BDD1758];
  v2 = a1;
  objc_msgSend(v1, "predicateWithBlock:", &__block_literal_global_385);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 40 - objc_msgSend(v4, "count");
  return v5;
}

uint64_t ASCodableInviteRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  ASCodableActivityDataPreview *v27;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_25;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_25;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_25;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
LABEL_25:
        v20 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_26;
      case 5u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 52) |= 1u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_41:
        *(_DWORD *)(a1 + 48) = v23;
        goto LABEL_26;
      case 6u:
        v27 = objc_alloc_init(ASCodableActivityDataPreview);
        objc_storeStrong((id *)(a1 + 8), v27);
        if (PBReaderPlaceMark() && (ASCodableActivityDataPreviewReadFrom((uint64_t)v27, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_26:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_26;
    }
  }
}

uint64_t ASCodableCloudKitAchievementReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  ASCodableCloudKitSample *v18;
  uint64_t result;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = objc_alloc_init(ASCodableCloudKitSample);
          objc_storeStrong((id *)(a1 + 48), v18);
          if (PBReaderPlaceMark() && (ASCodableCloudKitSampleReadFrom((uint64_t)v18, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 3u:
          *(_BYTE *)(a1 + 64) |= 1u;
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v22 = 0;
          }
          v42 = 8;
          goto LABEL_60;
        case 4u:
          *(_BYTE *)(a1 + 64) |= 2u;
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v22 = 0;
          }
          v42 = 16;
LABEL_60:
          *(_QWORD *)(a1 + v42) = v22;
          continue;
        case 5u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)(a1 + 64) |= 4u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  v27 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v27 = 0;
LABEL_50:
          v41 = 24;
          goto LABEL_55;
        case 7u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          *(_BYTE *)(a1 + 64) |= 8u;
          break;
        case 8u:
          PBReaderReadString();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = 40;
          goto LABEL_46;
        case 9u:
          PBReaderReadString();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = 56;
LABEL_46:
          v40 = *(void **)(a1 + v39);
          *(_QWORD *)(a1 + v39) = v38;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        v36 = v35 + 1;
        if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v36;
        v27 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_52;
        v32 += 7;
        v15 = v33++ >= 9;
        if (v15)
        {
          v27 = 0;
          goto LABEL_54;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
      if (*(_BYTE *)(a2 + *v5))
        v27 = 0;
LABEL_54:
      v41 = 32;
LABEL_55:
      *(_QWORD *)(a1 + v41) = v27;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASSupportedPhoneFeaturesForCurrentDevice()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isStandalonePhoneFitnessMode") ^ 1;

  return v1;
}

uint64_t ASSupportedWatchFeaturesForCurrentDevice()
{
  return 0;
}

BOOL ASRelationshipNeedsSupportedFeaturesUpdate(void *a1)
{
  id v1;
  int v2;
  int v3;
  _BOOL8 v4;

  v1 = a1;
  v2 = ASSupportedPhoneFeaturesForCurrentDevice();
  if (v2 == objc_msgSend(v1, "supportedPhoneFeatures"))
  {
    v3 = objc_msgSend(v1, "supportedWatchFeatures");
    v4 = v3 != objc_msgSend(v1, "supportedWatchFeatures");
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

void ASUpdateSupportedFeaturesForRelationship(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = ASSupportedPhoneFeaturesForCurrentDevice();
  v3 = objc_msgSend(v1, "supportedWatchFeatures");
  ASLoggingInitialize();
  v4 = (void *)ASLogRelationships;
  if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v9 = 67109376;
    v10 = objc_msgSend(v1, "supportedPhoneFeatures");
    v11 = 1024;
    v12 = v2;
    _os_log_impl(&dword_21381F000, v5, OS_LOG_TYPE_DEFAULT, "Phone features: %d -> %d", (uint8_t *)&v9, 0xEu);

  }
  ASLoggingInitialize();
  v6 = (void *)ASLogRelationships;
  if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = objc_msgSend(v1, "supportedWatchFeatures");
    v9 = 67109376;
    v10 = v8;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_21381F000, v7, OS_LOG_TYPE_DEFAULT, "Watch features: %d -> %d", (uint8_t *)&v9, 0xEu);

  }
  objc_msgSend(v1, "setSupportedPhoneFeatures:", v2);
  objc_msgSend(v1, "setSupportedWatchFeatures:", v3);
  objc_msgSend(v1, "insertEventWithType:", 15);

}

id ASMaxNumber(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = v4;
  if (v3)
  {
    v6 = v3;
    if (v4)
    {
      if (objc_msgSend(v3, "compare:", v4) == -1)
        v6 = v5;
      else
        v6 = v3;
    }
  }
  v7 = v6;

  return v7;
}

uint64_t ASStringsAreEqual(void *a1, void *a2)
{
  if (a1 == a2)
    return 1;
  else
    return objc_msgSend(a1, "isEqualToString:", a2);
}

uint64_t ASObjectsAreEqual(void *a1, void *a2)
{
  if (a1 == a2)
    return 1;
  else
    return objc_msgSend(a1, "isEqual:", a2);
}

uint64_t ASObjectsAreEqualOrNil(unint64_t a1, unint64_t a2)
{
  if (a1 == a2 || !(a1 | a2))
    return 1;
  else
    return objc_msgSend((id)a1, "isEqual:", a2);
}

void ASSendRichMessagePayloadToDestination(void *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v39 = a1;
  v36 = a2;
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v37, "hasListenerForID:", CFSTR("com.apple.ActivitySharingControl")) & 1) == 0)
    objc_msgSend(v37, "addListenerID:capabilities:", CFSTR("com.apple.ActivitySharingControl"), *MEMORY[0x24BE509F8]);
  objc_msgSend(v37, "blockUntilConnected");
  objc_msgSend(MEMORY[0x24BE50370], "serviceWithName:", CFSTR("iMessage"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
    ASSendRichMessagePayloadToDestination_cold_1();
  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountsForService:", v40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (!v6)
  {
LABEL_12:

    goto LABEL_13;
  }
  v7 = *(_QWORD *)v48;
LABEL_6:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v48 != v7)
      objc_enumerationMutation(v5);
    v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "isActive") & 1) != 0)
      break;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (!v6)
        goto LABEL_12;
      goto LABEL_6;
    }
  }
  v35 = v9;

  if (!v35)
LABEL_13:
    ASSendRichMessagePayloadToDestination_cold_2();
  objc_msgSend(v35, "imHandleWithID:", v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
    ASSendRichMessagePayloadToDestination_cold_3();
  objc_msgSend(MEMORY[0x24BE502A8], "sharedRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingChatWithHandle:", v41);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE502A8], "sharedRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chatWithHandle:", v41);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      ASSendRichMessagePayloadToDestination_cold_4();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:0000000000:%@"), *MEMORY[0x24BE50B60], CFSTR("com.apple.ActivityMessagesApp.MessagesExtension"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_opt_new();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BE50D28];
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE50D28]);

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v38, 1, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, v15);

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v39, *MEMORY[0x24BE50D48]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE50D38]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1B8], *MEMORY[0x24BE50D30]);
  ASMessageFromRichMessagePayload(v39);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE50D40]);

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x24BE50320]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringGUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:", 0, v22, 0, 0, 0, 5, 0, v23, 0, v33, v20, 0);

  if (objc_msgSend(v11, "joinState") != 3)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x24BE500E8];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __ASSendRichMessagePayloadToDestination_block_invoke;
    v42[3] = &unk_24D058450;
    v42[4] = &v43;
    v28 = (id)objc_msgSend(v25, "addObserverForName:object:queue:usingBlock:", v27, 0, v26, v42);

    objc_msgSend(v11, "join");
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x24BDBCA90];
    do
    {
      if (!*((_BYTE *)v44 + 24))
        break;
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v29, "runMode:beforeDate:", v30, v31);

    }
    while ((v32 & 1) != 0);

    _Block_object_dispose(&v43, 8);
  }
  objc_msgSend(v11, "sendMessage:", v24);

}

void sub_213859F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t ASCodableCloudKitNotificationEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t result;
  uint64_t v38;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((int)(v10 >> 3) <= 9)
        break;
      if ((_DWORD)v18 != 10)
      {
        if ((_DWORD)v18 != 11)
        {
LABEL_41:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          goto LABEL_54;
        }
        v26 = 0;
        v27 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 40) |= 2u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          v30 = v29 + 1;
          if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
            break;
          v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v30;
          v21 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0)
            goto LABEL_48;
          v26 += 7;
          v15 = v27++ >= 9;
          if (v15)
          {
            v21 = 0;
            goto LABEL_50;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_48:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_50:
        v38 = 16;
LABEL_51:
        *(_QWORD *)(a1 + v38) = v21;
        goto LABEL_54;
      }
      PBReaderReadData();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v35;

LABEL_54:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    if ((_DWORD)v18 == 1)
    {
      *(_BYTE *)(a1 + 40) |= 1u;
      v32 = *v3;
      v33 = *(_QWORD *)(a2 + v32);
      if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)(a2 + *v4))
      {
        v34 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v33);
        *(_QWORD *)(a2 + v32) = v33 + 8;
      }
      else
      {
        *(_BYTE *)(a2 + *v5) = 1;
        v34 = 0;
      }
      *(_QWORD *)(a1 + 8) = v34;
      goto LABEL_54;
    }
    if ((_DWORD)v18 != 2)
      goto LABEL_41;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    *(_BYTE *)(a1 + 40) |= 4u;
    while (1)
    {
      v22 = *v3;
      v23 = *(_QWORD *)(a2 + v22);
      v24 = v23 + 1;
      if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
        break;
      v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
      *(_QWORD *)(a2 + v22) = v24;
      v21 |= (unint64_t)(v25 & 0x7F) << v19;
      if ((v25 & 0x80) == 0)
        goto LABEL_44;
      v19 += 7;
      v15 = v20++ >= 9;
      if (v15)
      {
        v21 = 0;
        goto LABEL_46;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
    if (*(_BYTE *)(a2 + *v5))
      v21 = 0;
LABEL_46:
    v38 = 24;
    goto LABEL_51;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ASCodableCloudKitMigrationAvailableItemReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ASCodableInviteResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  ASCodableShareLocations *v26;
  void *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_34;
      case 2u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 56) |= 2u;
        while (2)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              v14 = v21++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_48:
        v33 = 52;
        goto LABEL_53;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_34;
      case 4u:
        v26 = objc_alloc_init(ASCodableShareLocations);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (!PBReaderPlaceMark() || !ASCodableShareLocationsReadFrom((uint64_t)v26, a2))
          goto LABEL_56;
        goto LABEL_44;
      case 5u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
LABEL_34:
        v27 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_54;
      case 6u:
        v28 = 0;
        v29 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 56) |= 1u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 1;
            v22 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              v28 += 7;
              v14 = v29++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_52:
        v33 = 48;
LABEL_53:
        *(_DWORD *)(a1 + v33) = v22;
        goto LABEL_54;
      case 7u:
        v26 = objc_alloc_init(ASCodableActivityDataPreview);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (PBReaderPlaceMark() && (ASCodableActivityDataPreviewReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_54:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_56:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_54;
    }
  }
}

uint64_t ASCodableContactListReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ASCodableContact *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ASCodableContact);
        objc_msgSend(a1, "addContacts:", v17);
        if (!PBReaderPlaceMark() || !ASCodableContactReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *_ASCurrentDeviceString()
{
  return CFSTR("phone");
}

const __CFString *_ASSourceString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("daemon");
  if (a1 == 2)
    v1 = CFSTR("app");
  if (a1 == 1)
    return CFSTR("bulletin");
  else
    return v1;
}

const __CFString *_ASBulletinTypeString(unint64_t a1)
{
  if (a1 > 8)
    return CFSTR("goalCompletion");
  else
    return *(&off_24D058570 + a1);
}

uint64_t _ASCoreAnalyticsString(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;

  v1 = CFSTR("daemon");
  if (a1 == 2)
    v1 = CFSTR("app");
  if (a1 == 1)
    v2 = CFSTR("bulletin");
  else
    v2 = v1;
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.ActivitySharing"), CFSTR("phone"), v2);
}

void ASAnalyticsReportCompetitionRequestSendBulletin()
{
  id v0;

  _ASCoreAnalyticsString(1);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission();

}

void ASAnalyticsReportCompetitionRequestSendApp()
{
  id v0;

  _ASCoreAnalyticsString(2);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission();

}

void ASAnalyticsReportCompetitionRequestAccept(uint64_t a1)
{
  id v1;

  _ASCoreAnalyticsString(a1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission();

}

void ASAnalyticsReportCompetitionRequestIgnore(uint64_t a1)
{
  id v1;

  _ASCoreAnalyticsString(a1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission();

}

void ASAnalyticsReportSmackTalk(unint64_t a1)
{
  const __CFString *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  if (a1 > 8)
    v1 = CFSTR("goalCompletion");
  else
    v1 = *(&off_24D058570 + a1);
  _ASCoreAnalyticsString(1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@Notification"), CFSTR("phone"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("activityType");
  v5[1] = CFSTR("source");
  v6[0] = v1;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmissionWithPayload();

}

void ASAnalyticsUpdateWithFriends(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  _QWORD v22[4];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "hk_filter:", &__block_literal_global_15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hk_filter:", &__block_literal_global_275);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hk_filter:", &__block_literal_global_276);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "completedCompetitions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v10, "count");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  _ASCoreAnalyticsString(0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("friends");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v2, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v21[1] = CFSTR("currentCompetitions");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  v21[2] = CFSTR("friendsWithCompetitions");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("completedCompetitions");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmissionWithPayload();

}

void ASAnalyticsUpdateManateeStateWithFriends(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a1;
  objc_msgSend(v8, "hk_filter:", &__block_literal_global_278);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_filter:", &__block_literal_global_279);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_filter:", &__block_literal_global_281);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_filter:", &__block_literal_global_284);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = CFSTR("totalFriendCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v20[1] = CFSTR("migratedFriendCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  v20[2] = CFSTR("migrationEligible");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  v20[3] = CFSTR("endToEndEncryptionEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  v20[4] = CFSTR("legacyPhoneCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v16;
  v20[5] = CFSTR("legacyWatchCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmissionWithPayload();

}

void ASAnalyticsReportAddManateeContainer(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("success");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "numberWithBool:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = v9;
  v13[1] = CFSTR("role");
  v13[2] = CFSTR("errorDomain");
  v14[2] = v8;
  v13[3] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  FIActivityAnalyticsSubmissionWithPayload();
}

void ASAnalyticsReportManateeMigration(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("success");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a3;
  objc_msgSend(v7, "numberWithBool:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v13[1] = CFSTR("friendCompletedMigration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  v14[2] = v8;
  v13[2] = CFSTR("errorDomain");
  v13[3] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  FIActivityAnalyticsSubmissionWithPayload();
}

void ASAnalyticsReportManateeDowngrade(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("success");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a3;
  objc_msgSend(v7, "numberWithBool:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v13[1] = CFSTR("friendCompletedDowngrade");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  v14[2] = v8;
  v13[2] = CFSTR("errorDomain");
  v13[3] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  FIActivityAnalyticsSubmissionWithPayload();
}

BOOL ASCodableShareLocationsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 3)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void ASSecureUnarchiveClassWithDataAndStrictness_cold_1(void *a1, objc_class *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  NSStringFromClass(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  v9 = a3;
  OUTLINED_FUNCTION_3(&dword_21381F000, v5, v7, "Error unarchiving object of class %{public}@ error: %{public}@", v8);

}

void ASSecureUnarchiveClassesWithData_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  v3 = v0;
  OUTLINED_FUNCTION_3(&dword_21381F000, v1, (uint64_t)v1, "Error unarchiving object of classes %{public}@ error: %{public}@", v2);
}

void ASCompetitionCalculateUpdatedScores_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_21381F000, v0, v1, "Today summary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void ASCompetitionCalculateUpdatedScores_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21381F000, v0, v1, "Computed score is less than existing score, not updating", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void ASCompetitionCalculateUpdatedScores_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_21381F000, v0, v1, "Yesterday summary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void ASValidateEligibilityForOutgoingCompetitionRequest_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21381F000, v0, v1, "Unable to find contact to send competition request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void ASValidateEligibilityForOutgoingCompetitionRequest_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_21381F000, v0, v1, "Competition is already active with contact: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void ASValidateEligibilityForOutgoingCompetitionRequest_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_21381F000, v0, v1, "Activity data is currently hidden from contact: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void ASValidateEligibilityForOutgoingCompetitionRequest_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_21381F000, v0, v1, "Contact does not support competitions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void ASValidateEligibilityForIncomingCompetitionRequest_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21381F000, v0, v1, "Unable to find contact for incoming request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void ASValidateEligibilityForIncomingCompetitionRequest_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_21381F000, v0, v1, "Friendship is not active with contact: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void ASValidateEligibilityForAcceptingCompetitionRequest_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21381F000, v0, v1, "Unable to find contact to accept competition request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void ASValidateEligibilityForAcceptingCompetitionRequest_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_21381F000, v0, v1, "Competiton is already active with contact: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void ASValidateEligibilityForAcceptingCompetitionRequest_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_21381F000, v0, v1, "No incoming request on contact: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void ASFriendAchievementFromTemplateAndEarnedInstance_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21381F000, a2, a3, "Template: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void ASFriendAchievementFromTemplateAndEarnedInstance_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21381F000, a1, a3, "Achievement template missing canonical unit when creating friend achievement", a5, a6, a7, a8, 0);
}

void ASFriendAchievementFromTemplateAndEarnedInstance_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21381F000, a2, a3, "Earned instance: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void ASFriendAchievementFromTemplateAndEarnedInstance_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21381F000, a1, a3, "Achievement template canonical unit not compatible with earned instance value when creating friend achievement", a5, a6, a7, a8, 0);
}

void ASSendRichMessagePayloadToDestination_cold_1()
{
  __assert_rtn("ASSendRichMessagePayloadToDestination", "ASSendMessageUtilities.m", 35, "service");
}

void ASSendRichMessagePayloadToDestination_cold_2()
{
  __assert_rtn("ASSendRichMessagePayloadToDestination", "ASSendMessageUtilities.m", 45, "activeAccount");
}

void ASSendRichMessagePayloadToDestination_cold_3()
{
  __assert_rtn("ASSendRichMessagePayloadToDestination", "ASSendMessageUtilities.m", 48, "handle");
}

void ASSendRichMessagePayloadToDestination_cold_4()
{
  __assert_rtn("ASSendRichMessagePayloadToDestination", "ASSendMessageUtilities.m", 51, "chat");
}

uint64_t ACHApplyBadgePropertiesToAchievement()
{
  return MEMORY[0x24BE01240]();
}

uint64_t ACHIsActivityAchievementSharable()
{
  return MEMORY[0x24BE013F8]();
}

uint64_t ACHLegacyDefinitionIdentifierForTemplateUniqueName()
{
  return MEMORY[0x24BE01410]();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return MEMORY[0x24BE01590]();
}

uint64_t ACHTemplateUniqueNameForLegacyAchievementInfo()
{
  return MEMORY[0x24BE01650]();
}

uint64_t ACHWorkoutActivityTypeForTemplateUniqueName()
{
  return MEMORY[0x24BE01670]();
}

uint64_t DailyExerciseRecordTemplate()
{
  return MEMORY[0x24BE016C8]();
}

uint64_t DailyMoveRecordTemplate()
{
  return MEMORY[0x24BE016D0]();
}

uint64_t FIActivityAnalyticsSubmission()
{
  return MEMORY[0x24BE32568]();
}

uint64_t FIActivityAnalyticsSubmissionWithPayload()
{
  return MEMORY[0x24BE32570]();
}

uint64_t FirstWorkoutTemplateForWorkoutActivityType()
{
  return MEMORY[0x24BE01728]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x24BE4F980]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x24BE4F988]();
}

uint64_t IDSCopyIDForPhoneNumberWithOptions()
{
  return MEMORY[0x24BE4F990]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x24BE4F9B0]();
}

uint64_t LongestMoveStreakTemplate()
{
  return MEMORY[0x24BE01770]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MoveGoal200PercentTemplate()
{
  return MEMORY[0x24BE01780]();
}

uint64_t MoveGoal300PercentTemplate()
{
  return MEMORY[0x24BE01788]();
}

uint64_t MoveGoal400PercentTemplate()
{
  return MEMORY[0x24BE01790]();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return MEMORY[0x24BE6B488]();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return MEMORY[0x24BE6B498]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NewMoveGoalAchievedTemplate()
{
  return MEMORY[0x24BE01798]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x24BE7AF88]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x24BE7AFB0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x24BE7B0C8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x24BE7B0D0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x24BE7B0D8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x24BE7B0E0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x24BE7B0E8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x24BE7B0F0]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x24BE7B0F8]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x24BE7B100]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x24BE7B108]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x24BE7B110]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x24BE7B118]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x24BE7B120]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x24BE7B128]();
}

uint64_t PBRepeatedInt64Set()
{
  return MEMORY[0x24BE7B130]();
}

uint64_t PerfectWeekAllTemplate()
{
  return MEMORY[0x24BE01880]();
}

uint64_t PerfectWeekExerciseTemplate()
{
  return MEMORY[0x24BE01888]();
}

uint64_t PerfectWeekMoveTemplate()
{
  return MEMORY[0x24BE01890]();
}

uint64_t PerfectWeekStandTemplate()
{
  return MEMORY[0x24BE01898]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return MEMORY[0x24BDD4270]();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return MEMORY[0x24BDD4278]();
}

uint64_t _HKCacheIndexFromDate()
{
  return MEMORY[0x24BDD42A0]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x24BDD42A8]();
}

uint64_t _HKEndDateForSnapshotIndex()
{
  return MEMORY[0x24BDD4320]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x24BDD4340]();
}

uint64_t _HKMostRecentActivitySnapshotInSnapshots()
{
  return MEMORY[0x24BDD4360]();
}

uint64_t _HKStartDateForSnapshotIndex()
{
  return MEMORY[0x24BDD44C0]();
}

uint64_t _HKWorkoutActivityTypeIsValid()
{
  return MEMORY[0x24BDD44F8]();
}

uint64_t _HKWorkoutCanonicalDistanceUnit()
{
  return MEMORY[0x24BDD4508]();
}

uint64_t _HKWorkoutCanonicalEnergyBurnedUnit()
{
  return MEMORY[0x24BDD4510]();
}

uint64_t _HKWorkoutCanonicalUnitForGoalType()
{
  return MEMORY[0x24BDD4518]();
}

uint64_t _HKWorkoutGoalTypeIsValidForGoal()
{
  return MEMORY[0x24BDD4530]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

