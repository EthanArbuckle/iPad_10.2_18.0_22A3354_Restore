@implementation NWConcrete_nw_ws_ping_request

- (void)dealloc
{
  OS_dispatch_data *contents;
  OS_dispatch_queue *client_queue;
  id pong_handler;
  objc_super v6;

  contents = self->contents;
  self->contents = 0;

  client_queue = self->client_queue;
  self->client_queue = 0;

  pong_handler = self->pong_handler;
  self->pong_handler = 0;

  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_ws_ping_request;
  -[NWConcrete_nw_ws_ping_request dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->pong_handler, 0);
  objc_storeStrong((id *)&self->client_queue, 0);
  objc_storeStrong((id *)&self->contents, 0);
}

@end
