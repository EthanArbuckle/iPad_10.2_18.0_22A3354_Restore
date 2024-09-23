@implementation IOHIDManagerSerializeState

void ____IOHIDManagerSerializeState_block_invoke(uint64_t a1, IOHIDDeviceRef device)
{
  io_registry_entry_t Service;
  uint64_t entryID;

  entryID = 0;
  Service = IOHIDDeviceGetService(device);
  if (Service)
  {
    IORegistryEntryGetRegistryEntryID(Service, &entryID);
    _IOHIDArrayAppendSInt64(*(void **)(a1 + 32), entryID);
  }
}

@end
