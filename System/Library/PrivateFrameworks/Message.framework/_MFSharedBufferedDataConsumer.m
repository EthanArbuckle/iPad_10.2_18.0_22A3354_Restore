@implementation _MFSharedBufferedDataConsumer

- (void)_reallyDone
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_MFSharedBufferedDataConsumer;
  -[MFBufferedDataConsumer done](&v2, sel_done);
}

@end
