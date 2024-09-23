@implementation IOGPUMetalIOHandleCompressed

- (IOGPUMetalIOHandleCompressed)initWithDevice:(id)a3 path:(const char *)a4 compressionType:(int64_t)a5 error:(id *)a6 uncached:(BOOL)a7
{
  IOGPUMetalIOHandleCompressed *v9;
  MTLDevice *v10;
  _DWORD *v11;
  id v12;
  uint64_t v13;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)IOGPUMetalIOHandleCompressed;
  v9 = -[_MTLIOHandleCompressed initWithDevice:path:compressionType:error:uncached:](&v15, sel_initWithDevice_path_compressionType_error_uncached_);
  if (v9)
  {
    v10 = (MTLDevice *)a3;
    v9->_dev = v10;
    v11 = (_DWORD *)-[MTLDevice deviceRef](v10, "deviceRef");
    if (IOGPUDeviceCreateVNIODesc(v11, *(_DWORD *)((char *)&v9->super.super.super.isa + (int)*MEMORY[0x24BDDD928]), &v9->_vnioID, &v9->_globalTraceObjectID))
    {
      if (a6)
      {
        v12 = objc_alloc(MEMORY[0x24BDD1540]);
        v13 = *MEMORY[0x24BDDD280];
        v16 = *MEMORY[0x24BDD0FC8];
        v17[0] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Internal Error");
        *a6 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1));
      }

      return 0;
    }
    else if (*(_DWORD *)__globalGPUCommPage)
    {
      IOGPUDeviceTraceObjectLabel(-[MTLDevice deviceRef](v9->_dev, "deviceRef"), 8, 26, v9->_globalTraceObjectID, 0);
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_vnioID)
    IOGPUDeviceDestroyVNIODesc((_DWORD *)-[MTLDevice deviceRef](self->_dev, "deviceRef"), self->_vnioID);

  self->_dev = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalIOHandleCompressed;
  -[_MTLIOHandleCompressed dealloc](&v3, sel_dealloc);
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setLabel:(id)a3
{
  uint64_t v5;
  unint64_t globalTraceObjectID;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalIOHandleCompressed;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD920]), "deviceRef");
    globalTraceObjectID = self->_globalTraceObjectID;
    v7 = (int)*MEMORY[0x24BDDD930];
    v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, globalTraceObjectID, v8);
  }
}

- (unsigned)vnioID
{
  return self->_vnioID;
}

@end
