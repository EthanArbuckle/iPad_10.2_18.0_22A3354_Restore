@implementation MTLIOCompressor

- (MTLIOCompressor)initWithType:(int64_t)a3 dst:(id)a4 chunkSize:(unint64_t)a5
{
  MTLIOCompressor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLIOCompressor;
  v8 = -[MTLIOCompressor init](&v10, sel_init);
  if (v8)
    v8->context = MTLIOCreateCompressionContext((const char *)objc_msgSend((id)objc_msgSend(a4, "path"), "cStringUsingEncoding:", 4), (MTLIOCompressionMethod)a3, a5);
  return v8;
}

- (void)appendData:(id)a3
{
  MTLIOCompressionContextAppendData(self->context, (const void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
}

- (int64_t)close
{
  return MTLIOFlushAndDestroyCompressionContext(self->context);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLIOCompressor;
  -[MTLIOCompressor dealloc](&v2, sel_dealloc);
}

@end
