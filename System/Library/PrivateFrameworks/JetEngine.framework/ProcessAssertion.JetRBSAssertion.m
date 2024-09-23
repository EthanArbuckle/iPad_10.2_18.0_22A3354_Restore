@implementation ProcessAssertion.JetRBSAssertion

- (void)dealloc
{
  _TtCV9JetEngine16ProcessAssertionP33_DB8C5F477783C81D7997C496FBB2240A15JetRBSAssertion *v2;

  v2 = self;
  sub_19CE90964();
}

- (_TtCV9JetEngine16ProcessAssertionP33_DB8C5F477783C81D7997C496FBB2240A15JetRBSAssertion)initWithExplanation:(id)a3 target:(id)a4 attributes:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  _TtCV9JetEngine16ProcessAssertionP33_DB8C5F477783C81D7997C496FBB2240A15JetRBSAssertion *v10;
  objc_super v12;

  sub_19CFDF578();
  sub_19CCC3DE8();
  sub_19CFDF86C();
  v7 = a4;
  v8 = (void *)sub_19CFDF554();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_19CFDF854();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ProcessAssertion.JetRBSAssertion();
  v10 = -[ProcessAssertion.JetRBSAssertion initWithExplanation:target:attributes:](&v12, sel_initWithExplanation_target_attributes_, v8, v7, v9);

  return v10;
}

@end
