@implementation PHSearchEntityDeleteRequest

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteObject:", v5);

}

+ (void)deleteAllSearchEntities
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHSearchEntity fetchSearchEntitiesWithOptions:](PHSearchEntity, "fetchSearchEntitiesWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = +[PHObjectDeleteRequest deleteRequestsForObjects:ofType:forSelector:](PHSearchEntityDeleteRequest, "deleteRequestsForObjects:ofType:forSelector:", v4, objc_opt_class(), a2);
}

@end
