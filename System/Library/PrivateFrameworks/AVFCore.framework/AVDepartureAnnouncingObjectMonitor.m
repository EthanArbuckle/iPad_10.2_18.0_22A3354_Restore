@implementation AVDepartureAnnouncingObjectMonitor

- (AVDepartureAnnouncingObjectMonitor)initWithMonitoringObject:(id)a3
{
  AVDepartureAnnouncingObjectMonitor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVDepartureAnnouncingObjectMonitor;
  v4 = -[AVDepartureAnnouncingObjectMonitor init](&v6, sel_init);
  if (v4)
    v4->_weakReferenceToMonitoringObject = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
  return v4;
}

+ (void)attachDepartureAnnouncingObjectMonitorToObject:(id)a3 monitoringObject:(id)a4
{
  objc_setAssociatedObject(a3, CFSTR("AVDepartureAnnouncingObjectMonitorKey"), -[AVDepartureAnnouncingObjectMonitor initWithMonitoringObject:]([AVDepartureAnnouncingObjectMonitor alloc], "initWithMonitoringObject:", a4), (void *)0x301);
}

- (void)dealloc
{
  AVWeakReference *weakReferenceToMonitoringObject;
  NSObject *global_queue;
  objc_super v5;
  _QWORD block[5];

  weakReferenceToMonitoringObject = self->_weakReferenceToMonitoringObject;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___avDepartureAnnouncingObjectMonitorAnnounceDeparture_block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = weakReferenceToMonitoringObject;
  dispatch_async(global_queue, block);

  v5.receiver = self;
  v5.super_class = (Class)AVDepartureAnnouncingObjectMonitor;
  -[AVDepartureAnnouncingObjectMonitor dealloc](&v5, sel_dealloc);
}

@end
