@implementation SecConcrete_sec_protocol_configuration_builder

- (SecConcrete_sec_protocol_configuration_builder)init
{
  SecConcrete_sec_protocol_configuration_builder *v2;
  __CFBundle *MainBundle;
  const __CFDictionary *InfoDictionary;
  __CFDictionary *Value;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SecConcrete_sec_protocol_configuration_builder;
  v2 = -[SecConcrete_sec_protocol_configuration_builder init](&v7, sel_init);
  if (v2)
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle)
    {
      InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
      if (InfoDictionary)
      {
        Value = (__CFDictionary *)CFDictionaryGetValue(InfoDictionary, CFSTR("NSAppTransportSecurity"));
        v2->dictionary = Value;
        if (Value)
          CFRetain(Value);
        if (_is_apple_bundle_onceToken != -1)
          dispatch_once(&_is_apple_bundle_onceToken, &__block_literal_global_3624);
        v2->is_apple = _is_apple_bundle_result;
      }
    }
  }
  return v2;
}

- (SecConcrete_sec_protocol_configuration_builder)initWithDictionary:(__CFDictionary *)a3 andInternalFlag:(BOOL)a4
{
  SecConcrete_sec_protocol_configuration_builder *v6;
  SecConcrete_sec_protocol_configuration_builder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SecConcrete_sec_protocol_configuration_builder;
  v6 = -[SecConcrete_sec_protocol_configuration_builder init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->dictionary = a3;
    if (a3)
      CFRetain(a3);
    v7->is_apple = a4;
  }
  return v7;
}

@end
