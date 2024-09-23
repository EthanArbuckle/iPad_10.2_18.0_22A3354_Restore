@implementation NAIdentityBuilder(NAUIAdditions)

- (uint64_t)appendCGFloatCharacteristic:()NAUIAdditions
{
  return objc_msgSend(a1, "appendCGFloatCharacteristic:withRole:", a3, 3);
}

- (uint64_t)appendCGPointCharacteristic:()NAUIAdditions
{
  return objc_msgSend(a1, "appendCGPointCharacteristic:withRole:", a3, 3);
}

- (uint64_t)appendCGRectCharacteristic:()NAUIAdditions
{
  return objc_msgSend(a1, "appendCGRectCharacteristic:withRole:", a3, 3);
}

- (id)appendCGFloatCharacteristic:()NAUIAdditions withRole:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__NAIdentityBuilder_NAUIAdditions__appendCGFloatCharacteristic_withRole___block_invoke;
  v11[3] = &unk_24D612740;
  v12 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x219A0070C](v11);
  objc_msgSend(a1, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", v8, a4, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)appendCGPointCharacteristic:()NAUIAdditions withRole:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__NAIdentityBuilder_NAUIAdditions__appendCGPointCharacteristic_withRole___block_invoke;
  v10[3] = &unk_24D612740;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", v10, a4, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)appendCGRectCharacteristic:()NAUIAdditions withRole:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__NAIdentityBuilder_NAUIAdditions__appendCGRectCharacteristic_withRole___block_invoke;
  v10[3] = &unk_24D612740;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", v10, a4, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
