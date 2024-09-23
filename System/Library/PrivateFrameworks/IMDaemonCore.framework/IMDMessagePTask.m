@implementation IMDMessagePTask

- (IMDMessagePTask)initWithGUID:(id)a3
{
  IMDMessagePTask *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDMessagePTask;
  v4 = -[IMDMessagePTask init](&v6, sel_init);
  if (v4)
  {
    v4->_guid = (NSString *)a3;
    v4->_taskFlags = 0;
  }
  return v4;
}

- (IMDMessagePTask)initWithStoreDictionary:(id)a3
{
  IMDMessagePTask *v4;

  v4 = -[IMDMessagePTask initWithGUID:](self, "initWithGUID:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("guid")));
  if (v4)
    v4->_taskFlags = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("task_flags")), "integerValue");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_guid = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessagePTask;
  -[IMDMessagePTask dealloc](&v3, sel_dealloc);
}

- (void)setTaskFlag:(unint64_t)a3
{
  self->_taskFlags |= a3;
}

- (BOOL)needsProccesingFor:(unint64_t)a3
{
  return (self->_taskFlags & a3) != 0;
}

- (void)compeletedTask:(unint64_t)a3
{
  self->_taskFlags &= ~a3;
}

- (NSString)guid
{
  return self->_guid;
}

- (unint64_t)taskFlags
{
  return self->_taskFlags;
}

@end
