@implementation CKLinkPreviewTextAttachment

- (CKEmbeddedRichLinkConfiguration)configuration
{
  return (CKEmbeddedRichLinkConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                    + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_configuration));
}

- (double)downscaleMultiplier
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_downscaleMultiplier);
  swift_beginAccess();
  return *v2;
}

- (void)setDownscaleMultiplier:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_downscaleMultiplier);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC7ChatKit27CKLinkPreviewTextAttachment)initWithDelegate:(id)a3 configuration:(id)a4
{
  swift_unknownObjectRetain();
  return (_TtC7ChatKit27CKLinkPreviewTextAttachment *)CKLinkPreviewTextAttachment.init(delegate:configuration:)((uint64_t)a3, a4);
}

- (_TtC7ChatKit27CKLinkPreviewTextAttachment)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E6954A8();
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
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v11;
  void *v12;
  void *v13;

  v9 = a3;
  swift_unknownObjectRetain();
  v10 = a5;
  v11 = self;
  sub_18E69488C(a3, (uint64_t)a4, a5);
  v13 = v12;

  swift_unknownObjectRelease();
  return v13;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(int64_t)a5
{
  id v6;
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v7;
  void *v8;

  v6 = a4;
  v7 = self;
  v8 = (void *)sub_18E6955CC();

  return v8;
}

- (id)makeThrowAnimationSnapshotView
{
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v2;
  id v3;

  v2 = self;
  v3 = sub_18E6536EC();

  return v3;
}

- (void)invalidateSizingInformation
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_isAttachmentSizeInvalidated) = 1;
}

- (_TtC7ChatKit27CKLinkPreviewTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  _TtC7ChatKit27CKLinkPreviewTextAttachment *result;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    sub_18E7661C4();

  }
  result = (_TtC7ChatKit27CKLinkPreviewTextAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_delegate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_configuration));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_viewProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_embeddedLinkView));
}

- (void)embeddedRichLinkView:(id)a3 didSelectInteractionType:(int64_t)a4
{
  id v6;
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v7;

  v6 = a3;
  v7 = self;
  sub_18E695838(a4);

}

- (void)embeddedRichLinkView:(id)a3 didFinishPreparingPluginPayload:(id)a4
{
  id v6;
  id v7;
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18E695958((uint64_t)v7);

}

- (void)embeddedRichLinkView:(id)a3 requestedTransitionToSize:(CGSize)a4
{
  id v5;
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v6;

  v5 = a3;
  v6 = self;
  sub_18E695A4C();

}

- (void)embeddedRichLinkView:(id)a3 willAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
  sub_18E695070((char *)self, (uint64_t)a2, a3, a4, (SEL *)&selRef_linkPreviewTextAttachment_willAddPluginEntryViewControllerToViewHierarchy_);
}

- (void)embeddedRichLinkView:(id)a3 didAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
  sub_18E695070((char *)self, (uint64_t)a2, a3, a4, (SEL *)&selRef_linkPreviewTextAttachment_didAddPluginEntryViewControllerToViewHierarchy_);
}

- (double)maxWidthForEmbeddedRichLinkView:(id)a3
{
  id v4;
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = self;
  sub_18E695C24();
  v7 = v6;

  return v7;
}

- (double)downscaleMultiplierForEmbeddedRichLinkView:(id)a3
{
  double *v3;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_downscaleMultiplier);
  swift_beginAccess();
  return *v3;
}

- (BOOL)supportsCustomizationForEmbeddedRichLinkView:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v8;
  unsigned __int8 v9;

  v5 = MEMORY[0x193FF501C]((char *)self + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_delegate, a2);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = a3;
    v8 = self;
    v9 = objc_msgSend(v6, sel_supportsCustomizationForLinkPreviewTextAttachment_, v8);

    swift_unknownObjectRelease();
    LOBYTE(v5) = v9;
  }
  return v5;
}

- (void)embeddedRichLinkViewWillPresentCustomizationPicker:(id)a3
{
  sub_18E695250((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_linkPreviewTextAttachmentWillPresentCustomizationPicker_);
}

- (void)embeddedRichLinkViewDidPresentCustomizationPicker:(id)a3
{
  sub_18E695250((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_linkPreviewTextAttachmentDidPresentCustomizationPicker_);
}

- (void)embeddedRichLinkViewWillDismissCustomizationPicker:(id)a3
{
  sub_18E695250((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_linkPreviewTextAttachmentWillDismissCustomizationPicker_);
}

- (void)embeddedRichLinkViewDidDismissCustomizationPicker:(id)a3
{
  sub_18E695250((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_linkPreviewTextAttachmentDidDismissCustomizationPicker_);
}

- (BOOL)canPresentCustomizationPicker
{
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v2;
  char v3;

  v2 = self;
  v3 = sub_18E654C98();

  return v3 & 1;
}

- (void)presentCustomizationPicker
{
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v2;

  v2 = self;
  sub_18E654F4C();

}

- (NSString)urlText
{
  return (NSString *)sub_18E6953C0((char *)self, (uint64_t)a2, (SEL *)&selRef_urlText);
}

- (NSString)entryItemUUID
{
  return (NSString *)sub_18E6953C0((char *)self, (uint64_t)a2, (SEL *)&selRef_entryItemUUID);
}

@end
