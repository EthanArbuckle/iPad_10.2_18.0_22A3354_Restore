@implementation CUIPSDImageRef

+ (BOOL)isValidPSDResourceAtPath:(id)a3
{
  int FileOptionalLogging;
  BOOL v5;
  _BYTE v7[400];

  CPSDFile::CPSDFile((CPSDFile *)v7);
  FileOptionalLogging = CreateFileOptionalLogging((char *)objc_msgSend(a3, "fileSystemRepresentation"), 0, 0);
  if (FileOptionalLogging == -1)
  {
    v5 = 0;
  }
  else
  {
    v5 = CPSDFile::ValidateFormat((CPSDFile *)v7, FileOptionalLogging) != 0;
    CloseHandle(FileOptionalLogging);
  }
  CPSDFile::~CPSDFile((CPSDFile *)v7);
  return v5;
}

+ (BOOL)isValidPSDResourceAtPath:(id)a3 withLayerCount:(unsigned int *)a4
{
  uint64_t FileOptionalLogging;
  BOOL v7;
  _BYTE v9[268];
  unsigned __int16 v10;

  CPSDFile::CPSDFile((CPSDFile *)v9);
  FileOptionalLogging = CreateFileOptionalLogging((char *)objc_msgSend(a3, "fileSystemRepresentation"), 0, 0);
  if ((_DWORD)FileOptionalLogging == -1)
  {
    v7 = 0;
  }
  else
  {
    if (CPSDFile::LoadLayers((CPSDFile *)v9, FileOptionalLogging))
    {
      *a4 = v10;
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    CloseHandle(FileOptionalLogging);
  }
  CPSDFile::~CPSDFile((CPSDFile *)v9);
  return v7;
}

+ (BOOL)isValidPSDResourceAtPath:(id)a3 withLayerCount:(unsigned int *)a4 validateLayers:(BOOL)a5
{
  return 0;
}

+ (BOOL)isValidPSDResourceAtPath:(id)a3 withImageInfo:(_PSDImageInfo *)a4
{
  int FileOptionalLogging;
  _BOOL4 v7;
  BOOL v8;
  _BYTE v10[400];

  CPSDFile::CPSDFile((CPSDFile *)v10);
  FileOptionalLogging = CreateFileOptionalLogging((char *)objc_msgSend(a3, "fileSystemRepresentation"), 0, 0);
  if (FileOptionalLogging == -1
    || (v7 = CPSDFile::GetImageInfo((CPSDFile *)v10, FileOptionalLogging, &a4->var1, &a4->var0, &a4->var3, &a4->var2, &a4->var4) != 0, CloseHandle(FileOptionalLogging), !v7))
  {
    v8 = 0;
  }
  else
  {
    a4->var5 = CPSDFile::ValidateIsDrawable((CPSDFile *)v10);
    v8 = 1;
  }
  CPSDFile::~CPSDFile((CPSDFile *)v10);
  return v8;
}

- (BOOL)openImageFile
{
  NSString *path;

  path = self->_path;
  if (path)
  {
    if (self->_file != -1)
    {
      CloseHandle(self->_file);
      path = self->_path;
    }
    LODWORD(path) = CreateFile((char *)-[NSString fileSystemRepresentation](path, "fileSystemRepresentation"), 0);
    self->_file = (int)path;
    LOBYTE(path) = (_DWORD)path != -1;
  }
  return (char)path;
}

- (BOOL)loadPSDFileWithLayers:(BOOL)a3
{
  _BOOL4 v3;
  void *psd;
  CPSDFile *v6;
  CPSDFile *v7;
  uint64_t file;
  int Layers;

  if (self->_file == -1)
    return 0;
  v3 = a3;
  psd = self->_psd;
  if (psd)
    (*(void (**)(void *, SEL))(*(_QWORD *)psd + 8))(psd, a2);
  v6 = (CPSDFile *)operator new(400, 0x10B1C407992E97CLL);
  CPSDFile::CPSDFile(v6);
  self->_psd = v6;
  SetFilePointer(self->_file, 0, 0, 0);
  v7 = (CPSDFile *)self->_psd;
  file = self->_file;
  if (v3)
    Layers = CPSDFile::LoadLayers(v7, file);
  else
    Layers = (*(uint64_t (**)(CPSDFile *, uint64_t))(*(_QWORD *)v7 + 16))(v7, file);
  return Layers != 0;
}

- (CUIPSDImageRef)initWithPath:(id)a3
{
  CUIPSDImageRef *v4;
  NSString *v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CUIPSDImageRef *v13;
  int v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CUIPSDImageRef;
  v4 = -[CUIPSDImageRef init](&v16, sel_init);
  v15 = 0;
  if (+[CUIPSDImageRef isValidPSDResourceAtPath:withLayerCount:](CUIPSDImageRef, "isValidPSDResourceAtPath:withLayerCount:", a3, &v15))
  {
    v5 = (NSString *)objc_msgSend(a3, "copy");
    v4->_file = -1;
    v4->_psd = 0;
    v4->_path = v5;
  }
  else
  {
    v6 = __error();
    strerror(*v6);
    _CUILog(4, (uint64_t)"-[CUIPSDImageRef initWithPath:] - WARNING - invalid or nonexistent file at %@. Image ref not created. '[%s]'", v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    v13 = v4;
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  void *psd;
  int file;
  objc_super v5;

  psd = self->_psd;
  if (psd)
    (*(void (**)(void *, SEL))(*(_QWORD *)psd + 8))(psd, a2);
  file = self->_file;
  if (file != -1)
    CloseHandle(file);

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDImageRef;
  -[CUIPSDImageRef dealloc](&v5, sel_dealloc);
}

- (NSString)path
{
  return self->_path;
}

- (void)_psdFileWithLayers:(BOOL)a3
{
  _BOOL8 v3;
  CPSDFile *psd;

  v3 = a3;
  psd = (CPSDFile *)self->_psd;
  if (psd)
  {
    if (a3)
    {
      if (!self->_parsedForLayers)
        goto LABEL_6;
      return self->_psd;
    }
    if (CPSDFile::HasCompositeImage(psd))
      return self->_psd;
  }
LABEL_6:
  if (self->_file != -1 || !self->_path || -[CUIPSDImageRef openImageFile](self, "openImageFile"))
  {
    if (!-[CUIPSDImageRef loadPSDFileWithLayers:](self, "loadPSDFileWithLayers:", v3))
      self->_psd = 0;
    self->_parsedForLayers = v3;
    CloseHandle(self->_file);
    self->_file = -1;
    return self->_psd;
  }
  return 0;
}

- (void)psdFile
{
  return -[CUIPSDImageRef _psdFileWithLayers:](self, "_psdFileWithLayers:", 1);
}

- (void)psdFileForComposite
{
  return -[CUIPSDImageRef _psdFileWithLayers:](self, "_psdFileWithLayers:", 0);
}

- (id)imageFromRef:(CGImage *)a3
{
  return +[CUIImage imageWithCGImage:](CUIImage, "imageWithCGImage:", a3);
}

- (id)imageAtLayer:(unsigned int)a3
{
  return -[CUIPSDImageRef _imageAtAbsoluteIndex:isZeroSizeImage:](self, "_imageAtAbsoluteIndex:isZeroSizeImage:", *(_QWORD *)&a3, 0);
}

- (id)imageFromSlice:(unsigned int)a3 atLayer:(unsigned int)a4
{
  return -[CUIPSDImageRef _imageFromSlice:atAbsoluteIndex:isEmptyImage:](self, "_imageFromSlice:atAbsoluteIndex:isEmptyImage:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (id)imageFromSlice:(unsigned int)a3 atAbsoluteLayer:(unsigned int)a4
{
  return -[CUIPSDImageRef _imageFromSlice:atAbsoluteIndex:isEmptyImage:](self, "_imageFromSlice:atAbsoluteIndex:isEmptyImage:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (id)patternFromSlice:(unsigned int)a3 atLayer:(unsigned int)a4
{
  return -[CUIPSDImageRef _patternFromSlice:atAbsoluteIndex:isZeroSizeImage:](self, "_patternFromSlice:atAbsoluteIndex:isZeroSizeImage:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (CGImage)createCompositeCGImage
{
  CPSDFile *v3;
  CGImage *result;
  uint64_t v5;
  int file;

  v3 = -[CUIPSDImageRef psdFileForComposite](self, "psdFileForComposite");
  if (v3)
  {
    CPSDFile::GetCompositeImage(v3);
    if (result)
    {
      v5 = (*(uint64_t (**)(CGImage *))(*(_QWORD *)result + 16))(result);
      return (CGImage *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
    }
  }
  else
  {
    file = self->_file;
    if (file == -1)
    {
      return 0;
    }
    else
    {
      CloseHandle(file);
      result = 0;
      self->_file = -1;
    }
  }
  return result;
}

- (id)compositeImage
{
  id result;
  CGImage *v4;
  id v5;

  result = -[CUIPSDImageRef createCompositeCGImage](self, "createCompositeCGImage");
  if (result)
  {
    v4 = (CGImage *)result;
    v5 = -[CUIPSDImageRef imageFromRef:](self, "imageFromRef:", result);
    CGImageRelease(v4);
    return v5;
  }
  return result;
}

- (id)maskFromCompositeAlphaChannel:(int64_t)a3
{
  _BYTE *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGImage *v13;
  id v14;

  v5 = -[CUIPSDImageRef psdFile](self, "psdFile");
  v6 = *((unsigned __int16 *)v5 + 70);
  v7 = *((unsigned __int16 *)v5 + 77);
  v8 = 4;
  v9 = 3;
  if ((_DWORD)v7 != 3)
    v9 = *((unsigned __int16 *)v5 + 70);
  if ((_DWORD)v7 != 4)
    v8 = v9;
  if ((_DWORD)v7 != 1)
    v7 = v8;
  if (a3 < 1)
    return 0;
  v10 = v7 + a3;
  if (v5[104])
    ++v10;
  if (v10 > v6)
    return 0;
  CPSDFile::GetCompositeImage((CPSDFile *)-[CUIPSDImageRef psdFileForComposite](self, "psdFileForComposite"));
  if (!v11)
    return 0;
  v12 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v11 + 24))(v11, (v6 - a3));
  v13 = (CGImage *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 16))(v12);
  if (!v13)
    return 0;
  v14 = -[CUIPSDImageRef imageFromRef:](self, "imageFromRef:", v13);
  CGImageRelease(v13);
  return v14;
}

- (CGRect)boundsForSlice:(unsigned int)a3
{
  CPSDFile *v4;
  _DWORD *v5;
  unsigned int v6;
  unsigned int v7;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v4 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (v4)
  {
    v5 = (_DWORD *)CPSDFile::LookupSliceWithNumber(v4, a3);
    v7 = v5[13];
    v6 = v5[14];
    x = (double)v7;
    y = (double)v6;
    width = (double)(v5[15] - v7);
    height = (double)(v5[16] - v6);
  }
  else
  {
    x = NSZeroRect.origin.x;
    y = NSZeroRect.origin.y;
    width = NSZeroRect.size.width;
    height = NSZeroRect.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int)absoluteLayerIndexFromLayerNames:(id)a3
{
  return -[CUIPSDImageRef _layerIndexFromLayerNames:indexRangeBegin:indexRangeEnd:isTopLevel:](self, "_layerIndexFromLayerNames:indexRangeBegin:indexRangeEnd:isTopLevel:", a3, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 1);
}

- (int)_layerIndexFromLayerNames:(id)a3 indexRangeBegin:(int)a4 indexRangeEnd:(int)a5 isTopLevel:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v11;
  uint64_t v12;
  CPSDFile *v13;
  CPSDString *v14;
  id v15;
  int IndexOfFirstLayerNamed;
  unsigned int v17;
  int v18;
  uint64_t v19;
  int v21;
  int v22;

  v6 = a6;
  v11 = (uint64_t)objc_msgSend(a3, "count");
  if (v11 < 1)
    return -1;
  v12 = v11;
  v13 = -[CUIPSDImageRef psdFile](self, "psdFile");
  v14 = NewCPSDStringFromNSString((NSString *)objc_msgSend(a3, "objectAtIndex:", 0));
  v15 = 0;
  if (v12 != 1)
    v15 = objc_msgSend(a3, "subarrayWithRange:", 1, v12 - 1);
  while (1)
  {
    IndexOfFirstLayerNamed = CPSDFile::GetIndexOfFirstLayerNamed(v13, (const UniChar **)v14, a4, a5);
    if (IndexOfFirstLayerNamed == -1)
    {
      v18 = -1;
LABEL_16:
      if (!v14)
        return v18;
      goto LABEL_19;
    }
    v17 = IndexOfFirstLayerNamed;
    if (!v6 || CPSDFile::GetLayerIndexOfParentGroup(v13, IndexOfFirstLayerNamed) == -1)
      break;
    a4 = v17 + 1;
    v18 = -1;
LABEL_11:
    if (v18 != -1 || a4 > a5)
      goto LABEL_16;
  }
  if (v15)
  {
    v21 = a5;
    v22 = a4;
    CPSDFile::GetRangeOfChildLayers(v13, v17, &v22, &v21);
    v18 = -[CUIPSDImageRef _layerIndexFromLayerNames:indexRangeBegin:indexRangeEnd:isTopLevel:](self, "_layerIndexFromLayerNames:indexRangeBegin:indexRangeEnd:isTopLevel:", v15, v22, v21, 0);
    if (v18 == -1)
      a4 = v17 + 1;
    goto LABEL_11;
  }
  v18 = v17;
  if (!v14)
    return v18;
LABEL_19:
  v19 = *((_QWORD *)v14 + 1);
  if (v19)
  {
    MEMORY[0x1A1AEEAF0](v19, 0x1000C80BDFB0063);
    *((_QWORD *)v14 + 1) = 0;
  }
  MEMORY[0x1A1AEEB08](v14, 0x1010C4082113244);
  return v18;
}

- ($EFF4F97A94432FEE0F91D8A1E88572D8)metricsInAlphaChannel:(SEL)a3 forRect:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  $EFF4F97A94432FEE0F91D8A1E88572D8 *result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  result = -[CUIPSDImageRef maskFromCompositeAlphaChannel:](self, "maskFromCompositeAlphaChannel:", a4);
  if (self)
    return -[CUIPSDImageRef metricsInMask:forRect:](self, "metricsInMask:forRect:", result, x, y, width, height);
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0 = 0u;
  return result;
}

- ($EFF4F97A94432FEE0F91D8A1E88572D8)metricsInMask:(SEL)a3 forRect:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  CGImage *v10;
  int64_t BytesPerRow;
  $EFF4F97A94432FEE0F91D8A1E88572D8 *result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGDataProvider *DataProvider;
  $EFF4F97A94432FEE0F91D8A1E88572D8 *v18;
  const UInt8 *BytePtr;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  const UInt8 *v32;
  double v33;
  double v35;
  double v36;
  double v37;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  *retstr = *($EFF4F97A94432FEE0F91D8A1E88572D8 *)CSIIllegalMetrics;
  v10 = (CGImage *)objc_msgSend(a4, "image");
  BytesPerRow = CGImageGetBytesPerRow(v10);
  result = ($EFF4F97A94432FEE0F91D8A1E88572D8 *)CGImageGetHeight(v10);
  v13 = (uint64_t)x;
  if ((uint64_t)x < 0)
    return result;
  v14 = (uint64_t)(x + width);
  if (BytesPerRow < v14)
    return result;
  v15 = (uint64_t)y;
  if ((uint64_t)y < 0)
    return result;
  v16 = (uint64_t)(y + height);
  if ((uint64_t)result < v16)
    return result;
  DataProvider = CGImageGetDataProvider(v10);
  result = ($EFF4F97A94432FEE0F91D8A1E88572D8 *)CGDataProviderCopyData(DataProvider);
  if (!result)
    return result;
  v18 = result;
  BytePtr = CFDataGetBytePtr((CFDataRef)result);
  v20 = retstr->var0.width;
  if (v16 <= v15)
    goto LABEL_28;
  v21 = retstr->var1.width;
  v22 = (uint64_t)y;
  do
  {
    if (v14 <= v13)
      goto LABEL_27;
    v23 = 0;
    v24 = v14 - v13;
    while (1)
    {
      if (BytePtr[v13 + v22 * BytesPerRow + v23])
      {
        if (v20 < 0.0)
        {
          v20 = (double)v23;
          retstr->var0.width = (double)v23;
        }
        v25 = 0.0;
        if (v21 < 0.0 && v24 == 1)
          goto LABEL_21;
      }
      else if (v21 < 0.0 && v20 >= 0.0)
      {
        v25 = (double)v24;
LABEL_21:
        retstr->var1.width = v25;
        v21 = v25;
      }
      if (v20 >= 0.0 && v21 >= 0.0)
        break;
      ++v23;
      if (!--v24)
        goto LABEL_27;
    }
    v22 = (uint64_t)(y + height);
LABEL_27:
    ++v22;
  }
  while (v22 < v16);
LABEL_28:
  if (v20 < 0.0)
    goto LABEL_51;
  v27 = (uint64_t)(v20 + (double)v13);
  if (v27 >= v14)
    goto LABEL_51;
  v28 = retstr->var1.height;
  v29 = retstr->var0.height;
  while (2)
  {
    if (v16 <= v15)
      goto LABEL_50;
    v30 = 0;
    v31 = v16 - v15;
    v32 = &BytePtr[BytesPerRow * v15];
    while (2)
    {
      if (!v32[v27])
      {
        if (v28 < 0.0 || v29 >= 0.0)
          goto LABEL_45;
        v33 = (double)v31;
LABEL_44:
        retstr->var0.height = v33;
        v29 = v33;
        goto LABEL_45;
      }
      if (v28 < 0.0)
      {
        v28 = (double)v30;
        retstr->var1.height = (double)v30;
      }
      v33 = 0.0;
      if (v29 < 0.0 && v31 == 1)
        goto LABEL_44;
LABEL_45:
      if (v29 < 0.0 || v28 < 0.0)
      {
        v32 += BytesPerRow;
        ++v30;
        if (!--v31)
          goto LABEL_50;
        continue;
      }
      break;
    }
    v27 = (uint64_t)(x + width);
LABEL_50:
    if (++v27 < v14)
      continue;
    break;
  }
LABEL_51:
  if (v20 < 0.0
    || (v35 = retstr->var0.height, v35 < 0.0)
    || (v36 = retstr->var1.width, v36 < 0.0)
    || (v37 = retstr->var1.height, v37 < 0.0))
  {
    retstr->var0 = *(CGSize *)CSIIllegalMetrics;
    retstr->var1 = *(CGSize *)&CSIIllegalMetrics[16];
    retstr->var2 = *(CGSize *)&CSIIllegalMetrics[32];
  }
  else
  {
    retstr->var2.width = width - v36 - v20;
    retstr->var2.height = height - v37 - v35;
  }
  CFRelease(v18);
  return result;
}

- (CGColorSpace)copyColorSpace
{
  unsigned __int16 *v2;
  size_t v3;
  uint64_t ICCProfile;
  const void *v6;
  unsigned int v7;
  CGDataProvider *v8;
  CGColorSpace *ICCBased;

  v2 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (!CPSDFile::IsTaggedWithICCProfile((CPSDFile *)v2))
    return 0;
  v3 = v2[77];
  if ((_DWORD)v3 != 1)
  {
    if ((_DWORD)v3 == 4)
    {
      v3 = 4;
    }
    else if ((_DWORD)v3 == 3)
    {
      v3 = 3;
    }
    else
    {
      v3 = v2[70];
    }
  }
  ICCProfile = CPSDFile::GetICCProfile((CPSDFile *)v2);
  v6 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)ICCProfile + 56))(ICCProfile);
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)ICCProfile + 48))(ICCProfile);
  v8 = CGDataProviderCreateWithData(0, v6, v7, 0);
  ICCBased = CGColorSpaceCreateICCBased(v3, 0, v8, 0);
  CGDataProviderRelease(v8);
  return ICCBased;
}

