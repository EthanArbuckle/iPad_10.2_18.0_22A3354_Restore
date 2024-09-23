@implementation _MSPContainerEditReplacedEntirely

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___MSPContainerEditReplacedEntirely_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EF07A6B0 != -1)
    dispatch_once(&qword_1EF07A6B0, block);
  return (id)_MergedGlobals_1;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)_MSPContainerEditReplacedEntirely;
  -[_MSPContainerEditReplacedEntirely description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ { CONTAINER'S CONTENTS REPLACED ENTIRELY }"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
