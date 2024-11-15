@implementation SecConcrete_sec_protocol_configuration

- (SecConcrete_sec_protocol_configuration)init
{
  SecConcrete_sec_protocol_configuration *v2;
  OS_xpc_object *v3;
  OS_xpc_object *dictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SecConcrete_sec_protocol_configuration;
  v2 = -[SecConcrete_sec_protocol_configuration init](&v6, sel_init);
  if (v2)
  {
    v3 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    dictionary = v2->dictionary;
    v2->dictionary = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dictionary, 0);
}

@end
