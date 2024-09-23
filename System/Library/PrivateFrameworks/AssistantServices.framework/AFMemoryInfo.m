@implementation AFMemoryInfo

- (AFMemoryInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFMemoryInfoMutation *);
  AFMemoryInfo *v5;
  AFMemoryInfo *v6;
  _AFMemoryInfoMutation *v7;
  objc_super v9;

  v4 = (void (**)(id, _AFMemoryInfoMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFMemoryInfo;
  v5 = -[AFMemoryInfo init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFMemoryInfoMutation initWithBase:]([_AFMemoryInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFMemoryInfoMutation isDirty](v7, "isDirty"))
    {
      v6->_virtualMemorySizeInBytes = -[_AFMemoryInfoMutation getVirtualMemorySizeInBytes](v7, "getVirtualMemorySizeInBytes");
      v6->_numberOfRegions = -[_AFMemoryInfoMutation getNumberOfRegions](v7, "getNumberOfRegions");
      v6->_pageSizeInBytes = -[_AFMemoryInfoMutation getPageSizeInBytes](v7, "getPageSizeInBytes");
      v6->_residentMemorySizeInBytes = -[_AFMemoryInfoMutation getResidentMemorySizeInBytes](v7, "getResidentMemorySizeInBytes");
      v6->_peakResidentMemorySizeInBytes = -[_AFMemoryInfoMutation getPeakResidentMemorySizeInBytes](v7, "getPeakResidentMemorySizeInBytes");
      v6->_physicalMemoryFootprintInBytes = -[_AFMemoryInfoMutation getPhysicalMemoryFootprintInBytes](v7, "getPhysicalMemoryFootprintInBytes");
    }

  }
  return v6;
}

