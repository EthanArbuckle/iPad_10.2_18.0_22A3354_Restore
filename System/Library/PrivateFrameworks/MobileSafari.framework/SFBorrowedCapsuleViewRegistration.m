@implementation SFBorrowedCapsuleViewRegistration

- (SFBorrowedCapsuleViewRegistration)initWithView:(id)a3 capsuleReferenceFrame:(CGRect)a4 referenceBounds:(CGRect)a5 shouldClipView:(BOOL)a6
{
  char *v6;
  id v7;
  objc_super v9;

  v6 = (char *)self + OBJC_IVAR___SFBorrowedCapsuleViewRegistration_wrapped;
  *(_QWORD *)v6 = a3;
  *(CGRect *)(v6 + 8) = a4;
  *(CGRect *)(v6 + 40) = a5;
  v6[72] = a6;
  v9.receiver = self;
  v9.super_class = (Class)SFBorrowedCapsuleViewRegistration;
  v7 = a3;
  return -[SFBorrowedCapsuleViewRegistration init](&v9, sel_init);
}

- (SFBorrowedCapsuleViewRegistration)init
{
  SFBorrowedCapsuleViewRegistration *result;

  result = (SFBorrowedCapsuleViewRegistration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
