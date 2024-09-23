@implementation MTLDepthStencilDescriptorInternal

- (BOOL)isDepthWriteEnabled
{
  return self->_private.depthWriteEnabled;
}

- (void)setDepthCompareFunction:(unint64_t)a3
{
  self->_private.depthCompareFunction = a3;
}

- (void)setDepthWriteEnabled:(BOOL)a3
{
  self->_private.depthWriteEnabled = a3;
}

- (unint64_t)hash
{
  MTLDepthStencilDescriptorPrivate *p_private;
  unint64_t v3;
  unint64_t v4;
  _QWORD v6[4];

  p_private = &self->_private;
  v3 = -[MTLStencilDescriptorInternal hash](self->_private.backFaceStencil, "hash", -[MTLStencilDescriptorInternal hash](self->_private.frontFaceStencil, "hash"));
  v4 = p_private->depthWriteEnabled | (2 * p_private->depthCompareFunction);
  v6[1] = v3;
  v6[2] = v4;
  v6[3] = -[NSString hash](p_private->label, "hash");
  return _MTLHashState((int *)v6, 0x20uLL);
}

- (void)setBackFaceStencil:(id)a3
{
  MTLDepthStencilDescriptorPrivate *p_private;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  p_private = &self->_private;
  if (self->_private.backFaceStencil != a3)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        MTLReportFailure(1uLL, "-[MTLDepthStencilDescriptorInternal setBackFaceStencil:]", 441, (uint64_t)CFSTR("backFaceStencil is not a MTLStencilDescriptor."), v5, v6, v7, v8, v10);
    }
    v9 = objc_msgSend(a3, "copy");

    p_private->backFaceStencil = (MTLStencilDescriptorInternal *)v9;
  }
}

- (void)setFrontFaceStencil:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLStencilDescriptorInternal *v9;
  uint64_t v10;

  if (self->_private.frontFaceStencil != a3)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        MTLReportFailure(1uLL, "-[MTLDepthStencilDescriptorInternal setFrontFaceStencil:]", 422, (uint64_t)CFSTR("frontFaceStencil is not a MTLStencilDescriptor."), v5, v6, v7, v8, v10);
    }
    v9 = (MTLStencilDescriptorInternal *)objc_msgSend(a3, "copy");

    self->_private.frontFaceStencil = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLStencilDescriptorInternal *backFaceStencil;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    if (self->_private.frontFaceStencil)
      *(_QWORD *)(v5 + 8) = -[MTLStencilDescriptorInternal copyWithZone:](self->_private.frontFaceStencil, "copyWithZone:", a3);
    backFaceStencil = self->_private.backFaceStencil;
    if (backFaceStencil)
      *(_QWORD *)(v6 + 16) = -[MTLStencilDescriptorInternal copyWithZone:](backFaceStencil, "copyWithZone:", a3);
    *(_QWORD *)(v6 + 24) = self->_private.depthCompareFunction;
    *(_BYTE *)(v6 + 32) = self->_private.depthWriteEnabled;
    *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_private.label, "copyWithZone:", a3);
  }
  return (id)v6;
}

- (MTLDepthStencilDescriptorInternal)init
{
  MTLDepthStencilDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDepthStencilDescriptorInternal;
  result = -[MTLDepthStencilDescriptorInternal init](&v3, sel_init);
  if (result)
  {
    result->_private.depthCompareFunction = 7;
    result->_private.depthWriteEnabled = 0;
    result->_private.label = 0;
  }
  return result;
}

- (id)backFaceStencil
{
  MTLDepthStencilDescriptorPrivate *p_private;
  id result;

  p_private = &self->_private;
  result = self->_private.backFaceStencil;
  if (!result)
  {
    result = objc_alloc_init(MTLStencilDescriptorInternal);
    p_private->backFaceStencil = (MTLStencilDescriptorInternal *)result;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *Class;
  NSString *label;
  BOOL result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a3 == self)
    return 1;
  v16 = v8;
  v17 = v7;
  v18 = v6;
  v19 = v5;
  v20 = v4;
  v21 = v3;
  Class = object_getClass(self);
  result = 0;
  if (Class == object_getClass(a3)
    && (!self->_private.frontFaceStencil && !*((_QWORD *)a3 + 1)
     || objc_msgSend(-[MTLDepthStencilDescriptorInternal frontFaceStencil](self, "frontFaceStencil", v8, v7, v6, v19, v20, v21, v9, v10), "isEqual:", objc_msgSend(a3, "frontFaceStencil")))&& (!self->_private.backFaceStencil && !*((_QWORD *)a3 + 2)|| objc_msgSend(-[MTLDepthStencilDescriptorInternal backFaceStencil](self, "backFaceStencil", v16,
                          v17,
                          v18,
                          v19,
                          v20,
                          v21),
                        "isEqual:",
                        objc_msgSend(a3, "backFaceStencil")))
    && self->_private.depthCompareFunction == *((_QWORD *)a3 + 3)
    && self->_private.depthWriteEnabled == *((unsigned __int8 *)a3 + 32))
  {
    label = self->_private.label;
    if (label == *((NSString **)a3 + 5) || (-[NSString isEqual:](label, "isEqual:") & 1) != 0)
      return 1;
  }
  return result;
}

