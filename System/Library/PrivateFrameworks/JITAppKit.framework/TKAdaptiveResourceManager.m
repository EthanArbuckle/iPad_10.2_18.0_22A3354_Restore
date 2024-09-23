@implementation TKAdaptiveResourceManager

+ (void)addObject:(id)a3
{
  void *v3;
  id v4;
  id location[2];
  id v6;

  v6 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(v6, "setup");
  v3 = (void *)_references;
  v4 = (id)objc_msgSend(MEMORY[0x24BEBA7B8], "weakReferenceWithObject:", location[0]);
  objc_msgSend(v3, "addObject:");

  objc_storeStrong(location, 0);
}

+ (void)removeObject:(id)a3
{
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *, void *, uint64_t, _BYTE *);
  void *v8;
  id v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)_references;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __42__TKAdaptiveResourceManager_removeObject___block_invoke;
  v8 = &unk_24E099E48;
  v9 = location[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __42__TKAdaptiveResourceManager_removeObject___block_invoke(id *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v4;
  BOOL v8;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(location[0], "object");
  v8 = v4 != a1[4];

  if (!v8)
  {
    objc_msgSend((id)_references, "removeObjectAtIndex:", a3);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

+ (void)setOverrideTrackingAdaptiveView:(id)a3
{
  id v3;
  id v4;
  id v5;
  id location[2];
  id v7;

  v7 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!location[0])
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v3 = (id)objc_msgSend(v5, "keyWindow");
    v4 = location[0];
    location[0] = v3;

  }
  objc_storeStrong((id *)&_trackingAdaptiveView, location[0]);
  objc_msgSend(v7, "adaptiveMetricsDidChange");
  objc_storeStrong(location, 0);
}

+ (id)traitCollection
{
  return (id)_traitCollection;
}

+ (CGSize)readableContentSize
{
  double v2;
  double v3;
  CGSize result;

  v3 = *((double *)&_readableContentSize + 1);
  v2 = *(double *)&_readableContentSize;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v3 = *((double *)&_size + 1);
  v2 = *(double *)&_size;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (void)setup
{
  uint64_t obj;
  int v3;
  int v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  SEL v8;
  id v9;
  id location;
  dispatch_once_t *v11;

  v9 = a1;
  v8 = a2;
  obj = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __34__TKAdaptiveResourceManager_setup__block_invoke;
  v6 = &__block_descriptor_40_e5_v8__0l;
  v7 = a1;
  v11 = (dispatch_once_t *)&setup_onceToken_0;
  location = 0;
  objc_storeStrong(&location, &obj);
  if (*v11 != -1)
    dispatch_once(v11, location);
  objc_storeStrong(&location, 0);
}

void __34__TKAdaptiveResourceManager_setup__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 64);
  v2 = (void *)_references;
  _references = v1;

  _readableContentSize = *MEMORY[0x24BDBF148];
  _size = *MEMORY[0x24BDBF148];
  if (!_trackingAdaptiveView)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v3 = (id)objc_msgSend(v5, "keyWindow");
    v4 = (void *)_trackingAdaptiveView;
    _trackingAdaptiveView = (uint64_t)v3;

    if (_trackingAdaptiveView)
      objc_msgSend(*(id *)(a1 + 32), "adaptiveMetricsDidChange");
  }
}

+ (void)windowSizeDidChange:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  BOOL v6;
  uint64_t block;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id location[2];
  id v14;

  v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)_trackingAdaptiveView;
  v3 = (id)objc_msgSend(location[0], "object");
  v6 = v5 != v3;

  if (!v6)
  {
    v4 = MEMORY[0x24BDAC9B8];
    block = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __49__TKAdaptiveResourceManager_windowSizeDidChange___block_invoke;
    v11 = &__block_descriptor_40_e5_v8__0l;
    v12 = v14;
    dispatch_async(v4, &block);

  }
  objc_storeStrong(location, 0);
}

uint64_t __49__TKAdaptiveResourceManager_windowSizeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "adaptiveMetricsDidChange", a1, a1);
}

+ (void)adaptiveMetricsDidChange
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id obj[3];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  SEL v18;
  id v19;

  v19 = a1;
  v18 = a2;
  if (_trackingAdaptiveView)
  {
    objc_msgSend((id)_trackingAdaptiveView, "frame");
    v14 = v2;
    v15 = v3;
    *(_QWORD *)&v16 = v4;
    *((_QWORD *)&v16 + 1) = v5;
    v17 = v16;
    v10 = (id)objc_msgSend((id)_trackingAdaptiveView, "readableContentGuide");
    objc_msgSend(v10, "layoutFrame");
    obj[1] = v6;
    obj[2] = v7;
    *(_QWORD *)&v12 = v8;
    *((_QWORD *)&v12 + 1) = v9;
    v13 = v12;

    obj[0] = (id)objc_msgSend((id)_trackingAdaptiveView, "traitCollection");
    if (!__CGSizeEqualToSize(*(double *)&_size, *((double *)&_size + 1), *(double *)&v16, *((double *)&v16 + 1))
      || !__CGSizeEqualToSize(*(double *)&_readableContentSize, *((double *)&_readableContentSize + 1), *(double *)&v13, *((double *)&v13 + 1))|| (id)_traitCollection != obj[0])
    {
      _size = v17;
      _readableContentSize = v13;
      objc_storeStrong((id *)&_traitCollection, obj[0]);
      objc_msgSend((id)_references, "enumerateObjectsWithOptions:usingBlock:", 2, &__block_literal_global_7);
    }
    objc_storeStrong(obj, 0);
  }
}

void __53__TKAdaptiveResourceManager_adaptiveMetricsDidChange__block_invoke(void *a1, void *a2)
{
  id v2;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = (id)objc_msgSend(location[0], "object");
  objc_msgSend(v2, "adaptiveMetricsDidChange");

  objc_storeStrong(location, 0);
}

@end
