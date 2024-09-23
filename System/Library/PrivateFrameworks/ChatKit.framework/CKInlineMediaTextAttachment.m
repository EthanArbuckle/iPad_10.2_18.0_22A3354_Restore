@implementation CKInlineMediaTextAttachment

- (CKMediaObject)mediaObject
{
  return (CKMediaObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                  + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_mediaObject));
}

- (_TtC7ChatKit27CKInlineMediaTextAttachment)initWithDelegate:(id)a3 mediaObject:(id)a4
{
  swift_unknownObjectRetain();
  return (_TtC7ChatKit27CKInlineMediaTextAttachment *)CKInlineMediaTextAttachment.init(delegate:mediaObject:)((uint64_t)a3, a4);
}

- (_TtC7ChatKit27CKInlineMediaTextAttachment)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7ChatKit27CKInlineMediaTextAttachment *result;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_viewProvider) = 0;
  v5 = OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_mediaView;
  type metadata accessor for CKInlineMediaView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  swift_unknownObjectWeakInit();

  result = (_TtC7ChatKit27CKInlineMediaTextAttachment *)sub_18E769320();
  __break(1u);
  return result;
}

- (UIImage)image
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKInlineMediaTextAttachment();
  return -[CKInlineMediaTextAttachment image](&v3, sel_image);
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CKInlineMediaTextAttachment();
  v4 = a3;
  v5 = v6.receiver;
  -[CKInlineMediaTextAttachment setImage:](&v6, sel_setImage_, v4);
  sub_18E67A3C0();

}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (BOOL)usesTextAttachmentView
{
  return 1;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v9;
  id v10;
  _TtC7ChatKit27CKInlineMediaTextAttachment *v11;
  void *v12;
  void *v13;

  v9 = a3;
  swift_unknownObjectRetain();
  v10 = a5;
  v11 = self;
  sub_18E67A4B4(a3, (uint64_t)a4, a5);
  v13 = v12;

  swift_unknownObjectRelease();
  return v13;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(int64_t)a5
{
  return -[CKInlineMediaTextAttachment image](self, sel_image, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit27CKInlineMediaTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  _TtC7ChatKit27CKInlineMediaTextAttachment *result;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    sub_18E7661C4();

  }
  result = (_TtC7ChatKit27CKInlineMediaTextAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_viewProvider));

  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_delegate);
}

- (void)inlineMediaViewDidSelectGenerativeButton:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7ChatKit27CKInlineMediaTextAttachment *v9;

  v5 = MEMORY[0x193FF501C]((char *)self + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_delegate, a2);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_mediaObject);
    v8 = a3;
    v9 = self;
    objc_msgSend(v6, sel_inlineMediaViewTextAttachmentDidRequestGenerativeInteraction_, v7);

    swift_unknownObjectRelease();
  }
}

@end
