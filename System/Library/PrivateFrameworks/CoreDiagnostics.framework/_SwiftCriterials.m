@implementation _SwiftCriterials

- (_SwiftCriterials)initWithInfo:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  objc_super v18;

  v6 = sub_2390F92B4();
  v8 = v7;
  v9 = sub_2390F92B4();
  v11 = v10;
  v12 = sub_2390F92B4();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____SwiftCriterials_incidentID);
  *v13 = v6;
  v13[1] = v8;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____SwiftCriterials_logType);
  *v14 = v9;
  v14[1] = v11;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____SwiftCriterials_panicReportPath);
  *v15 = v12;
  v15[1] = v16;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for Criterials();
  return -[_SwiftCriterials init](&v18, sel_init);
}

- (_SwiftCriterials)init
{
  _SwiftCriterials *result;

  result = (_SwiftCriterials *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
