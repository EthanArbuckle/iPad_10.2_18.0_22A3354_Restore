@implementation NSFilePresenterAsynchronousOperation

+ (id)operationWithBlock:(id)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)a1);
  v4[31] = objc_msgSend(a3, "copy");
  return v4;
}

- (void)start
{
  -[NSFilePresenterAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_isExecuting = 1;
  -[NSFilePresenterAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  (*((void (**)(void))self->_block + 2))();
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)finish
{

  self->_block = 0;
  -[NSFilePresenterAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[NSFilePresenterAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_isFinished = 1;
  self->_isExecuting = 0;
  -[NSFilePresenterAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[NSFilePresenterAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

@end
