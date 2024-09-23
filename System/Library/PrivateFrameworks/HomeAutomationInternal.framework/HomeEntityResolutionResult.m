@implementation HomeEntityResolutionResult

+ (id)successWithResolvedHomeEntity:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_220C91584((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithHomeEntitysToDisambiguate:(id)a3
{
  unint64_t v3;
  id v4;

  type metadata accessor for HomeEntity();
  v3 = sub_220C98CB8();
  swift_getObjCClassMetadata();
  v4 = sub_220C91610(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithHomeEntityToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_220C9175C((uint64_t)a3);

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

- (HomeEntityResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  HomeEntityResolutionResult *v8;
  HomeEntityResolutionResult *v9;
  objc_super v11;

  sub_220C989D0();
  v6 = a4;
  v7 = (void *)sub_220C989B8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HomeEntityResolutionResult();
  v8 = -[HomeEntityResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
