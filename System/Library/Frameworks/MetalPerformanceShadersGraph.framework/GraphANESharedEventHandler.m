@implementation GraphANESharedEventHandler

- (GraphANESharedEventHandler)initWithDevice:(id)a3
{
  id v4;
  GraphANESharedEventHandler *v5;
  IOSurfaceSharedEvent *v6;
  IOSurfaceSharedEvent *ioSurfaceStartSharedEvent;
  uint64_t v8;
  MTLSharedEvent *sharedEvent;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GraphANESharedEventHandler;
  v5 = -[GraphANESharedEventHandler init](&v11, sel_init);
  v6 = (IOSurfaceSharedEvent *)objc_alloc_init(MEMORY[0x1E0CBBEB8]);
  ioSurfaceStartSharedEvent = v5->_ioSurfaceStartSharedEvent;
  v5->_ioSurfaceStartSharedEvent = v6;

  v8 = objc_msgSend(v4, "newSharedEventWithMachPort:", -[IOSurfaceSharedEvent eventPort](v5->_ioSurfaceStartSharedEvent, "eventPort"));
  sharedEvent = v5->_sharedEvent;
  v5->_sharedEvent = (MTLSharedEvent *)v8;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEvent, 0);
  objc_storeStrong((id *)&self->_ioSurfaceStartSharedEvent, 0);
}

@end
