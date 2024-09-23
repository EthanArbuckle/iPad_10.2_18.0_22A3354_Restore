@implementation AXDeviceSupportsPhotosensitiveMitigation

void __AXDeviceSupportsPhotosensitiveMitigation_block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t buf[4];
  void *v3;
  __int128 v4;
  int v5;
  __int128 v6;
  int v7;
  __int128 v8;
  int v9;
  __int128 v10;
  int v11;
  __int128 v12;
  int v13;
  __int128 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v15 = -435113336;
    v14 = xmmword_18C736CD0;
    v13 = 1839812531;
    v12 = xmmword_18C736CE4;
    v11 = -1022451852;
    v10 = xmmword_18C736CF8;
    v9 = 1729782187;
    v8 = xmmword_18C736D0C;
    v7 = 996646949;
    v6 = xmmword_18C736D20;
    v5 = -563086000;
    v4 = xmmword_18C736D34;
    AXDeviceSupportsPhotosensitiveMitigation_SupportsPSE = MGIsDeviceOneOfType() ^ 1;
    AXLogCommon();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AXDeviceSupportsPhotosensitiveMitigation_SupportsPSE, &v12, &v10, &v8, &v6, &v4, 0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v3 = v1;
      _os_log_impl(&dword_18C62B000, v0, OS_LOG_TYPE_DEFAULT, "Allowing PSE Support: %@", buf, 0xCu);

    }
  }
}

@end
