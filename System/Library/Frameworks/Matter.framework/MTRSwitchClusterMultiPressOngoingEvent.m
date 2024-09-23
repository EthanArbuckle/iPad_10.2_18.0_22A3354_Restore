@implementation MTRSwitchClusterMultiPressOngoingEvent

- (MTRSwitchClusterMultiPressOngoingEvent)init
{
  MTRSwitchClusterMultiPressOngoingEvent *v2;
  MTRSwitchClusterMultiPressOngoingEvent *v3;
  NSNumber *newPosition;
  NSNumber *currentNumberOfPressesCounted;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRSwitchClusterMultiPressOngoingEvent;
  v2 = -[MTRSwitchClusterMultiPressOngoingEvent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    newPosition = v2->_newPosition;
    v2->_newPosition = (NSNumber *)&unk_250591B18;

    currentNumberOfPressesCounted = v3->_currentNumberOfPressesCounted;
    v3->_currentNumberOfPressesCounted = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRSwitchClusterMultiPressOngoingEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRSwitchClusterMultiPressOngoingEvent);
  objc_msgSend_getNewPosition(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNewPosition_(v4, v8, (uint64_t)v7);

  objc_msgSend_currentNumberOfPressesCounted(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrentNumberOfPressesCounted_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: newPosition:%@; currentNumberOfPressesCounted:%@; >"),
    v5,
    self->_newPosition,
    self->_currentNumberOfPressesCounted);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)getNewPosition
{
  return self->_newPosition;
}

- (void)setNewPosition:(NSNumber *)newPosition
{
  objc_setProperty_nonatomic_copy(self, a2, newPosition, 8);
}

- (NSNumber)currentNumberOfPressesCounted
{
  return self->_currentNumberOfPressesCounted;
}

- (void)setCurrentNumberOfPressesCounted:(NSNumber *)currentNumberOfPressesCounted
{
  objc_setProperty_nonatomic_copy(self, a2, currentNumberOfPressesCounted, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNumberOfPressesCounted, 0);
  objc_storeStrong((id *)&self->_newPosition, 0);
}

@end
