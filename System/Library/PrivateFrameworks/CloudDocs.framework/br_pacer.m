@implementation br_pacer

- (void)dealloc
{
  br_pacer *v2;
  OS_dispatch_source *source;
  OS_dispatch_source *timer;
  OS_dispatch_queue *queue;
  id event_block;
  objc_super v7;

  v2 = self;
  br_pacer_cancel(v2);
  source = v2->source;
  v2->source = 0;

  timer = v2->timer;
  v2->timer = 0;

  queue = v2->queue;
  v2->queue = 0;

  event_block = v2->event_block;
  if (event_block)
  {
    v2->event_block = 0;

  }
  v7.receiver = v2;
  v7.super_class = (Class)br_pacer;
  -[br_pacer dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->event_block, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->timer, 0);
  objc_storeStrong((id *)&self->source, 0);
}

@end
