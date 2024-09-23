@implementation StickyKeyHandler

- (StickyKeyHandler)initWithFilter:(void *)a3 service:(__IOHIDService *)a4
{
  StickyKeyHandler *v6;
  StickyKeyHandler *v7;
  void *v8;
  StickyKeyHandler *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)StickyKeyHandler;
  v6 = -[StickyKeyHandler init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_filter = a3;
    v6->_service = a4;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_StickyKeyNotification_, CFSTR("HIDResetStickyKeyNotification"), 0);

    v9 = v7;
  }

  return v7;
}

- (void)StickyKeyNotification:(id)a3
{
  __IOHIDService *v4;
  __IOHIDService *service;
  void *filter;
  NSObject *v7;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (__IOHIDService *)objc_claimAutoreleasedReturnValue();
  service = self->_service;

  if (v4 != service)
  {
    filter = self->_filter;
    v7 = *((_QWORD *)filter + 62);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2311158A0;
    block[3] = &unk_250000588;
    block[4] = filter;
    dispatch_async(v7, block);
  }
}

- (void)removeObserver
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("HIDResetStickyKeyNotification"), 0);

}

@end