- (_PSDImageInfo)imageInfo
{
  int file;
  int v6;
  _BOOL4 v9;
  _PSDImageInfo *result;
  _BYTE v11[400];

  CPSDFile::CPSDFile((CPSDFile *)v11);
  bzero(retstr, 0x14uLL);
  file = self->_file;
  if (file == -1)
  {
    if (!-[CUIPSDImageRef openImageFile](self, "openImageFile"))
      goto LABEL_16;
    file = self->_file;
  }
  CPSDFile::GetImageInfo((CPSDFile *)v11, file, &retstr->var1, &retstr->var0, &retstr->var3, &retstr->var2, &retstr->var4);
  v6 = self->_file;
  if (v6 != -1)
  {
    CloseHandle(v6);
    self->_file = -1;
  }
  v9 = retstr->var2 == 3 && retstr->var3 == 8 && retstr->var4 == 4;
  retstr->var5 = v9;
LABEL_16:
  CPSDFile::~CPSDFile((CPSDFile *)v11);
  return result;
}

- (unsigned)numberOfLayers
{
  return objc_msgSend(-[CUIPSDImageRef _layerInfo](self, "_layerInfo"), "numberOfSublayers");
}

- (unsigned)numberOfSlices
{
  CPSDFile *v2;

  v2 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (v2)
    LODWORD(v2) = CPSDFile::GetSliceCount(v2);
  if (v2 <= 2)
    LODWORD(v2) = 2;
  return v2;
}

