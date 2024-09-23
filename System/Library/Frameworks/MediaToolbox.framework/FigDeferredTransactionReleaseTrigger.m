@implementation FigDeferredTransactionReleaseTrigger

- (FigDeferredTransactionReleaseTrigger)initWithReleaseBlock:(id)a3
{
  FigDeferredTransactionReleaseTrigger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigDeferredTransactionReleaseTrigger;
  v4 = -[FigDeferredTransactionReleaseTrigger init](&v6, sel_init);
  if (v4)
    v4->_blockToCallOnRelease = _Block_copy(a3);
  return v4;
}

- (void)dealloc
{
  void (**blockToCallOnRelease)(id, SEL);
  objc_super v4;

  blockToCallOnRelease = (void (**)(id, SEL))self->_blockToCallOnRelease;
  if (blockToCallOnRelease)
  {
    blockToCallOnRelease[2](blockToCallOnRelease, a2);
    _Block_release(self->_blockToCallOnRelease);
    self->_blockToCallOnRelease = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FigDeferredTransactionReleaseTrigger;
  -[FigDeferredTransactionReleaseTrigger dealloc](&v4, sel_dealloc);
}

@end
