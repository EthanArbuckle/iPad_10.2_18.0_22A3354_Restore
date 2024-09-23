@implementation AVTStickerRecentsPresetsProvider

+ (void)filteredAndPaddedStickerRecordsWithRecents:(id)a3 excludingRecords:(id)a4 paddingMemojiIdentifier:(id)a5 avatarStore:(id)a6 numberOfStickers:(int64_t)a7 resultBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  unint64_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v47 = a8;
  v45 = a1;
  v49 = v15;
  objc_msgSend(a1, "paddedStickerRecordsWithRecents:excludingRecords:paddingMemojiIdentifier:numberOfStickers:", a3, v14, v15, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = a7;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v57 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "avatarRecordIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v21);
  }
  v50 = v14;

  v25 = (void *)MEMORY[0x1E0D00840];
  objc_msgSend(v18, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "requestForAvatarsWithIdentifiers:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0;
  v48 = v16;
  objc_msgSend(v16, "avatarsForFetchRequest:error:", v27, &v55);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v55;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v30 = v28;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v52 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
        objc_msgSend(v35, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, v36);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v32);
  }

  objc_msgSend(v45, "filteredRecentStickers:withAvailableRecordIdentifiersMap:", v19, v29);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v37, "count") >= v46)
  {
    v43 = v47;
    (*((void (**)(id, void *, void *))v47 + 2))(v47, v37, v29);
    v38 = v49;
    v41 = v50;
    v42 = v48;
  }
  else
  {
    v38 = v49;
    objc_msgSend(v29, "objectForKey:", v49);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
      v40 = v49;
    else
      v40 = 0;
    v41 = v50;
    v42 = v48;
    v43 = v47;
    objc_msgSend(v45, "filteredAndPaddedStickerRecordsWithRecents:excludingRecords:paddingMemojiIdentifier:avatarStore:numberOfStickers:resultBlock:", v37, v50, v40, v48, v46, v47);
  }

}

+ (id)filteredRecentStickers:(id)a3 withAvailableRecordIdentifiersMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "avatarRecordIdentifier", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)paddedStickerRecordsWithRecents:(id)a3 paddingMemojiIdentifier:(id)a4 numberOfStickers:(int64_t)a5
{
  return (id)objc_msgSend(a1, "paddedStickerRecordsWithRecents:excludingRecords:paddingMemojiIdentifier:numberOfStickers:", a3, 0, a4, a5);
}

+ (id)paddedStickerRecordsWithRecents:(id)a3 excludingRecords:(id)a4 paddingMemojiIdentifier:(id)a5 numberOfStickers:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id obj;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "count") >= (unint64_t)a6)
  {
    v33 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v10);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(a1, "presetsGivenOneMemojiWithIdentifier:", v12);
    else
      objc_msgSend(a1, "presetsGivenNoMemoji");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "count", v12);
    v31 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count") + objc_msgSend(v11, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v32, "addObjectsFromArray:", v11);
    if (v10)
      objc_msgSend(v32, "addObjectsFromArray:");
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v13;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v37)
    {
      v15 = a6 - v14;
      v35 = *(_QWORD *)v45;
      v36 = v11;
LABEL_12:
      v16 = 0;
      while (1)
      {
        v39 = v15;
        if (*(_QWORD *)v45 != v35)
          objc_enumerationMutation(obj);
        v38 = v16;
        v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v16);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v18 = v11;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v41 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v23, "avatarRecordIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "avatarRecordIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v24, "isEqualToString:", v25) & 1) != 0)
              {
                objc_msgSend(v23, "stickerConfigurationIdentifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "stickerConfigurationIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v26, "isEqualToString:", v27);

                if ((v28 & 1) != 0)
                {

                  v15 = v39;
                  goto LABEL_27;
                }
              }
              else
              {

              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v20);
        }

        objc_msgSend(v33, "addObject:", v17);
        v15 = v39 - 1;
LABEL_27:
        v11 = v36;
        if (!v15)
          break;
        v16 = v38 + 1;
        if (v38 + 1 == v37)
        {
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          if (v37)
            goto LABEL_12;
          break;
        }
      }
    }

    v12 = v30;
    v10 = v31;
  }

  return v33;
}

+ (id)presetsGivenNoMemoji
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[9];

  v36[8] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v2, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v4, CFSTR("unicorn"), CFSTR("face_with_starry_eyes"), &unk_1EA571620, &unk_1EA571620);

  v5 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v5, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v7, CFSTR("unicorn"), CFSTR("smiling_face_with_heart-shaped_eyes"), &unk_1EA571620, &unk_1EA571620);

  v8 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v8, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v10, CFSTR("unicorn"), CFSTR("exploding_head"), &unk_1EA571620, &unk_1EA571620);

  v11 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v13, CFSTR("unicorn"), CFSTR("face_with_tears_of_joy"), &unk_1EA571620, &unk_1EA571620);

  v15 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v17, CFSTR("unicorn"), CFSTR("face_blowing_a_kiss"), &unk_1EA571620, &unk_1EA571620);

  v19 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v21, CFSTR("unicorn"), CFSTR("sleeping_face"), &unk_1EA571620, &unk_1EA571620);

  v23 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v25, CFSTR("unicorn"), CFSTR("face_with_symbols_over_mouth"), &unk_1EA571620, &unk_1EA571620);

  v27 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v27, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v29, CFSTR("unicorn"), CFSTR("winking_face_with_stuck_out_tongue"), &unk_1EA571620, &unk_1EA571620);

  v36[0] = v35;
  v36[1] = v34;
  v36[2] = v33;
  v36[3] = v14;
  v36[4] = v18;
  v36[5] = v22;
  v36[6] = v26;
  v36[7] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)presetsGivenOneMemojiWithIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[9];

  v39[8] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D00888];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v5, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v7, v4, CFSTR("face_with_starry_eyes"), &unk_1EA571620, &unk_1EA571620);

  v8 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v8, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v10, v4, CFSTR("smiling_face_with_heart-shaped_eyes"), &unk_1EA571620, &unk_1EA571620);

  v11 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v11, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v13, v4, CFSTR("person_nervous"), &unk_1EA571620, &unk_1EA571620);

  v14 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v16, v4, CFSTR("face_with_tears_of_joy"), &unk_1EA571620, &unk_1EA571620);

  v18 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v20, v4, CFSTR("beKind"), &unk_1EA571620, &unk_1EA571620);

  v22 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v22, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v24, v4, CFSTR("face_with_symbols_over_mouth"), &unk_1EA571620, &unk_1EA571620);

  v26 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "UUIDString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v26, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v28, v4, CFSTR("person_waving"), &unk_1EA571620, &unk_1EA571620);

  v30 = objc_alloc(MEMORY[0x1E0D00888]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "UUIDString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v30, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v32, v4, CFSTR("head_in_clouds"), &unk_1EA571620, &unk_1EA571620);

  v39[0] = v38;
  v39[1] = v37;
  v39[2] = v36;
  v39[3] = v17;
  v39[4] = v21;
  v39[5] = v25;
  v39[6] = v29;
  v39[7] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

@end
