@implementation WinterpegTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  id v15;
  _TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v15 = a3;
  v16 = self;
  sub_10008C8D8((uint64_t)a3, a6, v12, v11, width, height, x, y);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (_TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  if (!a3)
  {
    v13 = a4;
    v9 = 0xF000000000000000;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    v12 = 0;
    return (_TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment *)sub_10008CB1C((uint64_t)v5, v9, v10, v12);
  }
  v6 = a4;
  v7 = v5;
  v5 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v9 = v8;

  if (!a4)
    goto LABEL_5;
LABEL_3:
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;

  return (_TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment *)sub_10008CB1C((uint64_t)v5, v9, v10, v12);
}

- (_TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8BusinessP33_F1257CEC6FBB055D52A44E01318C013B23WinterpegTextAttachment_fontDescender) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WinterpegTextAttachment();
  return -[WinterpegTextAttachment initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
