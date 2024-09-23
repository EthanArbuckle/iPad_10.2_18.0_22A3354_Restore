@implementation HMMutableUserListeningHistoryUpdateControl

- (HMMutableUserListeningHistoryUpdateControl)initWithAccessories:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMMutableUserListeningHistoryUpdateControl;
  return -[HMUserListeningHistoryUpdateControl initWithAccessories:](&v4, sel_initWithAccessories_, a3);
}

- (NSArray)accessories
{
  return (NSArray *)-[NSMutableSet allObjects](self->super._internalAccessories, "allObjects");
}

- (void)setAccessories:(id)a3
{
  void *v4;
  NSMutableSet *v5;
  NSMutableSet *internalAccessories;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v7 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setWithArray:", v7);
  v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  internalAccessories = self->super._internalAccessories;
  self->super._internalAccessories = v5;

}

- (void)addAccessory:(id)a3
{
  -[NSMutableSet addObject:](self->super._internalAccessories, "addObject:", a3);
}

- (void)removeAccessory:(id)a3
{
  -[NSMutableSet removeObject:](self->super._internalAccessories, "removeObject:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMUserListeningHistoryUpdateControl *v4;
  void *v5;
  void *v6;
  HMUserListeningHistoryUpdateControl *v7;

  v4 = [HMUserListeningHistoryUpdateControl alloc];
  -[HMMutableUserListeningHistoryUpdateControl accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[HMUserListeningHistoryUpdateControl initWithAccessories:](v4, "initWithAccessories:", v6);

  return v7;
}

@end
