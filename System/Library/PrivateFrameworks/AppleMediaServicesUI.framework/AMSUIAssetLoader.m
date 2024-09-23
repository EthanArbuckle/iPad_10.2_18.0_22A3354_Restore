@implementation AMSUIAssetLoader

+ (AMSUIAssetLoader)sharedLoader
{
  return (AMSUIAssetLoader *)static AssetLoader.shared.getter();
}

- (id)fetchWithAssetURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  AMSUIAssetLoader *v8;
  id v9;
  uint64_t v11;

  v4 = sub_211244FE0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211244FA4();
  v8 = self;
  v9 = sub_2111CDC38((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (AMSUIAssetLoader)init
{
  return (AMSUIAssetLoader *)AssetLoader.init()();
}

- (void).cxx_destruct
{

}

@end
