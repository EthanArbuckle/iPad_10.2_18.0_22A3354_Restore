@implementation ProcessStateTrackingContext

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->token);
  v3.receiver = self;
  v3.super_class = (Class)ProcessStateTrackingContext;
  -[ProcessStateTrackingContext dealloc](&v3, sel_dealloc);
}

@end
