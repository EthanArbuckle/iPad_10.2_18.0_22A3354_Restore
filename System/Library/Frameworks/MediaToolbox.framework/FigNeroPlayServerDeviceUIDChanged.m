@implementation FigNeroPlayServerDeviceUIDChanged

void ___FigNeroPlayServerDeviceUIDChanged_block_invoke(uint64_t a1)
{
  OSStatus Property;
  UInt32 ioDataSize;
  CFStringRef outData;

  outData = 0;
  ioDataSize = 8;
  Property = AudioUnitGetProperty(*(AudioUnit *)(*(_QWORD *)(a1 + 32) + 48), 0x3586u, 0, 0, &outData, &ioDataSize);
  if (Property != 1063544182 && Property != 0)
  {
    if (Property != -10879)
      goto LABEL_8;
    outData = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("Unknown HDMI Audio Device UID"));
  }
  _FigNeroPlayServerSetDeviceUID(*(_QWORD *)(a1 + 32), outData);
LABEL_8:
  if (outData)
    CFRelease(outData);
}

@end
