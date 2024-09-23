@implementation SliderView.PanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_class *ObjectType;
  id v7;
  _TtCC12NewsArticles10SliderViewP33_9E8B7C024EAF79BE20F276F3609F182920PanGestureRecognizer *v8;
  void *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1B9E147E4(0, &qword_1EF25C3B0);
  sub_1BA0B5564();
  sub_1BA0BEBF4();
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1BA0BEBE8();
  v10.receiver = v8;
  v10.super_class = ObjectType;
  -[SliderView.PanGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v9, v7);

  -[SliderView.PanGestureRecognizer setState:](v8, sel_setState_, 1);
  swift_bridgeObjectRelease();
}

- (_TtCC12NewsArticles10SliderViewP33_9E8B7C024EAF79BE20F276F3609F182920PanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1BA0BF218();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtCC12NewsArticles10SliderViewP33_9E8B7C024EAF79BE20F276F3609F182920PanGestureRecognizer *)sub_1BA0B58A8((uint64_t)v6, (uint64_t)a4);
}

@end
