@implementation CCSetChange

- (CCSetChange)initWithSharedItem:(id)a3 sharedItemChangeType:(unsigned __int16)a4 allDevices:(id)a5 addedDevices:(id)a6 removedDevices:(id)a7 allLocalInstances:(id)a8 addedLocalInstances:(id)a9 removedLocalInstances:(id)a10
{
  id v16;
  id v17;
  CCSetChange *v18;
  CCSetChange *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v16 = a9;
  v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)CCSetChange;
  v18 = -[CCSetChange init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_sharedItemChangeType = a4;
    objc_storeStrong((id *)&v18->_sharedItem, a3);
    objc_storeStrong((id *)&v19->_allDevices, a5);
    objc_storeStrong((id *)&v19->_addedDevices, a6);
    objc_storeStrong((id *)&v19->_removedDevices, a7);
    objc_storeStrong((id *)&v19->_allLocalInstances, a8);
    objc_storeStrong((id *)&v19->_addedLocalInstances, a9);
    objc_storeStrong((id *)&v19->_removedLocalInstances, a10);
  }

  return v19;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCSetChange sharedItem](self, "sharedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("\n%@ with sharedIdentifier: %@"), v5, v7);

  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10 = -[CCSetChange sharedItemChangeType](self, "sharedItemChangeType");
  v11 = CFSTR("None");
  if (!v10)
    v11 = CFSTR("SharedItemAdded");
  if (v10 == 2)
    v11 = CFSTR("SharedItemRemoved");
  v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("sharedItemChangeType: %@"), v11);
  v13 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[CCSetChange sharedItem](self, "sharedItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("sharedItem: %@"), v14);

  v16 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[CCSetChange addedDevices](self, "addedDevices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("addedDevices: %@"), v17);

  v19 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[CCSetChange removedDevices](self, "removedDevices");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("removedDevices: %@"), v20);

  v21 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[CCSetChange addedLocalInstances](self, "addedLocalInstances");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("addedLocalInstances: %@"), v22);

  v24 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[CCSetChange removedLocalInstances](self, "removedLocalInstances");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("removedLocalInstances: %@"), v25);

  v27 = (void *)objc_opt_new();
  v40 = (void *)v8;
  objc_msgSend(v27, "addObject:", v8);
  objc_msgSend(v27, "addObject:", v15);
  v28 = (void *)v12;
  objc_msgSend(v27, "addObject:", v12);
  -[CCSetChange addedDevices](self, "addedDevices");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30)
    objc_msgSend(v27, "addObject:", v18);
  -[CCSetChange addedLocalInstances](self, "addedLocalInstances");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
    objc_msgSend(v27, "addObject:", v23);
  -[CCSetChange removedDevices](self, "removedDevices");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
    objc_msgSend(v27, "addObject:", v39);
  -[CCSetChange removedLocalInstances](self, "removedLocalInstances");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36)
    objc_msgSend(v27, "addObject:", v26);
  objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  CCSetChange *v4;
  CCSetChange *v5;
  BOOL v6;

  v4 = (CCSetChange *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCSetChange isEqualToSetChange:](self, "isEqualToSetChange:", v5);

  return v6;
}

- (BOOL)isEqualToSetChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int sharedItemChangeType;
  NSArray *allDevices;
  void *v9;
  BOOL v10;
  NSArray *addedDevices;
  void *v12;
  BOOL v13;
  NSArray *removedDevices;
  void *v15;
  BOOL v16;
  NSArray *allLocalInstances;
  void *v18;
  BOOL v19;
  NSArray *addedLocalInstances;
  void *v21;
  BOOL v22;
  NSArray *removedLocalInstances;
  void *v24;
  BOOL v25;
  char v26;
  char v28;

  v4 = a3;
  -[CCSetChange sharedItem](self, "sharedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v5, "isEqual:", v6);

  sharedItemChangeType = self->_sharedItemChangeType;
  LODWORD(v5) = objc_msgSend(v4, "sharedItemChangeType");
  allDevices = self->_allDevices;
  objc_msgSend(v4, "allDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSArray isEqualToArray:](allDevices, "isEqualToArray:", v9);

  addedDevices = self->_addedDevices;
  objc_msgSend(v4, "addedDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NSArray isEqualToArray:](addedDevices, "isEqualToArray:", v12);

  removedDevices = self->_removedDevices;
  objc_msgSend(v4, "removedDevices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NSArray isEqualToArray:](removedDevices, "isEqualToArray:", v15);

  allLocalInstances = self->_allLocalInstances;
  objc_msgSend(v4, "allLocalInstances");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NSArray isEqualToArray:](allLocalInstances, "isEqualToArray:", v18);

  addedLocalInstances = self->_addedLocalInstances;
  objc_msgSend(v4, "addedLocalInstances");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[NSArray isEqualToArray:](addedLocalInstances, "isEqualToArray:", v21);

  removedLocalInstances = self->_removedLocalInstances;
  objc_msgSend(v4, "removedLocalInstances");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[NSArray isEqualToArray:](removedLocalInstances, "isEqualToArray:", v24);
  v26 = v28;
  if (sharedItemChangeType != (_DWORD)v5)
    v26 = 0;
  return v26 & (v10 && v13) & (v16 && v19 && v22) & v25;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = -[CCSharedItem hash](self->_sharedItem, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_sharedItemChangeType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[NSArray hash](self->_allDevices, "hash");
  v7 = v5 ^ v6 ^ -[NSArray hash](self->_addedDevices, "hash");
  v8 = -[NSArray hash](self->_removedDevices, "hash");
  v9 = v8 ^ -[NSArray hash](self->_allLocalInstances, "hash");
  v10 = v9 ^ -[NSArray hash](self->_addedLocalInstances, "hash");
  v11 = v7 ^ v10 ^ -[NSArray hash](self->_removedLocalInstances, "hash");

  return v11;
}

- (CCSharedItem)sharedItem
{
  return self->_sharedItem;
}

- (unsigned)sharedItemChangeType
{
  return self->_sharedItemChangeType;
}

- (NSArray)allDevices
{
  return self->_allDevices;
}

- (NSArray)addedDevices
{
  return self->_addedDevices;
}

- (NSArray)removedDevices
{
  return self->_removedDevices;
}

- (NSArray)allLocalInstances
{
  return self->_allLocalInstances;
}

- (NSArray)addedLocalInstances
{
  return self->_addedLocalInstances;
}

- (NSArray)removedLocalInstances
{
  return self->_removedLocalInstances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedLocalInstances, 0);
  objc_storeStrong((id *)&self->_addedLocalInstances, 0);
  objc_storeStrong((id *)&self->_allLocalInstances, 0);
  objc_storeStrong((id *)&self->_removedDevices, 0);
  objc_storeStrong((id *)&self->_addedDevices, 0);
  objc_storeStrong((id *)&self->_allDevices, 0);
  objc_storeStrong((id *)&self->_sharedItem, 0);
}

@end
