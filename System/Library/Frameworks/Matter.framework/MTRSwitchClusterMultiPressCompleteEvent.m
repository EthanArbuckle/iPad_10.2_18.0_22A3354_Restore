@implementation MTRSwitchClusterMultiPressCompleteEvent

- (MTRSwitchClusterMultiPressCompleteEvent)init
{
  MTRSwitchClusterMultiPressCompleteEvent *v2;
  MTRSwitchClusterMultiPressCompleteEvent *v3;
  NSNumber *previousPosition;
  NSNumber *totalNumberOfPressesCounted;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRSwitchClusterMultiPressCompleteEvent;
  v2 = -[MTRSwitchClusterMultiPressCompleteEvent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    previousPosition = v2->_previousPosition;
    v2->_previousPosition = (NSNumber *)&unk_250591B18;

    totalNumberOfPressesCounted = v3->_totalNumberOfPressesCounted;
    v3->_totalNumberOfPressesCounted = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRSwitchClusterMultiPressCompleteEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRSwitchClusterMultiPressCompleteEvent);
  objc_msgSend_previousPosition(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousPosition_(v4, v8, (uint64_t)v7);

  objc_msgSend_totalNumberOfPressesCounted(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTotalNumberOfPressesCounted_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: previousPosition:%@; totalNumberOfPressesCounted:%@; >"),
    v5,
    self->_previousPosition,
    self->_totalNumberOfPressesCounted);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)previousPosition
{
  return self->_previousPosition;
}

- (void)setPreviousPosition:(NSNumber *)previousPosition
{
  objc_setProperty_nonatomic_copy(self, a2, previousPosition, 8);
}

- (NSNumber)totalNumberOfPressesCounted
{
  return self->_totalNumberOfPressesCounted;
}

- (void)setTotalNumberOfPressesCounted:(NSNumber *)totalNumberOfPressesCounted
{
  objc_setProperty_nonatomic_copy(self, a2, totalNumberOfPressesCounted, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalNumberOfPressesCounted, 0);
  objc_storeStrong((id *)&self->_previousPosition, 0);
}

@end