- (unsigned)numberOfChannels
{
  unsigned __int16 *v2;

  v2 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (v2)
    LODWORD(v2) = v2[70];
  return v2;
}

- (id)layerNames
{
  return -[CUIPSDImageRef _namesOfSublayers:](self, "_namesOfSublayers:", -[CUIPSDImageRef _layerInfo](self, "_layerInfo"));
}

- (id)metadataString
{
  id result;
  id v3;
  unsigned int v4;
  char *v5;

  result = -[CUIPSDImageRef psdFile](self, "psdFile");
  v5 = 0;
  v4 = 0;
  if (result)
  {
    if (CPSDFile::GetXMPMetadataString((CPSDFile *)result, &v5, &v4))
    {
      v3 = objc_alloc((Class)NSString);
      return objc_msgSend(v3, "initWithBytes:length:encoding:", v5, v4, 4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (CGSize)size
{
  unint64_t v2;
  unint64_t v3;
  double v4;
  double v5;
  CGSize result;

  if (self)
  {
    -[CUIPSDImageRef imageInfo](self, "imageInfo");
    LODWORD(v3) = 0;
    LODWORD(v2) = 0;
    v4 = (double)v2;
    v5 = (double)v3;
  }
  else
  {
    v5 = 0.0;
    v4 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)_layerInfo
{
  id result;

  result = self->_rootLayers;
  if (!result)
  {
    result = -[CUIPSDImageRef _copySublayerInfoAtAbsoluteIndex:atRoot:](self, "_copySublayerInfoAtAbsoluteIndex:atRoot:", 0, 1);
    self->_rootLayers = (_CUIPSDSublayerInfo *)result;
  }
  return result;
}

- (unsigned)_absoluteIndexOfRootLayer:(unsigned int)a3
{
  char v4;

  v4 = 0;
  return objc_msgSend(-[CUIPSDImageRef _layerInfo](self, "_layerInfo"), "sublayerAtIndex:isValid:", *(_QWORD *)&a3, &v4);
}

- (void)_psdLayerRecordAtAbsoluteIndex:(unsigned int)a3
{
  unsigned __int16 *v4;

  v4 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (v4 && v4[134] > a3)
    return (void *)CPSDFile::GetLayerRecord((CPSDFile *)v4, a3);
  else
    return 0;
}

- (id)_layerRefAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v3;
  id result;
  int IsSectionDivider;
  BOOL v7;
  __objc2_class **v8;
  unsigned __int8 v9;

  v3 = *(_QWORD *)&a3;
  result = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (result)
  {
    if (*((unsigned __int16 *)result + 134) <= v3)
    {
      return 0;
    }
    else
    {
      v9 = 0;
      IsSectionDivider = CPSDFile::GetLayerIsSectionDivider((CPSDFile *)result, v3, (BOOL *)&v9);
      if (v9)
        v7 = IsSectionDivider == 0;
      else
        v7 = 1;
      v8 = OBJC_CLASS___CUIPSDLayerGroupRef_ptr;
      if (v7)
        v8 = CUIPSDLayerRef_ptr;
      return objc_msgSend(objc_alloc(*v8), "initWithImageRef:layerIndex:", self, v3);
    }
  }
  return result;
}

- (BOOL)_treatDividerAsLayer
{
  return 0;
}

- (id)_copySublayerInfoAtAbsoluteIndex:(unsigned int)a3 atRoot:(BOOL)a4
{
  unsigned __int16 *v7;
  unsigned __int8 v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  unsigned int v16;
  unsigned __int8 v17;

  v7 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (v7)
  {
    v8 = -[CUIPSDImageRef _treatDividerAsLayer](self, "_treatDividerAsLayer");
    v17 = 0;
    v16 = 0;
    if (a4)
    {
      v9 = v7[134];
      a3 = v9;
    }
    else
    {
      if (CPSDFile::GetLayerIsSectionDivider((CPSDFile *)v7, a3, (BOOL *)&v17) && !v17
        || CPSDFile::GetLayerSectionDividerType((CPSDFile *)v7, a3, &v16) && v16 != 1 && v16 != 2)
      {
        return 0;
      }
      v9 = v7[134];
    }
    v10 = a3 - 1;
    if (v10 < v9)
    {
      v11 = objc_alloc_init((Class)NSMutableIndexSet);
      v12 = 1;
      while (1)
      {
        CPSDFile::GetLayerIsSectionDivider((CPSDFile *)v7, v10, (BOOL *)&v17);
        v13 = v17 ? v8 : 1;
        if ((v13 & 1) != 0)
          break;
        CPSDFile::GetLayerSectionDividerType((CPSDFile *)v7, v10, &v16);
        if (v16 - 1 <= 1)
        {
          if (v12 == 1)
            objc_msgSend(v11, "addIndex:", v10);
          ++v12;
LABEL_22:
          v14 = 1;
          if (!(_DWORD)v10)
            goto LABEL_31;
          goto LABEL_30;
        }
        v14 = v16 != 3 || v12 > 1;
        if (v16 == 3)
          v12 -= v12 > 1;
        if (!(_DWORD)v10)
        {
LABEL_31:
          v7 = +[_CUIPSDSublayerInfo newWithSublayerCount:indexSet:](_CUIPSDSublayerInfo, "newWithSublayerCount:indexSet:", objc_msgSend(v11, "count"), v11);

          return v7;
        }
LABEL_30:
        --v10;
        if (!v14)
          goto LABEL_31;
      }
      if (v12 == 1)
        objc_msgSend(v11, "addIndex:", v10);
      goto LABEL_22;
    }
    return 0;
  }
  return v7;
}

- (void)_logInvalidAbsoluteIndex:(unsigned int)a3 psd:(void *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _CUILog(1, (uint64_t)"CUIPSDImageRef: Absolute layer index %d is invalid for %@. Absolute layer count is %d.", *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, *(uint64_t *)&a3);
}

- (id)_nameAtAbsoluteIndex:(unsigned int)a3
{
  id result;
  _QWORD *v5;
  _QWORD *UnicodeLayerName;
  _QWORD *v7;
  id v8;
  unsigned int v9;
  char v10[256];

  result = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (result)
  {
    v5 = result;
    if (*((unsigned __int16 *)result + 134) <= a3)
    {
      return 0;
    }
    else
    {
      v9 = 0;
      UnicodeLayerName = CPSDLayerRecord::GetUnicodeLayerName((CPSDLayerRecord *)(*((_QWORD *)result + 34) + 488 * a3), &v9);
      if (UnicodeLayerName)
      {
        v7 = UnicodeLayerName;
        v8 = objc_alloc((Class)NSString);
        return objc_msgSend(v8, "initWithCharacters:length:", v7, v9);
      }
      else if (*((unsigned __int16 *)v5 + 134) > a3
             && CPSDLayerRecord::GetLayerName((CPSDLayerRecord *)(v5[34] + 488 * a3), v10, 0x100u))
      {
        return +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 30);
      }
      else
      {
        return &stru_1E41B97C0;
      }
    }
  }
  return result;
}

- (id)_namesOfSublayers:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  unsigned int v6;
  NSMutableArray *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  _QWORD *UnicodeLayerName;
  _QWORD *v13;
  id v14;
  NSString *v15;
  __CFString *v16;
  unsigned int v18;
  char v19;
  char v20[256];

  v4 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = objc_msgSend(a3, "numberOfSublayers");
  v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6);
  if (v6)
  {
    v8 = 0;
    while (1)
    {
      v19 = 0;
      v9 = objc_msgSend(a3, "sublayerAtIndex:isValid:", v8, &v19);
      if (v19)
        break;
LABEL_14:
      v8 = (v8 + 1);
      if (v6 == (_DWORD)v8)
        return v7;
    }
    v10 = v9;
    v18 = 0;
    v11 = *((unsigned __int16 *)v5 + 134);
    if (v9 < v11)
    {
      UnicodeLayerName = CPSDLayerRecord::GetUnicodeLayerName((CPSDLayerRecord *)(v5[34] + 488 * v9), &v18);
      if (UnicodeLayerName)
      {
        v13 = UnicodeLayerName;
        v14 = objc_alloc((Class)NSString);
        v15 = (NSString *)objc_msgSend(v14, "initWithCharacters:length:", v13, v18);
        goto LABEL_12;
      }
      v11 = *((unsigned __int16 *)v5 + 134);
    }
    v16 = &stru_1E41B97C0;
    if (v10 >= v11)
    {
LABEL_13:
      -[NSMutableArray addObject:](v7, "addObject:", v16);

      goto LABEL_14;
    }
    if (!CPSDLayerRecord::GetLayerName((CPSDLayerRecord *)(v5[34] + 488 * v10), v20, 0x100u))
    {
      v16 = &stru_1E41B97C0;
      goto LABEL_13;
    }
    v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 30);
LABEL_12:
    v16 = (__CFString *)v15;
    goto LABEL_13;
  }
  return v7;
}

