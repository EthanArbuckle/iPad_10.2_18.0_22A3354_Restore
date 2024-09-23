@implementation CKAppInteractionsContext

- (CKAppInteractionsContext)init
{
  CKAppInteractionsContext *result;

  CKAppInteractionsContext.init()();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CKAppInteractionsContext *v5;

  v4 = a3;
  v5 = self;
  sub_1A48B75CC(v4);

}

- (CKAppInteractionsContext)initWithCoder:(id)a3
{
  return (CKAppInteractionsContext *)CKAppInteractionsContext.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(void *)a3
{
  CKAppInteractionsContext *v3;
  void *v4;
  uint64_t v6[4];

  v3 = self;
  sub_1A48B7B5C(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_1A492118C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)updateDiscardedDonations:(double)a3 forIntentType:(id)a4 andBundleId:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKAppInteractionsContext *v9;

  v6 = sub_1A4920D3C();
  v8 = v7;
  sub_1A4920D3C();
  v9 = self;
  sub_1A48B7FC4(v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
