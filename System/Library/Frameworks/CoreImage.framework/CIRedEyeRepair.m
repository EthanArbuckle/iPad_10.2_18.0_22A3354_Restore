@implementation CIRedEyeRepair

- (BOOL)getBlockSetWithImage:(CGImage *)a3 into:(id *)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  __CFDictionary *Mutable;
  CGImageBlockSet *v12;
  uint64_t ImageBlock;
  double v14;
  double v15;
  BOOL v16;
  int BytesPerRow;
  uint64_t Data;

  CGImageGetImageProvider();
  CGImageGetWidth(a3);
  CGImageGetHeight(a3);
  Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0C9DAC0], (const void *)*MEMORY[0x1E0C9AE50]);
  v12 = (CGImageBlockSet *)CGImageProviderCopyImageBlockSetWithOptions();
  CFRelease(Mutable);
  if (!v12)
    goto LABEL_11;
  ImageBlock = CGImageBlockSetGetImageBlock();
  if (!ImageBlock)
  {
    CGImageBlockSetRelease();
    return ImageBlock;
  }
  CGImageBlockGetRect();
  v16 = (unint64_t)v15 == a5 && (unint64_t)v14 == a6;
  if (!v16 || (BytesPerRow = CGImageBlockGetBytesPerRow(), (Data = CGImageBlockGetData()) == 0))
  {
    CGImageBlockSetRelease();
LABEL_11:
    LOBYTE(ImageBlock) = 0;
    return ImageBlock;
  }
  LOBYTE(ImageBlock) = 1;
  constructBitmap((uint64_t)a4, Data, a5, a6, 4, 1, BytesPerRow, 100.0);
  self->blockSet = v12;
  self->imageSourceType = 0;
  return ImageBlock;
}

- (BOOL)getDataProviderBytePtrWithImage:(CGImage *)a3 into:(id *)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  int v6;
  int v7;
  CGDataProviderRef DataProvider;
  uint64_t v12;
  int BytesPerRow;

  v6 = a6;
  v7 = a5;
  DataProvider = CGImageGetDataProvider(a3);
  v12 = CGDataProviderRetainBytePtr();
  if (v12)
  {
    BytesPerRow = CGImageGetBytesPerRow(a3);
    self->releaseMe = (void *)CFRetain(DataProvider);
    constructBitmap((uint64_t)a4, v12, v7, v6, 4, 1, BytesPerRow, 100.0);
    self->imageSourceType = 1;
  }
  return v12 != 0;
}

- (BOOL)getDataProviderCopyWithImage:(CGImage *)a3 into:(id *)a4
{
  CGDataProvider *DataProvider;
  const __CFData *v8;
  const UInt8 *BytePtr;
  int Width;
  int Height;
  int BytesPerRow;

  DataProvider = CGImageGetDataProvider(a3);
  v8 = CGDataProviderCopyData(DataProvider);
  BytePtr = CFDataGetBytePtr(v8);
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  BytesPerRow = CGImageGetBytesPerRow(a3);
  constructBitmap((uint64_t)a4, (uint64_t)BytePtr, Width, Height, 4, 1, BytesPerRow, 100.0);
  self->dataRef = v8;
  self->imageSourceType = 2;
  return 1;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  CGColorSpaceRelease(self->lf->var6);
  self->lf->var6 = CGColorSpaceRetain(a3);
}

- (CIRedEyeRepair)initWithCGImage:(CGImage *)a3 cameraModel:(id)a4
{
  _DWORD *v7;
  size_t Width;
  size_t Height;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGColorSpace *ColorSpace;
  size_t BitsPerComponent;
  signed int v15;
  int v16;
  CIRedEyeRepair *result;

  if (CGImageGetBitsPerComponent(a3) != 8)
    return 0;
  v7 = zcalloc(1uLL, 0x180uLL);
  v7[92] = 1;
  *((_BYTE *)v7 + 372) = 0;
  if (objc_msgSend(a4, "hasPrefix:", CFSTR("iPhone")))
    *((_BYTE *)v7 + 372) = 1;
  v7[94] = 1101004800;
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  if (!-[CIRedEyeRepair getBlockSetWithImage:into:width:height:](self, "getBlockSetWithImage:into:width:height:", a3, v7 + 72, Width, Height)&& !-[CIRedEyeRepair getDataProviderBytePtrWithImage:into:width:height:](self, "getDataProviderBytePtrWithImage:into:width:height:", a3, v7 + 72, Width, Height))
  {
    -[CIRedEyeRepair getDataProviderCopyWithImage:into:](self, "getDataProviderCopyWithImage:into:", a3, v7 + 72);
  }
  v10 = v7[74];
  v7[82] = v10;
  v11 = v7[75];
  v7[83] = v11;
  *((_QWORD *)v7 + 42) = makeBitmapRect(0, 0, v10, v11);
  *((_QWORD *)v7 + 43) = v12;
  ColorSpace = CGImageGetColorSpace(a3);
  *((_QWORD *)v7 + 44) = CGColorSpaceRetain(ColorSpace);
  if (a3)
  {
    BitsPerComponent = CGImageGetBitsPerComponent(a3);
    v7[90] = CGImageGetBitmapInfo(a3);
    if (BitsPerComponent == 8)
    {
      v15 = CGImageGetBitmapInfo(a3) & 0xFFFFBFFF;
      v16 = 1;
      if (v15 <= 0x2000)
      {
        if (v15 == 2 || v15 == 4 || v15 == 6)
          v16 = 0;
      }
      else
      {
        switch(v15)
        {
          case 8193:
          case 8195:
          case 8197:
            v16 = 3;
            break;
          case 8194:
          case 8196:
          case 8198:
            v16 = 2;
            break;
          default:
            goto LABEL_15;
        }
      }
      goto LABEL_15;
    }
  }
  else
  {
    v7[90] = CGImageGetBitmapInfo(0);
  }
  v16 = 1;
LABEL_15:
  v7[91] = v16;
  result = -[CIRedEyeRepair initWithDeskView:andFrame:](self, "initWithDeskView:andFrame:", 0, v7);
  result->ownLF = 1;
  return result;
}

- (CGImage)createRepairedImage
{
  $E2FF20502B54F5B442CF0C89360BE755 *lf;
  int v4;
  char *v5;
  char *var0;
  int v7;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_fullNew;
  size_t v9;
  const __CFData *v10;
  CGDataProvider *v11;
  CGImage *v12;
  void *__dst[2];
  size_t __len[2];
  uint64_t v16;

  v16 = 0;
  *(_OWORD *)__dst = 0u;
  *(_OWORD *)__len = 0u;
  initBitmap((uint64_t)__dst, self->lf->var2.var1, self->lf->var2.var2, 4, 1, 100.0);
  lf = self->lf;
  if (HIDWORD(__len[0]) == lf->var2.var4)
  {
    memmove(__dst[0], lf->var2.var0, SLODWORD(__len[1]));
  }
  else if (SHIDWORD(__dst[1]) >= 1)
  {
    v4 = 0;
    v5 = (char *)__dst[0];
    var0 = lf->var2.var0;
    do
    {
      memmove(v5, var0, SHIDWORD(__len[1]) * (uint64_t)SLODWORD(__dst[1]) * (int)v16);
      ++v4;
      var0 += self->lf->var2.var4;
      v5 += SHIDWORD(__len[0]);
    }
    while (v4 < SHIDWORD(__dst[1]));
  }
  if (self->nRepairs >= 1)
  {
    v7 = 0;
    p_fullNew = &self->repairs[0].fullNew;
    do
    {
      copyBitmapToSliceOfBitmap((int *)p_fullNew, (uint64_t)__dst, (uint64_t)p_fullNew[1].baseAddress, *(_QWORD *)&p_fullNew[1].width);
      ++v7;
      p_fullNew += 10;
    }
    while (v7 < self->nRepairs);
  }
  v9 = SHIDWORD(__len[0]);
  v10 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)__dst[0], SHIDWORD(__dst[1]) * (uint64_t)SHIDWORD(__len[0]), (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  v11 = CGDataProviderCreateWithCFData(v10);
  CFRelease(v10);
  v12 = CGImageCreate(SLODWORD(__dst[1]), SHIDWORD(__dst[1]), 8uLL, 0x20uLL, v9, self->lf->var6, self->lf->var7, v11, 0, 1, kCGRenderingIntentDefault);
  CGDataProviderRelease(v11);
  return v12;
}

- (void)repairExternalBuffer
{
  int v3;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_fullNew;

  if (self->imageSourceType == 3 && self->nRepairs >= 1)
  {
    v3 = 0;
    p_fullNew = &self->repairs[0].fullNew;
    do
    {
      copyBitmapToSliceOfBitmap((int *)p_fullNew, (uint64_t)&self->lf->var2, (uint64_t)p_fullNew[1].baseAddress, *(_QWORD *)&p_fullNew[1].width);
      ++v3;
      p_fullNew += 10;
    }
    while (v3 < self->nRepairs);
  }
}

- (CIRedEyeRepair)initWithIOSurface:(__IOSurface *)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 cameraModel:(id)a6
{
  _DWORD *v11;
  int Width;
  int Height;
  int BytesPerRow;
  void *BaseAddress;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CIRedEyeRepair *result;

  v11 = zcalloc(1uLL, 0x180uLL);
  Width = IOSurfaceGetWidth(a3);
  Height = IOSurfaceGetHeight(a3);
  BytesPerRow = IOSurfaceGetBytesPerRow(a3);
  BaseAddress = IOSurfaceGetBaseAddress(a3);
  if (a4 == 266)
  {
    v16 = 2;
  }
  else
  {
    if (a4 != 264)
      goto LABEL_6;
    v16 = 1;
  }
  v11[91] = v16;
LABEL_6:
  v11[92] = 1;
  *((_BYTE *)v11 + 372) = 0;
  if (objc_msgSend(a6, "hasPrefix:", CFSTR("iPhone")))
    *((_BYTE *)v11 + 372) = 1;
  v11[94] = 1101004800;
  constructBitmap((uint64_t)(v11 + 72), (uint64_t)BaseAddress, Width, Height, 4, 1, BytesPerRow, 100.0);
  v17 = v11[74];
  v11[82] = v17;
  v18 = v11[75];
  v11[83] = v18;
  *((_QWORD *)v11 + 42) = makeBitmapRect(0, 0, v17, v18);
  *((_QWORD *)v11 + 43) = v19;
  *((_QWORD *)v11 + 44) = CGColorSpaceRetain(a5);
  v11[90] = 8194;
  self->imageSourceType = 4;
  result = -[CIRedEyeRepair initWithDeskView:andFrame:](self, "initWithDeskView:andFrame:", 0, v11);
  result->ownLF = 1;
  return result;
}

- (void)initializeNonDebugVariables
{
  *(_WORD *)&self->debugRedEye = 0;
  self->redEyeThresholdKind = 0;
  *(_WORD *)&self->renderAlpha = 257;
  self->renderSpecularShine = 1;
  *(_QWORD *)&self->specularSize = 0x3DCCCCCD3E0F5C29;
  *(_WORD *)&self->pupilShadeAlignment = 256;
  bzero(self->repairs, 0x3200uLL);
  *(_QWORD *)&self->nRepairs = 0;
  self->lastRepairTag = -1;
  self->standardTemplate = ($23B68B56AE60DB485D301CEA5A0411BF)xmmword_192499DF0;
  -[CIRedEyeRepair skinInit](self, "skinInit");
}

- (CIRedEyeRepair)initWithDeskView:(id)a3 andFrame:(id *)a4
{
  objc_super v6;

  self->lf = a4;
  self->ownLF = 0;
  -[CIRedEyeRepair initializeNonDebugVariables](self, "initializeNonDebugVariables", a3);
  v6.receiver = self;
  v6.super_class = (Class)CIRedEyeRepair;
  return -[CIRedEyeRepair init](&v6, sel_init);
}

- (CIRedEyeRepair)initWithFrameExternalBuffer:(id *)a3
{
  objc_super v5;

  self->lf = a3;
  self->ownLF = 1;
  self->imageSourceType = 3;
  -[CIRedEyeRepair initializeNonDebugVariables](self, "initializeNonDebugVariables");
  v5.receiver = self;
  v5.super_class = (Class)CIRedEyeRepair;
  return -[CIRedEyeRepair init](&v5, sel_init);
}

- (CIRedEyeRepair)initWithExternalBuffer:(char *)a3 size:(CGSize)a4 rowBytes:(unint64_t)a5
{
  int v5;
  double height;
  double width;
  _DWORD *v10;
  float v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v10 = zcalloc(1uLL, 0x180uLL);
  v11 = width;
  v12 = (uint64_t)rintf(v11);
  v13 = height;
  v14 = (uint64_t)rintf(v13);
  constructBitmap((uint64_t)(v10 + 72), (uint64_t)a3, v12, v14, 4, 1, v5, 100.0);
  v10[82] = v12;
  v10[83] = v14;
  *((_QWORD *)v10 + 42) = makeBitmapRect(0, 0, v12, v14);
  *((_QWORD *)v10 + 43) = v15;
  *((_QWORD *)v10 + 44) = 0;
  *((_QWORD *)v10 + 45) = 0;
  v10[92] = 1;
  *((_BYTE *)v10 + 372) = 0;
  v10[94] = 1101004800;
  return -[CIRedEyeRepair initWithFrameExternalBuffer:](self, "initWithFrameExternalBuffer:", v10);
}

- (CIRedEyeRepair)initWithExternalBuffer:(char *)a3 subRectangle:(CGRect)a4 fullSize:(CGSize)a5 rowBytes:(unint64_t)a6 cameraModel:(id)a7
{
  int v8;
  double height;
  double width;
  double v11;
  double v12;
  double y;
  double x;
  char *v17;
  float v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  float v26;
  uint64_t v27;
  float v28;
  float v29;
  uint64_t v30;

  v8 = a6;
  height = a5.height;
  width = a5.width;
  v11 = a4.size.height;
  v12 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = (char *)zcalloc(1uLL, 0x180uLL);
  v18 = v12;
  v19 = (uint64_t)rintf(v18);
  v20 = v11;
  v21 = (uint64_t)rintf(v20);
  v22 = x;
  v23 = (uint64_t)rintf(v22);
  v24 = y;
  v25 = (uint64_t)rintf(v24);
  v26 = width;
  v27 = (uint64_t)rintf(v26);
  v28 = height;
  v29 = rintf(v28);
  *((_DWORD *)v17 + 82) = v27;
  *((_DWORD *)v17 + 83) = (uint64_t)v29;
  *((_QWORD *)v17 + 42) = makeBitmapRect(v23, (uint64_t)v29 - (v21 + v25), (v23 + v19), (uint64_t)v29 - v25);
  *((_QWORD *)v17 + 43) = v30;
  constructBitmap((uint64_t)(v17 + 288), (uint64_t)a3, v19, v21, 4, 1, v8, 100.0);
  *((_QWORD *)v17 + 44) = 0;
  *((_DWORD *)v17 + 90) = 0;
  v17[372] = 0;
  if (objc_msgSend(a7, "hasPrefix:", CFSTR("iPhone")))
    v17[372] = 1;
  *(_QWORD *)(v17 + 364) = 0x100000001;
  *((_DWORD *)v17 + 94) = 1101004800;
  return -[CIRedEyeRepair initWithFrameExternalBuffer:](self, "initWithFrameExternalBuffer:", v17);
}

- (void)dealloc
{
  int imageSourceType;
  CGColorSpace *var6;
  void *releaseMe;
  int v6;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_fullNew;
  $F19D4DADCC5A4AF414AA3A0637C491CF *lastClickCbCrBitmaps;
  uint64_t v9;
  objc_super v10;

  if (self->ownLF)
  {
    imageSourceType = self->imageSourceType;
    if (imageSourceType == 2)
    {
      CFRelease(self->dataRef);
    }
    else if (!imageSourceType)
    {
      CGImageBlockSetRelease();
    }
    var6 = self->lf->var6;
    if (var6)
      CFRelease(var6);
    releaseMe = self->releaseMe;
    if (releaseMe)
      CFRelease(releaseMe);
  }
  if (self->nRepairs >= 1)
  {
    v6 = 0;
    p_fullNew = &self->repairs[0].fullNew;
    do
    {
      termBitmap((void **)&p_fullNew->baseAddress);
      ++v6;
      p_fullNew += 10;
    }
    while (v6 < self->nRepairs);
  }

  termBitmap((void **)&self->lastClickYBitmap.baseAddress);
  termBitmap((void **)&self->lastClickCbCrBitmap.baseAddress);
  lastClickCbCrBitmaps = self->lastClickCbCrBitmaps;
  v9 = 3;
  do
  {
    termBitmap((void **)&lastClickCbCrBitmaps[-3].baseAddress);
    termBitmap((void **)&lastClickCbCrBitmaps->baseAddress);
    ++lastClickCbCrBitmaps;
    --v9;
  }
  while (v9);
  termBitmap((void **)&self->lastSearchYBitmap.baseAddress);
  termBitmap((void **)&self->lastSearchCbCrBitmap.baseAddress);
  if (self->ownLF)
    zfree(self->lf);
  v10.receiver = self;
  v10.super_class = (Class)CIRedEyeRepair;
  -[CIRedEyeRepair dealloc](&v10, sel_dealloc);
}

- (BOOL)debug
{
  return self->debugRedEye;
}

- (void)setDebug:(BOOL)a3
{
  self->debugRedEye = a3;
}

- (BOOL)logRepairs
{
  return self->logRepairs;
}

- (void)setLogRepairs:(BOOL)a3
{
  self->logRepairs = a3;
}

- (int)redEyeThresholdKind
{
  return self->redEyeThresholdKind;
}

- (void)setRedEyeThresholdKind:(int)a3
{
  self->redEyeThresholdKind = a3;
}

- (BOOL)renderAlpha
{
  return self->renderAlpha;
}

- (void)setRenderAlpha:(BOOL)a3
{
  self->renderAlpha = a3;
}

- (BOOL)infillBackground
{
  return self->infillBackground;
}

- (void)setInfillBackground:(BOOL)a3
{
  self->infillBackground = a3;
}

- (BOOL)renderSpecularShine
{
  return self->renderSpecularShine;
}

- (void)setRenderSpecularShine:(BOOL)a3
{
  self->renderSpecularShine = a3;
}

- (float)specularSize
{
  return self->specularSize;
}

- (void)setSpecularSize:(float)a3
{
  self->specularSize = a3;
}

- (float)specularSoftness
{
  return self->specularSoftness;
}

- (void)setSpecularSoftness:(float)a3
{
  self->specularSoftness = a3;
}

- (BOOL)pupilShadeAlignment
{
  return self->pupilShadeAlignment;
}

- (void)setPupilShadeAlignment:(BOOL)a3
{
  self->pupilShadeAlignment = a3;
}

- (BOOL)autoPupilTonality
{
  return self->autoPupilTonality;
}

- (void)setAutoPupilTonality:(BOOL)a3
{
  self->autoPupilTonality = a3;
}

- (BOOL)forceLoValue
{
  return self->forceLoValue;
}

- (void)setForceLoValue:(BOOL)a3
{
  self->forceLoValue = a3;
}

- (int)loValue
{
  return self->loValue;
}

- (void)setLoValue:(int)a3
{
  self->loValue = a3;
}

