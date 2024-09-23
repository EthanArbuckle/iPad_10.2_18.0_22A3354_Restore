@implementation CompositionalLayout

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout *v8;
  void *v9;
  objc_class *v10;
  id v11;
  objc_super v13;

  v4 = sub_18BAC019C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC016C();
  v8 = self;
  v9 = (void *)sub_18BAC0154();
  v10 = (objc_class *)type metadata accessor for CompositionalLayout();
  v13.receiver = v8;
  v13.super_class = v10;
  v11 = -[CompositionalLayout layoutAttributesForItemAtIndexPath:](&v13, sel_layoutAttributesForItemAtIndexPath_, v9);

  if (v11)
    sub_18B91272C(v11);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout *v7;
  uint64_t v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_18B912430(x, y, width, height);

  if (v8)
  {
    sub_18B8918E0(0, &qword_1EDFEB4F8);
    v9 = (void *)sub_18BAC0F1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSection:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemDown) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemUp) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CompositionalLayout();
  return -[CompositionalLayout initWithSection:](&v5, sel_initWithSection_, a3);
}

- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  objc_super v7;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemDown) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemUp) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CompositionalLayout();
  return -[CompositionalLayout initWithSection:configuration:](&v7, sel_initWithSection_configuration_, a3, a4);
}

- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout *v7;
  objc_super v9;
  _QWORD aBlock[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemDown) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemUp) = 0;
  aBlock[4] = sub_18B913DEC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18B912A14;
  aBlock[3] = &block_descriptor_7_0;
  v6 = _Block_copy(aBlock);
  sub_18BABFBB4();
  swift_release();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CompositionalLayout();
  v7 = -[CompositionalLayout initWithSectionProvider:](&v9, sel_initWithSectionProvider_, v6);
  swift_release();
  _Block_release(v6);
  return v7;
}

- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout *v10;
  objc_super v12;
  _QWORD aBlock[6];

  v6 = _Block_copy(a3);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemDown) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemUp) = 0;
  aBlock[4] = sub_18B912CD4;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18B912A14;
  aBlock[3] = &block_descriptor_5;
  v8 = _Block_copy(aBlock);
  v9 = a4;
  sub_18BABFBB4();
  swift_release();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CompositionalLayout();
  v10 = -[CompositionalLayout initWithSectionProvider:configuration:](&v12, sel_initWithSectionProvider_configuration_, v8, v9);
  swift_release();

  _Block_release(v8);
  return v10;
}

- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemDown) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemUp) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CompositionalLayout();
  return -[CompositionalLayout initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
