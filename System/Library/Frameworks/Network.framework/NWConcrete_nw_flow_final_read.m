@implementation NWConcrete_nw_flow_final_read

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_flow_final_read;
  -[NWConcrete_nw_flow_final_read dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->content_context, 0);
  objc_storeStrong((id *)&self->content, 0);
}

@end