- ($A3B2E143E1A03423F9FC703C010436DC)standardTemplate
{
  uint64_t v2;
  uint64_t v3;
  $A3B2E143E1A03423F9FC703C010436DC result;

  v2 = *(_QWORD *)&self->standardTemplate.hi;
  v3 = *(_QWORD *)&self->standardTemplate.lo;
  result.var2 = v2;
  result.var3 = HIDWORD(v2);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (id)faces
{
  return self->faces;
}

- ($C04FE35337BD29DDDAFD1199A2395F85)repairs
{
  return ($C04FE35337BD29DDDAFD1199A2395F85 *)self->repairs;
}

- (int)nRepairs
{
  return self->nRepairs;
}

- (int)lastRepairTag
{
  return self->lastRepairTag;
}

- (int)format
{
  return self->lf->var8;
}

- (void)undoRepair:(int)a3
{
  CIRedEyeRepair *v4;
  CIRedEyeRepair *v5;
  unint64_t v6;
  int v7;
  uint64_t nRepairs;
  uint64_t v9;
  $DB57DEDA407727419883F88D36A7C81C *v10;
  uint64_t v11;

  v4 = -[CIRedEyeRepair repairWithTag:](self, "repairWithTag:", *(_QWORD *)&a3);
  if (v4)
  {
    v5 = v4;
    v6 = 0x8F5C28F5C28F5C29 * (((char *)v4 - (char *)self->repairs) >> 4);
    termBitmap(&v4->releaseMe);
    *(_OWORD *)&v5->repairs[0].data.CR.mincol = 0u;
    *(_OWORD *)&v5->repairs[0].BI.centroid.y = 0u;
    *(_OWORD *)&v5->repairs[0].data.O.N90 = 0u;
    *(_OWORD *)&v5->repairs[0].data.O.halfDiagonalSize = 0u;
    *(_OWORD *)&v5->repairs[0].data.IOD = 0u;
    *(_OWORD *)&v5->repairs[0].data.O.bproc = 0u;
    *(_OWORD *)&v5->repairs[0].data.mTemplate.average = 0u;
    *(_OWORD *)&v5->repairs[0].data.existingTemplate.average = 0u;
    *(_OWORD *)&v5->repairs[0].data.bitmaskThreshold = 0u;
    *(_OWORD *)&v5->repairs[0].data.align = 0u;
    *(_OWORD *)&v5->repairs[0].left = 0u;
    *(_OWORD *)&v5->repairs[0].data.snapHitX = 0u;
    *(_OWORD *)&v5->repairs[0].psTemplate.hi = 0u;
    *(_OWORD *)&v5->repairs[0].matchingTemplate.med = 0u;
    *(_OWORD *)&v5->repairs[0].fullNew.bytesPerSample = 0u;
    *(_OWORD *)&v5->repairs[0].YR.mincol = 0u;
    *(_OWORD *)&v5->repairs[0].fullNew.baseAddress = 0u;
    *(_OWORD *)&v5->repairs[0].fullNew.rowSamples = 0u;
    v5->repairs[0].pt2 = 0u;
    *(_OWORD *)&v5->repairs[0].eyeCase = 0u;
    *(_OWORD *)&v5->dataRef = 0u;
    *(_OWORD *)&v5->nRepairs = 0u;
    *(_OWORD *)&v5->lf = 0u;
    *(_OWORD *)&v5->blockSet = 0u;
    *(_OWORD *)&v5->super.isa = 0u;
    v7 = v6 + 1;
    LODWORD(nRepairs) = self->nRepairs;
    if ((int)v6 + 1 < (int)nRepairs)
    {
      v9 = v7;
      v10 = &self->repairs[v7];
      do
      {
        v11 = v9;
        memcpy(&self->repairs[(int)v6], v10, sizeof(self->repairs[(int)v6]));
        v9 = v11 + 1;
        nRepairs = self->nRepairs;
        ++v10;
        LODWORD(v6) = v11;
      }
      while (v11 + 1 < nRepairs);
    }
    self->nRepairs = nRepairs - 1;
  }
}

- (int)averageValueFromY:(id *)a3 withinSkinMask:(id *)a4 butOutsideAlpha:(id *)a5
{
  float v5;
  int var2;
  int v7;
  int v8;
  char *var0;
  char *v10;
  char *v11;
  uint64_t var6;
  uint64_t var3;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  int var1;
  int v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v25;

  var2 = a3->var2;
  if (var2 < 1)
    goto LABEL_15;
  v7 = 0;
  v8 = 0;
  var0 = a5->var0;
  v10 = a4->var0;
  v11 = a3->var0;
  var6 = a5->var6;
  var3 = a5->var3;
  v14 = a4->var6;
  v15 = a4->var3;
  v16 = a3->var6;
  v17 = a3->var3;
  v18 = 0.0;
  var1 = a3->var1;
  do
  {
    if (var1 >= 1)
    {
      v20 = var1;
      v21 = var0;
      v22 = v10;
      v23 = v11;
      do
      {
        if (*v22 >= 0x33u && *v21 == 0)
        {
          LOBYTE(v5) = *v23;
          v5 = (float)LODWORD(v5);
          v18 = v18 + v5;
          ++v7;
        }
        v23 += v16;
        v22 += v14;
        v21 += var6;
        --v20;
      }
      while (v20);
    }
    ++v8;
    v11 += v17;
    v10 += v15;
    var0 += var3;
  }
  while (v8 != var2);
  if (v7)
    return (uint64_t)rintf(v18 / (float)v7);
  else
LABEL_15:
    LODWORD(v25) = -1;
  return v25;
}

- (float)upperRepairSizeFraction:(float)a3
{
  if (self->lf->var10)
    return 0.136;
  else
    return 25.0 / (a3 + 20.0) + 0.13;
}

- (float)lowerRepairSizeFraction:(float)a3
{
  if (self->lf->var10)
  else
    return 1.0 / (a3 + -20.0) + 0.08;
}

+ (float)upperRepairDistanceFraction:(float)a3
{
  int v4;
  float result;
  float v6;
  int v7;

  v4 = CI_DISABLE_REDEYE_SEARCH();
  result = 0.0;
  if (v4 != 1)
  {
    v6 = 50.0 / (a3 + 150.0) + 0.08;
    v7 = CI_DISABLE_REDEYE_SEARCH();
    result = v6 * 0.5;
    if (v7 != 2)
      return v6;
  }
  return result;
}

+ (float)upperRepairDistance:(float)a3
{
  int v4;
  float result;
  float v6;
  int v7;

  v4 = CI_DISABLE_REDEYE_SEARCH();
  result = 0.0;
  if (v4 != 1)
  {
    v6 = (50.0 / (a3 + 150.0) + 0.08) * a3;
    v7 = CI_DISABLE_REDEYE_SEARCH();
    result = v6 * 0.5;
    if (v7 != 2)
      return v6;
  }
  return result;
}

- (float)upperRepairSize:(float)a3
{
  float v4;

  -[CIRedEyeRepair upperRepairSizeFraction:](self, "upperRepairSizeFraction:");
  return v4 * a3;
}

- (float)lowerRepairSize:(float)a3
{
  float v4;

  -[CIRedEyeRepair lowerRepairSizeFraction:](self, "lowerRepairSizeFraction:");
  return v4 * a3;
}

+ (CGRect)supportRectangleWithPoint:(CGPoint)a3 imageSize:(CGSize)a4 IOD:(float)a5
{
  double height;
  double width;
  float x;
  uint64_t v8;
  float y;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = a4.height;
  width = a4.width;
  x = a3.x;
  v8 = (uint64_t)rintf(x);
  y = a3.y;
  alignedBitmapRectAroundPoint(v8, (uint64_t)rintf(y), 0x2Au);
  v12 = HIDWORD(v10);
  v13 = width;
  v14 = (uint64_t)rintf(v13);
  v15 = height;
  v16 = (uint64_t)rintf(v15);
  v17 = v11 & 0xFFFFFFFF00000000;
  if ((v11 & 0x80000000) == 0)
    v17 = v11;
  if ((int)v14 >= SHIDWORD(v17))
    v18 = v17;
  else
    v18 = v17 | ((unint64_t)v14 << 32);
  v19 = v10 & ~((int)v10 >> 31);
  v20 = (double)(int)v18;
  v21 = (double)v19;
  if ((int)v16 < SHIDWORD(v10))
    LODWORD(v12) = v16;
  v22 = (double)(HIDWORD(v18) - (int)v18);
  v23 = (double)((int)v12 - v19);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (CGRect)supportRectangleWithRepair:(id)a3 imageSize:(CGSize)a4
{
  float height;
  float v6;
  float width;
  float v8;
  float v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a4.height;
  v6 = (float)(uint64_t)rintf(height);
  width = a4.width;
  v8 = (float)(uint64_t)rintf(width);
  objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("searchRectangleMinimumY")), "floatValue");
  v10 = (uint64_t)rintf(v9 * v6);
  objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("searchRectangleMaximumY")), "floatValue");
  v12 = (uint64_t)rintf(v11 * v6);
  objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("searchRectangleMinimumX")), "floatValue");
  v14 = (uint64_t)rintf(v13 * v8);
  objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("searchRectangleMaximumX")), "floatValue");
  v16 = (uint64_t)rintf(v15 * v8);
  v17 = (double)(int)v14;
  v18 = (double)((int)v12 + 1);
  v19 = (double)((int)v16 - (int)v14);
  v20 = (double)((int)v10 - (int)v12);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

+ (CGRect)supportRectangleWithFaceArray:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unint64_t BitmapRect;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  float v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  float v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  signed int v46;
  void *v47;
  unsigned int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  unsigned int v52;
  signed int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  signed int v58;
  signed int v59;
  float v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  float v74;
  float v75;
  double v76;
  double v77;
  int v78;
  int v79;
  uint64_t v81;
  int v82;
  uint64_t v83;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
  double v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  int v95;
  int v96;
  int v97;
  uint64_t v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v7 = objc_msgSend(a3, "count");
  v103 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  if (v7 < 1)
  {
LABEL_28:
    v29 = objc_msgSend(v103, "count");
    BitmapRect = makeBitmapRect(1000000, 0xF4240u, 4293967296, 4293967296);
    v32 = v31;
    LODWORD(v33) = BitmapRect;
    v34 = HIDWORD(BitmapRect);
    v35 = height;
    v93 = (uint64_t)rintf(v35);
    if (v29 < 1)
    {
LABEL_70:
      v88 = (double)(int)v32;
      v89 = (double)((int)v93 - (int)v34);
      v90 = (double)(HIDWORD(v32) - (int)v32);
      v91 = (double)((int)v34 - (int)v33);
      goto LABEL_71;
    }
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = width;
    v92 = (uint64_t)rintf(v39);
    v40 = v29;
    v98 = v29;
    while (1)
    {
      v41 = (void *)objc_msgSend(v103, "objectAtIndex:", v36);
      if (v36 <= 0x1F)
      {
        v43 = v41;
        v99 = v33;
        v101 = v32;
        v44 = (void *)objc_msgSend(v41, "valueForKey:", CFSTR("leftEyeX"));
        v45 = objc_msgSend(v43, "valueForKey:", CFSTR("leftEyeY"));
        v46 = 0;
        v42 = 1;
        if (v44)
        {
          v47 = (void *)v45;
          v48 = 0;
          if (v45)
          {
            v48 = objc_msgSend(v44, "intValue");
            v46 = objc_msgSend(v47, "intValue");
            v42 = v37;
          }
        }
        else
        {
          v48 = 0;
        }
        v49 = (void *)objc_msgSend(v43, "valueForKey:", CFSTR("rightEyeX"));
        v50 = objc_msgSend(v43, "valueForKey:", CFSTR("rightEyeY"));
        if (!v49)
          goto LABEL_40;
        v51 = (void *)v50;
        if (!v50)
          goto LABEL_40;
        v52 = objc_msgSend(v49, "intValue");
        v53 = objc_msgSend(v51, "intValue");
        if (((v42 | v38) & 1) == 0)
        {
          objc_msgSend((id)objc_msgSend(v43, "valueForKey:", CFSTR("mouthCenterX")), "intValue");
          v97 = objc_msgSend((id)objc_msgSend(v43, "valueForKey:", CFSTR("mouthCenterY")), "intValue");
          objc_msgSend((id)objc_msgSend(v43, "valueForKey:", CFSTR("centerX")), "intValue");
          v94 = objc_msgSend((id)objc_msgSend(v43, "valueForKey:", CFSTR("centerY")), "intValue");
          if (v46 >= v53)
            v58 = v53;
          else
            v58 = v46;
          if (v46 <= v53)
            v59 = v53;
          else
            v59 = v46;
          v95 = v58;
          v96 = v59;
          *(float *)&v57 = sqrtf((float)(int)((v48 - v52) * (v48 - v52) + (v46 - v53) * (v46 - v53)));
          +[CIRedEyeRepair upperRepairDistance:](CIRedEyeRepair, "upperRepairDistance:", v57);
          v61 = (uint64_t)rintf(v60);
          alignedBitmapRectAroundPoint(v48, v46, v61);
          v64 = clipBitmapRectToWidthAndHeight(v62, v63, v92, v93);
          v65 = evenBitmapRect(v64);
          v102 = unionBitmapRects(v99 | (v34 << 32), v101, (v65 & 0xFFFFFFFF00000000 | (v65 - 84)) + 0x5600000000);
          v67 = v66;
          alignedBitmapRectAroundPoint(v52, v53, v61);
          v70 = clipBitmapRectToWidthAndHeight(v68, v69, v92, v93);
          v71 = evenBitmapRect(v70);
          v72 = unionBitmapRects(v102, v67, (v71 & 0xFFFFFFFF00000000 | (v71 - 84)) + 0x5600000000);
          v74 = (float)(v53 - v46);
          v75 = sqrtf((float)(v74 * v74) + (float)((float)(int)(v52 - v48) * (float)(int)(v52 - v48)));
          v76 = (double)(v94 + v97);
          v77 = v75 * 0.5 * (float)(v74 / v75);
          v78 = (int)(v77 + v76 * 0.5);
          if (v95 >= v78)
            v79 = (int)(v77 + v76 * 0.5);
          else
            v79 = v95;
          if (v96 <= v78 && v95 <= v78)
            LODWORD(v81) = v78 + 1;
          else
            LODWORD(v81) = v96;
          v82 = (int)-(v77 - v76 * 0.5);
          if (v79 >= v82)
            v83 = v82;
          else
            v83 = v79;
          if ((int)v81 <= v82 && v79 <= v82)
            v81 = (v82 + 1);
          else
            v81 = v81;
          v85 = unionBitmapRects(v72, v73, v83 | (v81 << 32));
          v32 = v86;
          v38 = 0;
          v42 = 0;
          LODWORD(v33) = v85;
          v34 = HIDWORD(v85);
          v40 = v98;
          goto LABEL_67;
        }
        if ((v38 & 1) == 0)
        {
          alignedBitmapRectAroundPoint(v52, v53, 0x55u);
          v55 = v87;
          v38 = 0;
        }
        else
        {
LABEL_40:
          alignedBitmapRectAroundPoint(v48, v46, 0x55u);
          v55 = v54;
          v38 = 1;
        }
        v40 = v98;
        v33 = unionBitmapRects(v99 | (v34 << 32), v101, v55);
        v32 = v56;
        v34 = HIDWORD(v33);
      }
      else
      {
        v42 = v37;
      }
LABEL_67:
      ++v36;
      v37 = v42;
      if (v40 == v36)
        goto LABEL_70;
    }
  }
  v8 = 0;
  v100 = v7;
  while (1)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(a3, "objectAtIndex:", v8));
    objc_msgSend(v103, "addObject:", v9);
    v10 = (void *)objc_msgSend(v9, "valueForKey:", CFSTR("leftEyeX"));
    v11 = objc_msgSend(v9, "valueForKey:", CFSTR("leftEyeY"));
    if (v10)
      v12 = v11 == 0;
    else
      v12 = 1;
    v13 = v12;
    if (v12)
    {
      v16 = 0;
      v15 = 0;
    }
    else
    {
      v14 = (void *)v11;
      v15 = objc_msgSend(v10, "intValue");
      v16 = objc_msgSend(v14, "intValue");
    }
    v17 = (void *)objc_msgSend(v9, "valueForKey:", CFSTR("rightEyeX"));
    v18 = objc_msgSend(v9, "valueForKey:", CFSTR("rightEyeY"));
    if (v17)
      v19 = v18 == 0;
    else
      v19 = 1;
    if (!v19)
    {
      v20 = (void *)v18;
      v21 = objc_msgSend(v17, "intValue");
      v22 = objc_msgSend(v20, "intValue");
      if ((v13 & 1) == 0)
      {
        v23 = v22;
        v24 = (void *)objc_msgSend(v9, "valueForKey:", CFSTR("centerX"));
        v25 = objc_msgSend(v9, "valueForKey:", CFSTR("centerY"));
        if (v24 && (v26 = (void *)v25) != 0)
        {
          LODWORD(v24) = objc_msgSend(v24, "intValue");
          LODWORD(v26) = objc_msgSend(v26, "intValue");
        }
        else
        {
          v24 = (void *)(uint64_t)rintf((float)((float)(v21 + v15) * 0.5) - (float)((float)(v23 - v16) * 0.5));
          v26 = (void *)(uint64_t)rintf((float)((float)(v21 - v15) * 0.5) + (float)((float)(v23 + v16) * 0.5));
          objc_msgSend(v9, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24), CFSTR("centerX"));
          objc_msgSend(v9, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26), CFSTR("centerY"));
        }
        v27 = objc_msgSend(v9, "valueForKey:", CFSTR("mouthCenterX"));
        v28 = objc_msgSend(v9, "valueForKey:", CFSTR("mouthCenterY"));
        if (!v27 || !v28)
        {
          objc_msgSend(v9, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (uint64_t)rintf((float)(int)v24 - (float)((float)(v23 - v16) * 0.5))), CFSTR("mouthCenterX"));
          objc_msgSend(v9, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (uint64_t)rintf((float)((float)(v21 - v15) * 0.5) + (float)(int)v26)), CFSTR("mouthCenterY"));
        }
      }
      goto LABEL_27;
    }
    if ((v13 & 1) != 0)
      break;
LABEL_27:
    if (v100 == ++v8)
      goto LABEL_28;
  }
  v88 = 0.0;
  v89 = 0.0;
  v90 = 0.0;
  v91 = 0.0;
LABEL_71:
  result.size.height = v91;
  result.size.width = v90;
  result.origin.y = v89;
  result.origin.x = v88;
  return result;
}

- (BOOL)computeTrimmedBitmaps:(id *)a3 newY:(id *)a4 newCbCr:(id *)a5 IR:(id)a6 newTrimY:(id *)a7 newTrimCbCr:(id *)a8 returningYR:(id *)a9 andCbCrR:(id *)a10
{
  uint64_t v10;
  uint64_t v11;
  $07A02DD24AF34610473D9D0940B06C4B *v12;
  int var1;
  int var3;
  int v16;
  int *p_mincol;
  uint64_t v18;
  int v19;
  int v20;
  int v22;
  int v23;
  $07A02DD24AF34610473D9D0940B06C4B *v24;
  _OWORD *v25;
  int v26;
  int v27;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_fullNew;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int8x8_t v45;
  unint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  int8x8_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  int v70;
  unint64_t v71;
  uint64_t v72;
  int v74;
  _OWORD v79[2];
  uint64_t v80;
  _OWORD v81[2];
  uint64_t v82;
  _OWORD v83[2];
  uint64_t v84;
  _OWORD v85[2];
  uint64_t v86;

  v10 = *(_QWORD *)&a6.var2;
  v11 = *(_QWORD *)&a6.var0;
  v12 = a5;
  v86 = 0;
  memset(v85, 0, sizeof(v85));
  var1 = a6.var1;
  var3 = a6.var3;
  v84 = 0;
  memset(v83, 0, sizeof(v83));
  v82 = 0;
  memset(v81, 0, sizeof(v81));
  v80 = 0;
  memset(v79, 0, sizeof(v79));
  if (self->nRepairs < 1)
  {
LABEL_9:
    v25 = v81;
    v24 = a3;
    constructSliceBitmap((uint64_t)a3, (uint64_t)v81, v11, v10);
    v26 = 0;
    v22 = var3 - v10;
    v23 = var1 - v11;
  }
  else
  {
    v16 = 0;
    p_mincol = &self->repairs[0].YR.mincol;
    while (1)
    {
      v18 = intersectBitmapRects(v11, v10, *((_QWORD *)p_mincol - 1));
      if (v20 > v19 && SHIDWORD(v18) > (int)v18)
        break;
      p_mincol += 100;
      if (++v16 >= self->nRepairs)
        goto LABEL_9;
    }
    v22 = var3 - v10;
    v23 = var1 - v11;
    v24 = a3;
    v25 = v79;
    v26 = 1;
    initBitmap((uint64_t)v79, v22, var1 - v11, 4, 1, a3->var8);
    copySliceOfBitmapToBitmap((int *)a3, (char **)v79, v11, v10);
    if (self->nRepairs >= 1)
    {
      v74 = v22;
      v27 = 0;
      p_fullNew = &self->repairs[0].fullNew;
      do
      {
        v29 = intersectBitmapRects(v11, v10, (uint64_t)p_fullNew[1].baseAddress);
        v31 = v29;
        v32 = v30;
        if (SHIDWORD(v30) > (int)v30 && SHIDWORD(v29) > (int)v29)
        {
          v34 = offsetBitmapRect(v29, v30, -p_fullNew[1].width, -LODWORD(p_fullNew[1].baseAddress));
          constructSliceBitmap((uint64_t)p_fullNew, (uint64_t)v81, v34, v35);
          v36 = offsetBitmapRect(v31, v32, -(int)v10, -(int)v11);
          copyBitmapToSliceOfBitmap((int *)v81, (uint64_t)v79, v36, v37);
        }
        ++v27;
        p_fullNew += 10;
      }
      while (v27 < self->nRepairs);
      v25 = v79;
      v26 = 1;
      v12 = a5;
      v24 = a3;
      v22 = v74;
    }
  }
  initBitmap((uint64_t)v85, v22, v23, 1, 1, v24->var8);
  if (v22 >= 0)
    v38 = v22;
  else
    v38 = v22 + 1;
  v39 = v38 >> 1;
  if (v23 >= 0)
    v40 = v23;
  else
    v40 = v23 + 1;
  initBitmap((uint64_t)v83, v39, v40 >> 1, 2, 1, v24->var8);
  ConvertREDEYEFORMATtoYCbCr(v25, (uint64_t *)v85, (uint64_t *)v83, self->lf->var8);
  if (v26)
    termBitmap((void **)v79);
  v46 = bitmapToBitmapDifferenceBitmapRect((uint64_t)a4, (uint64_t)v85, v41, v42, v43, v44, v45);
  v52 = bitmapToBitmapDifferenceBitmapRect((uint64_t)v12, (uint64_t)v83, v47, v48, v49, v50, v51);
  termBitmap((void **)v85);
  termBitmap((void **)v83);
  v53 = twiceBitmapRect(v52);
  v55 = v54;
  v56 = HIDWORD(v53);
  v57 = evenBitmapRect(v46);
  if ((_DWORD)v57 == HIDWORD(v57))
  {
    if ((_DWORD)v53 == HIDWORD(v53))
      return 0;
  }
  else
  {
    if ((int)v53 < SHIDWORD(v53))
      v57 = unionBitmapRects(v57, v58, v53);
    v55 = v58;
    v56 = HIDWORD(v57);
    LODWORD(v53) = v57;
  }
  v60 = v53 | (v56 << 32);
  v61 = halfBitmapRect(v60);
  v63 = v62;
  v64 = v56 - v53;
  v59 = 1;
  initBitmap((uint64_t)a7, HIDWORD(v55) - v55, v64, 1, 1, 100.0);
  initBitmap((uint64_t)a8, HIDWORD(v63) - v63, HIDWORD(v61) - v61, 2, 1, 50.0);
  copySliceOfBitmapToBitmap((int *)a4, &a7->var0, v60, v55);
  copySliceOfBitmapToBitmap((int *)a5, &a8->var0, v61, v63);
  v65 = offsetBitmapRect(v60, v55, v10, v11);
  v67 = v66;
  if ((int)v10 >= 0)
    v68 = v10;
  else
    v68 = v10 + 1;
  v69 = (v68 >> 1);
  if ((int)v11 >= 0)
    v70 = v11;
  else
    v70 = v11 + 1;
  v71 = offsetBitmapRect(v61, v63, v69, v70 >> 1);
  *(_QWORD *)&a9->var0 = v65;
  *(_QWORD *)&a9->var2 = v67;
  *(_QWORD *)&a10->var0 = v71;
  *(_QWORD *)&a10->var2 = v72;
  return v59;
}

- (BOOL)extractReusableAlignedBitmapsAroundPoint:(id *)a3 YR:(id)a4 subYBitmap:(id *)a5 subCbCrBitmap:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  int var1;
  int var3;
  uint64_t v13;
  unint64_t v14;
  int v15;
  _BOOL4 v17;
  uint64_t v18;
  int v19;
  $07A02DD24AF34610473D9D0940B06C4B *v20;
  int v21;
  int v22;
  int *p_mincol;
  uint64_t v24;
  int v25;
  int v26;
  int v28;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_fullNew;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  $07A02DD24AF34610473D9D0940B06C4B *v40;
  _OWORD v42[2];
  uint64_t v43;
  _OWORD v44[2];
  uint64_t v45;

  v8 = *(_QWORD *)&a4.var2;
  v9 = *(_QWORD *)&a4.var0;
  var1 = a4.var1;
  var3 = a4.var3;
  v14 = halfBitmapRect(*(uint64_t *)&a4.var0);
  v15 = var3 - v8;
  v17 = var3 > (int)v8 && var1 > (int)v9;
  if (!v17)
    return v17;
  v18 = v13;
  if (!a5->var0 || a5->var1 != v15 || a5->var2 != var1 - (_DWORD)v9)
  {
    termBitmap((void **)&a5->var0);
    initBitmap((uint64_t)a5, v15, var1 - v9, 1, 1, 100.0);
  }
  v40 = a6;
  if (a6->var0)
  {
    v19 = a6->var1;
    v20 = a6;
    v21 = HIDWORD(v18) - v18;
    if (__PAIR64__(v20->var2, v19) == __PAIR64__(HIDWORD(v14) - (int)v14, HIDWORD(v18) - (int)v18))
      goto LABEL_17;
  }
  else
  {
    v21 = HIDWORD(v18) - v18;
  }
  termBitmap((void **)&v40->var0);
  initBitmap((uint64_t)v40, v21, HIDWORD(v14) - v14, 2, 1, 50.0);
