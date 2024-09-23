@implementation BRSlotData

- (BRSlotData)initWithSlotData:(id)a3
{
  BRSlotData *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)BRSlotData;
    v4 = -[BRSlotData init](&v6, sel_init);
    if (v4)
    {
      v4->_slot = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "slot"), "copy");
      v4->_asset = (BRAsset *)(id)objc_msgSend(a3, "asset");
      v4->_isProgrammed = objc_msgSend(a3, "isProgrammed");
      v4->_refCount = objc_msgSend(a3, "refCount");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSlotData:", self);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRSlotData;
  -[BRSlotData dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRSlotData;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", -[BRSlotData description](&v7, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("Slot: %@;"), -[BRSlotData slot](self, "slot"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Asset: %@;"), -[BRSlotData asset](self, "asset"));
  v4 = -[BRSlotData isProgrammed](self, "isProgrammed");
  v5 = "N";
  if (v4)
    v5 = "Y";
  objc_msgSend(v3, "appendFormat:", CFSTR("IsProgammed: %s;"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("RefCount: %lu;"), -[BRSlotData refCount](self, "refCount"));
  return v3;
}

- (id)propertyList
{
  void *v3;
  NSNumber *v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  const char *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[BRSlotData slot](self, "slot"))
    v4 = -[BRSlotData slot](self, "slot");
  else
    v4 = (NSNumber *)&unk_24D4A5CB8;
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Slot"));
  if (-[BRAsset propertyList](-[BRSlotData asset](self, "asset"), "propertyList"))
    v5 = -[BRAsset propertyList](-[BRSlotData asset](self, "asset"), "propertyList");
  else
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Asset"));
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = -[BRSlotData isProgrammed](self, "isProgrammed");
  v8 = "N";
  if (v7)
    v8 = "Y";
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v6, "stringWithFormat:", CFSTR("%s;"), v8), CFSTR("IsProgrammed"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BRSlotData refCount](self, "refCount")), CFSTR("RefCount"));
  return v3;
}

- (NSNumber)slot
{
  return self->_slot;
}

- (void)setSlot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BRAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)isProgrammed
{
  return self->_isProgrammed;
}

- (void)setIsProgrammed:(BOOL)a3
{
  self->_isProgrammed = a3;
}

- (unint64_t)refCount
{
  return self->_refCount;
}

- (void)setRefCount:(unint64_t)a3
{
  self->_refCount = a3;
}

@end
