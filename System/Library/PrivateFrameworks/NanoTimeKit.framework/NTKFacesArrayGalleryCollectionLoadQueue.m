@implementation NTKFacesArrayGalleryCollectionLoadQueue

void __NTKFacesArrayGalleryCollectionLoadQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  NTKFacesArrayGalleryCollectionLoadQueue_usePrimaryQueue = 1;
  v0 = dispatch_queue_create("com.apple.nanotimekit.faces.gallery.primary", 0);
  v1 = (void *)NTKFacesArrayGalleryCollectionLoadQueue_primaryQueue;
  NTKFacesArrayGalleryCollectionLoadQueue_primaryQueue = (uint64_t)v0;

  v2 = dispatch_queue_create("com.apple.nanotimekit.faces.gallery.secondary", 0);
  v3 = (void *)NTKFacesArrayGalleryCollectionLoadQueue_secondaryQueue;
  NTKFacesArrayGalleryCollectionLoadQueue_secondaryQueue = (uint64_t)v2;

}

@end
