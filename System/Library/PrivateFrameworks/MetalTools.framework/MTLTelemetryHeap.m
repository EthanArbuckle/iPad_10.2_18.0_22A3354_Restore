@implementation MTLTelemetryHeap

- (MTLTelemetryHeap)initWithHeap:(id)a3 descriptor:(id)a4 device:(id)a5
{
  MTLTelemetryHeap *v7;
  MTLTelemetryHeap *v8;
  NSObject *v9;
  int v10;
  objc_super v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)MTLTelemetryHeap;
  v7 = -[MTLToolsObject initWithBaseObject:parent:](&v12, sel_initWithBaseObject_parent_, a3, a5);
  v8 = v7;
  if (v7)
  {
    v7->_telemetryDevice = (MTLTelemetryDevice *)a5;
    if (objc_msgSend(a5, "enableTelemetry"))
    {
      if (*MEMORY[0x24BDDDAC8])
      {
        if (*MEMORY[0x24BDDDAC8] != 1)
          return v8;
        printf("\n\nHeap, size=%u", objc_msgSend(a4, "size"));
      }
      v9 = objc_msgSend(a5, "telemetryLog");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(a4, "size");
        *(_DWORD *)buf = 67109120;
        v14 = v10;
        _os_log_impl(&dword_22CD98000, v9, OS_LOG_TYPE_DEFAULT, "Heap, size=%u", buf, 8u);
      }
    }
  }
  return v8;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  id result;
  id v7;
  MTLTelemetryBuffer *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:", a3, a4);
  if (result)
  {
    v7 = result;
    v8 = -[MTLTelemetryBuffer initWithBuffer:device:options:]([MTLTelemetryBuffer alloc], "initWithBuffer:device:options:", result, self->_telemetryDevice, a4);

    return v8;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLTelemetryTexture *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLTelemetryTexture initWithBaseTexture:device:descriptor:]([MTLTelemetryTexture alloc], "initWithBaseTexture:device:descriptor:", result, self->_telemetryDevice, a3);

    return v7;
  }
  return result;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPurgeableState:", a3);
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5
{
  id result;
  id v8;
  MTLTelemetryBuffer *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:offset:", a3, a4, a5);
  if (result)
  {
    v8 = result;
    v9 = -[MTLTelemetryBuffer initWithBuffer:device:options:]([MTLTelemetryBuffer alloc], "initWithBuffer:device:options:", result, self->_telemetryDevice, a4);

    return v9;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  id result;
  id v7;
  MTLTelemetryTexture *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:offset:", a3, a4);
  if (result)
  {
    v7 = result;
    v8 = -[MTLTelemetryTexture initWithBaseTexture:device:descriptor:]([MTLTelemetryTexture alloc], "initWithBaseTexture:device:descriptor:", result, self->_telemetryDevice, a3);

    return v8;
  }
  return result;
}

- (MTLTelemetryDevice)telemetryDevice
{
  return self->_telemetryDevice;
}

@end
