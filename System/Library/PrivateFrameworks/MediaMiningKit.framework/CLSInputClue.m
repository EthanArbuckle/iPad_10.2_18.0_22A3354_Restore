@implementation CLSInputClue

- (CLSInputClue)init
{
  CLSInputClue *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSInputClue;
  result = -[CLSClue init](&v3, sel_init);
  if (result)
    result->_needsPreparation = 1;
  return result;
}

- (void)prepareIfNeeded
{
  CLSInputClue *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_needsPreparation)
  {
    -[CLSInputClue _prepareWithProgressBlock:](obj, "_prepareWithProgressBlock:", 0);
    obj->_needsPreparation = 0;
  }
  objc_sync_exit(obj);

}

@end
