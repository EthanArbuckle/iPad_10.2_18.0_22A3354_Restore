@implementation ICCameraFile(PHImport)

- (id)uuid
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_sync_enter(v1);
  objc_msgSend(v1, "userData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PHImportFileUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "userData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("PHImportFileUUID"));

  }
  objc_sync_exit(v1);

  return v3;
}

@end
