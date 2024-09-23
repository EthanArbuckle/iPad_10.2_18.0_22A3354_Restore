@implementation NSArray(DOCNode)

- (id)fpfs_syncFPItemsFromNodes
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id obj;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  _QWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v3 = dispatch_group_create();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a1;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        dispatch_group_enter(v3);
        v13[0] = v6;
        v13[1] = 3221225472;
        v13[2] = __45__NSArray_DOCNode__fpfs_syncFPItemsFromNodes__block_invoke;
        v13[3] = &unk_24C0FE810;
        v16 = v21;
        v14 = v2;
        v15 = v3;
        objc_msgSend(v8, "fetchFPItem:", v13);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v4);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v9 = objc_msgSend(v2, "count");
  if (v9 == objc_msgSend(obj, "count"))
    v10 = v2;
  else
    v10 = (id)MEMORY[0x24BDBD1A8];
  _Block_object_dispose(v21, 8);

  return v10;
}

@end
