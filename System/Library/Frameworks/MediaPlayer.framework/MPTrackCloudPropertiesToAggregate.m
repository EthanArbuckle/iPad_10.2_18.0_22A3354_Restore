@implementation MPTrackCloudPropertiesToAggregate

void __MPTrackCloudPropertiesToAggregate_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playCountSinceSync"), CFSTR("skipCountSinceSync"), CFSTR("lastPlayedDate"), CFSTR("lastSkippedDate"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MPTrackCloudPropertiesToAggregate___trackPropertiesToAggregate;
  MPTrackCloudPropertiesToAggregate___trackPropertiesToAggregate = v0;

}

@end
