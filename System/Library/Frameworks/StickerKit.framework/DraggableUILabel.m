@implementation DraggableUILabel

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10StickerKit16DraggableUILabel *v8;

  sub_2345DCF3C();
  sub_2345B0318(qword_2561741C0, (uint64_t (*)(uint64_t))sub_2345DCF3C, MEMORY[0x24BEE5BD8]);
  v6 = sub_234717A3C();
  v7 = a4;
  v8 = self;
  sub_2345DAC40(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_class *ObjectType;
  _TtC10StickerKit16DraggableUILabel *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_2345DCF3C();
  sub_2345B0318(qword_2561741C0, (uint64_t (*)(uint64_t))sub_2345DCF3C, MEMORY[0x24BEE5BD8]);
  sub_234717A3C();
  v7 = self;
  v8 = a4;
  v9 = (void *)sub_234717A30();
  v12.receiver = v7;
  v12.super_class = ObjectType;
  -[DraggableUILabel touchesMoved:withEvent:](&v12, sel_touchesMoved_withEvent_, v9, v8);

  v10 = MEMORY[0x234944A84]((char *)v7 + OBJC_IVAR____TtC10StickerKit16DraggableUILabel_touchDelegate);
  if (v10)
  {
    v11 = (void *)v10;
    sub_2345DD318();

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_2345DAF20(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_2345DAF20(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (_TtC10StickerKit16DraggableUILabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[UIKeyboardEmojiDraggableView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10StickerKit16DraggableUILabel)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[DraggableUILabel initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
