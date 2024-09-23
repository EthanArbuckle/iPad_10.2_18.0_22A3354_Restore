@implementation iOSLinkAcceleratorCollectionViewCell

- (_TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell *)sub_1DD9BE808(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DD9C1D38();
}

- (void)handleHoverWithRecognizer:(id)a3
{
  id v4;
  _TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  byte_1F03F9DD0 = (char *)objc_msgSend(v4, sel_state) - 1 < (char *)2;
  -[iOSLinkAcceleratorCollectionViewCell setNeedsUpdateConfiguration](v5, sel_setNeedsUpdateConfiguration);

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell *v8;
  uint64_t v9;

  v4 = sub_1DD9D0C58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0C4C();
  v8 = self;
  sub_1DD9BF3AC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell_dividerView));
  sub_1DD8FF244((uint64_t)self + OBJC_IVAR____TtC11NotesEditor36iOSLinkAcceleratorCollectionViewCell_linkSuggestion, &qword_1F03F7938);
}

@end