- (CGRect)_boundsAtAbsoluteIndex:(unsigned int)a3
{
  unsigned __int16 *v4;
  double x;
  double y;
  double width;
  double height;
  int32x4_t v9;
  CGRect result;

  v4 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (v4 && v4[134] > a3 && CPSDFile::GetLayerBounds((uint64_t)v4, a3, &v9))
  {
    x = (double)v9.i32[0];
    y = (double)v9.i32[1];
    width = (double)(v9.i32[2] - v9.i32[0]);
    height = (double)(v9.i32[3] - v9.i32[1]);
  }
  else
  {
    x = NSZeroRect.origin.x;
    y = NSZeroRect.origin.y;
    width = NSZeroRect.size.width;
    height = NSZeroRect.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_visibilityAtAbsoluteIndex:(unsigned int)a3
{
  unsigned __int16 *v4;
  uint64_t v6;

  v4 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (v4)
  {
    if (v4[134] <= a3)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      LOBYTE(v6) = 0;
      CPSDFile::GetLayerIsVisible((CPSDFile *)v4, a3, (BOOL *)&v6);
      LOBYTE(v4) = (_BYTE)v6 != 0;
    }
  }
  return (char)v4;
}

- (double)_opacityAtAbsoluteIndex:(unsigned int)a3
{
  unsigned __int16 *v4;
  double v5;
  unint64_t v6;
  unsigned __int8 v8[16];

  v4 = -[CUIPSDImageRef psdFile](self, "psdFile");
  v5 = 0.0;
  if (v4 && v4[134] > a3)
  {
    v8[0] = 0;
    CPSDFile::GetLayerOpacity((CPSDFile *)v4, a3, v8);
    LOBYTE(v6) = v8[0];
    return (double)v6 / 255.0;
  }
  return v5;
}

- (double)_fillOpacityAtAbsoluteIndex:(unsigned int)a3
{
  unsigned __int16 *v4;
  double v5;
  unint64_t v6;
  unsigned __int8 v8[16];

  v4 = -[CUIPSDImageRef psdFile](self, "psdFile");
  v5 = 1.0;
  if (v4 && v4[134] > a3)
  {
    v8[0] = 0;
    if (CPSDFile::GetLayerFillOpacity((CPSDFile *)v4, a3, v8))
    {
      LOBYTE(v6) = v8[0];
      return (double)v6 / 255.0;
    }
    else
    {
      return 0.0;
    }
  }
  return v5;
}

- (int)_blendModeAtAbsluteIndex:(unsigned int)a3
{
  unsigned __int16 *v5;
  uint64_t v7;

  v5 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (v5)
  {
    if (v5[134] <= a3)
    {
      LODWORD(v5) = 0;
    }
    else
    {
      LODWORD(v7) = 0;
      CPSDFile::GetLayerBlendMode((CPSDFile *)v5, a3, (unsigned int *)&v7);
      LODWORD(v5) = -[CUIPSDImageRef cgBlendModeForPSDLayerOrLayerEffectBlendMode:](self, "cgBlendModeForPSDLayerOrLayerEffectBlendMode:", v7);
    }
  }
  return (int)v5;
}

- (CGImage)_copyCGImageAtAbsoluteIndex:(unsigned int)a3
{
  unsigned __int16 *v5;
  uint64_t v6;
  uint64_t v7;
  CGImage *v8;
  int v9;
  int *p_file;
  int file;

  v5 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (v5 && v5[134] > a3)
  {
    CPSDLayerInfo::CreateImageAtLayer((CPSDLayerInfo *)(v5 + 124), a3);
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
    v8 = (CGImage *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
  }
  else
  {
    v8 = 0;
  }
  file = self->_file;
  p_file = &self->_file;
  v9 = file;
  if (file != -1)
  {
    CloseHandle(v9);
    *p_file = -1;
  }
  return v8;
}

- (id)_imageAtAbsoluteIndex:(unsigned int)a3 isZeroSizeImage:(BOOL *)a4
{
  id result;
  CGImage *v7;
  BOOL v8;
  id v9;

  result = -[CUIPSDImageRef _copyCGImageAtAbsoluteIndex:](self, "_copyCGImageAtAbsoluteIndex:", *(_QWORD *)&a3);
  if (result)
  {
    v7 = (CGImage *)result;
    if (CGImageGetWidth((CGImageRef)result))
    {
      v8 = CGImageGetHeight(v7) == 0;
      if (!a4)
      {
LABEL_5:
        v9 = -[CUIPSDImageRef imageFromRef:](self, "imageFromRef:", v7);
        CGImageRelease(v7);
        return v9;
      }
    }
    else
    {
      v8 = 1;
      if (!a4)
        goto LABEL_5;
    }
    *a4 = v8;
    goto LABEL_5;
  }
  return result;
}

- (id)_imageFromSlice:(unsigned int)a3 atAbsoluteIndex:(unsigned int)a4 isEmptyImage:(BOOL *)a5
{
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  unsigned int v11;
  int SliceCount;
  unsigned int v13;
  CPSDSliceResource *v14;
  CPSDLayerSliceImage *v15;
  CPSDLayerSliceImage *v16;
  _QWORD *v17;
  CGImage *v18;
  id v19;
  uint64_t v20;
  BOOL v21;

  v9 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (!v9)
    return 0;
  v10 = v9;
  v11 = v9[134];
  SliceCount = CPSDFile::GetSliceCount((CPSDFile *)v9);
  if (v11 <= a4)
    return 0;
  if (SliceCount)
    v13 = a3;
  else
    v13 = 0;
  v14 = (CPSDSliceResource *)CPSDFile::LookupSliceWithNumber((CPSDFile *)v10, v13);
  CPSDLayerInfo::CreateImageAtLayerWithSlice((CPSDLayerInfo *)(v10 + 124), a4, v14);
  v16 = v15;
  v17 = (_QWORD *)(*(uint64_t (**)(CPSDLayerSliceImage *))(*(_QWORD *)v15 + 16))(v15);
  v18 = (CGImage *)(*(uint64_t (**)(_QWORD *))(*v17 + 16))(v17);
  if (!v18)
  {
    v20 = v17[1];
    if (v20 && *(_DWORD *)(v20 + 8))
    {
      v21 = *(_DWORD *)(v20 + 12) == 0;
      if (!a5)
        return 0;
    }
    else
    {
      v21 = 1;
      if (!a5)
        return 0;
    }
    v19 = 0;
    *a5 = v21;
    return v19;
  }
  if (a5)
    *a5 = CPSDLayerSliceImage::IsEmptyImage(v16) != 0;
  v19 = -[CUIPSDImageRef imageFromRef:](self, "imageFromRef:", v18);
  CGImageRelease(v18);
  return v19;
}

- (id)_patternFromSlice:(unsigned int)a3 atAbsoluteIndex:(unsigned int)a4 isZeroSizeImage:(BOOL *)a5
{
  unsigned __int16 *v8;
  CUIPattern *v9;
  unsigned int v10;
  int SliceCount;
  unsigned int v12;
  CPSDSliceResource *v13;
  uint64_t v14;
  _QWORD *v15;
  CGImage *v16;
  uint64_t v17;
  BOOL v18;

  v8 = -[CUIPSDImageRef psdFile](self, "psdFile");
  v9 = (CUIPattern *)v8;
  if (v8)
  {
    v10 = v8[134];
    SliceCount = CPSDFile::GetSliceCount((CPSDFile *)v8);
    if (v10 > a4)
    {
      if (SliceCount)
        v12 = a3;
      else
        v12 = 0;
      v13 = (CPSDSliceResource *)CPSDFile::LookupSliceWithNumber((CPSDFile *)v9, v12);
      CPSDLayerInfo::CreateImageAtLayerWithSlice((CPSDLayerInfo *)&v9[7]._alpha, a4, v13);
      v15 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14);
      v16 = (CGImage *)(*(uint64_t (**)(_QWORD *))(*v15 + 16))(v15);
      if (v16)
      {
        v9 = -[CUIPattern initWithImageRef:]([CUIPattern alloc], "initWithImageRef:", v16);
        CGImageRelease(v16);
        return v9;
      }
      v17 = v15[1];
      if (v17 && *(_DWORD *)(v17 + 8))
      {
        v18 = *(_DWORD *)(v17 + 12) == 0;
        if (!a5)
          return 0;
LABEL_13:
        v9 = 0;
        *a5 = v18;
        return v9;
      }
      v18 = 1;
      if (a5)
        goto LABEL_13;
    }
    return 0;
  }
  return v9;
}

- (id)_createMaskFromSlice:(unsigned int)a3 atAbsoluteIndex:(unsigned int)a4
{
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  int SliceCount;
  unsigned int v11;
  CPSDSliceResource *v12;
  uint64_t v13;
  uint64_t v14;
  CGImage *v15;
  id v16;

  v7 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (!v7)
    return 0;
  v8 = v7;
  v9 = v7[134];
  SliceCount = CPSDFile::GetSliceCount((CPSDFile *)v7);
  if (v9 <= a4)
    return 0;
  v11 = SliceCount ? a3 : 0;
  v12 = (CPSDSliceResource *)CPSDFile::LookupSliceWithNumber((CPSDFile *)v8, v11);
  CPSDLayerInfo::CreateImageAtLayerWithSlice((CPSDLayerInfo *)(v8 + 124), a4, v12);
  v14 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v13 + 24))(v13, 0);
  v15 = (CGImage *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14);
  if (!v15)
    return 0;
  v16 = -[CUIPSDImageRef imageFromRef:](self, "imageFromRef:", v15);
  CGImageRelease(v15);
  return v16;
}

