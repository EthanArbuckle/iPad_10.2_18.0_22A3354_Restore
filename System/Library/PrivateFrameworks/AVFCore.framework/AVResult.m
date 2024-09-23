@implementation AVResult

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVResult;
  -[AVResult dealloc](&v3, sel_dealloc);
}

- (BOOL)isFailed
{
  uint64_t v3;

  v3 = 0;
  -[AVResult getStatus:error:](self, "getStatus:error:", &v3, 0);
  return v3 == 2;
}

- (void)getStatus:(int64_t *)a3 error:(id *)a4
{
  MEMORY[0x194033BF8](self->_ivarAccessLock, a2);
  if (a3)
    *a3 = self->_status;
  if (a4)
    *a4 = (id)-[NSError copy](self->_error, "copy");
  JUMPOUT(0x194033C04);
}

- (void)markAsCompleted
{
  MEMORY[0x194033BF8](self->_ivarAccessLock, a2);
  self->_status = 1;
  JUMPOUT(0x194033C04);
}

- (AVResult)init
{
  AVResult *v2;
  uint64_t v3;
  AVResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVResult;
  v2 = -[AVResult init](&v6, sel_init);
  if (v2)
  {
    v3 = FigSimpleMutexCreate();
    v2->_status = 0;
    v2->_error = 0;
    v2->_ivarAccessLock = (OpaqueFigSimpleMutex *)v3;
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)markAsFailedWithError:(id)a3
{
  MEMORY[0x194033BF8](self->_ivarAccessLock, a2);
  self->_status = 2;
  self->_error = (NSError *)objc_msgSend(a3, "copy");
  JUMPOUT(0x194033C04);
}

@end
