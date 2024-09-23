@implementation CKRecordUtilities

+ (id)recordNameUsingSalt:(id)a3 guid:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "length");
  if (v7 && (v7 = objc_msgSend(v5, "length")) != 0)
  {
    MEMORY[0x1D17E9630](v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 138412802;
        v13 = v8;
        v14 = 2112;
        v15 = v6;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Computed message record name hash %@ from guid %@ and salt %@", (uint8_t *)&v12, 0x20u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412802;
        v13 = 0;
        v14 = 2112;
        v15 = v6;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Could not compute message record name hash %@ from guid %@ and salt %@ as one or both are nil", (uint8_t *)&v12, 0x20u);
      }

    }
    v8 = 0;
  }

  return v8;
}

+ (id)recordNameForRecordChangeTag:(id)a3 ckRecordID:(id)a4 salt:(id)a5 guid:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(a3, "length") && objc_msgSend(v10, "length"))
  {
    v13 = v10;
  }
  else
  {
    objc_msgSend(a1, "recordNameUsingSalt:guid:", v11, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

+ (id)recordIDUsingName:(id)a3 zoneID:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v5, v6);
  else
    v7 = 0;

  return v7;
}

+ (id)recordIDUsingSalt:(id)a3 zoneID:(id)a4 guid:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a1, "recordNameUsingSalt:guid:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordIDUsingName:zoneID:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
