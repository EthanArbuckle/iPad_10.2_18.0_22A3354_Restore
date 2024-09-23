@implementation BDSMediaLibraryUtils

+ (id)representativeDAAPMediaItemsWithAssetId:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v4 = a3;
  v5 = (void *)MEMORY[0x22E2AA24C]();
  objc_msgSend_audiobooksQuery(MEMORY[0x24BDDC818], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIgnoreSystemFilterPredicates_(v10, v11, 1, v12, v13);
  if (v10)
  {
    objc_msgSend_predicateWithValue_forProperty_(MEMORY[0x24BDDC810], v14, (uint64_t)v4, *MEMORY[0x24BDDBCB0], v15);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_addFilterPredicate_(v10, v17, (uint64_t)v16, v18, v19);
    objc_msgSend_collections(v10, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v24, v25, v26, v27, v28))
    {
      objc_msgSend_lastObject(v24, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__storeRepresentativeItem_(a1, v34, (uint64_t)v33, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
LABEL_12:

        goto LABEL_13;
      }
      BDSCloudKitAudiobookLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        sub_227E584D4((uint64_t)v4, v38, v39, v40, v41, v42, v43, v44);
    }
    else
    {
      BDSCloudKitAudiobookLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        sub_227E5846C((uint64_t)v4, v38, v45, v46, v47, v48, v49, v50);
    }

    v37 = 0;
    goto LABEL_12;
  }
  BDSCloudKitAudiobookLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_227E5842C(v16);
  v37 = 0;
LABEL_13:

  objc_autoreleasePoolPop(v5);
  return v37;
}

+ (id)_storeRepresentativeItem:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend_items(a3, a2, (uint64_t)a3, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v7)
  {
    v11 = v7;
    v12 = *(_QWORD *)v28;
    v13 = *MEMORY[0x24BDDBC70];
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v5);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend_valueForProperty_(v15, v8, v13, v9, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_mediaType(v15, v17, v18, v19, v20) == 4 && objc_msgSend_longLongValue(v16, v21, v22, v23, v24))
        {
          v25 = v15;

          goto LABEL_12;
        }

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v27, (uint64_t)v31, 16);
      if (v11)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_12:

  return v25;
}

@end
