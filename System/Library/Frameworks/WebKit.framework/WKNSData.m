@implementation WKNSData

- (Object)_apiObject
{
  return (Object *)&self->_data;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<API::Data> *))self->_data.data.__lx)(&self->_data);
    v4.receiver = self;
    v4.super_class = (Class)WKNSData;
    -[WKNSData dealloc](&v4, sel_dealloc);
  }
}

- (unint64_t)length
{
  return *(_QWORD *)&self->_data.data.__lx[24];
}

- (const)bytes
{
  return *(const void **)&self->_data.data.__lx[16];
}

@end
