@implementation CKTextEffectCoordinatorAnimatorRequest

- (UITextView)textView
{
  return (UITextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___CKTextEffectCoordinatorAnimatorRequest_textView));
}

- (_NSTextAnimation)animation
{
  return (_NSTextAnimation *)(id)swift_unknownObjectRetain();
}

- (CKTextEffectCoordinatorAnimatorRequest)init
{
  CKTextEffectCoordinatorAnimatorRequest *result;

  result = (CKTextEffectCoordinatorAnimatorRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