- (id)_fillSampleAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v3;
  CGImage *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  CGColorSpace *v12;
  CGColorSpace *SRGB;
  CUIColor *v14;
  size_t v15;
  void *v16;
  CGContext *v17;
  _BYTE *Data;
  const CGFloat *v19;
  unint64_t v20;
  const CGFloat *v21;
  unsigned __int8 *v22;
  uint64_t v23;
  double *v24;
  unsigned int v25;
  CGColor *v26;
  CGRect v28;

  v3 = *(_QWORD *)&a3;
  v5 = -[CUIPSDImageRef createCGImageAtLayer:](self, "createCGImageAtLayer:");
  -[CUIPSDImageRef boundsAtLayer:](self, "boundsAtLayer:", v3);
  if (!v5)
    return 0;
  if (rint(v6) == 0.0 || rint(v7) == 0.0)
  {
    CGImageRelease(v5);
    return 0;
  }
  CPSDLayerInfo::CreateImageAtLayer((CPSDLayerInfo *)((char *)-[CUIPSDImageRef psdFile](self, "psdFile") + 248), v3);
  v9 = v8;
  v10 = *(unsigned __int16 *)(v8 + 16);
  v11 = *(unsigned __int16 *)(v8 + 24);
  v12 = -[CUIPSDImageRef copyColorSpace](self, "copyColorSpace");
  if (v12)
  {
    SRGB = v12;
    CFAutorelease(v12);
  }
  else
  {
    SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  }
  v15 = v10 >> 3;
  v16 = malloc_type_calloc(v10 >> 3, 1uLL, 0x68E8B41BuLL);
  v17 = CGBitmapContextCreate(v16, 1uLL, 1uLL, 8uLL, v15, SRGB, 2u);
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = 1.0;
  v28.size.height = 1.0;
  CGContextDrawImage(v17, v28, v5);
  CGImageRelease(v5);
  Data = CGBitmapContextGetData(v17);
  v19 = (const CGFloat *)operator new[](8 * v11, 0x1000C8000313F17);
  v21 = v19;
  if (v11 >= 2)
  {
    v22 = Data + 1;
    v23 = v11 - 1;
    v20 = 0x406FE00000000000;
    v24 = (double *)v19;
    do
    {
      v25 = *v22++;
      *v24++ = (double)v25 / 255.0;
      --v23;
    }
    while (v23);
  }
  LOBYTE(v20) = *Data;
  v19[v11 - 1] = (double)v20 / 255.0;
  v26 = CGColorCreate(SRGB, v19);
  CGContextRelease(v17);
  free(v16);
  MEMORY[0x1A1AEEAF0](v21, 0x1000C8000313F17);
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  if (v26)
    v14 = +[CUIColor colorWithCGColor:](CUIColor, "colorWithCGColor:", v26);
  else
    v14 = 0;
  CGColorRelease(v26);
  return v14;
}

- (int)cgBlendModeForPSDLayerOrLayerEffectBlendMode:(unsigned int)a3
{
  int result;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  result = 0;
  if ((int)a3 > 1668246641)
  {
    if ((int)a3 > 1818518630)
    {
      if ((int)a3 > 1870030193)
      {
        if ((int)a3 > 1935766559)
        {
          if (a3 == 1935766560)
            return 13;
          if (a3 != 1935897198)
          {
            v4 = 1936553316;
LABEL_14:
            if (a3 == v4)
              return 11;
            return result;
          }
          return 2;
        }
        if (a3 != 1870030194)
        {
          if (a3 != 1934387572)
            return result;
          return 8;
        }
        return 3;
      }
      if ((int)a3 > 1819634975)
      {
        if (a3 == 1819634976)
          return 15;
        v9 = 1836411936;
        goto LABEL_57;
      }
      if (a3 == 1818518631)
        return 27;
      v7 = 1818850405;
      goto LABEL_61;
    }
    if ((int)a3 <= 1749838195)
    {
      if ((int)a3 > 1684629093)
      {
        if (a3 != 1684629094)
        {
          v5 = 1684633120;
LABEL_51:
          if (a3 == v5)
            return 6;
          return result;
        }
        return 10;
      }
      if (a3 == 1668246642)
        return 14;
      if (a3 != 1684107883)
        return result;
      return 4;
    }
    if ((int)a3 > 1768188277)
    {
      if (a3 != 1768188278)
      {
        v6 = 1818391150;
LABEL_66:
        if (a3 == v6)
          return 26;
        return result;
      }
      return 7;
    }
    if (a3 != 1749838196)
    {
      v8 = 1752524064;
LABEL_37:
      if (a3 == v8)
        return 12;
      return result;
    }
    return 9;
  }
  if ((int)a3 > 1282240114)
  {
    if ((int)a3 > 1333162603)
    {
      if ((int)a3 > 1399223371)
      {
        if (a3 != 1399223372)
        {
          if (a3 != 1400140404)
          {
            v4 = 1482910837;
            goto LABEL_14;
          }
          return 13;
        }
        return 8;
      }
      if (a3 != 1333162604)
      {
        if (a3 != 1399026286)
          return result;
        return 2;
      }
      return 3;
    }
    if ((int)a3 <= 1282240117)
    {
      if (a3 != 1282240115)
      {
        v6 = 1282240116;
        goto LABEL_66;
      }
      return 15;
    }
    if (a3 != 1282240118)
    {
      v9 = 1298953328;
LABEL_57:
      if (a3 == v9)
        return 1;
      return result;
    }
    return 27;
  }
  if ((int)a3 <= 1148349293)
  {
    if ((int)a3 <= 1131180575)
    {
      if (a3 != 1128428142)
      {
        v5 = 1128555623;
        goto LABEL_51;
      }
      return 7;
    }
    if (a3 != 1131180576)
    {
      if (a3 != 1147564654)
        return result;
      return 10;
    }
    return 14;
  }
  if ((int)a3 <= 1215456331)
  {
    if (a3 != 1148349294)
    {
      v8 = 1210064928;
      goto LABEL_37;
    }
    return 4;
  }
  if (a3 == 1215456332)
    return 9;
  v7 = 1281845358;
LABEL_61:
  if (a3 == v7)
    return 5;
  return result;
}

