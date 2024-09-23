@implementation NWConcrete_nw_endpoint_edge

- (void)dealloc
{
  char *name;
  objc_super v4;

  objc_storeWeak((id *)&self->endpoint, 0);
  name = self->name;
  if (name)
  {
    free(name);
    self->name = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_endpoint_edge;
  -[NWConcrete_nw_endpoint_edge dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  const __CFAllocator *v2;
  nw_protocol_identifier *p_identifier;
  id WeakRetained;
  __CFString *v5;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  p_identifier = &self->identifier;
  WeakRetained = objc_loadWeakRetained((id *)&self->endpoint);
  v5 = (__CFString *)CFStringCreateWithFormat(v2, 0, CFSTR("<nw_endpoint_edge %s %@>"), p_identifier, WeakRetained);

  return (NSString *)v5;
}

- (id)redactedDescription
{
  id WeakRetained;
  const char *logging_description;
  __CFString *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->endpoint);
  logging_description = nw_endpoint_get_logging_description(WeakRetained);
  v5 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<nw_endpoint_edge %s %s>"), &self->identifier, logging_description);

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->endpoint);
}

@end
