@implementation CNContactStore(DSContactHelpers)

+ (id)ds_meContactIdentifier
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  os_log_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  v10[0] = *MEMORY[0x24BDBA2E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v0, "_ios_meContactWithKeysToFetch:error:", v1, &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;

  if (v3)
  {
    v4 = os_log_create("com.apple.DigitalSeparation", "CNContactStore");
    v5 = (void *)DSLog_5;
    DSLog_5 = (uint64_t)v4;

    v6 = DSLog_5;
    if (os_log_type_enabled((os_log_t)DSLog_5, OS_LOG_TYPE_ERROR))
      +[CNContactStore(DSContactHelpers) ds_meContactIdentifier].cold.1((uint64_t)v3, v6);
    v7 = 0;
  }
  else
  {
    objc_msgSend(v2, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (void)ds_meContactIdentifier
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_227D24000, a2, OS_LOG_TYPE_ERROR, "Error fetching me contact: %@", (uint8_t *)&v2, 0xCu);
}

@end
