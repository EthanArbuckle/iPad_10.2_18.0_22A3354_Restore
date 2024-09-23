@implementation UIView(JITAppKit)

+ (id)jitappkit:()JITAppKit
{
  id v4;
  id v5;
  id location[3];

  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v4 = +[TKApplication shared](TKApplication, "shared");
  v5 = (id)objc_msgSend(v4, "loadView:", location[0]);

  objc_storeStrong(location, 0);
  return v5;
}

@end
