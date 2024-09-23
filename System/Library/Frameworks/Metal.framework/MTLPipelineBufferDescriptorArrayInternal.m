@implementation MTLPipelineBufferDescriptorArrayInternal

- (id)_descriptorAtIndex:(unint64_t)a3
{
  return self->_descriptors[a3];
}

- (void)dealloc
{
  uint64_t v3;
  MTLPipelineBufferDescriptorInternal **descriptors;
  objc_super v5;

  v3 = 0;
  descriptors = self->_descriptors;
  do

  while (v3 != 31);
  v5.receiver = self;
  v5.super_class = (Class)MTLPipelineBufferDescriptorArrayInternal;
  -[MTLPipelineBufferDescriptorArrayInternal dealloc](&v5, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  _BOOL4 v6;
  uint64_t v7;
  MTLPipelineBufferDescriptorInternal **descriptors;
  char *v9;
  MTLPipelineBufferDescriptorInternal *v10;
  MTLPipelineBufferDescriptorInternal *v11;
  BOOL v12;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      v7 = 0;
      descriptors = self->_descriptors;
      v9 = (char *)a3 + 8;
      do
      {
        v10 = descriptors[v7];
        v11 = *(MTLPipelineBufferDescriptorInternal **)&v9[v7 * 8];
        if (v10 != v11)
        {
          if (v10)
            v12 = v11 == 0;
          else
            v12 = 1;
          if (v12)
          {
            if (v10)
            {
              v6 = -[MTLPipelineBufferDescriptorInternal isDefault](v10, "isDefault");
              if (!v6)
                return v6;
              v11 = *(MTLPipelineBufferDescriptorInternal **)&v9[v7 * 8];
            }
            if (v11)
            {
              v6 = -[MTLPipelineBufferDescriptorInternal isDefault](v11, "isDefault");
              if (!v6)
                return v6;
            }
          }
          else if (!-[MTLPipelineBufferDescriptorInternal isEqual:](v10, "isEqual:"))
          {
            goto LABEL_3;
          }
        }
        ++v7;
      }
      while (v7 != 31);
      LOBYTE(v6) = 1;
    }
    else
    {
LABEL_3:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v9;
  id result;

  if (a3 >= 0x1F)
    MTLReportFailure(0, "-[MTLPipelineBufferDescriptorArrayInternal objectAtIndexedSubscript:]", 269, (uint64_t)CFSTR("bufferIndex(%lu) must be < %lu"), v3, v4, v5, v6, a3);
  v9 = (id *)&self->_descriptors[a3];
  result = *v9;
  if (!*v9)
  {
    result = objc_alloc_init(MTLPipelineBufferDescriptorInternal);
    while (!__ldaxr((unint64_t *)v9))
    {
      if (!__stlxr((unint64_t)result, (unint64_t *)v9))
      {
        *v9 = result;
        return result;
      }
    }
    __clrex();

    return *v9;
  }
  return result;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLPipelineBufferDescriptorInternal **descriptors;
  uint64_t v12;
  MTLPipelineBufferDescriptorInternal *v13;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLPipelineBufferDescriptorArrayInternal setObject:atIndexedSubscript:]", 286, (uint64_t)CFSTR("buffer is not a MTLPipelineBufferDescriptor."), v4, v5, v6, v7, v12);
  }
  if (a4 >= 0x1F)
    MTLReportFailure(0, "-[MTLPipelineBufferDescriptorArrayInternal setObject:atIndexedSubscript:]", 288, (uint64_t)CFSTR("bufferIndex(%lu) must be < %lu"), v4, v5, v6, v7, a4);
  descriptors = self->_descriptors;
  if (descriptors[a4] != a3)
  {
    v13 = descriptors[a4];
    descriptors[a4] = (MTLPipelineBufferDescriptorInternal *)objc_msgSend(a3, "copy");

  }
}

@end
