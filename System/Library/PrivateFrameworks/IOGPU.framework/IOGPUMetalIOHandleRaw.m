@implementation IOGPUMetalIOHandleRaw

- (IOGPUMetalIOHandleRaw)initWithDevice:(id)a3 path:(const char *)a4 error:(id *)a5 uncached:(BOOL)a6
{
  IOGPUMetalIOHandleRaw *v8;
  MTLDevice *v9;
  _DWORD *v10;
  id v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)IOGPUMetalIOHandleRaw;
  v8 = -[_MTLIOHandleRaw initWithDevice:path:error:uncached:](&v14, sel_initWithDevice_path_error_uncached_);
  if (v8)
  {
    v9 = (MTLDevice *)a3;
    v8->_dev = v9;
    v10 = (_DWORD *)-[MTLDevice deviceRef](v9, "deviceRef");
    if (IOGPUDeviceCreateVNIODesc(v10, *(_DWORD *)((char *)&v8->super.super.super.isa + (int)*MEMORY[0x24BDDD940]), &v8->_vnioID, &v8->_globalTraceObjectID))
    {
      if (a5)
      {
        v11 = objc_alloc(MEMORY[0x24BDD1540]);
        v12 = *MEMORY[0x24BDDD280];
        v15 = *MEMORY[0x24BDD0FC8];
        v16[0] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Internal Error");
        *a5 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1));
      }

      return 0;
    }
    else if (*(_DWORD *)__globalGPUCommPage)
    {
      IOGPUDeviceTraceObjectLabel(-[MTLDevice deviceRef](v8->_dev, "deviceRef"), 8, 26, v8->_globalTraceObjectID, 0);
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_vnioID)
    IOGPUDeviceDestroyVNIODesc((_DWORD *)-[MTLDevice deviceRef](self->_dev, "deviceRef"), self->_vnioID);

  self->_dev = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalIOHandleRaw;
  -[_MTLIOHandleRaw dealloc](&v3, sel_dealloc);
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
  v9.super_class = (Class)IOGPUMetalIOHandleRaw;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD938]), "deviceRef");
    globalTraceObjectID = self->_globalTraceObjectID;
    v7 = (int)*MEMORY[0x24BDDD948];
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
