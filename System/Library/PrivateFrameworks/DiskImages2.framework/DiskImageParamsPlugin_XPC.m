@implementation DiskImageParamsPlugin_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unique_ptr<DiskImage, std::default_delete<DiskImage>> v6;
  id v7;

  v3 = v2;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "pluginHeader");
  v5 = operator new();
  DiskImagePlugin::DiskImagePlugin(v5, v4);
  *v3 = v5;

  return v6;
}

- (unint64_t)numBlocks
{
  void *v2;
  unint64_t v3;

  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)objc_msgSend(v2, "pluginHeader") + 16))();

  return v3;
}

- (BOOL)isWritableFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
