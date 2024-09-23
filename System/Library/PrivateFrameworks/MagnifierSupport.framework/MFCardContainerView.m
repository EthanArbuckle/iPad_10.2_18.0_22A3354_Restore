@implementation MFCardContainerView

- (void)updateAppearanceForReduceTransparency:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC16MagnifierSupport19MFCardContainerView *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B00);
  MEMORY[0x24BDAC7A8](v5, v6, v7, v8, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_22758C5F4();
    v12 = sub_22758C618();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_22758C618();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = self;
  sub_227551480();

  sub_2275518B0((uint64_t)v11);
}

- (void)layoutSubviews
{
  _TtC16MagnifierSupport19MFCardContainerView *v2;

  v2 = self;
  sub_227551614();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_card));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_draggableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_grabberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_backgroundBlur));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_internalDraggableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_backdropView));
}

@end
