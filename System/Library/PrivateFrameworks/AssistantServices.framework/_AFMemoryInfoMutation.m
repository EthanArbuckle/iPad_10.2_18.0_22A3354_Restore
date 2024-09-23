@implementation _AFMemoryInfoMutation

- (_AFMemoryInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFMemoryInfoMutation *v6;
  _AFMemoryInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMemoryInfoMutation;
  v6 = -[_AFMemoryInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getVirtualMemorySizeInBytes
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_virtualMemorySizeInBytes;
  else
    return -[AFMemoryInfo virtualMemorySizeInBytes](self->_base, "virtualMemorySizeInBytes");
}

- (void)setVirtualMemorySizeInBytes:(unint64_t)a3
{
  self->_virtualMemorySizeInBytes = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (int)getNumberOfRegions
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_numberOfRegions;
  else
    return -[AFMemoryInfo numberOfRegions](self->_base, "numberOfRegions");
}

- (void)setNumberOfRegions:(int)a3
{
  self->_numberOfRegions = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (int)getPageSizeInBytes
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_pageSizeInBytes;
  else
    return -[AFMemoryInfo pageSizeInBytes](self->_base, "pageSizeInBytes");
}

- (void)setPageSizeInBytes:(int)a3
{
  self->_pageSizeInBytes = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (unint64_t)getResidentMemorySizeInBytes
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_residentMemorySizeInBytes;
  else
    return -[AFMemoryInfo residentMemorySizeInBytes](self->_base, "residentMemorySizeInBytes");
}

- (void)setResidentMemorySizeInBytes:(unint64_t)a3
{
  self->_residentMemorySizeInBytes = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (unint64_t)getPeakResidentMemorySizeInBytes
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
    return self->_peakResidentMemorySizeInBytes;
  else
    return -[AFMemoryInfo peakResidentMemorySizeInBytes](self->_base, "peakResidentMemorySizeInBytes");
}

- (void)setPeakResidentMemorySizeInBytes:(unint64_t)a3
{
  self->_peakResidentMemorySizeInBytes = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (unint64_t)getPhysicalMemoryFootprintInBytes
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
    return self->_physicalMemoryFootprintInBytes;
  else
    return -[AFMemoryInfo physicalMemoryFootprintInBytes](self->_base, "physicalMemoryFootprintInBytes");
}

- (void)setPhysicalMemoryFootprintInBytes:(unint64_t)a3
{
  self->_physicalMemoryFootprintInBytes = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

@end
