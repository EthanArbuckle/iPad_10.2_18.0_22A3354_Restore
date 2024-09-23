@implementation IOAccelMTLEvent

- (IOAccelMTLEvent)initWithShared:(__IOAccelShared *)a3
{
  return -[IOAccelMTLEvent initWithShared:options:](self, "initWithShared:options:", a3, 0);
}

- (IOAccelMTLEvent)initWithShared:(__IOAccelShared *)a3 options:(unint64_t)a4
{
  IOAccelMTLEvent *v6;
  IOAccelMTLEvent *v7;
  size_t v9;
  uint64_t outputStruct;
  __int128 v11;
  objc_super v12;
  _QWORD inputStruct[2];

  inputStruct[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)IOAccelMTLEvent;
  v6 = -[IOAccelMTLEvent init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_sharedRef = a3;
    CFRetain(a3);
    inputStruct[0] = a4;
    outputStruct = 0;
    v11 = 0uLL;
    v9 = 24;
    if (IOConnectCallMethod(v7->_sharedRef->var2, 9u, 0, 0, inputStruct, 8uLL, 0, 0, &outputStruct, &v9))
    {

      return 0;
    }
    else
    {
      v7->_eventName = outputStruct;
      *(_OWORD *)&v7->_globalTraceObjectID = v11;
    }
  }
  return v7;
}

- (void)dealloc
{
  __IOAccelShared *sharedRef;
  objc_super v4;
  uint64_t input;

  sharedRef = self->_sharedRef;
  if (sharedRef)
  {
    if (self->_eventName)
    {
      input = self->_eventName;
      IOConnectCallMethod(sharedRef->var2, 0xAu, &input, 1u, 0, 0, 0, 0, 0, 0);
      sharedRef = self->_sharedRef;
    }
    CFRelease(sharedRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOAccelMTLEvent;
  -[IOAccelMTLEvent dealloc](&v4, sel_dealloc);
}

- (unsigned)encodeKernelSignalEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4
{
  a3->var0 = self->_eventName;
  a3->var3 = a4;
  return 6;
}

- (unsigned)encodeKernelWaitEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4
{
  a3->var0 = self->_eventName;
  a3->var3 = a4;
  return 7;
}

- (unsigned)encodeKernelWaitEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  unsigned __int16 v5;

  a3->var0 = self->_eventName;
  a3->var3 = a4;
  if (a5 >= 0xFFFF)
    v5 = -1;
  else
    v5 = a5;
  a3->var2 = v5;
  return 12;
}

- (unsigned)encodeKernelWaitEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3
{
  abort();
}

- (BOOL)supportsRollback
{
  return self->_eventOptions & 1;
}

@end
