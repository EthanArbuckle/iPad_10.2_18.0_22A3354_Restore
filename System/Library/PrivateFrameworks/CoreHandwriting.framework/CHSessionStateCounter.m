@implementation CHSessionStateCounter

- (CHSessionStateCounter)init
{
  CHSessionStateCounter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHSessionStateCounter;
  result = -[CHSessionStateCounter init](&v3, sel_init);
  if (result)
    result->_counter = 0;
  return result;
}

- (void)increment
{
  CHSessionStateCounter *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_counter;
  objc_sync_exit(obj);

}

- (void)decrement
{
  CHSessionStateCounter *obj;

  obj = self;
  objc_sync_enter(obj);
  --obj->_counter;
  objc_sync_exit(obj);

}

- (BOOL)hasActiveSessions
{
  CHSessionStateCounter *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_counter > 0;
  objc_sync_exit(v2);

  return v3;
}

- (int)counter
{
  return self->_counter;
}

@end
