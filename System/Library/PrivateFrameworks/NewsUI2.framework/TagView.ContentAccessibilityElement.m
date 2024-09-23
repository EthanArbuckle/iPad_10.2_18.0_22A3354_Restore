@implementation TagView.ContentAccessibilityElement

- (CGRect)accessibilityFrame
{
  _TtCC7NewsUI27TagView27ContentAccessibilityElement *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v2 = self;
  v3 = -[TagView.ContentAccessibilityElement accessibilityContainer](v2, sel_accessibilityContainer);
  if (!v3)
  {

LABEL_6:
    v10 = 0.0;
    v12 = 0.0;
    v6 = 0.0;
    v8 = 0.0;
    goto LABEL_7;
  }
  v4 = v3;
  if ((objc_msgSend(v3, sel_respondsToSelector_, sel_accessibilityFrame) & 1) == 0)
  {

    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  objc_msgSend(v4, sel_accessibilityFrame);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  swift_unknownObjectRelease();
LABEL_7:
  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  _TtCC7NewsUI27TagView27ContentAccessibilityElement *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v2 = self;
  v3 = -[TagView.ContentAccessibilityElement accessibilityContainer](v2, sel_accessibilityContainer);
  if (!v3)
  {

LABEL_6:
    v8 = 0.0;
    v6 = 0.0;
    goto LABEL_7;
  }
  v4 = v3;
  if ((objc_msgSend(v3, sel_respondsToSelector_, sel_accessibilityActivationPoint) & 1) == 0)
  {

    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  objc_msgSend(v4, sel_accessibilityActivationPoint);
  v6 = v5;
  v8 = v7;

  swift_unknownObjectRelease();
LABEL_7:
  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1D623E7C4(self, (uint64_t)a2, (SEL *)&selRef_accessibilityLabel);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1D623E7C4(self, (uint64_t)a2, (SEL *)&selRef_accessibilityValue);
}

- (NSArray)accessibilityUserInputLabels
{
  return (NSArray *)sub_1D623F434(self, (uint64_t)a2, sub_1D623E8FC);
}

- (unint64_t)accessibilityTraits
{
  _TtCC7NewsUI27TagView27ContentAccessibilityElement *v2;
  id v3;
  void *v4;
  id v5;
  id v7;
  objc_super v8;

  v2 = self;
  v3 = -[TagView.ContentAccessibilityElement accessibilityContainer](v2, sel_accessibilityContainer);
  if (v3)
  {
    v4 = v3;
    if ((objc_msgSend(v3, sel_respondsToSelector_, sel_accessibilityTraits) & 1) != 0)
    {
      v5 = objc_msgSend(v4, sel_accessibilityTraits);

      swift_unknownObjectRelease();
      return (unint64_t)v5;
    }
    swift_unknownObjectRelease();
  }
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for TagView.ContentAccessibilityElement();
  v7 = -[TagView.ContentAccessibilityElement accessibilityTraits](&v8, sel_accessibilityTraits);

  return (unint64_t)v7;
}

- (BOOL)accessibilityActivate
{
  _TtCC7NewsUI27TagView27ContentAccessibilityElement *v2;
  id v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = -[TagView.ContentAccessibilityElement accessibilityContainer](v2, sel_accessibilityContainer);
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_accessibilityActivate);

    swift_unknownObjectRelease();
    return v4;
  }
  else
  {

    return 0;
  }
}

- (_TtCC7NewsUI27TagView27ContentAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  uint64_t v4;
  _TtCC7NewsUI27TagView27ContentAccessibilityElement *v5;
  objc_super v7;
  _QWORD v8[4];

  swift_unknownObjectRetain();
  sub_1D6E27D04();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v4 = sub_1D6E282B0();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TagView.ContentAccessibilityElement();
  v5 = -[TagView.ContentAccessibilityElement initWithAccessibilityContainer:](&v7, sel_initWithAccessibilityContainer_, v4);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

- (_TtCC7NewsUI27TagView27ContentAccessibilityElement)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TagView.ContentAccessibilityElement();
  return -[TagView.ContentAccessibilityElement init](&v3, sel_init);
}

@end
