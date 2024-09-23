@implementation _MTLSamplerState

- (_MTLSamplerState)initWithDevice:(id)a3 samplerDescriptor:(id)a4
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
  unint64_t v32;
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
  _MTLSamplerState *v54;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  objc_super v60;
  _OWORD v61[3];
  uint64_t v62;

  v62 = 0;
  memset(v61, 0, sizeof(v61));
  _MTLMessageContextBegin_((uint64_t)v61, (uint64_t)"-[_MTLSamplerState initWithDevice:samplerDescriptor:]", 752, (uint64_t)a3, 12, (uint64_t)"New Sampler State Validation");
  if (!a3)
  {
    v56 = CFSTR("device must not be nil.");
    v57 = 4;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v56 = CFSTR("device is not a MTLDevice.");
    v57 = 8;
LABEL_24:
    _MTLMessageContextPush_((uint64_t)v61, v57, (uint64_t)v56, v7, v8, v9, v10, v11, (uint64_t)v60.receiver);
    if (a4)
      goto LABEL_4;
LABEL_25:
    v58 = CFSTR("desc must not be nil.");
    v59 = 4;
    goto LABEL_27;
  }
  if (!a4)
    goto LABEL_25;
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_5;
  v58 = CFSTR("desc is not a MTLSamplerDescriptor.");
  v59 = 8;
LABEL_27:
  _MTLMessageContextPush_((uint64_t)v61, v59, (uint64_t)v58, v7, v8, v9, v10, v11, (uint64_t)v60.receiver);
LABEL_5:
  if (objc_msgSend(a4, "minFilter") >= 3)
    _MTLMessageContextPush_((uint64_t)v61, 4, (uint64_t)CFSTR("filter is not a valid MTLSamplerMinMagFilter."), v12, v13, v14, v15, v16, (uint64_t)v60.receiver);
  if (objc_msgSend(a4, "magFilter") >= 3)
    _MTLMessageContextPush_((uint64_t)v61, 4, (uint64_t)CFSTR("filter is not a valid MTLSamplerMinMagFilter."), v17, v18, v19, v20, v21, (uint64_t)v60.receiver);
  if ((unint64_t)objc_msgSend(a4, "mipFilter") >= 3)
    _MTLMessageContextPush_((uint64_t)v61, 4, (uint64_t)CFSTR("mipFilter is not a valid MTLSamplerMipFilter."), v22, v23, v24, v25, v26, (uint64_t)v60.receiver);
  if ((unint64_t)objc_msgSend(a4, "borderColor") >= 4)
    _MTLMessageContextPush_((uint64_t)v61, 4, (uint64_t)CFSTR("borderColor is not a valid MTLSamplerBorderColorSPI."), v27, v28, v29, v30, v31, (uint64_t)v60.receiver);
  v32 = objc_msgSend(a4, "compareFunction");
  validateMTLCompareFunction(v32, (uint64_t)v61, v33, v34, v35, v36, v37, v38, (uint64_t)v60.receiver);
  if ((unint64_t)objc_msgSend(a4, "sAddressMode") >= 7)
    _MTLMessageContextPush_((uint64_t)v61, 4, (uint64_t)CFSTR("addressMode is not a valid MTLSamplerAddressMode."), v39, v40, v41, v42, v43, (uint64_t)v60.receiver);
  if ((unint64_t)objc_msgSend(a4, "tAddressMode") >= 7)
    _MTLMessageContextPush_((uint64_t)v61, 4, (uint64_t)CFSTR("addressMode is not a valid MTLSamplerAddressMode."), v44, v45, v46, v47, v48, (uint64_t)v60.receiver);
  if ((unint64_t)objc_msgSend(a4, "rAddressMode") >= 7)
    _MTLMessageContextPush_((uint64_t)v61, 4, (uint64_t)CFSTR("addressMode is not a valid MTLSamplerAddressMode."), v49, v50, v51, v52, v53, (uint64_t)v60.receiver);
  _MTLMessageContextEnd((uint64_t)v61);
  v60.receiver = self;
  v60.super_class = (Class)_MTLSamplerState;
  v54 = -[_MTLSamplerState init](&v60, sel_init);
  if (v54)
  {
    v54->_device = (MTLDevice *)a3;
    v54->_label = (NSString *)(id)objc_msgSend(a4, "label");
    v54->_pixelFormat = objc_msgSend(a4, "pixelFormat");
  }
  return v54;
}

- (void)dealloc
{
  objc_super v3;

  self->_label = 0;
  v3.receiver = self;
  v3.super_class = (Class)_MTLSamplerState;
  -[_MTLSamplerState dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  const __CFString *label;
  MTLDevice *device;
  const __CFString *v10;
  objc_super v12;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)_MTLSamplerState;
  v7 = -[_MTLSamplerState description](&v12, sel_description);
  v13[0] = v5;
  v13[1] = CFSTR("label =");
  label = CFSTR("<none>");
  device = self->_device;
  if (self->_label)
    label = (const __CFString *)self->_label;
  v13[2] = label;
  v13[3] = v5;
  v13[4] = CFSTR("device =");
  if (device)
    v10 = (const __CFString *)-[MTLDevice formattedDescription:](device, "formattedDescription:", v4);
  else
    v10 = CFSTR("<null>");
  v13[5] = v10;
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 6), "componentsJoinedByString:", CFSTR(" ")));
}

- (NSString)description
{
  return (NSString *)-[_MTLSamplerState formattedDescription:](self, "formattedDescription:", 0);
}

- (MTLDevice)device
{
  return self->_device;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (unint64_t)gpuAddress
{
  return self->_gpuAddress;
}

@end
