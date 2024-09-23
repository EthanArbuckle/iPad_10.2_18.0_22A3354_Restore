@implementation _GEOOfflineSupportTileGroupObserver

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a5, "urlInfoSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasOfflineDataDownloadBaseURL");

  objc_msgSend(v6, "urlInfoSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v9, "hasOfflineDataDownloadBaseURL");
  if (v8 != (_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("GEOSupportsOfflineMapsDidChangeNotificationName"), 0);

  }
}

@end
