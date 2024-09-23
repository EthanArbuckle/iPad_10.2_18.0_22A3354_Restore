@implementation CNPosterSetupAvatarPreviewViewWrapper

- (UIViewController)hostingController
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper_hostingController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setHostingController:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper_hostingController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper)initWithImageData:(id)a3 cropRect:(CGRect)a4 imageType:(unint64_t)a5 delegate:(id)a6
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = sub_18AF4E48C();
  v9 = v8;

  return (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper *)CNPosterSetupAvatarPreviewViewWrapper.init(imageData:cropRect:imageType:delegate:)(v7, v9);
}

- (void)setImageData:(id)a3
{
  id v4;
  _TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = sub_18AF4E48C();
  v8 = v7;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain_n();
  sub_18ACC022C(v6, v8);
  sub_18AF4EBA0();
  sub_18ACD2260();
  swift_release();
  sub_18ACB9CDC(v6, v8);

}

- (void)setCropRect:(CGRect)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18AF4EBA0();
}

- (void)setImageType:(unint64_t)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18AF4EBA0();
}

- (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper)init
{
  _TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper *result;

  result = (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper_hostingController));
  swift_release();
  sub_18ACD5A7C((uint64_t)self + OBJC_IVAR____TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper_avatarPreviewView);
}

@end
