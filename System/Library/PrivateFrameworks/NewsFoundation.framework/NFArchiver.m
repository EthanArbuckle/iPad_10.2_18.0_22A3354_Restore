@implementation NFArchiver

- (BOOL)archiveDirectory:(id)a3 toLocation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  BOMCopierNew();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler();
  v12 = CFSTR("createPKZip");
  v13[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v9, "fileSystemRepresentation");

  v10 = objc_retainAutorelease(v5);
  objc_msgSend(v10, "fileSystemRepresentation");

  LODWORD(v10) = BOMCopierCopyWithOptions();
  BOMCopierFree();

  return (_DWORD)v10 == 0;
}

- (BOOL)unarchive:(id)a3 toLocation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  BOMCopierNew();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler();
  v12 = CFSTR("extractPKZip");
  v13[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v9, "fileSystemRepresentation");

  v10 = objc_retainAutorelease(v5);
  objc_msgSend(v10, "fileSystemRepresentation");

  LODWORD(v10) = BOMCopierCopyWithOptions();
  BOMCopierFree();

  return (_DWORD)v10 == 0;
}

@end
