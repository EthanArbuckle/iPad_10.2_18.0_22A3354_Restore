@implementation NSBlockObservationSink

- (NSBlockObservationSink)initWithBlock:(id)a3 tag:(int)a4
{
  NSBlockObservationSink *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSBlockObservationSink;
  v6 = -[NSBlockObservationSink init](&v8, sel_init);
  if (v6)
  {
    v6->_block = (id)objc_msgSend(a3, "copy");
    v6->_tag = a4;
  }
  return v6;
}

- (void)_receiveBox:(id)a3
{
  int tag;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  tag = self->_tag;
  if (*((_DWORD *)a3 + 6) == tag && tag != 3)
    (*((void (**)(void))self->_block + 2))();
  v7.receiver = self;
  v7.super_class = (Class)NSBlockObservationSink;
  -[NSBlockObservationSink _receiveBox:](&v7, sel__receiveBox_, a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSBlockObservationSink;
  -[NSBlockObservationSink dealloc](&v3, sel_dealloc);
}

@end