- (id)frontFaceStencil
{
  id result;

  result = self->_private.frontFaceStencil;
  if (!result)
  {
    result = objc_alloc_init(MTLStencilDescriptorInternal);
    self->_private.frontFaceStencil = (MTLStencilDescriptorInternal *)result;
  }
  return result;
}

- (unint64_t)depthCompareFunction
{
  return self->_private.depthCompareFunction;
}

- (id)label
{
  return self->_private.label;
}

- (void)dealloc
{
  MTLDepthStencilDescriptorPrivate *p_private;
  objc_super v4;

  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLDepthStencilDescriptorInternal;
  -[MTLDepthStencilDescriptorInternal dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MTLDepthStencilDescriptorPrivate *p_private;
  NSString *label;
  const __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v11 = CFSTR("label is not a NSString.");
    v12 = 1;
    v13 = 454;
  }
  else
  {
    v11 = CFSTR("label must not be nil.");
    v12 = 0;
    v13 = 451;
  }
  MTLReportFailure(v12, "-[MTLDepthStencilDescriptorInternal setLabel:]", v13, (uint64_t)v11, v3, v4, v5, v6, v14);
LABEL_3:
  p_private = &self->_private;
  label = p_private->label;
  if (label != a3)
  {

    p_private->label = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (const)depthStencilPrivate
{
  return &self->_private;
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  MTLDepthStencilDescriptorPrivate *p_private;
  const __CFString *label;
  unint64_t depthCompareFunction;
  const __CFString *v13;
  uint64_t v14;
  MTLStencilDescriptorInternal *backFaceStencil;
  objc_super v17;
  _QWORD v18[15];
  _QWORD v19[13];

  v19[12] = *MEMORY[0x1E0C80C00];
  v5 = a3 + 4;
  v6 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v19[0] = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 8, CFSTR(" "), 0);
  v19[1] = CFSTR("stencilCompareFunction        = MTLCompareFunctionAlways");
  v19[2] = v19[0];
  v19[3] = CFSTR("stencilFailOperation          = MTLStencilOperationKeep");
  v19[4] = v19[0];
  v19[5] = CFSTR("stencilPassDepthFailOperation = MTLStencilOperationKeep");
  v19[6] = v19[0];
  v19[7] = CFSTR("stencilPassDepthPassOperation = MTLStencilOperationKeep");
  v19[8] = v19[0];
  v19[9] = CFSTR("stencilReadMask               = 0xffffffff");
  v19[10] = v19[0];
  v19[11] = CFSTR("stencilWriteMask              = 0xffffffff");
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 12), "componentsJoinedByString:", CFSTR(" "));
  v8 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)MTLDepthStencilDescriptorInternal;
  v9 = -[MTLDepthStencilDescriptorInternal description](&v17, sel_description);
  v18[0] = v6;
  v18[1] = CFSTR("label =");
  p_private = &self->_private;
  label = (const __CFString *)p_private->label;
  if (!label)
    label = CFSTR("<none>");
  v18[2] = label;
  v18[3] = v6;
  v18[4] = CFSTR("depthCompareFunction =");
  depthCompareFunction = p_private->depthCompareFunction;
  if (depthCompareFunction > 7)
    v13 = CFSTR("Unknown");
  else
    v13 = off_1E0FE53A0[depthCompareFunction];
  v18[5] = v13;
  v18[6] = v6;
  v18[7] = CFSTR("depthWriteEnabled =");
  v18[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_private->depthWriteEnabled);
  v18[9] = v6;
  v18[10] = CFSTR("frontFace:");
  v14 = v7;
  if (p_private->frontFaceStencil)
    v14 = -[MTLStencilDescriptorInternal formattedDescription:](p_private->frontFaceStencil, "formattedDescription:", v5);
  v18[11] = v14;
  v18[12] = v6;
  v18[13] = CFSTR("backFace:");
  backFaceStencil = p_private->backFaceStencil;
  if (backFaceStencil)
    v7 = -[MTLStencilDescriptorInternal formattedDescription:](backFaceStencil, "formattedDescription:", v5);
  v18[14] = v7;
  return (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 15), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLDepthStencilDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

@end