LABEL_17:
  v45 = 0;
  memset(v44, 0, sizeof(v44));
  memset(v42, 0, sizeof(v42));
  v43 = 0;
  if (self->nRepairs < 1)
  {
LABEL_25:
    constructSliceBitmap((uint64_t)a3, (uint64_t)v42, v9, v8);
    ConvertREDEYEFORMATtoYCbCr(v42, (uint64_t *)a5, (uint64_t *)v40, self->lf->var8);
  }
  else
  {
    v22 = 0;
    p_mincol = &self->repairs[0].YR.mincol;
    while (1)
    {
      v24 = intersectBitmapRects(v9, v8, *((_QWORD *)p_mincol - 1));
      if (v26 > v25 && SHIDWORD(v24) > (int)v24)
        break;
      p_mincol += 100;
      if (++v22 >= self->nRepairs)
        goto LABEL_25;
    }
    initBitmap((uint64_t)v44, v15, var1 - v9, 4, 1, a3->var8);
    copySliceOfBitmapToBitmap((int *)a3, (char **)v44, v9, v8);
    if (self->nRepairs >= 1)
    {
      v28 = 0;
      p_fullNew = &self->repairs[0].fullNew;
      do
      {
        v30 = intersectBitmapRects(v9, v8, (uint64_t)p_fullNew[1].baseAddress);
        v32 = v30;
        v33 = v31;
        if (SHIDWORD(v31) > (int)v31 && SHIDWORD(v30) > (int)v30)
        {
          v35 = offsetBitmapRect(v30, v31, -p_fullNew[1].width, -LODWORD(p_fullNew[1].baseAddress));
          constructSliceBitmap((uint64_t)p_fullNew, (uint64_t)v42, v35, v36);
          v37 = offsetBitmapRect(v32, v33, -(int)v8, -(int)v9);
          copyBitmapToSliceOfBitmap((int *)v42, (uint64_t)v44, v37, v38);
        }
        ++v28;
        p_fullNew += 10;
      }
      while (v28 < self->nRepairs);
    }
    ConvertREDEYEFORMATtoYCbCr(v44, (uint64_t *)a5, (uint64_t *)v40, self->lf->var8);
    termBitmap((void **)v44);
  }
  LOBYTE(v17) = 1;
  return v17;
}

- (int)redEyeRemovalWithPoint:(CGPoint)a3 alignPupilShades:(BOOL)a4 matching:(id)a5 force:(int)a6 IOD:(float)a7 tap:(BOOL)a8
{
  unsigned __int8 **v8;
  double v9;
  float v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  unsigned __int8 **v23;
  float v24;
  float v25;
  float v26;
  double v27;
  float v28;
  int32x2_t *v29;
  float32x2_t v30;
  int32x2_t v31;
  float v36;
  uint64_t v37;
  float v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int v43;
  unsigned __int8 **v44;
  unsigned __int8 **v45;
  void **v46;
  void **v47;
  void **v48;
  int v49;
  int v50;
  double v51;
  double *v52;
  int v53;
  unsigned __int8 **v54;
  int *v55;
  double *v56;
  float v57;
  uint64_t v58;
  float v59;
  uint64_t v60;
  int *v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  uint64_t v65;
  double v66;
  int *v67;
  int v68;
  int v69;
  void **v70;
  void **v71;
  unsigned __int8 **v72;
  unsigned __int8 **v73;
  uint64_t v74;
  int v75;
  void **v76;
  uint64_t v77;
  int v78;
  double *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  unsigned int v83;
  unsigned int v85;
  void **v86;
  int v87;
  double *v88;
  uint64_t v89;
  float v90;
  float v91;
  uint64_t v92;
  uint64_t v93;
  double *v94;
  double v95;
  float v96;
  uint64_t *v97;
  uint64_t v98;
  unint64_t v99;
  float v100;
  void **v101;
  const void **v102;
  float v103;
  uint64_t v104;
  float v105;
  void **v106;
  void **v107;
  int v108;
  void **v109;
  void **v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  int v115;
  BOOL v116;
  int v117;
  int v118;
  int v119;
  int v120;
  double *v121;
  int *v122;
  void **Alpha;
  int *v124;
  float v125;
  double *v126;
  int v127;
  int v128;
  uint64_t v129;
  int v130;
  int v131;
  int *v132;
  int v133;
  _BYTE *v134;
  unsigned __int8 **v135;
  int v136;
  float v137;
  int v138;
  float v139;
  uint64_t v140;
  uint64_t v141;
  float v142;
  int v143;
  float v144;
  uint64_t v145;
  int v146;
  unsigned int v147;
  unsigned int v148;
  int v149;
  int v150;
  float v151;
  int v152;
  void **v153;
  void **v154;
  void **v155;
  int v156;
  int v157;
  int v158;
  int v159;
  void **v160;
  void **v161;
  void **v162;
  int v163;
  int v164;
  unsigned __int8 **v165;
  _QWORD *v166;
  int v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  int v172;
  int v173;
  __int16 v174;
  __int128 v175;
  int v177;
  uint64_t v178;
  int v179;
  int v180;
  int v181;
  int v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  int v186;
  int v187;
  unsigned int v188;
  uint64_t v189;
  const void **v190;
  uint64_t v191;
  unsigned __int8 **v192;
  uint64_t v193;
  unsigned __int8 **v194;
  void **v195;
  unsigned __int8 **v196;
  int *v197;
  uint64_t v198;
  uint64_t v199;
  __int128 v200;
  __int16 v201;
  char v202;
  _OWORD v203[2];
  uint64_t v204;
  _OWORD v205[2];
  uint64_t v206;
  _OWORD v207[2];
  uint64_t v208;
  void *v209[2];
  __int128 v210;
  uint64_t v211;
  void *__dst[2];
  __int128 v213;
  uint64_t v214;
  _QWORD v215[2];
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  _OWORD v221[7];
  int v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  double v231;
  double v232;
  int v233[5];
  uint64_t v234;
  int v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  _OWORD v239[3];
  void **v240;
  void **v241;
  unsigned __int8 **v242;
  _DWORD v243[18];
  _OWORD v244[6];
  __int128 v245;
  uint64_t v246;

  v8 = (unsigned __int8 **)MEMORY[0x1E0C80A78](self, a2, a4, *(_QWORD *)&a5.var0, *(_QWORD *)&a5.var2, *(_QWORD *)&a6);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = v10;
  v19 = v18;
  v21 = v20;
  v22 = v9;
  v23 = v8;
  v246 = *MEMORY[0x1E0C80C00];
  v227 = 0;
  v201 = 0;
  v202 = 0;
  v200 = 0uLL;
  v24 = -1.0;
  v25 = -1.0;
  if (v10 != 0.0)
  {
    *(float *)&v9 = v10;
    objc_msgSend(v8, "lowerRepairSize:", v9);
    v25 = v26;
    *(float *)&v27 = v17;
    objc_msgSend(v23, "upperRepairSize:", v27);
    v24 = v28;
  }
  v219 = 0u;
  v220 = 0u;
  v218 = 0u;
  v29 = (int32x2_t *)v23[2];
  LODWORD(v219) = v29[46].i32[0];
  DWORD1(v219) = v29[47].i32[0];
  BYTE8(v219) = v29[46].i8[4];
  v30 = vcvt_f32_s32(v29[41]);
  v31.i32[0] = v29[43].i32[0];
  v31.i32[1] = v29[42].i32[0];
  __asm { FMOV            V3.2D, #0.5 }
  *(float32x2_t *)&v220 = vcvt_f32_f64(vmlaq_f64(vnegq_f64(vcvtq_f64_f32(vcvt_f32_s32(v31))), _Q3, vcvtq_f64_f32(v30)));
  *((float *)&v220 + 2) = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v30, v30).i32[1]), v30.f32[0], v30.f32[0])) * 0.5;
  v229 = v219;
  v230 = v220;
  v228 = 0u;
  v36 = v22;
  v37 = (uint64_t)rintf(v36);
  v38 = v21;
  v191 = (uint64_t)rintf(v38);
  alignedBitmapRectAroundPoint(v37, v191, 0x2Au);
  v41 = clipBitmapRectToBitmapBounds(v39, v40, (uint64_t)(v23[2] + 288));
  v43 = v42;
  v44 = v23 + 1616;
  v45 = v23 + 1621;
  v192 = v23;
  if (objc_msgSend(v23, "extractReusableAlignedBitmapsAroundPoint:YR:subYBitmap:subCbCrBitmap:", v23[2] + 288, v41, v42, v23 + 1616, v23 + 1621))
  {
    v241 = 0;
    v242 = 0;
    v46 = (void **)zmalloc(0x28uLL);
    v240 = v46;
    if (v46)
    {
      v47 = v46;
      computeRedChannel(v44, v45, (uint64_t)v46, 0);
      v242 = v44;
      v48 = (void **)zmalloc(0x28uLL);
      v241 = v48;
      if (v48)
      {
        v188 = v12;
        v186 = v19;
        v184 = v16;
        v185 = v14;
        v226 = 0;
        v225 = 0;
        v224 = 0;
        v223 = 0;
        v222 = 0;
        memset(v221, 0, sizeof(v221));
        v217 = 0uLL;
        v216 = 0uLL;
        v215[0] = 0;
        v215[1] = 0;
        *(_OWORD *)__dst = 0u;
        v213 = 0u;
        v214 = 0;
        v211 = 0;
        *(_OWORD *)v209 = 0u;
        v210 = 0u;
        v208 = 0;
        memset(v207, 0, sizeof(v207));
        v206 = 0;
        memset(v205, 0, sizeof(v205));
        memset(v203, 0, sizeof(v203));
        v204 = 0;
        v237 = 0;
        v236 = 0;
        v238 = 0;
        v195 = v48;
        computeRedChannel(v44, v45, (uint64_t)v48, 5);
        v49 = 0;
        v187 = v37;
        HIDWORD(v227) = 0;
        do
        {
          snapToPupil((unsigned __int8 **)(&v240)[v49], v37 - v43, v191 - v41, &v243[v49 + 15], &v243[v49 + 12], &v243[v49 + 9]);
          v50 = HIDWORD(v227);
          v51 = (double)(v243[SHIDWORD(v227) + 12] + (int)v41);
          v52 = (double *)&v239[SHIDWORD(v227)];
          *v52 = (double)(v243[SHIDWORD(v227) + 15] + v43);
          v52[1] = v51;
          v49 = v50 + 1;
          HIDWORD(v227) = v50 + 1;
        }
        while (v50 < 2);
        termBitmap(v47);
        zfree(v47);
        termBitmap(v195);
        zfree(v195);
        v53 = 0;
        v54 = v192;
        v55 = (int *)(v192 + 1658);
        HIDWORD(v227) = 0;
        v196 = v192 + 1628;
        v194 = v192 + 1643;
        while (1)
        {
          v56 = (double *)&v239[v53];
          v57 = *v56;
          v58 = (uint64_t)rintf(v57);
          v59 = v56[1];
          v60 = (uint64_t)rintf(v59);
          v61 = &v55[4 * v53];
          alignedBitmapRectAroundPoint(v58, v60, 0x2Au);
          *(_QWORD *)v61 = v62;
          *((_QWORD *)v61 + 1) = v63;
          v64 = &v55[4 * SHIDWORD(v227)];
          *(_QWORD *)v64 = clipBitmapRectToBitmapBounds(*(_QWORD *)v64, *((_QWORD *)v64 + 1), (uint64_t)(v192[2] + 288));
          *((_QWORD *)v64 + 1) = v65;
          if (!objc_msgSend(v192, "extractReusableAlignedBitmapsAroundPoint:YR:subYBitmap:subCbCrBitmap:", v192[2] + 288, *(_QWORD *)&v55[4 * SHIDWORD(v227)], *(_QWORD *)&v55[4 * SHIDWORD(v227) + 2], &v196[5 * SHIDWORD(v227)], &v194[5 * SHIDWORD(v227)]))return -1;
          v67 = &v55[4 * SHIDWORD(v227)];
          v68 = v67[2];
          v69 = *v67;
          if (HIDWORD(v227) == 2)
          {
            v70 = (void **)(v192 + 1638);
          }
          else
          {
            v71 = (void **)zmalloc(0x28uLL);
            if (!v71)
              return -1;
            v70 = v71;
            if (HIDWORD(v227) == 1)
            {
              v73 = v192 + 1648;
              v72 = v192 + 1633;
              v74 = (uint64_t)v70;
              v75 = 5;
              goto LABEL_17;
            }
            if (!HIDWORD(v227))
            {
              v73 = v192 + 1643;
              v72 = v192 + 1628;
              v74 = (uint64_t)v70;
              v75 = 0;
LABEL_17:
              computeRedChannel(v72, v73, v74, v75);
            }
          }
          *(float *)&v66 = v24;
          v76 = computeBitmask((uint64_t)v70, (int)v58 - v68, (int)v60 - v69, (uint64_t)&v218, (uint64_t)v221, SHIDWORD(v227), v25, v66, v17);
          v77 = SHIDWORD(v227);
          *(&v236 + SHIDWORD(v227)) = (uint64_t)v76;
          v78 = v221[0];
          v243[v77 + 6] = DWORD2(v221[6]);
          v243[v77 + 3] = HIDWORD(v221[6]);
          v243[v77] = v78;
          v79 = &v231 + 12 * (int)v77;
          v80 = *(_OWORD *)((char *)&v221[3] + 8);
          *((_OWORD *)v79 + 2) = *(_OWORD *)((char *)&v221[2] + 8);
          *((_OWORD *)v79 + 3) = v80;
          v81 = *(_OWORD *)((char *)&v221[5] + 8);
          *((_OWORD *)v79 + 4) = *(_OWORD *)((char *)&v221[4] + 8);
          *((_OWORD *)v79 + 5) = v81;
          v82 = *(_OWORD *)((char *)&v221[1] + 8);
          *(_OWORD *)v79 = *(_OWORD *)((char *)v221 + 8);
          *((_OWORD *)v79 + 1) = v82;
          (&v240)[v77] = v70;
          v53 = v77 + 1;
          HIDWORD(v227) = v77 + 1;
          if ((int)v77 >= 2)
          {
            HIDWORD(v224) = 0;
            if (v236)
            {
              v83 = examineBitmask(v196, v194, v236, (int *)&v224 + 1);
              if (v237)
                _ZF = 0;
              else
                _ZF = v83 == 2;
              if (_ZF)
                v85 = 1;
              else
                v85 = v83;
            }
            else
            {
              v85 = -1;
            }
            v87 = 0;
            HIDWORD(v227) = 0;
            do
            {
              if (!*(&v236 + v87))
              {
                v88 = &v231 + 12 * v87;
                *v88 = 0.0;
                v88[1] = 0.0;
                v88[2] = 0.0;
                *(_QWORD *)((char *)v88 + 36) = makeBitmapRect(0, 0, 0, 0);
                *(_QWORD *)((char *)v88 + 44) = v89;
                v54 = v192;
                v87 = HIDWORD(v227);
              }
              HIDWORD(v227) = v87 + 1;
              v116 = v87++ < 2;
            }
            while (v116);
            v90 = v22;
            v91 = v21;
            v92 = redEyeDiscernment(&v236, (uint64_t)&v231, v55, v12, v90, v91);
            v93 = v92;
            v177 = v85;
            if (v85 <= 5 && ((1 << v85) & 0x34) != 0)
            {
              if (v233[24 * (int)v92] < 2 * v235)
                v93 = 1;
              else
                v93 = v92;
            }
            v94 = (double *)&v239[(int)v93];
            v95 = v94[1];
            v96 = *v94;
            v97 = (uint64_t *)&v55[4 * (int)v93];
            v98 = v97[1];
            v193 = *v97;
            v99 = HIDWORD(*v97);
            v189 = (uint64_t)rintf(v96);
            v190 = (const void **)&v194[5 * (int)v93];
            v100 = v95;
            v183 = (uint64_t)rintf(v100);
            v101 = (&v240)[(int)v93];
            v180 = v243[(int)v93];
            v181 = v243[(int)v93 + 6];
            v182 = v243[(int)v93 + 3];
            if ((_DWORD)v93)
            {
              v102 = (const void **)&v196[5 * (int)v93];
              v178 = 0;
              v179 = 0;
            }
            else
            {
              v245 = 0u;
              memset(v244, 0, sizeof(v244));
              v103 = v231;
              v104 = (uint64_t)rintf(v103);
              v105 = v232;
              v102 = (const void **)v196;
              v106 = computeBitmask((uint64_t)v196, v104, (uint64_t)rintf(v105), (uint64_t)&v218, (uint64_t)v244, -1, v25, COERCE_DOUBLE(__PAIR64__(HIDWORD(v232), LODWORD(v24))), v17);
              v107 = v106;
              if (v106)
              {
                HIDWORD(v178) = DWORD2(v245) + v98;
                v179 = v244[0];
                v108 = HIDWORD(v245) + v193;
              }
              else
              {
                HIDWORD(v178) = v98;
                v179 = 0;
                v108 = v193;
              }
              LODWORD(v178) = v108;
              v109 = (void **)cornealReflectionBitmask((uint64_t)v106, (uint64_t)v101, v233[0]);
              if (v109)
              {
                v110 = v109;
                v111 = bitmaskBoundingBitmapRect((uint64_t)v109);
                v113 = intersectBitmapRects(v111, v112, v234);
                v116 = v115 <= v114 || SHIDWORD(v113) <= (int)v113;
                if (!v116)
                  infillChannelWithBitmask((uint64_t)v101, (uint64_t)v110);
                termBitmask(v110);
              }
              if (v107)
                termBitmask(v107);
            }
            v117 = v99 - v193;
            initBitmap((uint64_t)__dst, HIDWORD(v98) - v98, v99 - v193, 1, 1, 100.0);
            if (HIDWORD(v98) - (int)v98 >= 0)
              v118 = HIDWORD(v98) - v98;
            else
              v118 = HIDWORD(v98) - v98 + 1;
            v119 = v118 >> 1;
            if (v117 >= 0)
              v120 = v99 - v193;
            else
              v120 = v117 + 1;
            initBitmap((uint64_t)v209, v119, v120 >> 1, 2, 1, 100.0);
            memmove(__dst[0], *v102, SLODWORD(v196[5 * (int)v93 + 3]));
            memmove(v209[0], *v190, SLODWORD(v194[5 * (int)v93 + 3]));
            v121 = &v231 + 12 * (int)v93;
            v122 = computePupilAlphaMap((uint64_t)v101, v93, *((_DWORD *)v121 + 4), (uint64_t)&v218, (_DWORD *)&v226 + 1, &v226);
            if (v122)
            {
              Alpha = (void **)v122;
              computeBorderForAlpha((uint64_t)v101, (uint64_t)v122, v244, (int *)&v227);
            }
            else
            {
              Alpha = extractAlpha((uint64_t)v101, *(&v236 + (int)v93), v244, (int *)&v227);
              if (!Alpha)
              {
                v152 = 0;
                HIDWORD(v227) = 0;
                do
                {
                  v153 = (void **)*(&v236 + v152);
                  if (v153)
                  {
                    termBitmask(v153);
                    v152 = HIDWORD(v227);
                  }
                  HIDWORD(v227) = v152 + 1;
                  v116 = v152++ < 2;
                }
                while (v116);
                v154 = v240;
                termBitmap(v240);
                zfree(v154);
                v155 = v241;
                termBitmap(v241);
                zfree(v155);
                HIDWORD(v227) = 3;
                termBitmap(__dst);
                termBitmap(v209);
                return -1;
              }
            }
            featheredOutsize((uint64_t)Alpha, (_DWORD *)&v225 + 1, &v225, 2.0, 0.25, 2.0);
            v217 = *((_OWORD *)v54 + 805);
            if (v93 > 1)
            {
              v200 = *((_OWORD *)v54 + 805);
              v124 = (int *)v102;
              if ((_DWORD)v93 == 2)
                goto LABEL_66;
              LODWORD(v129) = 0;
              v130 = v93;
            }
            else
            {
              v124 = (int *)v102;
              examineAlpha((unsigned __int8 **)v102, (unsigned __int8 **)v190, (char **)Alpha, &v217, (float *)&v224, (float *)&v223 + 1, &v223, (float *)&v222);
              v125 = *(float *)&v224;
              v126 = &v231 + 12 * (int)v93;
              v127 = HIDWORD(v223);
              *((_DWORD *)v126 + 19) = v224;
              *((_DWORD *)v126 + 20) = v127;
              v128 = v222;
              *((_DWORD *)v126 + 21) = v223;
              *((_DWORD *)v126 + 22) = v128;
              if (v125 < 3.26)
              {
                v200 = v217;
LABEL_70:
                v134 = zmalloc(0x200uLL);
                if ((_DWORD)v93 == 1 || v186)
                {
                  v144 = (float)(int)v217 * 0.3359 + (float)(int)v184 * 0.6641;
                  v145 = (uint64_t)rintf(v144);
                  v146 = v145 & ~((int)v145 >> 31);
                  if ((int)v185 - (int)v184 + (int)v145 >= 255)
                    v147 = 255;
                  else
                    v147 = v185 - v184 + v145;
                  if (*((_BYTE *)v54 + 12922))
                  {
                    v148 = v147 - v146;
                    v149 = *((_DWORD *)v54 + 3231);
                    v150 = v148 + v149;
                    v146 = v149 & ~(v149 >> 31);
                    if (v150 >= 255)
                      v147 = 255;
                    else
                      v147 = v150;
                  }
                  v133 = v181;
                  v151 = rintf((float)v146+ (float)((float)(int)(v147 - v146)* (float)((float)(DWORD1(v217) - v217) / (float)(DWORD2(v217) - v217))));
                  if (v177 >= 2 && SHIDWORD(v224) >= 1)
                    DWORD1(v217) = 32 * HIDWORD(v224);
                  buildTransferTable(v217, *((uint64_t *)&v217 + 1), v146 | (unint64_t)((uint64_t)v151 << 32), v185 & 0xFFFFFFFF00000000 | v147, (uint64_t)v134);
                  LODWORD(v129) = 0;
                }
                else
                {
                  LODWORD(v129) = 40;
                  v135 = &v196[5 * (int)v93];
                  initBitmap((uint64_t)v203, *((_DWORD *)v135 + 2), *((_DWORD *)v135 + 3), *((_DWORD *)v135 + 7), *((_DWORD *)v135 + 8), *((float *)v135 + 9));
                  computeSkinMask(v124, (unsigned __int8 **)v190, (uint64_t)v203, (uint64_t)v54 + 13996);
                  v197 = v124;
                  v136 = objc_msgSend(v54, "averageValueFromY:withinSkinMask:butOutsideAlpha:", v124, v203, Alpha);
                  termBitmap((void **)v203);
                  if (v136 != -1)
                  {
                    v137 = (float)v136 * 0.52;
                    v129 = (uint64_t)rintf(v137);
                  }
                  v133 = v181;
                  v124 = v197;
                  if (SHIDWORD(v217) > (int)v129 && HIDWORD(v217))
                  {
                    v138 = 0;
                    v139 = (float)(int)v129 / (float)SHIDWORD(v217);
                    HIDWORD(v227) = 0;
                    do
                    {
                      if (v138 < 201)
                      {
                        v141 = (uint64_t)rintf(v139 * (float)v138);
                        if ((int)v141 >= 255)
                          LOBYTE(v141) = -1;
                        if (v138 >= 181)
                        {
                          v142 = v139 + (float)((float)(v138 - 180) / 20.0) * (1.0 - v139);
                          v141 = (uint64_t)rintf((float)v138 * v142);
                          if ((int)v141 >= 255)
                            LOBYTE(v141) = -1;
                        }
                        v140 = v138;
                        LOBYTE(v138) = v141;
                      }
                      else
                      {
                        v140 = v138;
                      }
                      v134[v140] = v138;
                      v143 = HIDWORD(v227);
                      v138 = ++HIDWORD(v227);
                    }
                    while (v143 < 255);
                  }
                  else
                  {
                    v156 = 0;
                    HIDWORD(v227) = 0;
                    do
                    {
                      v134[v156] = v156;
                      v157 = HIDWORD(v227);
                      v156 = ++HIDWORD(v227);
                    }
                    while (v157 < 255);
                  }
                }
                redEyeCancellation(v124, (unsigned __int8 **)v190, (uint64_t *)Alpha, (uint64_t *)__dst, (uint64_t *)v209, (uint64_t)v134, (_DWORD *)&v227 + 1);
                zfree(v134);
                v130 = 0;
LABEL_106:
                v158 = 0;
                v159 = v133 + v98;
                HIDWORD(v227) = 0;
                do
                {
                  v160 = (void **)*(&v236 + v158);
                  if (v160)
                  {
                    termBitmask(v160);
                    v158 = HIDWORD(v227);
                  }
                  HIDWORD(v227) = v158 + 1;
                  v116 = v158++ < 2;
                }
                while (v116);
                v161 = v240;
                termBitmap(v240);
                zfree(v161);
                v162 = v241;
                termBitmap(v241);
                zfree(v162);
                HIDWORD(v227) = 3;
                if ((objc_msgSend(v54, "computeTrimmedBitmaps:newY:newCbCr:IR:newTrimY:newTrimCbCr:returningYR:andCbCrR:", v54[2] + 288, __dst, v209, v193, v98, v207, v205, &v216, v215) & 1) == 0)
                {
                  termBitmap(__dst);
                  termBitmap(v209);
                  termBitmap(Alpha);
                  v86 = Alpha;
                  goto LABEL_114;
                }
                v163 = *((_DWORD *)v54 + 16);
                if (v163 > 31)
                {
                  v166 = 0;
                }
                else
                {
                  v164 = *((_DWORD *)v54 + 17);
                  *((_DWORD *)v54 + 3218) = v164;
                  v165 = &v54[50 * v163];
                  *((_DWORD *)v165 + 18) = v164;
                  v166 = v165 + 9;
                  *((float *)v54 + 3219) = v17;
                  *((_DWORD *)v54 + 16) = v163 + 1;
                  *((_DWORD *)v54 + 17) = v164 + 1;
                  *((double *)v166 + 1) = v22;
                  *((double *)v166 + 2) = v21;
                  *((_DWORD *)v166 + 6) = v130;
                  *((_DWORD *)v166 + 7) = v188;
                  v167 = v225;
                  *((_DWORD *)v166 + 8) = HIDWORD(v225);
                  *((_DWORD *)v166 + 9) = v167;
                  v168 = *((_OWORD *)v121 + 1);
                  *((_OWORD *)v166 + 19) = *(_OWORD *)v121;
                  *((_OWORD *)v166 + 20) = v168;
                  v169 = *((_OWORD *)v121 + 2);
                  v170 = *((_OWORD *)v121 + 3);
                  v171 = *((_OWORD *)v121 + 5);
                  *((_OWORD *)v166 + 23) = *((_OWORD *)v121 + 4);
                  *((_OWORD *)v166 + 24) = v171;
                  *((_OWORD *)v166 + 21) = v169;
                  *((_OWORD *)v166 + 22) = v170;
                  v172 = HIDWORD(v216) - DWORD2(v216);
                  v173 = DWORD1(v216) - v216;
                  *((_OWORD *)v166 + 5) = v216;
                  initBitmap((uint64_t)(v166 + 5), v172, v173, 4, 1, 100.0);
                  ConvertYCbCrtoREDEYEFORMAT((unsigned __int8 **)v207, (unsigned __int8 **)v205, (uint64_t)(v166 + 5), *((_DWORD *)v54[2] + 91));
                  *((_OWORD *)v166 + 6) = v217;
                  *((_BYTE *)v166 + 112) = v186;
                  *(_QWORD *)((char *)v166 + 116) = v184;
                  *(_QWORD *)((char *)v166 + 124) = v185;
                  *((_DWORD *)v166 + 36) = v187;
                  *((_DWORD *)v166 + 37) = v191;
                  *((_DWORD *)v166 + 38) = v189;
                  *((_DWORD *)v166 + 39) = v183;
                  *((_DWORD *)v166 + 40) = v159;
                  *((_DWORD *)v166 + 41) = v182 + v193;
                  *((_DWORD *)v166 + 42) = v180;
                  *((_DWORD *)v166 + 43) = HIDWORD(v178);
                  *((_DWORD *)v166 + 44) = v178;
                  *((_DWORD *)v166 + 45) = v179;
                  *((_BYTE *)v166 + 184) = v186;
                  v174 = v201;
                  *((_BYTE *)v166 + 187) = v202;
                  *(_WORD *)((char *)v166 + 185) = v174;
                  *(_QWORD *)((char *)v166 + 188) = v184;
                  *(_QWORD *)((char *)v166 + 196) = v185;
                  *(_OWORD *)((char *)v166 + 204) = v200;
                  *((_DWORD *)v166 + 55) = v129;
                  *((_DWORD *)v166 + 56) = v93;
                  *((_DWORD *)v166 + 57) = v130;
                  *((float *)v166 + 58) = v17;
                  *((_DWORD *)v166 + 59) = 0;
                  v175 = v229;
                  *((_OWORD *)v166 + 15) = v228;
                  *((_OWORD *)v166 + 16) = v175;
                  *((_OWORD *)v166 + 17) = v230;
                  v166[36] = v193;
                  v166[37] = v98;
                }
                termBitmap(Alpha);
                zfree(Alpha);
                termBitmap(__dst);
                termBitmap(v209);
                termBitmap((void **)v207);
                termBitmap((void **)v205);
                if (v166)
                  return *(_DWORD *)v166;
                return -1;
              }
              v131 = v54[2][372];
              v200 = v217;
              if (!v131)
                goto LABEL_70;
LABEL_66:
              v132 = 0;
              v198 = 0;
              v199 = 0;
              if (v186)
              {
                LODWORD(v198) = v184;
                v199 = v185;
                HIDWORD(v198) = (uint64_t)rintf((float)(int)v184+ (float)((float)(v185 - v184)* (float)((float)(DWORD1(v217) - v217) / (float)(DWORD2(v217) - v217))));
                v132 = (int *)&v198;
              }
              whiteEyeCancellation(v124, (uint64_t)v190, v17, v193, v98, (unsigned __int8 **)Alpha, (uint64_t)v244, v227, *(&v236 + (int)v93), (uint64_t)(&v231 + 12 * (int)v93), (uint64_t *)__dst, (uint64_t)v209, (uint64_t)&v218, v132, (_DWORD *)&v227 + 1);
              LODWORD(v129) = 0;
              v130 = 2;
            }
            v133 = v181;
            goto LABEL_106;
          }
        }
      }
      termBitmap(v47);
      v86 = v47;
LABEL_114:
      zfree(v86);
    }
  }
  return -1;
}

