@implementation TriggerTypeResolutionResult

+ (id)successWithResolvedTriggerType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_220C8B828(a3);
}

+ (id)confirmationRequiredWithTriggerTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_220C8B860(a3);
}

- (TriggerTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  TriggerTypeResolutionResult *v8;
  TriggerTypeResolutionResult *v9;
  objc_super v11;

  sub_220C989D0();
  v6 = a4;
  v7 = (void *)sub_220C989B8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TriggerTypeResolutionResult();
  v8 = -[TriggerTypeResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
