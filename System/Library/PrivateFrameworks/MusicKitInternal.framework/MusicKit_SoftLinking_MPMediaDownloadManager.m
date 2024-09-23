@implementation MusicKit_SoftLinking_MPMediaDownloadManager

+ (void)cancelAllDownloads
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v2 = (void *)getMPMediaDownloadManagerClass_softClass;
  v10 = getMPMediaDownloadManagerClass_softClass;
  if (!getMPMediaDownloadManagerClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getMPMediaDownloadManagerClass_block_invoke;
    v6[3] = &unk_1E9C05688;
    v6[4] = &v7;
    __getMPMediaDownloadManagerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v3, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allMediaDownloadLibraryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelDownloads:", v5);

}

@end
