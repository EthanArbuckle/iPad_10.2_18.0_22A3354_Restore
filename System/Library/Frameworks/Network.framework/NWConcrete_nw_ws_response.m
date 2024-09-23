@implementation NWConcrete_nw_ws_response

- (void)dealloc
{
  char *selected_subprotocol;
  objc_super v4;

  selected_subprotocol = self->selected_subprotocol;
  if (selected_subprotocol)
  {
    free(selected_subprotocol);
    self->selected_subprotocol = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_ws_response;
  -[NWConcrete_nw_ws_response dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->header_values, 0);
  objc_storeStrong((id *)&self->header_names, 0);
}

@end
