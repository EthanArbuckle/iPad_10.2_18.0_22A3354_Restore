@implementation MTLStencilDescriptorInternal

- (unsigned)writeMask
{
  return self->_private.writeMask;
}

- (unsigned)readMask
{
  return self->_private.readMask;
}

- (unint64_t)hash
{
  return (self->_private.stencilCompareFunction | (8 * self->_private.stencilFailureOperation) | (self->_private.depthFailureOperation << 6) | (self->_private.depthStencilPassOperation << 9)) ^ self->_private.writeMask ^ self->_private.readMask;
}

- (void)setStencilCompareFunction:(unint64_t)a3
{
  self->_private.stencilCompareFunction = a3;
}

- (void)setStencilFailureOperation:(unint64_t)a3
{
  self->_private.stencilFailureOperation = a3;
}

- (void)setDepthStencilPassOperation:(unint64_t)a3
{
  self->_private.depthStencilPassOperation = a3;
}

- (unint64_t)stencilFailureOperation
{
  return self->_private.stencilFailureOperation;
}

- (unint64_t)stencilCompareFunction
{
  return self->_private.stencilCompareFunction;
}

- (unint64_t)depthStencilPassOperation
{
  return self->_private.depthStencilPassOperation;
}

- (unint64_t)depthFailureOperation
{
  return self->_private.depthFailureOperation;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  return Class == object_getClass(a3)
      && self->_private.stencilCompareFunction == *((_QWORD *)a3 + 1)
      && self->_private.stencilFailureOperation == *((_QWORD *)a3 + 2)
      && self->_private.depthFailureOperation == *((_QWORD *)a3 + 3)
      && self->_private.depthStencilPassOperation == *((_QWORD *)a3 + 4)
      && self->_private.readMask == *((_DWORD *)a3 + 10)
      && self->_private.writeMask == *((_DWORD *)a3 + 11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  uint64_t v5;
  __int128 v6;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    v5 = *(_QWORD *)&self->_private.readMask;
    v6 = *(_OWORD *)&self->_private.depthFailureOperation;
    *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_private.stencilCompareFunction;
    *(_OWORD *)((char *)result + 24) = v6;
    *((_QWORD *)result + 5) = v5;
  }
  return result;
}

- (MTLStencilDescriptorInternal)init
{
  MTLStencilDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLStencilDescriptorInternal;
  result = -[MTLStencilDescriptorInternal init](&v3, sel_init);
  if (result)
  {
    result->_private.stencilCompareFunction = 7;
    result->_private.stencilFailureOperation = 0;
    result->_private.depthFailureOperation = 0;
    result->_private.depthStencilPassOperation = 0;
    *(_QWORD *)&result->_private.readMask = -1;
  }
  return result;
}

- (void)setWriteMask:(unsigned int)a3
{
  self->_private.writeMask = a3;
}

- (void)setReadMask:(unsigned int)a3
{
  self->_private.readMask = a3;
}

- (void)setDepthFailureOperation:(unint64_t)a3
{
  self->_private.depthFailureOperation = a3;
}

- (const)stencilPrivate
{
  return &self->_private;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t stencilCompareFunction;
  const __CFString *v8;
  unint64_t stencilFailureOperation;
  const __CFString *v10;
  unint64_t depthFailureOperation;
  const __CFString *v12;
  unint64_t depthStencilPassOperation;
  const __CFString *v14;
  objc_super v16;
  _QWORD v17[19];

  v17[18] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)MTLStencilDescriptorInternal;
  v6 = -[MTLStencilDescriptorInternal description](&v16, sel_description);
  v17[0] = v4;
  v17[1] = CFSTR("stencilCompareFunction        =");
  stencilCompareFunction = self->_private.stencilCompareFunction;
  if (stencilCompareFunction > 7)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E0FE53A0[stencilCompareFunction];
  v17[2] = v8;
  v17[3] = v4;
  v17[4] = CFSTR("stencilFailureOperation       =");
  stencilFailureOperation = self->_private.stencilFailureOperation;
  if (stencilFailureOperation > 7)
    v10 = CFSTR("Unknown");
  else
    v10 = off_1E0FE5360[stencilFailureOperation];
  v17[5] = v10;
  v17[6] = v4;
  v17[7] = CFSTR("stencilPassDepthFailOperation =");
  depthFailureOperation = self->_private.depthFailureOperation;
  if (depthFailureOperation > 7)
    v12 = CFSTR("Unknown");
  else
    v12 = off_1E0FE5360[depthFailureOperation];
  v17[8] = v12;
  v17[9] = v4;
  v17[10] = CFSTR("stencilPassDepthPassOperation =");
  depthStencilPassOperation = self->_private.depthStencilPassOperation;
  if (depthStencilPassOperation > 7)
    v14 = CFSTR("Unknown");
  else
    v14 = off_1E0FE5360[depthStencilPassOperation];
  v17[11] = v14;
  v17[12] = v4;
  v17[13] = CFSTR("stencilReadMask               =");
  v17[14] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), self->_private.readMask);
  v17[15] = v4;
  v17[16] = CFSTR("stencilWriteMask              =");
  v17[17] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), self->_private.writeMask);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 18), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLStencilDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

@end
