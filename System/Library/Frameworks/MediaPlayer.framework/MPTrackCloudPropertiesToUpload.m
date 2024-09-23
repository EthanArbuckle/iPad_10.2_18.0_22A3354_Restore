@implementation MPTrackCloudPropertiesToUpload

void __MPTrackCloudPropertiesToUpload_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("likedState"), CFSTR("rating"), CFSTR("_itemLikedState"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MPTrackCloudPropertiesToUpload___trackPropertiesToUpload;
  MPTrackCloudPropertiesToUpload___trackPropertiesToUpload = v0;

}

@end
