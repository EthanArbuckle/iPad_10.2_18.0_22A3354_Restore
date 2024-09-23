@implementation ProjectionHighlightTileViewModelContextData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData *v5;

  v4 = a3;
  v5 = self;
  sub_231988758(v4);

}

- (_TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData)initWithCoder:(id)a3
{
  id v3;
  _TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData *v4;

  v3 = a3;
  v4 = (_TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData *)sub_231988B48();

  return v4;
}

- (_TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData)init
{
  _TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData *result;

  result = (_TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43ProjectionHighlightTileViewModelContextData_projection));
}

@end
