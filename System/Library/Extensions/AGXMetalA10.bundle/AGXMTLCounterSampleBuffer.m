@implementation AGXMTLCounterSampleBuffer

- (AGXMTLCounterSampleBuffer)initWithDevice:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  if (a5)
    *a5 = 0;
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "counterSet"), "counters"), "count") == 1)
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend(a4, "counterSet"), "name");
    v10 = *MEMORY[0x24BDDD158];
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDDD158]) & 1) != 0)
    {
      v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "counterSet"), "counters"), "objectAtIndexedSubscript:", 0), "name");
      v12 = *MEMORY[0x24BDDD160];
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDDD160]) & 1) != 0)
        return -[AGXMTLCounterSampleBuffer initWithDevice:length:label:options:error:](self, "initWithDevice:length:label:options:error:", a3, 8 * objc_msgSend(a4, "sampleCount"), objc_msgSend(a4, "label"), 16 * (objc_msgSend(a4, "storageMode") & 0xF), a5);
      v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid counter name. Expecting: %@. Found: %@"), v12, v11);
      if (a5)
      {
        v16 = (const __CFString *)v20;
        if (!v20)
          goto LABEL_17;
LABEL_11:
        v14 = (void *)MEMORY[0x24BDBCE70];
        v15 = *MEMORY[0x24BDD0FC8];
        goto LABEL_12;
      }
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid counter set name. Expecting: %@. Found: %@"), v10, v9);
      if (a5)
      {
        v16 = (const __CFString *)v17;
        if (!v17)
        {
LABEL_17:
          v18 = 0;
          goto LABEL_13;
        }
        goto LABEL_11;
      }
    }
  }
  else if (a5)
  {
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = *MEMORY[0x24BDD0FC8];
    v16 = CFSTR("Invalid counter set size. Expecting 1 counter");
LABEL_12:
    v18 = objc_msgSend(v14, "dictionaryWithObject:forKey:", v16, v15);
LABEL_13:
    v19 = objc_alloc(MEMORY[0x24BDD1540]);
    *a5 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x24BDDD1C8], 1, v18);
  }
  return 0;
}

- (AGXMTLCounterSampleBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 label:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  AGXMTLCounterSampleBuffer *v12;
  AGXMTLCounterSampleBuffer *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  AGXBuffer *v25;
  objc_super v26;

  if (a7)
    *a7 = 0;
  v26.receiver = self;
  v26.super_class = (Class)AGXMTLCounterSampleBuffer;
  v12 = -[AGXMTLCounterSampleBuffer init](&v26, sel_init);
  if (v12)
  {
    v13 = v12;
    if (a4 - 32769 > 0xFFFFFFFFFFFF7FFFLL)
    {
      if ((a4 & 7) == 0)
      {
        v25 = -[AGXBuffer initCounterSampleBufferWithDevice:length:options:]([AGXBuffer alloc], "initCounterSampleBufferWithDevice:length:options:", a3, a4, a6);
        v13->_buffer = v25;
        if (v25)
        {
          v13->_device = (IOGPUMetalDevice *)a3;
          v13->_label = (NSString *)objc_msgSend(a5, "copy");
          v13->_sampleCount = a4 >> 3;
          return v13;
        }
        if (!a7)
          goto LABEL_16;
        v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Cannot allocate sample buffer"), *MEMORY[0x24BDD0FC8]);
        v21 = objc_alloc(MEMORY[0x24BDD1540]);
        v22 = *MEMORY[0x24BDDD1C8];
        v23 = 0;
        goto LABEL_15;
      }
      v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid sample buffer length: %llu B. Length must be aligned to %zu B"), a4, 8);
      if (a7)
      {
        v15 = v20;
        if (v20)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid sample buffer length: %llu B. Expected range: %zu -> %u"), a4, 8, 0x8000);
      if (a7)
      {
        v15 = v14;
        if (v14)
        {
LABEL_7:
          v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v15, *MEMORY[0x24BDD0FC8]);
LABEL_14:
          v21 = objc_alloc(MEMORY[0x24BDD1540]);
          v22 = *MEMORY[0x24BDDD1C8];
          v23 = 1;
LABEL_15:
          *a7 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, v23, v16);
          goto LABEL_16;
        }
LABEL_13:
        v16 = 0;
        goto LABEL_14;
      }
    }
LABEL_16:

    return 0;
  }
  if (!a7)
    return 0;
  v17 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Internal error"), *MEMORY[0x24BDD0FC8]);
  v18 = objc_alloc(MEMORY[0x24BDD1540]);
  v19 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", *MEMORY[0x24BDDD1C8], 2, v17);
  v13 = 0;
  *a7 = v19;
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AGXMTLCounterSampleBuffer;
  -[AGXMTLCounterSampleBuffer dealloc](&v3, sel_dealloc);
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_device;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (unint64_t)sampleSize
{
  return 8;
}

- (IOGPUMetalBuffer)buffer
{
  return &self->_buffer->super;
}

- (id)resolveCounterRange:(_NSRange)a3
{
  NSUInteger location;
  void *v5;
  size_t v6;
  void *v7;

  if (!a3.length)
    return 0;
  location = a3.location;
  if (a3.location + a3.length > self->_sampleCount)
    return 0;
  v6 = 8 * a3.length;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 8 * a3.length);
  v5 = v7;
  if (v7)
    memcpy((void *)objc_msgSend(v7, "mutableBytes"), -[IOGPUMetalBuffer contents](self->_buffer, "contents") + 8 * location, v6);
  return v5;
}

@end