- (CIRedEyeRepair)repairWithTag:(int)a3
{
  uint64_t nRepairs;
  CIRedEyeRepair *result;

  if (a3 == -1)
    return 0;
  nRepairs = self->nRepairs;
  if ((int)nRepairs < 1)
    return 0;
  for (result = (CIRedEyeRepair *)self->repairs;
        LODWORD(result->super.isa) != a3;
        result = (CIRedEyeRepair *)((char *)result + 400))
  {
    if (!--nRepairs)
      return 0;
  }
  return result;
}

- (int)redoRepairWithTag:(int)a3 IOD:(float)a4
{
  uint64_t v5;
  CIRedEyeRepair *v7;
  double v8;
  double v9;
  uint64_t imageSourceType;
  uint64_t v11;
  uint64_t v12;
  double v13;

  v5 = *(_QWORD *)&a3;
  v7 = -[CIRedEyeRepair repairWithTag:](self, "repairWithTag:");
  if (!v7)
    return v5;
  v8 = *(double *)&v7->ownLF;
  v9 = *(double *)&v7->lf;
  imageSourceType = v7->imageSourceType;
  v11 = *(uint64_t *)((char *)&v7->repairs[0].fullNew.baseAddress + 4);
  v12 = *(_QWORD *)&v7->repairs[0].fullNew.height;
  self->iFaceIndex = v7->repairs[0].fullNew.rowBytes;
  self->iLeft = v7->repairs[0].fullNew.size;
  -[CIRedEyeRepair undoRepair:](self, "undoRepair:", v5);
  *(float *)&v13 = a4;
  return -[CIRedEyeRepair redEyeRemovalWithPoint:alignPupilShades:matching:force:IOD:tap:](self, "redEyeRemovalWithPoint:alignPupilShades:matching:force:IOD:tap:", self->pupilShadeAlignment, v11, v12, imageSourceType, 0, v8, v9, v13);
}

- (void)redoLastRepair
{
  double v2;

  *(float *)&v2 = self->lastRepairIOD;
  self->lastRepairTag = -[CIRedEyeRepair redoRepairWithTag:IOD:](self, "redoRepairWithTag:IOD:", self->lastRepairTag, v2);
}

- (float)extractAverageFaceY:(id *)a3 contrast:(float *)a4 faceIndex:(int)a5
{
  int32x2_t v6;
  int32x2_t v7;
  int32x2_t v8;
  int32x2_t v9;
  $E2FF20502B54F5B442CF0C89360BE755 *lf;
  _DWORD *v11;
  _DWORD *v12;
  uint64_t p_var2;
  int32x2_t v14;
  int64x2_t v15;
  float64x2_t v16;
  int v17;
  float32x2_t v18;
  int32x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float32x2_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x2_t v37;
  float v38;
  int v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  unsigned int i;
  float result;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  uint64_t v51;
  uint64_t v52;

  v51 = 0;
  v52 = 0;
  v6 = *(int32x2_t *)&a3->var13;
  v7 = *(int32x2_t *)&a3->var11;
  v8 = *(int32x2_t *)&a3->var5;
  v9 = *(int32x2_t *)&a3->var7;
  lf = self->lf;
  v11 = zmalloc(0x400uLL);
  if (!v11)
    return 0.0;
  v12 = v11;
  p_var2 = (uint64_t)&lf->var2;
  v14 = vadd_s32(v9, v8);
  v15.i64[0] = v6.i32[0];
  v15.i64[1] = v6.i32[1];
  v16 = vcvtq_f64_s64(v15);
  v15.i64[0] = v7.i32[0];
  v15.i64[1] = v7.i32[1];
  v48 = v16;
  v49 = vcvtq_f64_s64(v15);
  bzero(v11, 0x400uLL);
  v17 = 0;
  v18 = vcvt_f32_s32(vsub_s32(v6, v7));
  v19 = (int32x2_t)vmul_f32(v18, v18);
  *(float *)v19.i32 = sqrtf(vmlas_n_f32(*(float *)&v19.i32[1], v18.f32[0], v18.f32[0]));
  v15.i64[0] = v14.i32[0];
  v15.i64[1] = v14.i32[1];
  v20 = vcvtq_f64_s64(v15);
  v21 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(v18, (float32x2_t)vdup_lane_s32(v19, 0))), *(float *)v19.i32 * 0.5);
  __asm { FMOV            V2.2D, #0.5 }
  v27 = vmlaq_f64(vnegq_f64(v21), _Q2, v20);
  v28 = vmlaq_f64(v21, _Q2, v20);
  *(float32x2_t *)&_Q2.f64[0] = vcvt_f32_s32(vsub_s32(v8, v9));
  *(float32x2_t *)&v20.f64[0] = vmul_f32(*(float32x2_t *)&_Q2.f64[0], *(float32x2_t *)&_Q2.f64[0]);
  *(float *)v20.f64 = sqrtf(vmlas_n_f32(*((float *)v20.f64 + 1), *(float *)_Q2.f64, *(float *)_Q2.f64));
  v29 = vcvtq_f64_f32(vmul_n_f32(vdiv_f32(*(float32x2_t *)&_Q2.f64[0], (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v20.f64[0], 0)), *(float *)v20.f64));
  v30 = (float64x2_t)vdupq_n_s64(0x3FD3333333333333uLL);
  v31 = vmlaq_f64(v48, v30, v29);
  v32 = vmlaq_f64(v49, v30, v29);
  *(float32x2_t *)&v30.f64[0] = vcvt_f32_f64(vsubq_f64(v27, v32));
  v33 = vaddq_f64(v32, vsubq_f64(vsubq_f64(v28, v31), v27));
  *(int32x2_t *)&v27.f64[0] = vdup_n_s32(0x3C257EB5u);
  v34 = vmul_f32(vcvt_f32_f64(vsubq_f64(v31, v32)), *(float32x2_t *)&v27.f64[0]);
  v35 = vmul_f32(*(float32x2_t *)&v30.f64[0], *(float32x2_t *)&v27.f64[0]);
  v36 = vmul_f32(vcvt_f32_f64(v33), (float32x2_t)vdup_n_s32(0x38D5F928u));
  v37 = vcvt_f32_f64(v32);
  v38 = 0.0;
  do
  {
    v39 = 100;
    *(float32x2_t *)&v33.f64[0] = v37;
    do
    {
      v50 = v33;
      bilinearARGB8LookupComponents(p_var2, (_DWORD *)&v51 + 1, &v52, (_DWORD *)&v52 + 1, &v51, *(float *)v33.f64, *((float *)v33.f64 + 1));
      v40 = 4899 * HIDWORD(v52) + 9617 * v52 + 1868 * HIDWORD(v51);
      v41 = (v40 + 0x2000) >> 14;
      if (v41 >= 255)
        v41 = 255;
      if (v40 >= -8192)
        v42 = v41;
      else
        v42 = 0;
      ++v12[v42];
      v38 = v38 + (float)v42;
      v33.f64[1] = v50.f64[1];
      *(float32x2_t *)&v33.f64[0] = vadd_f32(v34, *(float32x2_t *)&v50.f64[0]);
      --v39;
    }
    while (v39);
    ++v17;
    v37 = vadd_f32(v35, v37);
    v34 = vadd_f32(v36, v34);
  }
  while (v17 != 100);
  v43 = 0;
  v44 = 0;
  do
  {
    v44 += v12[v43];
    if (v44 > 50)
      break;
    ++v43;
  }
  while (v43 != 256);
  v45 = 0;
  for (i = 255; i != -1; --i)
  {
    v45 += v12[i];
    if (v45 > 50)
      break;
  }
  zfree(v12);
  result = v38 / 10000.0;
  *a4 = (float)(int)(i - v43);
  return result;
}

- (float)confidenceWithIOD:(float)a3 repair:(int)a4 andProminenceDifference:(int)a5
{
  uint64_t v6;
  float v9;
  float v10;
  double v11;
  float v12;
  float v13;
  CIRedEyeRepair *v14;
  float v15;
  int imageSourceType;
  float v17;
  float v18;
  float64x2_t v19;
  float v20;
  int v22;
  int v23;
  double v24;
  double v25;
  float v26;

  v6 = *(_QWORD *)&a4;
  -[CIRedEyeRepair upperRepairSize:](self, "upperRepairSize:");
  v10 = v9;
  *(float *)&v11 = a3;
  -[CIRedEyeRepair lowerRepairSize:](self, "lowerRepairSize:", v11);
  v13 = v12;
  v14 = -[CIRedEyeRepair repairWithTag:](self, "repairWithTag:", v6);
  if (!v14)
    return 0.0;
  v15 = (float)a5 * 0.0039062;
  imageSourceType = v14->imageSourceType;
  v17 = v15 * 1.5;
  if (imageSourceType)
    v18 = (float)a5 * 0.0039062;
  else
    v18 = v15 * 1.5;
  if (self->lf->var10)
  {
    v19 = vsqrtq_f64(vdivq_f64(vcvtq_f64_f32(vcvt_f32_s32((int32x2_t)v14->blockSet)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL)));
    v20 = vaddv_f32(vcvt_f32_f64(vaddq_f64(v19, v19))) * 0.5;
  }
  else
  {
    v22 = HIDWORD(v14->repairs[0].pt2.y) - LODWORD(v14->repairs[0].pt2.y);
    v23 = HIDWORD(v14->repairs[0].pt2.x) - LODWORD(v14->repairs[0].pt2.x);
    v20 = sqrtf((float)(v22 * v22 + v23 * v23));
  }
  if (v20 <= v10)
  {
    v26 = 1.0;
    if (v20 > v13 || !imageSourceType && v13 + (float)(v17 * v20) * -0.36 < v20)
      return v18 * v26;
    goto LABEL_19;
  }
  if (imageSourceType)
  {
    if (imageSourceType == 2)
    {
      v24 = v20;
      v25 = v10 + (float)(v15 * v20) * 0.26;
      v26 = 1.0;
      if (v25 > v24)
        return v18 * v26;
    }
    goto LABEL_19;
  }
  v26 = 1.0;
  if (v10 + (float)(v17 * v20) * 0.65 <= v20)
LABEL_19:
    v26 = 0.0;
  return v18 * v26;
}

- (void)insertIntoProminenceVettingHopper:(id *)a3 max:(int)a4 outside:(int)a5 confidence:(float)a6 distance:(float)a7 row:(int)a8 column:(int)a9 IOD:(float)a10
{
  double v17;
  float v18;
  float v19;
  float v20;
  double v21;
  float v22;
  uint64_t var0;
  uint64_t v24;
  $94EF30CFE420AF9663DA6391699BBB53 *var1;
  uint64_t v26;
  $94EF30CFE420AF9663DA6391699BBB53 *v27;
  __int128 v28;
  float *v29;
  int v30;

  *(float *)&v17 = a10;
  +[CIRedEyeRepair upperRepairDistanceFraction:](CIRedEyeRepair, "upperRepairDistanceFraction:", v17);
  v19 = (a6 * 0.5 + 1.0) * v18;
  v20 = 1.0;
  if (v19 <= a7)
  {
    v21 = v19;
    v20 = 0.0;
    if (v21 * 1.25 > a7)
      v20 = a7 * -4.0 / v21 + 5.0;
  }
  v22 = v20 * a6;
  var0 = a3->var0;
  if ((int)var0 < 1)
  {
    LODWORD(v24) = 0;
LABEL_16:
    v29 = (float *)(&a3->var0 + 9 * v24);
    v29[1] = v22;
    *((_DWORD *)v29 + 2) = a4;
    *((_DWORD *)v29 + 3) = a5;
    v29[4] = a6;
    v29[5] = 0.0;
    v29[6] = a7;
    *((_DWORD *)v29 + 7) = a8;
    *((_DWORD *)v29 + 8) = a9;
    v29[9] = v20;
    if (a3->var0 < 4)
      v30 = a3->var0 + 1;
    else
      v30 = 4;
    a3->var0 = v30;
    return;
  }
  v24 = 0;
  var1 = a3->var1;
  while (var1->var0 >= v22)
  {
    ++v24;
    ++var1;
    if (var0 == v24)
    {
      LODWORD(v24) = a3->var0;
      goto LABEL_15;
    }
  }
  if ((int)var0 > (int)v24)
  {
    v26 = (int)var0;
    v27 = &a3->var1[(int)var0];
    do
    {
      if (v26 <= 3)
      {
        v28 = *(_OWORD *)&v27[-1].var4;
        *(_OWORD *)&v27->var0 = *(_OWORD *)&v27[-1].var0;
        *(_OWORD *)&v27->var4 = v28;
        v27->var8 = v27[-1].var8;
      }
      --v26;
      --v27;
    }
    while (v26 > v24);
  }
LABEL_15:
  if (v24 <= 3)
    goto LABEL_16;
}

