@implementation CSUSearchableKnowledgeObjectStore(MediaAnalysis)

+ (id)mad_sharedStoreForPhotoLibrary:()MediaAnalysis
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[MADCSUStoreManager sharedCSUStoreManager](MADCSUStoreManager, "sharedCSUStoreManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedCSUStoreForPhotoLibrary:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
