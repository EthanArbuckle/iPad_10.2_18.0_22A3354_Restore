@implementation _IOSurfaceDebugDescription

- (_IOSurfaceDebugDescription)initWithBasicInfo:(id *)a3 layoutInfo:(id *)a4 name:(id)a5
{
  char *v8;
  _IOSurfaceDebugDescription *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)_IOSurfaceDebugDescription;
  v8 = -[_IOSurfaceDebugDescription init](&v19, sel_init);
  v9 = (_IOSurfaceDebugDescription *)v8;
  if (v8)
  {
    v10 = *(_OWORD *)&a3->var10;
    v12 = *(_OWORD *)&a3->var0;
    v11 = *(_OWORD *)&a3->var3;
    *(_OWORD *)(v8 + 40) = *(_OWORD *)&a3->var7;
    *(_OWORD *)(v8 + 56) = v10;
    *(_OWORD *)(v8 + 8) = v12;
    *(_OWORD *)(v8 + 24) = v11;
    v14 = *(_OWORD *)&a3->var18;
    v13 = *(_OWORD *)&a3->var20;
    v15 = *(_OWORD *)&a3->var16;
    *((_QWORD *)v8 + 15) = a3->var22;
    *(_OWORD *)(v8 + 88) = v14;
    *(_OWORD *)(v8 + 104) = v13;
    *(_OWORD *)(v8 + 72) = v15;
    v16 = *(_OWORD *)&a4->var4;
    v17 = *(_OWORD *)&a4->var0;
    *((_OWORD *)v8 + 9) = *(_OWORD *)&a4->var2;
    *((_OWORD *)v8 + 10) = v16;
    *((_OWORD *)v8 + 8) = v17;
    *((_QWORD *)v8 + 22) = objc_msgSend(a5, "copy");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_IOSurfaceDebugDescription;
  -[_IOSurfaceDebugDescription dealloc](&v3, sel_dealloc);
}

- (id)description
{
  $CB97257098F6193375D2988ECE165347 *p_basicInfo;
  unint64_t pixelFormat;
  unint64_t v5;
  void *v6;
  unint64_t traceID;
  unint64_t clientAddress;
  unint64_t width;
  unint64_t height;
  uint64_t surfaceID;
  uint64_t v12;
  const __CFString *name;
  char __str[5];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_basicInfo = &self->_basicInfo;
  pixelFormat = self->_basicInfo.pixelFormat;
  v5 = pixelFormat >> 24;
  if ((pixelFormat & 0x80000000) != 0)
  {
    if (__maskrune(v5, 0x800uLL))
      goto LABEL_3;
  }
  else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v5 + 60) & 0x800) != 0)
  {
LABEL_3:
    __str[0] = BYTE3(pixelFormat);
    __str[1] = BYTE2(pixelFormat);
    __str[2] = BYTE1(pixelFormat);
    __str[3] = pixelFormat;
    __str[4] = 0;
    goto LABEL_6;
  }
  snprintf(__str, 5uLL, "%4d", pixelFormat);
LABEL_6:
  v6 = (void *)MEMORY[0x1E0CB3940];
  traceID = p_basicInfo->traceID;
  clientAddress = p_basicInfo->clientAddress;
  width = self->_layoutInfo.width;
  height = self->_layoutInfo.height;
  surfaceID = p_basicInfo->surfaceID;
  v12 = objc_msgSend((id)NSLocalizedFileSizeDescription(), "UTF8String");
  name = (const __CFString *)self->_name;
  if (!name)
    name = &stru_1E4DE9730;
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("sid: %08x traceID: %016llx virt: %016llx fmt: %s dims: %5d x %5d size: %7s name: %@"), surfaceID, traceID, clientAddress, __str, width, height, v12, name);
}

- (unint64_t)virtualAddress
{
  return self->_basicInfo.clientAddress;
}

- (unint64_t)allocationSize
{
  return self->_basicInfo.allocSize;
}

- (unint64_t)dirtySize
{
  return self->_basicInfo.dirtySize;
}

- (unint64_t)residentSize
{
  return self->_basicInfo.residentSize;
}

- (unsigned)surfaceID
{
  return self->_basicInfo.surfaceID;
}

- (unsigned)pixelFormat
{
  return self->_basicInfo.pixelFormat;
}

- (NSString)pixelFormatString
{
  unint64_t pixelFormat;
  unint64_t v3;
  char __str[5];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  pixelFormat = self->_basicInfo.pixelFormat;
  v3 = pixelFormat >> 24;
  if ((pixelFormat & 0x80000000) != 0)
  {
    if (__maskrune(v3, 0x800uLL))
      goto LABEL_3;
LABEL_5:
    snprintf(__str, 5uLL, "%4d", pixelFormat);
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", __str, 1);
  }
  if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v3 + 60) & 0x800) == 0)
    goto LABEL_5;
LABEL_3:
  __str[0] = BYTE3(pixelFormat);
  __str[1] = BYTE2(pixelFormat);
  __str[2] = BYTE1(pixelFormat);
  __str[3] = pixelFormat;
  __str[4] = 0;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", __str, 1);
}

- (unint64_t)width
{
  return self->_layoutInfo.width;
}

- (unint64_t)height
{
  return self->_layoutInfo.height;
}

- (unint64_t)traceID
{
  return self->_basicInfo.traceID;
}

- (NSString)name
{
  return self->_name;
}

@end
