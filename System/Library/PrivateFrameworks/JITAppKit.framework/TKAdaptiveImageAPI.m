@implementation TKAdaptiveImageAPI

+ (void)registerService:(id)a3 handler:(id)a4
{
  id v4;
  id aBlock;
  id location[3];
  id v8;
  dispatch_once_t *v9;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  aBlock = 0;
  objc_storeStrong(&aBlock, a4);
  v9 = (dispatch_once_t *)&registerService_handler__onceToken;
  v8 = 0;
  objc_storeStrong(&v8, &__block_literal_global_10);
  if (*v9 != -1)
    dispatch_once(v9, v8);
  objc_storeStrong(&v8, 0);
  v4 = _Block_copy(aBlock);
  objc_msgSend((id)_handlers, "setObject:forKeyedSubscript:");

  if (!_defaultImageService)
    objc_storeStrong((id *)&_defaultImageService, location[0]);
  objc_storeStrong(&aBlock, 0);
  objc_storeStrong(location, 0);
}

void __46__TKAdaptiveImageAPI_registerService_handler___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)_handlers;
  _handlers = (uint64_t)v0;

}

+ (id)getService:(id)a3
{
  id v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!location[0])
    objc_storeStrong(location, (id)_defaultImageService);
  v4 = (id)objc_msgSend((id)_handlers, "objectForKeyedSubscript:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)defaultImageService
{
  return (id)_defaultImageService;
}

+ (void)setDefaultImageService:(id)a3
{
  uint64_t v3;
  void *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "copy");
  v4 = (void *)_defaultImageService;
  _defaultImageService = v3;

  objc_storeStrong(location, 0);
}

@end
