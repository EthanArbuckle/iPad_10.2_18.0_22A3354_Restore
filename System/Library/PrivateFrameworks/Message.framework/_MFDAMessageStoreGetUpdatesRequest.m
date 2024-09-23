@implementation _MFDAMessageStoreGetUpdatesRequest

- (id)initRequestForBodyFormat:(int)a3 withBodySizeLimit:(int)a4 isUserRequested:(BOOL)a5
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MFDAMessageStoreGetUpdatesRequest;
  result = -[DAMailboxGetUpdatesRequest initRequestForBodyFormat:withBodySizeLimit:](&v7, sel_initRequestForBodyFormat_withBodySizeLimit_, *(_QWORD *)&a3, *(_QWORD *)&a4);
  if (result)
    *((_BYTE *)result + 28) = a5;
  return result;
}

- (unint64_t)generationNumber
{
  return 0;
}

- (BOOL)shouldSend
{
  return 1;
}

- (BOOL)isUserRequested
{
  return *((_BYTE *)&self->super._maxSize + 4);
}

- (BOOL)mf_alwaysReportFailures
{
  return 1;
}

@end