- (id)_gradientAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v3;
  CPSDFile *v5;
  CPSDFile *v6;
  int LayerGradientStyle;
  CUIPSDGradient *v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  id v14;
  unsigned int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  CUIPSDGradientColorStop *v24;
  CUIPSDGradientDoubleColorStop *v25;
  id v26;
  id v27;
  double v28;
  double v29;
  double v30;
  CUIPSDGradientDoubleColorStop *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGColor *v36;
  const CGFloat *Components;
  id v38;
  id v39;
  id v40;
  id v41;
  unsigned int v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CUIPSDGradientDoubleOpacityStop *v50;
  double v51;
  CUIPSDGradientDoubleOpacityStop *v52;
  id v53;
  CUIPSDGradientOpacityStop *v54;
  id v55;
  CUIPSDGradientEvaluator *v56;
  CUIPSDGradientEvaluator *v57;
  CUIPSDGradient *v58;
  unint64_t v59;
  double v61;
  double v62;
  id v63;
  double v64;
  double v65;
  unsigned int v66;
  unsigned __int8 v67[2];
  double v68;
  unsigned int v69[2];
  double v70;
  long double v71;
  unsigned int v72;
  unsigned __int8 v73[16];
  __int128 v74;

  v3 = *(_QWORD *)&a3;
  v5 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (!v5)
    return 0;
  v6 = v5;
  v72 = 0;
  LayerGradientStyle = CPSDFile::GetLayerGradientStyle(v5, v3, &v72);
  if (!LayerGradientStyle && !CPSDFile::GetLayerEffectGradientStyle(v6, v3, &v72))
    return 0;
  v70 = 0.0;
  v71 = 0.0;
  v68 = 1.0;
  *(_QWORD *)v69 = 0;
  *(_WORD *)v67 = 0;
  v66 = 0;
  if (!LayerGradientStyle)
  {
    if (CPSDFile::GetLayerEffectGradientAngle(v6, v3, &v71)
      && CPSDFile::GetLayerEffectGradientSmoothing(v6, v3, &v70))
    {
      v8 = 0;
      if (!CPSDFile::GetLayerEffectGradientColorStopCount(v6, v3, &v69[1]) || !v69[1])
        return v8;
      if (CPSDFile::GetLayerEffectGradientOpacityStopCount(v6, v3, v69)
        && CPSDFile::GetLayerEffectOpacity(v6, v3, &v68)
        && CPSDFile::GetLayerEffectGradientBlendMode(v6, v3, &v66))
      {
        v68 = v68 / 100.0;
        v36 = (CGColor *)objc_msgSend(-[CUIPSDImageRef fillSampleAtLayer:](self, "fillSampleAtLayer:", v3), "CGColor");
        if (v36)
        {
          Components = CGColorGetComponents(v36);
          v11 = *Components;
          v10 = Components[1];
          v9 = Components[2];
        }
        else
        {
          v9 = 0.0;
          v10 = 0.0;
          v11 = 0.0;
        }
        v73[0] = 0;
        if (CPSDFile::GetLayerFillOpacity(v6, v3, v73))
        {
          LOBYTE(v59) = v73[0];
          v61 = (double)v59 / 255.0;
          CPSDFile::GetLayerEffectGradientIsReversed(v6, v3, v67);
          goto LABEL_12;
        }
      }
    }
    return 0;
  }
  if (!CPSDFile::GetLayerGradientAngle(v6, v3, &v71)
    || !CPSDFile::GetLayerGradientSmoothing(v6, v3, &v70))
  {
    return 0;
  }
  v8 = 0;
  if (!CPSDFile::GetLayerGradientColorStopCount(v6, v3, &v69[1]) || !v69[1])
    return v8;
  if (!CPSDFile::GetLayerGradientOpacityStopCount(v6, v3, v69)
    || !CPSDFile::GetLayerGradientBlendMode(v6, v3, &v66))
  {
    return 0;
  }
  CPSDFile::GetLayerGradientIsReversed(v6, v3, v67);
  CPSDFile::GetLayerGradientIsDithered(v6, v3, &v67[1]);
  v61 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
LABEL_12:
  v62 = v9;
  if (v67[0])
    v71 = remainder(v71 + 180.0, 360.0);
  v12 = objc_alloc((Class)NSMutableArray);
  v13 = objc_msgSend(v12, "initWithCapacity:", v69[1]);
  v14 = objc_alloc((Class)NSMutableArray);
  v63 = objc_msgSend(v14, "initWithCapacity:", v69[1]);
  if (v69[1])
  {
    v15 = 0;
    do
    {
      *(_OWORD *)v73 = xmmword_19EC723D0;
      v74 = xmmword_19EC723E0;
      v64 = 0.0;
      v65 = 0.0;
      if (LayerGradientStyle)
      {
        if (!CPSDFile::GetLayerGradientColorStopAtIndex(v6, v3, v15, (double *)v73, &v65, &v64))
          break;
      }
      else if (!CPSDFile::GetLayerEffectGradientColorStopAtIndex(v6, v3, v15, (double *)v73, &v65, &v64))
      {
        break;
      }
      v16 = *(double *)v73 / 255.0;
      v17 = *(double *)&v73[8] / 255.0;
      v18 = v68;
      v19 = *(double *)&v74 / 255.0;
      v20 = objc_msgSend(v13, "lastObject");
      if (v20
        && (v21 = v20, (objc_msgSend(v20, "isDoubleStop") & 1) == 0)
        && (v22 = v65, objc_msgSend(v21, "colorLocation"), v22 - v23 <= 0.01001))
      {
        objc_msgSend(v21, "colorLocation");
        v29 = v28;
        v30 = v65;
        if (fmod(v65 * 100.0, 5.0) != 0.0)
        {
          if (fmod(v29 * 100.0, 5.0) == 0.0)
            v30 = v29;
          else
            v30 = (v29 + v30) * 0.5;
        }
        v31 = [CUIPSDGradientDoubleColorStop alloc];
        objc_msgSend(v21, "gradientColor");
        v25 = -[CUIPSDGradientDoubleColorStop initWithLocation:leadInColor:leadOutColor:](v31, "initWithLocation:leadInColor:leadOutColor:", v30, v32, v33, v34, v35, *(_QWORD *)&v16, *(_QWORD *)&v17, *(_QWORD *)&v19, *(_QWORD *)&v18);
        objc_msgSend(v13, "removeLastObject");
        v27 = 0;
      }
      else
      {
        v24 = [CUIPSDGradientColorStop alloc];
        v25 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:](v24, "initWithLocation:gradientColor:", v65, v16, v17, v19, v18);
        v26 = objc_alloc((Class)NSNumber);
        v27 = objc_msgSend(v26, "initWithDouble:", v64);
        objc_msgSend(v63, "addObject:", v27);
      }
      objc_msgSend(v13, "addObject:", v25);

      ++v15;
    }
    while (v15 < v69[1]);
  }
  v69[1] = objc_msgSend(v13, "count");
  if (v69[1])
    objc_msgSend(v63, "removeObjectAtIndex:", 0);
  v38 = objc_alloc((Class)NSMutableArray);
  v39 = objc_msgSend(v38, "initWithCapacity:", v69[0]);
  v40 = objc_alloc((Class)NSMutableArray);
  v41 = objc_msgSend(v40, "initWithCapacity:", v69[0]);
  if (v69[0])
  {
    v42 = 0;
    do
    {
      *(_QWORD *)v73 = 0;
      v64 = 0.0;
      v65 = 0.0;
      if (LayerGradientStyle)
      {
        if (!CPSDFile::GetLayerGradientOpacityStopAtIndex(v6, v3, v42, (double *)v73, &v65, &v64))
          break;
      }
      else if (!CPSDFile::GetLayerEffectGradientOpacityStopAtIndex(v6, v3, v42, (double *)v73, &v65, &v64))
      {
        break;
      }
      *(double *)v73 = *(double *)v73 / 100.0;
      v43 = objc_msgSend(v39, "lastObject");
      if (!v43
        || (v44 = v43, (objc_msgSend(v43, "isDoubleStop") & 1) != 0)
        || (v45 = v65, objc_msgSend(v44, "opacityLocation"), v45 - v46 >= 0.01001))
      {
        v54 = [CUIPSDGradientOpacityStop alloc];
        v52 = -[CUIPSDGradientOpacityStop initWithLocation:opacity:](v54, "initWithLocation:opacity:", v65, *(double *)v73);
        v55 = objc_alloc((Class)NSNumber);
        v53 = objc_msgSend(v55, "initWithDouble:", v64);
        objc_msgSend(v41, "addObject:", v53);
      }
      else
      {
        objc_msgSend(v44, "opacityLocation");
        v48 = v47;
        v49 = v65;
        if (fmod(v65 * 100.0, 5.0) != 0.0)
        {
          if (fmod(v48 * 100.0, 5.0) == 0.0)
            v49 = v48;
          else
            v49 = (v48 + v49) * 0.5;
        }
        v50 = [CUIPSDGradientDoubleOpacityStop alloc];
        objc_msgSend(v44, "opacity");
        v52 = -[CUIPSDGradientDoubleOpacityStop initWithLocation:leadInOpacity:leadOutOpacity:](v50, "initWithLocation:leadInOpacity:leadOutOpacity:", v49, v51, *(double *)v73);
        objc_msgSend(v39, "removeLastObject");
        v53 = 0;
      }
      objc_msgSend(v39, "addObject:", v52);

      ++v42;
    }
    while (v42 < v69[0]);
  }
  v69[0] = objc_msgSend(v39, "count");
  if (v69[0])
    objc_msgSend(v41, "removeObjectAtIndex:", 0);
  v56 = [CUIPSDGradientEvaluator alloc];
  v57 = -[CUIPSDGradientEvaluator initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:](v56, "initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:", v13, v63, v39, v41, v67[1] != 0, v70, v11, v10, v62, v61);
  -[CUIPSDGradientEvaluator setBlendMode:](v57, "setBlendMode:", -[CUIPSDImageRef cgBlendModeForPSDLayerOrLayerEffectBlendMode:](self, "cgBlendModeForPSDLayerOrLayerEffectBlendMode:", v66));

  v58 = [CUIPSDGradient alloc];
  v8 = -[CUIPSDGradient initWithEvaluator:drawingAngle:gradientStyle:](v58, "initWithEvaluator:drawingAngle:gradientStyle:", v57, v72, (double)v71);

  return v8;
}

- (id)colorFromDocumentColor:(double *)a3
{
  CGColorSpace *GenericRGB;
  CGColor *v5;
  CUIColor *v6;
  float64x2_t v8;
  double v9;
  uint64_t v10;

  GenericRGB = (CGColorSpace *)_CUIColorSpaceGetGenericRGB();
  v8 = vdivq_f64(*(float64x2_t *)a3, (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL));
  v9 = a3[2] / 255.0;
  v10 = 0x3FF0000000000000;
  v5 = CGColorCreate(GenericRGB, v8.f64);
  v6 = +[CUIColor colorWithCGColor:](CUIColor, "colorWithCGColor:", v5);
  CGColorRelease(v5);
  return v6;
}