- (BOOL)gatherProminencesWithC:(id *)a3 MC:(id *)a4 maxwindowsize:(int)a5 repairsize:(int)a6 IR:(id)a7 fr:(id *)a8 intoHopper:(id *)a9 faceIndex:(int)a10 left:(BOOL)a11 coss:(float)a12[10] sins:(float)a13[10] bitmapName:(char *)a14
{
  $70AAFAEA8D29FDD9B9EBEA83FD92DE0E *v17;
  int var1;
  int v19;
  uint64_t var3;
  uint64_t var6;
  void **inited;
  void **v23;
  void **v24;
  char *v25;
  int v26;
  char *v27;
  uint64_t v28;
  unsigned int i;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int j;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  uint64_t v43;
  int v44;
  int v45;
  unsigned int v46;
  int v47;
  int v48;
  double v49;
  float v50;
  int v51;
  double v52;
  float v53;
  int v54;
  float v56;
  int v57;
  float v58;
  int v59;
  signed int v61;
  float v62;
  float v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  float v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  int v72;
  int v73;
  int *v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  float v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v86;
  int v87;
  int v88;
  uint64_t v89;
  float v90;
  double v91;
  double v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  BOOL v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int var0;
  int var2;
  $07A02DD24AF34610473D9D0940B06C4B *v106;
  unsigned int v107;
  void **v108;
  _BYTE v109[148];
  int v110[4];

  var0 = a7.var0;
  var2 = a7.var2;
  v17 = a9;
  *(_QWORD *)v110 = 0;
  memset(&v109[4], 0, 144);
  var1 = a3->var1;
  v19 = a3->var2;
  var3 = a3->var3;
  var6 = a3->var6;
  memmove(a4->var0, a3->var0, a3->var5);
  applyMaxFilter8((uint64_t)a4, a5);
  inited = (void **)initBitmask(var1, v19);
  v23 = (void **)initBitmask(var1, v19);
  v24 = v23;
  v106 = a3;
  v25 = a3->var0;
  if (v19 <= 0)
  {
    a9->var0 = 0;
    v99 = 1;
  }
  else
  {
    v108 = inited;
    v102 = (uint64_t)v23;
    v26 = 0;
    v27 = a4->var0;
    do
    {
      if (var1 >= 1)
      {
        v28 = 0;
        for (i = 0; i != var1; ++i)
        {
          if (v27[v28])
            setBitInBitmask((uint64_t)v108, i, v26, v25[v28] == v27[v28]);
          v28 += var6;
        }
      }
      ++v26;
      v25 += var3;
      v27 += var3;
    }
    while (v26 != v19);
    v25 = v106->var0;
    v17 = a9;
    a9->var0 = 0;
    v99 = 0;
    v107 = 0;
    v30 = (double)a6 * 0.25;
    v31 = (double)a6 * 0.5;
    if (a11)
      v32 = 44;
    else
      v32 = 52;
    v33 = 56;
    if (a11)
      v33 = 48;
    v100 = v33;
    v101 = v32;
    v24 = (void **)v102;
    inited = v108;
    do
    {
      if (var1 >= 1)
      {
        for (j = 0; j != var1; ++j)
        {
          if (bitValueFromBitmask((uint64_t)inited, j, v107))
          {
            if (!seedFill((uint64_t)inited, (uint64_t)v24, j, v107, 0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))bitIsSet_0))
            {
              termBitmask(inited);
              termBitmask(v24);
              return v99;
            }
            v35 = (uint64_t)v24;
            v36 = bitmaskBoundingBitmapRect((uint64_t)v24);
            v38 = v37;
            bitmaskCentroidUsingBoundingRect(v35, v36, v37);
            v39 = v35;
            v17 = a9;
            v40 = v38;
            inited = v108;
            closestSetBitInBitmaskUsingBoundingRect(v39, v36, v40, &v110[1], v110, v41, v42);
            v43 = 0;
            v44 = 0;
            v45 = 0;
            v46 = v25[v110[0] * (int)var3 + v110[1] * (int)var6];
            v47 = 256;
            v48 = -1;
            do
            {
              v49 = a12[v43];
              v50 = v30 * v49;
              v51 = v110[1] + (uint64_t)rintf(v50);
              if (v51 >= 0)
              {
                v52 = a13[v43];
                v53 = v30 * v52;
                v54 = v110[0] + (uint64_t)rintf(v53);
                if ((v54 & 0x80000000) == 0 && v51 < var1 && v54 < v19)
                {
                  v56 = v31 * v49;
                  v57 = v110[1] + (uint64_t)rintf(v56);
                  if (v57 >= 0)
                  {
                    v58 = v31 * v52;
                    v59 = v110[0] + (uint64_t)rintf(v58);
                    if ((v59 & 0x80000000) == 0 && v57 < var1 && v59 < v19)
                    {
                      v61 = v25[v51 * (int)var6 + v54 * (int)var3];
                      ++v45;
                      if (v61 >= v25[v57 * (int)var6 + v59 * (int)var3])
                        v61 = v25[v57 * (int)var6 + v59 * (int)var3];
                      if (v47 >= v61)
                        v47 = v61;
                      if (v48 <= v61)
                        v48 = v61;
                      v44 += v61;
                    }
                  }
                }
              }
              ++v43;
            }
            while (v43 != 10);
            v62 = (float)(int)(v46 - (uint64_t)rintf((float)v44 / (float)v45)) * 0.0039062;
            if (v46 <= 0xF)
            {
              v63 = (float)((float)v46 + -8.0) * 0.125 * v62;
              v62 = v63;
            }
            if (v46 < 8)
              v62 = 0.0;
            v64 = v62 + (float)((float)(v48 - v47) * 0.0039062) * -0.5;
            *(float *)&v64 = v64;
            v65 = sqrt((double)((v110[1] + var2 - *(_DWORD *)(&a8->var0 + v101))
                              * (v110[1] + var2 - *(_DWORD *)(&a8->var0 + v101))
                              + (v110[0] + var0 - *(_DWORD *)(&a8->var0 + v100))
                              * (v110[0] + var0 - *(_DWORD *)(&a8->var0 + v100))));
            *(float *)&v65 = (float)(int)v65 / a8->var4;
            -[CIRedEyeRepair insertIntoProminenceVettingHopper:max:outside:confidence:distance:row:column:IOD:](self, "insertIntoProminenceVettingHopper:max:outside:confidence:distance:row:column:IOD:", a9, v64, v65);
            v24 = (void **)v102;
            bitmaskMinus((uint64_t)v108, v102);
          }
        }
      }
      v99 = (int)++v107 >= v19;
    }
    while (v107 != v19);
  }
  termBitmask(inited);
  termBitmask(v24);
  *(_DWORD *)v109 = 0;
  if (v17->var0 >= 1)
  {
    v67 = 0;
    v68 = (double)a6 * 0.5;
    v69 = (uint64_t)rintf(v68);
    if ((int)v69 <= 1)
      v70 = 1;
    else
      v70 = v69;
    do
    {
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = &v17->var0 + 9 * v67;
      v75 = v74[7] - var0;
      v76 = v74[8] - var2;
      *(_QWORD *)v110 = __PAIR64__(v76, v75);
      v77 = v74[2];
      v78 = 256;
      v79 = -1;
      do
      {
        v80 = 1.0;
        v81 = v70;
        v82 = v77;
        do
        {
          v83 = v76 + (uint64_t)rintf(v80 * a12[v71]);
          if (v83 >= 0)
          {
            v84 = v75 + (uint64_t)rintf(v80 * a13[v71]);
            if ((v84 & 0x80000000) == 0 && v83 < var1 && v84 < v19)
            {
              v86 = v25[v83 * (int)var6 + v84 * (int)var3];
              if (v82 >= v86)
                v82 = v86;
            }
          }
          v80 = v80 + 1.0;
          --v81;
        }
        while (v81);
        if (v82 >= v78)
          v87 = v78;
        else
          v87 = v82;
        if (v82 <= v79)
          v88 = v79;
        else
          v88 = v82;
        if (v82 != v77)
        {
          ++v73;
          v72 += v82;
          v78 = v87;
          v79 = v88;
        }
        ++v71;
      }
      while (v71 != 10);
      v89 = (uint64_t)rintf((float)v72 / (float)v73);
      v90 = 0.0;
      if (v77 >= 8)
      {
        v90 = (float)(v77 - v89) * 0.0039062;
        if (v77 <= 0xF)
          v90 = (float)((float)v77 + -8.0) * 0.125 * v90;
      }
      v91 = (float)((float)(v79 - v78) * 0.0039062);
      v92 = v90 + v91 * -0.5;
      *(float *)&v92 = v92;
      *(float *)&v91 = v17->var1[v67].var5;
      *(float *)&v66 = a8->var4;
      -[CIRedEyeRepair insertIntoProminenceVettingHopper:max:outside:confidence:distance:row:column:IOD:](self, "insertIntoProminenceVettingHopper:max:outside:confidence:distance:row:column:IOD:", v109, v92, v91, v66);
      ++v67;
    }
    while (v67 < v17->var0);
  }
  v93 = *(_OWORD *)&v109[112];
  *(_OWORD *)&v17->var1[2].var5 = *(_OWORD *)&v109[96];
  *(_OWORD *)&v17->var1[3].var0 = v93;
  *(_OWORD *)&v17->var1[3].var4 = *(_OWORD *)&v109[128];
  v17->var1[3].var8 = *(float *)&v109[144];
  v94 = *(_OWORD *)&v109[48];
  *(_OWORD *)&v17->var1[0].var7 = *(_OWORD *)&v109[32];
  *(_OWORD *)&v17->var1[1].var2 = v94;
  v95 = *(_OWORD *)&v109[80];
  *(_OWORD *)&v17->var1[1].var6 = *(_OWORD *)&v109[64];
  *(_OWORD *)&v17->var1[2].var1 = v95;
  v96 = *(_OWORD *)&v109[16];
  *(_OWORD *)&v17->var0 = *(_OWORD *)v109;
  *(_OWORD *)&v17->var1[0].var3 = v96;
  return v99;
}

- (BOOL)gatherProminencesWithC:(id *)a3 MC:(id *)a4 altC:(id *)a5 altMC:(id *)a6 maxwindowsize:(int)a7 repairsize:(int)a8 IR:(id)a9 fr:(id *)a10 intoHopper:(id *)a11 faceIndex:(int)a12 left:(BOOL)a13
{
  uint64_t v15;
  float v16;
  __double2 v17;
  float cosval;
  float sinval;
  _BOOL4 v20;
  int v21;
  $94EF30CFE420AF9663DA6391699BBB53 *var1;
  int v23;
  int32x2_t *v24;
  int32x2_t *v25;
  int32x2_t *v26;
  int32x2_t v27;
  int32x2_t v28;
  int32x2_t v29;
  signed __int32 v30;
  int var0;
  $94EF30CFE420AF9663DA6391699BBB53 *v32;
  int *p_var6;
  $94EF30CFE420AF9663DA6391699BBB53 *v34;
  int32x2_t v35;
  int32x2_t v36;
  int32x2_t v37;
  signed __int32 v38;
  float v39;
  __int128 v40;
  __int128 v41;
  uint64_t v43;
  uint64_t v44;
  int v50;
  int32x2_t v51[18];
  _BYTE v52[40];
  _BYTE v53[40];
  uint64_t v54;

  v15 = 0;
  v54 = *MEMORY[0x1E0C80C00];
  v16 = 0.0;
  do
  {
    v17 = __sincos_stret(v16);
    cosval = v17.__cosval;
    *(float *)&v53[v15] = cosval;
    sinval = v17.__sinval;
    *(float *)&v52[v15] = sinval;
    v16 = v16 + 0.62832;
    v15 += 4;
  }
  while (v15 != 40);
  memset(v51, 0, sizeof(v51));
  v50 = 0;
  if (a5)
  {
    BYTE4(v43) = a13;
    LODWORD(v43) = a12;
    v20 = -[CIRedEyeRepair gatherProminencesWithC:MC:maxwindowsize:repairsize:IR:fr:intoHopper:faceIndex:left:coss:sins:bitmapName:](self, "gatherProminencesWithC:MC:maxwindowsize:repairsize:IR:fr:intoHopper:faceIndex:left:coss:sins:bitmapName:", a5, a6, a7, a8, *(_QWORD *)&a9.var0, *(_QWORD *)&a9.var2, a10, &v50, v43, v53, v52, "RC5");
    if (v20)
    {
      BYTE4(v44) = a13;
      LODWORD(v44) = a12;
      v20 = -[CIRedEyeRepair gatherProminencesWithC:MC:maxwindowsize:repairsize:IR:fr:intoHopper:faceIndex:left:coss:sins:bitmapName:](self, "gatherProminencesWithC:MC:maxwindowsize:repairsize:IR:fr:intoHopper:faceIndex:left:coss:sins:bitmapName:", a3, a4, a7, a8, *(_QWORD *)&a9.var0, *(_QWORD *)&a9.var2, a10, a11, v44, v53, v52, "RC2");
      if (v20)
      {
        v21 = 1000000;
        var1 = a11->var1;
        if (a11->var1[0].var3 <= *(float *)&v51[1].i32[1])
        {
          v24 = v51;
          var0 = a11->var0;
          if (a11->var0 < 1)
          {
            v32 = 0;
          }
          else
          {
            v32 = 0;
            p_var6 = &a11->var1[0].var6;
            do
            {
              v34 = ($94EF30CFE420AF9663DA6391699BBB53 *)(p_var6 - 6);
              v35 = *(int32x2_t *)p_var6;
              p_var6 += 9;
              v36 = vsub_s32(v35, v51[3]);
              v37 = vmul_s32(v36, v36);
              v38 = vadd_s32(v37, vdup_lane_s32(v37, 1)).u32[0];
              if (v38 < v21)
              {
                v21 = v38;
                v32 = v34;
              }
              --var0;
            }
            while (var0);
          }
        }
        else
        {
          v23 = v50;
          if (v50 < 1)
          {
            v24 = 0;
          }
          else
          {
            v24 = 0;
            v25 = &v51[3];
            do
            {
              v26 = v25 - 3;
              v27 = *v25;
              v25 = (int32x2_t *)((char *)v25 + 36);
              v28 = vsub_s32(*(int32x2_t *)&a11->var1[0].var6, v27);
              v29 = vmul_s32(v28, v28);
              v30 = vadd_s32(v29, vdup_lane_s32(v29, 1)).u32[0];
              if (v30 < v21)
              {
                v21 = v30;
                v24 = v26;
              }
              --v23;
            }
            while (v23);
          }
          v32 = a11->var1;
        }
        if ((double)(a8 * a8) * 0.25 > (float)v21)
        {
          v39 = *(float *)&v24[1].i32[1];
          v32->var4 = v39;
          if (v32->var3 < v39)
          {
            v32->var3 = v39;
            *(int32x2_t *)&v32->var1 = *(int32x2_t *)((char *)v24 + 4);
          }
          if (v32 != var1)
          {
            v40 = *(_OWORD *)&v32->var0;
            v41 = *(_OWORD *)&v32->var4;
            a11->var1[0].var8 = v32->var8;
            *(_OWORD *)&var1->var0 = v40;
            *(_OWORD *)&a11->var1[0].var4 = v41;
          }
        }
        LOBYTE(v20) = 1;
      }
    }
  }
  else
  {
    BYTE4(v43) = a13;
    LODWORD(v43) = a12;
    LOBYTE(v20) = -[CIRedEyeRepair gatherProminencesWithC:MC:maxwindowsize:repairsize:IR:fr:intoHopper:faceIndex:left:coss:sins:bitmapName:](self, "gatherProminencesWithC:MC:maxwindowsize:repairsize:IR:fr:intoHopper:faceIndex:left:coss:sins:bitmapName:", a3, a4, a7, a8, *(_QWORD *)&a9.var0, *(_QWORD *)&a9.var2, a10, a11, v43, v53, v52, "RC2");
  }
  return v20;
}

- (BOOL)extractAndGatherProminencesWithRect:(id)a3 face:(id *)a4 faceIndex:(int)a5 left:(BOOL)a6 maxwindowsize:(float)a7 repairsize:(float)a8 returningRedHopper:(id *)a9 whiteHopper:(id *)a10 redChannel:(id *)a11 redChannelMask:(id *)a12
{
  int v12;
  int v13;
  int v14;
  BOOL v16;
  int var0;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  _BOOL4 v31;
  uint64_t v33;
  uint64_t v34;
  BOOL v36;
  _OWORD v38[2];
  uint64_t v39;
  _OWORD v40[2];
  uint64_t v41;
  _OWORD v42[2];
  uint64_t v43;
  _OWORD v44[2];
  uint64_t v45;
  _OWORD v46[2];
  uint64_t v47;
  _OWORD v48[2];
  uint64_t v49;

  v12 = a3.var3 - ((LOBYTE(a3.var3) - LOBYTE(a3.var2)) & 1);
  v13 = a3.var1 - ((LOBYTE(a3.var1) - LOBYTE(a3.var0)) & 1);
  v14 = v12 - a3.var2;
  if (v12 <= a3.var2 || v13 <= a3.var0)
    return 0;
  var0 = a3.var0;
  v49 = 0;
  memset(v48, 0, sizeof(v48));
  memset(v46, 0, sizeof(v46));
  v47 = 0;
  memset(v44, 0, sizeof(v44));
  v45 = 0;
  memset(v42, 0, sizeof(v42));
  v43 = 0;
  memset(v40, 0, sizeof(v40));
  v41 = 0;
  v39 = 0;
  v23 = a3.var0 | ((unint64_t)v13 << 32);
  v24 = a3.var2 | ((unint64_t)v12 << 32);
  memset(v38, 0, sizeof(v38));
  v25 = halfBitmapRect(v23);
  v36 = a6;
  v26 = v25;
  v28 = v27;
  v29 = HIDWORD(v25);
  v30 = v13 - var0;
  initBitmap((uint64_t)v48, v14, v30, 1, 1, self->lf->var2.var8);
  initBitmap((uint64_t)v46, v14, v30, 1, 1, self->lf->var2.var8);
  initBitmap((uint64_t)v44, HIDWORD(v28) - v28, v29 - v26, 2, 1, self->lf->var2.var8);
  initBitmap((uint64_t)a11, v14, v30, 1, 1, self->lf->var2.var8);
  initBitmap((uint64_t)a12, v14, v30, 1, 1, self->lf->var2.var8);
  initBitmap((uint64_t)v40, v14, v30, 1, 1, self->lf->var2.var8);
  initBitmap((uint64_t)v38, v14, v30, 1, 1, self->lf->var2.var8);
  constructSliceBitmap((uint64_t)&self->lf->var2, (uint64_t)v42, v23, v24);
  ConvertREDEYEFORMATtoYCbCr(v42, (uint64_t *)v48, (uint64_t *)v44, self->lf->var8);
  ConvertRedChannel2toY((unsigned __int8 **)v48, (unsigned __int8 **)v44, (uint64_t)a11);
  ConvertRedChannel5toY((unsigned __int8 **)v48, (unsigned __int8 **)v44, (uint64_t)v40);
  termBitmap((void **)v44);
  BYTE4(v33) = v36;
  LODWORD(v33) = a5;
  v31 = -[CIRedEyeRepair gatherProminencesWithC:MC:altC:altMC:maxwindowsize:repairsize:IR:fr:intoHopper:faceIndex:left:](self, "gatherProminencesWithC:MC:altC:altMC:maxwindowsize:repairsize:IR:fr:intoHopper:faceIndex:left:", a11, a12, v40, v38, (int)a7, (int)a8, v23, v24, a4, a9, v33);
  v16 = 0;
  if (v31)
  {
    if (!self->lf->var10
      || (BYTE4(v34) = v36,
          LODWORD(v34) = a5,
          -[CIRedEyeRepair gatherProminencesWithC:MC:altC:altMC:maxwindowsize:repairsize:IR:fr:intoHopper:faceIndex:left:](self, "gatherProminencesWithC:MC:altC:altMC:maxwindowsize:repairsize:IR:fr:intoHopper:faceIndex:left:", v48, v46, 0, 0, (int)a7, (int)a8, v23, v24, a4, a10, v34)))
    {
      v16 = 1;
    }
  }
  termBitmap((void **)&a11->var0);
  termBitmap((void **)&a12->var0);
  termBitmap((void **)v40);
  termBitmap((void **)v38);
  termBitmap((void **)v48);
  termBitmap((void **)v46);
  return v16;
}

- ($989D4B698364BD1E7054E5BF7672D090)repairDecisionWithFaceRecord:(SEL)a3 left:(id *)a4 redHopper:(BOOL)a5 whiteHopper:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  __int128 v14;

  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  if (a6->var0 < 1 || a6->var1[0].var3 <= 0.08)
  {
    if (*(_BYTE *)(*(_QWORD *)&self->var5 + 372) && a7->var0 >= 1 && a7->var1[0].var3 > 0.08)
    {
      v11 = 52;
      if (a5)
        v11 = 44;
      v12 = 56;
      if (a5)
        v12 = 48;
      v13 = *(_DWORD *)(&a4->var0 + v12);
      retstr->var0 = *(_DWORD *)(&a4->var0 + v11);
      retstr->var1 = v13;
      retstr->var4 = a7->var1[0].var5;
      *(int32x2_t *)&v14 = vrev64_s32(*(int32x2_t *)&a7->var1[0].var6);
      *((_QWORD *)&v14 + 1) = *(_QWORD *)&a7->var1[0].var1;
      *(_OWORD *)&retstr->var5 = v14;
      retstr->var2 = 1;
    }
  }
  else
  {
    v7 = 52;
    if (a5)
      v7 = 44;
    v8 = 56;
    if (a5)
      v8 = 48;
    v9 = *(_DWORD *)(&a4->var0 + v8);
    retstr->var0 = *(_DWORD *)(&a4->var0 + v7);
    retstr->var1 = v9;
    retstr->var4 = a6->var1[0].var5;
    *(int32x2_t *)&v10 = vrev64_s32(*(int32x2_t *)&a6->var1[0].var6);
    *((_QWORD *)&v10 + 1) = *(_QWORD *)&a6->var1[0].var1;
    *(_OWORD *)&retstr->var5 = v10;
    *(_WORD *)&retstr->var2 = 257;
  }
  return self;
}

