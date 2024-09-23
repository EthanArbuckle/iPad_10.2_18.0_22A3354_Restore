@implementation AutomatableResolutionResult

+ (id)successWithResolvedAutomatable:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_220C8E6D8((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithAutomatablesToDisambiguate:(id)a3
{
  unint64_t v3;
  id v4;

  type metadata accessor for Automatable();
  v3 = sub_220C98CB8();
  swift_getObjCClassMetadata();
  v4 = sub_220C8E728(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithAutomatableToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_220C8E858((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result;

  result = (id)sub_220C9930C();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result;

  result = (id)sub_220C9930C();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result;

  result = (id)sub_220C9930C();
  __break(1u);
  return result;
}

- (AutomatableResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  AutomatableResolutionResult *v8;
  AutomatableResolutionResult *v9;
  objc_super v11;

  sub_220C989D0();
  v6 = a4;
  v7 = (void *)sub_220C989B8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AutomatableResolutionResult();
  v8 = -[AutomatableResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
