@implementation B389AnnotationView

+ (Class)calloutViewClass
{
  uint64_t v2;

  v2 = sub_100013194(0, &qword_1001A7268, _MKBalloonCalloutView_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    *(_QWORD *)&self->_MKPuckAnnotationView_opaque[OBJC_IVAR____TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView_calloutInnerDiameter] = 0x404C000000000000;
    swift_unknownObjectRetain(a3);
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(_QWORD *)&self->_MKPuckAnnotationView_opaque[OBJC_IVAR____TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView_calloutInnerDiameter] = 0x404C000000000000;
    swift_unknownObjectRetain(a3);
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for B389AnnotationView();
  v9 = -[B389AnnotationView initWithAnnotation:reuseIdentifier:](&v11, "initWithAnnotation:reuseIdentifier:", a3, v8);

  swift_unknownObjectRelease(a3);
  return v9;
}

- (_TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView)initWithCoder:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->_MKPuckAnnotationView_opaque[OBJC_IVAR____TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView_calloutInnerDiameter] = 0x404C000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for B389AnnotationView();
  return -[B389AnnotationView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (int64_t)_balloonCalloutStyle
{
  return 2;
}

- (id)_balloonStrokeColor
{
  return sub_10009BDE4(self, (uint64_t)a2, (SEL *)&selRef_systemGray6Color);
}

- (id)_balloonTintColor
{
  return sub_10009BDE4(self, (uint64_t)a2, (SEL *)&selRef_systemBackgroundColor);
}

- (id)_balloonImage
{
  _TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;

  v2 = self;
  v3 = -[B389AnnotationView annotation](v2, "annotation");
  if (!v3)
  {

LABEL_6:
    v11 = 0;
    return v11;
  }
  v4 = v3;
  v5 = type metadata accessor for B389MapAnnotation();
  v6 = swift_dynamicCastClass(v4, v5);
  if (!v6)
  {

    swift_unknownObjectRelease(v4);
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(v6 + OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_roleEmoji);
  v8 = *(_QWORD *)(v6 + OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_roleEmoji + 8);
  v9 = *(double *)&v2->_MKPuckAnnotationView_opaque[OBJC_IVAR____TtC18SharingViewServiceP33_A90FF226C003DA47E3B07A4439E9D09718B389AnnotationView_calloutInnerDiameter];
  swift_bridgeObjectRetain(v8);
  sub_1000DD634(v7, v8, v9);
  v11 = v10;

  swift_unknownObjectRelease(v4);
  swift_bridgeObjectRelease(v8);
  return v11;
}

@end
