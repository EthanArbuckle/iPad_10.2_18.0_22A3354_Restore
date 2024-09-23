@implementation AGXA10FamilyDeadlineProfile

- (AGXA10FamilyDeadlineProfile)initWithDevice:(__IOGPUDevice *)a3 executionSize:(unint64_t)a4
{
  AGXA10FamilyDeadlineProfile *v6;
  AGXA10FamilyDeadlineProfile *v7;
  unint64_t v8;
  size_t outputStructCnt;
  unint64_t outputStruct;
  int v12;
  unsigned int v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AGXA10FamilyDeadlineProfile;
  v6 = -[AGXA10FamilyDeadlineProfile init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_deviceRef = a3;
    CFRetain(a3);
    v12 = a4;
    v13 = 0;
    outputStructCnt = 16;
    outputStruct = 0;
    if (IOConnectCallStructMethod(v7->_deviceRef->var2, 0x10Bu, &outputStruct, 0x10uLL, &outputStruct, &outputStructCnt))
    {

      return 0;
    }
    else
    {
      v7->_deadlineProfileID = v13;
      v8 = outputStruct;
      v7->_executionSize = a4;
      v7->_globalTraceObjectID = v8;
    }
  }
  return v7;
}

- (void)dealloc
{
  __IOGPUDevice *deviceRef;
  unsigned int deadlineProfileID;
  objc_super v5;
  uint64_t inputStruct;
  int v7;
  unsigned int v8;

  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    deadlineProfileID = self->_deadlineProfileID;
    if (deadlineProfileID)
    {
      inputStruct = 0;
      v7 = 0;
      v8 = deadlineProfileID;
      IOConnectCallStructMethod(deviceRef->var2, 0x10Cu, &inputStruct, 0x10uLL, 0, 0);
      deviceRef = self->_deviceRef;
    }
    CFRelease(deviceRef);
  }
  v5.receiver = self;
  v5.super_class = (Class)AGXA10FamilyDeadlineProfile;
  -[AGXA10FamilyDeadlineProfile dealloc](&v5, sel_dealloc);
}

@end
