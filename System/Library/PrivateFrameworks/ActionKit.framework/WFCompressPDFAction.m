@implementation WFCompressPDFAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  WFCompressPDFAction *v5;

  v4 = a3;
  v5 = self;
  sub_22D39D550(v4);

}

- (WFCompressPDFAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = sub_22D6665A8();
  v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D80020);
    a5 = (id)sub_22D6664B8();
  }
  v10 = a4;
  return (WFCompressPDFAction *)sub_22D39E460(v7, v9, a4, (uint64_t)a5);
}

- (WFCompressPDFAction)init
{
  return (WFCompressPDFAction *)sub_22D39E5C4();
}

@end
