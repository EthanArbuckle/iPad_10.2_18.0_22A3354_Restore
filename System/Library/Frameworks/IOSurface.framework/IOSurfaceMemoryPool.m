@implementation IOSurfaceMemoryPool

- (unint64_t)poolId
{
  return self->_poolId;
}

- (int)flush:(id)a3
{
  CFDataRef v4;
  const __CFData *v5;
  mach_port_t v6;
  const UInt8 *BytePtr;
  size_t Length;
  kern_return_t v9;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v4 = IOCFSerialize(a3, 1uLL);
  if (!v4)
    return -536870206;
  v5 = v4;
  input[0] = self->_poolPort;
  v6 = _ioSurfaceConnect();
  BytePtr = CFDataGetBytePtr(v5);
  Length = CFDataGetLength(v5);
  v9 = IOConnectCallMethod(v6, 0x30u, input, 1u, BytePtr, Length, 0, 0, 0, 0);
  CFRelease(v5);
  return v9;
}

- (IOSurfaceMemoryPool)initWithProperties:(id)a3
{
  IOSurfaceMemoryPool *v4;
  CFDataRef v5;
  const __CFData *v6;
  mach_port_t v7;
  const UInt8 *BytePtr;
  size_t Length;
  kern_return_t v10;
  unint64_t v11;
  uint32_t outputCnt;
  objc_super v14;
  uint64_t output;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)IOSurfaceMemoryPool;
  v4 = -[IOSurfaceMemoryPool init](&v14, sel_init);
  if (v4)
  {
    v5 = IOCFSerialize(a3, 1uLL);
    if (v5)
    {
      v6 = v5;
      output = 0;
      v16 = 0;
      outputCnt = 2;
      v7 = _ioSurfaceConnect();
      BytePtr = CFDataGetBytePtr(v6);
      Length = CFDataGetLength(v6);
      v10 = IOConnectCallMethod(v7, 0x2Eu, 0, 0, BytePtr, Length, &output, &outputCnt, 0, 0);
      CFRelease(v6);
      if (!v10)
      {
        v11 = v16;
        v4->_poolPort = output;
        v4->_poolId = v11;
        return v4;
      }

    }
    return 0;
  }
  return v4;
}

- (int)ensureMemory:(id)a3
{
  CFDataRef v4;
  const __CFData *v5;
  mach_port_t v6;
  const UInt8 *BytePtr;
  size_t Length;
  kern_return_t v9;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v4 = IOCFSerialize(a3, 1uLL);
  if (!v4)
    return -536870206;
  v5 = v4;
  input[0] = self->_poolPort;
  v6 = _ioSurfaceConnect();
  BytePtr = CFDataGetBytePtr(v5);
  Length = CFDataGetLength(v5);
  v9 = IOConnectCallMethod(v6, 0x2Fu, input, 1u, BytePtr, Length, 0, 0, 0, 0);
  CFRelease(v5);
  return v9;
}

- (id)copyDebugInfo
{
  mach_port_t v2;
  CFTypeRef v3;
  CFStringRef errorString;
  uint64_t input;
  size_t bufferSize;
  const char *outputStruct[2];

  outputStruct[1] = *(const char **)MEMORY[0x1E0C80C00];
  outputStruct[0] = 0;
  input = self->_poolPort;
  bufferSize = -3;
  v2 = _ioSurfaceConnect();
  v3 = 0;
  if (!IOConnectCallMethod(v2, 0x31u, &input, 1u, 0, 0, 0, 0, outputStruct, &bufferSize))
  {
    errorString = 0;
    v3 = IOCFUnserializeBinary(outputStruct[0], bufferSize, 0, 0, &errorString);
    if (!v3)
    {
      if (errorString)
      {
        NSLog(CFSTR("Failed to unserialize data from kernel: %@"), errorString);
        CFRelease(errorString);
      }
      else
      {
        NSLog(CFSTR("Failed to unserialize data from kernel."));
      }
    }
    mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)outputStruct[0], bufferSize);
  }
  return (id)v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  mach_port_mod_refs(*MEMORY[0x1E0C83DA0], self->_poolPort, 0, -1);
  v3.receiver = self;
  v3.super_class = (Class)IOSurfaceMemoryPool;
  -[IOSurfaceMemoryPool dealloc](&v3, sel_dealloc);
}

@end
