@implementation __IOGCFastPathRoyaReplayInputQueue

- (void)dealloc
{
  unint64_t v3;
  __IOGCFastPathRoyaReplayInputQueueEntryStorage **p_workingStorage;
  __IOGCFastPathRoyaReplayInputQueueEntryStorage *v5;
  objc_super v6;

  if (self->_bufferCapacity)
  {
    v3 = 0;
    p_workingStorage = &self->_buffer[0].workingStorage;
    do
    {

      v5 = *p_workingStorage;
      p_workingStorage += 3;

      ++v3;
    }
    while (v3 < self->_bufferCapacity);
  }

  v6.receiver = self;
  v6.super_class = (Class)__IOGCFastPathRoyaReplayInputQueue;
  -[__IOGCFastPathInputQueue dealloc](&v6, sel_dealloc);
}

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  int *v9;
  int v10;
  CFUUIDRef v12;

  v6 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v6, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x19u, 0x43u, 0x1Bu, 0xCFu, 0xBBu, 0xEFu, 0x43u, 0x5Bu, 0x9Cu, 0x57u, 0xB3u, 0xF3u, 0x48u, 6u, 0x86u, 0x2Du), CFEqual(v6, v8)))
  {
    v9 = &OBJC_IVAR_____IOGCFastPathRoyaReplayInputQueue__IOGCFastPathQueueVTBL;
  }
  else
  {
    v12 = CFUUIDGetConstantUUIDWithBytes(0, 0x4Eu, 0x78u, 0xA7u, 0x1Fu, 0x35u, 0xD1u, 0x4Fu, 0x65u, 0xA7u, 0x27u, 0xC1u, 0x39u, 0x1Eu, 0x29u, 0xE2u, 0x31u);
    if (!CFEqual(v6, v12))
    {
      v10 = -2147483644;
      goto LABEL_5;
    }
    v9 = &OBJC_IVAR_____IOGCFastPathRoyaReplayInputQueue__IOGCFastPathSampleContainerVTBL;
  }
  *a4 = (char *)self + *v9;
  CFRetain(self);
  v10 = 0;
LABEL_5:
  CFRelease(v6);
  return v10;
}

@end
