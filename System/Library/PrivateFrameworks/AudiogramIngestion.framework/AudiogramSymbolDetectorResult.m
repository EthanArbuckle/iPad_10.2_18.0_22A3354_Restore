@implementation AudiogramSymbolDetectorResult

- (CGRect)box
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box);
  v3 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
  v4 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 8];
  v5 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)labelName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_22FB8D154();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_confidence);
}

- (NSString)description
{
  return (NSString *)sub_22FB820CC(self, (uint64_t)a2, (void (*)(void))sub_22FB81448);
}

- (CGRect)scaledBoxWithSize:(CGSize)a3 offset:(CGPoint)a4
{
  double height;
  double width;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _TtC18AudiogramIngestion29AudiogramSymbolDetectorResult *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect result;

  height = a3.height;
  width = a3.width;
  v7 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box);
  v8 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
  v9 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 8];
  v10 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16];
  CGAffineTransformMakeTranslation(&v32, -0.5, -0.5);
  v33.origin.x = v7;
  v33.origin.y = v8;
  v33.size.width = v9;
  v33.size.height = v10;
  v34 = CGRectApplyAffineTransform(v33, &v32);
  v32.a = 1.0;
  v32.b = 0.0;
  v32.c = 0.0;
  v32.d = 1.0;
  v32.tx = 0.0;
  v32.ty = 0.0;
  v35 = CGRectApplyAffineTransform(v34, &v32);
  x = v35.origin.x;
  y = v35.origin.y;
  v13 = v35.size.width;
  v14 = v35.size.height;
  CGAffineTransformMakeTranslation(&v32, 0.5, 0.5);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = v13;
  v36.size.height = v14;
  v37 = CGRectApplyAffineTransform(v36, &v32);
  v15 = v37.origin.x;
  v16 = v37.origin.y;
  v17 = v37.size.width;
  v18 = v37.size.height;
  v19 = self;
  v38.origin.x = v15;
  v38.origin.y = v16;
  v38.size.width = v17;
  v38.size.height = v18;
  v20 = width * CGRectGetMinX(v38);
  v39.origin.x = v15;
  v39.origin.y = v16;
  v39.size.width = v17;
  v39.size.height = v18;
  v21 = height * CGRectGetMinY(v39);
  v40.origin.x = v15;
  v40.origin.y = v16;
  v40.size.width = v17;
  v40.size.height = v18;
  v22 = width * CGRectGetWidth(v40);
  v41.origin.x = v15;
  v41.origin.y = v16;
  v41.size.width = v17;
  v41.size.height = v18;
  v42.size.height = height * CGRectGetHeight(v41);
  v42.origin.x = v20;
  v42.origin.y = v21;
  v42.size.width = v22;
  v43 = CGRectOffset(v42, a4.x, a4.y);
  v23 = v43.origin.x;
  v24 = v43.origin.y;
  v25 = v43.size.width;
  v26 = v43.size.height;

  v27 = v23;
  v28 = v24;
  v29 = v25;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

+ (CGRect)boundingBoxForSymbols:(id)a3
{
  unint64_t v3;
  double v4;
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
  CGRect result;

  type metadata accessor for AudiogramSymbolDetectorResult();
  v3 = sub_22FB8D1D8();
  _s18AudiogramIngestion0A20SymbolDetectorResultC21boundingBoxForSymbolsySo6CGRectVSayACGFZ_0(v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  swift_bridgeObjectRelease();
  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (_TtC18AudiogramIngestion29AudiogramSymbolDetectorResult)init
{
  _TtC18AudiogramIngestion29AudiogramSymbolDetectorResult *result;

  result = (_TtC18AudiogramIngestion29AudiogramSymbolDetectorResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
