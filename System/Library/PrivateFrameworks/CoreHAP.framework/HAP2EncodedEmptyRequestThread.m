@implementation HAP2EncodedEmptyRequestThread

- (HAP2EncodedEmptyRequestThread)initWithRequestType:(unint64_t)a3
{
  HAP2EncodedEmptyRequestThread *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAP2EncodedEmptyRequestThread;
  result = -[HAP2EncodedEmptyRequestThread init](&v5, sel_init);
  if (result)
    result->_requestType = a3;
  return result;
}

- (id)body
{
  return 0;
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)serialize
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
}

- (unint64_t)requestType
{
  return self->_requestType;
}

@end
