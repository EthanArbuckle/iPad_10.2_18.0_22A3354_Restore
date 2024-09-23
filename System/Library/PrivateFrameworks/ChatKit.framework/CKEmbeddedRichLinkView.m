@implementation CKEmbeddedRichLinkView

- (_TtC7ChatKit22CKEmbeddedRichLinkView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit22CKEmbeddedRichLinkView *)sub_18E653004(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit22CKEmbeddedRichLinkView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit22CKEmbeddedRichLinkView *)sub_18E653140(a3);
}

- (void)layoutSubviews
{
  _TtC7ChatKit22CKEmbeddedRichLinkView *v2;

  v2 = self;
  sub_18E6533AC();

}

- (CGSize)sizeThatFits:(CGSize)result
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_pluginEntryViewController);
  if (v3)
    objc_msgSend(v3, sel_sizeThatFits_, result.width, result.height);
  return result;
}

- (void)didTapToPresentEditMenu:(id)a3
{
  id v4;
  _TtC7ChatKit22CKEmbeddedRichLinkView *v5;

  v4 = a3;
  v5 = self;
  sub_18E655A48();

}

- (void)didTapDiscardButton
{
  _TtC7ChatKit22CKEmbeddedRichLinkView *v2;

  v2 = self;
  sub_18E654194();

}

- (void)pluginPayloadDidLoad:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;

  v4 = sub_18E765F3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E765F18();
  v8 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_pluginEntryViewController);
  if (v8)
    objc_msgSend(v8, sel_ck_constrainedSizeThatFits_, 0.0, 0.0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)pluginPayloadWantsResize:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7ChatKit22CKEmbeddedRichLinkView *v8;
  uint64_t v9;

  v4 = sub_18E765F3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E765F18();
  v8 = self;
  sub_18E654384();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_delegate);
  sub_18E00FA98((uint64_t)self + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_url, (uint64_t *)&unk_1EE0FBD30);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_richLinkDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_pluginEntryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_discardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_editMenuInteraction));
}

- (void)balloonPluginDataSourceDidChange:(id)a3
{
  id v4;
  _TtC7ChatKit22CKEmbeddedRichLinkView *v5;

  v4 = a3;
  v5 = self;
  sub_18E654A84(v4);

}

- (void)customizationPickerControllerWillPresent:(id)a3
{
  sub_18E65519C((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_embeddedRichLinkViewWillPresentCustomizationPicker_);
}

- (void)customizationPickerControllerDidPresent:(id)a3
{
  sub_18E65519C((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_embeddedRichLinkViewDidPresentCustomizationPicker_);
}

- (void)customizationPickerControllerWillDismiss:(id)a3
{
  id v4;
  _TtC7ChatKit22CKEmbeddedRichLinkView *v5;

  v4 = a3;
  v5 = self;
  sub_18E655D04();

}

- (void)customizationPickerControllerDidDismiss:(id)a3
{
  id v4;
  _TtC7ChatKit22CKEmbeddedRichLinkView *v5;

  v4 = a3;
  v5 = self;
  sub_18E655DAC();

}

- (id)transitionContextForCustomizationPickerController:(id)a3
{
  id v4;
  _TtC7ChatKit22CKEmbeddedRichLinkView *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_18E655FC4();

  return v6;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CKEmbeddedRichLinkView frame](self, sel_frame, a3, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  sub_18E6553A0(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_1E2767490, (uint64_t)sub_18E6565D0, (uint64_t)&block_descriptor_17_0);
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  sub_18E6553A0(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_1E2767468, (uint64_t)sub_18E656598, (uint64_t)&block_descriptor_11);
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  id v8;
  _TtC7ChatKit22CKEmbeddedRichLinkView *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_18E6560F8();

  return v10;
}

@end
