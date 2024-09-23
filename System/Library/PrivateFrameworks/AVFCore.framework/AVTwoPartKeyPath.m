@implementation AVTwoPartKeyPath

- (NSString)topLevelPropertyKey
{
  return self->_topLevelKey;
}

- (NSString)secondLevelPropertyKey
{
  return self->_secondLevelKey;
}

- (AVTwoPartKeyPath)initWithTopLevelPropertyKey:(id)a3 secondLevelPropertyKey:(id)a4
{
  AVTwoPartKeyPath *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTwoPartKeyPath;
  v6 = -[AVTwoPartKeyPath init](&v8, sel_init);
  if (v6)
  {
    v6->_topLevelKey = (NSString *)objc_msgSend(a3, "copy");
    v6->_secondLevelKey = (NSString *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTwoPartKeyPath;
  -[AVTwoPartKeyPath dealloc](&v3, sel_dealloc);
}

- (NSString)keyPathString
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), self->_topLevelKey, self->_secondLevelKey);
}

@end
