@implementation DOCUIPBrowserState

- (DOCUIPBrowserState)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DOCUIPBrowserState__impl);
  *v2 = -1;
  v2[1] = -1;
  v4.receiver = self;
  v4.super_class = (Class)DOCUIPBrowserState;
  return -[DOCUIPBrowserState init](&v4, sel_init);
}

- (int64_t)contentMode
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___DOCUIPBrowserState__impl);
}

- (void)setContentMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DOCUIPBrowserState__impl) = (Class)a3;
}

- (int64_t)documentLandingMode
{
  return *(_QWORD *)&self->_impl[OBJC_IVAR___DOCUIPBrowserState__impl];
}

- (void)setDocumentLandingMode:(int64_t)a3
{
  *(_QWORD *)&self->_impl[OBJC_IVAR___DOCUIPBrowserState__impl] = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCUIPBrowserState)initWithCoder:(id)a3
{
  return (DOCUIPBrowserState *)DOCUIPBrowserState.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  DOCUIPBrowserState *v5;

  v4 = a3;
  v5 = self;
  sub_2090C8F80();

}

- (NSString)debugDescription
{
  DOCUIPBrowserState *v2;
  void *v3;

  v2 = self;
  DOCUIPBrowserState.debugDescription.getter();

  v3 = (void *)sub_2090CD538();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
