@implementation CameraKitHubClassTerminate

uint64_t ____CameraKitHubClassTerminate_block_invoke(uint64_t a1)
{
  io_object_t v2;
  io_object_t v3;

  MEMORY[0x219A07B80](*(unsigned int *)(a1 + 48));
  v2 = IOIteratorNext(*(_DWORD *)(a1 + 48));
  if (v2)
  {
    v3 = v2;
    do
    {
      if (objc_msgSend(*(id *)(a1 + 32), "ioUSB20CameraKitHubService") == v3)
        __CameraKitHubClassReset(*(_QWORD *)(a1 + 40));
      IOObjectRelease(v3);
      v3 = IOIteratorNext(*(_DWORD *)(a1 + 48));
    }
    while (v3);
  }
  return IOObjectRelease(*(_DWORD *)(a1 + 48));
}

uint64_t ____CameraKitHubClassTerminate_block_invoke_2(uint64_t a1)
{
  io_object_t v2;
  io_object_t v3;

  MEMORY[0x219A07B80](*(unsigned int *)(a1 + 48));
  v2 = IOIteratorNext(*(_DWORD *)(a1 + 48));
  if (v2)
  {
    v3 = v2;
    do
    {
      if (objc_msgSend(*(id *)(a1 + 32), "ioUSB30CameraKitHubService") == v3)
        __CameraKitHubClassReset(*(_QWORD *)(a1 + 40));
      IOObjectRelease(v3);
      v3 = IOIteratorNext(*(_DWORD *)(a1 + 48));
    }
    while (v3);
  }
  return IOObjectRelease(*(_DWORD *)(a1 + 48));
}

@end
