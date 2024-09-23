@implementation NMSSyncedMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NMSMediaItemGroup type](self, "type") == a3)
  {
    -[NMSMediaItemGroup referenceObj](self, "referenceObj");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDDC758]);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__NMSSyncedMediaItemGroup_identifiersForContainerType___block_invoke;
    v12[3] = &unk_24D6471F0;
    v13 = v6;
    v8 = v6;
    v9 = (void *)objc_msgSend(v7, "initWithBlock:", v12);
    objc_msgSend(v5, "addObject:", v9);

  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

void __55__NMSSyncedMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));

}

@end
