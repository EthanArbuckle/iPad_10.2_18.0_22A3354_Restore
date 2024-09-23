@implementation NWConcrete_nw_agent_client

- (void)dealloc
{
  id v3;
  nw_protocol *framer_protocol;
  uint64_t v5;
  objc_super v6;
  _QWORD v7[5];

  if (self->framer_protocol)
  {
    v3 = nw_parameters_copy_context(self->parameters);
    framer_protocol = self->framer_protocol;
    v5 = MEMORY[0x1E0C809B0];
    self->framer_protocol = 0;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __37__NWConcrete_nw_agent_client_dealloc__block_invoke;
    v7[3] = &__block_descriptor_40_e5_v8__0l;
    v7[4] = framer_protocol;
    nw_queue_context_async(v3, v7);

  }
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_agent_client;
  -[NWConcrete_nw_agent_client dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->channel, 0);
  objc_storeStrong((id *)&self->group_descriptor, 0);
  objc_storeStrong((id *)&self->browse_descriptor, 0);
  objc_storeStrong((id *)&self->advertise_descriptor, 0);
  objc_storeStrong((id *)&self->path, 0);
  objc_storeStrong((id *)&self->parameters, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
}

@end
