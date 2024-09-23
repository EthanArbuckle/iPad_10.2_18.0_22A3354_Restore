@implementation CKMonoskiBadgeViewFactory

+ (id)badgeViewWithSupportsGradient:(BOOL)a3
{
  id v3;
  void *v4;
  id v5;
  id result;
  id v7;

  v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10D3D0));
  v4 = (void *)sub_18E7675EC();
  v5 = objc_msgSend(v4, sel_view);

  if (v5)
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v5, sel_setBackgroundColor_, v7);

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC7ChatKit25CKMonoskiBadgeViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKMonoskiBadgeViewFactory();
  return -[CKMonoskiBadgeViewFactory init](&v3, sel_init);
}

@end
