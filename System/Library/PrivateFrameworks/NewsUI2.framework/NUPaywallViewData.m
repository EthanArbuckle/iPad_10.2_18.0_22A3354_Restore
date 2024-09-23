@implementation NUPaywallViewData

- (NUPaywallViewData)initWithViewSessionID:(id)a3 viewType:(id)a4 viewAction:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = sub_1D6E26978();
  v7 = v6;
  v8 = sub_1D6E26978();
  v10 = v9;
  v11 = sub_1D6E26978();
  return (NUPaywallViewData *)PaywallViewData.init(viewSessionID:viewType:viewAction:)(v5, v7, v8, v10, v11, v12);
}

- (NUPaywallViewData)init
{
  NUPaywallViewData *result;

  result = (NUPaywallViewData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D6899AE8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___NUPaywallViewData_viewData, (uint64_t (*)(_QWORD))MEMORY[0x1E0D564B0]);
}

@end
