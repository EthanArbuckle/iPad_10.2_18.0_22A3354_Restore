@implementation WFLogOutUserAction

- (WFLogOutUserAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
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
  return (WFLogOutUserAction *)sub_22D359D0C(v7, v9, a4, (uint64_t)a5);
}

- (WFLogOutUserAction)init
{
  return (WFLogOutUserAction *)sub_22D359E70();
}

@end
