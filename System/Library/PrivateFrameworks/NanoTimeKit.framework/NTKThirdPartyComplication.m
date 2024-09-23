@implementation NTKThirdPartyComplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKThirdPartyComplication;
  v4 = a3;
  -[NTKComplication encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[NTKComplication appIdentifier](self, "appIdentifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("RemoteComplicationAppBundleIdentifierKey"));

  -[NTKThirdPartyComplication clkClientIdentifier](self, "clkClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("RemoteComplicationClientIdentifierKey"));

  -[NTKThirdPartyComplication clkComplicationDescriptor](self, "clkComplicationDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("RemoteComplicationComplicationDescriptorKey"));

}

- (void)_addKeysToJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKThirdPartyComplication;
  v4 = a3;
  -[NTKComplication _addKeysToJSONDictionary:](&v9, sel__addKeysToJSONDictionary_, v4);
  -[NTKComplication appIdentifier](self, "appIdentifier", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("app"));

  -[NTKThirdPartyComplication clkClientIdentifier](self, "clkClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("extension"));

  -[NTKThirdPartyComplication clkComplicationDescriptor](self, "clkComplicationDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "JSONObjectRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("complication descriptor"));

}

- (NSString)clkClientIdentifier
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

- (CLKComplicationDescriptor)clkComplicationDescriptor
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

@end
