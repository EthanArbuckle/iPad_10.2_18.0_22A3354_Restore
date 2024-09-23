@implementation CKTextEffectCoordinatorContinuationState

- (CKTextEffectCoordinatorContinuationState)initWithTextViewIdentifier:(id)a3 locationInAttributedText:(int64_t)a4 ignoreTextViewEligibilityCheck:(BOOL)a5
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  objc_super v12;

  v8 = sub_18E768984();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___CKTextEffectCoordinatorContinuationState_textViewIdentifier);
  *v9 = v8;
  v9[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKTextEffectCoordinatorContinuationState_locationInAttributedText) = (Class)a4;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CKTextEffectCoordinatorContinuationState_ignoreTextViewEligibilityCheck) = a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CKTextEffectCoordinator.ContinuationState();
  return -[CKTextEffectCoordinatorContinuationState init](&v12, sel_init);
}

- (CKTextEffectCoordinatorContinuationState)init
{
  CKTextEffectCoordinatorContinuationState *result;

  result = (CKTextEffectCoordinatorContinuationState *)sub_18E769320();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (NSString)debugDescription
{
  CKTextEffectCoordinatorContinuationState *v2;
  void *v3;

  v2 = self;
  CKTextEffectCoordinator.ContinuationState.debugDescription.getter();

  v3 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
