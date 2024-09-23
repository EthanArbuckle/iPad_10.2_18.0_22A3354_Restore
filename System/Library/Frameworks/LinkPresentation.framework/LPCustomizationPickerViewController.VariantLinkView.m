@implementation LPCustomizationPickerViewController.VariantLinkView

- (_TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView)initWithCoder:(id)a3
{
  id v5;
  _TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView *result;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_isSelectedVariant) = 0;
  v5 = a3;

  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_release();
  result = (_TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView *)sub_1A0D2BDFC();
  __break(1u);
  return result;
}

- (_TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView)initWithFrame:(CGRect)a3
{
  _TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView *result;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  result = (_TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView____lazy_storage___checkmark));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCE16LinkPresentationCSo35LPCustomizationPickerViewController15VariantLinkView_linkView));
}

@end