- (id)_dropShadowFromLayerEffectsInfo:(void *)a3
{
  id result;
  CPSDFile *v6;
  CPSDDropShadowDescriptor *v7;
  CUIPSDLayerEffectDropShadow *v8;
  double GlobalLightAngle;
  double v10[4];

  result = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (result)
  {
    v6 = (CPSDFile *)result;
    result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1148343144);
    if (result)
    {
      v7 = (CPSDDropShadowDescriptor *)result;
      v8 = objc_alloc_init(CUIPSDLayerEffectDropShadow);
      -[CUIPSDLayerEffectDropShadow setColor:](v8, "setColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v10, CPSDDropShadowDescriptor::GetColor(v7, v10)));
      -[CUIPSDLayerEffectDropShadow setOpacity:](v8, "setOpacity:", CPSDDropShadowDescriptor::GetOpacity(v7) / 100.0);
      -[CUIPSDLayerEffectDropShadow setBlendMode:](v8, "setBlendMode:", -[CUIPSDImageRef cgBlendModeForPSDLayerOrLayerEffectBlendMode:](self, "cgBlendModeForPSDLayerOrLayerEffectBlendMode:", CPSDDropShadowDescriptor::GetBlendMode(v7)));
      -[CUIPSDLayerEffectDropShadow setBlurSize:](v8, "setBlurSize:", (unint64_t)rint(CPSDDropShadowDescriptor::GetBlurSize(v7)));
      -[CUIPSDLayerEffectDropShadow setSpread:](v8, "setSpread:", (unint64_t)rint(CPSDDropShadowDescriptor::GetSpread(v7)));
      -[CUIPSDLayerEffectDropShadow setDistance:](v8, "setDistance:", (unint64_t)rint(CPSDDropShadowDescriptor::GetDistance(v7)));
      if (CPSDDropShadowDescriptor::UseGlobalLightAngle(v7))
        GlobalLightAngle = (double)(int)CPSDFile::GetGlobalLightAngle(v6);
      else
        GlobalLightAngle = rint(CPSDDropShadowDescriptor::GetAngle(v7));
      -[CUIPSDLayerEffectDropShadow setAngle:](v8, "setAngle:", (int)GlobalLightAngle);
      -[CUIPSDLayerEffectComponent setVisible:](v8, "setVisible:", CPSDDropShadowDescriptor::GetIsEnabled(v7) != 0);
      return v8;
    }
  }
  return result;
}

- (id)_innerShadowFromLayerEffectsInfo:(void *)a3
{
  id result;
  CPSDFile *v6;
  CPSDDropShadowDescriptor *v7;
  CUIPSDLayerEffectInnerShadow *v8;
  double GlobalLightAngle;
  double v10[4];

  result = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (result)
  {
    v6 = (CPSDFile *)result;
    result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1232229224);
    if (result)
    {
      v7 = (CPSDDropShadowDescriptor *)result;
      v8 = objc_alloc_init(CUIPSDLayerEffectInnerShadow);
      -[CUIPSDLayerEffectInnerShadow setColor:](v8, "setColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v10, CPSDDropShadowDescriptor::GetColor(v7, v10)));
      -[CUIPSDLayerEffectInnerShadow setOpacity:](v8, "setOpacity:", CPSDDropShadowDescriptor::GetOpacity(v7) / 100.0);
      -[CUIPSDLayerEffectInnerShadow setBlendMode:](v8, "setBlendMode:", -[CUIPSDImageRef cgBlendModeForPSDLayerOrLayerEffectBlendMode:](self, "cgBlendModeForPSDLayerOrLayerEffectBlendMode:", CPSDDropShadowDescriptor::GetBlendMode(v7)));
      -[CUIPSDLayerEffectInnerShadow setBlurSize:](v8, "setBlurSize:", (unint64_t)rint(CPSDDropShadowDescriptor::GetBlurSize(v7)));
      -[CUIPSDLayerEffectInnerShadow setDistance:](v8, "setDistance:", (unint64_t)rint(CPSDDropShadowDescriptor::GetDistance(v7)));
      if (CPSDDropShadowDescriptor::UseGlobalLightAngle(v7))
        GlobalLightAngle = (double)(int)CPSDFile::GetGlobalLightAngle(v6);
      else
        GlobalLightAngle = rint(CPSDDropShadowDescriptor::GetAngle(v7));
      -[CUIPSDLayerEffectInnerShadow setAngle:](v8, "setAngle:", (int)GlobalLightAngle);
      -[CUIPSDLayerEffectComponent setVisible:](v8, "setVisible:", CPSDDropShadowDescriptor::GetIsEnabled(v7) != 0);
      return v8;
    }
  }
  return result;
}

- (id)_innerGlowFromLayerEffectsInfo:(void *)a3
{
  id result;
  CPSDDropShadowDescriptor *v6;
  CUIPSDLayerEffectInnerGlow *v7;
  double v8[4];

  result = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (result)
  {
    result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1232226156);
    if (result)
    {
      v6 = (CPSDDropShadowDescriptor *)result;
      v7 = objc_alloc_init(CUIPSDLayerEffectInnerGlow);
      -[CUIPSDLayerEffectInnerGlow setColor:](v7, "setColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v8, CPSDDropShadowDescriptor::GetColor(v6, v8)));
      -[CUIPSDLayerEffectInnerGlow setOpacity:](v7, "setOpacity:", CPSDDropShadowDescriptor::GetOpacity(v6) / 100.0);
      -[CUIPSDLayerEffectInnerGlow setBlendMode:](v7, "setBlendMode:", -[CUIPSDImageRef cgBlendModeForPSDLayerOrLayerEffectBlendMode:](self, "cgBlendModeForPSDLayerOrLayerEffectBlendMode:", CPSDDropShadowDescriptor::GetBlendMode(v6)));
      -[CUIPSDLayerEffectInnerGlow setBlurSize:](v7, "setBlurSize:", (unint64_t)rint(CPSDDropShadowDescriptor::GetBlurSize(v6)));
      -[CUIPSDLayerEffectComponent setVisible:](v7, "setVisible:", CPSDDropShadowDescriptor::GetIsEnabled(v6) != 0);
      return v7;
    }
  }
  return result;
}

- (id)_outerGlowFromLayerEffectsInfo:(void *)a3
{
  id result;
  CPSDDropShadowDescriptor *v6;
  CUIPSDLayerEffectOuterGlow *v7;
  double v8[4];

  result = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (result)
  {
    result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1332889452);
    if (result)
    {
      v6 = (CPSDDropShadowDescriptor *)result;
      v7 = objc_alloc_init(CUIPSDLayerEffectOuterGlow);
      -[CUIPSDLayerEffectOuterGlow setColor:](v7, "setColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v8, CPSDDropShadowDescriptor::GetColor(v6, v8)));
      -[CUIPSDLayerEffectOuterGlow setOpacity:](v7, "setOpacity:", CPSDDropShadowDescriptor::GetOpacity(v6) / 100.0);
      -[CUIPSDLayerEffectOuterGlow setBlendMode:](v7, "setBlendMode:", -[CUIPSDImageRef cgBlendModeForPSDLayerOrLayerEffectBlendMode:](self, "cgBlendModeForPSDLayerOrLayerEffectBlendMode:", CPSDDropShadowDescriptor::GetBlendMode(v6)));
      -[CUIPSDLayerEffectOuterGlow setBlurSize:](v7, "setBlurSize:", (unint64_t)rint(CPSDDropShadowDescriptor::GetBlurSize(v6)));
      -[CUIPSDLayerEffectOuterGlow setSpread:](v7, "setSpread:", (unint64_t)rint(CPSDDropShadowDescriptor::GetSpread(v6)));
      -[CUIPSDLayerEffectComponent setVisible:](v7, "setVisible:", CPSDDropShadowDescriptor::GetIsEnabled(v6) != 0);
      return v7;
    }
  }
  return result;
}

- (id)_colorOverlayFromLayerEffectsInfo:(void *)a3
{
  id result;
  CPSDDropShadowDescriptor *v6;
  CUIPSDLayerEffectColorOverlay *v7;
  double v8[4];

  result = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (result)
  {
    result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1399801449);
    if (result)
    {
      v6 = (CPSDDropShadowDescriptor *)result;
      v7 = objc_alloc_init(CUIPSDLayerEffectColorOverlay);
      -[CUIPSDLayerEffectColorOverlay setColor:](v7, "setColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v8, CPSDDropShadowDescriptor::GetColor(v6, v8)));
      -[CUIPSDLayerEffectColorOverlay setOpacity:](v7, "setOpacity:", CPSDDropShadowDescriptor::GetOpacity(v6) / 100.0);
      -[CUIPSDLayerEffectColorOverlay setBlendMode:](v7, "setBlendMode:", -[CUIPSDImageRef cgBlendModeForPSDLayerOrLayerEffectBlendMode:](self, "cgBlendModeForPSDLayerOrLayerEffectBlendMode:", CPSDDropShadowDescriptor::GetBlendMode(v6)));
      -[CUIPSDLayerEffectComponent setVisible:](v7, "setVisible:", CPSDDropShadowDescriptor::GetIsEnabled(v6) != 0);
      return v7;
    }
  }
  return result;
}

