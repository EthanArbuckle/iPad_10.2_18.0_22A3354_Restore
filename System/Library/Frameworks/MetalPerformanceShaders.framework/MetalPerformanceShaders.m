BOOL MPSSupportsMTLDevice(id device)
{
  if (device)
    LOBYTE(device) = MPSDevice::GetMPSDevice() != 0;
  return (char)device;
}

id MPSGetPreferredDevice(MPSDeviceOptions options)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  dispatch_once_t *v5;
  uint64_t v6;
  _QWORD block[9];

  if (options > 3)
    return 0;
  block[7] = v1;
  block[8] = v2;
  v4 = &qword_254513BD0[options];
  v6 = v4[4];
  v5 = v4 + 4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_206759ED4;
  block[3] = &unk_24BFD3290;
  block[4] = options;
  if (v6 != -1)
    dispatch_once(v5, block);
  return (id)qword_254513BD0[options];
}

id sub_206759ED4(uint64_t a1)
{
  id result;

  result = MTLCreateSystemDefaultDevice();
  qword_254513BD0[*(_QWORD *)(a1 + 32)] = result;
  return result;
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

uint64_t MPSAutoCache::PrefetchHeapSize()
{
  return off_24BFD3270();
}

uint64_t MPSAutoCache::SetHeapCacheDuration()
{
  return off_24BFD3278();
}

uint64_t MPSDevice::GetMPSDevice()
{
  return off_24BFD3280();
}

