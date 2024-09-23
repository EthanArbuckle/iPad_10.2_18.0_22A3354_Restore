@implementation CPAlertAction(UIKitBridging)

- (id)alertActionRepresentationWithHandler:()UIKitBridging
{
  void *v4;
  id v5;
  id v6;
  id location[2];
  id v8;

  v8 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  if ((unint64_t)objc_msgSend(v8, "style") <= 2)
    objc_msgSend(v8, "style");
  v4 = (void *)MEMORY[0x24BDF67E8];
  v5 = (id)objc_msgSend(v8, "title");
  v6 = (id)objc_msgSend(v4, "actionWithTitle:style:handler:");

  objc_storeStrong(location, 0);
  return v6;
}

@end
