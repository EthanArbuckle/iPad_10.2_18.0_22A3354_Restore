@implementation APLatencyVisualizationTrackingController

- (void)draw
{
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[APLatencyVisualizationLayer setNeedsDisplay](self->_layer, "setNeedsDisplay");
  -[APLatencyVisualizationLayer display](self->_layer, "display");
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (id)init:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD handler[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)APLatencyVisualizationTrackingController;
  v4 = -[APLatencyVisualizationTrackingController init](&v12, sel_init);
  if (v4)
  {
    *((_QWORD *)v4 + 1) = a3;
    v5 = dispatch_queue_create("com.apple.airplay.receiver.latencyTracker", 0);
    *((_QWORD *)v4 + 3) = v5;
    v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v5);
    v7 = MEMORY[0x24BDAC760];
    *((_QWORD *)v4 + 2) = v6;
    handler[0] = v7;
    handler[1] = 3221225472;
    handler[2] = __49__APLatencyVisualizationTrackingController_init___block_invoke;
    handler[3] = &unk_24E21FC00;
    handler[4] = v4;
    dispatch_source_set_event_handler(v6, handler);
    v8 = *((_QWORD *)v4 + 2);
    v9 = dispatch_time(0, 16666666);
    dispatch_source_set_timer(v8, v9, 0xFE502AuLL, 0x3E8uLL);
    dispatch_resume(*((dispatch_object_t *)v4 + 2));
  }
  return v4;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__APLatencyVisualizationTrackingController_dealloc__block_invoke;
  block[3] = &unk_24E21FC00;
  block[4] = self;
  dispatch_sync(queue, block);
  dispatch_release((dispatch_object_t)self->_queue);

  self->_layer = 0;
  v4.receiver = self;
  v4.super_class = (Class)APLatencyVisualizationTrackingController;
  -[APLatencyVisualizationTrackingController dealloc](&v4, sel_dealloc);
}

- (id)layer
{
  return self->_layer;
}

void __51__APLatencyVisualizationTrackingController_dealloc__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 16));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __49__APLatencyVisualizationTrackingController_init___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "draw");
}

@end
