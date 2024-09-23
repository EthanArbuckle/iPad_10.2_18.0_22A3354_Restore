@implementation CNHostingPosterSnapshotImageView

- (UIImage)image
{
  _TtC10ContactsUI32CNHostingPosterSnapshotImageView *v3;
  id v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  swift_retain();
  sub_18AF4EB94();

  swift_release();
  swift_release();
  swift_release();
  return (UIImage *)v5;
}

- (void)setImage:(id)a3
{
  id v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v4 = a3;
  swift_retain();
  sub_18AF4EBA0();
}

- (BOOL)isSensitiveContent
{
  _TtC10ContactsUI32CNHostingPosterSnapshotImageView *v3;
  BOOL v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  swift_retain();
  sub_18AF4EB94();

  swift_release();
  swift_release();
  swift_release();
  return v5;
}

- (void)setIsSensitiveContent:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18AF4EBA0();
}

- (UIView)view
{
  void *v2;
  _TtC10ContactsUI32CNHostingPosterSnapshotImageView *v3;
  UIView *result;
  UIView *v5;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI32CNHostingPosterSnapshotImageView_hostingController);
  v3 = self;
  result = (UIView *)objc_msgSend(v2, sel_view);
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC10ContactsUI32CNHostingPosterSnapshotImageView)init
{
  return (_TtC10ContactsUI32CNHostingPosterSnapshotImageView *)CNHostingPosterSnapshotImageView.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI32CNHostingPosterSnapshotImageView_hostingController));
  swift_release();
}

@end
