@implementation NUNIAegirCloudCoverService

- (NUNIAegirCloudCoverService)initWithImageScale:(float)a3
{
  NUNIAegirCloudCoverService *v4;
  _TtC12NanoUniverse22AegirCloudCoverService *v5;
  double v6;
  uint64_t v7;
  _TtC12NanoUniverse22AegirCloudCoverService *cloudService;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NUNIAegirCloudCoverService;
  v4 = -[NUNIAegirCloudCoverService init](&v10, sel_init);
  if (v4)
  {
    v5 = [_TtC12NanoUniverse22AegirCloudCoverService alloc];
    *(float *)&v6 = a3;
    v7 = -[AegirCloudCoverService initWithImageScale:](v5, "initWithImageScale:", v6);
    cloudService = v4->_cloudService;
    v4->_cloudService = (_TtC12NanoUniverse22AegirCloudCoverService *)v7;

  }
  return v4;
}

- (void)setDirectory:(id)a3
{
  -[AegirCloudCoverService setDirectory:](self->_cloudService, "setDirectory:", a3);
}

- (NSURL)directory
{
  return -[AegirCloudCoverService directory](self->_cloudService, "directory");
}

- (void)retrieveCloudTextureURLs:(id)a3
{
  -[AegirCloudCoverService retrieveCloudTextureURLsWithNotifyOn:completionHandler:](self->_cloudService, "retrieveCloudTextureURLsWithNotifyOn:completionHandler:", MEMORY[0x24BDAC9B8], a3);
}

- (BOOL)shouldFetchData
{
  return -[AegirCloudCoverService canFetchData](self->_cloudService, "canFetchData");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudService, 0);
}

@end
