@implementation ABWelcomeModeZoomedInSceneParams

void __ABWelcomeModeZoomedInSceneParams_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  ABDefaultZoomedInSceneParams();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_250742790, CFSTR("Response"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)ABWelcomeModeZoomedInSceneParams_params;
  ABWelcomeModeZoomedInSceneParams_params = v1;

}

@end
