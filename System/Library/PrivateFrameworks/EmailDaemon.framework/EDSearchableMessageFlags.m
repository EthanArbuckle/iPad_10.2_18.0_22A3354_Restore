@implementation EDSearchableMessageFlags

- (EDSearchableMessageFlags)initWithRead:(BOOL)a3 flagged:(BOOL)a4 flagColor:(unint64_t)a5 replied:(BOOL)a6
{
  return (EDSearchableMessageFlags *)sub_1D310C1A4(a3, a4, a5, a6);
}

- (void)addToAttributes:(id)a3
{
  id v5;
  EDSearchableMessageFlags *v6;
  int v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  char v10;
  _BYTE v11[32];

  sub_1D3108558((uint64_t)self + OBJC_IVAR___EDSearchableMessageFlags__underlying, (uint64_t)v11);
  v5 = a3;
  v6 = self;
  swift_dynamicCast();
  if (v10)
    v7 = 0x10000;
  else
    v7 = 0;
  sub_1D3117F34(v5, v7 | (v9 << 8) | v8);

}

- (EDSearchableMessageFlags)init
{
  EDSearchableMessageFlags *result;

  result = (EDSearchableMessageFlags *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___EDSearchableMessageFlags__underlying);
}

@end