- (int)applyEyeRepairWithEye:(id *)a3 left:(BOOL)a4 IOD:(float)a5 autoPupilTonality:(BOOL)a6 match:(id *)a7 faceIndex:(int)a8 whiteHopper:(id *)a9
{
  double v9;
  _BOOL8 v13;
  BOOL *p_iLeft;
  uint64_t v19;
  double v20;
  uint64_t v21;
  CIRedEyeRepair *v22;
  double v23;
  int maxrow;
  int x_low;
  float v26;
  float v27;
  __int128 v28;
  double v29;
  float v30;

  if (!a3->var2)
    goto LABEL_17;
  v13 = a6;
  self->iFaceIndex = a8;
  p_iLeft = &self->iLeft;
  self->iLeft = a4;
  *(float *)&v9 = a5;
  v19 = -[CIRedEyeRepair redEyeRemovalWithPoint:alignPupilShades:matching:force:IOD:tap:](self, "redEyeRemovalWithPoint:alignPupilShades:matching:force:IOD:tap:", a6, *(_QWORD *)&a7->var0, *(_QWORD *)&a7->var2, 2 * !a3->var3, 0, (double)a3->var5, (double)a3->var6, v9);
  if ((_DWORD)v19 != -1)
  {
    v21 = v19;
    v22 = -[CIRedEyeRepair repairWithTag:](self, "repairWithTag:", v19);
    if (v22->repairs[0].data.snapHitX)
    {
      maxrow = v22->repairs[0].data.CR.maxrow;
      x_low = LODWORD(v22->repairs[0].BI.centroid.x);
      a3->var7 = maxrow;
      a3->var8 = x_low;
    }
    else
    {
      maxrow = a3->var7;
      x_low = a3->var8;
    }
    v26 = (float)((float)(*(float *)&v22->repairs[0].data.O.orientation / 255.0)
                * (float)((float)(maxrow - x_low) / 255.0))
        / fmaxf(a3->var4, 0.001);
    *(float *)&v23 = a5;
    -[CIRedEyeRepair confidenceWithIOD:repair:andProminenceDifference:](self, "confidenceWithIOD:repair:andProminenceDifference:", v21, v23);
    if (v26 < 0.135)
      v27 = 0.0;
    if (v27 >= 0.125)
      return v21;
    -[CIRedEyeRepair undoRepair:](self, "undoRepair:", v21);
  }
  if (!self->lf->var10 || !a3->var3 || a9->var0 < 1 || a9->var1[0].var3 <= 0.125)
    goto LABEL_17;
  a3->var4 = a9->var1[0].var5;
  *(int32x2_t *)&v28 = vrev64_s32(*(int32x2_t *)&a9->var1[0].var6);
  *((_QWORD *)&v28 + 1) = *(_QWORD *)&a9->var1[0].var1;
  *(_OWORD *)&a3->var5 = v28;
  a3->var3 = 0;
  self->iFaceIndex = a8;
  *p_iLeft = a4;
  *(float *)&v20 = a5;
  v21 = -[CIRedEyeRepair redEyeRemovalWithPoint:alignPupilShades:matching:force:IOD:tap:](self, "redEyeRemovalWithPoint:alignPupilShades:matching:force:IOD:tap:", v13, *(_QWORD *)&a7->var0, *(_QWORD *)&a7->var2, 2, 0, (double)a3->var5, (double)a3->var6, v20);
  if ((_DWORD)v21 != -1)
  {
    *(float *)&v29 = a5;
    -[CIRedEyeRepair confidenceWithIOD:repair:andProminenceDifference:](self, "confidenceWithIOD:repair:andProminenceDifference:", v21, (a3->var7 - a3->var8), v29);
    if (v30 < 0.125)
    {
      -[CIRedEyeRepair undoRepair:](self, "undoRepair:", v21);
LABEL_17:
      LODWORD(v21) = -1;
    }
  }
  return v21;
}

- (void)autoRepairExtractAndSearchLeft:(id)a3 right:(id)a4 data:(id *)a5 repairSize:(float)a6 autoPupilTonality:(BOOL)a7 faceIndex:(int)a8
{
  _BOOL4 v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  float v16;
  uint64_t v17;
  double v18;
  double v19;
  float v20;
  float v21;
  double v22;
  float v23;
  float v24;
  double v25;
  double v26;
  float v27;
  float v28;
  int v29;
  $23B68B56AE60DB485D301CEA5A0411BF standardTemplate;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  CIRedEyeRepair *v38;
  float v39;
  float v40;
  CIRedEyeRepair *v41;
  int v42;
  int v43;
  BOOL v44;
  CIRedEyeRepair *v45;
  CIRedEyeRepair *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _OWORD v53[2];
  uint64_t v54;
  _OWORD v55[2];
  uint64_t v56;
  _OWORD v57[2];
  uint64_t v58;
  _OWORD v59[2];
  uint64_t v60;
  $23B68B56AE60DB485D301CEA5A0411BF v61;
  int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  int v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  int v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  float v102;

  v8 = a7;
  v10 = *(_QWORD *)&a4.var2;
  v11 = *(_QWORD *)&a4.var0;
  v12 = *(_QWORD *)&a3.var2;
  v14 = *(_QWORD *)&a3.var0;
  v101 = 0u;
  v100 = 0u;
  v99 = 0u;
  v98 = 0u;
  v97 = 0u;
  v96 = 0u;
  v95 = 0u;
  v94 = 0u;
  v93 = 0u;
  v91 = 0u;
  v90 = 0u;
  v89 = 0u;
  v88 = 0u;
  v87 = 0u;
  v86 = 0u;
  v85 = 0u;
  v84 = 0u;
  v83 = 0u;
  v81 = 0u;
  v80 = 0u;
  v79 = 0u;
  v78 = 0u;
  v77 = 0u;
  v76 = 0u;
  v75 = 0u;
  v74 = 0u;
  v73 = 0u;
  v71 = 0u;
  v70 = 0u;
  v69 = 0u;
  v68 = 0u;
  v67 = 0u;
  v66 = 0u;
  v65 = 0u;
  v64 = 0u;
  v63 = 0u;
  v61 = ($23B68B56AE60DB485D301CEA5A0411BF)0;
  v60 = 0;
  memset(v59, 0, sizeof(v59));
  v58 = 0;
  memset(v57, 0, sizeof(v57));
  v56 = 0;
  memset(v55, 0, sizeof(v55));
  v54 = 0;
  memset(v53, 0, sizeof(v53));
  v102 = 0.0;
  -[CIRedEyeRepair upperRepairSize:](self, "upperRepairSize:", COERCE_DOUBLE((unint64_t)LODWORD(a5->var4)));
  v17 = (uint64_t)rintf(v16 * a6);
  HIDWORD(v18) = 1069757235;
  v19 = a5->var4 * 0.15;
  v82 = 0;
  v92 = 0;
  v62 = 0;
  v72 = 0;
  v20 = (float)(int)v19;
  v21 = (float)(int)v17;
  *(float *)&v19 = v20;
  *(float *)&v18 = (float)(int)v17;
  if (-[CIRedEyeRepair extractAndGatherProminencesWithRect:face:faceIndex:left:maxwindowsize:repairsize:returningRedHopper:whiteHopper:redChannel:redChannelMask:](self, "extractAndGatherProminencesWithRect:face:faceIndex:left:maxwindowsize:repairsize:returningRedHopper:whiteHopper:redChannel:redChannelMask:", v14, v12, a5, a8, 1, &v92, v19, v18, &v72, v59, v57))
  {
    if (self)
    {
      -[CIRedEyeRepair repairDecisionWithFaceRecord:left:redHopper:whiteHopper:](self, "repairDecisionWithFaceRecord:left:redHopper:whiteHopper:", a5, 1, &v92, &v72);
      v51 = v49;
      v52 = v50;
      if (!-[CIRedEyeRepair extractAndGatherProminencesWithRect:face:faceIndex:left:maxwindowsize:repairsize:returningRedHopper:whiteHopper:redChannel:redChannelMask:](self, "extractAndGatherProminencesWithRect:face:faceIndex:left:maxwindowsize:repairsize:returningRedHopper:whiteHopper:redChannel:redChannelMask:", v11, v10, a5, a8, 0, &v82, COERCE_DOUBLE(__PAIR64__(DWORD1(v49), LODWORD(v20))), COERCE_DOUBLE(__PAIR64__(DWORD1(v50), LODWORD(v21))), &v62, v55, v53))return;
      -[CIRedEyeRepair repairDecisionWithFaceRecord:left:redHopper:whiteHopper:](self, "repairDecisionWithFaceRecord:left:redHopper:whiteHopper:", a5, 0, &v82, &v62);
    }
    else
    {
      v51 = 0u;
      v52 = 0u;
      *(float *)&v22 = v21;
      if ((objc_msgSend(0, "extractAndGatherProminencesWithRect:face:faceIndex:left:maxwindowsize:repairsize:returningRedHopper:whiteHopper:redChannel:redChannelMask:", v11, v10, a5, a8, 0, &v82, COERCE_DOUBLE((unint64_t)LODWORD(v20)), v22, &v62, v55, v53) & 1) == 0)return;
      v47 = 0u;
      v48 = 0u;
    }
    v49 = v47;
    v50 = v48;
    -[CIRedEyeRepair extractAverageFaceY:contrast:faceIndex:](self, "extractAverageFaceY:contrast:faceIndex:", a5, &v102, a8);
    if (v23 == 0.0 || (v24 = v102, a5->var9 = v23, a5->var10 = v24, !v8))
    {
      v33 = 0;
      standardTemplate = self->standardTemplate;
      v61 = standardTemplate;
    }
    else
    {
      v25 = (float)(v23 * 0.3125);
      v26 = v24;
      v27 = v25 + v26 * -0.289099991;
      v28 = rintf(v27);
      v29 = (uint64_t)v28 & ~((int)(uint64_t)v28 >> 31);
      *(double *)&standardTemplate.lo = v25 + v26 * 0.289099991;
      *(float *)&standardTemplate.lo = *(double *)&standardTemplate.lo;
      v31 = (uint64_t)rintf(*(float *)&standardTemplate.lo);
      if ((int)v31 >= 255)
        LODWORD(v31) = 255;
      v61.lo = (uint64_t)v28 & ~((int)(uint64_t)v28 >> 31);
      v61.med = (uint64_t)rintf((float)v29 + (float)((float)(v31 - v29) * 0.5));
      v32 = 1431655766 * (v29 + (int)v31 + v61.med + 1);
      v61.hi = v31;
      v61.average = HIDWORD(v32) + (v32 >> 63);
      v33 = 1;
    }
    standardTemplate.lo = LODWORD(a5->var4);
    v34 = -[CIRedEyeRepair applyEyeRepairWithEye:left:IOD:autoPupilTonality:match:faceIndex:whiteHopper:](self, "applyEyeRepairWithEye:left:IOD:autoPupilTonality:match:faceIndex:whiteHopper:", &v51, 1, v33, &v61, a8, &v72, *(double *)&standardTemplate.lo);
    *(float *)&v35 = a5->var4;
    v36 = -[CIRedEyeRepair applyEyeRepairWithEye:left:IOD:autoPupilTonality:match:faceIndex:whiteHopper:](self, "applyEyeRepairWithEye:left:IOD:autoPupilTonality:match:faceIndex:whiteHopper:", &v49, 0, v33, &v61, a8, &v62, v35);
    v37 = v36;
    if (self->lf->var10 && (_DWORD)v34 != -1 && (_DWORD)v36 != -1 && !BYTE9(v51) && !BYTE9(v49))
    {
      v38 = -[CIRedEyeRepair repairWithTag:](self, "repairWithTag:", v34);
      v39 = (float)(HIDWORD(v38->repairs[0].pt2.y) + LODWORD(v38->repairs[0].pt2.y)) * 0.5;
      v40 = (float)(HIDWORD(v38->repairs[0].pt2.x) + LODWORD(v38->repairs[0].pt2.x)) * 0.5;
      v41 = -[CIRedEyeRepair repairWithTag:](self, "repairWithTag:", v37);
      v42 = (int)(float)(v39 - (float)((float)(HIDWORD(v41->repairs[0].pt2.y) + LODWORD(v41->repairs[0].pt2.y)) * 0.5));
      v43 = (int)(float)(v40 - (float)((float)(HIDWORD(v41->repairs[0].pt2.x) + LODWORD(v41->repairs[0].pt2.x)) * 0.5));
      if ((float)((float)(int)sqrt((double)(v42 * v42 + v43 * v43)) / a5->var4) >= 0.8)
      {
        v44 = 1;
        goto LABEL_26;
      }
      -[CIRedEyeRepair undoRepair:](self, "undoRepair:", v34);
      -[CIRedEyeRepair undoRepair:](self, "undoRepair:", v37);
      v34 = 0xFFFFFFFFLL;
      v37 = 0xFFFFFFFFLL;
    }
    v44 = (_DWORD)v37 != -1;
    if ((_DWORD)v34 != -1 || (_DWORD)v37 != -1)
    {
      if ((_DWORD)v34 == -1)
      {
        if ((_DWORD)v37 == -1)
          return;
LABEL_27:
        v46 = -[CIRedEyeRepair repairWithTag:](self, "repairWithTag:", v37);
        v46->repairs[0].fullNew.rowBytes = a8;
        LOBYTE(v46->repairs[0].fullNew.size) = 0;
        v46->repairs[0].fullNew.samplesPerPixel = LODWORD(a5->var4);
        return;
      }
LABEL_26:
      v45 = -[CIRedEyeRepair repairWithTag:](self, "repairWithTag:", v34);
      v45->repairs[0].fullNew.rowBytes = a8;
      LOBYTE(v45->repairs[0].fullNew.size) = 1;
      v45->repairs[0].fullNew.samplesPerPixel = LODWORD(a5->var4);
      if (!v44)
        return;
      goto LABEL_27;
    }
  }
}

- (int)distanceMaskFromPolyToCb:(int)a3 Cr:(int)a4
{
  uint64_t nLinears;
  int *v5;
  int v6;
  int v7;
  int v8;
  int v9;

  if (!self->polyClosed)
    return 0;
  nLinears = self->nLinears;
  if ((int)nLinears < 1)
  {
    v6 = 256;
  }
  else
  {
    v5 = &self->linearCoefficients[0][2];
    v6 = 256;
    do
    {
      v7 = *(v5 - 2) * (a3 - 128) + *(v5 - 1) * (a4 - 128);
      v8 = *v5;
      v5 += 3;
      v9 = v7 + v8;
      if (v9 < v6)
        v6 = v9;
      --nLinears;
    }
    while (nLinears);
  }
  if ((v6 & ~(v6 >> 31)) >= 0xFF)
    return 255;
  else
    return v6 & ~(v6 >> 31);
}

- (void)prepareLineFunctions
{
  double v2;
  int *p_nLinears;
  int32x2_t *nPolyPoints;
  int32x2_t *v6;
  int v7;
  int v8;
  BOOL *polyPointConcave;
  CGPoint *polyPoints;
  CGPoint *v11;
  CGFloat *p_y;
  int32x2_t *v13;
  double *p_x;
  double v15;
  double v16;
  double v17;
  double v18;
  char *v19;
  double *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float *v26;
  int32x2_t *v27;
  float v28;
  BOOL v29;
  int32x2_t *v30;
  float *p_c;
  BOOL v32;
  int32x2_t *v33;
  uint64_t v34;
  double *v35;
  double *v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float64_t v41;
  double v42;
  double v43;
  double v44;
  float64x2_t v45;
  int v46;
  CGFloat *v47;
  float *v48;
  uint64_t v49;
  float32x2_t v50;
  double v51;
  uint64_t v52;
  double *v53;
  double v54;
  float32x2_t v55;
  float v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  unsigned __int8 *v61;
  float v62[20];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  p_nLinears = &self->nLinears;
  nPolyPoints = (int32x2_t *)self->nPolyPoints;
  if ((int)nPolyPoints < 1)
  {
    *p_nLinears = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    polyPointConcave = self->polyPointConcave;
    polyPoints = self->polyPoints;
    v11 = self->polyPoints;
    p_y = &self->polyPoints[0].y;
    v13 = (int32x2_t *)((char *)nPolyPoints - 1);
    do
    {
      p_x = &polyPoints[((int)nPolyPoints + (int)v6 - 1) % (int)nPolyPoints].x;
      v15 = *p_x;
      v16 = p_x[1];
      v17 = *(p_y - 1);
      v18 = *p_y;
      if (v13 == v6)
        v19 = 0;
      else
        v19 = (char *)v6 + 1;
      v20 = &polyPoints[(_QWORD)v19].x;
      v21 = v17 - v15;
      v22 = v18 - v16;
      v23 = *v20 - v17;
      v24 = v20[1] - v18;
      v25 = (float)(v21 * v24) - (float)(v23 * v22);
      if (v25 >= 0.0)
      {
        if (v25 > 0.0)
          ++v8;
      }
      else
      {
        ++v7;
      }
      v62[(_QWORD)v6] = v25;
      p_y += 2;
      v6 = (int32x2_t *)((char *)v6 + 1);
    }
    while (nPolyPoints != v6);
    if (v7 && v8)
    {
      v26 = v62;
      v27 = nPolyPoints;
      while (1)
      {
        v28 = *v26;
        *polyPointConcave = 0;
        if (v28 >= 0.0)
          break;
        if (v8 > v7)
          goto LABEL_16;
LABEL_17:
        ++polyPointConcave;
        ++v26;
        v27 = (int32x2_t *)((char *)v27 - 1);
        if (!v27)
          goto LABEL_24;
      }
      v29 = v28 > 0.0 && v8 <= v7;
      if (!v29)
        goto LABEL_17;
LABEL_16:
      *polyPointConcave = 1;
      goto LABEL_17;
    }
LABEL_24:
    v30 = 0;
    p_c = &self->polyLines[0].c;
    do
    {
      v32 = v13 == v30;
      v33 = (int32x2_t *)((char *)v30 + 1);
      v34 = ((_DWORD)v30 + 1);
      if (v32)
        v34 = 0;
      v35 = &polyPoints[v34].x;
      if (v8 <= v7)
        v36 = &v11->x;
      else
        v36 = v35;
      if (v8 > v7)
        v35 = &v11->x;
      v37 = *v36;
      v38 = v36[1];
      v39 = *v35;
      v40 = v35[1];
      v41 = (float)(v39 - v37);
      v42 = (float)(v40 - v38);
      v43 = 1.0 / sqrt(v42 * v42 + v41 * v41);
      v44 = (float)((float)(v37 * v40) - (float)(v38 * v39));
      v45.f64[0] = -v42;
      v45.f64[1] = v41;
      *((float32x2_t *)p_c - 1) = vcvt_f32_f64(vmulq_n_f64(v45, v43));
      *(float *)&v44 = v43 * v44;
      *p_c = *(float *)&v44;
      p_c += 3;
      ++v11;
      v30 = v33;
    }
    while (nPolyPoints != v33);
    v46 = 0;
    *p_nLinears = 0;
    v47 = &self->polyPoints[0].y;
    v48 = &self->polyLines[0].c;
    v49 = 1;
    v2 = 255.0;
    v50 = (float32x2_t)vdup_n_s32(0xC3800000);
    do
    {
      v51 = *(v47 - 1);
      if (v49 == nPolyPoints)
        v52 = 0;
      else
        v52 = v49;
      v53 = &polyPoints[v52].x;
      v54 = *v53;
      if ((v51 <= 255.0 || v54 <= 255.0) && (v51 >= 0.0 || v54 >= 0.0) && (*v47 <= 255.0 || v53[1] <= 255.0))
      {
        nPolyPoints = (int32x2_t *)self->linearCoefficients[v46];
        v55 = *(float32x2_t *)(v48 - 2);
        v56 = *v48 + vaddv_f32(v55) * 128.0;
        *nPolyPoints = vcvt_s32_f32(vrnda_f32(vmul_f32(v55, v50)));
        nPolyPoints[1].i32[0] = llroundf((float)(v56 * -256.0) + 255.0);
        v46 = *p_nLinears + 1;
        *p_nLinears = v46;
        LODWORD(nPolyPoints) = self->nPolyPoints;
      }
      v47 += 2;
      v29 = v49++ < (int)nPolyPoints;
      v48 += 3;
    }
    while (v29);
  }
  v57 = 0;
  v58 = 0;
  do
  {
    v59 = 0;
    v60 = v57;
    v61 = &self->CbCrDistanceTable[v57];
    do
    {
      v61[v59] = -[CIRedEyeRepair distanceMaskFromPolyToCb:Cr:](self, "distanceMaskFromPolyToCb:Cr:", v58, v59, v2);
      ++v59;
    }
    while ((_DWORD)v59 != 256);
    v58 = (v58 + 1);
    v57 = v60 + 256;
  }
  while ((_DWORD)v58 != 256);
}

- (void)skinInit
{
  self->nPolyPoints = 4;
  self->polyPoints[0].x = 125.578;
  *(_OWORD *)&self->polyPoints[0].y = xmmword_192499E00;
  *(_OWORD *)&self->polyPoints[1].y = xmmword_192499E10;
  *(_OWORD *)&self->polyPoints[2].y = xmmword_192499E20;
  self->polyPoints[3].y = 138.85;
  self->polyClosed = 1;
  -[CIRedEyeRepair prepareLineFunctions](self, "prepareLineFunctions");
}

- (int)redEyeRemovalWithData:(id *)a3
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_lastClickYBitmap;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int var14;
  unsigned __int8 **v21;
  unsigned __int8 **v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int var9;
  void **v28;
  void **v29;
  void **v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int *v40;
  void **Alpha;
  void **v42;
  int var15;
  uint64_t v44;
  int v45;
  int v46;
  int *v47;
  int nRepairs;
  char *v49;
  int nextRepairTag;
  char *v51;
  int64x2_t v52;
  void **v53;
  int var13;
  float v56;
  uint64_t v57;
  unint64_t v58;
  float v59;
  uint64_t v60;
  float v61;
  uint64_t v62;
  int8x16_t v63;
  int8x16_t v64;
  uint64_t v65;
  uint64_t v66;
  void **v67;
  void *v68;
  void **v69;
  int *v70;
  $F19D4DADCC5A4AF414AA3A0637C491CF *p_lastClickCbCrBitmap;
  char v72;
  _OWORD v73[2];
  uint64_t v74;
  _OWORD v75[2];
  uint64_t v76;
  void *v77[2];
  __int128 v78;
  uint64_t v79;
  void *__dst[2];
  __int128 v81;
  uint64_t v82;
  _OWORD v83[3];
  __int128 v84;
  __int128 v85;
  _OWORD v86[4];
  _QWORD v87[2];
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE v91[256];
  _BYTE v92[3200];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&a3->var17.var2;
  v83[0] = *(_OWORD *)&a3->var17.var0;
  v83[1] = v3;
  v83[2] = *(_OWORD *)&a3->var17.var6;
  v5 = *(_QWORD *)&a3->var18.var0;
  v4 = *(_QWORD *)&a3->var18.var2;
  if (((BYTE4(v4) - (_BYTE)v4) & 1) != 0)
    v6 = v4 - 0x100000000;
  else
    v6 = *(_QWORD *)&a3->var18.var2;
  v7 = HIDWORD(v5) - ((BYTE4(v5) - (_BYTE)v5) & 1);
  v8 = HIDWORD(v6) - v6;
  if (SHIDWORD(v6) <= (int)v6 || v7 <= (int)v5)
    return -1;
  v12 = *(_QWORD *)&a3->var18.var0;
  v13 = *(_QWORD *)&a3->var11.var0;
  v14 = *(_QWORD *)&a3->var11.var2;
  p_lastClickYBitmap = &self->lastClickYBitmap;
  v16 = v12 | ((unint64_t)v7 << 32);
  p_lastClickCbCrBitmap = &self->lastClickCbCrBitmap;
  if (!-[CIRedEyeRepair extractReusableAlignedBitmapsAroundPoint:YR:subYBitmap:subCbCrBitmap:](self, "extractReusableAlignedBitmapsAroundPoint:YR:subYBitmap:subCbCrBitmap:", &self->lf->var2, v16, v6, &self->lastClickYBitmap))return -1;
  v70 = (int *)p_lastClickYBitmap;
  v17 = (uint64_t)p_lastClickYBitmap;
  if (a3->var14 != 2)
  {
    v18 = zmalloc(0x28uLL);
    if (!v18)
      return -1;
    v19 = (uint64_t)v18;
    var14 = a3->var14;
    v17 = (uint64_t)v70;
    if (var14 != 2)
    {
      if (var14 == 1)
      {
        v21 = (unsigned __int8 **)v70;
        v22 = (unsigned __int8 **)p_lastClickCbCrBitmap;
        v23 = v19;
        v24 = 5;
      }
      else
      {
        if (var14)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v21 = (unsigned __int8 **)v70;
        v22 = (unsigned __int8 **)p_lastClickCbCrBitmap;
        v23 = v19;
        v24 = 0;
      }
      computeRedChannel(v21, v22, v23, v24);
      goto LABEL_17;
    }
  }
