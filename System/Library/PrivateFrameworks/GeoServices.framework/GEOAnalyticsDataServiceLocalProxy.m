@implementation GEOAnalyticsDataServiceLocalProxy

- (int)networkEventFileDescriptorForRepresentativeDate:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  +[GEONetworkEventFileManager sharedManager](GEONetworkEventFileManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileDescriptorOfNetworkEventDataFileForRepresentativeDate:", v3);

  return v5;
}

- (int)requestResponseMetadataFileDescriptorForBatchID:(unint64_t)a3
{
  void *v4;

  +[GEORequestResponseMetadataFileManager sharedManager](GEORequestResponseMetadataFileManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v4, "fileDescriptorOfRequestResponseMetadataFileForBatchID:", a3);

  return a3;
}

@end
