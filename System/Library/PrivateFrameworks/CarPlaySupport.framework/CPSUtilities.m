@implementation CPSUtilities

+ (id)sharedInstance
{
  uint64_t obj;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  SEL v9;
  id v10;
  id location;
  dispatch_once_t *v12;

  v10 = a1;
  v9 = a2;
  obj = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __30__CPSUtilities_sharedInstance__block_invoke;
  v7 = &__block_descriptor_40_e5_v8__0l;
  v8 = a1;
  v12 = (dispatch_once_t *)&sharedInstance_onceToken_0;
  location = 0;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1)
    dispatch_once(v12, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance___utilities;
}

void __30__CPSUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___utilities;
  sharedInstance___utilities = (uint64_t)v1;

}

- (unint64_t)lastButtonPressInteractionModel
{
  return self->_lastButtonPressInteractionModel;
}

- (void)setLastButtonPressInteractionModel:(unint64_t)a3
{
  self->_lastButtonPressInteractionModel = a3;
}

@end
