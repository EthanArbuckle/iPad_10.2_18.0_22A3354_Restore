@implementation AVTAssetLibrary

- (void)reload
{
  uint64_t i;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  for (i = 0; i != 42; ++i)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_assets[i];
    self->_assets[i] = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_assetsByName[i];
    self->_assetsByName[i] = v6;

  }
  v8 = 0;
  v9 = MEMORY[0x1E0C809B0];
  do
  {
    AVTPrecompiledMemojiAssetsForComponentType(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __25__AVTAssetLibrary_reload__block_invoke;
    v11[3] = &unk_1EA61DF80;
    v11[4] = self;
    v11[5] = v8;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

    ++v8;
  }
  while (v8 != 42);
}

void __25__AVTAssetLibrary_reload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  AVTAsset *v8;
  uint64_t v9;
  void *v10;
  AVTAsset *v11;
  id v12;

  v5 = a3;
  v6 = a2;
  +[AVTResourceLocator sharedResourceLocator]();
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator urlForMemojiAssetAtPath:isDirectory:](v7, (uint64_t)v5, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [AVTAsset alloc];
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v12, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVTAsset initWithType:identifier:path:](v8, "initWithType:identifier:path:", v9, v6, v10);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8 * *(_QWORD *)(a1 + 40) + 8), "addObject:", v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8 * *(_QWORD *)(a1 + 40) + 344), "setObject:forKeyedSubscript:", v11, v6);

}

+ (id)sharedAssetLibrary
{
  if (sharedAssetLibrary_onceToken != -1)
    dispatch_once(&sharedAssetLibrary_onceToken, &__block_literal_global_1);
  return (id)sharedAssetLibrary_sharedInstance;
}

uint64_t __37__AVTAssetLibrary_sharedAssetLibrary__block_invoke()
{
  AVTAssetLibrary *v0;
  void *v1;

  v0 = objc_alloc_init(AVTAssetLibrary);
  v1 = (void *)sharedAssetLibrary_sharedInstance;
  sharedAssetLibrary_sharedInstance = (uint64_t)v0;

  return objc_msgSend((id)sharedAssetLibrary_sharedInstance, "reload");
}

- (id)assetWithType:(int64_t)a3 identifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a3 == 42)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_assetsByName[a3], "objectForKeyedSubscript:", a4, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 672; i != 336; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end
