@implementation SafariClearBrowsingDataInterval

- (SafariClearBrowsingDataInterval)initWithDescription:(id)a3 dateAfterWhichDataShouldBeClearedBlock:(id)a4
{
  id v6;
  id v7;
  SafariClearBrowsingDataInterval *v8;
  uint64_t v9;
  NSString *descriptionOfInterval;
  uint64_t v11;
  id dateAfterWhichDataShouldBeClearedBlock;
  SafariClearBrowsingDataInterval *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SafariClearBrowsingDataInterval;
  v8 = -[SafariClearBrowsingDataInterval init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    descriptionOfInterval = v8->_descriptionOfInterval;
    v8->_descriptionOfInterval = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    dateAfterWhichDataShouldBeClearedBlock = v8->_dateAfterWhichDataShouldBeClearedBlock;
    v8->_dateAfterWhichDataShouldBeClearedBlock = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (SafariClearBrowsingDataInterval)init
{

  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; _descriptionOfInterval = %@>"),
    v5,
    self,
    self->_descriptionOfInterval);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)descriptionOfInterval
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)dateAfterWhichDataShouldBeClearedBlock
{
  return self->_dateAfterWhichDataShouldBeClearedBlock;
}

- (void)setDateAfterWhichDataShouldBeClearedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)clearBrowsingDataInterval
{
  return self->_clearBrowsingDataInterval;
}

- (void)setClearBrowsingDataInterval:(int64_t)a3
{
  self->_clearBrowsingDataInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateAfterWhichDataShouldBeClearedBlock, 0);
  objc_storeStrong((id *)&self->_descriptionOfInterval, 0);
}

@end
