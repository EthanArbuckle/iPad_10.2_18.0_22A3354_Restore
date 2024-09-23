@implementation IsDeviceDifferentFromLastReturnedDevice

void ____IsDeviceDifferentFromLastReturnedDevice_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.NanoPassKit.LastReturnedDevice", 0);
  v1 = (void *)__LastReturnedDeviceQueue;
  __LastReturnedDeviceQueue = (uint64_t)v0;

}

void ____IsDeviceDifferentFromLastReturnedDevice_block_invoke_2(uint64_t a1)
{
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)__LastReturnedDevicePairingID, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&__LastReturnedDevicePairingID, obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

@end
