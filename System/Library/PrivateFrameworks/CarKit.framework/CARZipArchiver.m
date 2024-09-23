@implementation CARZipArchiver

- (BOOL)archiveDirectory:(id)a3 toLocation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  BOMCopierNew();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler();
  v12[0] = CFSTR("createPKZip");
  v12[1] = CFSTR("enableLogging");
  v13[0] = MEMORY[0x1E0C9AAB0];
  v13[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
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
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  BOMCopierNew();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler();
  v12[0] = CFSTR("extractPKZip");
  v12[1] = CFSTR("enableLogging");
  v13[0] = MEMORY[0x1E0C9AAB0];
  v13[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
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
