@implementation CCMutableSetChange

- (CCMutableSetChange)initWithSharedItem:(id)a3 changeType:(unsigned __int16)a4
{
  id v7;
  CCMutableSetChange *v8;
  CCMutableSetChange *v9;
  uint64_t v10;
  NSMutableOrderedSet *allDevices;
  uint64_t v12;
  NSMutableOrderedSet *addedDevices;
  uint64_t v14;
  NSMutableOrderedSet *removedDevices;
  uint64_t v16;
  NSMutableOrderedSet *allLocalInstances;
  uint64_t v18;
  NSMutableOrderedSet *addedLocalInstances;
  uint64_t v20;
  NSMutableOrderedSet *removedLocalInstances;
  objc_super v23;

  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CCMutableSetChange;
  v8 = -[CCMutableSetChange init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sharedItem, a3);
    v9->_sharedItemChangeType = a4;
    v10 = objc_opt_new();
    allDevices = v9->_allDevices;
    v9->_allDevices = (NSMutableOrderedSet *)v10;

    v12 = objc_opt_new();
    addedDevices = v9->_addedDevices;
    v9->_addedDevices = (NSMutableOrderedSet *)v12;

    v14 = objc_opt_new();
    removedDevices = v9->_removedDevices;
    v9->_removedDevices = (NSMutableOrderedSet *)v14;

    v16 = objc_opt_new();
    allLocalInstances = v9->_allLocalInstances;
    v9->_allLocalInstances = (NSMutableOrderedSet *)v16;

    v18 = objc_opt_new();
    addedLocalInstances = v9->_addedLocalInstances;
    v9->_addedLocalInstances = (NSMutableOrderedSet *)v18;

    v20 = objc_opt_new();
    removedLocalInstances = v9->_removedLocalInstances;
    v9->_removedLocalInstances = (NSMutableOrderedSet *)v20;

  }
  return v9;
}

- (BOOL)containsChanges
{
  return -[NSMutableOrderedSet count](self->_addedDevices, "count")
      || -[NSMutableOrderedSet count](self->_removedDevices, "count")
      || -[NSMutableOrderedSet count](self->_addedLocalInstances, "count")
      || -[NSMutableOrderedSet count](self->_removedLocalInstances, "count") != 0;
}

- (BOOL)containsContentHash:(id)a3
{
  CCSharedItem *sharedItem;
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  sharedItem = self->_sharedItem;
  v4 = a3;
  -[CCSharedItem sharedIdentifier](sharedItem, "sharedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToNumber:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CCSetChange *v4;
  uint64_t sharedItemChangeType;
  CCSharedItem *sharedItem;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CCSetChange *v13;

  v4 = [CCSetChange alloc];
  sharedItemChangeType = self->_sharedItemChangeType;
  sharedItem = self->_sharedItem;
  -[NSMutableOrderedSet array](self->_allDevices, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_addedDevices, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_removedDevices, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_allLocalInstances, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_addedLocalInstances, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_removedLocalInstances, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CCSetChange initWithSharedItem:sharedItemChangeType:allDevices:addedDevices:removedDevices:allLocalInstances:addedLocalInstances:removedLocalInstances:](v4, "initWithSharedItem:sharedItemChangeType:allDevices:addedDevices:removedDevices:allLocalInstances:addedLocalInstances:removedLocalInstances:", sharedItem, sharedItemChangeType, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (CCSharedItem)sharedItem
{
  return self->_sharedItem;
}

- (unsigned)sharedItemChangeType
{
  return self->_sharedItemChangeType;
}

- (void)setSharedItemChangeType:(unsigned __int16)a3
{
  self->_sharedItemChangeType = a3;
}

- (NSMutableOrderedSet)allDevices
{
  return self->_allDevices;
}

- (NSMutableOrderedSet)addedDevices
{
  return self->_addedDevices;
}

- (NSMutableOrderedSet)removedDevices
{
  return self->_removedDevices;
}

- (NSMutableOrderedSet)allLocalInstances
{
  return self->_allLocalInstances;
}

- (NSMutableOrderedSet)addedLocalInstances
{
  return self->_addedLocalInstances;
}

- (NSMutableOrderedSet)removedLocalInstances
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
