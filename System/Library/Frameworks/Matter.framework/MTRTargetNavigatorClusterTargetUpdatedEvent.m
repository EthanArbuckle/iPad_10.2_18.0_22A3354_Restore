@implementation MTRTargetNavigatorClusterTargetUpdatedEvent

- (MTRTargetNavigatorClusterTargetUpdatedEvent)init
{
  const char *v2;
  uint64_t v3;
  MTRTargetNavigatorClusterTargetUpdatedEvent *v4;
  uint64_t v5;
  NSArray *targetList;
  NSNumber *currentTarget;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSData *data;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTRTargetNavigatorClusterTargetUpdatedEvent;
  v4 = -[MTRTargetNavigatorClusterTargetUpdatedEvent init](&v13, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    targetList = v4->_targetList;
    v4->_targetList = (NSArray *)v5;

    currentTarget = v4->_currentTarget;
    v4->_currentTarget = (NSNumber *)&unk_250591B18;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    data = v4->_data;
    v4->_data = (NSData *)v10;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTargetNavigatorClusterTargetUpdatedEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v4 = objc_alloc_init(MTRTargetNavigatorClusterTargetUpdatedEvent);
  objc_msgSend_targetList(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetList_(v4, v8, (uint64_t)v7);

  objc_msgSend_currentTarget(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrentTarget_(v4, v12, (uint64_t)v11);

  objc_msgSend_data(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setData_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSArray *targetList;
  NSNumber *currentTarget;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  targetList = self->_targetList;
  currentTarget = self->_currentTarget;
  objc_msgSend_base64EncodedStringWithOptions_(self->_data, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: targetList:%@; currentTarget:%@; data:%@; >"),
    v5,
    targetList,
    currentTarget,
    v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)targetList
{
  return self->_targetList;
}

- (void)setTargetList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)currentTarget
{
  return self->_currentTarget;
}

- (void)setCurrentTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_currentTarget, 0);
  objc_storeStrong((id *)&self->_targetList, 0);
}

@end
