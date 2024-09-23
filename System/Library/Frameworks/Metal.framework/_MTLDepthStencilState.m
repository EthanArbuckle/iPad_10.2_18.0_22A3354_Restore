@implementation _MTLDepthStencilState

- (_MTLDepthStencilState)initWithDevice:(id)a3 depthStencilDescriptor:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _MTLDepthStencilState *v57;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  objc_super v63;
  _OWORD v64[3];
  uint64_t v65;

  v65 = 0;
  memset(v64, 0, sizeof(v64));
  _MTLMessageContextBegin_((uint64_t)v64, (uint64_t)"-[_MTLDepthStencilState initWithDevice:depthStencilDescriptor:]", 479, (uint64_t)a3, 10, (uint64_t)"Creation Depth Stencil State");
  if (!a3)
  {
    v59 = CFSTR("device must not be nil.");
    v60 = 4;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v59 = CFSTR("device is not a MTLDevice.");
    v60 = 8;
LABEL_28:
    _MTLMessageContextPush_((uint64_t)v64, v60, (uint64_t)v59, v7, v8, v9, v10, v11, (uint64_t)v63.receiver);
    if (a4)
      goto LABEL_4;
LABEL_29:
    v61 = CFSTR("desc must not be nil.");
    v62 = 4;
    goto LABEL_31;
  }
  if (!a4)
    goto LABEL_29;
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_5;
  v61 = CFSTR("desc is not a MTLDepthStencilDescriptor.");
  v62 = 8;
LABEL_31:
  _MTLMessageContextPush_((uint64_t)v64, v62, (uint64_t)v61, v7, v8, v9, v10, v11, (uint64_t)v63.receiver);
LABEL_5:
  if ((unint64_t)objc_msgSend(a4, "depthCompareFunction") >= 8)
    _MTLMessageContextPush_((uint64_t)v64, 4, (uint64_t)CFSTR("function is not a valid MTLCompareFunction."), v12, v13, v14, v15, v16, (uint64_t)v63.receiver);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "backFaceStencil"), "stencilCompareFunction") >= 8)
    _MTLMessageContextPush_((uint64_t)v64, 4, (uint64_t)CFSTR("function is not a valid MTLCompareFunction."), v17, v18, v19, v20, v21, (uint64_t)v63.receiver);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "backFaceStencil"), "stencilFailureOperation") >= 8)
    _MTLMessageContextPush_((uint64_t)v64, 4, (uint64_t)CFSTR("operation is not a valid MTLStencilOperation."), v22, v23, v24, v25, v26, (uint64_t)v63.receiver);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "backFaceStencil"), "depthFailureOperation") >= 8)
    _MTLMessageContextPush_((uint64_t)v64, 4, (uint64_t)CFSTR("operation is not a valid MTLStencilOperation."), v27, v28, v29, v30, v31, (uint64_t)v63.receiver);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "backFaceStencil"), "depthStencilPassOperation") >= 8)
    _MTLMessageContextPush_((uint64_t)v64, 4, (uint64_t)CFSTR("operation is not a valid MTLStencilOperation."), v32, v33, v34, v35, v36, (uint64_t)v63.receiver);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "frontFaceStencil"), "stencilCompareFunction") >= 8)
    _MTLMessageContextPush_((uint64_t)v64, 4, (uint64_t)CFSTR("function is not a valid MTLCompareFunction."), v37, v38, v39, v40, v41, (uint64_t)v63.receiver);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "frontFaceStencil"), "stencilFailureOperation") >= 8)
    _MTLMessageContextPush_((uint64_t)v64, 4, (uint64_t)CFSTR("operation is not a valid MTLStencilOperation."), v42, v43, v44, v45, v46, (uint64_t)v63.receiver);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "frontFaceStencil"), "depthFailureOperation") >= 8)
    _MTLMessageContextPush_((uint64_t)v64, 4, (uint64_t)CFSTR("operation is not a valid MTLStencilOperation."), v47, v48, v49, v50, v51, (uint64_t)v63.receiver);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "frontFaceStencil"), "depthStencilPassOperation") >= 8)
    _MTLMessageContextPush_((uint64_t)v64, 4, (uint64_t)CFSTR("operation is not a valid MTLStencilOperation."), v52, v53, v54, v55, v56, (uint64_t)v63.receiver);
  _MTLMessageContextEnd((uint64_t)v64);
  v63.receiver = self;
  v63.super_class = (Class)_MTLDepthStencilState;
  v57 = -[_MTLDepthStencilState init](&v63, sel_init);
  if (v57)
  {
    v57->_device = (MTLDevice *)a3;
    v57->_label = (NSString *)objc_msgSend((id)objc_msgSend(a4, "label"), "copy");
  }
  return v57;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLDepthStencilState;
  -[_MTLDepthStencilState dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  const __CFString *label;
  MTLDevice *device;
  uint64_t v10;
  const __CFString *v11;
  objc_super v13;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)_MTLDepthStencilState;
  v7 = -[_MTLDepthStencilState description](&v13, sel_description);
  v14[0] = v5;
  v14[1] = CFSTR("label =");
  label = CFSTR("<none>");
  device = self->_device;
  if (self->_label)
    label = (const __CFString *)self->_label;
  v14[2] = label;
  v14[3] = v5;
  v14[4] = CFSTR("device =");
  v10 = -[MTLDevice formattedDescription:](device, "formattedDescription:", v4);
  v11 = CFSTR("<null>");
  if (v10)
    v11 = (const __CFString *)v10;
  v14[5] = v11;
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 6), "componentsJoinedByString:", CFSTR(" ")));
}

- (NSString)description
{
  return (NSString *)-[_MTLDepthStencilState formattedDescription:](self, "formattedDescription:", 0);
}

- (BOOL)readsDepth
{
  return 1;
}

- (BOOL)writesDepth
{
  return 1;
}

- (BOOL)readsStencil
{
  return 1;
}

- (BOOL)writesStencil
{
  return 1;
}

- (MTLDevice)device
{
  return self->_device;
}

- (NSString)label
{
  return self->_label;
}

@end
