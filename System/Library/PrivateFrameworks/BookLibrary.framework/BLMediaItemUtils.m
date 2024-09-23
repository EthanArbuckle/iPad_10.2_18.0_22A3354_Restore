@implementation BLMediaItemUtils

+ (id)hlsOfflinePlaybackKeysForItem:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  sub_213243AFC();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForProperty_(v3, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BUDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v8, (uint64_t)v24, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = (void *)MEMORY[0x24BDD1620];
  objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v11, (uint64_t)v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v10, v13, (uint64_t)v12, v7, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;
  BUDynamicCast();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_length(v7, v17, v18) && v15)
  {
    BLHLSKeyFetchingLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_21323F000, v19, OS_LOG_TYPE_ERROR, "Key Unarchive Error:  %@", buf, 0xCu);
    }

  }
  return v16;
}

+ (unint64_t)bitrateForItem:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;

  v3 = a3;
  sub_213243A4C();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForProperty_(v3, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend_unsignedIntegerValue(v6, v7, v8);
  return v9;
}

+ (void)setBitrate:(unint64_t)a3 forItem:(id)a4
{
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  objc_msgSend_numberWithUnsignedInteger_(v5, v7, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  sub_213243A4C();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forProperty_(v6, v9, (uint64_t)v10, v8);

}

+ (void)addPersistHLSOfflinePlaybackKey:(id)a3 forUri:(id)a4 toItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_hlsOfflinePlaybackKeysForItem_(a1, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_mutableCopy(v12, v13, v14);

  if (!v15)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v16, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_setObject_forKey_(v15, v16, (uint64_t)v8, v9);
  v33 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x24BDD1618], v18, (uint64_t)v15, 1, &v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v33;
  BLHLSKeyFetchingLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      sub_213243D0C();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueForProperty_(v10, v24, (uint64_t)v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      v36 = 2112;
      v37 = v20;
      v26 = "Failed to archive keys for %{public}@. Key Archive Error:  %@";
      v27 = v22;
      v28 = OS_LOG_TYPE_ERROR;
      v29 = 22;
LABEL_8:
      _os_log_impl(&dword_21323F000, v27, v28, v26, buf, v29);

    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    sub_213243D0C();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForProperty_(v10, v30, (uint64_t)v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v25;
    v26 = "Archived keys for %{public}@";
    v27 = v22;
    v28 = OS_LOG_TYPE_DEFAULT;
    v29 = 12;
    goto LABEL_8;
  }

  sub_213243AFC();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forProperty_(v10, v32, (uint64_t)v19, v31);

}

+ (void)removePersistHLSOfflinePlaybackKeyForUri:(id)a3 fromItem:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_hlsOfflinePlaybackKeysForItem_(a1, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_mutableCopy(v9, v10, v11);

  if (v12)
  {
    objc_msgSend_removeObjectForKey_(v12, v13, (uint64_t)v6);
    v20 = 0;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x24BDD1618], v14, (uint64_t)v12, 1, &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
    if (v16)
    {
      BLHLSKeyFetchingLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v16;
        _os_log_impl(&dword_21323F000, v17, OS_LOG_TYPE_ERROR, "Key Archive Error:  %@", buf, 0xCu);
      }

    }
    sub_213243AFC();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forProperty_(v7, v19, (uint64_t)v15, v18);

  }
}

+ (void)clearPersistHLSOfflinePlaybackKeysFromItem:(id)a3
{
  id v3;
  const char *v4;
  id v5;

  v3 = a3;
  sub_213243AFC();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forProperty_(v3, v4, 0, v5);

}

@end
