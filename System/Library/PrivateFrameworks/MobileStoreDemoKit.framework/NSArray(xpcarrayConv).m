@implementation NSArray(xpcarrayConv)

+ (id)arrayWithXPCArray:()xpcarrayConv
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDBCE30];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithXPCArray:", v4);

  return v5;
}

- (id)initWithXPCArray:()xpcarrayConv
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy_;
  v16[3] = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __42__NSArray_xpcarrayConv__initWithXPCArray___block_invoke;
  v12 = &unk_24D0AD588;
  v14 = &v15;
  v5 = a1;
  v13 = v5;
  if (xpc_array_apply(v4, &v9))
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[NSArray(xpcarrayConv) initWithXPCArray:].cold.1((uint64_t)v16, v6);

    v5 = (id)objc_msgSend(v5, "initWithArray:", *(_QWORD *)(v16[0] + 40), v9, v10, v11, v12);
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)xpcArrayFromArray
{
  xpc_object_t v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = xpc_array_create(0, 0);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke;
  v6[3] = &unk_24D0AD5B0;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v6);
  if (*((_BYTE *)v10 + 24))
    v4 = v3;
  else
    v4 = 0;

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)initWithXPCArray:()xpcarrayConv .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_213A7E000, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSArray: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
