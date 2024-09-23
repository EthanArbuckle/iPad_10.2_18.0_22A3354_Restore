@implementation ConfigurationIntentResponse

- (int64_t)code
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___ConfigurationIntentResponse_code);
}

- (void)setCode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ConfigurationIntentResponse_code) = (Class)a3;
}

- (ConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  ConfigurationIntentResponse *v7;
  ConfigurationIntentResponse *v8;

  v6 = a4;
  v7 = -[ConfigurationIntentResponse init](self, "init");
  *(Class *)((char *)&v7->super.super.isa + OBJC_IVAR___ConfigurationIntentResponse_code) = (Class)a3;
  v8 = v7;
  -[ConfigurationIntentResponse setUserActivity:](v8, "setUserActivity:", v6);

  return v8;
}

- (ConfigurationIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ConfigurationIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return -[ConfigurationIntentResponse init](&v3, "init");
}

- (ConfigurationIntentResponse)initWithCoder:(id)a3
{
  return (ConfigurationIntentResponse *)sub_10000F408((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ConfigurationIntentResponse)initWithBackingStore:(id)a3
{
  return (ConfigurationIntentResponse *)sub_10000F408((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ConfigurationIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  else
    v3 = 0;
  return (ConfigurationIntentResponse *)sub_10000F460(v3);
}

@end