- (AFMemoryInfo)init
{
  return -[AFMemoryInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFMemoryInfo)initWithVirtualMemorySizeInBytes:(unint64_t)a3 numberOfRegions:(int)a4 pageSizeInBytes:(int)a5 residentMemorySizeInBytes:(unint64_t)a6 peakResidentMemorySizeInBytes:(unint64_t)a7 physicalMemoryFootprintInBytes:(unint64_t)a8
{
  _QWORD v9[8];
  int v10;
  int v11;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __168__AFMemoryInfo_initWithVirtualMemorySizeInBytes_numberOfRegions_pageSizeInBytes_residentMemorySizeInBytes_peakResidentMemorySizeInBytes_physicalMemoryFootprintInBytes___block_invoke;
  v9[3] = &__block_descriptor_72_e32_v16__0___AFMemoryInfoMutating__8l;
  v10 = a4;
  v11 = a5;
  v9[4] = a3;
  v9[5] = a6;
  v9[6] = a7;
  v9[7] = a8;
  return -[AFMemoryInfo initWithBuilder:](self, "initWithBuilder:", v9);
}

- (id)description
{
  return -[AFMemoryInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFMemoryInfo;
  -[AFMemoryInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {virtualMemorySizeInBytes = %llu, numberOfRegions = %d, pageSizeInBytes = %d, residentMemorySizeInBytes = %llu, peakResidentMemorySizeInBytes = %llu, physicalMemoryFootprintInBytes = %llu}"), v5, self->_virtualMemorySizeInBytes, self->_numberOfRegions, self->_pageSizeInBytes, self->_residentMemorySizeInBytes, self->_peakResidentMemorySizeInBytes, self->_physicalMemoryFootprintInBytes);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_virtualMemorySizeInBytes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfRegions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pageSizeInBytes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_residentMemorySizeInBytes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_peakResidentMemorySizeInBytes);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_physicalMemoryFootprintInBytes);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  AFMemoryInfo *v4;
  AFMemoryInfo *v5;
  unint64_t virtualMemorySizeInBytes;
  int numberOfRegions;
  int pageSizeInBytes;
  unint64_t residentMemorySizeInBytes;
  unint64_t peakResidentMemorySizeInBytes;
  unint64_t physicalMemoryFootprintInBytes;
  BOOL v12;

  v4 = (AFMemoryInfo *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      virtualMemorySizeInBytes = self->_virtualMemorySizeInBytes;
      if (virtualMemorySizeInBytes == -[AFMemoryInfo virtualMemorySizeInBytes](v5, "virtualMemorySizeInBytes")
        && (numberOfRegions = self->_numberOfRegions,
            numberOfRegions == -[AFMemoryInfo numberOfRegions](v5, "numberOfRegions"))
        && (pageSizeInBytes = self->_pageSizeInBytes,
            pageSizeInBytes == -[AFMemoryInfo pageSizeInBytes](v5, "pageSizeInBytes"))
        && (residentMemorySizeInBytes = self->_residentMemorySizeInBytes,
            residentMemorySizeInBytes == -[AFMemoryInfo residentMemorySizeInBytes](v5, "residentMemorySizeInBytes"))
        && (peakResidentMemorySizeInBytes = self->_peakResidentMemorySizeInBytes,
            peakResidentMemorySizeInBytes == -[AFMemoryInfo peakResidentMemorySizeInBytes](v5, "peakResidentMemorySizeInBytes")))
      {
        physicalMemoryFootprintInBytes = self->_physicalMemoryFootprintInBytes;
        v12 = physicalMemoryFootprintInBytes == -[AFMemoryInfo physicalMemoryFootprintInBytes](v5, "physicalMemoryFootprintInBytes");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (AFMemoryInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMemoryInfo::virtualMemorySizeInBytes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMemoryInfo::numberOfRegions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMemoryInfo::pageSizeInBytes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMemoryInfo::residentMemorySizeInBytes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMemoryInfo::peakResidentMemorySizeInBytes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMemoryInfo::physicalMemoryFootprintInBytes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "unsignedLongLongValue");
  return -[AFMemoryInfo initWithVirtualMemorySizeInBytes:numberOfRegions:pageSizeInBytes:residentMemorySizeInBytes:peakResidentMemorySizeInBytes:physicalMemoryFootprintInBytes:](self, "initWithVirtualMemorySizeInBytes:numberOfRegions:pageSizeInBytes:residentMemorySizeInBytes:peakResidentMemorySizeInBytes:physicalMemoryFootprintInBytes:", v6, v8, v10, v12, v14, v16);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t virtualMemorySizeInBytes;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  virtualMemorySizeInBytes = self->_virtualMemorySizeInBytes;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", virtualMemorySizeInBytes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFMemoryInfo::virtualMemorySizeInBytes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfRegions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFMemoryInfo::numberOfRegions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pageSizeInBytes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("AFMemoryInfo::pageSizeInBytes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_residentMemorySizeInBytes);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("AFMemoryInfo::residentMemorySizeInBytes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_peakResidentMemorySizeInBytes);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("AFMemoryInfo::peakResidentMemorySizeInBytes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_physicalMemoryFootprintInBytes);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("AFMemoryInfo::physicalMemoryFootprintInBytes"));

}

- (unint64_t)virtualMemorySizeInBytes
{
  return self->_virtualMemorySizeInBytes;
}

- (int)numberOfRegions
{
  return self->_numberOfRegions;
}

- (int)pageSizeInBytes
{
  return self->_pageSizeInBytes;
}

- (unint64_t)residentMemorySizeInBytes
{
  return self->_residentMemorySizeInBytes;
}

- (unint64_t)peakResidentMemorySizeInBytes
{
  return self->_peakResidentMemorySizeInBytes;
}

- (unint64_t)physicalMemoryFootprintInBytes
{
  return self->_physicalMemoryFootprintInBytes;
}

void __168__AFMemoryInfo_initWithVirtualMemorySizeInBytes_numberOfRegions_pageSizeInBytes_residentMemorySizeInBytes_peakResidentMemorySizeInBytes_physicalMemoryFootprintInBytes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setVirtualMemorySizeInBytes:", v3);
  objc_msgSend(v4, "setNumberOfRegions:", *(unsigned int *)(a1 + 64));
  objc_msgSend(v4, "setPageSizeInBytes:", *(unsigned int *)(a1 + 68));
  objc_msgSend(v4, "setResidentMemorySizeInBytes:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setPeakResidentMemorySizeInBytes:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setPhysicalMemoryFootprintInBytes:", *(_QWORD *)(a1 + 56));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFMemoryInfoMutation *);
  _AFMemoryInfoMutation *v5;
  AFMemoryInfo *v6;

  v4 = (void (**)(id, _AFMemoryInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFMemoryInfoMutation initWithBase:]([_AFMemoryInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFMemoryInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFMemoryInfo);
      v6->_virtualMemorySizeInBytes = -[_AFMemoryInfoMutation getVirtualMemorySizeInBytes](v5, "getVirtualMemorySizeInBytes");
      v6->_numberOfRegions = -[_AFMemoryInfoMutation getNumberOfRegions](v5, "getNumberOfRegions");
      v6->_pageSizeInBytes = -[_AFMemoryInfoMutation getPageSizeInBytes](v5, "getPageSizeInBytes");
      v6->_residentMemorySizeInBytes = -[_AFMemoryInfoMutation getResidentMemorySizeInBytes](v5, "getResidentMemorySizeInBytes");
      v6->_peakResidentMemorySizeInBytes = -[_AFMemoryInfoMutation getPeakResidentMemorySizeInBytes](v5, "getPeakResidentMemorySizeInBytes");
      v6->_physicalMemoryFootprintInBytes = -[_AFMemoryInfoMutation getPhysicalMemoryFootprintInBytes](v5, "getPhysicalMemoryFootprintInBytes");
    }
    else
    {
      v6 = (AFMemoryInfo *)-[AFMemoryInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFMemoryInfo *)-[AFMemoryInfo copy](self, "copy");
  }

  return v6;
}

@end
