@implementation NSDictionary

void __69__NSDictionary_CPSUtilities__cps_mutableDictionaryWithValuesForKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v5;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", location[0]);

  if (v5)
  {
    v2 = *(void **)(a1 + 40);
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", location[0]);
    objc_msgSend(v2, "setObject:forKey:");

  }
  objc_storeStrong(location, 0);
}

@end