- (id)_gradientOverlayFromLayerEffectsAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v3;
  CPSDFile *v5;
  _QWORD *LayerEffectsInfo;
  CPSDDropShadowDescriptor *Effect;
  id v8;
  id v9;
  CUIPSDLayerEffectGradientOverlay *v10;

  v3 = *(_QWORD *)&a3;
  v5 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (!v5)
    return 0;
  LayerEffectsInfo = CPSDFile::GetLayerEffectsInfo(v5, v3);
  Effect = (CPSDDropShadowDescriptor *)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)LayerEffectsInfo, 1198671468);
  v8 = -[CUIPSDImageRef _gradientAtAbsoluteIndex:](self, "_gradientAtAbsoluteIndex:", v3);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = objc_alloc_init(CUIPSDLayerEffectGradientOverlay);
  -[CUIPSDLayerEffectGradientOverlay setGradient:](v10, "setGradient:", v9);
  -[CUIPSDLayerEffectComponent setVisible:](v10, "setVisible:", CPSDDropShadowDescriptor::GetIsEnabled(Effect) != 0);
  return v10;
}

- (id)_bevelEmbossFromLayerEffectsInfo:(void *)a3
{
  id result;
  CPSDFile *v6;
  CPSDDropShadowDescriptor *v7;
  CUIPSDLayerEffectBevelEmboss *v8;
  double GlobalLightAngle;
  double GlobalLightAltitude;
  double v11[4];

  result = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (result)
  {
    v6 = (CPSDFile *)result;
    result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1700946540);
    if (result)
    {
      v7 = (CPSDDropShadowDescriptor *)result;
      v8 = objc_alloc_init(CUIPSDLayerEffectBevelEmboss);
      -[CUIPSDLayerEffectBevelEmboss setBlurSize:](v8, "setBlurSize:", (unint64_t)rint(CPSDDropShadowDescriptor::GetBlurSize(v7)));
      -[CUIPSDLayerEffectBevelEmboss setSoftenSize:](v8, "setSoftenSize:", (unint64_t)rint(CPSDBevelEmbossDescriptor::GetSoftenSize(v7)));
      if (CPSDDropShadowDescriptor::UseGlobalLightAngle(v7))
        GlobalLightAngle = (double)(int)CPSDFile::GetGlobalLightAngle(v6);
      else
        GlobalLightAngle = CPSDDropShadowDescriptor::GetAngle(v7);
      -[CUIPSDLayerEffectBevelEmboss setAngle:](v8, "setAngle:", (int)GlobalLightAngle);
      if (CPSDDropShadowDescriptor::UseGlobalLightAngle(v7))
        GlobalLightAltitude = (double)CPSDFile::GetGlobalLightAltitude(v6);
      else
        GlobalLightAltitude = CPSDBevelEmbossDescriptor::GetAltitude(v7);
      -[CUIPSDLayerEffectBevelEmboss setAltitude:](v8, "setAltitude:", (unint64_t)GlobalLightAltitude);
      -[CUIPSDLayerEffectBevelEmboss setHighlightBlendMode:](v8, "setHighlightBlendMode:", -[CUIPSDImageRef cgBlendModeForPSDLayerOrLayerEffectBlendMode:](self, "cgBlendModeForPSDLayerOrLayerEffectBlendMode:", CPSDBevelEmbossDescriptor::GetHighlightBlendMode(v7)));
      -[CUIPSDLayerEffectBevelEmboss setHighlightColor:](v8, "setHighlightColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v11, CPSDBevelEmbossDescriptor::GetHighlightColor(v7, v11)));
      -[CUIPSDLayerEffectBevelEmboss setHighlightOpacity:](v8, "setHighlightOpacity:", CPSDBevelEmbossDescriptor::GetHighlightOpacity(v7) / 100.0);
      -[CUIPSDLayerEffectBevelEmboss setShadowBlendMode:](v8, "setShadowBlendMode:", -[CUIPSDImageRef cgBlendModeForPSDLayerOrLayerEffectBlendMode:](self, "cgBlendModeForPSDLayerOrLayerEffectBlendMode:", CPSDBevelEmbossDescriptor::GetShadowBlendMode(v7)));
      -[CUIPSDLayerEffectBevelEmboss setShadowColor:](v8, "setShadowColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v11, CPSDBevelEmbossDescriptor::GetShadowColor(v7, v11)));
      -[CUIPSDLayerEffectBevelEmboss setShadowOpacity:](v8, "setShadowOpacity:", CPSDBevelEmbossDescriptor::GetShadowOpacity(v7) / 100.0);
      -[CUIPSDLayerEffectBevelEmboss setDirection:](v8, "setDirection:", CPSDBevelEmbossDescriptor::GetBevelDirection(v7));
      -[CUIPSDLayerEffectComponent setVisible:](v8, "setVisible:", CPSDDropShadowDescriptor::GetIsEnabled(v7) != 0);
      return v8;
    }
  }
  return result;
}

- (id)_layerEffectsAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v3;
  CPSDFile *v5;
  CPSDObjectEffectsLayerInfo *LayerEffectsInfo;
  CPSDObjectEffectsLayerInfo *v7;
  CUIPSDLayerEffects *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = *(_QWORD *)&a3;
  v5 = -[CUIPSDImageRef psdFile](self, "psdFile");
  if (!v5)
    return 0;
  LayerEffectsInfo = (CPSDObjectEffectsLayerInfo *)CPSDFile::GetLayerEffectsInfo(v5, v3);
  if (!LayerEffectsInfo)
    return 0;
  v7 = LayerEffectsInfo;
  v8 = objc_alloc_init(CUIPSDLayerEffects);
  -[CUIPSDLayerEffects setVisible:](v8, "setVisible:", CPSDObjectEffectsLayerInfo::GetMasterEffectsSwitch(v7) != 0);
  -[CUIPSDLayerEffects setEffectScale:](v8, "setEffectScale:", CPSDGradientDescriptor::GetScale(v7));
  v9 = -[CUIPSDImageRef _colorOverlayFromLayerEffectsInfo:](self, "_colorOverlayFromLayerEffectsInfo:", v7);
  if (v9)
    -[CUIPSDLayerEffects addLayerEffectComponent:](v8, "addLayerEffectComponent:", v9);
  v10 = -[CUIPSDImageRef _gradientOverlayFromLayerEffectsAtAbsoluteIndex:](self, "_gradientOverlayFromLayerEffectsAtAbsoluteIndex:", v3);
  if (v10)
    -[CUIPSDLayerEffects addLayerEffectComponent:](v8, "addLayerEffectComponent:", v10);
  v11 = -[CUIPSDImageRef _dropShadowFromLayerEffectsInfo:](self, "_dropShadowFromLayerEffectsInfo:", v7);
  if (v11)
    -[CUIPSDLayerEffects addLayerEffectComponent:](v8, "addLayerEffectComponent:", v11);
  v12 = -[CUIPSDImageRef _innerShadowFromLayerEffectsInfo:](self, "_innerShadowFromLayerEffectsInfo:", v7);
  if (v12)
    -[CUIPSDLayerEffects addLayerEffectComponent:](v8, "addLayerEffectComponent:", v12);
  v13 = -[CUIPSDImageRef _innerGlowFromLayerEffectsInfo:](self, "_innerGlowFromLayerEffectsInfo:", v7);
  if (v13)
    -[CUIPSDLayerEffects addLayerEffectComponent:](v8, "addLayerEffectComponent:", v13);
  v14 = -[CUIPSDImageRef _outerGlowFromLayerEffectsInfo:](self, "_outerGlowFromLayerEffectsInfo:", v7);
  if (v14)
    -[CUIPSDLayerEffects addLayerEffectComponent:](v8, "addLayerEffectComponent:", v14);
  v15 = -[CUIPSDImageRef _bevelEmbossFromLayerEffectsInfo:](self, "_bevelEmbossFromLayerEffectsInfo:", v7);
  if (v15)
    -[CUIPSDLayerEffects addLayerEffectComponent:](v8, "addLayerEffectComponent:", v15);
  return v8;
}

- (int)file
{
  return self->_file;
}

- (void)setFile:(int)a3
{
  self->_file = a3;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)psd
{
  return self->_psd;
}

- (void)setPsd:(void *)a3
{
  self->_psd = a3;
}

- (id)layerEnumerator
{
  return +[CUIPSDLayerEnumerator enumeratorWithPSDImage:](CUIPSDLayerEnumerator, "enumeratorWithPSDImage:", self);
}

- (void)enumerateLayersUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = -[CUIPSDImageRef layerEnumerator](self, "layerEnumerator");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
      v10 = 0;
      (*((void (**)(id, uint64_t, char *))a3 + 2))(a3, v9, &v10);
      if (v10)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (uint64_t)loadPSDFileWithLayers:(_QWORD *)a3 .cold.1(void *a1, uint64_t a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t result;

  v7 = *((_QWORD *)__cxa_get_exception_ptr(a1) + 1);
  *a3 = &off_1E41A8FA0;
  a3[1] = v7;
  __cxa_begin_catch(a1);
  result = *a4;
  if (*a4)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

- (void)metadataString
{
  uint64_t v2;
  _QWORD v3[2];

  v2 = *((_QWORD *)__cxa_get_exception_ptr(a1) + 1);
  v3[0] = &off_1E41A8FA0;
  v3[1] = v2;
  __cxa_begin_catch(a1);
  CStdException::~CStdException((CStdException *)v3);
  __cxa_end_catch();
}

@end