LABEL_18:
  v65 = v14;
  v66 = v13;
  v89 = 0;
  v90 = 0;
  v88 = 0uLL;
  v87[0] = 0;
  v87[1] = 0;
  v84 = 0u;
  v85 = 0u;
  memset(v86, 0, sizeof(v86));
  *(_OWORD *)__dst = 0u;
  v81 = 0u;
  v82 = 0;
  *(_OWORD *)v77 = 0u;
  v78 = 0u;
  v79 = 0;
  v76 = 0;
  memset(v75, 0, sizeof(v75));
  v74 = 0;
  memset(v73, 0, sizeof(v73));
  v69 = (void **)v17;
  v67 = recomputeBitmask(v17, a3->var4 - (int)v6, (a3->var5 - v12), a3->var6, (uint64_t)&v84);
  if (!v67)
  {
    v84 = 0uLL;
    *(_QWORD *)&v85 = 0;
    *(_QWORD *)((char *)v86 + 4) = makeBitmapRect(0, 0, 0, 0);
    *(_QWORD *)((char *)v86 + 12) = v25;
  }
  v26 = a3->var14;
  if (!(_DWORD)v26)
  {
    var9 = a3->var9;
    if (var9)
      v28 = recomputeBitmask((uint64_t)v70, a3->var7 - (int)v6, (a3->var8 - v12), var9, 0);
    else
      v28 = 0;
    v29 = (void **)cornealReflectionBitmask((uint64_t)v28, (uint64_t)v69, v85);
    if (v29)
    {
      v30 = v29;
      v31 = bitmaskBoundingBitmapRect((uint64_t)v29);
      v33 = intersectBitmapRects(v31, v32, *(uint64_t *)((char *)v86 + 4));
      if (v35 > v34 && SHIDWORD(v33) > (int)v33)
        infillChannelWithBitmask((uint64_t)v69, (uint64_t)v30);
      termBitmask(v30);
    }
    if (v28)
      termBitmask(v28);
  }
  v36 = v7 - v12;
  initBitmap((uint64_t)__dst, HIDWORD(v6) - v6, v7 - v12, 1, 1, 100.0);
  if (v8 >= 0)
    v37 = HIDWORD(v6) - v6;
  else
    v37 = v8 + 1;
  v38 = v37 >> 1;
  if (v36 >= 0)
    v39 = v7 - v12;
  else
    v39 = v36 + 1;
  initBitmap((uint64_t)v77, v38, v39 >> 1, 2, 1, 100.0);
  memmove(__dst[0], self->lastClickYBitmap.baseAddress, self->lastClickYBitmap.size);
  memmove(v77[0], self->lastClickCbCrBitmap.baseAddress, self->lastClickCbCrBitmap.size);
  v40 = computePupilAlphaMap((uint64_t)v69, v26, v85, (uint64_t)v83, &v90, (_DWORD *)&v89 + 1);
  if (v40)
  {
    Alpha = (void **)v40;
    computeBorderForAlpha((uint64_t)v69, (uint64_t)v40, v92, (int *)&v89);
    v42 = v67;
  }
  else
  {
    v42 = v67;
    Alpha = extractAlpha((uint64_t)v69, (uint64_t)v67, v92, (int *)&v89);
    if (!Alpha)
    {
      if (v67)
        termBitmask(v67);
      if ((_DWORD)v26 != 2)
      {
        termBitmap(v69);
        zfree(v69);
      }
      termBitmap(__dst);
      v53 = v77;
      goto LABEL_66;
    }
  }
  HIDWORD(v90) = 0;
  var15 = a3->var15;
  v44 = *(_QWORD *)&a3->var12.var0;
  v68 = *(void **)&a3->var12.var2;
  if (var15 == 2)
  {
    v47 = (int *)&v72;
    if (!a3->var10)
      v47 = 0;
    v46 = whiteEyeCancellation(v70, (uint64_t)p_lastClickCbCrBitmap, a3->var16, v16, v6, (unsigned __int8 **)Alpha, (uint64_t)v92, v89, (uint64_t)v42, (uint64_t)&v84, (uint64_t *)__dst, (uint64_t)v77, (uint64_t)v83, v47, (_DWORD *)&v90 + 1);
  }
  else
  {
    v45 = 0;
    if (var15)
      goto LABEL_50;
    if (a3->var10 || a3->var14 == 1)
    {
      buildTransferTable(v44, (uint64_t)v68, v66 | ((unint64_t)(uint64_t)rintf((float)(int)v66+ (float)((float)(v65 - v66)* (float)((float)(HIDWORD(v44) - v44)/ (float)((int)v68 - v44)))) << 32), v65, (uint64_t)v91);
    }
    else
    {
      var13 = a3->var13;
      if (var13 == -1)
      {
        LODWORD(v57) = 40;
      }
      else
      {
        v56 = (float)var13 * 0.52;
        v57 = (uint64_t)rintf(v56);
      }
      if (HIDWORD(v68) && (int)v57 < SHIDWORD(v68))
      {
        v58 = 0;
        v59 = (float)(int)v57 / (float)SHIDWORD(v68);
        do
        {
          if (v58 < 0xC9)
          {
            v60 = (uint64_t)rintf(v59 * (float)(int)v58);
            if ((int)v60 >= 255)
              LOBYTE(v60) = -1;
            if (v58 >= 0xB5)
            {
              v61 = v59 + (float)((float)((int)v58 - 180) / 20.0) * (1.0 - v59);
              v60 = (uint64_t)rintf((float)(int)v58 * v61);
              if ((int)v60 >= 255)
                LOBYTE(v60) = -1;
            }
          }
          else
          {
            LOBYTE(v60) = v58;
          }
          v91[v58++] = v60;
        }
        while (v58 != 256);
      }
      else
      {
        v62 = 0;
        v63 = (int8x16_t)xmmword_192499E30;
        v64.i64[0] = 0x1010101010101010;
        v64.i64[1] = 0x1010101010101010;
        do
        {
          *(int8x16_t *)&v91[v62] = v63;
          v62 += 16;
          v63 = vaddq_s8(v63, v64);
        }
        while (v62 != 256);
      }
    }
    redEyeCancellation(v70, (unsigned __int8 **)p_lastClickCbCrBitmap, (uint64_t *)Alpha, (uint64_t *)__dst, (uint64_t *)v77, (uint64_t)v91, (_DWORD *)&v90 + 1);
  }
  v45 = v46;
LABEL_50:
  if (v42)
    termBitmask(v42);
  if (a3->var14 != 2)
  {
    termBitmap(v69);
    zfree(v69);
  }
  if (!-[CIRedEyeRepair computeTrimmedBitmaps:newY:newCbCr:IR:newTrimY:newTrimCbCr:returningYR:andCbCrR:](self, "computeTrimmedBitmaps:newY:newCbCr:IR:newTrimY:newTrimCbCr:returningYR:andCbCrR:", &self->lf->var2, __dst, v77, v16, v6, v75, v73, &v88, v87))
  {
    termBitmap(__dst);
    termBitmap(v77);
    v53 = Alpha;
LABEL_66:
    termBitmap(v53);
    return -1;
  }
  nRepairs = self->nRepairs;
  if (nRepairs > 31)
  {
    v51 = 0;
  }
  else
  {
    v49 = (char *)self + 400 * nRepairs;
    nextRepairTag = self->nextRepairTag;
    self->lastRepairTag = nextRepairTag;
    *((_DWORD *)v49 + 18) = nextRepairTag;
    v51 = v49 + 72;
    self->lastRepairIOD = a3->var16;
    self->nRepairs = nRepairs + 1;
    self->nextRepairTag = nextRepairTag + 1;
    v52.i64[0] = (int)*(_QWORD *)&a3->var0;
    v52.i64[1] = (int)HIDWORD(*(_QWORD *)&a3->var0);
    *(float64x2_t *)(v51 + 8) = vcvtq_f64_s64(v52);
    *((_DWORD *)v51 + 6) = var15;
    *((_DWORD *)v51 + 7) = a3->var14;
    *((_DWORD *)v51 + 8) = v45;
    *((_DWORD *)v51 + 9) = HIDWORD(v90);
    *((_OWORD *)v51 + 5) = v88;
    initBitmap((uint64_t)(v51 + 40), HIDWORD(v88) - DWORD2(v88), DWORD1(v88) - v88, 4, 1, 100.0);
    ConvertYCbCrtoREDEYEFORMAT((unsigned __int8 **)v75, (unsigned __int8 **)v73, (uint64_t)(v51 + 40), self->lf->var8);
    *((_QWORD *)v51 + 12) = v44;
    *((_QWORD *)v51 + 13) = v68;
    v51[112] = a3->var10;
    *(_QWORD *)(v51 + 116) = v66;
    *(_QWORD *)(v51 + 124) = v65;
  }
  termBitmap(Alpha);
  zfree(Alpha);
  termBitmap(__dst);
  termBitmap(v77);
  termBitmap((void **)v75);
  termBitmap((void **)v73);
  if (v51)
    return *(_DWORD *)v51;
  return -1;
}

- (void)autoRepairWithFaceArray:(id)a3
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  $E2FF20502B54F5B442CF0C89360BE755 *lf;
  uint64_t v33;
  _DWORD *v34;
  id v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  BOOL v41;
  void *v42;
  int v43;
  int v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  uint64_t v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  double v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  BOOL *p_iLeft;
  int v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  CIRedEyeRepair *v66;
  float v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  double v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int var0;
  int var2;
  int v90;
  int v92;
  void *v93;
  int v94;
  char v96;
  _BYTE v97[1908];

  *(_QWORD *)&v97[1892] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a3, "count");
  v93 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = v3;
    do
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(a3, "objectAtIndex:", v4));
      objc_msgSend(v93, "addObject:", v6);
      v7 = (void *)objc_msgSend(v6, "valueForKey:", CFSTR("leftEyeX"));
      v8 = objc_msgSend(v6, "valueForKey:", CFSTR("leftEyeY"));
      if (v7)
        v9 = v8 == 0;
      else
        v9 = 1;
      v10 = v9;
      if (v9)
      {
        v13 = 0;
        v12 = 0;
      }
      else
      {
        v11 = (void *)v8;
        v12 = objc_msgSend(v7, "intValue");
        v13 = objc_msgSend(v11, "intValue");
      }
      v14 = (void *)objc_msgSend(v6, "valueForKey:", CFSTR("rightEyeX"));
      v15 = objc_msgSend(v6, "valueForKey:", CFSTR("rightEyeY"));
      if (v14)
        v16 = v15 == 0;
      else
        v16 = 1;
      if (v16)
      {
        if ((v10 & 1) != 0)
          return;
      }
      else
      {
        v17 = (void *)v15;
        v18 = objc_msgSend(v14, "intValue");
        v19 = objc_msgSend(v17, "intValue");
        if ((v10 & 1) == 0)
        {
          v20 = v19;
          v21 = (void *)objc_msgSend(v6, "valueForKey:", CFSTR("centerX"));
          v22 = objc_msgSend(v6, "valueForKey:", CFSTR("centerY"));
          if (v21 && (v23 = (void *)v22) != 0)
          {
            LODWORD(v21) = objc_msgSend(v21, "intValue");
            LODWORD(v23) = objc_msgSend(v23, "intValue");
          }
          else
          {
            v21 = (void *)(uint64_t)rintf((float)((float)(v18 + v12) * 0.5) - (float)((float)(v20 - v13) * 0.5));
            v23 = (void *)(uint64_t)rintf((float)((float)(v18 - v12) * 0.5) + (float)((float)(v20 + v13) * 0.5));
            objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21), CFSTR("centerX"));
            objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23), CFSTR("centerY"));
          }
          v24 = objc_msgSend(v6, "valueForKey:", CFSTR("mouthCenterX"));
          v25 = objc_msgSend(v6, "valueForKey:", CFSTR("mouthCenterY"));
          if (!v24 || !v25)
          {
            objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (uint64_t)rintf((float)(int)v21 - (float)((float)(v20 - v13) * 0.5))), CFSTR("mouthCenterX"));
            objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (uint64_t)rintf((float)((float)(v18 - v12) * 0.5) + (float)(int)v23)), CFSTR("mouthCenterY"));
          }
        }
      }
      ++v4;
    }
    while (v5 != v4);
  }

  v26 = v93;
  self->faces = v26;
  v27 = -[NSArray count](v26, "count");
  if (v27 >= 1)
  {
    v28 = 0;
    v94 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    lf = self->lf;
    var0 = lf->var5.var0;
    var2 = lf->var5.var2;
    v33 = v27;
    v34 = v97;
    v87 = v27;
    do
    {
      v35 = -[NSArray objectAtIndex:](self->faces, "objectAtIndex:", v28);
      if (v28 <= 0x1F)
      {
        v38 = v35;
        v39 = (void *)objc_msgSend(v35, "valueForKey:", CFSTR("leftEyeX"));
        v40 = objc_msgSend(v38, "valueForKey:", CFSTR("leftEyeY"));
        if (v39)
          v41 = v40 == 0;
        else
          v41 = 1;
        if (v41)
        {
          v44 = 0;
          v43 = 0;
          v94 = 1;
        }
        else
        {
          v42 = (void *)v40;
          v43 = objc_msgSend(v39, "intValue");
          v44 = objc_msgSend(v42, "intValue");
        }
        v45 = (void *)objc_msgSend(v38, "valueForKey:", CFSTR("leftEyeSize"));
        v90 = v44;
        v92 = v43;
        if (v45)
        {
          objc_msgSend(v45, "floatValue");
          v47 = v46;
        }
        else
        {
          v47 = 0.0;
        }
        v48 = (void *)objc_msgSend(v38, "valueForKey:", CFSTR("rightEyeX"));
        v49 = objc_msgSend(v38, "valueForKey:", CFSTR("rightEyeY"));
        v50 = 0;
        v37 = 1;
        if (v48)
        {
          v51 = (void *)v49;
          v52 = 0;
          if (v49)
          {
            v52 = objc_msgSend(v48, "intValue");
            v50 = objc_msgSend(v51, "intValue");
            v37 = v29;
          }
        }
        else
        {
          v52 = 0;
        }
        v53 = (void *)objc_msgSend(v38, "valueForKey:", CFSTR("rightEyeSize"));
        if (v53)
          objc_msgSend(v53, "floatValue");
        else
          LODWORD(v54) = 0;
        if (((v94 | v37) & 1) != 0)
        {
          *((_BYTE *)v34 - 28) = 1;
          v56 = v90;
          v55 = v92;
          if ((v37 & 1) != 0)
          {
            *(float *)&v54 = v47;
          }
          else
          {
            v55 = v52;
            v56 = v50;
          }
          *(v34 - 6) = v55 - var2;
          *(v34 - 5) = v56 - var0;
          *(v34 - 4) = LODWORD(v54);
          v31 = v28 + 1;
        }
        else
        {
          v57 = objc_msgSend((id)objc_msgSend(v38, "valueForKey:", CFSTR("mouthCenterX"), v54), "intValue");
          v58 = objc_msgSend((id)objc_msgSend(v38, "valueForKey:", CFSTR("mouthCenterY")), "intValue");
          v59 = objc_msgSend((id)objc_msgSend(v38, "valueForKey:", CFSTR("centerX")), "intValue");
          v60 = objc_msgSend((id)objc_msgSend(v38, "valueForKey:", CFSTR("centerY")), "intValue");
          v37 = 0;
          v94 = 0;
          v34[4] = v92 - var2;
          v34[5] = v90 - var0;
          v34[6] = v52 - var2;
          v34[7] = v50 - var0;
          *((_BYTE *)v34 - 28) = 0;
          *(v34 - 2) = v57 - var2;
          *(v34 - 1) = v58 - var0;
          *v34 = v59 - var2;
          v34[1] = v60 - var0;
          *((float *)v34 - 3) = sqrtf((float)((v90 - v50) * (v90 - v50) + (v92 - v52) * (v92 - v52)));
          v31 = v30 + 1;
        }
        v33 = v87;
      }
      else
      {
        v37 = v29;
      }
      ++v28;
      ++v30;
      v34 += 15;
      v29 = v37;
    }
    while (v33 != v28);
    p_iLeft = &self->iLeft;
    if (v31 >= 1)
    {
      v62 = 0;
      v63 = &v96;
      do
      {
        if (*v63)
        {
          self->iFaceIndex = v62;
          *p_iLeft = 1;
          LODWORD(v36) = 0;
          v64 = -[CIRedEyeRepair redEyeRemovalWithPoint:alignPupilShades:matching:force:IOD:tap:](self, "redEyeRemovalWithPoint:alignPupilShades:matching:force:IOD:tap:", 0, 0, 0, 0xFFFFFFFFLL, 1, (double)*((int *)v63 + 1), (double)*((int *)v63 + 2), v36);
          if ((_DWORD)v64 != -1)
          {
            v65 = v64;
            v66 = -[CIRedEyeRepair repairWithTag:](self, "repairWithTag:", v64);
            if ((float)((float)(*(float *)&v66->repairs[0].data.O.orientation / 255.0)
                       * (float)((float)(v66->repairs[0].data.CR.maxrow - LODWORD(v66->repairs[0].BI.centroid.x)) / 255.0)) < 0.0153787
              || *((float *)&v66->repairs[0].data.O.bproc + 1) < 0.45)
            {
              -[CIRedEyeRepair undoRepair:](self, "undoRepair:", v65);
            }
          }
        }
        else if (*((float *)v63 + 4) >= 20.0)
        {
          +[CIRedEyeRepair upperRepairDistance:](CIRedEyeRepair, "upperRepairDistance:");
          v68 = (uint64_t)rintf(v67);
          alignedBitmapRectAroundPoint(*((_DWORD *)v63 + 11), *((_DWORD *)v63 + 12), v68);
          v70 = v69;
          v72 = v71;
          alignedBitmapRectAroundPoint(*((_DWORD *)v63 + 13), *((_DWORD *)v63 + 14), v68);
          v74 = v73;
          v76 = v75;
          v77 = clipBitmapRectToBitmapBounds(v70, v72, (uint64_t)&self->lf->var2);
          v78 = evenBitmapRect(v77);
          v80 = v79;
          v81 = clipBitmapRectToBitmapBounds(v74, v76, (uint64_t)&self->lf->var2);
          v82 = evenBitmapRect(v81);
          LODWORD(v86) = v62;
          LODWORD(v83) = 1.0;
          v84 = v78;
          p_iLeft = &self->iLeft;
          -[CIRedEyeRepair autoRepairExtractAndSearchLeft:right:data:repairSize:autoPupilTonality:faceIndex:](self, "autoRepairExtractAndSearchLeft:right:data:repairSize:autoPupilTonality:faceIndex:", v84, v80, v82, v85, v63, self->autoPupilTonality, v83, v86);
        }
        ++v62;
        v63 += 60;
      }
      while (v31 != v62);
    }
  }
}

