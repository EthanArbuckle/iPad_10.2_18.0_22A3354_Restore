@implementation NWConcrete_nw_protocol_options

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->legacy_parameters, 0);
  objc_storeStrong((id *)&self->proxy_next_hops, 0);
  objc_storeStrong((id *)&self->proxy_endpoint, 0);
  objc_storeStrong((id *)&self->definition, 0);
}

- (void)dealloc
{
  NWConcrete_nw_protocol_definition *definition;
  void (*deallocate_options)(void);
  objc_super v5;

  if (self->handle)
  {
    definition = self->definition;
    if (definition)
    {
      deallocate_options = (void (*)(void))definition->deallocate_options;
      if (deallocate_options)
        deallocate_options();
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_protocol_options;
  -[NWConcrete_nw_protocol_options dealloc](&v5, sel_dealloc);
}

@end
