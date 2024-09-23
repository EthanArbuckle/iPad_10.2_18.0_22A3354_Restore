@implementation NSArray(CPSUtilities)

- (id)cps_map:()CPSUtilities
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *, void *, void *);
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
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v4 = v15;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __33__NSArray_CPSUtilities__cps_map___block_invoke;
  v10 = &unk_24E270DD8;
  v12 = location[0];
  v11 = v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:");
  v5 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)cps_filter:()CPSUtilities
{
  id v4;
  id v5;
  id v6[2];
  int v7;
  int v8;
  uint64_t (*v9)(_QWORD *, void *);
  void *v10;
  id v11;
  id v12;
  id location[2];
  id v14;

  v14 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v4 = v14;
  v6[1] = (id)MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __36__NSArray_CPSUtilities__cps_filter___block_invoke;
  v10 = &unk_24E270E00;
  v11 = location[0];
  v12 = (id)objc_msgSend(v4, "indexesOfObjectsPassingTest:");
  v6[0] = (id)objc_msgSend(v14, "objectsAtIndexes:", v12);
  v5 = v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v5;
}

@end
