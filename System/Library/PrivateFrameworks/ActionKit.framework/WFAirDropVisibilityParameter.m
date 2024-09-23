@implementation WFAirDropVisibilityParameter

- (NSArray)possibleStates
{
  WFAirDropVisibilityParameter *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_22D382470();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254097768);
    v4 = (void *)sub_22D66668C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return sub_22D382E98(self, (uint64_t)a2, a3, sub_22D38264C);
}

- (WFPropertyListObject)defaultSerializedRepresentation
{
  WFAirDropVisibilityParameter *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_22D38289C();

  return (WFPropertyListObject *)v3;
}

- (WFAirDropVisibilityParameter)initWithDefinition:(id)a3
{
  return (WFAirDropVisibilityParameter *)sub_22D3828B4(a3);
}

@end
