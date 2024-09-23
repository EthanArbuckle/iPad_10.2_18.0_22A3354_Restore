@implementation MTLGPUDebugBufferErrorLog

- (MTLGPUDebugBufferErrorLog)init
{
  MTLGPUDebugBufferErrorLog *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugBufferErrorLog;
  result = -[MTLGPUDebugBufferErrorLog init](&v3, sel_init);
  result->_specifiedUsage = 128;
  return result;
}

- (id)description
{
  const __CFString *v3;
  MTLBuffer *buffer;
  uint64_t v5;
  MTLBuffer *v6;
  int specifiedUsage;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  int addressSpace;
  uint64_t v12;
  unint64_t offset;
  NSString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v19;

  if (self->_addressSpace == 3)
  {
    v3 = 0;
  }
  else
  {
    buffer = self->_buffer;
    if (buffer && (v5 = -[MTLBuffer label](buffer, "label"), buffer = self->_buffer, v5))
    {
      v3 = (const __CFString *)-[MTLBuffer label](buffer, "label");
    }
    else if (buffer)
    {
      v3 = CFSTR("<unnamed>");
    }
    else
    {
      v3 = CFSTR("<nil>");
    }
  }
  v6 = self->_buffer;
  if (v6)
  {
    specifiedUsage = self->_specifiedUsage;
    switch(specifiedUsage)
    {
      case 0:
        v8 = CFSTR("No");
        goto LABEL_18;
      case 1:
        v8 = CFSTR("Read Only");
        goto LABEL_18;
      case 2:
        v8 = CFSTR("Write Only");
        goto LABEL_18;
      case 3:
        v8 = CFSTR("Read Write");
        goto LABEL_18;
      default:
        if (specifiedUsage == 128)
        {
          v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, length:%llu"), v3, -[MTLBuffer length](v6, "length"), v19);
        }
        else
        {
          v8 = CFSTR("Unknown");
LABEL_18:
          v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, length:%llu, resident:%@"), v3, -[MTLBuffer length](v6, "length"), v8);
        }
        v3 = (const __CFString *)v9;
        break;
    }
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  addressSpace = self->_addressSpace;
  v12 = MTLGPUOperationString();
  offset = self->_offset;
  v14 = -[MTLGPUDebugGPULog functionDescription](self, "functionDescription");
  v15 = (const __CFString *)-[MTLArgument formattedDescription:](self->_argument, "formattedDescription:", 4);
  if (v3)
    v16 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("buffer: %@"), v3);
  else
    v16 = &stru_24F795D30;
  if (!v15)
    v15 = &stru_24F795D30;
  if (addressSpace == 1)
    v17 = CFSTR("device");
  else
    v17 = CFSTR("threadgroup");
  return (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid %@ %@ at offset %llu, executing %@ %@\n%@\n%@\n"), v17, v12, offset, v14, v15, v16, -[MTLGPUDebugGPULog locationDescription](self, "locationDescription"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugBufferErrorLog;
  -[MTLGPUDebugGPULog dealloc](&v3, sel_dealloc);
}

- (int)addressSpace
{
  return self->_addressSpace;
}

- (void)setAddressSpace:(int)a3
{
  self->_addressSpace = a3;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_operation = a3;
}

- (MTLArgument)argument
{
  return self->_argument;
}

- (void)setArgument:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (int)specifiedUsage
{
  return self->_specifiedUsage;
}

- (void)setSpecifiedUsage:(int)a3
{
  self->_specifiedUsage = a3;
}

@end
