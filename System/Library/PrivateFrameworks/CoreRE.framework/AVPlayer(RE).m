@implementation AVPlayer(RE)

- (id)addEndpoint:()RE
{
  uint64_t v4;
  id v5;
  re *v6;
  int v7;
  NSObject *v8;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    re::internal::assertLog((re::internal *)4, v4, "assertion failure: '%s' (%s:line %i) ", "endpoint", "-[AVPlayer(RE) addEndpoint:]", 84);
    _os_crash();
    __break(1u);
  }
  CFAllocatorGetDefault();
  v6 = (re *)FigVideoTargetCreateWithVideoReceiverEndpointID();
  v7 = (int)v6;
  if ((_DWORD)v6)
  {
    v8 = *re::assetTypesLogObjects(v6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v7;
      _os_log_error_impl(&dword_224FE9000, v8, OS_LOG_TYPE_ERROR, "Failed to create video target from endpoint (error: %d)", buf, 8u);
    }
  }
  else
  {
    objc_msgSend(a1, "addVideoTarget:", 0);
  }

  return 0;
}

- (void)removeEndpoint:()RE
{
  id v4;

  v4 = a3;
  if (v4)
    objc_msgSend(a1, "removeVideoTarget:", v4);

}

- (double)videoTrackNaturalSize
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;

  objc_msgSend(a1, "currentItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0.0;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "naturalSize");
    v4 = v6;

  }
  return v4;
}

@end
