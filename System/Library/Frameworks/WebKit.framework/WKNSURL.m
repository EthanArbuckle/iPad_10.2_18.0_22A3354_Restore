@implementation WKNSURL

- (id)_web_createTarget
{
  uint64_t v2;
  Object *v3;
  API::Object *v4;
  void *v5;

  v2 = *MEMORY[0x1E0C9AE00];
  v3 = -[WKObject _apiObject](self, "_apiObject");
  v5 = (void *)API::Object::wrap((uint64_t)v3, v4);
  return WKURLCopyCFURL(v2, v5);
}

@end
