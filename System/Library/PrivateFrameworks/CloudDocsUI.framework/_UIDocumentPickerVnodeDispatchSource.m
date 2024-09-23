@implementation _UIDocumentPickerVnodeDispatchSource

- (_UIDocumentPickerVnodeDispatchSource)initWithTarget:(id)a3 url:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _UIDocumentPickerVnodeDispatchSource *v11;
  _UIDocumentPickerVnodeDispatchSource *v12;
  int v13;
  dispatch_source_t v14;
  OS_dispatch_source *source;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v20[4];
  int v21;
  _QWORD handler[4];
  id v23;
  id location;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_UIDocumentPickerVnodeDispatchSource;
  v11 = -[_UIDocumentPickerVnodeDispatchSource init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_target, v8);
    objc_storeStrong((id *)&v12->_url, a4);
    v13 = open((const char *)objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation"), 0x8000);
    v14 = dispatch_source_create(MEMORY[0x24BDACA28], v13, 2uLL, v10);
    source = v12->_source;
    v12->_source = (OS_dispatch_source *)v14;

    objc_initWeak(&location, v12);
    v16 = v12->_source;
    v17 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __65___UIDocumentPickerVnodeDispatchSource_initWithTarget_url_queue___block_invoke;
    handler[3] = &unk_24E43B270;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v16, handler);
    v18 = v12->_source;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __65___UIDocumentPickerVnodeDispatchSource_initWithTarget_url_queue___block_invoke_2;
    v20[3] = &__block_descriptor_36_e5_v8__0l;
    v21 = v13;
    dispatch_source_set_cancel_handler(v18, v20);
    dispatch_resume((dispatch_object_t)v12->_source);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (NSURL)url
{
  return self->_url;
}

- (void)event
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(WeakRetained, "dispatchSourceDidReceiveEvent:", self);

}

- (void)invalidate
{
  OS_dispatch_source *source;

  dispatch_source_cancel((dispatch_source_t)self->_source);
  source = self->_source;
  self->_source = 0;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIDocumentPickerVnodeDispatchSource;
  -[_UIDocumentPickerVnodeDispatchSource dealloc](&v2, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p>, %@"), objc_opt_class(), self, self->_url);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
