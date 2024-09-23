@implementation NSDictionary(CPSUtilities)

- (id)cps_mutableDictionaryWithValuesForKeys:()CPSUtilities
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  id v15;

  v15 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = location[0];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __69__NSDictionary_CPSUtilities__cps_mutableDictionaryWithValuesForKeys___block_invoke;
  v10 = &unk_24E270E28;
  v11 = v15;
  v12 = v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:");
  v5 = v13;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v5;
}

@end
