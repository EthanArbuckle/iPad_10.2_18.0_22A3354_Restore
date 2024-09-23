@implementation NSFileManager(protobuf)

- (id)blt_contactImagesDirectory
{
  void *v0;
  void *v1;
  char v2;
  id v3;
  NSObject *v4;
  id v5;
  id v7;

  BLTFileURLInPairingPath(CFSTR("ContactImages"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v2 = objc_msgSend(v1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v0, 1, 0, &v7);
    v3 = v7;

    if ((v2 & 1) == 0)
    {
      blt_general_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[NSFileManager(protobuf) blt_contactImagesDirectory].cold.1();

    }
    v5 = v0;

  }
  return v0;
}

- (void)blt_contactImagesDirectory
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0(&dword_2173D9000, v0, v1, "Error %@ when creating contact icons directory: %@");
  OUTLINED_FUNCTION_5();
}

@end