- (id)repairArray
{
  void *v3;
  int v4;
  $E2FF20502B54F5B442CF0C89360BE755 *lf;
  int var4;
  int var3;
  float v8;
  float v9;
  int v10;
  double v11;
  float v12;
  int var2;
  int var0;
  $0E854BE5C474287A973B27EFA68E97BA *p_data;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _QWORD v46[37];
  _QWORD v47[39];

  v47[37] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->nRepairs);
  if (self->nRepairs >= 1)
  {
    v4 = 0;
    lf = self->lf;
    var4 = lf->var4;
    var3 = lf->var3;
    v8 = 1.0 / (float)var4;
    v9 = 1.0 / (float)var3;
    v10 = var4 - 1;
    v11 = 1.0 / sqrt((float)(var4 * var4 + var3 * var3));
    v12 = v11;
    var2 = lf->var5.var2;
    var0 = lf->var5.var0;
    p_data = &self->repairs[0].data;
    do
    {
      v46[0] = CFSTR("pointX");
      *(float *)&v11 = v9 * (float)(p_data->origHitX + var2);
      v47[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11, CFSTR("pointX"));
      v46[1] = CFSTR("pointY");
      *(float *)&v16 = v8 * (float)(v10 - var0 - p_data->origHitY);
      v47[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
      v46[2] = CFSTR("forceCase");
      v47[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", p_data->characterizeCase);
      v46[3] = CFSTR("size");
      v17 = sqrt((float)p_data[-1].mTemplate.med / 3.14159265) * v12;
      *(float *)&v17 = v17;
      v47[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
      v46[4] = CFSTR("pupilShadeAlignment");
      v47[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_data->align);
      v46[5] = CFSTR("pupilShadeLow");
      *(float *)&v18 = (float)p_data->mTemplate.lo * 0.0039216;
      v47[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
      v46[6] = CFSTR("pupilShadeMedium");
      *(float *)&v19 = (float)p_data->mTemplate.med * 0.0039216;
      v47[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
      v46[7] = CFSTR("pupilShadeHigh");
      *(float *)&v20 = (float)p_data->mTemplate.hi * 0.0039216;
      v47[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
      v46[8] = CFSTR("interocularDistance");
      *(float *)&v21 = p_data->IOD * v12;
      v47[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
      v46[9] = CFSTR("snappedX");
      *(float *)&v22 = v9 * (float)(p_data->snapHitX + var2);
      v47[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
      v46[10] = CFSTR("snappedY");
      *(float *)&v23 = v8 * (float)(v10 - var0 - p_data->snapHitY);
      v47[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
      v46[11] = CFSTR("bitmaskX");
      *(float *)&v24 = v9 * (float)(p_data->bitmaskSeedX + var2);
      v47[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
      v46[12] = CFSTR("bitmaskY");
      *(float *)&v25 = v8 * (float)(v10 - var0 - p_data->bitmaskSeedY);
      v47[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
      v46[13] = CFSTR("bitmaskThreshold");
      *(float *)&v26 = (float)p_data->bitmaskThreshold * 0.0039216;
      v47[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
      v46[14] = CFSTR("cornealReflectionX");
      *(float *)&v27 = v9 * (float)(p_data->cornealReflectionSeedX + var2);
      v47[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
      v46[15] = CFSTR("cornealReflectionY");
      *(float *)&v28 = v8 * (float)(v10 - var0 - p_data->cornealReflectionSeedY);
      v47[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
      v46[16] = CFSTR("cornealReflectionThreshold");
      *(float *)&v29 = (float)p_data->cornealReflectionThreshold * 0.0039216;
      v47[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
      v46[17] = CFSTR("pupilShadeAverage");
      *(float *)&v30 = (float)p_data->mTemplate.average * 0.0039216;
      v47[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
      v46[18] = CFSTR("existingPupilLow");
      *(float *)&v31 = (float)p_data->existingTemplate.lo * 0.0039216;
      v47[18] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
      v46[19] = CFSTR("existingPupilMedium");
      *(float *)&v32 = (float)p_data->existingTemplate.med * 0.0039216;
      v47[19] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
      v46[20] = CFSTR("existingPupilHigh");
      *(float *)&v33 = (float)p_data->existingTemplate.hi * 0.0039216;
      v47[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
      v46[21] = CFSTR("existingPupilAverage");
      *(float *)&v34 = (float)p_data->existingTemplate.average * 0.0039216;
      v47[21] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
      v46[22] = CFSTR("averageSkinLuminance");
      *(float *)&v35 = (float)p_data->averageSkinMapY * 0.0039216;
      v47[22] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
      v46[23] = CFSTR("finalEyeCase");
      v47[23] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", p_data->finalEyeCase);
      v46[24] = CFSTR("imageOrientation");
      v47[24] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", p_data->O.orientation);
      v46[25] = CFSTR("imageSignalToNoiseRatio");
      *(float *)&v36 = p_data->O.SNR;
      v47[25] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
      v46[26] = CFSTR("imageSpecialValue");
      v47[26] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_data->O.N90);
      v46[27] = CFSTR("searchRectangleMinimumY");
      *(float *)&v37 = v8 * (float)(v10 - var0 - p_data->CR.minrow);
      v47[27] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
      v46[28] = CFSTR("searchRectangleMaximumY");
      *(float *)&v38 = v8 * (float)(v10 - var0 - p_data->CR.maxrow);
      v47[28] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
      v46[29] = CFSTR("searchRectangleMinimumX");
      *(float *)&v39 = v9 * (float)(p_data->CR.mincol + var2);
      v47[29] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
      v46[30] = CFSTR("searchRectangleMaximumX");
      *(float *)&v40 = v9 * (float)(p_data->CR.maxcol + var2);
      v47[30] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
      v46[31] = CFSTR("fullImageWidth");
      v47[31] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->lf->var3);
      v46[32] = CFSTR("fullImageHeight");
      v47[32] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->lf->var4);
      v46[33] = CFSTR("repairRectangleMinimumY");
      *(float *)&v41 = v8 * (float)(v10 - var0 - LODWORD(p_data[-1].O.bitmapproc_context));
      v47[33] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
      v46[34] = CFSTR("repairRectangleMaximumY");
      *(float *)&v42 = v8 * (float)(v10 - var0 - HIDWORD(p_data[-1].O.bitmapproc_context));
      v47[34] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
      v46[35] = CFSTR("repairRectangleMinimumX");
      *(float *)&v43 = v9 * (float)(LODWORD(p_data[-1].O.bproc) + var2);
      v47[35] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
      v46[36] = CFSTR("repairRectangleMaximumX");
      *(float *)&v44 = v9 * (float)(HIDWORD(p_data[-1].O.bproc) + var2);
      v47[36] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
      objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 37));
      ++v4;
      p_data = ($0E854BE5C474287A973B27EFA68E97BA *)((char *)p_data + 400);
    }
    while (v4 < self->nRepairs);
  }
  return v3;
}

- (BOOL)getFloat:(float *)a3 d:(id)a4 s:(id)a5
{
  void *v6;
  int v7;

  v6 = (void *)objc_msgSend(a4, "valueForKey:", a5);
  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    *(_DWORD *)a3 = v7;
    LOBYTE(v6) = 1;
  }
  return (char)v6;
}

- (BOOL)getInt:(int *)a3 d:(id)a4 s:(id)a5
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(a4, "valueForKey:", a5);
  v7 = v6;
  if (v6)
    *a3 = objc_msgSend(v6, "intValue");
  return v7 != 0;
}

- (BOOL)getBool:(BOOL *)a3 d:(id)a4 s:(id)a5
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(a4, "valueForKey:", a5);
  v7 = v6;
  if (v6)
    *a3 = objc_msgSend(v6, "BOOLValue");
  return v7 != 0;
}

- (void)orientRectangleMinX:(float *)a3 maxX:(float *)a4 minY:(float *)a5 maxY:(float *)a6
{
  float v6;
  float v7;

  if (self->lf->var9 == 6)
  {
    v6 = *a3;
    v7 = *a4;
    *a3 = *a6;
    *a4 = *a5;
    *a5 = 1.0 - v6;
    *a6 = 1.0 - v7;
  }
}

- (void)orientPointX:(float *)a3 Y:(float *)a4
{
  float v4;

  if (self->lf->var9 == 6)
  {
    v4 = *a3;
    *a3 = *a4;
    *a4 = 1.0 - v4;
  }
}

- (void)executeRepair:(id)a3
{
  $E2FF20502B54F5B442CF0C89360BE755 *lf;
  int var4;
  int var3;
  int var2;
  int var0;
  float v10;
  float v11;
  unsigned int v12;
  char v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  int var1;
  $E2FF20502B54F5B442CF0C89360BE755 *v29;
  int v30;
  int v31;
  float v32;
  float v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int32x2_t v38;
  int32x2_t v39;
  $E2FF20502B54F5B442CF0C89360BE755 *v40;
  float32x2_t v41;
  uint64_t v47;
  double v48;
  CIRedEyeRepair *v49;
  float v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  unsigned int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  float v63;
  char v64;
  float v65;
  float v66;
  float v67;
  float v68;
  int32x2_t v69;
  float v70;
  uint64_t v71;
  float v72;
  uint64_t v73;
  float v74;
  uint64_t v75;
  float v76;
  uint64_t v77;
  float v78;
  uint64_t v79;
  float v80;
  int v81;
  float v82;
  int v83;
  float v84;
  int v85;
  float v86;
  int v87;
  _DWORD v88[10];
  char v89;
  __int16 v90;
  char v91;
  unint64_t v92;
  unint64_t v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  unsigned int v99;
  int v100;
  float v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  int v105;
  float v106;
  char v107;
  __int16 v108;
  char v109;
  int v110;
  float32x2_t v111;
  float v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  __int16 v118;
  char v119;
  float v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _BYTE v126[9];

  v126[0] = 0;
  v125 = 0;
  v124 = 0;
  v123 = 0;
  v122 = 0;
  v121 = 0;
  v120 = 0.0;
  v119 = 0;
  v118 = 0;
  lf = self->lf;
  var4 = lf->var4;
  var3 = lf->var3;
  var2 = lf->var5.var2;
  var0 = lf->var5.var0;
  if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v123, a3, CFSTR("pointX")))
  {
    if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", (char *)&v122 + 4, a3, CFSTR("pointY")))
    {
      -[CIRedEyeRepair orientPointX:Y:](self, "orientPointX:Y:", &v123, (char *)&v122 + 4);
      v10 = *((float *)&v122 + 1);
      v11 = *(float *)&v123;
      if (-[CIRedEyeRepair getInt:d:s:](self, "getInt:d:s:", (char *)&v125 + 4, a3, CFSTR("forceCase")))
      {
        v12 = HIDWORD(v125);
        if (-[CIRedEyeRepair getBool:d:s:](self, "getBool:d:s:", v126, a3, CFSTR("pupilShadeAlignment")))
        {
          v13 = v126[0];
          if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("pupilShadeLow")))
          {
            v14 = *(float *)&v124;
            if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("pupilShadeMedium")))
            {
              v15 = *(float *)&v124;
              if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("pupilShadeHigh")))
              {
                v16 = *(float *)&v124;
                if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("interocularDistance")))
                {
                  v17 = *(float *)&v124;
                  if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v123, a3, CFSTR("snappedX")))
                  {
                    if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", (char *)&v122 + 4, a3, CFSTR("snappedY")))
                    {
                      -[CIRedEyeRepair orientPointX:Y:](self, "orientPointX:Y:", &v123, (char *)&v122 + 4);
                      v19 = *((float *)&v122 + 1);
                      v18 = *(float *)&v123;
                      if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v123, a3, CFSTR("bitmaskX")))
                      {
                        if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", (char *)&v122 + 4, a3, CFSTR("bitmaskY")))
                        {
                          -[CIRedEyeRepair orientPointX:Y:](self, "orientPointX:Y:", &v123, (char *)&v122 + 4);
                          v84 = *(float *)&v123;
                          v86 = *((float *)&v122 + 1);
                          if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("bitmaskThreshold")))
                          {
                            v82 = *(float *)&v124;
                            if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v123, a3, CFSTR("cornealReflectionX")))
                            {
                              if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", (char *)&v122 + 4, a3, CFSTR("cornealReflectionY")))
                              {
                                -[CIRedEyeRepair orientPointX:Y:](self, "orientPointX:Y:", &v123, (char *)&v122 + 4);
                                v78 = *(float *)&v123;
                                v80 = *((float *)&v122 + 1);
                                if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("cornealReflectionThreshold")))
                                {
                                  v76 = *(float *)&v124;
                                  if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("pupilShadeAverage")))
                                  {
                                    v74 = *(float *)&v124;
                                    if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("existingPupilLow")))
                                    {
                                      v72 = *(float *)&v124;
                                      if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("existingPupilMedium")))
                                      {
                                        v70 = *(float *)&v124;
                                        if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("existingPupilHigh")))
                                        {
                                          v68 = *(float *)&v124;
                                          if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("existingPupilAverage")))
                                          {
                                            v67 = *(float *)&v124;
                                            if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("averageSkinLuminance")))
                                            {
                                              v66 = *(float *)&v124;
                                              if (-[CIRedEyeRepair getInt:d:s:](self, "getInt:d:s:", (char *)&v125 + 4, a3, CFSTR("finalEyeCase")))
                                              {
                                                v20 = HIDWORD(v125);
                                                if (-[CIRedEyeRepair getInt:d:s:](self, "getInt:d:s:", (char *)&v125 + 4, a3, CFSTR("imageOrientation")))
                                                {
                                                  v21 = HIDWORD(v125);
                                                  if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("imageSignalToNoiseRatio")))
                                                  {
                                                    v65 = *(float *)&v124;
                                                    if (-[CIRedEyeRepair getBool:d:s:](self, "getBool:d:s:", v126, a3, CFSTR("imageSpecialValue")))
                                                    {
                                                      v64 = v126[0];
                                                      if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v121, a3, CFSTR("searchRectangleMinimumY")))
                                                      {
                                                        if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v120, a3, CFSTR("searchRectangleMaximumY")))
                                                        {
                                                          if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v122, a3, CFSTR("searchRectangleMinimumX")))
                                                          {
                                                            if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", (char *)&v121 + 4, a3, CFSTR("searchRectangleMaximumX")))
                                                            {
                                                              v63 = (float)var4;
                                                              -[CIRedEyeRepair orientRectangleMinX:maxX:minY:maxY:](self, "orientRectangleMinX:maxX:minY:maxY:", &v122, (char *)&v121 + 4, &v121, &v120);
                                                              v22 = var4 - 1;
                                                              v23 = var4
                                                                  - 1
                                                                  - var0
                                                                  - (uint64_t)rintf(*(float *)&v121 * (float)var4);
                                                              v24 = var4 - 1 - var0 - (uint64_t)rintf(v120 * (float)var4);
                                                              if (v23 < v24)
                                                              {
                                                                v25 = (float)var3;
                                                                v26 = (uint64_t)rintf(*(float *)&v122 * (float)var3);
                                                                v27 = (uint64_t)rintf(*((float *)&v121 + 1) * (float)var3);
                                                                if ((int)v26 < (int)v27)
                                                                {
                                                                  var1 = v27 - var2;
                                                                  v29 = self->lf;
                                                                  if (var1 >= v29->var2.var1)
                                                                    var1 = v29->var2.var1;
                                                                  v30 = v23 & ~(v23 >> 31);
                                                                  v31 = v29->var2.var2;
                                                                  if (v24 < v31)
                                                                    v31 = v24;
                                                                  v61 = v31 - (((_BYTE)v31 - (_BYTE)v30) & 1);
                                                                  v62 = v30;
                                                                  v58 = v61 - v30;
                                                                  if (v61 - v30 >= 1)
                                                                  {
                                                                    v59 = var1
                                                                        - (((_BYTE)var1
                                                                          - ((v26 - var2) & ~(((int)v26 - var2) >> 31))) & 1);
                                                                    v60 = (v26 - var2) & ~(((int)v26 - var2) >> 31);
                                                                    if (v59 > v60)
                                                                    {
                                                                      v57 = (uint64_t)rintf(v11 * v25) - var2;
                                                                      if (v57 >= v60 && v57 < v59)
                                                                      {
                                                                        v56 = v22 - var0 - (uint64_t)rintf(v10 * v63);
                                                                        if (v56 >= v30 && v56 < v61 && v12 <= 2)
                                                                        {
                                                                          v55 = (uint64_t)rintf(v14 * 255.0);
                                                                          if ((v55 & 0x80000000) == 0)
                                                                          {
                                                                            v54 = (uint64_t)rintf(v15 * 255.0);
                                                                            if ((int)v54 >= (int)v55)
                                                                            {
                                                                              v53 = (uint64_t)rintf(v16 * 255.0);
                                                                              if ((int)v53 >= (int)v54
                                                                                && (int)v53 <= 255)
                                                                              {
                                                                                v75 = (uint64_t)rintf(v74 * 255.0);
                                                                                if ((v75 & 0x80000000) == 0
                                                                                  && (int)v75 <= 255)
                                                                                {
                                                                                  v32 = sqrtf((float)(var4 * var4 + var3 * var3));
                                                                                  v33 = v32 * v17;
                                                                                  if ((float)(v32 * v17) >= 0.0
                                                                                    && v33 <= 4000.0)
                                                                                  {
                                                                                    v34 = (uint64_t)rintf(v18 * v25)
                                                                                        - var2;
                                                                                    if (v34 >= v60 && v34 < v59)
                                                                                    {
                                                                                      v35 = v22
                                                                                          - var0
                                                                                          - (uint64_t)rintf(v19 * v63);
                                                                                      if (v35 >= v30 && v35 < v61)
                                                                                      {
                                                                                        v85 = (uint64_t)rintf(v84 * v25)
                                                                                            - var2;
                                                                                        if (v85 >= v60 && v85 < v59)
                                                                                        {
                                                                                          v87 = v22
                                                                                              - var0
                                                                                              - (uint64_t)rintf(v86 * v63);
                                                                                          if (v87 >= v30 && v87 < v61)
                                                                                          {
                                                                                            v52 = (uint64_t)rintf(v82 * 255.0);
                                                                                            if (v52 <= 0xFF)
                                                                                            {
                                                                                              v83 = (uint64_t)rintf(v78 * v25) - var2;
                                                                                              v81 = v22 - var0 - (uint64_t)rintf(v80 * v63);
                                                                                              v79 = (uint64_t)rintf(v76 * 255.0);
                                                                                              if (v12
                                                                                                || v83 >= v60
                                                                                                && v83 < v59
                                                                                                && v81 >= v30
                                                                                                && v81 < v61
                                                                                                && v79 <= 0xFF)
                                                                                              {
                                                                                                v36 = (uint64_t)rintf(v72 * 255.0);
                                                                                                if ((v36 & 0x80000000) == 0)
                                                                                                {
                                                                                                  v37 = (uint64_t)rintf(v70 * 255.0);
                                                                                                  if ((int)v37 >= (int)v36)
                                                                                                  {
                                                                                                    v77 = (uint64_t)rintf(v68 * 255.0);
                                                                                                    if ((int)v77 >= (int)v37 && (int)v77 <= 255)
                                                                                                    {
                                                                                                      v73 = (uint64_t)rintf(v67 * 255.0);
                                                                                                      if ((v73 & 0x80000000) == 0 && (int)v73 <= 255)
                                                                                                      {
                                                                                                        v71 = (uint64_t)rintf(v66 * 255.0);
                                                                                                        if (v71 <= 0xFF && v20 <= 2 && (v21 - 9) >= 0xFFFFFFF8 && v65 > 1.0 && v65 <= 1000.0)
                                                                                                        {
                                                                                                          v38 = *(int32x2_t *)&v29->var3;
                                                                                                          v39.i32[0] = v29->var5.var2;
                                                                                                          v39.i32[1] = v29->var5.var0;
                                                                                                          v69 = v39;
                                                                                                          if (-[CIRedEyeRepair getInt:d:s:](self, "getInt:d:s:", &v125, a3, CFSTR("fullImageWidth")) && -[CIRedEyeRepair getInt:d:s:](self, "getInt:d:s:", (char *)&v124 + 4, a3, CFSTR("fullImageHeight")))
                                                                                                          {
                                                                                                            v40 = self->lf;
                                                                                                            if ((int)v125 > 4 * v40->var3 || SHIDWORD(v124) > 4 * v40->var4)
                                                                                                            {
                                                                                                              if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("repairRectangleMinimumY")) && -[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("repairRectangleMaximumY")) && -[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("repairRectangleMinimumX")))
                                                                                                              {
                                                                                                                if (-[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", &v124, a3, CFSTR("repairRectangleMaximumX")))
                                                                                                                  -[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", (char *)&v123 + 4, a3, CFSTR("size"));
                                                                                                              }
                                                                                                              return;
                                                                                                            }
                                                                                                          }
                                                                                                          else if (v33 == 0.0 && v58 < 0x14 || v33 != 0.0 && v33 < 45.0)
                                                                                                          {
                                                                                                            return;
                                                                                                          }
                                                                                                          v41 = vcvt_f32_s32(v38);
                                                                                                          __asm { FMOV            V3.2D, #0.5 }
                                                                                                          v88[0] = v57;
                                                                                                          v88[1] = v56;
                                                                                                          v88[2] = v34;
                                                                                                          v88[3] = v35;
                                                                                                          v88[4] = v85;
                                                                                                          v88[5] = v87;
                                                                                                          v88[6] = v52;
                                                                                                          v88[7] = v83;
                                                                                                          v88[8] = v81;
                                                                                                          v88[9] = v79;
                                                                                                          v89 = v13;
                                                                                                          v90 = 0;
                                                                                                          v91 = 0;
                                                                                                          v92 = v55 | ((unint64_t)v54 << 32);
                                                                                                          v93 = v53 | ((unint64_t)v75 << 32);
                                                                                                          v94 = v36;
                                                                                                          v95 = v37;
                                                                                                          v96 = v77;
                                                                                                          v97 = v73;
                                                                                                          v98 = v71;
                                                                                                          v99 = v12;
                                                                                                          v100 = v20;
                                                                                                          v101 = v32 * v17;
                                                                                                          v103 = 0;
                                                                                                          v102 = 0;
                                                                                                          v104 = 0;
                                                                                                          v105 = v21;
                                                                                                          v106 = v65;
                                                                                                          v107 = v64;
                                                                                                          v108 = v118;
                                                                                                          v109 = v119;
                                                                                                          v110 = 0;
                                                                                                          v111 = vcvt_f32_f64(vmlaq_f64(vnegq_f64(vcvtq_f64_f32(vcvt_f32_s32(v69))), _Q3, vcvtq_f64_f32(v41)));
                                                                                                          v112 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v41, v41).i32[1]), v41.f32[0], v41.f32[0])) * 0.5;
                                                                                                          v113 = 0;
                                                                                                          v114 = v62;
                                                                                                          v115 = v61;
                                                                                                          v116 = v60;
                                                                                                          v117 = v59;
                                                                                                          v47 = -[CIRedEyeRepair redEyeRemovalWithData:](self, "redEyeRemovalWithData:", v88);
                                                                                                          if ((_DWORD)v47 == -1 || (v49 = -[CIRedEyeRepair repairWithTag:](self, "repairWithTag:", v47), -[CIRedEyeRepair getFloat:d:s:](self, "getFloat:d:s:", (char *)&v123 + 4, a3, CFSTR("size"))) && ((v50 = sqrt((float)SLODWORD(v49->blockSet) / 3.14159265) / v32, v51 = v50, v48 = *((float *)&v123 + 1) * 1.1, v48 < v51) || (HIDWORD(v48) = 1072483532, *((float *)&v123 + 1) * 0.9 > v51)))
                                                                                                          {
                                                                                                            self->iFaceIndex = 0;
                                                                                                            self->iLeft = 1;
                                                                                                            *(float *)&v48 = v32 * v17;
                                                                                                            -[CIRedEyeRepair redEyeRemovalWithPoint:alignPupilShades:matching:force:IOD:tap:](self, "redEyeRemovalWithPoint:alignPupilShades:matching:force:IOD:tap:", 1, v55 | ((unint64_t)v54 << 32), v53 | ((unint64_t)v75 << 32), v20, v33 == 0.0, (double)v85, (double)v87, v48);
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)executeRepairArray:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "count");
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = v5;
    do
      -[CIRedEyeRepair executeRepair:](self, "executeRepair:", objc_msgSend(a3, "objectAtIndex:", v6++));
    while (v7 != v6);
  }
}

- (void)setFaceIndex:(int)a3
{
  self->iFaceIndex = a3;
}

- (void)setLeft:(BOOL)a3
{
  self->iLeft = a3;
}

@end
