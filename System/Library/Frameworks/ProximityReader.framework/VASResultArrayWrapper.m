@implementation VASResultArrayWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  id v5;
  _TtC15ProximityReader21VASResultArrayWrapper *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v4 = *(unint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15ProximityReader21VASResultArrayWrapper_vasEntries);
  v5 = a3;
  v6 = self;
  sub_21C2D6C30(v4, v7, (void (*)(uint64_t))type metadata accessor for VASReadEntry);
  v8 = objc_allocWithZone(MEMORY[0x24BDBCF00]);
  v9 = (void *)sub_21C3A8064();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithArray_, v9);

  v11 = (id)sub_21C3A7EB4();
  objc_msgSend(v5, sel_encodeObject_forKey_, v10, v11);

}

- (_TtC15ProximityReader21VASResultArrayWrapper)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader21VASResultArrayWrapper *)VASResultArrayWrapper.init(coder:)(a3);
}

- (_TtC15ProximityReader21VASResultArrayWrapper)init
{
  _TtC15ProximityReader21VASResultArrayWrapper *result;

  result = (_TtC15ProximityReader21VASResultArrayWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
