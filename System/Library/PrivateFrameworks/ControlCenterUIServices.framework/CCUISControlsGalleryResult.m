@implementation CCUISControlsGalleryResult

- (CCUISConfiguredControl)control
{
  return (CCUISConfiguredControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___CCUISControlsGalleryResult_control));
}

- (BOOL)promptsForUserConfiguration
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryResult_promptsForUserConfiguration);
}

- (CCUISControlsGalleryResult)initWithControl:(id)a3 promptsForUserConfiguration:(BOOL)a4
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryResult_control) = (Class)a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryResult_promptsForUserConfiguration) = a4;
  v6.receiver = self;
  v6.super_class = (Class)CCUISControlsGalleryResult;
  v4 = a3;
  return -[CCUISControlsGalleryResult init](&v6, sel_init);
}

- (NSString)description
{
  CCUISControlsGalleryResult *v2;
  void *v3;

  v2 = self;
  CCUISControlsGalleryResult.description.getter();

  v3 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CCUISControlsGalleryResult)init
{
  CCUISControlsGalleryResult *result;

  result = (CCUISControlsGalleryResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
