void *getJPHepburn()
{
  id v0;

  v0 = &unk_24C5A5010;
  return &unk_24C5A5010;
}

void *getZhHansFN()
{
  id v0;

  v0 = &unk_24C5A5038;
  return &unk_24C5A5038;
}

void *getZhHansLN()
{
  id v0;

  v0 = &unk_24C5A5060;
  return &unk_24C5A5060;
}

__CFDictionary *fcssCreateIOSurfacePropertiesDictionary(int a1, int a2, int a3)
{
  int v6;
  int v7;
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  unsigned int v10;
  char v11;
  int v12;

  v6 = hasVXD();
  v7 = hasVXD();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v9 = Mutable;
  if (v6)
  {
    if (v7)
      setIntValue(Mutable, (const __CFString *)*MEMORY[0x24BDD8E40], 1280);
  }
  else
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8ED8], CFSTR("PurpleGfxMem"));
  }
  v10 = (a1 + 15) & 0xFFFFFFF0;
  if (a3 == 1111970369)
    v11 = 2;
  else
    v11 = 1;
  v12 = (v10 << v11) * ((a2 + 15) & 0xFFFFFFF0);
  setIntValue(v9, (const __CFString *)*MEMORY[0x24BDD8E38], v10 << v11);
  setIntValue(v9, (const __CFString *)*MEMORY[0x24BDD8FD0], a1);
  setIntValue(v9, (const __CFString *)*MEMORY[0x24BDD8EB0], a2);
  setIntValue(v9, (const __CFString *)*MEMORY[0x24BDD8EF8], a3);
  setIntValue(v9, (const __CFString *)*MEMORY[0x24BDD8E18], v12);
  return v9;
}

uint64_t hasVXD(void)
{
  uint64_t result;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  const __CFDictionary *v4;

  if (byte_254994321 == 1)
    return _MergedGlobals_4;
  v1 = *MEMORY[0x24BDD8B18];
  v2 = IOServiceMatching("AppleVXD375");
  MatchingService = IOServiceGetMatchingService(v1, v2);
  v4 = IOServiceMatching("AppleVXD390");
  result = (MatchingService | IOServiceGetMatchingService(v1, v4)) != 0;
  _MergedGlobals_4 = result;
  byte_254994321 = 1;
  return result;
}

void setIntValue(__CFDictionary *a1, const __CFString *a2, int a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

CVPixelBufferRef createPlanar420PixelBufferFromJPEGFile()
{
  const __CFURL *v0;
  FILE *v1;
  FILE *v2;
  uint64_t v3;
  UInt8 *v4;
  const UInt8 *v5;
  const __CFAllocator *v6;
  CFDataRef v7;
  CFDataRef v8;
  IOSurfaceRef surface;
  CVPixelBufferRef pixelBufferOut;
  UInt8 buffer[4096];
  uint64_t v13;

  v0 = (const __CFURL *)MEMORY[0x24BDAC7A8]();
  v13 = *MEMORY[0x24BDAC8D0];
  pixelBufferOut = 0;
  if (CFURLGetFileSystemRepresentation(v0, 1u, buffer, 4096))
  {
    v1 = fopen((const char *)buffer, "rb");
    surface = 0;
    if (v1)
    {
      v2 = v1;
      fseek(v1, 0, 2);
      v3 = MEMORY[0x212B95908](v2);
      fseek(v2, 0, 0);
      v4 = (UInt8 *)malloc_type_malloc(v3, 0x95957028uLL);
      if (v4)
      {
        v5 = v4;
        fread(v4, v3, 1uLL, v2);
        fclose(v2);
        v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v7 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, v3, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
        if (v7)
        {
          v8 = v7;
          MEMORY[0x212B95404](v7, 0, &surface);
          CVPixelBufferCreateWithIOSurface(v6, surface, 0, &pixelBufferOut);
          CFRelease(surface);
          CFRelease(v8);
          return pixelBufferOut;
        }
        fwrite("Couldn't create input data\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      }
      else
      {
        fclose(v2);
      }
    }
  }
  return 0;
}

CVPixelBufferRef createPlanar420PixelBufferFromImageFile(const __CFURL *a1)
{
  CGImageSource *v1;
  CGImageSource *v2;
  CGImage *ImageAtIndex;
  CGDataProvider *DataProvider;
  const __CFData *v5;
  size_t BitsPerPixel;
  CGImageAlphaInfo AlphaInfo;
  size_t Width;
  size_t Height;
  __CFDictionary *Mutable;
  __CFDictionary *IOSurfacePropertiesDictionary;
  __CFDictionary *v12;
  const UInt8 *BytePtr;
  int BytesPerRow;
  char *BaseAddressOfPlane;
  char *v16;
  unsigned int BytesPerRowOfPlane;
  float v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  const UInt8 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const UInt8 *v29;
  unsigned int v30;
  char *v31;
  unsigned int v32;
  float v33;
  float v34;
  unsigned int v35;
  float v36;
  float v37;
  char *v38;
  unsigned int v39;
  float v40;
  float v41;
  float v42;
  float v43;
  unsigned int v44;
  float v45;
  float v46;
  float v47;
  float v48;
  const UInt8 *v49;
  const UInt8 *v50;
  unsigned int v51;
  float v52;
  float v53;
  float v54;
  float v55;
  const UInt8 *v56;
  unsigned int v57;
  float v58;
  unsigned int v59;
  float v60;
  float v61;
  float v62;
  unsigned int v63;
  float v64;
  unsigned int v65;
  float v66;
  char *v67;
  unsigned int v68;
  unsigned int v69;
  float v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  float v74;
  const __CFData *v76;
  CVPixelBufferRef pixelBufferOut;

  v1 = CGImageSourceCreateWithURL(a1, 0);
  pixelBufferOut = 0;
  if (v1)
  {
    v2 = v1;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v1, 0, 0);
    DataProvider = CGImageGetDataProvider(ImageAtIndex);
    v5 = CGDataProviderCopyData(DataProvider);
    BitsPerPixel = CGImageGetBitsPerPixel(ImageAtIndex);
    AlphaInfo = CGImageGetAlphaInfo(ImageAtIndex);
    Width = CGImageGetWidth(ImageAtIndex);
    Height = CGImageGetHeight(ImageAtIndex);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    IOSurfacePropertiesDictionary = fcssCreateIOSurfacePropertiesDictionary(Width, Height, 875704422);
    if (IOSurfacePropertiesDictionary)
    {
      v12 = IOSurfacePropertiesDictionary;
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5668], IOSurfacePropertiesDictionary);
      CFRelease(v12);
    }
    if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x34323066u, Mutable, &pixelBufferOut))
    {
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      v76 = v5;
      BytePtr = CFDataGetBytePtr(v5);
      BytesPerRow = CGImageGetBytesPerRow(ImageAtIndex);
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 0);
      CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 0);
      v16 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 1uLL);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 1uLL);
      v20 = (BitsPerPixel >> 3);
      v21 = (BytesPerRow - v20 * Width);
      v22 = Height >> 1;
      if (AlphaInfo == kCGImageAlphaFirst)
        v23 = BytePtr + 1;
      else
        v23 = BytePtr;
      v24 = BytesPerRowOfPlane;
      v25 = 2 * v20;
      v26 = v21 + 2;
      v27 = v21 + (BitsPerPixel >> 3);
      do
      {
        v28 = 0;
        v29 = &v23[v25];
        v30 = Width >> 1;
        do
        {
          v31 = &BaseAddressOfPlane[v28];
          LOBYTE(v18) = *v23;
          LOBYTE(v19) = v23[1];
          *(float *)&v32 = (float)LODWORD(v19) * 0.5872;
          v33 = *(float *)&v32 + (float)((float)LODWORD(v18) * 0.2988);
          LOBYTE(v32) = v23[2];
          v34 = (float)(v33 + (float)((float)v32 * 0.114)) + 0.5;
          v35 = 1132396544;
          if (v34 >= 0.0)
            v36 = v34;
          else
            v36 = 0.0;
          if (v34 <= 255.0)
            v37 = v36;
          else
            v37 = 255.0;
          v38 = &v16[v28];
          *v31 = (int)v37;
          LOBYTE(v37) = *v23;
          LOBYTE(v36) = v23[1];
          *(float *)&v39 = (float)LODWORD(v36) * -0.3391;
          v40 = *(float *)&v39 + (float)((float)LODWORD(v37) * -0.1726);
          LOBYTE(v39) = v23[2];
          v41 = (float)(v40 + (float)((float)v39 * 0.5117)) + 128.5;
          if (v41 >= 0.0)
            v42 = v41;
          else
            v42 = 0.0;
          if (v41 <= 255.0)
            v43 = v42;
          else
            v43 = 255.0;
          *v38 = (int)v43;
          LOBYTE(v43) = *v23;
          LOBYTE(v42) = v23[1];
          *(float *)&v44 = (float)LODWORD(v42) * -0.4282;
          v45 = *(float *)&v44 + (float)((float)LODWORD(v43) * 0.5115);
          LOBYTE(v44) = v23[2];
          v46 = (float)(v45 + (float)((float)v44 * -0.083)) + 128.5;
          if (v46 >= 0.0)
            v47 = v46;
          else
            v47 = 0.0;
          if (v46 <= 255.0)
            v48 = v47;
          else
            v48 = 255.0;
          v38[1] = (int)v48;
          v49 = &v23[v20];
          v50 = &v23[v20 + 1];
          LOBYTE(v48) = *v49;
          LOBYTE(v47) = *v50;
          *(float *)&v51 = (float)LODWORD(v47) * 0.5872;
          v52 = *(float *)&v51 + (float)((float)LODWORD(v48) * 0.2988);
          LOBYTE(v51) = v50[1];
          v53 = (float)(v52 + (float)((float)v51 * 0.114)) + 0.5;
          if (v53 >= 0.0)
            v54 = v53;
          else
            v54 = 0.0;
          if (v53 <= 255.0)
            v55 = v54;
          else
            v55 = 255.0;
          v56 = v29;
          v31[1] = (int)v55;
          LOBYTE(v55) = *v38;
          LOBYTE(v35) = *(v50 - 1);
          *(float *)&v57 = (float)v35;
          v58 = (float)LODWORD(v55) + (float)(*(float *)&v57 * -0.1726);
          LOBYTE(v57) = *v50;
          *(float *)&v59 = (float)v57;
          v60 = v58 + (float)(*(float *)&v59 * -0.3391);
          LOBYTE(v59) = v50[1];
          v61 = (float)((float)(v60 + (float)((float)v59 * 0.5117)) + 128.5) * 0.5;
          v62 = 255.0;
          if (v61 <= 255.0)
          {
            v62 = 0.0;
            if (v61 >= 0.0)
              v62 = v61;
          }
          *v38 = (int)v62;
          LOBYTE(v61) = v38[1];
          LOBYTE(v62) = *(v50 - 1);
          *(float *)&v63 = (float)LODWORD(v62);
          v64 = (float)LODWORD(v61) + (float)(*(float *)&v63 * 0.5115);
          LOBYTE(v63) = *v50;
          *(float *)&v65 = (float)v63;
          v66 = v64 + (float)(*(float *)&v65 * -0.4282);
          LOBYTE(v65) = v50[1];
          v18 = (float)((float)(v66 + (float)((float)v65 * -0.083)) + 128.5) * 0.5;
          v19 = 255.0;
          if (v18 <= 255.0)
          {
            v19 = 0.0;
            if (v18 >= 0.0)
              v19 = v18;
          }
          v38[1] = (int)v19;
          v23 = &v49[v20];
          v28 += 2;
          v29 += v25;
          --v30;
        }
        while (v30);
        v67 = &BaseAddressOfPlane[v28];
        v68 = Width >> 1;
        do
        {
          LOBYTE(v18) = v56[v26 - 2];
          LOBYTE(v19) = v56[v26 - 1];
          *(float *)&v69 = (float)LODWORD(v19) * 0.5872;
          v70 = *(float *)&v69 + (float)((float)LODWORD(v18) * 0.2988);
          LOBYTE(v69) = v56[v26];
          *(float *)&v71 = (float)v69;
          *(float *)&v72 = (float)(v70 + (float)(*(float *)&v71 * 0.114)) + 0.5;
          *v67 = (int)*(float *)&v72;
          LOBYTE(v72) = v56[v27];
          LOBYTE(v71) = v56[v27 + 1];
          *(float *)&v73 = (float)v71 * 0.5872;
          v74 = *(float *)&v73 + (float)((float)v72 * 0.2988);
          LOBYTE(v73) = v56[v27 + 2];
          v19 = (float)v73;
          v18 = (float)(v74 + (float)(v19 * 0.114)) + 0.5;
          BaseAddressOfPlane = v67 + 2;
          v67[1] = (int)v18;
          v56 += v25;
          v67 += 2;
          --v68;
        }
        while (v68);
        v23 = &v56[2 * (BytesPerRow - v20 * Width)];
        v16 += v24;
        --v22;
      }
      while (v22);
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      v5 = v76;
    }
    CGImageRelease(ImageAtIndex);
    CFRelease(v2);
    if (v5)
      CFRelease(v5);
  }
  return pixelBufferOut;
}

double ccCardRect()
{
  return 0.0;
}

double ccArea1RectScaleIndependent()
{
  return 0.101067865;
}

double ccArea1Rect(float a1)
{
  double v1;
  double result;
  CGRect v3;

  v1 = a1;
  v3.size.width = a1 * 68.61;
  v3.size.height = a1 * 4.89;
  v3.origin.x = a1 * 8.66;
  v3.origin.y = v1 * 54.05 + v1 * -19.14 - v3.size.height;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v3, -8.0, -2.0);
  return result;
}

double ccArea2RectScaleIndependent()
{
  return 0.0715411099;
}

double ccArea2Rect(float a1)
{
  double v1;
  double result;
  CGRect v3;

  v1 = a1;
  v3.size.width = a1 * 69.34;
  v3.size.height = a1 * 15.29;
  v3.origin.x = a1 * 6.13;
  v3.origin.y = v1 * 54.05 + v1 * -2.54 - v3.size.height;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v3, -8.0, -2.0);
  return result;
}

double ccUnitRectToMMRect(double a1)
{
  return a1 * 85.685;
}

double ccMMRectToUnitRect(double a1)
{
  return a1 / 85.685;
}

double ccUnitRectToMMRectIsPortrait(int a1, double a2)
{
  double v2;

  v2 = 54.05;
  if (!a1)
    v2 = 85.685;
  return a2 * v2;
}

double ccMMRectToUnitRectIsPortait(int a1, double a2)
{
  double v2;

  v2 = 54.05;
  if (!a1)
    v2 = 85.685;
  return a2 / v2;
}

void *allocatePixel8Buffer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *result;

  a3[1] = a2;
  a3[2] = a1;
  a3[3] = a1;
  result = malloc_type_malloc(a2 * a1, 0xECB503B9uLL);
  *a3 = result;
  return result;
}

void rotateBuffer180(vImage_Buffer *a1)
{
  vImagePixelCount width;
  vImage_Buffer v3;

  width = a1->width;
  v3.height = a1->height;
  v3.width = width;
  v3.rowBytes = width;
  v3.data = malloc_type_malloc(v3.height * width, 0xECB503B9uLL);
  vImageRotate90_Planar8(a1, &v3, 2u, 0, 0);
  free(a1->data);
  a1->data = v3.data;
}

float calculateImageBlur(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  id v13;

  v1 = a1;
  v2 = objc_alloc(MEMORY[0x24BDF9C28]);
  v3 = (void *)objc_msgSend(v2, "initWithCIImage:options:", v1, MEMORY[0x24BDBD1B8]);
  v4 = objc_alloc_init(MEMORY[0x24BDF9C18]);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "performRequests:error:", v5, &v13);
  v6 = v13;

  objc_msgSend(v4, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blurScore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  return v11;
}

void sub_20CD895C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v5;

  _Unwind_Resume(a1);
}

BOOL isLeastBlurryFrame(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  float v7;
  double v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  void *v15;

  v5 = a1;
  v6 = a2;
  v7 = calculateImageBlur(v5);
  if (objc_msgSend(v6, "count") >= (unint64_t)a3)
  {
    objc_msgSend(v6, "valueForKeyPath:", CFSTR("@min.self"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    objc_msgSend(v6, "removeObjectAtIndex:", 0);
    *(float *)&v14 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v15);

    v10 = v7 < v13;
  }
  else
  {
    *(float *)&v8 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

    v10 = 0;
  }

  return v10;
}

void sub_20CD89728(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_20CD8D1DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CD8D358(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CD8D478(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CD8D5B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t cr_dispatch_async(uint64_t a1, uint64_t a2)
{
  return +[CRInsights dispatchAsyncOnQueue:block:](CRInsights, "dispatchAsyncOnQueue:block:", a1, a2);
}

CGImageSource *createCGImageFromFile(uint64_t a1)
{
  CGImageSource *result;
  CGImageSource *v2;
  CGImageRef ImageAtIndex;

  result = CGImageSourceCreateWithURL((CFURLRef)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a1), 0);
  if (result)
  {
    v2 = result;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(result, 0, 0);
    CFRelease(v2);
    return ImageAtIndex;
  }
  return result;
}

uint64_t _findCodeRectInImage(_OWORD *a1, uint64_t a2, int64x2_t a3, int64x2_t a4)
{
  __int128 v4;
  _OWORD v6[2];

  v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return _findCodeRectInImageWithModel(v6, a2, a3, a4, 95158272, 0);
}

uint64_t _findCodeRectInImageWithModel(_OWORD *a1, uint64_t a2, int64x2_t a3, int64x2_t a4, uint64_t a5, int a6)
{
  RectangleFinder *v8;
  __int128 v9;
  int v10;
  CGPoint *v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  float v15;
  uint64_t v16;
  _OWORD *p_x;
  float64x2_t v18;
  float64x2_t v19;
  double *v20;
  int TopLeftIndex;
  __int128 v22;
  CGPoint v23;
  CGPoint v24;
  CGPoint *v25;
  __int128 v26;
  int v27;
  const __CFArray *v28;
  CFIndex Count;
  uint64_t v30;
  _BYTE *v31;
  size_t v32;
  float *v33;
  float i;
  float v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  uint64_t v39;
  _BYTE v41[4];
  int v42;
  _OWORD *v43;
  int64x2_t v44;
  int64x2_t v45;
  CGPoint *v46;
  CGPoint *v47;
  CGPoint *v48;
  int v49;
  _OWORD v50[2];
  _OWORD v51[2];
  CFArrayRef v52;
  vImage_Buffer v53;
  CGPoint *v54;
  CGPoint *v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  float64x2x2_t v61;
  float64x2x2_t v62;

  v49 = a6;
  v44 = a4;
  v45 = a3;
  v60 = *MEMORY[0x24BDAC8D0];
  v8 = (RectangleFinder *)operator new();
  RectangleFinder::RectangleFinder(v8);
  v9 = a1[1];
  *(_OWORD *)&v53.data = *a1;
  *(_OWORD *)&v53.width = v9;
  RectangleFinder::findCodeRectPoints(v8, &v53);
  v10 = *((_DWORD *)v8 + 28);
  MEMORY[0x212B95704](v8, 0x1000C409A73810ALL);
  v11 = v55;
  if (v55 == v54)
  {
    v15 = 0.0;
  }
  else
  {
    v42 = v10;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v48 = (CGPoint *)&v57;
    v47 = (CGPoint *)&v58;
    v46 = (CGPoint *)&v59;
    v45 = vdupq_lane_s64(v45.i64[0], 0);
    v44 = vdupq_lane_s64(v44.i64[0], 0);
    v15 = 0.0;
    v11 = v54;
    v43 = a1;
    do
    {
      v16 = 0;
      p_x = (_OWORD *)&v11[4 * v13].x;
      v18 = (float64x2_t)v45;
      v19 = (float64x2_t)v44;
      do
      {
        v20 = &v11[v12 + v16].x;
        v61 = vld2q_f64(v20);
        v62.val[0] = vaddq_f64(v18, v61.val[0]);
        v62.val[1] = vaddq_f64(v19, v61.val[1]);
        vst2q_f64(v20, v62);
        v16 += 2;
      }
      while (v16 != 4);
      TopLeftIndex = findTopLeftIndex(&v11[4 * v13]);
      v56 = p_x[TopLeftIndex];
      v22 = v56;
      v23 = (CGPoint)p_x[((_BYTE)TopLeftIndex + 1) & 3];
      *v48 = v23;
      v24 = (CGPoint)p_x[((_BYTE)TopLeftIndex + 2) & 3];
      *v47 = v24;
      v25 = v46;
      *v46 = (CGPoint)p_x[((_BYTE)TopLeftIndex - 1) & 3];
      *p_x = v22;
      v54[4 * v13 + 1] = v23;
      v54[4 * v13 + 2] = v24;
      v54[4 * v13 + 3] = *v25;
      v52 = 0;
      v26 = a1[1];
      if (v49)
      {
        v51[0] = *a1;
        v51[1] = v26;
        v27 = _segmentHomeKitCodeImages(v51, &v54[4 * v13], &v52);
      }
      else
      {
        v50[0] = *a1;
        v50[1] = v26;
        v27 = _segmentCodeImages(v50, &v54[4 * v13], &v52);
      }
      v28 = v52;
      if (v27)
      {
        Count = CFArrayGetCount(v52);
        v30 = MEMORY[0x24BDAC7A8]();
        v31 = &v41[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
        v32 = 4 * v30;
        MEMORY[0x24BDAC7A8]();
        v33 = (float *)&v41[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v31, Count);
        bzero(v33, v32);
        if (_recognizeCodeImages(v28, v31, (int *)v33, v15))
        {
          for (i = 1.0; Count; --Count)
          {
            v35 = *v33++;
            i = i * v35;
          }
          if (i > v15)
          {
            v15 = i;
            v14 = v13;
          }
        }
        a1 = v43;
      }
      if (v28)
        CFRelease(v28);
      v36 = 0;
      v11 = v54;
      do
      {
        *(CGPoint *)(a2 + v36 * 16) = v11[4 * (uint64_t)v14 + v36];
        ++v36;
      }
      while (v36 != 4);
      if (v15 >= 0.99)
        break;
      ++v13;
      v12 += 4;
    }
    while (v13 < ((char *)v55 - (char *)v11) >> 6);
    if (v15 >= 0.5)
      goto LABEL_28;
    v10 = v42;
  }
  if (v15 < 0.5 && (v10 & 0x80000000) == 0)
  {
    for (j = 0; j != 4; ++j)
      *(CGPoint *)(a2 + j * 16) = v11[j];
LABEL_28:
    v38 = 1;
LABEL_30:
    v55 = v11;
    operator delete(v11);
    return v38;
  }
  v38 = 0;
  v39 = 0;
  if (v11)
    goto LABEL_30;
  return v39;
}

void sub_20CD8E078(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t findTopLeftIndex(CGPoint *a1)
{
  double x;
  double y;
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  _BOOL4 v6;
  unsigned int v7;

  x = a1[1].x;
  y = a1[1].y;
  v3 = (int)(a1->x - x) * (int)(a1->x - x) + (int)(a1->y - y) * (int)(a1->y - y);
  v4 = (int)(x - a1[2].x) * (int)(x - a1[2].x) + (int)(y - a1[2].y) * (int)(y - a1[2].y);
  v5 = v3 > v4;
  v6 = v3 <= v4;
  if (v5)
    v7 = 2;
  else
    v7 = 3;
  if ((int)(a1[v6].y * a1[v6].y + a1[v6].x * a1[v6].x) >= (int)(a1[v7].y * a1[v7].y + a1[v7].x * a1[v7].x))
    return v6;
  else
    return v7;
}

BOOL _segmentHomeKitCodeImages(_OWORD *a1, CGPoint *a2, CFArrayRef *a3)
{
  double x;
  double y;
  __int128 v6;
  _BOOL8 DigitCodeImages;
  __int128 v9[2];
  _OWORD v10[2];
  _OWORD v11[2];

  x = a2->x;
  y = a2->y;
  v6 = a1[1];
  v10[0] = *a1;
  v10[1] = v6;
  _perspectiveCorrectImageWithTargetRect(x, y, 170.0, 64.0, (uint64_t)v10, a2, v11);
  v9[0] = v11[0];
  v9[1] = v11[1];
  DigitCodeImages = extractDigitCodeImages(v9, a3, 10);
  free(*(void **)&v11[0]);
  return DigitCodeImages;
}

uint64_t _segmentCodeImages(_OWORD *a1, CGPoint *a2, CFArrayRef *a3)
{
  double x;
  double y;
  __int128 v8;
  BOOL DigitCodeImages;
  _BOOL8 v10;
  __int128 v11;
  __int128 v13[2];
  _OWORD v14[2];
  __int128 v15[2];
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;

  x = a2->x;
  y = a2->y;
  v8 = a1[1];
  v16[0] = *a1;
  v16[1] = v8;
  _perspectiveCorrectImageWithTargetRect(x, y, 272.0, 64.0, (uint64_t)v16, a2, &v17);
  v15[0] = v17;
  v15[1] = v18;
  DigitCodeImages = extractDigitCodeImages(v15, a3, 16);
  free((void *)v17);
  if (DigitCodeImages)
    return 1;
  v11 = a1[1];
  v14[0] = *a1;
  v14[1] = v11;
  _perspectiveCorrectImageWithTargetRect(x, y, 204.0, 64.0, (uint64_t)v14, a2, &v17);
  v13[0] = v17;
  v13[1] = v18;
  v10 = extractDigitCodeImages(v13, a3, 12);
  free((void *)v17);
  return v10;
}

uint64_t _recognizeCodeImages(const __CFArray *a1, char *a2, int *a3, float a4)
{
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  uint64_t v11;
  float v12;
  float v13;
  const __CFDictionary *ValueAtIndex;
  const __CFNumber *Value;
  const __CFNumber *v16;
  const __CFNumber *v17;
  const __CFData *v18;
  UInt8 *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  int8x16_t v23;
  char *v24;
  UInt8 *v25;
  uint64_t i;
  NSObject *v27;
  void (*v28)(_QWORD *);
  unsigned int v29;
  float v30;
  int v31;
  int v32;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  int *v38;
  char v39;
  int v40;
  uint64_t v41;
  char *v42;
  unsigned int v43;
  char v44;
  uint64_t result;
  uint64_t v46;
  char *v47;
  unsigned int v48;
  char v49;
  uint64_t v50;
  unsigned int v51;
  char v52;
  uint64_t v53;
  char v54;
  char v55;
  char valuePtr;
  uint64_t block;
  uint64_t v58;
  void (*v59)(_QWORD *);
  void *v60;
  char *v61;
  int *v62;
  __int128 *v63;
  __int128 v64;
  int v65;
  uint64_t v66;
  CFRange v67;

  v66 = *MEMORY[0x24BDAC8D0];
  Count = CFArrayGetCount(a1);
  v9 = Count;
  if ((int)Count >= 1)
  {
    v10 = 0;
    v53 = 0;
    v11 = Count;
    v12 = 1.0;
    v13 = 0.0;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
      Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("height"));
      v16 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("width"));
      v17 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("rowBytes"));
      v18 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, CFSTR("data"));
      valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberSInt8Type, &valuePtr);
      v55 = 0;
      CFNumberGetValue(v16, kCFNumberSInt8Type, &v55);
      v54 = 0;
      CFNumberGetValue(v17, kCFNumberSInt8Type, &v54);
      v19 = (UInt8 *)malloc_type_calloc(valuePtr * (uint64_t)v55, 1uLL, 0x100004077774924uLL);
      v67.length = CFDataGetLength(v18);
      v67.location = 0;
      CFDataGetBytes(v18, v67, v19);
      v64 = xmmword_20CDD3840;
      if (!v55 || !valuePtr)
      {
        a2[v10] = 45;
        goto LABEL_30;
      }
      v20 = (char *)malloc_type_calloc(0x190uLL, 1uLL, 0x100004077774924uLL);
      v21 = v20;
      v22 = 0;
      v23 = vld1q_dup_s8((const char *)v19);
      *(int8x16_t *)v20 = v23;
      *((int8x16_t *)v20 + 1) = v23;
      *((int8x16_t *)v20 + 2) = v23;
      *((int8x16_t *)v20 + 3) = v23;
      *((int8x16_t *)v20 + 4) = v23;
      *((int8x16_t *)v20 + 5) = v23;
      *((int8x16_t *)v20 + 6) = v23;
      *((int8x16_t *)v20 + 7) = v23;
      *((int8x16_t *)v20 + 8) = v23;
      *((int8x16_t *)v20 + 9) = v23;
      *((int8x16_t *)v20 + 10) = v23;
      *((int8x16_t *)v20 + 11) = v23;
      *((int8x16_t *)v20 + 12) = v23;
      *((int8x16_t *)v20 + 13) = v23;
      *((int8x16_t *)v20 + 14) = v23;
      *((int8x16_t *)v20 + 15) = v23;
      *((int8x16_t *)v20 + 16) = v23;
      *((int8x16_t *)v20 + 17) = v23;
      *((int8x16_t *)v20 + 18) = v23;
      *((int8x16_t *)v20 + 19) = v23;
      *((int8x16_t *)v20 + 20) = v23;
      *((int8x16_t *)v20 + 21) = v23;
      *((int8x16_t *)v20 + 22) = v23;
      *((int8x16_t *)v20 + 23) = v23;
      v24 = v20 + 2;
      v25 = v19;
      *((int8x16_t *)v20 + 24) = v23;
      do
      {
        for (i = 0; i != 16; ++i)
          v24[i] = v25[i];
        ++v22;
        v24 += 20;
        v25 += 16;
      }
      while (v22 != 20);
      if ((_DWORD)v9 != 10)
        break;
      if ((_DWORD)v10 != 6 && (_DWORD)v10 != 3)
      {
        v27 = CNNQueue(void)::CNNQueue;
        if (!CNNQueue(void)::CNNQueue)
        {
          v27 = dispatch_queue_create("com.apple.CoreRecognition.CNNQueue", 0);
          CNNQueue(void)::CNNQueue = (uint64_t)v27;
        }
        block = MEMORY[0x24BDAC760];
        v58 = 3221225472;
        v28 = __codeImage2char10_block_invoke;
        goto LABEL_24;
      }
      LOBYTE(v29) = 45;
      v65 = 45;
      LODWORD(v64) = 1065353216;
      free(v20);
      v30 = 1.0;
LABEL_29:
      a2[v10] = v29;
      *(float *)&a3[v10] = v30;
      v12 = v12 * v30;
LABEL_30:
      free(v19);
      if (v12 < a4)
        return 0;
      if (++v10 == v11)
        goto LABEL_35;
    }
    if ((_DWORD)v9 == 12)
    {
      v27 = CNNQueue(void)::CNNQueue;
      if (!CNNQueue(void)::CNNQueue)
      {
        v27 = dispatch_queue_create("com.apple.CoreRecognition.CNNQueue", 0);
        CNNQueue(void)::CNNQueue = (uint64_t)v27;
      }
      block = MEMORY[0x24BDAC760];
      v58 = 3221225472;
      v28 = __codeImage2char12_block_invoke;
    }
    else
    {
      v27 = CNNQueue(void)::CNNQueue;
      if (!CNNQueue(void)::CNNQueue)
      {
        v27 = dispatch_queue_create("com.apple.CoreRecognition.CNNQueue", 0);
        CNNQueue(void)::CNNQueue = (uint64_t)v27;
      }
      block = MEMORY[0x24BDAC760];
      v58 = 3221225472;
      v28 = __codeImage2char_block_invoke;
    }
LABEL_24:
    v59 = v28;
    v60 = &__block_descriptor_56_e5_v8__0l;
    v61 = v21;
    v62 = &v65;
    v63 = &v64;
    dispatch_sync(v27, &block);
    v29 = v65;
    free(v21);
    v30 = *(float *)&v64;
    if (v29 >= 0x5B)
    {
      v31 = v29 - 111 > 0x26
         || ((1 << (v29 - 111)) & 0x5806854059) == 0;
      v13 = v13 + *(float *)&v64;
      LODWORD(v53) = v53 + 1;
      HIDWORD(v53) += v31;
    }
    goto LABEL_29;
  }
  v53 = 0;
  v13 = 0.0;
LABEL_35:
  if ((int)v9 >= 0)
    v32 = v9;
  else
    v32 = v9 + 1;
  if ((int)v53 > v32 >> 1 || v13 > 4.0 || SHIDWORD(v53) > 0)
  {
    if ((int)v9 > 1)
    {
      v35 = (v32 >> 1);
      v36 = (v9 << 32) - 0x100000000;
      v37 = a2;
      v38 = a3;
      do
      {
        v39 = *v37;
        *v37++ = a2[v36 >> 32];
        a2[v36 >> 32] = v39;
        v40 = *v38;
        *v38++ = *(int *)((char *)a3 + (v36 >> 30));
        *(int *)((char *)a3 + (v36 >> 30)) = v40;
        v36 -= 0x100000000;
        --v35;
      }
      while (v35);
    }
    if ((int)v9 < 1)
      return 2;
    v41 = v9;
    v42 = a2;
    while (1)
    {
      v43 = *v42;
      if (v43 <= 0x55)
      {
        v44 = 74;
        switch(*v42)
        {
          case 'A':
            v44 = 86;
            goto LABEL_71;
          case 'B':
          case 'D':
          case 'F':
          case 'G':
          case 'H':
          case 'I':
          case 'K':
            goto LABEL_62;
          case 'C':
            goto LABEL_71;
          case 'E':
            v44 = 51;
            goto LABEL_71;
          case 'J':
            v44 = 67;
            goto LABEL_71;
          case 'L':
            v44 = 55;
            goto LABEL_71;
          case 'M':
            v44 = 87;
            goto LABEL_71;
          default:
            switch(*v42)
            {
              case '3':
                v44 = 69;
                goto LABEL_71;
              case '4':
              case '5':
              case '8':
                goto LABEL_62;
              case '6':
                v44 = 57;
                goto LABEL_71;
              case '7':
                v44 = 76;
                goto LABEL_71;
              case '9':
                v44 = 54;
                goto LABEL_71;
              default:
                if (v43 != 45)
                  goto LABEL_62;
                v44 = 45;
                break;
            }
            goto LABEL_71;
        }
      }
      if (v43 == 86)
        break;
      if (v43 == 87)
      {
        v44 = 77;
        goto LABEL_71;
      }
      if (v43 == 89)
        break;
LABEL_62:
      if (v43 >= 0x5B)
      {
        v44 = v43 - 60;
        goto LABEL_71;
      }
LABEL_72:
      ++v42;
      if (!--v41)
      {
        result = 2;
        goto LABEL_99;
      }
    }
    v44 = 65;
LABEL_71:
    *v42 = v44;
    goto LABEL_72;
  }
  if ((int)v9 < 1)
    return 1;
  v46 = v9;
  v47 = a2;
  do
  {
    v48 = *v47;
    if (v48 < 0x5B)
      goto LABEL_97;
    if (*v47 <= 0x91u)
    {
      v49 = 74;
      switch(*v47)
      {
        case 125:
          v49 = 86;
          break;
        case 126:
        case -128:
        case -126:
        case -125:
        case -124:
        case -123:
        case -121:
          goto LABEL_88;
        case 127:
          goto LABEL_96;
        case -127:
          v49 = 51;
          break;
        case -122:
          v49 = 67;
          break;
        case -120:
          v49 = 55;
          break;
        case -119:
          v49 = 87;
          break;
        default:
          switch(*v47)
          {
            case 'o':
              v49 = 69;
              break;
            case 'r':
              v49 = 57;
              break;
            case 's':
              v49 = 76;
              break;
            case 'u':
              v49 = 54;
              break;
            default:
              goto LABEL_88;
          }
          break;
      }
      goto LABEL_96;
    }
    if (v48 != 146)
    {
      if (v48 == 147)
      {
        v49 = 77;
        goto LABEL_96;
      }
      if (v48 != 149)
      {
LABEL_88:
        v49 = v48 - 60;
        goto LABEL_96;
      }
    }
    v49 = 65;
LABEL_96:
    *v47 = v49;
LABEL_97:
    ++v47;
    --v46;
  }
  while (v46);
  result = 1;
LABEL_99:
  if ((_DWORD)v9 == 10)
  {
    v50 = 0;
    while (1)
    {
      v51 = a2[v50];
      if (v51 > 0x50)
        break;
      if (v51 != 45)
      {
        if (v51 != 68)
          goto LABEL_104;
        goto LABEL_108;
      }
LABEL_111:
      if (++v50 == 10)
        return result;
    }
    if (v51 == 84)
    {
      v52 = 49;
    }
    else
    {
      if (v51 != 81)
      {
LABEL_104:
        if (v51 - 58 < 0xFFFFFFF6)
          return 0;
        goto LABEL_111;
      }
LABEL_108:
      v52 = 48;
    }
    a2[v50] = v52;
    goto LABEL_111;
  }
  return result;
}

void _perspectiveCorrectImageWithTargetRect(double a1, double a2, double a3, double a4, uint64_t a5, CGPoint *a6, _QWORD *a7)
{
  void *v11;
  void *v12;

  v12 = malloc_type_calloc((unint64_t)a4 * (unint64_t)a3, 1uLL, 0x100004077774924uLL);
  findTopLeftIndex(a6);
  find_homography();
  applyHomograpyMatrix();
  v11 = malloc_type_calloc((unint64_t)a4 * (unint64_t)a3, 1uLL, 0x100004077774924uLL);
  correctHistogram();
  free(v12);
  *a7 = v11;
  a7[1] = (unint64_t)a4;
  a7[2] = (unint64_t)a3;
  a7[3] = (unint64_t)a3;
}

BOOL extractDigitCodeImages(__int128 *a1, CFArrayRef *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  size_t v7;
  size_t v8;
  __int128 v9;
  _QWORD *v10;
  char *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  CFIndex v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int64x2_t v30;
  int64x2_t *v31;
  int64x2_t v32;
  unint64_t v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  int8x16_t v38;
  int64x2_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  double v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  double v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  double v60;
  double v61;
  unint64_t v62;
  double i;
  double v64;
  int v65;
  uint64_t v66;
  int *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  size_t v72;
  int64_t v73;
  double v74;
  double j;
  uint64_t v76;
  int v77;
  int v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  CFAllocatorRef *v83;
  uint64_t v84;
  int *v85;
  int v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  int v90;
  int v91;
  int *v92;
  uint64_t v93;
  int v94;
  int v95;
  const __CFAllocator *v96;
  __CFArray *v97;
  const __CFArray *Mutable;
  uint64_t v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  double v104;
  uint64_t v105;
  int v106;
  double v107;
  _QWORD *v108;
  double v109;
  uint64_t k;
  uint64_t v111;
  uint64_t v112;
  int v113;
  double v114;
  const double *v115;
  int8x16_t v116;
  int64x2_t v117;
  int64x2_t v118;
  char *v119;
  int64x2_t v120;
  uint64_t v121;
  int64x2_t v122;
  int64x2_t v123;
  int64x2_t v124;
  int64x2_t v125;
  int64x2_t v126;
  int64x2_t v127;
  int64x2_t v128;
  int64x2_t v129;
  int64x2_t v130;
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  int v137;
  CGFloat v138;
  CGFloat *v139;
  uint64_t v140;
  double *v141;
  float v142;
  uint64_t v143;
  double v144;
  float v145;
  double *v146;
  float v147;
  uint64_t v148;
  double v149;
  unint64_t v150;
  float v151;
  float v152;
  double v153;
  double *v154;
  char *v155;
  double v156;
  float v158;
  double v159;
  float v160;
  CFIndex v161;
  double *v162;
  double v163;
  double v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  _BYTE *v171;
  char *v172;
  _BYTE *v173;
  uint64_t v174;
  char v175;
  CFDataRef v176;
  CFNumberRef v177;
  CFNumberRef v178;
  CFNumberRef v179;
  CFDictionaryRef v180;
  CFArrayRef Copy;
  uint64_t v183;
  CFArrayRef *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  CFIndex v188;
  __int128 v189;
  __int128 v190;
  uint64_t v191;
  char *v192;
  vImage_Buffer v193;
  char v194;
  char v195;
  char v196;
  vImage_Buffer v197;
  void *v198;
  unint64_t v199;
  unint64_t v200;
  unint64_t v201;
  __int128 v202;
  __int128 v203;
  _BYTE *v204;
  size_t v205;
  size_t v206;
  size_t v207;
  const void *v208[4];
  _OWORD v209[2];
  vImage_Buffer v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  uint64_t v214;
  _QWORD v215[8];
  CGRect v216;
  CGRect v217;

  v184 = a2;
  v215[5] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v191 = v6;
  v192 = (char *)(&v183 - 4 * v6);
  bzero(v192, 32 * v5);
  v7 = *((_QWORD *)a1 + 1);
  v8 = *((_QWORD *)a1 + 2);
  v204 = malloc_type_calloc(v7 * v8, 1uLL, 0x100004077774924uLL);
  v205 = v7;
  v206 = v8;
  v207 = v8;
  v9 = a1[1];
  v202 = *a1;
  v203 = v9;
  adaptiveThresholdIntegralImage();
  v10 = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
  v11 = (char *)malloc_type_calloc(v7, 8uLL, 0x100004000313F17uLL);
  v12 = v11;
  *(_QWORD *)&v189 = v7;
  v13 = v7 - 15;
  if (v7 - 15 >= 0x10)
  {
    v14 = 15;
    do
    {
      if (v8 - 15 >= 0x10)
      {
        v15 = *(_QWORD *)&v11[8 * v14];
        v16 = *(_QWORD *)a1 + 15;
        v17 = v8 - 30;
        do
        {
          v15 += ~*(_BYTE *)(v16 + v14 * *((_QWORD *)a1 + 3));
          *(_QWORD *)&v11[8 * v14] = v15;
          ++v16;
          --v17;
        }
        while (v17);
      }
      ++v14;
    }
    while (v14 != v13);
  }
  v185 = a3;
  v18 = (int)a3;
  v19 = (int)((double)(v7 >> 1) + -10.0);
  v20 = v19;
  v21 = v19 + 20;
  v22 = *(_QWORD *)&v11[8 * v19];
  v23 = v21 - v19;
  if (v23 >= 2)
  {
    v29 = (v23 & 0xFFFFFFFFFFFFFFFELL) + v19;
    v30 = vdupq_n_s64(v22);
    v31 = (int64x2_t *)&v11[8 * v19 + 16];
    v32 = 0uLL;
    v33 = v23 & 0xFFFFFFFFFFFFFFFELL;
    v34 = 0uLL;
    v35 = 0uLL;
    v36 = 0uLL;
    v37 = 0uLL;
    do
    {
      v38 = (int8x16_t)v30;
      v32 = vaddq_s64(v31[-2], v32);
      v34 = vaddq_s64(*(int64x2_t *)((char *)v31 - 24), v34);
      v30 = *(int64x2_t *)((char *)v31 - 8);
      v35 = vaddq_s64(v35, (int64x2_t)vextq_s8(v38, (int8x16_t)v30, 8uLL));
      v36 = vaddq_s64(v30, v36);
      v39 = *v31++;
      v37 = vaddq_s64(v39, v37);
      v33 -= 2;
    }
    while (v33);
    v28 = vaddvq_s64(v37);
    v27 = vaddvq_s64(v36);
    v26 = vaddvq_s64(v35);
    v25 = vaddvq_s64(v34);
    v24 = vaddvq_s64(v32);
    if (v23 == (v23 & 0xFFFFFFFFFFFFFFFELL))
      goto LABEL_15;
    v22 = v30.u64[1];
  }
  else
  {
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = v20;
  }
  v40 = &v11[8 * v29 + 16];
  v41 = v21 - v29;
  do
  {
    v24 += *((_QWORD *)v40 - 4);
    v25 += *((_QWORD *)v40 - 3);
    v26 += v22;
    v22 = *((_QWORD *)v40 - 1);
    v27 += v22;
    v28 += *(_QWORD *)v40;
    v40 += 8;
    --v41;
  }
  while (v41);
LABEL_15:
  v42 = 0;
  v215[0] = v24;
  v215[1] = v25;
  v215[2] = v26;
  v215[3] = v27;
  v43 = 2;
  v215[4] = v28;
  do
  {
    if (v215[v42] > v215[v43])
      v43 = v42;
    ++v42;
  }
  while (v42 != 5);
  v44 = v20 + v43 - 2;
  if (v8)
  {
    v45 = 0;
    v46 = *(_QWORD *)a1;
    do
    {
      v47 = 0;
      v48 = v10[v45];
      do
      {
        v48 += ~*(_BYTE *)(v46 + v45 + *((_QWORD *)a1 + 3) * (v44 + v47));
        v10[v45] = v48;
        ++v47;
      }
      while (v47 != 20);
      ++v45;
    }
    while (v45 != v8);
  }
  v188 = v18;
  v49 = (int)((double)(v8 >> 1) - (double)((unint64_t)(*((_QWORD *)a1 + 2) - 40) >> 1));
  v186 = (v20 + v43 - 2);
  v50 = (double)v44;
  v51 = (uint64_t *)malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
  v52 = v51;
  if (v8)
  {
    v53 = 0;
    v54 = v50 + 20.0;
    v55 = v204;
    v56 = (int)v186;
    do
    {
      if (v54 > v50)
      {
        v57 = v51[v53];
        v58 = v20 + v43 - 1;
        v59 = v56;
        do
        {
          if (!v55[v53 + v207 * v59])
            ++v57;
          v51[v53] = v57;
          ++v59;
          v60 = (double)v58++;
        }
        while (v54 > v60);
      }
      ++v53;
    }
    while (v53 != v8);
  }
  v61 = (double)v49;
  if (v49 >= 11)
  {
    do
    {
      if (v51[(int)v61] < 1)
        break;
      v61 = v61 + -1.0;
    }
    while (v61 > 10.0);
  }
  v62 = *((_QWORD *)a1 + 2);
  for (i = (double)v62; v61 < i; v61 = v61 + 1.0)
  {
    if (v51[(int)v61])
      break;
  }
  v64 = v61 + -1.0;
  v65 = v185;
  MEMORY[0x24BDAC7A8]();
  v67 = (int *)((char *)&v183 - v66);
  bzero((char *)&v183 - v66, (4 * v68) | 1);
  v69 = (int)v64;
  *v67 = (int)v64;
  v70 = v191;
  if (v65 >= 2)
  {
    v71 = 1;
    do
    {
      v69 += 16;
      if (v8 <= v69)
        v69 = v8 - 1;
      LODWORD(v72) = v69 - 3;
      if (v8 > v69 - 3)
      {
        v72 = (int)v72;
        v73 = v69 + 2;
        do
        {
          if (v10[v72] < v10[v69])
            v69 = v72;
          if ((uint64_t)v72 >= v73)
            break;
          ++v72;
        }
        while (v8 > v72);
      }
      v67[v71++] = v69;
    }
    while (v71 != v70);
  }
  v74 = (double)v67[v188 - 1] - v64 + 8.0;
  for (j = (double)(v62 - 20); v74 < j; v74 = v74 + 1.0)
  {
    if (v64 + v74 >= i)
      break;
    if (v52[(int)(v64 + v74)] < 1)
      break;
  }
  v67[v188] = (int)(v64 + v74);
  if ((int)v185 < 1)
  {
LABEL_63:
    LOBYTE(v79) = 1;
  }
  else
  {
    v76 = 0;
    v77 = *v67;
    do
    {
      v78 = v67[++v76];
      LOBYTE(v79) = v77 + 1 >= v78;
      if (v77 + 1 >= v78)
        break;
      v80 = v77;
      v81 = SLODWORD(v52[v77]);
      while (1)
      {
        v82 = v80 + 1;
        if (v62 > v80 + 1 && v52[v80 + 1] > v81)
          break;
        ++v80;
        if (v78 - 1 == v82)
          goto LABEL_63;
      }
      v77 = v67[v76];
    }
    while (v76 != v70);
  }
  *(_QWORD *)&v190 = v67;
  free(v10);
  free(v52);
  free(v12);
  free(v204);
  v83 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if ((int)v185 <= 0)
  {
    v96 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], v188, MEMORY[0x24BDBD690]);
  }
  else
  {
    v84 = v190;
    v85 = (int *)(v190 + 4);
    v86 = *(_DWORD *)v190;
    v87 = v191;
    v88 = v192 + 16;
    v89 = v191;
    v90 = *(_DWORD *)v190;
    do
    {
      *((_QWORD *)v88 + 1) = 0x4034000000000000;
      *((double *)v88 - 2) = (double)v90;
      *((double *)v88 - 1) = v50;
      v91 = *v85++;
      *(double *)v88 = (double)(v91 - v90);
      v88 += 32;
      v90 = v91;
      --v89;
    }
    while (v89);
    v92 = (int *)(v84 + 4);
    v93 = v87;
    v94 = v86;
    do
    {
      v95 = *v92++;
      LOBYTE(v79) = ((v95 - v94 - 19) < 0xFFFFFFF5) | v79;
      v94 = v95;
      --v93;
    }
    while (v93);
    v96 = *v83;
    v97 = CFArrayCreateMutable(*v83, v188, MEMORY[0x24BDBD690]);
    Mutable = v97;
    if ((v79 & 1) != 0)
    {
      LOBYTE(v79) = 1;
    }
    else
    {
      v99 = 0;
      v79 = 0;
      v187 = (int)v186;
      v188 = (CFIndex)v97;
      v186 = 8 * (int)v186;
      v100 = 0.0;
      v101 = 0.0;
      v102 = 0.0;
      v103 = 0.0;
      do
      {
        v104 = (double)v86;
        v105 = v99 + 1;
        v106 = *(_DWORD *)(v190 + 4 * (v99 + 1));
        v107 = (double)(v106 - v86);
        v108 = malloc_type_calloc(v189, 8uLL, 0x100004000313F17uLL);
        if (v13 >= 0x10)
        {
          v109 = v104 + v107;
          for (k = 15; k != v13; ++k)
          {
            if (v109 > v104)
            {
              v111 = v108[k];
              v112 = *(_QWORD *)a1 + v86;
              v113 = v86 + 1;
              do
              {
                v111 += ~*(_BYTE *)(v112 + k * *((_QWORD *)a1 + 3));
                v108[k] = v111;
                v114 = (double)v113++;
                ++v112;
              }
              while (v109 > v114);
            }
          }
        }
        v115 = (const double *)&v108[v187];
        v116 = (int8x16_t)vld1q_dup_f64(v115);
        v117 = 0uLL;
        v118 = 0uLL;
        v119 = (char *)v108 + v186;
        v120 = 0uLL;
        v121 = 40;
        v122 = 0uLL;
        v123 = 0uLL;
        v124 = 0uLL;
        v125 = 0uLL;
        v126 = 0uLL;
        v127 = 0uLL;
        v128 = 0uLL;
        v129 = 0uLL;
        do
        {
          v117 = vaddq_s64(*(int64x2_t *)&v119[v121 - 80], v117);
          v118 = vaddq_s64(*(int64x2_t *)&v119[v121 - 72], v118);
          v120 = vaddq_s64(*(int64x2_t *)&v119[v121 - 64], v120);
          v122 = vaddq_s64(*(int64x2_t *)&v119[v121 - 56], v122);
          v130 = *(int64x2_t *)&v119[v121 - 32];
          v123 = vaddq_s64(*(int64x2_t *)&v119[v121 - 48], v123);
          v124 = vaddq_s64(v124, (int64x2_t)vextq_s8(v116, (int8x16_t)v130, 8uLL));
          v125 = vaddq_s64(v130, v125);
          v126 = vaddq_s64(*(int64x2_t *)&v119[v121 - 24], v126);
          v127 = vaddq_s64(*(int64x2_t *)&v119[v121 - 16], v127);
          v128 = vaddq_s64(*(int64x2_t *)&v119[v121 - 8], v128);
          v129 = vaddq_s64(*(int64x2_t *)&v119[v121], v129);
          v121 += 16;
          v116 = (int8x16_t)v130;
        }
        while (v121 != 200);
        v131 = 0;
        *(_QWORD *)&v132 = vaddvq_s64(v127);
        *(_QWORD *)&v133 = vaddvq_s64(v125);
        *(_QWORD *)&v134 = vaddvq_s64(v123);
        *(_QWORD *)&v135 = vaddvq_s64(v120);
        *(_QWORD *)&v136 = vaddvq_s64(v117);
        *((_QWORD *)&v136 + 1) = vaddvq_s64(v118);
        *((_QWORD *)&v135 + 1) = vaddvq_s64(v122);
        *(_OWORD *)&v210.data = v136;
        *(_OWORD *)&v210.width = v135;
        *((_QWORD *)&v134 + 1) = vaddvq_s64(v124);
        *((_QWORD *)&v133 + 1) = vaddvq_s64(v126);
        v211 = v134;
        v212 = v133;
        *((_QWORD *)&v132 + 1) = vaddvq_s64(v128);
        v213 = v132;
        v214 = vaddvq_s64(v129);
        v137 = 5;
        do
        {
          if (*((_QWORD *)&v210.data + v131) > *((_QWORD *)&v210.data + v137))
            v137 = v131;
          ++v131;
        }
        while (v131 != 11);
        v138 = v50 + (double)(v137 - 5);
        free(v108);
        v216.size.height = 20.0;
        v216.origin.x = (double)v86;
        v216.origin.y = v138;
        v216.size.width = (double)(v106 - v86);
        v217.origin.x = v103;
        v217.origin.y = v102;
        v217.size.width = v101;
        v217.size.height = v100;
        v79 |= CGRectEqualToRect(v216, v217);
        v139 = (CGFloat *)&v192[32 * v99];
        *v139 = v104;
        v139[1] = v138;
        v139[2] = v107;
        v139[3] = 20.0;
        v86 = v106;
        ++v99;
        v100 = 20.0;
        v101 = v107;
        v102 = v138;
        v103 = v104;
      }
      while (v105 != v191);
      v140 = v191;
      v141 = (double *)(v192 + 8);
      v142 = 0.0;
      v143 = v191;
      do
      {
        v144 = *v141;
        v141 += 4;
        v142 = v144 + v142;
        --v143;
      }
      while (v143);
      v145 = v142 / (float)(int)v185;
      v146 = (double *)(v192 + 8);
      v147 = 0.0;
      v148 = v191;
      do
      {
        v149 = *v146;
        v146 += 4;
        v147 = v147 + (v145 - v149) * (v145 - v149);
        --v148;
      }
      while (v148);
      v150 = 0;
      v151 = sqrtf(v147 / (float)(int)v185);
      v152 = v145 + v151;
      v153 = (float)(v145 - v151);
      v154 = (double *)(v192 + 40);
      v155 = v192;
      do
      {
        v156 = *(v154 - 4);
        if (v156 < v153 || v156 > v152)
        {
          v158 = v145;
          if (!v150 || (v158 = *(double *)&v155[32 * (v150 - 1) + 8], v159 = v145, v150 <= 0xA))
            v159 = *v154;
          v160 = v159;
          *(v154 - 4) = (float)((float)(v158 + v160) * 0.5);
        }
        ++v150;
        v154 += 4;
      }
      while (v140 != v150);
      v161 = 0;
      v189 = *(_OWORD *)off_24C58B430;
      v190 = xmmword_24C58B420;
      do
      {
        v162 = (double *)&v192[32 * v161];
        v163 = v162[2];
        v164 = v162[3];
        v165 = malloc_type_calloc((unint64_t)v164 * (unint64_t)v163, 1uLL, 0x100004077774924uLL);
        v166 = v165;
        v167 = (int)v164;
        if ((int)v167 >= 1)
        {
          v168 = 0;
          v169 = *((_QWORD *)a1 + 2);
          v170 = (char *)(*(_QWORD *)a1 + v169 * (int)v162[1] + (int)*v162);
          v171 = v165;
          do
          {
            v172 = v170;
            v173 = v171;
            v174 = (int)v163;
            if ((int)v163 >= 1)
            {
              do
              {
                v175 = *v172++;
                *v173++ = v175;
                --v174;
              }
              while (v174);
            }
            ++v168;
            v171 += (int)v163;
            v170 += v169;
          }
          while (v168 != v167);
        }
        v210.data = malloc_type_calloc((unint64_t)v164 * (unint64_t)v163, 1uLL, 0x100004077774924uLL);
        v210.height = (unint64_t)v164;
        v210.width = (unint64_t)v163;
        v210.rowBytes = (unint64_t)v163;
        v198 = v166;
        v199 = (unint64_t)v164;
        v200 = (unint64_t)v163;
        v201 = (unint64_t)v163;
        v197 = v210;
        correctHistogram();
        free(v166);
        v196 = 20;
        v195 = 16;
        v194 = 16;
        v193.data = malloc_type_calloc(0x140uLL, 1uLL, 0x100004077774924uLL);
        v193.height = v196;
        v193.width = v195;
        v193.rowBytes = v194;
        vImageScale_Planar8(&v210, &v193, 0, 0x10u);
        v176 = CFDataCreate(v96, (const UInt8 *)v193.data, v195 * (uint64_t)v196);
        v177 = CFNumberCreate(v96, kCFNumberSInt8Type, &v195);
        v178 = CFNumberCreate(v96, kCFNumberSInt8Type, &v196);
        v179 = CFNumberCreate(v96, kCFNumberSInt8Type, &v194);
        v209[0] = v190;
        v209[1] = v189;
        v208[0] = v176;
        v208[1] = v178;
        v208[2] = v177;
        v208[3] = v179;
        v180 = CFDictionaryCreate(v96, (const void **)v209, v208, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CFArraySetValueAtIndex((CFMutableArrayRef)v188, v161, v180);
        free(v210.data);
        free(v193.data);
        CFRelease(v177);
        CFRelease(v178);
        CFRelease(v179);
        CFRelease(v176);
        CFRelease(v180);
        ++v161;
      }
      while (v161 != v191);
      Mutable = (const __CFArray *)v188;
    }
  }
  Copy = CFArrayCreateCopy(v96, Mutable);
  *v184 = Copy;
  CFRelease(Mutable);
  return (v79 & 1) == 0;
}

double rectFromPoints(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v1 = 0;
  v2 = 0;
  v3 = 0;
  v4 = 0x7FFFFFFF;
  v5 = 0x7FFFFFFF;
  do
  {
    v6 = (double)v5;
    v7 = *(double *)(a1 + v1);
    v8 = *(double *)(a1 + v1 + 8);
    if (v7 <= (double)v5)
      v6 = *(double *)(a1 + v1);
    v5 = (int)v6;
    v9 = (double)v3;
    if (v7 >= (double)v3)
      v9 = *(double *)(a1 + v1);
    v3 = (int)v9;
    v10 = (double)v4;
    if (v8 <= (double)v4)
      v10 = *(double *)(a1 + v1 + 8);
    v4 = (int)v10;
    v11 = (double)v2;
    if (v8 >= (double)v2)
      v11 = *(double *)(a1 + v1 + 8);
    v2 = (int)v11;
    v1 += 16;
  }
  while (v1 != 64);
  return (double)v5;
}

void calculatePointsWithPaddingInCorrectedSpace(double *a1, double *a2, double *a3, double *a4, double a5, double a6, double a7, double a8, float a9, double a10, double a11)
{
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  double v36;
  float v37;
  float v38;
  float v39;
  double v40;
  double v41;
  __int128 v42;
  __int128 v43;
  double v44;
  double v45;
  double v46;
  float v47;
  float v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  double *v59;
  float64x2_t v60;
  float v61;
  float v62;
  _BYTE v66[32];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  uint64_t v78;
  double v79;
  double v80;
  uint64_t v81;
  double v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  uint64_t v92;
  float64x2x2_t v93;
  float64x2x2_t v94;
  CGRect v95;

  *(double *)&v66[16] = a7;
  *(double *)&v66[24] = a8;
  *(double *)v66 = a5;
  *(double *)&v66[8] = a6;
  v92 = *MEMORY[0x24BDAC8D0];
  v15 = *a1;
  v16 = a1[1];
  v17 = *a2;
  v18 = a2[1];
  v19 = *a3;
  v20 = a3[1];
  v22 = *a4;
  v21 = a4[1];
  v23 = *a4 - *a3;
  v24 = v21 - v20;
  v62 = hypotf(v23, v24);
  v25 = v17 - v15;
  v26 = v18 - v16;
  v61 = hypotf(v25, v26);
  v27 = v22 - v15;
  v28 = v21 - v16;
  v29 = hypotf(v27, v28);
  v30 = v17 - v19;
  v31 = v18 - v20;
  v32 = hypotf(v30, v31);
  v33 = v62 / v61;
  v34 = v29 / v32;
  if ((float)(v62 / v61) <= 1.0)
    v33 = 1.0 / (float)(v62 / v61);
  if (v34 <= 1.0)
    v34 = 1.0 / v34;
  if (v34 <= v33)
    v35 = v33;
  else
    v35 = v34;
  if (v35 > 2.0)
  {
    v36 = 2.0 / v35;
    v34 = v36 * v34;
    v33 = v36 * v33;
  }
  v37 = fmaxf(v29, v32);
  v38 = fmaxf(v62, v61) * v34;
  v75 = *(_QWORD *)v66;
  v76 = *(_QWORD *)&v66[8];
  v39 = v37 * v33;
  v40 = v38;
  v77 = *(double *)v66 + *(double *)&v66[16];
  v78 = *(_QWORD *)&v66[8];
  v41 = (float)(v37 * v33);
  v79 = *(double *)v66 + *(double *)&v66[16];
  v80 = *(double *)&v66[8] + *(double *)&v66[24];
  v81 = *(_QWORD *)v66;
  v82 = *(double *)&v66[8] + *(double *)&v66[24];
  v42 = *(_OWORD *)a3;
  v71 = *(_OWORD *)a4;
  v72 = v42;
  v43 = *(_OWORD *)a1;
  v73 = *(_OWORD *)a2;
  v74 = v43;
  find_homography();
  v44 = a9;
  v45 = a11;
  if (v38 <= v39)
    v46 = a11;
  else
    v46 = a10;
  if (v38 <= v39)
    v45 = a10;
  v47 = v46 / v40 * v44;
  v48 = v45 / v41 * v44;
  v95 = CGRectInset(*(CGRect *)v66, -(v40 * v47), -(v41 * v48));
  v49 = 0;
  *(CGFloat *)&v67 = v95.origin.x;
  *((_QWORD *)&v67 + 1) = *(_QWORD *)&v95.origin.y;
  *(double *)&v68 = v95.origin.x + v95.size.width;
  *((_QWORD *)&v68 + 1) = *(_QWORD *)&v95.origin.y;
  *(double *)&v69 = v95.origin.x + v95.size.width;
  *((double *)&v69 + 1) = v95.origin.y + v95.size.height;
  *(CGFloat *)&v70 = v95.origin.x;
  *((double *)&v70 + 1) = v95.origin.y + v95.size.height;
  v50 = v87;
  v51 = v90;
  v52 = v84;
  v53 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v83), 0);
  v54 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v85), 0);
  v55 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v89), 0);
  v56 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v91), 0);
  v57 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v86), 0);
  v58 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v88), 0);
  do
  {
    v59 = (double *)((char *)&v67 + v49);
    v93 = vld2q_f64(v59);
    v60 = vaddq_f64(vmlaq_f64(vmulq_n_f64(v93.val[1], v51), v55, v93.val[0]), v56);
    v94.val[0] = vdivq_f64(vaddq_f64(vmlaq_f64(vmulq_n_f64(v93.val[1], v52), v53, v93.val[0]), v54), v60);
    v94.val[1] = vdivq_f64(vaddq_f64(vmlaq_f64(vmulq_n_f64(v93.val[1], v50), v57, v93.val[0]), v58), v60);
    vst2q_f64(v59, v94);
    v49 += 32;
  }
  while (v49 != 64);
  *(_OWORD *)a4 = v67;
  *(_OWORD *)a3 = v68;
  *(_OWORD *)a2 = v69;
  *(_OWORD *)a1 = v70;
}

void __codeImage2char12_block_invoke(_QWORD *a1)
{
  uint64_t i;
  char *v3;
  CNN *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  void *__p[2];
  char v11;

  std::vector<unsigned char>::vector(&v8, 0x190uLL);
  for (i = 0; i != 400; ++i)
    *((_BYTE *)v8 + i) = *(_BYTE *)(a1[4] + i);
  v3 = (char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition")), "resourcePath"), "stringByAppendingPathComponent:", CFSTR("model12.bin")), "UTF8String");
  v4 = (CNN *)sCNN12;
  if (!sCNN12)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, v3);
    v4 = CNN::CNNFromModel((const char *)__p);
    sCNN12 = (uint64_t)v4;
    if (v11 < 0)
    {
      operator delete(__p[0]);
      v4 = (CNN *)sCNN12;
    }
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v5, v8, (uint64_t)v9, v9 - (_BYTE *)v8);
  CNN::ClassifyOne((uint64_t)v4, (uint64_t *)&v5, a1[5], a1[6]);
  if (v5)
  {
    v6 = v5;
    operator delete(v5);
  }
  if (v8)
  {
    v9 = v8;
    operator delete(v8);
  }
}

void sub_20CD8FD38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  _Unwind_Resume(exception_object);
}

void __codeImage2char10_block_invoke(_QWORD *a1)
{
  uint64_t i;
  char *v3;
  CNN *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  void *__p[2];
  char v11;

  std::vector<unsigned char>::vector(&v8, 0x190uLL);
  for (i = 0; i != 400; ++i)
    *((_BYTE *)v8 + i) = *(_BYTE *)(a1[4] + i);
  v3 = (char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition")), "resourcePath"), "stringByAppendingPathComponent:", CFSTR("modelHK.bin")), "UTF8String");
  v4 = (CNN *)sCNN10;
  if (!sCNN10)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, v3);
    v4 = CNN::CNNFromModel((const char *)__p);
    sCNN10 = (uint64_t)v4;
    if (v11 < 0)
    {
      operator delete(__p[0]);
      v4 = (CNN *)sCNN10;
    }
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v5, v8, (uint64_t)v9, v9 - (_BYTE *)v8);
  CNN::ClassifyOne((uint64_t)v4, (uint64_t *)&v5, a1[5], a1[6]);
  if (v5)
  {
    v6 = v5;
    operator delete(v5);
  }
  if (v8)
  {
    v9 = v8;
    operator delete(v8);
  }
}

void sub_20CD8FE88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  _Unwind_Resume(exception_object);
}

void __codeImage2char_block_invoke(_QWORD *a1)
{
  uint64_t i;
  char *v3;
  CNN *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  void *__p[2];
  char v11;

  std::vector<unsigned char>::vector(&v8, 0x190uLL);
  for (i = 0; i != 400; ++i)
    *((_BYTE *)v8 + i) = *(_BYTE *)(a1[4] + i);
  v3 = (char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition")), "resourcePath"), "stringByAppendingPathComponent:", CFSTR("model.bin")), "UTF8String");
  v4 = (CNN *)sCNN;
  if (!sCNN)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, v3);
    v4 = CNN::CNNFromModel((const char *)__p);
    sCNN = (uint64_t)v4;
    if (v11 < 0)
    {
      operator delete(__p[0]);
      v4 = (CNN *)sCNN;
    }
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v5, v8, (uint64_t)v9, v9 - (_BYTE *)v8);
  CNN::ClassifyOne((uint64_t)v4, (uint64_t *)&v5, a1[5], a1[6]);
  if (v5)
  {
    v6 = v5;
    operator delete(v5);
  }
  if (v8)
  {
    v9 = v8;
    operator delete(v8);
  }
}

void sub_20CD8FFD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C58A508, MEMORY[0x24BEDAAF0]);
}

void sub_20CD90124(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

_QWORD *std::vector<unsigned char>::vector(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_20CD901B0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_20CD9027C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<double>::__append((char **)a1, a2 - v2);
  }
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_20CD9038C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<double>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 3);
    if (v10 >> 61)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 3;
    v12 = v5 - v8;
    if (v12 >> 2 > v10)
      v10 = v12 >> 2;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[8 * v11];
    v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      v18 = *((_QWORD *)v7 - 1);
      v7 -= 8;
      *((_QWORD *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

id _creditCardImage2stringCTCSegment(void *a1, const int *a2, uint64_t a3, uint64_t **a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  char *v11;
  void *v12;
  char *i;
  void *v14;
  char *j;
  void *v16;
  void *v17;
  float *v18;
  float *v19;
  float *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  float *v35;
  float *v36;
  uint64_t v37;
  void *__p;
  char *v39;
  void *v40;
  char *v41;
  void *v42;
  char *v43;
  _QWORD v44[3];
  _BYTE v45[4];
  unsigned int v46;
  _BYTE *v47;
  _BYTE *v48;

  v6 = a1;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x212B9553C](v45);
  CTCLayer::setCodeMap((CTCLayer *)v45, a2);
  memset(v44, 0, sizeof(v44));
  std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v44, *a4, a4[1], 0xAAAAAAAAAAAAAAABLL * (a4[1] - *a4));
  CTCLayer::setActivations();
  v42 = v44;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
  CTCLayer::pathDecodingCTCSegment();
  CTCLayer::pathDecodingCTCSegment();
  CTCLayer::pathDecodingCTCSegment();
  v10 = (char *)v42;
  v11 = v43;
  while (v10 != v11)
  {
    unicodeToNSString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v12);

    v10 += 4;
  }
  for (i = (char *)v40; i != v41; i += 4)
  {
    unicodeToNSString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v14);

  }
  for (j = (char *)__p; j != v39; j += 4)
  {
    unicodeToNSString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v16);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v6;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  std::vector<std::pair<float,float>>::__init_with_size[abi:ne180100]<std::pair<float,float>*,std::pair<float,float>*>(&v35, v47, v48, (v48 - v47) >> 3);
  v18 = v35;
  v19 = v36;
  if (v35 != v36)
  {
    v20 = v35;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (int)v20[1]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v21);

      v20 += 2;
    }
    while (v20 != v19);
  }
  if (v18)
    operator delete(v18);
  v22 = (void *)MEMORY[0x24BDBCE70];
  v23 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v46);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrayWithObjects:", v7, v17, v33, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v46);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayWithObjects:", v8, v17, v25, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v46);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "arrayWithObjects:", v9, v17, v28, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v32, CFSTR("CardNumber"), v26, CFSTR("Cardholder"), v29, CFSTR("Expiration"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v39 = (char *)__p;
    operator delete(__p);
  }
  if (v40)
  {
    v41 = (char *)v40;
    operator delete(v40);
  }
  if (v42)
  {
    v43 = (char *)v42;
    operator delete(v42);
  }
  MEMORY[0x212B95548](v45);

  return v30;
}

void sub_20CD908D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  if (__p)
    operator delete(__p);
  if (a24)
    operator delete(a24);
  if (a27)
    operator delete(a27);
  MEMORY[0x212B95548](&a33);

  _Unwind_Resume(a1);
}

id decodeCreditCardNumberActivations(uint64_t **a1, const int *a2)
{
  id v4;
  id v5;
  char *v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char *i;
  void *v16;
  char *j;
  void *v18;
  char *k;
  void *v20;
  char *m;
  void *v22;
  char *n;
  void *v24;
  char *ii;
  void *v26;
  char *jj;
  void *v28;
  char *kk;
  void *v30;
  char *mm;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  void *__p;
  void *v68;
  uint64_t v69;
  void *v70;
  char *v71;
  _QWORD v72[3];
  _BYTE v73[4];

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a1[1] != *a1)
  {
    MEMORY[0x212B9553C](v73);
    CTCLayer::setCodeMap((CTCLayer *)v73, a2);
    memset(v72, 0, sizeof(v72));
    std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v72, *a1, a1[1], 0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1));
    CTCLayer::setActivations();
    v70 = v72;
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
    CTCLayer::getMaxActivations((CTCLayer *)v73);
    CTCLayer::setCummulativeScores((CTCLayer *)v73);
    CTCLayer::bestPathDecoding((CTCLayer *)v73);
    if (v71 != v70)
    {
      __p = 0;
      v68 = 0;
      v69 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v70, (uint64_t)v71, (v71 - (_BYTE *)v70) >> 2);
      CTCLayer::computeScore();
      if (__p)
      {
        v68 = __p;
        operator delete(__p);
      }
    }
    v44 = v4;
    v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v6 = (char *)v70;
    v7 = v71;
    while (v6 != v7)
    {
      unicodeToNSString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v8);

      v6 += 4;
    }
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    v48 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v47 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v46 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v9 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v10 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v11 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v45 = v5;
    v12 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v13 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v14 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    for (i = v65; i != v66; i += 4)
    {
      unicodeToNSString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "appendString:", v16);

    }
    for (j = v63; j != v64; j += 4)
    {
      unicodeToNSString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "appendString:", v18);

    }
    for (k = v61; k != v62; k += 4)
    {
      unicodeToNSString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "appendString:", v20);

    }
    for (m = v59; m != v60; m += 4)
    {
      unicodeToNSString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendString:", v22);

    }
    for (n = v57; n != v58; n += 4)
    {
      unicodeToNSString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendString:", v24);

    }
    for (ii = v55; ii != v56; ii += 4)
    {
      unicodeToNSString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v26);

    }
    for (jj = v53; jj != v54; jj += 4)
    {
      unicodeToNSString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v28);

    }
    for (kk = v51; kk != v52; kk += 4)
    {
      unicodeToNSString();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendString:", v30);

    }
    for (mm = v49; mm != v50; mm += 4)
    {
      unicodeToNSString();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendString:", v32);

    }
    v4 = v44;
    v33 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v45);
    objc_msgSend(v44, "addObject:", v33);

    v34 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v48);
    objc_msgSend(v44, "addObject:", v34);

    v35 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v47);
    objc_msgSend(v44, "addObject:", v35);

    v36 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v46);
    objc_msgSend(v44, "addObject:", v36);

    v37 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v10);
    objc_msgSend(v44, "addObject:", v37);

    v38 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v9);
    objc_msgSend(v44, "addObject:", v38);

    v39 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v11);
    objc_msgSend(v44, "addObject:", v39);

    v40 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v12);
    objc_msgSend(v44, "addObject:", v40);

    v41 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v13);
    objc_msgSend(v44, "addObject:", v41);

    v42 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v14);
    objc_msgSend(v44, "addObject:", v42);

    if (v49)
      operator delete(v49);
    if (v51)
      operator delete(v51);
    if (v53)
      operator delete(v53);
    if (v55)
      operator delete(v55);
    if (v57)
      operator delete(v57);
    if (v59)
      operator delete(v59);
    if (v61)
      operator delete(v61);
    if (v63)
      operator delete(v63);
    if (v65)
      operator delete(v65);

    if (v70)
    {
      v71 = (char *)v70;
      operator delete(v70);
    }
    MEMORY[0x212B95548](v73);
  }
  return v4;
}

void sub_20CD91158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,void *__p,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  void *v51;

  if (__p)
    operator delete(__p);
  if (a45)
    operator delete(a45);
  MEMORY[0x212B95548](&a51);

  _Unwind_Resume(a1);
}

void sub_20CD913F4()
{
  void *v0;

  JUMPOUT(0x20CD91404);
}

id decodeCreditCardExpirationActivations(uint64_t **a1, const int *a2)
{
  id v4;
  id v5;
  char *v6;
  char *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p;
  void *v25;
  uint64_t v26;
  void *v27[2];
  uint64_t v28;
  _QWORD v29[3];
  _BYTE v30[4];
  int v31;
  _BYTE *v32;
  _BYTE *v33;
  _QWORD v34[5];

  v34[3] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (a1[1] != *a1)
  {
    MEMORY[0x212B9553C](v30);
    CTCLayer::setCodeMap((CTCLayer *)v30, a2);
    memset(v29, 0, sizeof(v29));
    std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v29, *a1, a1[1], 0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1));
    CTCLayer::setActivations();
    v27[0] = v29;
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v27);
    CTCLayer::getMaxActivations((CTCLayer *)v30);
    CTCLayer::setCummulativeScores((CTCLayer *)v30);
    CTCLayer::bestPathDecoding((CTCLayer *)v30);
    if (v27[1] != v27[0])
    {
      __p = 0;
      v25 = 0;
      v26 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v27[0], (uint64_t)v27[1], ((char *)v27[1] - (char *)v27[0]) >> 2);
      CTCLayer::computeScore();
      if (__p)
      {
        v25 = __p;
        operator delete(__p);
      }
    }
    v20 = 0;
    v21 = 0;
    v19 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v19, v27[0], (uint64_t)v27[1], ((char *)v27[1] - (char *)v27[0]) >> 2);
    CTCLayer::injectSpaces();
    if (v27[0])
    {
      v27[1] = v27[0];
      operator delete(v27[0]);
    }
    *(_OWORD *)v27 = v22;
    v28 = v23;
    v23 = 0;
    v22 = 0uLL;
    if (v19)
    {
      v20 = v19;
      operator delete(v19);
    }
    v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v6 = (char *)v27[0];
    v7 = (char *)v27[1];
    while (v6 != v7)
    {
      unicodeToNSString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v8);

      v6 += 4;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0uLL;
    v23 = 0;
    std::vector<std::pair<float,float>>::__init_with_size[abi:ne180100]<std::pair<float,float>*,std::pair<float,float>*>(&v22, v32, v33, (v33 - v32) >> 3);
    v10 = v22;
    if ((_QWORD)v22 != *((_QWORD *)&v22 + 1))
    {
      v11 = v22;
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2 * (int)*(float *)(v11 + 4));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v12);

        v11 += 8;
      }
      while (v11 != *((_QWORD *)&v10 + 1));
    }
    if ((_QWORD)v10)
      operator delete((void *)v10);
    v34[0] = v5;
    v34[1] = v9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (2 * v31));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("FastScanningCTCSegmentKey"));

    +[ActivationMapTools textFromActivationMap:codeMap:invert:](ActivationMapTools, "textFromActivationMap:codeMap:invert:", a1, a2, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("Expiration"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("FastScanningPatternSearchKey"));

    }
    if (v27[0])
    {
      v27[1] = v27[0];
      operator delete(v27[0]);
    }
    MEMORY[0x212B95548](v30);
  }
  return v4;
}

void sub_20CD9177C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  if (__p)
    operator delete(__p);
  MEMORY[0x212B95548](&a25);

  _Unwind_Resume(a1);
}

id decodeCreditCardholderActivations(uint64_t **a1, const int *a2)
{
  id v4;
  void *v5;
  int64_t v6;
  __int128 v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  void *__p;
  void *v26;
  uint64_t v27;
  void *v28[2];
  uint64_t v29;
  _QWORD v30[3];
  _BYTE v31[4];
  int v32;
  int v33;
  _BYTE *v34;
  _BYTE *v35;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a1[1] != *a1)
  {
    MEMORY[0x212B9553C](v31);
    CTCLayer::setCodeMap((CTCLayer *)v31, a2);
    memset(v30, 0, sizeof(v30));
    std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v30, *a1, a1[1], 0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1));
    CTCLayer::setActivations();
    v28[0] = v30;
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v28);
    CTCLayer::getMaxActivations((CTCLayer *)v31);
    CTCLayer::setCummulativeScores((CTCLayer *)v31);
    CTCLayer::bestPathDecoding((CTCLayer *)v31);
    if (v28[1] != v28[0])
    {
      __p = 0;
      v26 = 0;
      v27 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v28[0], (uint64_t)v28[1], ((char *)v28[1] - (char *)v28[0]) >> 2);
      CTCLayer::computeScore();
      if (__p)
      {
        v26 = __p;
        operator delete(__p);
      }
    }
    v21 = 0;
    v22 = 0;
    v20 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v20, v28[0], (uint64_t)v28[1], ((char *)v28[1] - (char *)v28[0]) >> 2);
    CTCLayer::removeNoise();
    if (v28[0])
    {
      v28[1] = v28[0];
      operator delete(v28[0]);
    }
    *(_OWORD *)v28 = v23;
    v29 = v24;
    v24 = 0;
    v23 = 0uLL;
    if (v20)
    {
      v21 = v20;
      operator delete(v20);
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v33;
    v23 = 0uLL;
    v24 = 0;
    std::vector<std::pair<float,float>>::__init_with_size[abi:ne180100]<std::pair<float,float>*,std::pair<float,float>*>(&v23, v34, v35, (v35 - v34) >> 3);
    v7 = v23;
    if ((_QWORD)v23 != *((_QWORD *)&v23 + 1))
    {
      v8 = 0;
      v9 = v23;
      do
      {
        if ((uint64_t)v8 >= v6 && v6 + (((char *)v28[1] - (char *)v28[0]) >> 2) > v8)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2 * (int)*(float *)(v9 + 4));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

        }
        ++v8;
        v9 += 8;
      }
      while (v9 != *((_QWORD *)&v7 + 1));
    }
    if ((_QWORD)v7)
      operator delete((void *)v7);
    v18 = 0;
    v19 = 0;
    v17 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v17, v28[0], (uint64_t)v28[1], ((char *)v28[1] - (char *)v28[0]) >> 2);
    CTCLayer::injectSpaces();
    if (v28[0])
    {
      v28[1] = v28[0];
      operator delete(v28[0]);
    }
    *(_OWORD *)v28 = v23;
    v29 = v24;
    v24 = 0;
    v23 = 0uLL;
    if (v17)
    {
      v18 = v17;
      operator delete(v17);
    }
    v11 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v12 = (char *)v28[0];
    v13 = (char *)v28[1];
    while (v12 != v13)
    {
      unicodeToNSString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v14);

      v12 += 4;
    }
    objc_msgSend(v4, "addObject:", v11);
    objc_msgSend(v4, "addObject:", v5);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (2 * v32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

    if (v28[0])
    {
      v28[1] = v28[0];
      operator delete(v28[0]);
    }
    MEMORY[0x212B95548](v31);
  }
  return v4;
}

void sub_20CD91BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  void *v27;

  if (__p)
    operator delete(__p);
  if (a21)
    operator delete(a21);
  MEMORY[0x212B95548](&a27);

  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::pair<float,float>>::__init_with_size[abi:ne180100]<std::pair<float,float>*,std::pair<float,float>*>(_QWORD *result, _BYTE *a2, _BYTE *a3, unint64_t a4)
{
  _QWORD *v5;
  _QWORD *v8;
  size_t v9;

  if (a4)
  {
    v5 = result;
    if (a4 >> 61)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    result = operator new(8 * a4);
    v8 = result;
    *v5 = result;
    v5[1] = result;
    v5[2] = &result[a4];
    if (a2 != a3)
    {
      v9 = ((a3 - a2 - 8) & 0xFFFFFFFFFFFFFFF8) + 8;
      result = memcpy(result, a2, v9);
      v8 = (_QWORD *)((char *)v8 + v9);
    }
    v5[1] = v8;
  }
  return result;
}

void sub_20CD91D5C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(_QWORD *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_20CD91DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t *v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v4, *v6, v6[1], 0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 3));
      v4 = v11 + 3;
      v11 += 3;
      v6 += 3;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_20CD91F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_20CD91FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v4, *(const void **)v6, *(_QWORD *)(v6 + 8), (uint64_t)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 2);
      v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_20CD9206C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_20CD920DC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  if (v1 != v2)
  {
    v3 = **(_QWORD **)(a1 + 16);
    do
    {
      v5 = *(void **)(v3 - 24);
      v3 -= 24;
      v4 = v5;
      if (v5)
      {
        *(_QWORD *)(v1 - 16) = v4;
        operator delete(v4);
      }
      v1 = v3;
    }
    while (v3 != v2);
  }
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>::operator()[abi:ne180100](uint64_t a1)
{
  void **v1;
  void **v2;
  void **v3;

  v1 = **(void ****)(a1 + 16);
  v2 = **(void ****)(a1 + 8);
  while (v1 != v2)
  {
    v1 -= 3;
    v3 = v1;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
}

void std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        v6 = v4;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_20CD923C8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CNN::convertByteToFloatVector(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, float a7)
{
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t i;
  float v11;
  double v12;
  float v13;
  float v14;

  v7 = a3 - a2;
  if (a3 != a2)
  {
    v8 = *(_QWORD *)(result + 8);
    v9 = *(_DWORD *)(v8 + 76);
    if (v9 > 3)
      exit(1);
    for (i = 0; v7 > i; ++i)
    {
      if (v9)
      {
        if (v9 == 2)
        {
          v12 = *(double *)(v8 + 88);
          v11 = *(double *)(v8 + 80);
          goto LABEL_9;
        }
        if (v9 == 1)
        {
          v11 = *(double *)(*(_QWORD *)(v8 + 96) + 8 * i);
          v12 = *(double *)(*(_QWORD *)(v8 + 120) + 8 * i);
LABEL_9:
          v13 = v12;
          goto LABEL_12;
        }
        v11 = 15.0;
        v13 = 256.0;
      }
      else
      {
        v13 = 1.0;
        v11 = 0.0;
      }
LABEL_12:
      LOBYTE(a7) = *(_BYTE *)(a2 + i);
      a7 = (float)LODWORD(a7);
      if (v7 - 1 > i || (v14 = 1.0, !*(_BYTE *)(v8 + 40)))
        v14 = (float)(a7 - v11) / v13;
      *(float *)(a4 + 4 * i) = v14;
    }
  }
  return result;
}

uint64_t CNN::feedForward(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  unint64_t v6;
  void (***v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;

  result = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(***(_QWORD ***)(a1 + 112) + 16))(**(_QWORD **)(a1 + 112), **(_QWORD **)a3, a2);
  if (*(_DWORD *)(a1 + 104))
  {
    v6 = 0;
    do
    {
      v7 = *(void (****)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 112) + 8 * v6);
      (**v7)(v7, *(_QWORD *)(*(_QWORD *)a3 + 8 * v6), *(_QWORD *)(*(_QWORD *)(a3 + 152) + 8 * v6));
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8 * v6);
      (*(void (**)(uint64_t, uint64_t, unint64_t))(*(_QWORD *)v8 + 48))(v8, a3, v6);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8 * v6);
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v9 + 40))(v9, *(_QWORD *)(*(_QWORD *)(a3 + 200) + 8 * v6), *(_QWORD *)(*(_QWORD *)(a3 + 24) + 8 * v6));
      ++v6;
    }
    while (v6 < *(unsigned int *)(a1 + 104));
  }
  return result;
}

_QWORD *matrix<float>::~matrix(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_24C58B080;
  v2 = a1[3];
  if (v2)
    MEMORY[0x212B956EC](v2, 0x1000C8052888210);
  return a1;
}

void CNN::CNN(CNN *this, Corpus *a2, NetworkParameters *a3)
{
  char *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  char *v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  CNNSignals *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  const void *v38;
  uint64_t (***v39)(void *);
  char *v40;
  uint64_t (***v41)(_QWORD);
  int v42;
  unsigned int v43;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  int v48;
  unsigned int v49;
  int v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t (***v66)(_QWORD);
  unsigned int v67;
  int v68;
  uint64_t v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  unsigned int v94;
  std::string *v95;
  unint64_t v96;
  uint64_t *v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  unsigned int v108;
  unsigned int v109;
  float v110;
  unsigned int v111;
  unint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  char *v120;
  char *v121;
  uint64_t v122;
  unsigned int v123;
  int v124;
  uint64_t v125;
  int v126;
  int v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  unsigned int v132;
  unint64_t v133;
  uint64_t v134;
  unsigned int v135;
  unsigned int v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  unsigned int v140;
  unsigned int v141;
  unint64_t v142;
  unint64_t v143;
  uint64_t v144;
  _QWORD *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t *v152;
  _QWORD *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t v158;
  uint64_t *v159;
  char *v160;
  char *v161;
  uint64_t v162;
  unsigned int v163;
  unint64_t v164;
  uint64_t v165;
  uint64_t v166;
  unsigned int v167;
  unsigned int v168;
  unint64_t v169;
  unint64_t v170;
  _QWORD *v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t *v174;
  _QWORD *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t *v181;
  unint64_t v182;
  char *v183;
  char *v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  char v192;
  char v193;
  int v194;
  unsigned int v195;
  unsigned int v196;
  uint64_t (***v197)(void *);
  char **v198;
  unsigned int v199;
  unsigned int v200;
  unsigned int v201;
  unsigned int v202;
  unsigned int v203;
  char *v204;
  unsigned int v205;
  unsigned int v206;
  unsigned int v207;
  uint64_t **v208;
  void *__p[2];
  char v210;
  std::string v211;
  std::string __str;
  std::string v213;
  std::string v214;

  *((_QWORD *)this + 3) = 0xBFF0000000000000;
  *((_QWORD *)this + 4) = 0;
  v6 = (char *)this + 32;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *(_QWORD *)this = off_24C58AF98;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 8) = 0;
  v7 = (uint64_t **)((char *)this + 64);
  *((_QWORD *)this + 14) = 0;
  v198 = (char **)((char *)this + 112);
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 17) = &off_24C58AD48;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  v8 = *((_DWORD *)a3 + 3);
  *((_QWORD *)this + 18) = 0;
  *((_DWORD *)this + 38) = 1;
  *((_WORD *)this + 78) = 0;
  ThreadPoolAuto::setupCommon((uint64_t)this + 136, 0, v8, 0, 0x78u);
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 20) = a3;
  MEMORY[0x212B95590](v6, "convolutional-neural-net");
  v9 = *((_QWORD *)this + 20);
  *((_DWORD *)this + 4) = *(_DWORD *)(v9 + 184);
  *((double *)this + 12) = *(float *)(v9 + 172);
  v206 = *(_DWORD *)(v9 + 112);
  v10 = *(_QWORD *)(v9 + 160);
  if (v10)
  {
    v194 = *(_DWORD *)(**(_QWORD **)(v10 + 48) + 16) - *(_DWORD *)(**(_QWORD **)(v10 + 48) + 8);
    v11 = *((_QWORD *)this + 1);
  }
  else
  {
    v11 = *((_QWORD *)this + 1);
    v194 = *(_DWORD *)(v11 + 192);
  }
  if (*(_DWORD *)(v11 + 32) != v206 * v206)
    exit(3456);
  v13 = *(_QWORD *)(v9 + 200);
  v12 = *(_QWORD *)(v9 + 208);
  v14 = *((_DWORD *)this + 38);
  v15 = *(_DWORD *)(v9 + 16) * v14;
  *((_DWORD *)this + 14) = v15;
  *((_DWORD *)this + 15) = v14;
  if (v14 == 1)
  {
    *((_DWORD *)this + 15) = v15;
    v14 = v15;
  }
  v16 = v14;
  v18 = (char *)*((_QWORD *)this + 8);
  v17 = (char *)*((_QWORD *)this + 9);
  v19 = (v17 - v18) >> 3;
  if (v14 > v19)
  {
    v20 = v14 - v19;
    v21 = *((_QWORD *)this + 10);
    if (v20 > (v21 - (uint64_t)v17) >> 3)
    {
      v22 = v21 - (_QWORD)v18;
      if (v22 >> 2 > (unint64_t)v14)
        v16 = v22 >> 2;
      if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
        v23 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v23 = v16;
      if (v23 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v24 = (char *)operator new(8 * v23);
      v25 = &v24[8 * v19];
      v26 = &v24[8 * v23];
      bzero(v25, 8 * v20);
      v27 = &v25[8 * v20];
      if (v17 != v18)
      {
        do
        {
          v28 = *((_QWORD *)v17 - 1);
          v17 -= 8;
          *((_QWORD *)v25 - 1) = v28;
          v25 -= 8;
        }
        while (v17 != v18);
        v17 = v18;
      }
      *((_QWORD *)this + 8) = v25;
      *((_QWORD *)this + 9) = v27;
      *((_QWORD *)this + 10) = v26;
      if (v17)
      {
        operator delete(v17);
        v14 = *((_DWORD *)this + 15);
      }
      goto LABEL_24;
    }
    bzero(*((void **)this + 9), 8 * v20);
    v29 = &v17[8 * v20];
    goto LABEL_23;
  }
  if (v14 < v19)
  {
    v29 = &v18[8 * v14];
LABEL_23:
    *((_QWORD *)this + 9) = v29;
  }
LABEL_24:
  if (v14)
  {
    v30 = 0;
    do
    {
      v31 = (CNNSignals *)operator new();
      CNNSignals::CNNSignals(v31, ((unint64_t)(v12 - v13) >> 3) + 2);
      *(_QWORD *)(*((_QWORD *)this + 8) + 8 * v30++) = v31;
      v32 = *((unsigned int *)this + 15);
    }
    while (v30 < v32);
  }
  else
  {
    LODWORD(v32) = 0;
  }
  v33 = *(_QWORD *)(*((_QWORD *)this + 20) + 200);
  v208 = v7;
  if (*(_QWORD *)(*((_QWORD *)this + 20) + 208) == v33)
  {
    v37 = 0;
    v36 = 0;
    goto LABEL_160;
  }
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v207 = 1;
  do
  {
    v38 = *(const void **)(v33 + 8 * v34);
    if (!v38)
      goto LABEL_157;
    v205 = v35;
    v204 = v40;
    if (v39)
    {
      v202 = *((_DWORD *)v39 + 17);
      v42 = (**v39)(v39);
      v200 = v37;
      v197 = v39;
      v43 = *((_DWORD *)v39 + 18);
      v44 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 20) + 200) + 8 * (v35 + 1));
      v45 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v44 + 40))(v44);
      v195 = v43;
      v46 = v206 * v206 + 1;
      v199 = (v43 + 1 + v206 - v42) / (v43 + 1);
      v47 = v199 * v199 + 1;
      v196 = v42;
      v48 = v42 * v207 * v42 + 1;
      v49 = v202 + 1;
      v50 = *((_DWORD *)this + 15);
      if (v35)
      {
        if (v50)
        {
          v51 = 0;
          do
          {
            CNNSignals::prepareLayer((CNNSignals *)(*v208)[v51++], v36, 0, v46, v207, v47, v48);
            v52 = *((unsigned int *)this + 15);
          }
          while (v51 < v52);
          if ((_DWORD)v52)
          {
            v53 = 0;
            v54 = v36 - 1;
            do
            {
              v55 = (_QWORD *)(*v208)[v53];
              v56 = v55[43];
              v57 = v56 + 32 * v54;
              v58 = v56 + 32 * v36;
              v59 = v55[52];
              v60 = v59 + 32 * v54;
              v61 = v59 + 32 * v36;
              v62 = (uint64_t)(v55 + 55);
              v63 = (uint64_t)(v55 + 59);
              if (!v45)
              {
                v62 = 0;
                v63 = 0;
              }
              CNNSignals::initConvLayer(v55, v36, v47, v49, v45, v57, v55[40] + 32 * v36, v58, v60, v55[49] + 32 * v36, v61, v62, v63);
              ++v53;
            }
            while (v53 < *((unsigned int *)this + 15));
          }
        }
        v7 = v208;
        v64 = operator new();
        v65 = v207;
        if (*((char *)v197 + 55) < 0)
        {
          std::string::__init_copy_ctor_external(&v213, (const std::string::value_type *)v197[4], (std::string::size_type)v197[5]);
          v65 = v207;
        }
        else
        {
          v213 = *(std::string *)(v197 + 4);
        }
        v192 = v45;
        *((_QWORD *)&v190 + 1) = __PAIR64__(v195, v196);
        v94 = v202;
        LODWORD(v190) = v202;
        DWORD1(v190) = v202 * v207;
        *((_QWORD *)&v188 + 1) = __PAIR64__(v65, v206);
        LODWORD(v188) = v199 * v199 + 1;
        DWORD1(v188) = v202 + 1;
        ConvolutionLayer<float,float,float>::ConvolutionLayer(v64, &v213, v46, v65, v47, v48, v48, v49, *((float *)v197 + 14), v188, v190, v192);
        v35 = v205;
        v37 = v200;
        v40 = v204;
        if ((SHIBYTE(v213.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_73;
        v95 = &v213;
      }
      else
      {
        v7 = v208;
        if (v50)
        {
          v87 = 0;
          do
          {
            CNNSignals::prepareLayer((CNNSignals *)(*v208)[v87++], v36, 1, v46, v207, v47, v48);
            v88 = *((unsigned int *)this + 15);
          }
          while (v87 < v88);
          if ((_DWORD)v88)
          {
            v89 = 0;
            do
            {
              v90 = (_QWORD *)(*v208)[v89];
              v91 = (uint64_t)(v90 + 55);
              v92 = (uint64_t)(v90 + 59);
              if (!v45)
              {
                v91 = 0;
                v92 = 0;
              }
              CNNSignals::initConvLayer(v90, v36, v47, v49, v45, v90[37] + 32 * v36, v90[40] + 32 * v36, v90[43] + 32 * v36, v90[46] + 32 * v36, v90[49] + 32 * v36, v90[52] + 32 * v36, v91, v92);
              ++v89;
            }
            while (v89 < *((unsigned int *)this + 15));
          }
        }
        v64 = operator new();
        v93 = v207;
        if (*((char *)v197 + 55) < 0)
        {
          std::string::__init_copy_ctor_external(&v214, (const std::string::value_type *)v197[4], (std::string::size_type)v197[5]);
          v93 = v207;
        }
        else
        {
          v214 = *(std::string *)(v197 + 4);
        }
        v193 = v45;
        *((_QWORD *)&v191 + 1) = __PAIR64__(v195, v196);
        v94 = v202;
        LODWORD(v191) = v202;
        DWORD1(v191) = v202 * v207;
        *((_QWORD *)&v189 + 1) = __PAIR64__(v93, v206);
        LODWORD(v189) = v199 * v199 + 1;
        DWORD1(v189) = v202 + 1;
        ConvolutionLayer<float,float,float>::ConvolutionLayer(v64, &v214, v46, v93, v47, v48, v48, v49, *((float *)v197 + 14), v189, v191, v193);
        v37 = v200;
        v40 = v204;
        if ((SHIBYTE(v214.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_73;
        v95 = &v214;
      }
      operator delete(v95->__r_.__value_.__l.__data_);
LABEL_73:
      v97 = (uint64_t *)*((_QWORD *)this + 15);
      v96 = *((_QWORD *)this + 16);
      if ((unint64_t)v97 >= v96)
      {
        v99 = ((char *)v97 - *v198) >> 3;
        if ((unint64_t)(v99 + 1) >> 61)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v100 = v96 - (_QWORD)*v198;
        v101 = v100 >> 2;
        if (v100 >> 2 <= (unint64_t)(v99 + 1))
          v101 = v99 + 1;
        if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFF8)
          v102 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v102 = v101;
        if (v102)
          v102 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<Layer<float,float,float> *>>(v102);
        else
          v103 = 0;
        v104 = (uint64_t *)(v102 + 8 * v99);
        *v104 = v64;
        v98 = v104 + 1;
        v106 = (char *)*((_QWORD *)this + 14);
        v105 = (char *)*((_QWORD *)this + 15);
        if (v105 != v106)
        {
          do
          {
            v107 = *((_QWORD *)v105 - 1);
            v105 -= 8;
            *--v104 = v107;
          }
          while (v105 != v106);
          v105 = *v198;
        }
        *((_QWORD *)this + 14) = v104;
        *((_QWORD *)this + 15) = v98;
        *((_QWORD *)this + 16) = v102 + 8 * v103;
        if (v105)
          operator delete(v105);
      }
      else
      {
        *v97 = v64;
        v98 = v97 + 1;
      }
      goto LABEL_110;
    }
    v66 = v41;
    if (!v41)
      goto LABEL_111;
    v67 = (**v41)(v41);
    v68 = v206 / v67;
    v203 = v67;
    if (v206 % v67)
      exit(12345);
    v201 = v37;
    v69 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 20) + 200) + 8 * (v35 + 1));
    v70 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v69 + 40))(v69);
    v71 = v206 * v206 + 1;
    v72 = v207 + 1;
    v199 = v68;
    v73 = v68 * v68 + 1;
    if (*((_DWORD *)this + 15))
    {
      v74 = 0;
      do
      {
        CNNSignals::prepareLayer((CNNSignals *)(*v208)[v74++], v36, 0, v71, v72, v71, v72);
        v75 = *((unsigned int *)this + 15);
      }
      while (v74 < v75);
      if ((_DWORD)v75)
      {
        v76 = 0;
        v77 = v36 - 1;
        do
        {
          v78 = (_QWORD *)(*v208)[v76];
          v79 = v78[43];
          v80 = v79 + 32 * v77;
          v81 = v79 + 32 * v36;
          v82 = v78[52];
          v83 = v82 + 32 * v77;
          v84 = v82 + 32 * v36;
          v85 = (uint64_t)(v78 + 55);
          v86 = (uint64_t)(v78 + 59);
          if (!v70)
          {
            v85 = 0;
            v86 = 0;
          }
          CNNSignals::initPoolLayer(v78, v36, v73, v72, v70, v80, v78[40] + 32 * v36, v81, v83, v78[49] + 32 * v36, v84, v85, v86);
          ++v76;
        }
        while (v76 < *((unsigned int *)this + 15));
      }
    }
    v64 = operator new();
    v7 = v208;
    if (*((char *)v66 + 55) < 0)
      std::string::__init_copy_ctor_external(&__str, (const std::string::value_type *)v66[4], (std::string::size_type)v66[5]);
    else
      __str = *(std::string *)(v66 + 4);
    *(_QWORD *)(v64 + 32) = 0;
    *(_QWORD *)(v64 + 40) = 0;
    *(_QWORD *)(v64 + 24) = 0;
    *(_QWORD *)(v64 + 64) = &off_24C58B080;
    *(_QWORD *)(v64 + 72) = 0;
    *(_QWORD *)(v64 + 80) = 0;
    *(_QWORD *)(v64 + 88) = 0;
    *(_QWORD *)(v64 + 96) = &off_24C58B080;
    *(_QWORD *)(v64 + 104) = 0;
    *(_QWORD *)(v64 + 112) = 0;
    *(_QWORD *)(v64 + 120) = 0;
    *(_QWORD *)(v64 + 128) = &off_24C58B080;
    *(_QWORD *)(v64 + 136) = 0;
    *(_QWORD *)(v64 + 144) = 0;
    *(_QWORD *)(v64 + 152) = 0;
    *(_QWORD *)(v64 + 48) = 0;
    *(_DWORD *)(v64 + 56) = 0;
    *(_QWORD *)v64 = off_24C58ACB8;
    *(_DWORD *)(v64 + 164) = v71;
    *(_DWORD *)(v64 + 168) = v72;
    *(_DWORD *)(v64 + 172) = v71;
    *(_DWORD *)(v64 + 176) = v72;
    *(_DWORD *)(v64 + 180) = v73;
    *(_DWORD *)(v64 + 184) = v72;
    *(_DWORD *)(v64 + 188) = v206;
    *(_DWORD *)(v64 + 192) = v207;
    *(_DWORD *)(v64 + 196) = v207;
    *(_DWORD *)(v64 + 200) = v203;
    *(_BYTE *)(v64 + 208) = v70;
    std::string::operator=((std::string *)(v64 + 24), &__str);
    v108 = *(_DWORD *)(v64 + 188);
    *(_DWORD *)(v64 + 48) = *(_DWORD *)(v64 + 168) * *(_DWORD *)(v64 + 164);
    v109 = *(_DWORD *)(v64 + 200);
    v110 = (float)v108 / (float)v109;
    v111 = v108 / v109;
    *(_DWORD *)(v64 + 204) = v111;
    v37 = v201;
    v35 = v205;
    v40 = v204;
    if (vabds_f32(v110, (float)v111) > 2.2204e-16)
      exit(12345);
    *(_DWORD *)(v64 + 52) = *(_DWORD *)(v64 + 184) * *(_DWORD *)(v64 + 180);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
    v113 = (uint64_t *)*((_QWORD *)this + 15);
    v112 = *((_QWORD *)this + 16);
    if ((unint64_t)v113 >= v112)
    {
      v114 = ((char *)v113 - *v198) >> 3;
      if ((unint64_t)(v114 + 1) >> 61)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v115 = v112 - (_QWORD)*v198;
      v116 = v115 >> 2;
      if (v115 >> 2 <= (unint64_t)(v114 + 1))
        v116 = v114 + 1;
      if ((unint64_t)v115 >= 0x7FFFFFFFFFFFFFF8)
        v117 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v117 = v116;
      if (v117)
        v117 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<Layer<float,float,float> *>>(v117);
      else
        v118 = 0;
      v119 = (uint64_t *)(v117 + 8 * v114);
      *v119 = v64;
      v98 = v119 + 1;
      v121 = (char *)*((_QWORD *)this + 14);
      v120 = (char *)*((_QWORD *)this + 15);
      if (v120 != v121)
      {
        do
        {
          v122 = *((_QWORD *)v120 - 1);
          v120 -= 8;
          *--v119 = v122;
        }
        while (v120 != v121);
        v120 = *v198;
      }
      *((_QWORD *)this + 14) = v119;
      *((_QWORD *)this + 15) = v98;
      *((_QWORD *)this + 16) = v117 + 8 * v118;
      if (v120)
        operator delete(v120);
    }
    else
    {
      *v113 = v64;
      v98 = v113 + 1;
    }
    v94 = v207;
LABEL_110:
    *((_QWORD *)this + 15) = v98;
    ++v36;
    *(_BYTE *)(v64 + 160) = 0;
    v206 = v199;
    v207 = v94;
LABEL_111:
    if (!v40)
      goto LABEL_157;
    v123 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*((_QWORD *)this + 15) - 8) + 120))(*(_QWORD *)(*((_QWORD *)this + 15) - 8));
    if (!v123)
      exit(1234);
    v124 = *((_DWORD *)v40 + 16);
    v125 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 20) + 200) + 8 * v36);
    v126 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v125 + 40))(v125);
    v127 = v126;
    v37 = v124 + 1;
    if (*((_DWORD *)this + 15))
    {
      v128 = 0;
      do
      {
        v129 = *(_QWORD *)(*((_QWORD *)this + 8) + 8 * v128);
        bzero(*(void **)(v129 + 464), 4 * *(_QWORD *)(v129 + 448) * *(_QWORD *)(v129 + 456));
        v130 = *(_QWORD *)(*((_QWORD *)this + 8) + 8 * v128);
        bzero(*(void **)(v130 + 496), 4 * *(_QWORD *)(v130 + 480) * *(_QWORD *)(v130 + 488));
        ++v128;
        v131 = *((unsigned int *)this + 15);
      }
      while (v128 < v131);
      v132 = v36 + 1;
      if ((v127 & 1) != 0)
      {
        if (!(_DWORD)v131)
          goto LABEL_134;
        v133 = 0;
        v134 = **v7;
        v135 = *(_DWORD *)(v134 + 448);
        v136 = *(_DWORD *)(v134 + 456);
        do
        {
          CNNSignals::prepareLayer((CNNSignals *)(*v7)[v133++], v36, 0, v135, v136, v135, v136);
          v137 = *((unsigned int *)this + 15);
        }
        while (v133 < v137);
        if ((_DWORD)v137)
          goto LABEL_128;
        goto LABEL_133;
      }
    }
    else
    {
      v132 = v36 + 1;
      if ((v126 & 1) != 0)
        goto LABEL_134;
      LODWORD(v131) = 0;
    }
    if (!(_DWORD)v131)
    {
LABEL_134:
      v36 = v132;
      goto LABEL_135;
    }
    v138 = 0;
    v139 = *(_QWORD *)(**v7 + 344) + 32 * (v36 - 1);
    v140 = *(_DWORD *)(v139 + 8);
    v141 = *(_DWORD *)(v139 + 16);
    do
    {
      CNNSignals::prepareLayer((CNNSignals *)(*v7)[v138++], v36, 0, v140, v141, v140, v141);
      v142 = *((unsigned int *)this + 15);
    }
    while (v138 < v142);
    if ((_DWORD)v142)
    {
LABEL_128:
      v143 = 0;
      v144 = v36 - 1;
      do
      {
        v145 = (_QWORD *)(*v7)[v143];
        if (v127)
        {
          v146 = (uint64_t)(v145 + 55);
          v147 = v145[43];
          v148 = (uint64_t)(v145 + 59);
          v149 = v145[52];
        }
        else
        {
          v147 = v145[43];
          v146 = v147 + 32 * v144;
          v149 = v145[52];
          v148 = v149 + 32 * v144;
        }
        CNNSignals::initLayer(v145, v36, v37, v146, v147 + 32 * v36, v148, v149 + 32 * v36);
        ++v143;
      }
      while (v143 < *((unsigned int *)this + 15));
    }
LABEL_133:
    v36 = v132;
    v40 = v204;
LABEL_135:
    v35 = v205;
    v150 = operator new();
    if (v40[55] < 0)
      std::string::__init_copy_ctor_external(&v211, *((const std::string::value_type **)v40 + 4), *((_QWORD *)v40 + 5));
    else
      v211 = *(std::string *)(v40 + 32);
    Layer<float,float,float>::Layer(v150, (__int128 *)&v211, v123, v37, *((float *)v40 + 14));
    if (SHIBYTE(v211.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v211.__r_.__value_.__l.__data_);
    *(_BYTE *)(v150 + 160) = v127;
    v152 = (uint64_t *)*((_QWORD *)this + 15);
    v151 = *((_QWORD *)this + 16);
    if ((unint64_t)v152 >= v151)
    {
      v154 = ((char *)v152 - *v198) >> 3;
      if ((unint64_t)(v154 + 1) >> 61)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v155 = v151 - (_QWORD)*v198;
      v156 = v155 >> 2;
      if (v155 >> 2 <= (unint64_t)(v154 + 1))
        v156 = v154 + 1;
      if ((unint64_t)v155 >= 0x7FFFFFFFFFFFFFF8)
        v157 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v157 = v156;
      if (v157)
        v157 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<Layer<float,float,float> *>>(v157);
      else
        v158 = 0;
      v159 = (uint64_t *)(v157 + 8 * v154);
      *v159 = v150;
      v153 = v159 + 1;
      v161 = (char *)*((_QWORD *)this + 14);
      v160 = (char *)*((_QWORD *)this + 15);
      if (v160 != v161)
      {
        do
        {
          v162 = *((_QWORD *)v160 - 1);
          v160 -= 8;
          *--v159 = v162;
        }
        while (v160 != v161);
        v160 = *v198;
      }
      *((_QWORD *)this + 14) = v159;
      *((_QWORD *)this + 15) = v153;
      *((_QWORD *)this + 16) = v157 + 8 * v158;
      if (v160)
        operator delete(v160);
    }
    else
    {
      *v152 = v150;
      v153 = v152 + 1;
    }
    *((_QWORD *)this + 15) = v153;
LABEL_157:
    v33 = *(_QWORD *)(*((_QWORD *)this + 20) + 200);
    v34 = ++v35;
  }
  while (v35 < (unint64_t)((*(_QWORD *)(*((_QWORD *)this + 20) + 208) - v33) >> 3));
  LODWORD(v32) = *((_DWORD *)this + 15);
LABEL_160:
  v163 = v194 + 1;
  if ((_DWORD)v32)
  {
    v164 = 0;
    v165 = v36 - 1;
    v166 = *(_QWORD *)(**v7 + 344) + 32 * v165;
    v167 = *(_DWORD *)(v166 + 8);
    v168 = *(_DWORD *)(v166 + 16);
    do
    {
      CNNSignals::prepareLayer((CNNSignals *)(*v7)[v164++], v36, 0, v167, v168, v167, v168);
      v169 = *((unsigned int *)this + 15);
    }
    while (v164 < v169);
    if ((_DWORD)v169)
    {
      v170 = 0;
      do
      {
        v171 = (_QWORD *)(*v7)[v170];
        CNNSignals::initLayer(v171, v36, v163, v171[43] + 32 * v165, v171[43] + 32 * v36, v171[52] + 32 * v165, v171[52] + 32 * v36);
        ++v170;
      }
      while (v170 < *((unsigned int *)this + 15));
    }
  }
  v172 = operator new();
  std::string::basic_string[abi:ne180100]<0>(__p, "Final-layer");
  Layer<float,float,float>::Layer(v172, (__int128 *)__p, v37, v163, 0.2);
  if (v210 < 0)
    operator delete(__p[0]);
  v174 = (uint64_t *)*((_QWORD *)this + 15);
  v173 = *((_QWORD *)this + 16);
  if ((unint64_t)v174 >= v173)
  {
    v176 = ((char *)v174 - *v198) >> 3;
    if ((unint64_t)(v176 + 1) >> 61)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v177 = v173 - (_QWORD)*v198;
    v178 = v177 >> 2;
    if (v177 >> 2 <= (unint64_t)(v176 + 1))
      v178 = v176 + 1;
    if ((unint64_t)v177 >= 0x7FFFFFFFFFFFFFF8)
      v179 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v179 = v178;
    if (v179)
      v179 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<Layer<float,float,float> *>>(v179);
    else
      v180 = 0;
    v181 = (uint64_t *)(v179 + 8 * v176);
    v182 = v179 + 8 * v180;
    *v181 = v172;
    v175 = v181 + 1;
    v184 = (char *)*((_QWORD *)this + 14);
    v183 = (char *)*((_QWORD *)this + 15);
    if (v183 != v184)
    {
      do
      {
        v185 = *((_QWORD *)v183 - 1);
        v183 -= 8;
        *--v181 = v185;
      }
      while (v183 != v184);
      v183 = *v198;
    }
    *((_QWORD *)this + 14) = v181;
    *((_QWORD *)this + 15) = v175;
    *((_QWORD *)this + 16) = v182;
    if (v183)
      operator delete(v183);
  }
  else
  {
    *v174 = v172;
    v175 = v174 + 1;
  }
  *((_QWORD *)this + 15) = v175;
  *(_BYTE *)(v172 + 160) = 0;
  if (*((_DWORD *)this + 15))
  {
    v186 = 0;
    do
    {
      matrix<float>::resize((_QWORD *)((*v7)[v186] + 96), 1, *(unsigned int *)(v172 + 52), 0);
      v187 = *(_QWORD *)(*((_QWORD *)this + 8) + 8 * v186);
      bzero(*(void **)(v187 + 120), 4 * *(_QWORD *)(v187 + 104) * *(_QWORD *)(v187 + 112));
      ++v186;
    }
    while (v186 < *((unsigned int *)this + 15));
    v175 = (_QWORD *)*((_QWORD *)this + 15);
  }
  *((_DWORD *)this + 26) = ((unint64_t)v175 - *((_QWORD *)this + 14)) >> 3;
  *((double *)this + 11) = (float)(*(float *)(*((_QWORD *)this + 20) + 168)
                                 / sqrtf((float)*((unsigned int *)this + 14)));
  *((_DWORD *)this + 42) = 0;
}

void sub_20CD93600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned int **a14, void **a15, uint64_t a16, uint64_t a17, uint64_t a18, void **a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  uint64_t v37;
  void **v38;
  void *v40;
  void *v41;

  ThreadPoolAuto::~ThreadPoolAuto(a14);
  v40 = *a19;
  if (*a19)
  {
    *(_QWORD *)(v37 + 120) = v40;
    operator delete(v40);
  }
  v41 = *v38;
  if (*v38)
  {
    *(_QWORD *)(v37 + 72) = v41;
    operator delete(v41);
  }
  *(_QWORD *)v37 = &unk_24C58AC78;
  if (*(char *)(v37 + 55) < 0)
    operator delete(*a15);
  _Unwind_Resume(a1);
}

uint64_t matrix<float>::resize(_QWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  int *v14;
  _DWORD *v15;
  uint64_t v16;
  int v17;
  uint64_t result;

  v8 = operator new[]();
  v9 = v8;
  if (a2 && a4)
  {
    v10 = 0;
    v11 = 0;
    v12 = 4 * a3;
    v13 = (_DWORD *)v8;
    do
    {
      if (a3)
      {
        v14 = (int *)(a1[3] + v10);
        v15 = v13;
        v16 = a3;
        do
        {
          v17 = *v14++;
          *v15++ = v17;
          --v16;
        }
        while (v16);
      }
      ++v11;
      v13 = (_DWORD *)((char *)v13 + v12);
      v10 += v12;
    }
    while (v11 != a2);
  }
  result = a1[3];
  if (result)
    result = MEMORY[0x212B956EC](result, 0x1000C8052888210);
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = v9;
  return result;
}

void CNN::~CNN(CNN *this)
{
  unint64_t v2;
  unint64_t i;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  *(_QWORD *)this = off_24C58AF98;
  v2 = *((unsigned int *)this + 26);
  if ((_DWORD)v2)
  {
    for (i = 0; i < v2; ++i)
    {
      v4 = *(_QWORD *)(*((_QWORD *)this + 14) + 8 * i);
      if (v4)
      {
        v5 = Layer<float,float,float>::~Layer(v4);
        MEMORY[0x212B95704](v5, 0x1093C406C775FE4);
        v2 = *((unsigned int *)this + 26);
      }
    }
  }
  ThreadPoolAuto::~ThreadPoolAuto((unsigned int **)this + 17);
  v6 = (void *)*((_QWORD *)this + 14);
  if (v6)
  {
    *((_QWORD *)this + 15) = v6;
    operator delete(v6);
  }
  v7 = (void *)*((_QWORD *)this + 8);
  if (v7)
  {
    *((_QWORD *)this + 9) = v7;
    operator delete(v7);
  }
  *(_QWORD *)this = &unk_24C58AC78;
  if (*((char *)this + 55) < 0)
    operator delete(*((void **)this + 4));
}

{
  CNN::~CNN(this);
  JUMPOUT(0x212B95704);
}

uint64_t CNN::scoreOneVector(int a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  double *v13;
  unsigned int v14;
  double *v15;
  double v16;
  double v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  double v26;
  int v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = *(_QWORD *)(a2 + 8 * (a1 - 1));
  v4 = *(_QWORD *)(v3 + 16) - 1;
  if (*(_QWORD *)(v3 + 16) == 1)
    return 0;
  LODWORD(v6) = 0;
  LODWORD(result) = 0;
  v7 = *(_QWORD *)(v3 + 24);
  v8 = a3[1];
  v9 = *((_QWORD *)a3 + 2);
  v11 = *((unsigned int *)a3 + 1);
  LODWORD(v10) = *((_DWORD *)a3 + 2);
  v12 = *a3;
  v13 = (double *)(v9 + 16 * v11);
  v14 = v11 - 1;
  v15 = (double *)(v9 + 16 * (v11 - 1));
  v16 = -1000.0;
  do
  {
    v17 = *(float *)(v7 + 4 * (int)v6);
    if (v16 >= v17)
      result = result;
    else
      result = v6;
    if (v16 < v17)
      v16 = *(float *)(v7 + 4 * (int)v6);
    if (v8)
    {
      v18 = (v10 + 1);
      if (v18 >= 2)
      {
        v19 = (double *)(v9 + 24);
        v20 = 1;
        while (*(v19 - 1) != v17 || *(_DWORD *)v19 != (_DWORD)v6)
        {
          ++v20;
          v19 += 2;
          if (v18 == v20)
            goto LABEL_15;
        }
        if ((int)v20 > 0)
          goto LABEL_39;
      }
    }
LABEL_15:
    if ((_DWORD)v10 == (_DWORD)v11)
    {
      if (v12)
      {
        if (*v13 <= v17)
        {
          LODWORD(v10) = v11;
          if (*v15 <= v17)
            goto LABEL_39;
          v21 = 1;
          LODWORD(v10) = v11;
          v23 = (v11 - 1);
          v22 = v9 + 16 * v14;
          v24 = v11 - 1;
          goto LABEL_28;
        }
        v21 = 1;
      }
      else
      {
        if (*v13 >= v17)
        {
          LODWORD(v10) = v11;
          v23 = (v11 - 1);
          v21 = 0;
          v22 = v9 + 16 * v14;
          v24 = v11 - 1;
          if (*v15 >= v17)
            goto LABEL_39;
          goto LABEL_28;
        }
        v21 = 0;
      }
      LODWORD(v10) = v11;
      v23 = v11;
      v22 = v9 + 16 * v11;
      v24 = v11;
    }
    else
    {
      v10 = (v10 + 1);
      *((_DWORD *)a3 + 2) = v10;
      v22 = v9 + 16 * v10;
      v23 = v10;
      v21 = v12;
      v24 = v10;
    }
LABEL_28:
    *(double *)v22 = v17;
    *(_DWORD *)(v22 + 8) = v6;
    v25 = v9 + 16 * v23;
    v26 = *(double *)v25;
    v27 = *(_DWORD *)(v25 + 8);
    if (v21)
      v28 = 0x80000000;
    else
      v28 = 0x7FFFFFFF;
    *(double *)v9 = (double)v28;
    *(_DWORD *)(v9 + 8) = v28;
    while (1)
    {
      v29 = v24;
      v24 >>= 1;
      v30 = v9 + 16 * v24;
      if (!v21)
        break;
      if (v26 < *(double *)v30)
        goto LABEL_38;
LABEL_36:
      if (v29 != v24)
      {
        v31 = v9 + 16 * v29;
        *(_QWORD *)v31 = *(_QWORD *)v30;
        *(_DWORD *)(v31 + 8) = *(_DWORD *)(v30 + 8);
      }
    }
    if (v26 >= *(double *)v30)
      goto LABEL_36;
LABEL_38:
    v32 = v9 + 16 * v29;
    *(double *)v32 = v26;
    *(_DWORD *)(v32 + 8) = v27;
LABEL_39:
    v6 = (v6 + 1);
  }
  while (v4 > v6);
  return result;
}

uint64_t CNN::scoreOneOutputEncodedVector(CNN *this, uint64_t a2, CNNSignals *a3)
{
  uint64_t v4;
  int v5;
  int v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unsigned int v11;
  uint64_t v12;
  float *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  uint64_t v29;
  uint64_t v31;
  _DWORD *__p;
  char *v34;
  void *v35;
  float *v36;
  uint64_t v37;

  __p = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v34 = 0;
  v4 = **(_QWORD **)(*(_QWORD *)(*((_QWORD *)this + 20) + 160) + 48);
  v5 = *(_DWORD *)(v4 + 16);
  v6 = *(_DWORD *)(v4 + 8);
  std::vector<float>::resize(&v35, *(unsigned int *)(*((_QWORD *)this + 1) + 192));
  v7 = *(unsigned int *)(*((_QWORD *)this + 1) + 192);
  if ((_DWORD)v7)
  {
    v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v34, v7);
    v10 = &v8[4 * v9];
    bzero(v8, 4 * v7);
    __p = v8;
    v34 = v10;
  }
  v11 = v5 - v6;
  v12 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 20) + 160) + 56);
  v13 = (float *)v35;
  v31 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 20) + 160) + 48);
  if (v12 != v31)
  {
    v14 = 0;
    v15 = (v12 - v31) >> 3;
    do
    {
      if (v11)
      {
        v16 = 0;
        v17 = *(unsigned int **)(v31 + 8 * v14);
        v18 = *v17;
        v19 = *(_QWORD *)(a2 + 200);
        v20 = *((_QWORD *)v17 + 1);
        v21 = v13[v18];
        do
        {
          v22 = *(float *)(*(_QWORD *)(*(_QWORD *)(v19 + 8 * (*((_DWORD *)this + 26) - 1)) + 24)
                         + 4 * (int)v16);
          v23 = 0.0;
          if (v22 >= 0.0)
            v23 = logf(v22 + 1.0);
          if (*(_BYTE *)(v20 + v16))
            v24 = 1.0;
          else
            v24 = 0.0;
          v21 = v21 + (float)((float)(v23 - v24) * (float)(v23 - v24));
          v13[v18] = v21;
          if (*(_BYTE *)(v20 + v16))
            ++__p[v18];
          ++v16;
        }
        while (v11 != (_DWORD)v16);
      }
      v14 = (v14 + 1);
    }
    while (v15 > v14);
  }
  if (v36 == v13)
  {
    v26 = 0;
    v29 = 0;
    if (!__p)
      goto LABEL_28;
  }
  else
  {
    v25 = 0;
    LODWORD(v26) = 0;
    v27 = 3.4028e38;
    do
    {
      if ((int)__p[v25] < 1)
        v28 = 3.4028e38;
      else
        v28 = v13[v25] / (float)v11;
      if (v28 >= v27)
      {
        v26 = v26;
      }
      else
      {
        v27 = v28;
        v26 = v25;
      }
      ++v25;
    }
    while (v36 - v13 > (unint64_t)v25);
  }
  operator delete(__p);
  v13 = (float *)v35;
  v29 = v26;
LABEL_28:
  if (v13)
  {
    v36 = v13;
    operator delete(v13);
  }
  return v29;
}

void sub_20CD93DC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  if (a14)
    operator delete(a14);
  _Unwind_Resume(exception_object);
}

void std::vector<float>::resize(_QWORD *a1, unint64_t a2)
{
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int v19;
  char *v20;

  v3 = (char *)*a1;
  v4 = (char *)a1[1];
  v5 = (uint64_t)&v4[-*a1] >> 2;
  if (a2 <= v5)
  {
    if (a2 >= v5)
      return;
    v20 = &v3[4 * a2];
    goto LABEL_15;
  }
  v6 = a2 - v5;
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2];
  if (a2 - v5 <= (v8 - (uint64_t)v4) >> 2)
  {
    bzero(v4, 4 * v6);
    v20 = &v4[4 * v6];
LABEL_15:
    a1[1] = v20;
    return;
  }
  if (a2 >> 62)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v9 = v8 - (_QWORD)v3;
  v10 = v9 >> 1;
  if (v9 >> 1 <= a2)
    v10 = a2;
  if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFFCLL)
    v11 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v11 = v10;
  v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v7, v11);
  v13 = (char *)*a1;
  v14 = (char *)a1[1];
  v15 = &v12[4 * v5];
  v17 = &v12[4 * v16];
  bzero(v15, 4 * v6);
  v18 = &v15[4 * v6];
  while (v14 != v13)
  {
    v19 = *((_DWORD *)v14 - 1);
    v14 -= 4;
    *((_DWORD *)v15 - 1) = v19;
    v15 -= 4;
  }
  *a1 = v15;
  a1[1] = v18;
  a1[2] = v17;
  if (v13)
    operator delete(v13);
}

void CNN::Recognize(uint64_t a1, uint64_t a2)
{
  int v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  double v11;
  double v12;
  float v13;
  _OWORD *v14;
  CNNSignals *v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  std::string::size_type v24;
  std::string *v25;
  std::string::size_type size;
  unsigned int v27;
  uint64_t v28;
  std::string::size_type v29;
  std::string *v30;
  std::string::size_type v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD **v34;
  _QWORD *v35;
  _QWORD **v36;
  unsigned int v37;
  _QWORD *v38;
  _OWORD *v39;
  uint64_t *v40;
  uint64_t **v41;
  uint64_t *v42;
  int v43;
  uint64_t v44;
  _QWORD *v45;
  _OWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t **v49;
  int v50;
  _DWORD *v51;
  uint64_t **v52;
  uint64_t **v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t *v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t **v65;
  int v66;
  uint64_t v67;
  _DWORD *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t **v71;
  uint64_t **v72;
  uint64_t **v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t **v76;
  unsigned int v77;
  unsigned int v78;
  _DWORD *v79;
  uint64_t *v80;
  unsigned int v81;
  uint64_t **v82;
  _DWORD *v83;
  uint64_t *v84;
  uint64_t v85;
  _OWORD *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t *v90;
  unint64_t v91;
  unsigned int v92;
  uint64_t v93;
  char *v94;
  char *v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int *v100;
  int v101;
  uint64_t **v102;
  uint64_t **v103;
  uint64_t v104;
  uint64_t *v105;
  int v106;
  char *v107;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  char *v114;
  char *v115;
  int v116;
  unsigned int v117;
  unint64_t v118;
  unsigned int v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unsigned int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  double v128;
  float v129;
  uint64_t *v130;
  unsigned int v131;
  unsigned int v132;
  uint64_t v133;
  uint64_t v134;
  _OWORD *v135;
  _OWORD *v136;
  uint64_t **v137;
  uint64_t *v138;
  uint64_t **v139;
  BOOL v140;
  uint64_t v141;
  size_t v142;
  uint64_t *v143;
  unint64_t v144;
  unsigned int v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t *v148;
  unint64_t v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unsigned int v153;
  uint64_t v155;
  uint64_t v156;
  _OWORD *v157;
  uint64_t v158;
  uint64_t v159;
  _DWORD *v160;
  int v161;
  int v162;
  unsigned int v163;
  unsigned int v164;
  unsigned int v165;
  __int16 v166[2];
  uint64_t v167;
  _OWORD *v168;
  void *__p[3];
  void *v170;
  _BYTE *v171;
  uint64_t v172;
  uint64_t *v173;
  _QWORD *v174;
  uint64_t v175;
  uint64_t *v176;
  _QWORD *v177;
  uint64_t v178;
  uint64_t **v179;
  uint64_t *v180;
  uint64_t v181;
  _BYTE v182[12];
  _OWORD *v183;
  _QWORD v184[8];
  void *v185;
  char v186;
  _BYTE v187[152];
  std::string v188;
  _DWORD v189[3];

  *(_QWORD *)(a1 + 8) = a2;
  std::string::basic_string[abi:ne180100]<0>(v182, "");
  if (SHIBYTE(v183) < 0)
    operator delete(*(void **)v182);
  v3 = *(_DWORD *)(a1 + 152);
  v4 = operator new(0x28uLL);
  v180 = 0;
  v181 = 0;
  v178 = 0;
  v179 = &v180;
  v176 = (uint64_t *)&v177;
  v177 = 0;
  v174 = 0;
  v175 = 0;
  v173 = (uint64_t *)&v174;
  *v4 = 0u;
  v4[1] = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 56);
  v160 = v4;
  if (v3 == 1)
  {
    v7 = v4;
    if (v6 != v5)
    {
      v8 = 0;
      v9 = 0;
      v163 = 0;
      v158 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
      v159 = *MEMORY[0x24BEDB7F0];
      v157 = *(_OWORD **)(MEMORY[0x24BEDB7F0] + 72);
      v155 = MEMORY[0x24BEDB848] + 16;
      while (1)
      {
        v10 = *(_QWORD *)(v5 + 8 * v8);
        v171 = 0;
        v172 = 0;
        v170 = 0;
        std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v170, *(const void **)(v10 + 8), *(_QWORD *)(v10 + 16), *(_QWORD *)(v10 + 16) - *(_QWORD *)(v10 + 8));
        std::vector<float>::vector(__p, v171 - (_BYTE *)v170);
        CNN::convertByteToFloatVector(a1, (uint64_t)v170, (uint64_t)v171, (uint64_t)__p[0], v11, v12, v13);
        CNN::feedForward(a1, (uint64_t)__p, **(_QWORD **)(a1 + 64));
        v166[0] = 0;
        v167 = 10;
        v14 = (_OWORD *)operator new[]();
        *v14 = xmmword_20CDD38B0;
        v16 = v14 + 1;
        do
        {
          *(_QWORD *)v16 = 0;
          *((_DWORD *)v16++ + 2) = 0;
        }
        while (v16 != v14 + 13);
        v168 = v14 + 1;
        v17 = *(_QWORD *)(a1 + 160);
        v18 = *(char *)(v17 + 159) < 0 ? *(_QWORD *)(v17 + 144) : *(unsigned __int8 *)(v17 + 159);
        v19 = **(_QWORD **)(a1 + 64);
        v20 = v18
            ? CNN::scoreOneOutputEncodedVector((CNN *)a1, v19, v15)
            : CNN::scoreOneVector(*(_DWORD *)(a1 + 104), *(_QWORD *)(v19 + 200), (unsigned __int8 *)v166);
        v21 = v20;
        v22 = *(_QWORD *)(a1 + 8);
        v23 = *(_QWORD *)(v22 + 48);
        v161 = **(_DWORD **)(v23 + 8 * v8);
        if (v20 == v161)
        {
          ++v9;
        }
        else
        {
          v165 = 0;
          v189[0] = 0;
          TagMap::getLabel(&v188, v22 + 144, **(_DWORD **)(v23 + 8 * v163));
          std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v182);
          v24 = HIBYTE(v188.__r_.__value_.__r.__words[2]);
          if ((v188.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v25 = &v188;
          else
            v25 = (std::string *)v188.__r_.__value_.__r.__words[0];
          if (v25->__r_.__value_.__s.__data_[1] == 120)
            *(_DWORD *)((char *)v184 + *((_QWORD *)v183 - 3)) = *(_DWORD *)((_BYTE *)v184 + *((_QWORD *)v183 - 3)) & 0xFFFFFFB5 | 8;
          if ((v24 & 0x80u) == 0)
            size = v24;
          else
            size = v188.__r_.__value_.__l.__size_;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v183, (uint64_t)v25, size);
          MEMORY[0x212B95608](v182, v189);
          v27 = v189[0];
          *(_QWORD *)v182 = v159;
          *(_QWORD *)&v182[*(_QWORD *)(v159 - 24)] = v158;
          v183 = v157;
          v184[0] = v155;
          if (v186 < 0)
            operator delete(v185);
          std::streambuf::~streambuf();
          std::iostream::~basic_iostream();
          MEMORY[0x212B956D4](v187);
          if (SHIBYTE(v188.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v188.__r_.__value_.__l.__data_);
          v165 = v27;
          v28 = *(_QWORD *)(a1 + 8);
          v189[0] = 0;
          TagMap::getLabel(&v188, v28 + 144, v21);
          std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v182);
          v29 = HIBYTE(v188.__r_.__value_.__r.__words[2]);
          if ((v188.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v30 = &v188;
          else
            v30 = (std::string *)v188.__r_.__value_.__r.__words[0];
          if (v30->__r_.__value_.__s.__data_[1] == 120)
            *(_DWORD *)((char *)v184 + *((_QWORD *)v183 - 3)) = *(_DWORD *)((_BYTE *)v184 + *((_QWORD *)v183 - 3)) & 0xFFFFFFB5 | 8;
          if ((v29 & 0x80u) == 0)
            v31 = v29;
          else
            v31 = v188.__r_.__value_.__l.__size_;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v183, (uint64_t)v30, v31);
          MEMORY[0x212B95608](v182, v189);
          v32 = v189[0];
          *(_QWORD *)v182 = v159;
          *(_QWORD *)&v182[*(_QWORD *)(v159 - 24)] = v158;
          v183 = v157;
          v184[0] = MEMORY[0x24BEDB848] + 16;
          if (v186 < 0)
            operator delete(v185);
          std::streambuf::~streambuf();
          std::iostream::~basic_iostream();
          MEMORY[0x212B956D4](v187);
          if (SHIBYTE(v188.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v188.__r_.__value_.__l.__data_);
          v33 = v177;
          if (!v177)
            goto LABEL_49;
          v34 = &v177;
          do
          {
            v35 = v33;
            v36 = v34;
            v37 = *((_DWORD *)v33 + 8);
            v38 = v33 + 1;
            if (v37 >= v27)
            {
              v38 = v35;
              v34 = (_QWORD **)v35;
            }
            v33 = (_QWORD *)*v38;
          }
          while (v33);
          if (v34 == &v177)
            goto LABEL_49;
          if (v37 < v27)
            v35 = v36;
          if (v27 >= *((_DWORD *)v35 + 8))
          {
            v65 = std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v176, v27, &v165);
            v66 = *((_DWORD *)v65 + 12);
            if (v66)
            {
              v67 = (v66 + 1);
              v68 = (_DWORD *)v65[7] + 3;
              v69 = v67 - 1;
              while (*(v68 - 1) != (_DWORD)v32)
              {
                v68 += 2;
                if (!--v69)
                  goto LABEL_74;
              }
              ++*v68;
            }
            else
            {
LABEL_74:
              FixedHeap<unsigned int,unsigned int>::insert((unsigned __int8 *)v65 + 40, v32, 1u);
            }
            *(_QWORD *)v182 = v32 + 196608 * v27;
            v102 = std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v173, *(unint64_t *)v182, (uint64_t **)v182);
            v103 = v102;
            v104 = (uint64_t)(v102 + 7);
            v105 = v102[7];
            v106 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 48) + 8 * v8) + 4);
            v107 = (char *)v102[6];
            if (v107 >= (char *)v105)
            {
              v109 = v102[5];
              v110 = (v107 - (char *)v109) >> 2;
              if ((unint64_t)(v110 + 1) >> 62)
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              v111 = (char *)v105 - (char *)v109;
              v112 = ((char *)v105 - (char *)v109) >> 1;
              if (v112 <= v110 + 1)
                v112 = v110 + 1;
              if (v111 >= 0x7FFFFFFFFFFFFFFCLL)
                v113 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v113 = v112;
              if (v113)
              {
                v114 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v104, v113);
                v109 = v103[5];
                v107 = (char *)v103[6];
              }
              else
              {
                v114 = 0;
              }
              v115 = &v114[4 * v110];
              *(_DWORD *)v115 = v106;
              v108 = (uint64_t *)(v115 + 4);
              while (v107 != (char *)v109)
              {
                v116 = *((_DWORD *)v107 - 1);
                v107 -= 4;
                *((_DWORD *)v115 - 1) = v116;
                v115 -= 4;
              }
              v103[5] = (uint64_t *)v115;
              v103[6] = v108;
              v103[7] = (uint64_t *)&v114[4 * v113];
              if (v109)
                operator delete(v109);
            }
            else
            {
              *(_DWORD *)v107 = v106;
              v108 = (uint64_t *)(v107 + 4);
            }
            v103[6] = v108;
            v27 = v165;
          }
          else
          {
LABEL_49:
            v156 = v32;
            v39 = (_OWORD *)operator new[]();
            v39[1] = 0u;
            v40 = (uint64_t *)(v39 + 1);
            *v39 = xmmword_20CDD38C0;
            v39[2] = 0u;
            v39[3] = 0u;
            v39[4] = 0u;
            v39[5] = 0u;
            v39[6] = 0u;
            v41 = std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v176, v27, &v165);
            *((_WORD *)v41 + 20) = 0;
            *(uint64_t **)((char *)v41 + 44) = (uint64_t *)10;
            v42 = v41[7];
            if (v42)
            {
              MEMORY[0x212B956EC](v42 - 2, 0x1000C8000313F17);
              v43 = *((_DWORD *)v41 + 11);
            }
            else
            {
              v43 = 10;
            }
            v44 = (v43 + 2);
            v45 = (_QWORD *)operator new[]();
            v46 = v45;
            *v45 = 8;
            v45[1] = v44;
            v47 = v45 + 2;
            if ((_DWORD)v44)
              bzero(v45 + 2, 8 * v44);
            v41[7] = v47;
            v48 = (*((_DWORD *)v41 + 11) + 2);
            if (*((_DWORD *)v41 + 11) != -2)
            {
              do
              {
                if (v46 != v39)
                  *v47 = *v40;
                ++v47;
                ++v40;
                --v48;
              }
              while (v48);
            }
            MEMORY[0x212B956EC](v39, 0x1000C8000313F17);
            v49 = std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v176, v27, &v165);
            FixedHeap<unsigned int,unsigned int>::insert((unsigned __int8 *)v49 + 40, v156, 1u);
            v50 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 48) + 8 * v8) + 4);
            v51 = operator new(4uLL);
            *v51 = v50;
            *(_QWORD *)v182 = v156 + 196608 * v27;
            v52 = std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(&v173, *(unint64_t *)v182, (uint64_t **)v182);
            v53 = v52;
            v55 = (uint64_t)(v52 + 7);
            v54 = (uint64_t)v52[7];
            v57 = v52 + 5;
            v56 = v52[5];
            if ((uint64_t *)v54 == v56)
            {
              if (v56)
              {
                v52[6] = v56;
                operator delete(v56);
                v54 = 0;
                *v57 = 0;
                v57[1] = 0;
                v57[2] = 0;
              }
              v62 = v54 >> 1;
              if ((unint64_t)(v54 >> 1) <= 1)
                v62 = 1;
              if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL)
                v63 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v63 = v62;
              if (v63 >> 62)
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              v56 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v55, v63);
              v53[6] = v56;
              v58 = v53 + 6;
              *(v58 - 1) = v56;
              v58[1] = (char *)v56 + 4 * v64;
              *(_DWORD *)v56 = *v51;
              v61 = 4;
            }
            else
            {
              v59 = v52[6];
              v58 = v52 + 6;
              v60 = (char *)v59 - (char *)v56;
              if (v59 == v56)
              {
                if (v60 == 4)
                {
                  v61 = 0;
                }
                else
                {
                  v61 = 4 - v60;
                  memmove(v52[5], (char *)v51 + v60, 4 - v60);
                }
              }
              else
              {
                *(_DWORD *)v56 = *v51;
                v61 = 4;
              }
            }
            *v58 = (char *)v56 + v61;
            operator delete(v51);
            v7 = v160;
          }
          v70 = v180;
          v71 = &v180;
          v72 = &v180;
          if (v180)
          {
            v73 = &v180;
            v74 = v180;
            do
            {
              v75 = v74;
              v76 = v73;
              v77 = *((_DWORD *)v74 + 7);
              if (v77 >= v27)
                v73 = (uint64_t **)v74;
              else
                ++v74;
              v74 = (uint64_t *)*v74;
            }
            while (v74);
            if (v73 == &v180)
              goto LABEL_92;
            if (v77 < v27)
              v75 = (uint64_t *)v76;
            if (v27 < *((_DWORD *)v75 + 7))
            {
LABEL_92:
              while (1)
              {
                while (1)
                {
                  v72 = (uint64_t **)v70;
                  v78 = *((_DWORD *)v70 + 7);
                  if (v78 <= v27)
                    break;
                  v70 = *v72;
                  v71 = v72;
                  if (!*v72)
                    goto LABEL_95;
                }
                if (v78 >= v27)
                  break;
                v70 = v72[1];
                if (!v70)
                {
                  v71 = v72 + 1;
                  goto LABEL_95;
                }
              }
            }
            else
            {
              do
              {
                while (1)
                {
                  v80 = v70;
                  v81 = *((_DWORD *)v70 + 7);
                  if (v81 <= v27)
                    break;
                  v70 = (uint64_t *)*v80;
                  if (!*v80)
                  {
                    v82 = (uint64_t **)v80;
                    goto LABEL_104;
                  }
                }
                if (v81 >= v27)
                {
                  v83 = v80;
                  goto LABEL_108;
                }
                v70 = (uint64_t *)v80[1];
              }
              while (v70);
              v82 = (uint64_t **)(v80 + 1);
LABEL_104:
              v83 = operator new(0x28uLL);
              v83[7] = v27;
              v83[8] = 0;
              *(_QWORD *)v83 = 0;
              *((_QWORD *)v83 + 1) = 0;
              *((_QWORD *)v83 + 2) = v80;
              *v82 = (uint64_t *)v83;
              v84 = (uint64_t *)v83;
              if (*v179)
              {
                v179 = (uint64_t **)*v179;
                v84 = *v82;
              }
              std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v180, v84);
              ++v181;
LABEL_108:
              ++v83[8];
            }
          }
          else
          {
LABEL_95:
            v79 = operator new(0x28uLL);
            v79[7] = v27;
            v79[8] = 1;
            *(_QWORD *)v79 = 0;
            *((_QWORD *)v79 + 1) = 0;
            *((_QWORD *)v79 + 2) = v72;
            *v71 = (uint64_t *)v79;
            if (*v179)
            {
              v179 = (uint64_t **)*v179;
              v79 = *v71;
            }
            std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v180, (uint64_t *)v79);
            ++v181;
          }
        }
        v85 = HIDWORD(v167);
        v86 = v168;
        if (HIDWORD(v167))
        {
          v87 = (uint64_t *)operator new(16 * HIDWORD(v167));
          v88 = v87;
          v89 = &v87[2 * v85];
          v90 = v87;
          do
          {
            *v90 = 0;
            *((_DWORD *)v90 + 2) = 0;
            v90 += 2;
          }
          while (v90 != v89);
          v91 = 0;
          v92 = (v85 + 1) > 2 ? v85 + 1 : 2;
          v93 = 16 * v92 - 16;
          do
          {
            v94 = (char *)&v86[v91 / 0x10 + 1];
            v95 = (char *)&v87[v91 / 8];
            if (v94 != (char *)&v87[v91 / 8])
            {
              *(_QWORD *)v95 = *(_QWORD *)v94;
              *((_DWORD *)v95 + 2) = DWORD2(v86[v91 / 0x10 + 1]);
            }
            v91 += 16;
          }
          while (v93 != v91);
        }
        else
        {
          v88 = 0;
          v89 = 0;
        }
        v96 = ((char *)v89 - (char *)v88) >> 4;
        v97 = 126 - 2 * __clz(v96);
        v98 = v89 == v88 ? 0 : v97;
        *(_QWORD *)v182 = myKeySorter<double,unsigned int>;
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*,false>((uint64_t)v88, v89, (uint64_t (**)(uint64_t *, uint64_t *))v182, v98, 1);
        if (v89 != v88)
          break;
        if (v88)
          goto LABEL_131;
LABEL_132:
        if (v86)
          MEMORY[0x212B956EC](v86 - 1, 0x1000C80D9A13B51);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v170)
        {
          v171 = v170;
          operator delete(v170);
        }
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 48);
        v8 = ++v163;
        if (v163 >= (unint64_t)((*(_QWORD *)(*(_QWORD *)(a1 + 8) + 56) - v5) >> 3))
          goto LABEL_176;
      }
      v99 = 0;
      v100 = (int *)(v88 + 1);
      do
      {
        v101 = *v100;
        v100 += 4;
        if (v101 == v161)
          ++v7[v99];
        ++v99;
      }
      while (v96 > v99);
LABEL_131:
      operator delete(v88);
      goto LABEL_132;
    }
    v9 = 0;
LABEL_176:
    *(_WORD *)v182 = 0;
    *(_QWORD *)&v182[4] = 10;
    v135 = (_OWORD *)operator new[]();
    *v135 = xmmword_20CDD38C0;
    v135[1] = 0u;
    v136 = v135 + 1;
    v135[2] = 0u;
    v135[3] = 0u;
    v135[4] = 0u;
    v135[5] = 0u;
    v135[6] = 0u;
    v183 = v135 + 1;
    v137 = v179;
    if (v179 == &v180)
      goto LABEL_192;
    do
    {
      FixedHeap<unsigned int,unsigned int>::insert(v182, *((_DWORD *)v137 + 8), *((_DWORD *)v137 + 7));
      v138 = v137[1];
      if (v138)
      {
        do
        {
          v139 = (uint64_t **)v138;
          v138 = (uint64_t *)*v138;
        }
        while (v138);
      }
      else
      {
        do
        {
          v139 = (uint64_t **)v137[2];
          v140 = *v139 == (uint64_t *)v137;
          v137 = v139;
        }
        while (!v140);
      }
      v137 = v139;
    }
    while (v139 != &v180);
    v141 = *(unsigned int *)&v182[8];
    v136 = v183;
    if (!*(_DWORD *)&v182[8])
    {
LABEL_192:
      v143 = 0;
      v148 = 0;
    }
    else
    {
      v142 = *(unsigned int *)&v182[8];
      v143 = (uint64_t *)operator new(v142 * 8);
      bzero(v143, 8 * v141);
      v144 = 0;
      if ((v141 + 1) > 2)
        v145 = v141 + 1;
      else
        v145 = 2;
      v146 = 8 * v145 - 8;
      v147 = (uint64_t *)v136 + 1;
      do
      {
        if (v147 != v143)
          v143[v144 / 8] = v147[v144 / 8];
        v144 += 8;
      }
      while (v146 != v144);
      v148 = &v143[v142];
    }
    v149 = v148 - v143;
    v150 = 126 - 2 * __clz(v149);
    if (v148 == v143)
      v151 = 0;
    else
      v151 = v150;
    v188.__r_.__value_.__r.__words[0] = (std::string::size_type)myKeySorter<unsigned int,unsigned int>;
    std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*,false>((uint64_t)v143, v148, (uint64_t (**)(uint64_t *, uint64_t *))&v188, v151, 1);
    if (v148 != v143)
    {
      v152 = 0;
      v153 = 1;
      do
      {
        LODWORD(v188.__r_.__value_.__l.__data_) = HIDWORD(v143[v152]);
        std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v176, v188.__r_.__value_.__l.__data_, &v188);
        v152 = v153;
      }
      while (v149 > v153++);
    }
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(v180);
    v179 = &v180;
    v180 = 0;
    v181 = 0;
    std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(v177);
    v177 = 0;
    v178 = 0;
    v176 = (uint64_t *)&v177;
    std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(v174);
    v174 = 0;
    v175 = 0;
    v173 = (uint64_t *)&v174;
    if (v143)
      operator delete(v143);
    if (v136)
      MEMORY[0x212B956EC](v136 - 1, 0x1000C8000313F17);
  }
  else
  {
    v117 = 0;
    v9 = 0;
    v118 = (unint64_t)(v6 - v5) >> 3;
    do
    {
      v164 = v117;
      v119 = *(_DWORD *)(a1 + 60);
      v162 = v118;
      if (v119 >= v118)
        v120 = v118;
      else
        v120 = v119;
      if ((_DWORD)v120)
      {
        v121 = 0;
        v122 = 0;
        v123 = v117;
        do
        {
          v124 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + v121;
          *(_DWORD *)(v124 + 136) = 0;
          *(_QWORD *)(v124 + 152) = FFThread;
          v125 = *(_QWORD *)(v124 + 144);
          *(_QWORD *)v125 = a1;
          v126 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 48) + 8 * (v123 + v122));
          std::vector<float>::resize((_QWORD *)(v125 + 88), *(_QWORD *)(v126 + 16) - *(_QWORD *)(v126 + 8));
          CNN::convertByteToFloatVector(a1, *(_QWORD *)(v126 + 8), *(_QWORD *)(v126 + 16), *(_QWORD *)(v125 + 88), v127, v128, v129);
          *(_QWORD *)(v125 + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v122);
          *(_DWORD *)(v125 + 32) = v123 + v122++;
          v121 += 176;
        }
        while (v120 != v122);
      }
      v7 = v160;
      if (ThreadPoolAuto::runThreads((ThreadPoolAuto *)(a1 + 136), v120))
        break;
      if ((_DWORD)v120)
      {
        v130 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 144);
        v131 = v164;
        v132 = v164;
        v133 = v120;
        do
        {
          v134 = *v130;
          v130 += 22;
          if (*(_DWORD *)(v134 + 112) == **(_DWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 48) + 8 * v132))
            ++v9;
          ++v132;
          --v133;
        }
        while (v133);
      }
      else
      {
        v131 = v164;
      }
      v117 = v120 + v131;
      LODWORD(v118) = v162 - v120;
    }
    while (v162 != (_DWORD)v120);
  }
  *(double *)(a1 + 24) = (double)v9
                       / (double)(unint64_t)((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 56)
                                                            - *(_QWORD *)(*(_QWORD *)(a1 + 8) + 48)) >> 3);
  std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(v174);
  std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(v177);
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(v180);
  operator delete(v7);
}

void sub_20CD94D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,_QWORD *a39,uint64_t a40,uint64_t a41,_QWORD *a42,uint64_t a43,char a44,_QWORD *a45,uint64_t a46,char a47)
{
  uint64_t v47;

  if (v47)
    MEMORY[0x212B956EC](v47 - 16, 0x1000C8000313F17);
  std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(a39);
  std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(a42);
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a45);
  operator delete(a25);
  _Unwind_Resume(a1);
}

unsigned __int8 *FixedHeap<unsigned int,unsigned int>::insert(unsigned __int8 *result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int *v15;
  int v16;
  unsigned int v17;

  v3 = *((unsigned int *)result + 2);
  v4 = (v3 + 1);
  if (result[1])
    v5 = v4 >= 2;
  else
    v5 = 0;
  if (v5)
  {
    v6 = (_DWORD *)(*((_QWORD *)result + 2) + 12);
    v7 = 1;
    while (*(v6 - 1) != a2 || *v6 != a3)
    {
      ++v7;
      v6 += 2;
      if (v4 == v7)
        goto LABEL_10;
    }
    if ((int)v7 > 0)
      return result;
  }
LABEL_10:
  if ((_DWORD)v3 != *((_DWORD *)result + 1))
  {
    v9 = (unsigned int *)*((_QWORD *)result + 2);
    v3 = (v3 + 1);
    *((_DWORD *)result + 2) = v3;
    v10 = &v9[2 * v3];
    v8 = *result;
    goto LABEL_15;
  }
  v8 = *result;
  v9 = (unsigned int *)*((_QWORD *)result + 2);
  v10 = &v9[2 * v3];
  v11 = *v10;
  if (!*result)
  {
    if (v11 < a2)
    {
      v8 = 0;
      goto LABEL_15;
    }
    v3 = (v3 - 1);
    if (v9[2 * v3] >= a2)
      return result;
LABEL_35:
    LODWORD(v12) = v3;
    v10 = &v9[2 * v3];
LABEL_16:
    *v10 = a2;
    v10[1] = a3;
    v13 = *(_QWORD *)&v9[2 * v3];
    if (v8)
      v14 = 0x80000000;
    else
      v14 = 0x7FFFFFFF;
    *v9 = v14;
    v15 = v9;
LABEL_20:
    v15[1] = v14;
    while (1)
    {
      v16 = v12;
      v12 = v12 >> 1;
      v17 = v9[2 * v12];
      if (v8)
      {
        if (v13 > v17)
          goto LABEL_27;
      }
      else if (v13 < v17)
      {
LABEL_27:
        *(_QWORD *)&v9[2 * v16] = v13;
        return result;
      }
      if (v16 != (_DWORD)v12)
      {
        v15 = &v9[2 * v16];
        *v15 = v17;
        v14 = v9[2 * v12 + 1];
        goto LABEL_20;
      }
    }
  }
  if (v11 > a2)
  {
    v8 = 1;
LABEL_15:
    LODWORD(v12) = v3;
    goto LABEL_16;
  }
  v3 = (v3 - 1);
  if (v9[2 * v3] > a2)
    goto LABEL_35;
  return result;
}

uint64_t FFThread(uint64_t a1)
{
  CNNSignals *v2;
  CNN *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  double v12;

  CNN::feedForward(*(_QWORD *)a1, a1 + 88, *(_QWORD *)(a1 + 24));
  v3 = *(CNN **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 160);
  if (*(char *)(v4 + 159) < 0)
    v5 = *(_QWORD *)(v4 + 144);
  else
    v5 = *(unsigned __int8 *)(v4 + 159);
  v6 = *(_QWORD *)(a1 + 24);
  if (v5)
  {
    v7 = CNN::scoreOneOutputEncodedVector(v3, v6, v2);
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)(v6 + 200) + 8 * (*((_DWORD *)v3 + 26) - 1));
    v7 = 0;
    v9 = *(_QWORD *)(v8 + 16) - 1;
    if (*(_QWORD *)(v8 + 16) != 1)
    {
      v10 = *(_QWORD *)(v8 + 24);
      v11 = 1;
      v12 = -1000.0;
      do
      {
        if (v12 < *(float *)(v10 + 4 * (int)(v11 - 1)))
        {
          v7 = v11 - 1;
          v12 = *(float *)(v10 + 4 * (int)(v11 - 1));
        }
      }
      while (v9 > v11++);
    }
  }
  *(_DWORD *)(a1 + 112) = v7;
  return 0;
}

size_t CNN::importClassifierBinary(CNN *this, __sFILE *__stream)
{
  size_t result;
  uint64_t v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t i;
  uint64_t (**v14)();
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t __ptr;
  uint64_t v19;

  __ptr = 0;
  fread((char *)&__ptr + 4, 4uLL, 1uLL, __stream);
  result = fread(&__ptr, 4uLL, 1uLL, __stream);
  v5 = *((_QWORD *)this + 1);
  v6 = *(float *)&__ptr;
  *(double *)(v5 + 80) = *((float *)&__ptr + 1);
  *(double *)(v5 + 88) = v6;
  if (*((_DWORD *)this + 26))
  {
    v7 = 0;
    do
    {
      v14 = &off_24C58B080;
      v16 = 0;
      v17 = 0;
      v15 = 0;
      v8 = *(_QWORD *)(*((_QWORD *)this + 14) + 8 * v7);
      matrix<float>::resize(&v14, *(_QWORD *)(v8 + 72), *(_QWORD *)(v8 + 80), 0);
      v9 = *(_QWORD **)(*((_QWORD *)this + 14) + 8 * v7);
      if (v15 == v9[9] && v16 == v9[10])
      {
        v19 = 0;
        fread((char *)&v19 + 4, 4uLL, 1uLL, __stream);
        fread(&v19, 4uLL, 1uLL, __stream);
        matrix<float>::resize(v9 + 8, HIDWORD(v19), v19, 0);
        v10 = v9[9];
        if (v10)
        {
          v11 = 0;
          v12 = v9[10];
          do
          {
            if (v12)
            {
              for (i = 0; i < v12; ++i)
              {
                fread((void *)(v9[11] + 4 * (i + v11 * v12)), 4uLL, 1uLL, __stream);
                v12 = v9[10];
              }
              v10 = v9[9];
            }
            ++v11;
          }
          while (v10 > v11);
        }
      }
      v14 = &off_24C58B080;
      result = v17;
      if (v17)
        result = MEMORY[0x212B956EC](v17, 0x1000C8052888210);
      ++v7;
    }
    while (v7 < *((unsigned int *)this + 26));
  }
  return result;
}

void sub_20CD952D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    MEMORY[0x212B956EC](a12, 0x1000C8052888210);
  _Unwind_Resume(exception_object);
}

uint64_t CNN::exportClassifier(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  const std::locale::facet *v14;
  _QWORD *v15;
  _QWORD *v16;
  const std::locale::facet *v17;
  unint64_t v18;
  std::locale::id *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  const std::locale::facet *v25;
  _QWORD *v26;
  const std::locale::facet *v27;
  _QWORD *v28;
  const std::locale::facet *v29;
  _QWORD *v30;
  const std::locale::facet *v31;
  _QWORD *v32;
  const std::locale::facet *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  std::locale::id *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  const std::locale::facet *v43;
  _QWORD *v44;
  _QWORD *v45;
  BOOL v46;
  _QWORD *v47;
  const std::locale::facet *v48;
  std::locale v50;
  uint64_t v51;
  _BYTE v52[408];
  _QWORD v53[21];

  v53[19] = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BEDB840];
  v3 = MEMORY[0x24BEDB840] + 64;
  v4 = (uint64_t *)MEMORY[0x24BEDB7E8];
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  v53[0] = MEMORY[0x24BEDB840] + 64;
  v51 = v5;
  *(_QWORD *)&v52[*(_QWORD *)(v5 - 24) - 8] = v6;
  v7 = (std::ios_base *)&v52[*(_QWORD *)(v51 - 24) - 8];
  std::ios_base::init(v7, v52);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v51 = v2 + 24;
  v53[0] = v3;
  MEMORY[0x212B955CC](v52);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)&v52[*(_QWORD *)(v51 - 24) - 8], *(_DWORD *)&v52[*(_QWORD *)(v51 - 24) + 24] | 4);
  *(_QWORD *)&v52[*(_QWORD *)(v51 - 24) + 8] = 8;
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v51, (uint64_t)"<classifier name= ", 18);
  v9 = *(char *)(a1 + 55);
  if (v9 >= 0)
    v10 = a1 + 32;
  else
    v10 = *(_QWORD *)(a1 + 32);
  if (v9 >= 0)
    v11 = *(unsigned __int8 *)(a1 + 55);
  else
    v11 = *(_QWORD *)(a1 + 40);
  v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, v10, v11);
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" >", 2);
  std::ios_base::getloc((const std::ios_base *)((char *)v13 + *(_QWORD *)(*v13 - 24)));
  v14 = std::locale::use_facet(&v50, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
  std::locale::~locale(&v50);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v51, (uint64_t)"  <dimension> ", 14);
  v15 = (_QWORD *)std::ostream::operator<<();
  v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" </dimension>", 13);
  std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(_QWORD *)(*v16 - 24)));
  v17 = std::locale::use_facet(&v50, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
  std::locale::~locale(&v50);
  std::ostream::put();
  std::ostream::flush();
  if (*(_DWORD *)(a1 + 104))
  {
    v18 = 0;
    v19 = (std::locale::id *)MEMORY[0x24BEDB350];
    do
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8 * v18);
      v21 = *(char *)(v20 + 47);
      if (v21 >= 0)
        v22 = v20 + 24;
      else
        v22 = *(_QWORD *)(v20 + 24);
      if (v21 >= 0)
        v23 = *(unsigned __int8 *)(v20 + 47);
      else
        v23 = *(_QWORD *)(v20 + 32);
      v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v51, v22, v23);
      std::ios_base::getloc((const std::ios_base *)((char *)v24 + *(_QWORD *)(*v24 - 24)));
      v25 = std::locale::use_facet(&v50, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v25->__vftable[2].~facet_0)(v25, 10);
      std::locale::~locale(&v50);
      std::ostream::put();
      std::ostream::flush();
      v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v51, (uint64_t)"<weights>", 9);
      std::ios_base::getloc((const std::ios_base *)((char *)v26 + *(_QWORD *)(*v26 - 24)));
      v27 = std::locale::use_facet(&v50, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v27->__vftable[2].~facet_0)(v27, 10);
      std::locale::~locale(&v50);
      std::ostream::put();
      std::ostream::flush();
      v28 = (_QWORD *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v28 + *(_QWORD *)(*v28 - 24)));
      v29 = std::locale::use_facet(&v50, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v29->__vftable[2].~facet_0)(v29, 10);
      std::locale::~locale(&v50);
      std::ostream::put();
      std::ostream::flush();
      v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v51, (uint64_t)"</weights>", 10);
      std::ios_base::getloc((const std::ios_base *)((char *)v30 + *(_QWORD *)(*v30 - 24)));
      v31 = std::locale::use_facet(&v50, v19);
      ((void (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)(v31, 10);
      std::locale::~locale(&v50);
      std::ostream::put();
      std::ostream::flush();
      ++v18;
    }
    while (v18 < *(unsigned int *)(a1 + 104));
  }
  v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v51, (uint64_t)"<labels>", 8);
  std::ios_base::getloc((const std::ios_base *)((char *)v32 + *(_QWORD *)(*v32 - 24)));
  v33 = std::locale::use_facet(&v50, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v33->__vftable[2].~facet_0)(v33, 10);
  std::locale::~locale(&v50);
  std::ostream::put();
  std::ostream::flush();
  v34 = *(_QWORD *)(a1 + 8);
  v35 = *(_QWORD **)(v34 + 144);
  v36 = (_QWORD *)(v34 + 152);
  if (v35 != (_QWORD *)(v34 + 152))
  {
    v37 = (std::locale::id *)MEMORY[0x24BEDB350];
    do
    {
      v38 = *((char *)v35 + 55);
      if (v38 >= 0)
        v39 = (uint64_t)(v35 + 4);
      else
        v39 = v35[4];
      if (v38 >= 0)
        v40 = *((unsigned __int8 *)v35 + 55);
      else
        v40 = v35[5];
      v41 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v51, v39, v40);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)" ", 1);
      v42 = (_QWORD *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v42 + *(_QWORD *)(*v42 - 24)));
      v43 = std::locale::use_facet(&v50, v37);
      ((void (*)(const std::locale::facet *, uint64_t))v43->__vftable[2].~facet_0)(v43, 10);
      std::locale::~locale(&v50);
      std::ostream::put();
      std::ostream::flush();
      v44 = (_QWORD *)v35[1];
      if (v44)
      {
        do
        {
          v45 = v44;
          v44 = (_QWORD *)*v44;
        }
        while (v44);
      }
      else
      {
        do
        {
          v45 = (_QWORD *)v35[2];
          v46 = *v45 == (_QWORD)v35;
          v35 = v45;
        }
        while (!v46);
      }
      v35 = v45;
    }
    while (v45 != v36);
  }
  v47 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v51, (uint64_t)"</labels>", 9);
  std::ios_base::getloc((const std::ios_base *)((char *)v47 + *(_QWORD *)(*v47 - 24)));
  v48 = std::locale::use_facet(&v50, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v48->__vftable[2].~facet_0)(v48, 10);
  std::locale::~locale(&v50);
  std::ostream::put();
  std::ostream::flush();
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)&v52[*(_QWORD *)(v51 - 24) - 8], *(_DWORD *)&v52[*(_QWORD *)(v51 - 24) + 24] | 4);
  v51 = *v4;
  *(_QWORD *)&v52[*(_QWORD *)(v51 - 24) - 8] = v4[3];
  MEMORY[0x212B955D8](v52);
  std::ostream::~ostream();
  return MEMORY[0x212B956D4](v53);
}

void sub_20CD95960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, char a12)
{
  std::ostream::~ostream();
  MEMORY[0x212B956D4](a10);
  _Unwind_Resume(a1);
}

_QWORD *std::ofstream::~ofstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E8];
  v3 = *MEMORY[0x24BEDB7E8];
  *a1 = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x212B955D8](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x212B956D4](a1 + 52);
  return a1;
}

uint64_t CNN::importClassifier(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  std::string *p_p;
  int v6;
  std::string *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  std::string *v12;
  float v13;
  std::string *v14;
  float v15;
  uint64_t v16;
  std::string *v17;
  std::string::size_type v18;
  int v19;
  int v22;
  uint64_t v23;
  int v24;
  std::string __str;
  std::string v26;
  uint64_t v27;
  void *v28[2];
  uint64_t v29;
  std::string __p;
  uint64_t v31[2];
  _BYTE v32[408];
  _QWORD v33[21];

  v33[19] = *MEMORY[0x24BDAC8D0];
  std::ifstream::basic_ifstream(v31);
  memset(&__str, 0, sizeof(__str));
  v24 = 0;
  v23 = 0;
  if (*(_DWORD *)&v32[*(_QWORD *)(v31[0] - 24) + 16])
  {
    v22 = 3;
    goto LABEL_59;
  }
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  std::string::operator=((std::string *)(a1 + 32), &__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  MEMORY[0x212B95608](v31, &v24);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 8) + 32) != v24)
  {
    v22 = 4;
LABEL_59:
    exit(v22);
  }
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  MEMORY[0x212B955FC](v31, &v23);
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 80) = v23;
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  MEMORY[0x212B955FC](v31, &v23);
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 88) = v23;
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  if (*(_DWORD *)(a1 + 104))
  {
    v2 = 0;
    do
    {
      std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
      v3 = a1;
      v4 = *(_QWORD **)(*(_QWORD *)(a1 + 112) + 8 * v2);
      v28[0] = 0;
      v28[1] = 0;
      v29 = 0;
      v26.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C58B080;
      v27 = 0;
      *(_OWORD *)&v26.__r_.__value_.__r.__words[1] = 0uLL;
      std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)v28);
      matrix<float>::resize(&v26, v4[9], v4[10], 0);
      memset(&__p, 0, sizeof(__p));
      std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__p, 0x5Bu);
      std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__p, 0x2Cu);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      v6 = atoi((const char *)p_p);
      std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__p, 0x5Du);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v7 = &__p;
      else
        v7 = (std::string *)__p.__r_.__value_.__r.__words[0];
      v8 = atoi((const char *)v7);
      matrix<float>::resize(&v26, v6, v8, 0);
      std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__p, 0x28u);
      if (v6 >= 1)
      {
        v9 = 0;
        v10 = (v8 - 1);
        do
        {
          std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__p, 0x28u);
          if (v8 >= 2)
          {
            v11 = 0;
            do
            {
              std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__p, 0x2Cu);
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v12 = &__p;
              else
                v12 = (std::string *)__p.__r_.__value_.__r.__words[0];
              v13 = atof((const char *)v12);
              *(float *)(v27 + 4 * (v11 + v9 * v26.__r_.__value_.__r.__words[2])) = v13;
              ++v11;
            }
            while (v10 != v11);
          }
          std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__p, 0x29u);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v14 = &__p;
          else
            v14 = (std::string *)__p.__r_.__value_.__r.__words[0];
          v15 = atof((const char *)v14);
          *(float *)(v27 + 4 * ((int)v10 + v26.__r_.__value_.__r.__words[2] * v9++)) = v15;
        }
        while (v9 != v6);
      }
      std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__p, 0x29u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (*(_OWORD *)&v26.__r_.__value_.__r.__words[1] != *(_OWORD *)(v4 + 9))
        exit(12345);
      matrix<float>::operator=(v4 + 8, (uint64_t)&v26);
      std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)v28);
      v26.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C58B080;
      if (v27)
        MEMORY[0x212B956EC](v27, 0x1000C8052888210);
      a1 = v3;
      if (SHIBYTE(v29) < 0)
        operator delete(v28[0]);
      ++v2;
    }
    while (v2 < *(unsigned int *)(v3 + 104));
  }
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&__str);
  v16 = *(_QWORD *)(a1 + 8);
  memset(&v26, 0, sizeof(v26));
  memset(&__p, 0, sizeof(__p));
  LODWORD(v28[0]) = 0;
  std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(v16 + 168, *(char **)(v16 + 176));
  *(_QWORD *)(v16 + 168) = v16 + 176;
  *(_QWORD *)(v16 + 184) = 0;
  *(_QWORD *)(v16 + 176) = 0;
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(v16 + 144, *(char **)(v16 + 152));
  *(_QWORD *)(v16 + 144) = v16 + 152;
  *(_QWORD *)(v16 + 160) = 0;
  *(_QWORD *)(v16 + 152) = 0;
  for (*(_DWORD *)(v16 + 192) = 0; ; ++*(_DWORD *)(v16 + 192))
  {
    std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v31, (uint64_t)&v26);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
      break;
    if (HIBYTE(v26.__r_.__value_.__r.__words[2]) == 9)
    {
      v17 = &v26;
      goto LABEL_41;
    }
    if (!*((_BYTE *)&v26.__r_.__value_.__s + 23))
      goto LABEL_56;
LABEL_45:
    std::string::operator=(&__p, &v26);
    MEMORY[0x212B95608](v31, v28);
    TagMap::storeLabel((uint64_t **)(v16 + 144), &__p, v28[0]);
  }
  if (v26.__r_.__value_.__l.__size_ != 9)
  {
    if (!v26.__r_.__value_.__l.__size_)
LABEL_56:
      exit(3);
    goto LABEL_45;
  }
  v17 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_41:
  v18 = v17->__r_.__value_.__r.__words[0];
  v19 = v17->__r_.__value_.__s.__data_[8];
  if (v18 != 0x736C6562616C2F3CLL || v19 != 62)
    goto LABEL_45;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((*((_BYTE *)&v26.__r_.__value_.__s + 23) & 0x80) != 0)
      goto LABEL_54;
  }
  else
  {
    if ((*((_BYTE *)&v26.__r_.__value_.__s + 23) & 0x80) == 0)
      goto LABEL_48;
LABEL_54:
    operator delete(v26.__r_.__value_.__l.__data_);
  }
LABEL_48:
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)((char *)v31 + *(_QWORD *)(v31[0] - 24)), *(_DWORD *)&v32[*(_QWORD *)(v31[0] - 24) + 16] | 4);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v31[0] = *MEMORY[0x24BEDB7E0];
  *(uint64_t *)((char *)v31 + *(_QWORD *)(v31[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
  MEMORY[0x212B955D8](v32);
  std::istream::~istream();
  return MEMORY[0x212B956D4](v33);
}

void sub_20CD95FF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37)
{
  _Unwind_Resume(exception_object);
}

_QWORD *std::ifstream::basic_ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;

  v2 = MEMORY[0x24BEDB838];
  v3 = MEMORY[0x24BEDB838] + 64;
  a1[53] = MEMORY[0x24BEDB838] + 64;
  v4 = a1 + 2;
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  *a1 = v5;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = v6;
  a1[1] = 0;
  v7 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v7, a1 + 2);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *a1 = v2 + 24;
  a1[53] = v3;
  MEMORY[0x212B955CC](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_20CD96180(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::istream::~istream();
  MEMORY[0x212B956D4](v1 + 424);
  _Unwind_Resume(a1);
}

uint64_t *std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const std::locale::facet *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE *v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  std::locale v19;
  char v20;

  MEMORY[0x212B955E4](&v20, a1, 0);
  if (!v20)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v4 = *(_QWORD *)(*a1 - 24);
  v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1)
    v6 = 1;
  else
    v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  v7 = std::locale::use_facet(&v19, MEMORY[0x24BEDB350]);
  std::locale::~locale(&v19);
  v8 = 0;
  v9 = a1 + 5;
  if (v5 >= 1)
    v10 = v6;
  else
    v10 = 0x7FFFFFFFFFFFFFF7;
  while (1)
  {
    v11 = *(_QWORD **)((char *)v9 + *(_QWORD *)(*a1 - 24));
    v12 = (_BYTE *)v11[3];
    if (v12 == (_BYTE *)v11[4])
      break;
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      v16 = 0;
      goto LABEL_23;
    }
    std::string::push_back((std::string *)a2, v13);
    v14 = *(_QWORD **)((char *)v9 + *(_QWORD *)(*a1 - 24));
    v15 = v14[3];
    if (v15 == v14[4])
      (*(void (**)(_QWORD *))(*v14 + 80))(v14);
    else
      v14[3] = v15 + 1;
    if (v10 == ++v8)
    {
      v16 = 0;
      v17 = *a1;
      *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 0;
      goto LABEL_25;
    }
  }
  v13 = (*(uint64_t (**)(_QWORD *))(*v11 + 72))(v11);
  if (v13 != -1)
    goto LABEL_14;
  v16 = 2;
LABEL_23:
  v17 = *a1;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 0;
  if (!v8)
    v16 |= 4u;
LABEL_25:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(v17 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_20CD9636C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  _QWORD *v9;
  uint64_t v11;

  std::locale::~locale(&a9);
  __cxa_begin_catch(a1);
  v11 = *v9;
  *(_DWORD *)((char *)v9 + *(_QWORD *)(*v9 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v9 + *(_QWORD *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x20CD96338);
  }
  __cxa_rethrow();
}

void sub_20CD963D0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *std::ifstream::~ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E0];
  v3 = *MEMORY[0x24BEDB7E0];
  *a1 = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x212B955D8](a1 + 2);
  std::istream::~istream();
  MEMORY[0x212B956D4](a1 + 53);
  return a1;
}

void CNN::ClassifyOne(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  double v8;
  double v9;
  float v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  _OWORD *v14;
  unsigned int *v15;
  std::string *p_p;
  float v17;
  std::string __p;
  __int16 v19[2];
  uint64_t v20;
  _OWORD *v21;
  void *v22[3];

  std::vector<float>::vector(v22, a2[1] - *a2);
  CNN::convertByteToFloatVector(a1, *a2, a2[1], (uint64_t)v22[0], v8, v9, v10);
  CNN::feedForward(a1, (uint64_t)v22, **(_QWORD **)(a1 + 64));
  v19[0] = 0;
  v20 = 4;
  v11 = (_OWORD *)operator new[]();
  *v11 = xmmword_20CDD38D0;
  v12 = v11 + 1;
  do
  {
    *(_QWORD *)v12 = 0;
    *((_DWORD *)v12++ + 2) = 0;
  }
  while (v12 != v11 + 7);
  v21 = v11 + 1;
  CNN::scoreOneVector(*(_DWORD *)(a1 + 104), *(_QWORD *)(**(_QWORD **)(a1 + 64) + 200), (unsigned __int8 *)v19);
  v13 = 0;
  v14 = v21;
  v15 = (unsigned int *)v21 + 6;
  do
  {
    TagMap::getLabel(&__p, *(_QWORD *)(a1 + 8) + 144, *v15);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    sscanf((const char *)p_p, "%x", a3 + v13);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v17 = *((double *)v15 - 1);
    *(float *)(a4 + v13) = v17;
    v13 += 4;
    v15 += 4;
  }
  while (v13 != 16);
  MEMORY[0x212B956EC](v14 - 1, 0x1000C80D9A13B51);
  if (v22[0])
  {
    v22[1] = v22[0];
    operator delete(v22[0]);
  }
}

void sub_20CD965C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void TagMap::getLabel(std::string *this, uint64_t a2, unsigned int a3)
{
  uint64_t **v4;
  __int128 v5;
  unsigned int v6;
  unsigned int *v7;

  v6 = a3;
  v7 = &v6;
  v4 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(a2 + 24), &v6, (uint64_t)&std::piecewise_construct, &v7);
  if (*((char *)v4 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(this, (const std::string::value_type *)v4[5], (std::string::size_type)v4[6]);
  }
  else
  {
    v5 = *(_OWORD *)(v4 + 5);
    this->__r_.__value_.__r.__words[2] = (std::string::size_type)v4[7];
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
}

CNN *CNN::CNNFromModel(const char *a1)
{
  FILE *v1;
  CNN *v3;
  int *v4;
  Corpus *v5;
  char **v7;
  char *v8[2];
  char **v9;
  char *v10[2];
  int v11;
  _BYTE v12[3];
  _DWORD __ptr[3];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  v1 = fopen(a1, "r");
  fread(__ptr, 4uLL, 3uLL, v1);
  if (__ptr[0] > 1u || __ptr[1] != 0)
    return 0;
  fread(v12, 1uLL, 3uLL, v1);
  v4 = (int *)operator new();
  NetworkParameters::NetworkParameters((NetworkParameters *)v4);
  NetworkParameters::initializeFromBinaryFile((NetworkParameters *)v4, v1);
  v7 = v8;
  v8[0] = 0;
  v10[0] = 0;
  v10[1] = 0;
  v8[1] = 0;
  v9 = v10;
  v11 = 0;
  TagMap::importTagMapBinary((uint64_t **)&v7, v1);
  v5 = (Corpus *)operator new();
  Corpus::Corpus((uint64_t)v5, 0.0, 0.0, (uint64_t)(v4 + 16), v4[29] * v4[28], 0, 0, 0, v4[12], &v7, 0);
  v3 = (CNN *)operator new();
  CNN::CNN(v3, v5, (NetworkParameters *)v4);
  CNN::importClassifierBinary(v3, v1);
  fclose(v1);
  std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy((uint64_t)&v9, v10[0]);
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy((uint64_t)&v7, v8[0]);
  return v3;
}

void sub_20CD96838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  MEMORY[0x212B95704](v3, 0x10B3C40EE8EEB88);
  TagMap::~TagMap((char **)va);
  _Unwind_Resume(a1);
}

void TagMap::importTagMapBinary(uint64_t **this, __sFILE *__stream)
{
  int i;
  std::string __p;
  unsigned int v6;
  int v7;
  int __ptr;
  char __str[256];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  __ptr = 0;
  fread(&__ptr, 4uLL, 1uLL, __stream);
  for (i = __ptr; i; --i)
  {
    v6 = 0;
    v7 = 0;
    fread(&v7, 4uLL, 1uLL, __stream);
    fread(&v6, 4uLL, 1uLL, __stream);
    snprintf(__str, 0x100uLL, "0x%x", v7);
    std::string::basic_string[abi:ne180100]<0>(&__p, __str);
    TagMap::storeLabel(this, &__p, v6);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    ++*((_DWORD *)this + 12);
  }
}

void sub_20CD969B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void TagMap::~TagMap(char **this)
{
  std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy((uint64_t)(this + 3), this[4]);
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy((uint64_t)this, this[1]);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_20CD96B20(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x212B956D4](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212B956D4](a1 + 128);
  return a1;
}

std::string *TagMap::storeLabel(uint64_t **a1, std::string *a2, unsigned int a3)
{
  uint64_t **v6;
  unsigned int v8;
  unsigned int *v9;

  v8 = a3;
  if (std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__count_unique<std::string>((uint64_t)a1, (const void **)&a2->__r_.__value_.__l.__data_))
  {
    exit(1);
  }
  v9 = (unsigned int *)a2;
  *((_DWORD *)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (const void **)&a2->__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (__int128 **)&v9)+ 14) = a3;
  v9 = &v8;
  v6 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(a1 + 3, &v8, (uint64_t)&std::piecewise_construct, &v9);
  return std::string::operator=((std::string *)(v6 + 5), a2);
}

void std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[63] < 0)
      operator delete(*((void **)a2 + 5));
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

uint64_t std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__count_unique<std::string>(uint64_t a1, const void **a2)
{
  const void **v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    v4 = a1 + 16;
    v5 = 1;
    do
    {
      if (!std::less<std::string>::operator()[abi:ne180100](v4, a2, v2 + 4))
      {
        if (!std::less<std::string>::operator()[abi:ne180100](v4, v2 + 4, a2))
          return v5;
        ++v2;
      }
      v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

uint64_t *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;

  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

_QWORD *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *v7;
  __int128 *v8;
  __int128 v9;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x40uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  v7 = (std::string *)(v6 + 32);
  v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((_QWORD *)v8 + 1));
  }
  else
  {
    v9 = *v8;
    *((_QWORD *)v6 + 6) = *((_QWORD *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  *((_DWORD *)v6 + 14) = 0;
  *(_BYTE *)(a3 + 16) = 1;
}

void sub_20CD96FA8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0)
      operator delete(__p[4]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t **std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t **v9;
  unsigned int v10;
  _DWORD *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((_QWORD *)v11 + 6) = 0;
    *((_QWORD *)v11 + 7) = 0;
    *((_QWORD *)v11 + 5) = 0;
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void NetworkParameters::NetworkParameters(NetworkParameters *this)
{
  *(_QWORD *)this = &off_24C58AE58;
  *((_QWORD *)this + 1) = 0x100000000;
  *((_DWORD *)this + 4) = 1;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)this + 3, "");
  *((_QWORD *)this + 6) = 0x100000002;
  *((_BYTE *)this + 56) = 0;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)this + 8, "");
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)this + 11, "");
  *((_OWORD *)this + 7) = xmmword_20CDD38E0;
  *((_DWORD *)this + 32) = 100000;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)this + 17, "");
  *((_QWORD *)this + 20) = 0;
  *((_QWORD *)this + 21) = 0x3F8000003E4CCCCDLL;
  *((_QWORD *)this + 22) = 0x7D000000000;
  *((_DWORD *)this + 46) = 7200000;
  *((_QWORD *)this + 24) = 0x3F1A36E2EB1C432DLL;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 26) = 0;
  *((_QWORD *)this + 27) = 0;
  *((_BYTE *)this + 224) = 0;
}

void sub_20CD973C4(_Unwind_Exception *exception_object)
{
  char *v1;
  void **v2;
  void **v3;
  void **v4;

  if (v1[111] < 0)
    operator delete(*v4);
  if (v1[87] < 0)
    operator delete(*v3);
  if (v1[47] < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void NetworkParameters::~NetworkParameters(NetworkParameters *this)
{
  NetworkParameters::~NetworkParameters(this);
  JUMPOUT(0x212B95704);
}

{
  void *v2;

  *(_QWORD *)this = &off_24C58AE58;
  v2 = (void *)*((_QWORD *)this + 25);
  if (v2)
  {
    *((_QWORD *)this + 26) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 159) < 0)
    operator delete(*((void **)this + 17));
  if (*((char *)this + 111) < 0)
    operator delete(*((void **)this + 11));
  if (*((char *)this + 87) < 0)
    operator delete(*((void **)this + 8));
  if (*((char *)this + 47) < 0)
    operator delete(*((void **)this + 3));
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x212B9562C](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x212B95638](v13);
  return a1;
}

void sub_20CD97648(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x212B95638](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x20CD97628);
}

void sub_20CD97690(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_20CD977C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void matrix<float>::~matrix(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_24C58B080;
  v1 = a1[3];
  if (v1)
    MEMORY[0x212B956EC](v1, 0x1000C8052888210);
  JUMPOUT(0x212B95704);
}

uint64_t ConvolutionLayer<float,float,float>::ConvolutionLayer(uint64_t a1, const std::string *a2, int a3, int a4, int a5, int a6, int a7, int a8, float a9, __int128 a10, __int128 a11, char a12)
{
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  float v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int v25;
  signed int v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  float v30;
  float v31;
  BOOL v33;

  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 64) = &off_24C58B080;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = &off_24C58B080;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = &off_24C58B080;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(_QWORD *)a1 = off_24C58ADC8;
  *(_DWORD *)(a1 + 164) = a3;
  *(_DWORD *)(a1 + 168) = a4;
  *(_DWORD *)(a1 + 172) = a5;
  *(_DWORD *)(a1 + 176) = a6;
  *(_DWORD *)(a1 + 180) = a7;
  *(_DWORD *)(a1 + 184) = a8;
  *(_OWORD *)(a1 + 188) = a10;
  *(_OWORD *)(a1 + 204) = a11;
  *(_BYTE *)(a1 + 240) = a12;
  std::string::operator=((std::string *)(a1 + 24), a2);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a1 + 168) * *(_DWORD *)(a1 + 164);
  v14 = *(_DWORD *)(a1 + 196);
  v15 = *(_DWORD *)(a1 + 212);
  v16 = *(_DWORD *)(a1 + 216);
  v17 = (float)((float)v14 - (float)v15) / ((float)v16 + 1.0) + 1.0;
  v18 = (v14 - v15) / (v16 + 1) + 1;
  *(_DWORD *)(a1 + 220) = v18;
  if (vabds_f32(v17, (float)v18) > 2.2204e-16)
    exit(12345);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a1 + 192) * *(_DWORD *)(a1 + 188);
  matrix<float>::resize((_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 180), *(unsigned int *)(a1 + 184), 0);
  matrix<float>::resize((_QWORD *)(a1 + 96), *(unsigned int *)(a1 + 180), *(unsigned int *)(a1 + 184), 0);
  bzero(*(void **)(a1 + 88), 4 * *(_QWORD *)(a1 + 72) * *(_QWORD *)(a1 + 80));
  bzero(*(void **)(a1 + 120), 4 * *(_QWORD *)(a1 + 104) * *(_QWORD *)(a1 + 112));
  v19 = *(_QWORD *)(a1 + 72);
  if (v19)
  {
    v20 = 0;
    v21 = 0;
    v22 = *(_QWORD *)(a1 + 80);
    v23 = v22;
    do
    {
      if (v23)
      {
        v24 = 0;
        v25 = 1;
        do
        {
          v26 = v25 - 1;
          if (v23 - 1 == v24)
          {
            v27 = *(_QWORD *)(a1 + 88);
            v28 = v23 * (int)v21 + v26;
            if (*(_QWORD *)(a1 + 72) - 1 == v20)
              *(_DWORD *)(v27 + 4 * v28) = 1065353216;
            else
              *(_DWORD *)(v27 + 4 * v28) = 0;
          }
          else
          {
            v29 = rand();
            v30 = exp(((double)v29 / 2147483650.0 + 0.0) * ((double)v29 / 2147483650.0 + 0.0) * -0.5);
            v31 = v30 * a9;
            if (v31 > 1.0 || v31 < -1.0)
              v31 = 0.1;
            *(float *)(*(_QWORD *)(a1 + 88) + 4 * (*(_QWORD *)(a1 + 80) * (int)v21 + v26)) = v31;
            v22 = *(_QWORD *)(a1 + 80);
          }
          v24 = v25;
          v33 = v22 > v25++;
          v23 = v22;
        }
        while (v33);
        v19 = *(_QWORD *)(a1 + 72);
        v23 = v22;
      }
      v20 = ++v21;
    }
    while (v19 > v21);
  }
  return a1;
}

void sub_20CD97B74(_Unwind_Exception *a1)
{
  uint64_t v1;

  Layer<float,float,float>::~Layer(v1);
  _Unwind_Resume(a1);
}

uint64_t Layer<float,float,float>::~Layer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = off_24C58AFD8;
  *(_QWORD *)(a1 + 128) = &off_24C58B080;
  v2 = *(_QWORD *)(a1 + 152);
  if (v2)
    MEMORY[0x212B956EC](v2, 0x1000C8052888210);
  *(_QWORD *)(a1 + 96) = &off_24C58B080;
  v3 = *(_QWORD *)(a1 + 120);
  if (v3)
    MEMORY[0x212B956EC](v3, 0x1000C8052888210);
  *(_QWORD *)(a1 + 64) = &off_24C58B080;
  v4 = *(_QWORD *)(a1 + 88);
  if (v4)
    MEMORY[0x212B956EC](v4, 0x1000C8052888210);
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  return a1;
}

_DWORD *ConvolutionLayer<float,float,float>::replicateOrgXToX(_DWORD *result, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  int i;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  int j;

  v4 = a3[1];
  v3 = a3[2];
  v5 = v3 - 1;
  if ((_DWORD)v3 != 1)
  {
    v6 = 0;
    v7 = a3[3];
    do
      *(_DWORD *)(v7 + 4 * (((int)v4 - 1) * v3 + v6++)) = 0;
    while (v5 != v6);
  }
  if ((_DWORD)v4)
  {
    v8 = 0;
    v9 = a3[3];
    do
      *(_DWORD *)(v9 + 4 * (v5 + v3 * v8++)) = 1065353216;
    while ((_DWORD)v4 != v8);
  }
  v10 = result[50];
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = result[53];
    v14 = result[55];
    do
    {
      if (v14)
      {
        v15 = 0;
        v16 = result[54] != 0;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (v13)
            {
              v18 = 0;
              v19 = result[49];
              v21 = *(_QWORD *)(a2 + 16);
              v20 = *(_QWORD *)(a2 + 24);
              v22 = a3[3];
              v23 = (i << v16) + (v15 << v16) * v19;
              v24 = v11;
              do
              {
                for (j = 0; j != v13; ++j)
                  *(_DWORD *)(v22 + 4 * (v3 * (i + v15 * v14) + v24 + j)) = *(_DWORD *)(v20 + 4
                                                                                            * (v12 + v21 * (v23 + j)));
                ++v18;
                v23 += v19;
                v24 += v13;
              }
              while (v18 != v13);
            }
          }
          ++v15;
        }
        while (v15 != v14);
      }
      ++v12;
      v11 += v13 * v13;
    }
    while (v12 != v10);
  }
  return result;
}

void ConvolutionLayer<float,float,float>::unfoldDXtoOrgDX(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  bzero(*(void **)(a3 + 24), 4 * *(_QWORD *)(a3 + 8) * *(_QWORD *)(a3 + 16));
  v6 = a1[50];
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = a1[53];
    v10 = v9 * v9;
    v11 = a1[55];
    v12 = v11 * v11;
    do
    {
      if (v12)
      {
        v13 = 0;
        v14 = a1[54];
        do
        {
          v15 = v13 / v11;
          v16 = v13 % v11;
          if (v14)
          {
            v15 *= 2;
            v16 *= 2;
          }
          if (v10)
          {
            v17 = 0;
            v18 = a1[49];
            v19 = *(_QWORD *)(a2 + 24);
            v20 = *(_QWORD *)(a2 + 16) * (int)v13;
            v22 = *(_QWORD *)(a3 + 16);
            v21 = *(_QWORD *)(a3 + 24);
            do
            {
              v23 = v8 + v22 * (int)(v17 % v9 + v16 + (v17 / v9 + v15) * v18);
              *(float *)(v21 + 4 * v23) = *(float *)(v19 + 4 * (v20 + (int)(v7 + v17++))) + *(float *)(v21 + 4 * v23);
            }
            while (v10 != v17);
          }
          ++v13;
        }
        while (v13 != v12);
      }
      ++v8;
      v7 += v10;
    }
    while (v8 != v6);
  }
}

float ConvolutionLayer<float,float,float>::intializeInputPattern(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  float result;

  v4 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(v3 + 4 * (*(_DWORD *)(a2 + 8) - 1) * v4) = 1065353216;
  v5 = *a3;
  v6 = a3[1];
  v7 = v6 - *a3;
  if (v6 != *a3)
  {
    v8 = 0;
    v9 = v7 >> 2;
    do
    {
      result = *(float *)(v5 + 4 * v8);
      *(float *)(v3 + 4 * v4 * (int)v8++) = result;
    }
    while (v9 > v8);
  }
  return result;
}

void ConvolutionLayer<float,float,float>::overrideBiasWithOne(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int i;
  uint64_t v13;
  int v14;
  int j;

  v4 = a2[1];
  v3 = a2[2];
  if (a3)
  {
    v5 = v3 - 1;
    if ((_DWORD)v3 != 1)
    {
      v6 = 0;
      v7 = a2[3];
      do
        *(_DWORD *)(v7 + 4 * (((int)v4 - 1) * v3 + v6++)) = 0;
      while (v5 != v6);
    }
    if ((_DWORD)v4)
    {
      v8 = 0;
      v9 = a2[3];
      do
        *(_DWORD *)(v9 + 4 * (v5 + v3 * v8++)) = 1065353216;
      while ((_DWORD)v4 != v8);
    }
  }
  else
  {
    v10 = a2[3];
    v11 = v4 - 1;
    if (v11)
    {
      for (i = 0; i != v11; ++i)
        *(_DWORD *)(v10 + 4 * ((int)v3 - 1 + v3 * i)) = 0;
    }
    v13 = v3 * v11;
    v14 = v3 - 1;
    if (v14)
    {
      for (j = 0; j != v14; ++j)
        *(_DWORD *)(v10 + 4 * (v13 + j)) = 0;
    }
    *(_DWORD *)(v10 + 4 * (v13 + v14)) = 1065353216;
  }
}

uint64_t ConvolutionLayer<float,float,float>::flattenOutput(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_BYTE *)(result + 240))
  {
    v3 = *(_DWORD *)(a2 + 8) - 1;
    if (*(_DWORD *)(a2 + 8) != 1)
    {
      v4 = 0;
      v5 = 0;
      v6 = *(_QWORD *)(a2 + 16);
      v7 = v6 - 1;
      do
      {
        if ((_DWORD)v6 != 1)
        {
          v8 = 0;
          v9 = *(_QWORD *)(a2 + 24);
          v10 = *(_QWORD *)(a3 + 24);
          do
          {
            *(_DWORD *)(v10 + 4 * (v4 + v8)) = *(_DWORD *)(v9 + 4 * (v6 * v5 + v8));
            ++v8;
          }
          while (v7 != v8);
        }
        ++v5;
        v4 += v7;
      }
      while (v5 != v3);
    }
    *(_DWORD *)(*(_QWORD *)(a3 + 24) + (((*(_QWORD *)(a3 + 16) << 32) - 0x100000000) >> 30)) = 1065353216;
  }
  return result;
}

uint64_t Layer<float,float,float>::feedForward(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  float v17;
  float v18;
  _QWORD v21[3];
  uint64_t v22;

  v4 = a3;
  v5 = *(_QWORD *)(a2[25] + 8 * a3);
  v6 = a2[34];
  v7 = (_QWORD *)(v6 + 32 * a3);
  matrix<float>::operator*(v21, *(_QWORD *)(a2[19] + 8 * a3), a1 + 64);
  matrix<float>::operator=(v7, (uint64_t)v21);
  if (v22)
    MEMORY[0x212B956EC](v22, 0x1000C8052888210);
  v8 = (_QWORD *)(v6 + 32 * v4);
  v9 = v8[1];
  if (v9)
  {
    LODWORD(v10) = 0;
    v11 = v8[2];
    v12 = v8 + 3;
    do
    {
      if (v11)
      {
        v13 = *v12;
        v14 = *(_QWORD *)(v5 + 24);
        v15 = *(_QWORD *)(v5 + 16) * (int)v10;
        v16 = 1;
        do
        {
          v17 = *(float *)(v13 + 4 * (v11 * (int)v10 + (int)(v16 - 1))) * -1.4427;
          if (v17 >= -126.0)
            v18 = (float)(v17 + 126.94) * 8388600.0;
          else
            v18 = 7907900.0;
          *(float *)(v14 + 4 * (v15 + (int)(v16 - 1))) = 1.0 / (float)(COERCE_FLOAT(v18) + 1.0);
        }
        while (v11 > v16++);
      }
      v10 = (v10 + 1);
    }
    while (v9 > v10);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 32))(a1, v5, 1);
}

void sub_20CD98184(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    MEMORY[0x212B956EC](a12, 0x1000C8052888210);
  _Unwind_Resume(exception_object);
}

uint64_t Layer<float,float,float>::backprop(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD v7[3];
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 176) + 8 * a3);
  v5 = *(_QWORD **)(*(_QWORD *)(a2 + 224) + 8 * a3);
  matrix<float>::transposed(v7, a1 + 8);
  matrix<float>::operator*(v9, v4, (uint64_t)v7);
  matrix<float>::operator=(v5, (uint64_t)v9);
  if (v10)
    MEMORY[0x212B956EC](v10, 0x1000C8052888210);
  if (v8)
    MEMORY[0x212B956EC](v8, 0x1000C8052888210);
  return (*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(*a1 + 32))(a1, v5, 0);
}

void sub_20CD9825C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a16)
    MEMORY[0x212B956EC](a16, 0x1000C8052888210);
  if (a12)
    MEMORY[0x212B956EC](a12, 0x1000C8052888210);
  _Unwind_Resume(exception_object);
}

unint64_t Layer<float,float,float>::computeDeltaY(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  float v13;
  unint64_t result;

  v5 = a4[1];
  v4 = a4[2];
  if (v5)
  {
    LODWORD(v6) = 0;
    do
    {
      if (v4)
      {
        v7 = *(_QWORD *)(a3 + 24);
        v8 = *(_QWORD *)(a3 + 16) * (int)v6;
        v9 = *(_QWORD *)(a2 + 24);
        v10 = *(_QWORD *)(a2 + 16) * (int)v6;
        v11 = a4[3];
        v12 = 1;
        do
        {
          v13 = *(float *)(v7 + 4 * (v8 + (int)(v12 - 1)));
          result = v4 * (int)v6 + (int)(v12 - 1);
          *(float *)(v11 + 4 * result) = *(float *)(v9 + 4 * (v10 + (int)(v12 - 1))) * (float)(v13 * (float)(1.0 - v13));
        }
        while (v4 > v12++);
      }
      v6 = (v6 + 1);
    }
    while (v5 > v6);
  }
  *(_DWORD *)(a4[3] + 4 * (((int)v5 - 1) * v4 + (int)v4 - 1)) = 0;
  return result;
}

uint64_t Layer<float,float,float>::computeDeltaW(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t result;
  _QWORD v6[3];
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;

  matrix<float>::transposed(v8, a2);
  matrix<float>::operator*(v6, (uint64_t)v8, a3);
  matrix<float>::operator=((_QWORD *)(a1 + 96), (uint64_t)v6);
  if (v7)
    MEMORY[0x212B956EC](v7, 0x1000C8052888210);
  result = v9;
  if (v9)
    JUMPOUT(0x212B956ECLL);
  return result;
}

void sub_20CD983D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a12)
    MEMORY[0x212B956EC](a12, 0x1000C8052888210);
  if (a16)
    MEMORY[0x212B956EC](a16, 0x1000C8052888210);
  _Unwind_Resume(exception_object);
}

_QWORD *Layer<float,float,float>::updateUnrolledW(uint64_t a1, _QWORD *a2, uint64_t a3, float a4)
{
  float *v7;
  _QWORD *result;
  _QWORD v9[3];
  uint64_t v10;
  _QWORD v11[3];
  float *v12;

  matrix<float>::transposed(v9, a2);
  matrix<float>::operator*(v11, (uint64_t)v9, a3);
  matrix<float>::operator=((_QWORD *)(a1 + 96), (uint64_t)v11);
  if (v12)
    MEMORY[0x212B956EC](v12, 0x1000C8052888210);
  if (v10)
    MEMORY[0x212B956EC](v10, 0x1000C8052888210);
  *(float *)v9 = a4;
  matrix<float>::operator*(v11, (_QWORD *)(a1 + 96), (float *)v9);
  v7 = v12;
  result = matrix<float>::operator+=((_QWORD *)(a1 + 64), v12);
  if (v7)
    result = (_QWORD *)MEMORY[0x212B956EC](v7, 0x1000C8052888210);
  *(_DWORD *)(*(_QWORD *)(a1 + 88)
            + 4 * ((*(_DWORD *)(a1 + 72) - 1) * *(_QWORD *)(a1 + 80) + (int)(*(_QWORD *)(a1 + 80) - 1))) = 1065353216;
  return result;
}

void sub_20CD98514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a16)
    MEMORY[0x212B956EC](a16, 0x1000C8052888210);
  if (a12)
    MEMORY[0x212B956EC](a12, 0x1000C8052888210);
  _Unwind_Resume(exception_object);
}

_QWORD *Layer<float,float,float>::updateWfromAggregateOrSignal(uint64_t a1, _QWORD *a2, unsigned int a3, uint64_t a4, unsigned int a5, float a6)
{
  float *v7;
  _QWORD *result;
  _QWORD v12[3];
  _QWORD *v13;
  _QWORD v14[3];
  uint64_t v15;
  _QWORD v16[3];
  uint64_t v17;
  _QWORD v18[3];
  float *v19;
  float v20;

  if (a3 < 2)
  {
    matrix<float>::transposed(v12, *(_QWORD **)(*(_QWORD *)(a4 + 152) + 8 * a5));
    matrix<float>::operator*(v14, (uint64_t)v12, *(_QWORD *)(*(_QWORD *)(a4 + 176) + 8 * a5));
    v20 = a6;
    matrix<float>::operator*(v16, v14, &v20);
    matrix<float>::operator+(v18, (_QWORD *)(a1 + 64), (uint64_t)v16);
    matrix<float>::operator=((_QWORD *)(a1 + 64), (uint64_t)v18);
    if (v19)
      MEMORY[0x212B956EC](v19, 0x1000C8052888210);
    if (v17)
      MEMORY[0x212B956EC](v17, 0x1000C8052888210);
    if (v15)
      MEMORY[0x212B956EC](v15, 0x1000C8052888210);
    result = v13;
    if (v13)
      goto LABEL_11;
  }
  else
  {
    LODWORD(v16[0]) = 1065353216;
    matrix<float>::operator*(v18, a2, (float *)v16);
    v7 = v19;
    result = matrix<float>::operator+=((_QWORD *)(a1 + 64), v19);
    if (v7)
    {
      result = v7;
LABEL_11:
      result = (_QWORD *)MEMORY[0x212B956EC](result, 0x1000C8052888210);
    }
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 88)
            + 4 * ((*(_DWORD *)(a1 + 72) - 1) * *(_QWORD *)(a1 + 80) + (int)(*(_QWORD *)(a1 + 80) - 1))) = 1065353216;
  return result;
}

void sub_20CD986C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v23;

  v23 = *(_QWORD *)(v21 - 64);
  if (v23)
    MEMORY[0x212B956EC](v23, 0x1000C8052888210);
  if (a21)
    MEMORY[0x212B956EC](a21, 0x1000C8052888210);
  if (a17)
    MEMORY[0x212B956EC](a17, 0x1000C8052888210);
  if (a13)
    MEMORY[0x212B956EC](a13, 0x1000C8052888210);
  _Unwind_Resume(exception_object);
}

uint64_t Layer<float,float,float>::aggregateThreadDW(uint64_t result, uint64_t a2, unsigned int a3, unsigned int a4, _QWORD *a5, float a6)
{
  uint64_t v6;
  _QWORD v11[3];
  uint64_t v12;
  _QWORD v13[3];
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;
  float v19;

  v6 = result;
  if (a4 >= 2)
  {
    matrix<float>::transposed(v11, *(_QWORD **)(*(_QWORD *)(a2 + 152) + 8 * a3));
    matrix<float>::operator*(v13, (uint64_t)v11, *(_QWORD *)(*(_QWORD *)(a2 + 176) + 8 * a3));
    v19 = a6;
    matrix<float>::operator*(v15, v13, &v19);
    matrix<float>::operator+(v17, a5, (uint64_t)v15);
    matrix<float>::operator=(a5, (uint64_t)v17);
    if (v18)
      MEMORY[0x212B956EC](v18, 0x1000C8052888210);
    if (v16)
      MEMORY[0x212B956EC](v16, 0x1000C8052888210);
    if (v14)
      MEMORY[0x212B956EC](v14, 0x1000C8052888210);
    result = v12;
    if (v12)
      result = MEMORY[0x212B956EC](v12, 0x1000C8052888210);
  }
  *(_DWORD *)(*(_QWORD *)(v6 + 88)
            + 4 * ((*(_DWORD *)(v6 + 72) - 1) * *(_QWORD *)(v6 + 80) + (int)(*(_QWORD *)(v6 + 80) - 1))) = 1065353216;
  return result;
}

void sub_20CD9888C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v23;

  v23 = *(_QWORD *)(v21 - 64);
  if (v23)
    MEMORY[0x212B956EC](v23, 0x1000C8052888210);
  if (a21)
    MEMORY[0x212B956EC](a21, 0x1000C8052888210);
  if (a17)
    MEMORY[0x212B956EC](a17, 0x1000C8052888210);
  if (a13)
    MEMORY[0x212B956EC](a13, 0x1000C8052888210);
  _Unwind_Resume(exception_object);
}

uint64_t Layer<float,float,float>::compute_dW(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  _QWORD v7[3];
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;

  matrix<float>::transposed(v7, a2);
  matrix<float>::operator*(v9, (uint64_t)v7, a3);
  matrix<float>::operator=(a4, (uint64_t)v9);
  if (v10)
    MEMORY[0x212B956EC](v10, 0x1000C8052888210);
  result = v8;
  if (v8)
    JUMPOUT(0x212B956ECLL);
  return result;
}

void sub_20CD989B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a16)
    MEMORY[0x212B956EC](a16, 0x1000C8052888210);
  if (a12)
    MEMORY[0x212B956EC](a12, 0x1000C8052888210);
  _Unwind_Resume(exception_object);
}

_QWORD *Layer<float,float,float>::adjustWeights(uint64_t a1, float a2)
{
  float *v3;
  _QWORD *result;
  _QWORD v5[3];
  float *v6;
  float v7;

  v7 = a2;
  matrix<float>::operator*(v5, (_QWORD *)(a1 + 96), &v7);
  v3 = v6;
  result = matrix<float>::operator+=((_QWORD *)(a1 + 64), v6);
  if (v3)
    result = (_QWORD *)MEMORY[0x212B956EC](v3, 0x1000C8052888210);
  *(_DWORD *)(*(_QWORD *)(a1 + 88)
            + 4 * ((*(_DWORD *)(a1 + 72) - 1) * *(_QWORD *)(a1 + 80) + (int)(*(_QWORD *)(a1 + 80) - 1))) = 1065353216;
  return result;
}

uint64_t ConvolutionLayer<float,float,float>::getOutputFieldsForHidden(uint64_t a1)
{
  return ((*(_DWORD *)(a1 + 192) - 1) * (*(_DWORD *)(a1 + 188) - 1) + 1);
}

float Layer<float,float,float>::intializeInputPattern(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  float result;

  v3 = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(v3 + 4 * (int)(*(_QWORD *)(a2 + 16) - 1) * *(_QWORD *)(a2 + 16)) = 1065353216;
  v4 = *a3;
  v5 = a3[1];
  v6 = v5 - *a3;
  if (v5 != *a3)
  {
    v7 = 0;
    v8 = v6 >> 2;
    do
    {
      result = *(float *)(v4 + 4 * v7);
      *(float *)(v3 + 4 * (int)v7++) = result;
    }
    while (v8 > v7);
  }
  return result;
}

void Layer<float,float,float>::overrideBiasWithOne(uint64_t a1, uint64_t a2, int a3)
{
  float v3;

  v3 = 0.0;
  if (a3)
    v3 = 1.0;
  *(float *)(*(_QWORD *)(a2 + 24) + (((*(_QWORD *)(a2 + 16) << 32) - 0x100000000) >> 30)) = v3;
}

uint64_t Layer<float,float,float>::getOutputFieldsForHidden(uint64_t a1)
{
  return *(unsigned int *)(a1 + 52);
}

void matrix<float>::operator*(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  float *v8;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a3 + 16);
  *a1 = &off_24C58B080;
  a1[1] = v6;
  a1[2] = v7;
  v8 = (float *)operator new[]();
  a1[3] = v8;
  vDSP_mmul(*(const float **)(a2 + 24), 1, *(const float **)(a3 + 24), 1, v8, 1, *(_QWORD *)(a2 + 8), *(_QWORD *)(a3 + 16), *(_QWORD *)(a2 + 16));
}

void sub_20CD98BC8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  *v1 = v3;
  MEMORY[0x212B956EC](v2, 0x1000C8052888210);
  _Unwind_Resume(a1);
}

_QWORD *matrix<float>::operator=(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = a1[3];
  if (v4)
    MEMORY[0x212B956EC](v4, 0x1000C8052888210);
  v5 = *(_QWORD *)(a2 + 16);
  a1[1] = *(_QWORD *)(a2 + 8);
  a1[2] = v5;
  v6 = (void *)operator new[]();
  a1[3] = v6;
  memcpy(v6, *(const void **)(a2 + 24), 4 * a1[1] * a1[2]);
  return a1;
}

uint64_t matrix<float>::transposed(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _DWORD *v13;
  uint64_t v14;

  v4 = a2[1];
  v5 = a2[2];
  *a1 = &off_24C58B080;
  a1[1] = v4;
  a1[2] = v5;
  result = operator new[]();
  a1[3] = result;
  v7 = a2[1];
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = a2[2];
    v11 = 4 * v10;
    do
    {
      if (v10)
      {
        v12 = (_DWORD *)(a2[3] + v8);
        v13 = (_DWORD *)result;
        v14 = v10;
        do
        {
          *v13++ = *v12;
          v12 = (_DWORD *)((char *)v12 + v11);
          --v14;
        }
        while (v14);
      }
      ++v9;
      result += v11;
      v8 += 4;
    }
    while (v9 != v7);
  }
  return result;
}

_QWORD *matrix<float>::operator+=(_QWORD *result, float *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float *v7;
  float *v8;
  uint64_t v9;
  float v10;

  v2 = result[1];
  if (v2)
  {
    v3 = 0;
    v4 = 0;
    v5 = result[2];
    v6 = 4 * v5;
    do
    {
      if (v5)
      {
        v7 = (float *)(result[3] + v3);
        v8 = a2;
        v9 = v5;
        do
        {
          v10 = *v8++;
          *v7 = v10 + *v7;
          ++v7;
          --v9;
        }
        while (v9);
      }
      ++v4;
      v3 += v6;
      a2 = (float *)((char *)a2 + v6);
    }
    while (v4 != v2);
  }
  return result;
}

uint64_t matrix<float>::operator*(_QWORD *a1, _QWORD *a2, float *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  float *v15;
  float *v16;
  uint64_t v17;
  float v18;

  v6 = a2[1];
  v7 = a2[2];
  *a1 = &off_24C58B080;
  a1[1] = v6;
  a1[2] = v7;
  result = operator new[]();
  a1[3] = result;
  v9 = a2[1];
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = a2[2];
    v13 = *a3;
    v14 = 4 * v12;
    do
    {
      if (v12)
      {
        v15 = (float *)(a2[3] + v10);
        v16 = (float *)result;
        v17 = v12;
        do
        {
          v18 = *v15++;
          *v16++ = v13 * v18;
          --v17;
        }
        while (v17);
      }
      ++v11;
      result += v14;
      v10 += v14;
    }
    while (v11 != v9);
  }
  return result;
}

uint64_t matrix<float>::operator+(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float *v13;
  uint64_t v14;
  uint64_t v15;
  float *v16;
  float *v17;
  float *v18;
  uint64_t v19;
  float v20;
  float v21;
  float v22;

  v6 = a2[1];
  v7 = a2[2];
  *a1 = &off_24C58B080;
  a1[1] = v6;
  a1[2] = v7;
  result = operator new[]();
  a1[3] = result;
  v9 = a2[1];
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = a2[2];
    v13 = *(float **)(a3 + 24);
    v14 = 4 * *(_QWORD *)(a3 + 16);
    v15 = 4 * v12;
    do
    {
      if (v12)
      {
        v16 = (float *)(a2[3] + v10);
        v17 = (float *)result;
        v18 = v13;
        v19 = v12;
        do
        {
          v20 = *v16++;
          v21 = v20;
          v22 = *v18++;
          *v17++ = v21 + v22;
          --v19;
        }
        while (v19);
      }
      ++v11;
      v13 = (float *)((char *)v13 + v14);
      result += v15;
      v10 += v15;
    }
    while (v11 != v9);
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Layer<float,float,float> *>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

_QWORD *PoolingLayer<float,float,float>::replicateOrgXToX(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  result = matrix<float>::operator=(a3, a2);
  v4 = result[1];
  v5 = result[2];
  v6 = v5 - 1;
  if ((_DWORD)v5 != 1)
  {
    v7 = 0;
    v8 = result[3];
    do
      *(_DWORD *)(v8 + 4 * (((int)v4 - 1) * v5 + v7++)) = 0;
    while (v6 != v7);
  }
  if ((_DWORD)v4)
  {
    v9 = 0;
    v10 = result[3];
    do
      *(_DWORD *)(v10 + 4 * (v6 + v5 * v9++)) = 1065353216;
    while ((_DWORD)v4 != v9);
  }
  return result;
}

_QWORD *PoolingLayer<float,float,float>::unfoldDXtoOrgDX(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return matrix<float>::operator=(a3, a2);
}

float PoolingLayer<float,float,float>::intializeInputPattern(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  float result;

  v4 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(v3 + 4 * (*(_DWORD *)(a2 + 8) - 1) * v4) = 1065353216;
  v5 = *a3;
  v6 = a3[1];
  v7 = v6 - *a3;
  if (v6 != *a3)
  {
    v8 = 0;
    v9 = v7 >> 2;
    do
    {
      result = *(float *)(v5 + 4 * v8);
      *(float *)(v3 + 4 * v4 * (int)v8++) = result;
    }
    while (v9 > v8);
  }
  return result;
}

void PoolingLayer<float,float,float>::overrideBiasWithOne(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int i;
  uint64_t v13;
  int v14;
  int j;

  v4 = a2[1];
  v3 = a2[2];
  if (a3)
  {
    v5 = v3 - 1;
    if ((_DWORD)v3 != 1)
    {
      v6 = 0;
      v7 = a2[3];
      do
        *(_DWORD *)(v7 + 4 * (((int)v4 - 1) * v3 + v6++)) = 0;
      while (v5 != v6);
    }
    if ((_DWORD)v4)
    {
      v8 = 0;
      v9 = a2[3];
      do
        *(_DWORD *)(v9 + 4 * (v5 + v3 * v8++)) = 1065353216;
      while ((_DWORD)v4 != v8);
    }
  }
  else
  {
    v10 = a2[3];
    v11 = v4 - 1;
    if (v11)
    {
      for (i = 0; i != v11; ++i)
        *(_DWORD *)(v10 + 4 * ((int)v3 - 1 + v3 * i)) = 0;
    }
    v13 = v3 * v11;
    v14 = v3 - 1;
    if (v14)
    {
      for (j = 0; j != v14; ++j)
        *(_DWORD *)(v10 + 4 * (v13 + j)) = 0;
    }
    *(_DWORD *)(v10 + 4 * (v13 + v14)) = 1065353216;
  }
}

uint64_t PoolingLayer<float,float,float>::flattenOutput(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_BYTE *)(result + 208))
  {
    v3 = *(_DWORD *)(a2 + 8) - 1;
    if (*(_DWORD *)(a2 + 8) != 1)
    {
      v4 = 0;
      v5 = 0;
      v6 = *(_QWORD *)(a2 + 16);
      v7 = v6 - 1;
      do
      {
        if ((_DWORD)v6 != 1)
        {
          v8 = 0;
          v9 = *(_QWORD *)(a2 + 24);
          v10 = *(_QWORD *)(a3 + 24);
          do
          {
            *(_DWORD *)(v10 + 4 * (v4 + v8)) = *(_DWORD *)(v9 + 4 * (v6 * v5 + v8));
            ++v8;
          }
          while (v7 != v8);
        }
        ++v5;
        v4 += v7;
      }
      while (v5 != v3);
    }
    *(_DWORD *)(*(_QWORD *)(a3 + 24) + (((*(_QWORD *)(a3 + 16) << 32) - 0x100000000) >> 30)) = 1065353216;
  }
  return result;
}

uint64_t PoolingLayer<float,float,float>::feedForward(_DWORD *a1, _QWORD *a2, int a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  int v29;
  float v30;
  unsigned int v31;
  int v32;
  float v33;

  v4 = *(_QWORD *)(a2[25] + 8 * a3);
  v5 = a1[48];
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)(a2[19] + 8 * a3);
    v8 = a2[31] + 32 * a3;
    v9 = (_QWORD *)(v8 + 24);
    v10 = (_QWORD *)(v8 + 16);
    v11 = *(_DWORD *)(v7 + 8) - 1;
    v14 = v7 + 16;
    v13 = *(_QWORD *)(v7 + 16);
    v12 = *(_QWORD *)(v14 + 8);
    v15 = v13 * v11;
    v17 = *(_QWORD *)(v4 + 16);
    v16 = *(_QWORD *)(v4 + 24);
    v18 = v17 * (*(_DWORD *)(v4 + 8) - 1);
    v19 = a1[51];
    v20 = v19;
    do
    {
      if (v20)
      {
        v21 = 0;
        v22 = a1[50];
        v23 = v22;
        do
        {
          if (v19)
          {
            v24 = 0;
            v25 = v21 * v20;
            v26 = v23 * a1[47] * v21;
            do
            {
              LODWORD(v27) = v24 + v25;
              if (v23)
              {
                v28 = 0;
                v27 = (int)v27;
                v29 = v26 + v22 * v24;
                v30 = -1000000.0;
                do
                {
                  if (v22)
                  {
                    v31 = 0;
                    v32 = v29 + a1[47] * v28;
                    do
                    {
                      v33 = *(float *)(v12 + 4 * ((int)v6 + v13 * (int)(v32 + v31)));
                      if (v33 > v30)
                      {
                        *(_DWORD *)(*v9 + 4 * ((int)v6 + *v10 * (int)v27)) = v32 + v31;
                        v22 = a1[50];
                        v30 = v33;
                      }
                      ++v31;
                    }
                    while (v31 < v22);
                  }
                  ++v28;
                }
                while (v28 < v22);
                v19 = a1[51];
                v23 = v22;
              }
              else
              {
                v27 = (int)v27;
                v30 = -1000000.0;
              }
              *(float *)(v16 + 4 * ((int)v6 + v27 * v17)) = v30;
              ++v24;
            }
            while (v24 < v19);
          }
          ++v21;
          v20 = v19;
        }
        while (v21 < v19);
        v5 = a1[48];
        v20 = v19;
      }
      *(_DWORD *)(v16 + 4 * (v18 + (int)v6)) = *(_DWORD *)(v12 + 4 * (v15 + (int)v6));
      ++v6;
    }
    while (v6 < v5);
  }
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)a1 + 32))(a1, v4, 1);
}

float PoolingLayer<float,float,float>::backprop(_DWORD *a1, _QWORD *a2, int a3, float result)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
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
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  int i;

  v4 = a1[48];
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)(a2[28] + 8 * a3);
    v7 = *(_QWORD *)(a2[22] + 8 * a3);
    v8 = a1[51];
    v9 = a2[31] + 32 * a3;
    v10 = (_QWORD *)(v9 + 24);
    v11 = (_QWORD *)(v9 + 16);
    v12 = *(_DWORD *)(v7 + 8) - 1;
    v15 = v7 + 16;
    v14 = *(_QWORD *)(v7 + 16);
    v13 = *(_QWORD *)(v15 + 8);
    v16 = v12 * v14;
    v17 = *(_DWORD *)(v6 + 8) - 1;
    v20 = v6 + 16;
    v19 = *(_QWORD *)(v6 + 16);
    v18 = *(_QWORD *)(v20 + 8);
    v21 = v19 * v17;
    do
    {
      if (v8)
      {
        v22 = 0;
        v23 = 0;
        v24 = a1[50];
        v25 = a1[47];
        v26 = v5;
        do
        {
          v27 = 0;
          v28 = v22;
          do
          {
            if (v24)
            {
              v29 = 0;
              v30 = v27 + v23 * v8;
              v31 = *(_DWORD *)(v13 + 4 * (v5 + v14 * v30));
              v32 = *(int *)(*v10 + 4 * (v5 + *v11 * v30));
              v33 = v5 + v19 * v32;
              v34 = -(int)v32;
              v35 = v28;
              do
              {
                for (i = 0; i != v24; ++i)
                {
                  if (v34 + v35 + i)
                    *(_DWORD *)(v18 + 4 * (v5 + v19 * (v35 + i))) = 0;
                  else
                    *(_DWORD *)(v18 + 4 * v33) = v31;
                }
                ++v29;
                v35 += v25;
              }
              while (v29 != v24);
            }
            ++v27;
            v28 += v24;
          }
          while (v27 != v8);
          ++v23;
          v22 += v24 * v25;
        }
        while (v23 != v8);
      }
      else
      {
        v26 = v5;
      }
      result = *(float *)(v13 + 4 * (v26 + v16));
      *(float *)(v18 + 4 * (v26 + v21)) = result;
      ++v5;
    }
    while (v5 != v4);
  }
  return result;
}

uint64_t PoolingLayer<float,float,float>::getOutputFieldsForHidden(uint64_t a1)
{
  return ((*(_DWORD *)(a1 + 184) - 1) * (*(_DWORD *)(a1 + 180) - 1) + 1);
}

uint64_t Layer<float,float,float>::Layer(uint64_t a1, __int128 *a2, unsigned int a3, unsigned int a4, float a5)
{
  __int128 v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  long double v19;

  *(_QWORD *)a1 = off_24C58AFD8;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 24), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v9 = *a2;
    *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(a1 + 24) = v9;
  }
  *(_QWORD *)(a1 + 64) = &off_24C58B080;
  *(_DWORD *)(a1 + 48) = a3;
  *(_DWORD *)(a1 + 52) = a4;
  *(_DWORD *)(a1 + 56) = 1;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 96) = &off_24C58B080;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = &off_24C58B080;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_BYTE *)(a1 + 160) = 0;
  matrix<float>::resize((_QWORD *)(a1 + 64), a3, a4, 0);
  matrix<float>::resize((_QWORD *)(a1 + 96), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), 0);
  bzero(*(void **)(a1 + 88), 4 * *(_QWORD *)(a1 + 72) * *(_QWORD *)(a1 + 80));
  bzero(*(void **)(a1 + 120), 4 * *(_QWORD *)(a1 + 104) * *(_QWORD *)(a1 + 112));
  v10 = *(_DWORD *)(a1 + 48);
  if (v10)
  {
    v11 = 0;
    v12 = *(_DWORD *)(a1 + 52);
    v13 = v12;
    do
    {
      if (v13)
      {
        v14 = 0;
        v15 = *(_QWORD *)(a1 + 80);
        do
        {
          if (v14 == v15 - 1)
          {
            v16 = *(_QWORD *)(a1 + 88);
            v17 = v15 * (int)v11 + (int)v14;
            if (*(_QWORD *)(a1 + 72) - 1 == v11)
              *(_DWORD *)(v16 + 4 * v17) = 1065353216;
            else
              *(_DWORD *)(v16 + 4 * v17) = 0;
          }
          else
          {
            v18 = rand();
            v19 = exp(((double)v18 / 2147483650.0 + 0.0) * ((double)v18 / 2147483650.0 + 0.0) * -0.5);
            v15 = *(_QWORD *)(a1 + 80);
            *(float *)&v19 = v19;
            *(float *)(*(_QWORD *)(a1 + 88) + 4 * (v15 * (int)v11 + (int)v14)) = *(float *)&v19 * a5;
            v12 = *(_DWORD *)(a1 + 52);
          }
          ++v14;
        }
        while (v14 < v12);
        v10 = *(_DWORD *)(a1 + 48);
        v13 = v12;
      }
      ++v11;
    }
    while (v11 < v10);
  }
  return a1;
}

void sub_20CD99688(_Unwind_Exception *exception_object)
{
  void **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + 128) = v3;
  v5 = *(_QWORD *)(v2 + 152);
  if (v5)
    MEMORY[0x212B956EC](v5, 0x1000C8052888210);
  *(_QWORD *)(v2 + 96) = v3;
  v6 = *(_QWORD *)(v2 + 120);
  if (v6)
    MEMORY[0x212B956EC](v6, 0x1000C8052888210);
  *(_QWORD *)(v2 + 64) = v3;
  v7 = *(_QWORD *)(v2 + 88);
  if (v7)
    MEMORY[0x212B956EC](v7, 0x1000C8052888210);
  if (*(char *)(v2 + 47) < 0)
    operator delete(*v1);
  _Unwind_Resume(exception_object);
}

void std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(_QWORD *a1)
{
  uint64_t v2;

  if (a1)
  {
    std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(a1[1]);
    v2 = a1[7];
    if (v2)
      MEMORY[0x212B956EC](v2 - 16, 0x1000C8000313F17);
    operator delete(a1);
  }
}

void std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(_QWORD *a1)
{
  void *v2;

  if (a1)
  {
    std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(a1[1]);
    v2 = (void *)a1[5];
    if (v2)
    {
      a1[6] = v2;
      operator delete(v2);
    }
    operator delete(a1);
  }
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_20CD99838(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t **std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int a2, _DWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  unsigned int v8;
  char *v9;
  _OWORD *v10;
  uint64_t *v11;
  uint64_t *v12;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = *((_DWORD *)v5 + 8);
        if (v8 <= a2)
          break;
        v5 = *v7;
        v6 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        return v7;
      v5 = v7[1];
      if (!v5)
      {
        v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = a1 + 1;
LABEL_9:
    v9 = (char *)operator new(0x40uLL);
    *((_DWORD *)v9 + 8) = *a3;
    *((_WORD *)v9 + 20) = 0;
    *(_QWORD *)(v9 + 44) = 10;
    v10 = (_OWORD *)operator new[]();
    *v10 = xmmword_20CDD38C0;
    v10[2] = 0u;
    v10[3] = 0u;
    v10[4] = 0u;
    v10[5] = 0u;
    v10[6] = 0u;
    v10[1] = 0u;
    *((_QWORD *)v9 + 7) = v10 + 1;
    *(_QWORD *)v9 = 0;
    *((_QWORD *)v9 + 1) = 0;
    *((_QWORD *)v9 + 2) = v7;
    *v6 = (uint64_t *)v9;
    v11 = (uint64_t *)**a1;
    v12 = (uint64_t *)v9;
    if (v11)
    {
      *a1 = v11;
      v12 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return (uint64_t **)v9;
}

void sub_20CD9996C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t **a1, unint64_t a2, uint64_t **a3)
{
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = v5[4];
        if (v8 <= a2)
          break;
        v5 = *v7;
        v6 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v5 = v7[1];
      if (!v5)
      {
        v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = a1 + 1;
LABEL_9:
    v9 = (uint64_t *)v7;
    v7 = (uint64_t **)operator new(0x40uLL);
    v7[4] = *a3;
    v7[5] = 0;
    v7[6] = 0;
    v7[7] = 0;
    *v7 = 0;
    v7[1] = 0;
    v7[2] = v9;
    *v6 = (uint64_t *)v7;
    v10 = (uint64_t *)**a1;
    v11 = (uint64_t *)v7;
    if (v10)
    {
      *a1 = v10;
      v11 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v11);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

BOOL myKeySorter<double,unsigned int>(double *a1, double *a2)
{
  return *a2 < *a1;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*,false>(uint64_t result, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *), uint64_t a4, char a5)
{
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  _OWORD *v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
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
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t *v66;
  int v67;
  uint64_t *v68;
  int64_t v69;
  __int128 v70;

  v9 = result;
LABEL_2:
  v10 = a2 - 2;
  v66 = a2;
  v68 = a2 - 4;
  v65 = a2 - 6;
  v11 = v9;
  while (2)
  {
    v9 = v11;
    v12 = (uint64_t)a2 - v11;
    v13 = v12 >> 4;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        result = (*a3)(v10, (uint64_t *)v9);
        if ((_DWORD)result)
        {
          v28 = *(_QWORD *)v9;
          v29 = *(_DWORD *)(v9 + 8);
          if ((uint64_t *)v9 != v10)
          {
            *(_QWORD *)v9 = *(a2 - 2);
            *(_DWORD *)(v9 + 8) = *((_DWORD *)a2 - 2);
          }
          *(a2 - 2) = v28;
          *((_DWORD *)a2 - 2) = v29;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)v9, (uint64_t *)(v9 + 16), v10, a3);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(v9, v9 + 16, v9 + 32, (uint64_t)v10, a3);
      case 5uLL:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(v9, v9 + 16, v9 + 32, v9 + 48, (uint64_t)v10, a3);
      default:
        if (v12 > 383)
        {
          if (!a4)
          {
            if ((uint64_t *)v9 != a2)
            {
              v37 = (v13 - 2) >> 1;
              v69 = v37;
              do
              {
                v38 = v37;
                if (v69 >= v37)
                {
                  v39 = (2 * v37) | 1;
                  v40 = v9 + 16 * v39;
                  if (2 * v37 + 2 < (uint64_t)v13
                    && (*a3)((uint64_t *)(v9 + 16 * v39), (uint64_t *)(v40 + 16)))
                  {
                    v40 += 16;
                    v39 = 2 * v38 + 2;
                  }
                  v41 = v9 + 16 * v38;
                  result = (*a3)((uint64_t *)v40, (uint64_t *)v41);
                  a2 = v66;
                  if ((result & 1) == 0)
                  {
                    v70 = *(_OWORD *)v41;
                    do
                    {
                      v42 = v40;
                      if (v41 != v40)
                      {
                        *(_QWORD *)v41 = *(_QWORD *)v40;
                        *(_DWORD *)(v41 + 8) = *(_DWORD *)(v40 + 8);
                      }
                      if (v69 < v39)
                        break;
                      v43 = (2 * v39) | 1;
                      v40 = v9 + 16 * v43;
                      v44 = 2 * v39 + 2;
                      if (v44 < (uint64_t)v13 && (*a3)((uint64_t *)(v9 + 16 * v43), (uint64_t *)(v40 + 16)))
                      {
                        v40 += 16;
                        v43 = v44;
                      }
                      result = (*a3)((uint64_t *)v40, (uint64_t *)&v70);
                      v41 = v42;
                      v39 = v43;
                    }
                    while (!(_DWORD)result);
                    if ((__int128 *)v42 != &v70)
                    {
                      *(_QWORD *)v42 = v70;
                      *(_DWORD *)(v42 + 8) = DWORD2(v70);
                    }
                    a2 = v66;
                  }
                }
                v37 = v38 - 1;
              }
              while (v38);
              v45 = (unint64_t)v12 >> 4;
              do
              {
                v46 = a2;
                v47 = 0;
                v48 = *(_QWORD *)v9;
                v67 = *(_DWORD *)(v9 + 8);
                v49 = v45 - 2;
                if (v45 < 2)
                  v49 = v45 - 1;
                v50 = v49 >> 1;
                v51 = v9;
                do
                {
                  v52 = v51 + 16 * v47 + 16;
                  v53 = 2 * v47;
                  v47 = (2 * v47) | 1;
                  v54 = v53 + 2;
                  if (v53 + 2 < v45)
                  {
                    result = (*a3)((uint64_t *)v52, (uint64_t *)(v52 + 16));
                    if ((_DWORD)result)
                    {
                      v52 += 16;
                      v47 = v54;
                    }
                  }
                  if (v51 != v52)
                  {
                    *(_QWORD *)v51 = *(_QWORD *)v52;
                    *(_DWORD *)(v51 + 8) = *(_DWORD *)(v52 + 8);
                  }
                  v51 = v52;
                }
                while (v47 <= v50);
                if ((uint64_t *)v52 == v46 - 2)
                {
                  *(_QWORD *)v52 = v48;
                  *(_DWORD *)(v52 + 8) = v67;
                  v56 = v45 - 1;
                }
                else
                {
                  *(_QWORD *)v52 = *(v46 - 2);
                  *(_DWORD *)(v52 + 8) = *((_DWORD *)v46 - 2);
                  *(v46 - 2) = v48;
                  *((_DWORD *)v46 - 2) = v67;
                  v55 = v52 - v9 + 16;
                  v56 = v45 - 1;
                  if (v55 >= 17)
                  {
                    v57 = (((unint64_t)v55 >> 4) - 2) >> 1;
                    v58 = v9 + 16 * v57;
                    result = (*a3)((uint64_t *)v58, (uint64_t *)v52);
                    if ((_DWORD)result)
                    {
                      v70 = *(_OWORD *)v52;
                      do
                      {
                        v59 = v58;
                        if (v52 != v58)
                        {
                          *(_QWORD *)v52 = *(_QWORD *)v58;
                          *(_DWORD *)(v52 + 8) = *(_DWORD *)(v58 + 8);
                        }
                        if (!v57)
                          break;
                        v57 = (v57 - 1) >> 1;
                        v58 = v9 + 16 * v57;
                        result = (*a3)((uint64_t *)v58, (uint64_t *)&v70);
                        v52 = v59;
                      }
                      while ((result & 1) != 0);
                      if ((__int128 *)v59 != &v70)
                      {
                        *(_QWORD *)v59 = v70;
                        *(_DWORD *)(v59 + 8) = DWORD2(v70);
                      }
                    }
                  }
                }
                a2 = v46 - 2;
                v60 = v45 <= 2;
                v45 = v56;
              }
              while (!v60);
            }
            return result;
          }
          v14 = v9 + 16 * (v13 >> 1);
          if ((unint64_t)v12 < 0x801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)(v9 + 16 * (v13 >> 1)), (uint64_t *)v9, v10, a3);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)v9, (uint64_t *)(v9 + 16 * (v13 >> 1)), v10, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)(v9 + 16), (uint64_t *)(v14 - 16), v68, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)(v9 + 32), (uint64_t *)(v9 + 16 + 16 * (v13 >> 1)), v65, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)(v14 - 16), (uint64_t *)(v9 + 16 * (v13 >> 1)), (uint64_t *)(v9 + 16 + 16 * (v13 >> 1)), a3);
            v15 = *(_QWORD *)v9;
            v16 = *(_DWORD *)(v9 + 8);
            *(_QWORD *)v9 = *(_QWORD *)v14;
            *(_DWORD *)(v9 + 8) = *(_DWORD *)(v14 + 8);
            *(_QWORD *)v14 = v15;
            *(_DWORD *)(v14 + 8) = v16;
          }
          --a4;
          a2 = v66;
          if ((a5 & 1) == 0 && ((*a3)((uint64_t *)(v9 - 16), (uint64_t *)v9) & 1) == 0)
          {
            v70 = *(_OWORD *)v9;
            result = (*a3)((uint64_t *)&v70, v10);
            if ((result & 1) != 0)
            {
              v11 = v9;
              do
              {
                v11 += 16;
                result = (*a3)((uint64_t *)&v70, (uint64_t *)v11);
              }
              while ((result & 1) == 0);
            }
            else
            {
              v24 = (uint64_t *)(v9 + 16);
              do
              {
                v11 = (unint64_t)v24;
                if (v24 >= v66)
                  break;
                result = (*a3)((uint64_t *)&v70, v24);
                v24 = (uint64_t *)(v11 + 16);
              }
              while (!(_DWORD)result);
            }
            v25 = v66;
            if (v11 < (unint64_t)v66)
            {
              v25 = v66;
              do
              {
                v25 -= 2;
                result = (*a3)((uint64_t *)&v70, v25);
              }
              while ((result & 1) != 0);
            }
            while (v11 < (unint64_t)v25)
            {
              v26 = *(_QWORD *)v11;
              v27 = *(_DWORD *)(v11 + 8);
              *(_QWORD *)v11 = *v25;
              *(_DWORD *)(v11 + 8) = *((_DWORD *)v25 + 2);
              *v25 = v26;
              *((_DWORD *)v25 + 2) = v27;
              do
                v11 += 16;
              while (!(*a3)((uint64_t *)&v70, (uint64_t *)v11));
              do
              {
                v25 -= 2;
                result = (*a3)((uint64_t *)&v70, v25);
              }
              while ((result & 1) != 0);
            }
            if (v11 - 16 != v9)
            {
              *(_QWORD *)v9 = *(_QWORD *)(v11 - 16);
              *(_DWORD *)(v9 + 8) = *(_DWORD *)(v11 - 8);
            }
            if ((__int128 *)(v11 - 16) != &v70)
            {
              *(_QWORD *)(v11 - 16) = v70;
              *(_DWORD *)(v11 - 8) = DWORD2(v70);
            }
            goto LABEL_33;
          }
          v17 = 0;
          v70 = *(_OWORD *)v9;
          do
            v17 += 16;
          while (((*a3)((uint64_t *)(v17 + v9), (uint64_t *)&v70) & 1) != 0);
          v18 = v9 + v17;
          v19 = v66;
          if (v17 == 16)
          {
            v19 = v66;
            do
            {
              if (v18 >= (unint64_t)v19)
                break;
              v19 -= 2;
            }
            while (((*a3)(v19, (uint64_t *)&v70) & 1) == 0);
          }
          else
          {
            do
              v19 -= 2;
            while (!(*a3)(v19, (uint64_t *)&v70));
          }
          v11 = v9 + v17;
          if (v18 < (unint64_t)v19)
          {
            v20 = (unint64_t)v19;
            do
            {
              v21 = *(_QWORD *)v11;
              v22 = *(_DWORD *)(v11 + 8);
              *(_QWORD *)v11 = *(_QWORD *)v20;
              *(_DWORD *)(v11 + 8) = *(_DWORD *)(v20 + 8);
              *(_QWORD *)v20 = v21;
              *(_DWORD *)(v20 + 8) = v22;
              do
                v11 += 16;
              while (((*a3)((uint64_t *)v11, (uint64_t *)&v70) & 1) != 0);
              do
                v20 -= 16;
              while (!(*a3)((uint64_t *)v20, (uint64_t *)&v70));
            }
            while (v11 < v20);
          }
          if (v11 - 16 != v9)
          {
            *(_QWORD *)v9 = *(_QWORD *)(v11 - 16);
            *(_DWORD *)(v9 + 8) = *(_DWORD *)(v11 - 8);
          }
          if ((__int128 *)(v11 - 16) != &v70)
          {
            *(_QWORD *)(v11 - 16) = v70;
            *(_DWORD *)(v11 - 8) = DWORD2(v70);
          }
          if (v18 < (unint64_t)v19)
            goto LABEL_32;
          v23 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(v9, (uint64_t *)(v11 - 16), a3);
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(v11, v66, a3);
          if (!(_DWORD)result)
          {
            if (v23)
              continue;
LABEL_32:
            result = std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*,false>(v9, v11 - 16, a3, a4, a5 & 1);
LABEL_33:
            a5 = 0;
            continue;
          }
          a2 = (uint64_t *)(v11 - 16);
          if (v23)
            return result;
          goto LABEL_2;
        }
        if ((a5 & 1) != 0)
        {
          if ((uint64_t *)v9 != a2)
          {
            v30 = (_OWORD *)(v9 + 16);
            if ((uint64_t *)(v9 + 16) != a2)
            {
              v31 = 0;
              v32 = (_OWORD *)v9;
              do
              {
                v33 = (uint64_t *)v32;
                v32 = v30;
                result = (*a3)((uint64_t *)v30, v33);
                if ((_DWORD)result)
                {
                  v70 = *v32;
                  v34 = v31;
                  while (1)
                  {
                    v35 = v9 + v34;
                    *(_QWORD *)(v35 + 16) = *(_QWORD *)(v9 + v34);
                    *(_DWORD *)(v35 + 24) = *(_DWORD *)(v9 + v34 + 8);
                    if (!v34)
                      break;
                    v34 -= 16;
                    result = (*a3)((uint64_t *)&v70, (uint64_t *)(v34 + v9));
                    if ((result & 1) == 0)
                    {
                      v36 = v9 + v34 + 16;
                      goto LABEL_73;
                    }
                  }
                  v36 = v9;
LABEL_73:
                  a2 = v66;
                  if ((__int128 *)v36 != &v70)
                  {
                    *(_QWORD *)v36 = v70;
                    *(_DWORD *)(v36 + 8) = DWORD2(v70);
                  }
                }
                v30 = v32 + 1;
                v31 += 16;
              }
              while (v32 + 1 != (_OWORD *)a2);
            }
          }
        }
        else if ((uint64_t *)v9 != a2)
        {
          v61 = (uint64_t *)(v9 + 16);
          if ((uint64_t *)(v9 + 16) != a2)
          {
            v62 = v9 - 16;
            do
            {
              v63 = (uint64_t *)v9;
              v9 = (uint64_t)v61;
              result = (*a3)(v61, v63);
              if ((_DWORD)result)
              {
                v70 = *(_OWORD *)v9;
                v64 = v62;
                do
                {
                  *(_QWORD *)(v64 + 32) = *(_QWORD *)(v64 + 16);
                  *(_DWORD *)(v64 + 40) = *(_DWORD *)(v64 + 24);
                  result = (*a3)((uint64_t *)&v70, (uint64_t *)v64);
                  v64 -= 16;
                }
                while ((result & 1) != 0);
                if ((__int128 *)(v64 + 32) != &v70)
                {
                  *(_QWORD *)(v64 + 32) = v70;
                  *(_DWORD *)(v64 + 40) = DWORD2(v70);
                }
              }
              v61 = (uint64_t *)(v9 + 16);
              v62 += 16;
            }
            while ((uint64_t *)(v9 + 16) != a2);
          }
        }
        return result;
    }
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t (**a4)(uint64_t *, uint64_t *))
{
  char v8;
  uint64_t result;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;

  v8 = (*a4)(a2, a1);
  result = (*a4)(a3, a2);
  if ((v8 & 1) != 0)
  {
    v10 = *a1;
    v11 = *((_DWORD *)a1 + 2);
    if ((_DWORD)result)
    {
      if (a1 != a3)
      {
        *a1 = *a3;
        *((_DWORD *)a1 + 2) = *((_DWORD *)a3 + 2);
      }
LABEL_17:
      *a3 = v10;
      *((_DWORD *)a3 + 2) = v11;
      return result;
    }
    if (a1 != a2)
    {
      *a1 = *a2;
      *((_DWORD *)a1 + 2) = *((_DWORD *)a2 + 2);
    }
    *a2 = v10;
    *((_DWORD *)a2 + 2) = v11;
    result = (*a4)(a3, a2);
    if ((_DWORD)result)
    {
      v10 = *a2;
      v11 = *((_DWORD *)a2 + 2);
      if (a2 != a3)
      {
        *a2 = *a3;
        *((_DWORD *)a2 + 2) = *((_DWORD *)a3 + 2);
      }
      goto LABEL_17;
    }
  }
  else if ((_DWORD)result)
  {
    v12 = *a2;
    v13 = *((_DWORD *)a2 + 2);
    if (a2 != a3)
    {
      *a2 = *a3;
      *((_DWORD *)a2 + 2) = *((_DWORD *)a3 + 2);
    }
    *a3 = v12;
    *((_DWORD *)a3 + 2) = v13;
    result = (*a4)(a2, a1);
    if ((_DWORD)result)
    {
      v14 = *a1;
      v15 = *((_DWORD *)a1 + 2);
      if (a1 != a2)
      {
        *a1 = *a2;
        *((_DWORD *)a1 + 2) = *((_DWORD *)a2 + 2);
      }
      *a2 = v14;
      *((_DWORD *)a2 + 2) = v15;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(uint64_t a1, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *))
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v6 = ((uint64_t)a2 - a1) >> 4;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = a2 - 2;
      if ((*a3)(a2 - 2, (uint64_t *)a1))
      {
        v9 = *(_QWORD *)a1;
        v10 = *(_DWORD *)(a1 + 8);
        if (v8 != (uint64_t *)a1)
        {
          *(_QWORD *)a1 = *(a2 - 2);
          *(_DWORD *)(a1 + 8) = *((_DWORD *)a2 - 2);
        }
        *(a2 - 2) = v9;
        *((_DWORD *)a2 - 2) = v10;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)a1, (uint64_t *)(a1 + 16), a2 - 2, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(a1, a1 + 16, a1 + 32, (uint64_t)(a2 - 2), a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(a1, a1 + 16, a1 + 32, a1 + 48, (uint64_t)(a2 - 2), a3);
      return 1;
    default:
      v11 = (uint64_t *)(a1 + 32);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)a1, (uint64_t *)(a1 + 16), (uint64_t *)(a1 + 32), a3);
      v12 = (uint64_t *)(a1 + 48);
      if ((uint64_t *)(a1 + 48) == a2)
        return 1;
      v13 = 0;
      v14 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)(v12, v11))
    {
      v18 = *(_OWORD *)v12;
      v15 = v13;
      while (1)
      {
        v16 = a1 + v15;
        *(_QWORD *)(v16 + 48) = *(_QWORD *)(a1 + v15 + 32);
        *(_DWORD *)(v16 + 56) = *(_DWORD *)(a1 + v15 + 40);
        if (v15 == -32)
          break;
        v15 -= 16;
        if (((*a3)((uint64_t *)&v18, (uint64_t *)(v16 + 16)) & 1) == 0)
        {
          v17 = a1 + v15 + 48;
          goto LABEL_14;
        }
      }
      v17 = a1;
LABEL_14:
      if ((__int128 *)v17 != &v18)
      {
        *(_QWORD *)v17 = v18;
        *(_DWORD *)(v17 + 8) = DWORD2(v18);
      }
      if (++v14 == 8)
        return v12 + 2 == a2;
    }
    v11 = v12;
    v13 += 16;
    v12 += 2;
    if (v12 == a2)
      return 1;
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(uint64_t *, uint64_t *))
{
  uint64_t result;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)a1, (uint64_t *)a2, (uint64_t *)a3, a5);
  result = (*a5)((uint64_t *)a4, (uint64_t *)a3);
  if ((_DWORD)result)
  {
    v11 = *(_QWORD *)a3;
    v12 = *(_DWORD *)(a3 + 8);
    if (a3 != a4)
    {
      *(_QWORD *)a3 = *(_QWORD *)a4;
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a4 + 8);
    }
    *(_QWORD *)a4 = v11;
    *(_DWORD *)(a4 + 8) = v12;
    result = (*a5)((uint64_t *)a3, (uint64_t *)a2);
    if ((_DWORD)result)
    {
      v13 = *(_QWORD *)a2;
      v14 = *(_DWORD *)(a2 + 8);
      if (a2 != a3)
      {
        *(_QWORD *)a2 = *(_QWORD *)a3;
        *(_DWORD *)(a2 + 8) = *(_DWORD *)(a3 + 8);
      }
      *(_QWORD *)a3 = v13;
      *(_DWORD *)(a3 + 8) = v14;
      result = (*a5)((uint64_t *)a2, (uint64_t *)a1);
      if ((_DWORD)result)
      {
        v15 = *(_QWORD *)a1;
        v16 = *(_DWORD *)(a1 + 8);
        if (a1 != a2)
        {
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
        }
        *(_QWORD *)a2 = v15;
        *(_DWORD *)(a2 + 8) = v16;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(uint64_t *, uint64_t *))
{
  uint64_t result;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(a1, a2, a3, a4, a6);
  result = (*a6)((uint64_t *)a5, (uint64_t *)a4);
  if ((_DWORD)result)
  {
    v13 = *(_QWORD *)a4;
    v14 = *(_DWORD *)(a4 + 8);
    if (a4 != a5)
    {
      *(_QWORD *)a4 = *(_QWORD *)a5;
      *(_DWORD *)(a4 + 8) = *(_DWORD *)(a5 + 8);
    }
    *(_QWORD *)a5 = v13;
    *(_DWORD *)(a5 + 8) = v14;
    result = (*a6)((uint64_t *)a4, (uint64_t *)a3);
    if ((_DWORD)result)
    {
      v15 = *(_QWORD *)a3;
      v16 = *(_DWORD *)(a3 + 8);
      if (a3 != a4)
      {
        *(_QWORD *)a3 = *(_QWORD *)a4;
        *(_DWORD *)(a3 + 8) = *(_DWORD *)(a4 + 8);
      }
      *(_QWORD *)a4 = v15;
      *(_DWORD *)(a4 + 8) = v16;
      result = (*a6)((uint64_t *)a3, (uint64_t *)a2);
      if ((_DWORD)result)
      {
        v17 = *(_QWORD *)a2;
        v18 = *(_DWORD *)(a2 + 8);
        if (a2 != a3)
        {
          *(_QWORD *)a2 = *(_QWORD *)a3;
          *(_DWORD *)(a2 + 8) = *(_DWORD *)(a3 + 8);
        }
        *(_QWORD *)a3 = v17;
        *(_DWORD *)(a3 + 8) = v18;
        result = (*a6)((uint64_t *)a2, (uint64_t *)a1);
        if ((_DWORD)result)
        {
          v19 = *(_QWORD *)a1;
          v20 = *(_DWORD *)(a1 + 8);
          if (a1 != a2)
          {
            *(_QWORD *)a1 = *(_QWORD *)a2;
            *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
          }
          *(_QWORD *)a2 = v19;
          *(_DWORD *)(a2 + 8) = v20;
        }
      }
    }
  }
  return result;
}

BOOL myKeySorter<unsigned int,unsigned int>(_DWORD *a1, _DWORD *a2)
{
  return *a2 < *a1;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*,false>(uint64_t result, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *), uint64_t a4, char a5)
{
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t *v56;
  uint64_t *v57;
  BOOL v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t *v64;
  int64_t v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;

  v9 = (uint64_t *)result;
LABEL_2:
  v10 = a2 - 1;
  v63 = a2 - 3;
  v64 = a2 - 2;
  v11 = v9;
  v66 = a2;
  while (2)
  {
    v9 = v11;
    v12 = (char *)a2 - (char *)v11;
    v13 = v12 >> 3;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        result = (*a3)(v10, v9);
        if ((_DWORD)result)
        {
          v27 = *v9;
          if (v9 != v10)
            *v9 = *v10;
          *(a2 - 1) = v27;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v9, v9 + 1, v10, a3);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v9, v9 + 1, v9 + 2, v10, a3);
      case 5uLL:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v9, v9 + 1, v9 + 2, v9 + 3, v10, a3);
      default:
        if (v12 > 191)
        {
          if (!a4)
          {
            if (v9 != a2)
            {
              v36 = (v13 - 2) >> 1;
              v65 = v36;
              do
              {
                v37 = v36;
                if (v65 >= v36)
                {
                  v38 = (2 * v36) | 1;
                  v39 = &v9[v38];
                  if (2 * v36 + 2 < (uint64_t)v13 && (*a3)(&v9[v38], v39 + 1))
                  {
                    ++v39;
                    v38 = 2 * v37 + 2;
                  }
                  v40 = &v9[v37];
                  result = (*a3)(v39, v40);
                  a2 = v66;
                  if ((result & 1) == 0)
                  {
                    v68 = *v40;
                    do
                    {
                      v41 = v39;
                      if (v40 != v39)
                        *v40 = *v39;
                      if (v65 < v38)
                        break;
                      v42 = (2 * v38) | 1;
                      v39 = &v9[v42];
                      v43 = 2 * v38 + 2;
                      if (v43 < (uint64_t)v13 && (*a3)(&v9[v42], v39 + 1))
                      {
                        ++v39;
                        v42 = v43;
                      }
                      result = (*a3)(v39, &v68);
                      v40 = v41;
                      v38 = v42;
                    }
                    while (!(_DWORD)result);
                    if (v41 != &v68)
                      *v41 = v68;
                    a2 = v66;
                  }
                }
                v36 = v37 - 1;
              }
              while (v37);
              v44 = (unint64_t)v12 >> 3;
              do
              {
                v67 = a2;
                v45 = 0;
                v46 = *v9;
                v47 = v44 - 2;
                if (v44 < 2)
                  v47 = v44 - 1;
                v48 = v47 >> 1;
                v49 = v9;
                do
                {
                  v50 = &v49[v45 + 1];
                  v51 = 2 * v45;
                  v45 = (2 * v45) | 1;
                  v52 = v51 + 2;
                  if (v51 + 2 < v44)
                  {
                    result = (*a3)(v50, v50 + 1);
                    if ((_DWORD)result)
                    {
                      ++v50;
                      v45 = v52;
                    }
                  }
                  if (v49 != v50)
                    *v49 = *v50;
                  v49 = v50;
                }
                while (v45 <= v48);
                if (v50 == v67 - 1)
                {
                  *v50 = v46;
                  v54 = v44 - 1;
                }
                else
                {
                  *v50 = *(v67 - 1);
                  *(v67 - 1) = v46;
                  v53 = (char *)v50 - (char *)v9 + 8;
                  v54 = v44 - 1;
                  if (v53 >= 9)
                  {
                    v55 = (((unint64_t)v53 >> 3) - 2) >> 1;
                    v56 = &v9[v55];
                    result = (*a3)(v56, v50);
                    if ((_DWORD)result)
                    {
                      v68 = *v50;
                      do
                      {
                        v57 = v56;
                        if (v50 != v56)
                          *v50 = *v56;
                        if (!v55)
                          break;
                        v55 = (v55 - 1) >> 1;
                        v56 = &v9[v55];
                        result = (*a3)(v56, &v68);
                        v50 = v57;
                      }
                      while ((result & 1) != 0);
                      if (v57 != &v68)
                        *v57 = v68;
                    }
                  }
                }
                a2 = v67 - 1;
                v58 = v44 <= 2;
                v44 = v54;
              }
              while (!v58);
            }
            return result;
          }
          v14 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(&v9[v13 >> 1], v9, v10, a3);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v9, &v9[v13 >> 1], v10, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v9 + 1, v14 - 1, v64, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v9 + 2, &v9[(v13 >> 1) + 1], v63, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v14 - 1, &v9[v13 >> 1], &v9[(v13 >> 1) + 1], a3);
            v15 = *v9;
            *v9 = *v14;
            *v14 = v15;
          }
          --a4;
          if ((a5 & 1) == 0 && ((*a3)(v9 - 1, v9) & 1) == 0)
          {
            v68 = *v9;
            result = (*a3)(&v68, v10);
            if ((result & 1) != 0)
            {
              v11 = v9;
              a2 = v66;
              do
                result = (*a3)(&v68, ++v11);
              while ((result & 1) == 0);
            }
            else
            {
              v23 = v9 + 1;
              a2 = v66;
              do
              {
                v11 = v23;
                if (v23 >= v66)
                  break;
                result = (*a3)(&v68, v23);
                v23 = v11 + 1;
              }
              while (!(_DWORD)result);
            }
            v24 = a2;
            if (v11 < a2)
            {
              v24 = a2;
              do
                result = (*a3)(&v68, --v24);
              while ((result & 1) != 0);
            }
            while (v11 < v24)
            {
              v25 = *v11;
              *v11 = *v24;
              *v24 = v25;
              do
                ++v11;
              while (!(*a3)(&v68, v11));
              do
                result = (*a3)(&v68, --v24);
              while ((result & 1) != 0);
            }
            v26 = v11 - 1;
            if (v11 - 1 != v9)
              *v9 = *v26;
            if (v26 != &v68)
              *v26 = v68;
            goto LABEL_35;
          }
          v16 = 0;
          v68 = *v9;
          do
            ++v16;
          while (((*a3)(&v9[v16], &v68) & 1) != 0);
          v17 = &v9[v16];
          v18 = v66;
          if (v16 == 1)
          {
            v18 = v66;
            do
            {
              if (v17 >= v18)
                break;
              --v18;
            }
            while (((*a3)(v18, &v68) & 1) == 0);
          }
          else
          {
            do
              --v18;
            while (!(*a3)(v18, &v68));
          }
          v11 = &v9[v16];
          if (v17 >= v18)
          {
            a2 = v66;
          }
          else
          {
            v19 = v18;
            a2 = v66;
            do
            {
              v20 = *v11;
              *v11 = *v19;
              *v19 = v20;
              do
                ++v11;
              while (((*a3)(v11, &v68) & 1) != 0);
              do
                --v19;
              while (!(*a3)(v19, &v68));
            }
            while (v11 < v19);
          }
          v21 = v11 - 1;
          if (v11 - 1 != v9)
            *v9 = *v21;
          if (v21 != &v68)
            *v21 = v68;
          if (v17 < v18)
            goto LABEL_34;
          v22 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v9, v11 - 1, a3);
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v11, a2, a3);
          if (!(_DWORD)result)
          {
            if (v22)
              continue;
LABEL_34:
            result = std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*,false>(v9, v11 - 1, a3, a4, a5 & 1);
LABEL_35:
            a5 = 0;
            continue;
          }
          a2 = v11 - 1;
          if (v22)
            return result;
          goto LABEL_2;
        }
        v28 = v9 + 1;
        v30 = v9 == a2 || v28 == a2;
        if ((a5 & 1) != 0)
        {
          if (!v30)
          {
            v31 = 0;
            v32 = v9;
            do
            {
              v33 = v32;
              v32 = v28;
              result = (*a3)(v28, v33);
              if ((_DWORD)result)
              {
                v68 = *v32;
                v34 = v31;
                while (1)
                {
                  *(uint64_t *)((char *)v9 + v34 + 8) = *(uint64_t *)((char *)v9 + v34);
                  if (!v34)
                    break;
                  v34 -= 8;
                  result = (*a3)(&v68, (uint64_t *)((char *)v9 + v34));
                  if ((result & 1) == 0)
                  {
                    v35 = (uint64_t *)((char *)v9 + v34 + 8);
                    goto LABEL_80;
                  }
                }
                v35 = v9;
LABEL_80:
                a2 = v66;
                if (v35 != &v68)
                  *v35 = v68;
              }
              v28 = v32 + 1;
              v31 += 8;
            }
            while (v32 + 1 != a2);
          }
        }
        else if (!v30)
        {
          do
          {
            v59 = v9;
            v9 = v28;
            result = (*a3)(v28, v59);
            if ((_DWORD)result)
            {
              v68 = *v9;
              v60 = v9;
              do
              {
                v61 = v60;
                v62 = *--v60;
                *v61 = v62;
                result = (*a3)(&v68, v61 - 2);
              }
              while ((result & 1) != 0);
              if (v60 != &v68)
                *v60 = v68;
            }
            v28 = v9 + 1;
          }
          while (v9 + 1 != a2);
        }
        return result;
    }
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t (**a4)(uint64_t *, uint64_t *))
{
  uint64_t *v6;
  uint64_t *v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v6 = a2;
  v7 = a1;
  v8 = (*a4)(a2, a1);
  result = (*a4)(a3, v6);
  if ((v8 & 1) != 0)
  {
    v10 = *v7;
    if ((_DWORD)result)
    {
      v6 = a3;
      if (v7 == a3)
      {
LABEL_5:
        *v6 = v10;
        return result;
      }
LABEL_4:
      *v7 = *a3;
      v6 = a3;
      goto LABEL_5;
    }
    if (v7 != v6)
      *v7 = *v6;
    *v6 = v10;
    result = (*a4)(a3, v6);
    if ((_DWORD)result)
    {
      v10 = *v6;
      v7 = v6;
      if (v6 == a3)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((_DWORD)result)
  {
    v11 = *v6;
    if (v6 != a3)
      *v6 = *a3;
    *a3 = v11;
    result = (*a4)(v6, v7);
    if ((_DWORD)result)
    {
      v10 = *v7;
      a3 = v6;
      if (v7 == v6)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *))
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = a2 - 1;
      if ((*a3)(a2 - 1, a1))
      {
        v9 = *a1;
        if (v8 != a1)
          *a1 = *v8;
        *(a2 - 1) = v9;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      v10 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a1 + 1, a1 + 2, a3);
      v11 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)(v11, v10))
    {
      v17 = *v11;
      v14 = v12;
      while (1)
      {
        v15 = (uint64_t *)((char *)a1 + v14);
        *(uint64_t *)((char *)a1 + v14 + 24) = *(uint64_t *)((char *)a1 + v14 + 16);
        if (v14 == -16)
          break;
        v14 -= 8;
        if (((*a3)(&v17, v15 + 1) & 1) == 0)
        {
          v16 = (uint64_t *)((char *)a1 + v14 + 24);
          goto LABEL_14;
        }
      }
      v16 = a1;
LABEL_14:
      if (v16 != &v17)
        *v16 = v17;
      if (++v13 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v12 += 8;
    if (++v11 == a2)
      return 1;
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t (**a5)(uint64_t *, uint64_t *))
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a2, a3, a5);
  result = (*a5)(a4, a3);
  if ((_DWORD)result)
  {
    v11 = *a3;
    if (a3 != a4)
      *a3 = *a4;
    *a4 = v11;
    result = (*a5)(a3, a2);
    if ((_DWORD)result)
    {
      v12 = *a2;
      if (a2 != a3)
        *a2 = *a3;
      *a3 = v12;
      result = (*a5)(a2, a1);
      if ((_DWORD)result)
      {
        v13 = *a1;
        if (a1 != a2)
          *a1 = *a2;
        *a2 = v13;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t (**a6)(uint64_t *, uint64_t *))
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a2, a3, a4, a6);
  result = (*a6)(a5, a4);
  if ((_DWORD)result)
  {
    v13 = *a4;
    if (a4 != a5)
      *a4 = *a5;
    *a5 = v13;
    result = (*a6)(a4, a3);
    if ((_DWORD)result)
    {
      v14 = *a3;
      if (a3 != a4)
        *a3 = *a4;
      *a4 = v14;
      result = (*a6)(a3, a2);
      if ((_DWORD)result)
      {
        v15 = *a2;
        if (a2 != a3)
          *a2 = *a3;
        *a3 = v15;
        result = (*a6)(a2, a1);
        if ((_DWORD)result)
        {
          v16 = *a1;
          if (a1 != a2)
            *a1 = *a2;
          *a2 = v16;
        }
      }
    }
  }
  return result;
}

_QWORD *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  MEMORY[0x212B955E4](&v11, a1, 1);
  if (!v11)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(_QWORD *))(*v7 + 80))(v7);
    if ((_DWORD)v7 == -1)
      break;
LABEL_9:
    if (v7 == a3)
    {
      v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6)
    v9 = 2;
  else
    v9 = 6;
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_20CD9B6A8(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x20CD9B674);
  }
  __cxa_rethrow();
}

void sub_20CD9B6EC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_20CD9C134(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_20CD9CC94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CD9CEB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CD9CF90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CD9D078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CD9D18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20CD9DF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_20CD9E390(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CD9E758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_20CD9EA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_20CD9F004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_20CD9FB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,_QWORD *a49,uint64_t a50,void *__p,uint64_t a52,uint64_t a53,void *a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a66;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  std::__tree<std::__value_type<CRTextFeature * {__strong},int>,std::__map_value_compare<CRTextFeature * {__strong},std::__value_type<CRTextFeature * {__strong},int>,std::less<CRTextFeature * {__strong}>,true>,std::allocator<std::__value_type<CRTextFeature * {__strong},int>>>::destroy(a49);
  if (__p)
    operator delete(__p);
  if (a54)
    operator delete(a54);
  if (a66)
    operator delete(a66);

  _Unwind_Resume(a1);
}

void sub_20CD9FEBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_20CDA088C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28)
{
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

void sub_20CDA0C88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CDA15B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t i;

  for (i = 7; i != -2; i -= 3)
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(v1[i + 43]);

  _Unwind_Resume(a1);
}

void fieldDecoding(uint64_t *a1, unsigned int a2, int a3, _QWORD *a4, int a5, _QWORD *a6, void *a7, int a8)
{
  double v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  int v31;
  int v33;
  void *v34;
  id v35;

  v35 = a7;
  v16 = (a3 - (a2 >> 1)) & ~((int)(a3 - (a2 >> 1)) >> 31);
  v17 = a3 + (a2 >> 1);
  v18 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v19 = v18 - 1;
  v20 = v18 - 1;
  if (v19 < v17)
    v17 = v20;
  if ((int)v16 > v17)
    goto LABEL_32;
  v21 = (v17 + 1);
  do
  {
    v22 = *a1;
    v23 = *(_QWORD *)(*a1 + 24 * v16);
    v24 = *(_QWORD *)(*a1 + 24 * v16 + 8);
    v25 = v24 - v23;
    if (v24 == v23)
      goto LABEL_29;
    v26 = 0;
    v27 = v25 >> 2;
    if (v27 <= 1)
      v27 = 1;
    LODWORD(v15) = -8388608;
    v28 = 0xFFFFFFFFLL;
    do
    {
      if (a5 == 3)
      {
        v29 = *(_DWORD *)(*a4 + 4 * v26);
        if (v29 == 103 || (v29 - 91) > 0xFFFFFFE5)
          goto LABEL_26;
      }
      else if (a5 == 2)
      {
        v31 = *(_DWORD *)(*a4 + 4 * v26);
        if (v31 == 103 || (v31 - 58) > 0xFFFFFFF5)
          goto LABEL_26;
      }
      else if (a5 != 1 || (*(_DWORD *)(*a4 + 4 * v26) - 48) > 9)
      {
        goto LABEL_26;
      }
      if (*(float *)(v23 + 4 * v26) > *(float *)&v15)
      {
        v28 = v26;
        LODWORD(v15) = *(_DWORD *)(v23 + 4 * v26);
      }
LABEL_26:
      ++v26;
    }
    while (v27 != v26);
    if ((v28 & 0x80000000) == 0)
    {
      v15 = *(double *)(*a6 + 8 * v28) + *(float *)&v15;
      *(double *)(*a6 + 8 * v28) = v15;
    }
LABEL_29:
    v33 = v16;
    if (a8)
      v33 = ~(_DWORD)v16 - 1431655765 * ((a1[1] - v22) >> 3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v33, v15);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v34);

    ++v16;
  }
  while (v16 != v21);
LABEL_32:

}

void sub_20CDA1868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDA199C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a10);
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);

  _Unwind_Resume(a1);
}

void sub_20CDA2790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,uint64_t a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48,uint64_t a49,void *a50,uint64_t a51,uint64_t a52,void *a53,uint64_t a54,uint64_t a55,void *__p,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;
  void *v67;
  void *v68;
  void *v69;

  if (__p)
  {
    a57 = (uint64_t)__p;
    operator delete(__p);
  }

  __p = &a67;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

void std::vector<std::vector<float>>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a1[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  v5 = a2 >= v4;
  v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<std::vector<float>>::__append(a1, v6);
  }
  else if (!v5)
  {
    v7 = *a1 + 24 * a2;
    if (v3 != v7)
    {
      v8 = a1[1];
      do
      {
        v10 = *(void **)(v8 - 24);
        v8 -= 24;
        v9 = v10;
        if (v10)
        {
          *(_QWORD *)(v3 - 16) = v9;
          operator delete(v9);
        }
        v3 = v8;
      }
      while (v8 != v7);
    }
    a1[1] = v7;
  }
}

void sub_20CDA2CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a10);
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);

  _Unwind_Resume(a1);
}

void sub_20CDA36C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,char *__p,char *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  void *v44;
  void *v45;
  void *v46;

  if (__p)
  {
    a33 = __p;
    operator delete(__p);
  }

  __p = &a44;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<CRTextFeature * {__strong},int>,std::__map_value_compare<CRTextFeature * {__strong},std::__value_type<CRTextFeature * {__strong},int>,std::less<CRTextFeature * {__strong}>,true>,std::allocator<std::__value_type<CRTextFeature * {__strong},int>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<CRTextFeature * {__strong},int>,std::__map_value_compare<CRTextFeature * {__strong},std::__value_type<CRTextFeature * {__strong},int>,std::less<CRTextFeature * {__strong}>,true>,std::allocator<std::__value_type<CRTextFeature * {__strong},int>>>::destroy(*a1);
    std::__tree<std::__value_type<CRTextFeature * {__strong},int>,std::__map_value_compare<CRTextFeature * {__strong},std::__value_type<CRTextFeature * {__strong},int>,std::less<CRTextFeature * {__strong}>,true>,std::allocator<std::__value_type<CRTextFeature * {__strong},int>>>::destroy(a1[1]);

    operator delete(a1);
  }
}

void std::vector<std::vector<float>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    v19 = v4;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>>(v4, v11);
    else
      v12 = 0;
    v15 = v12;
    v16 = &v12[24 * v8];
    v18 = &v12[24 * v11];
    v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    v17 = &v16[v14];
    std::vector<std::vector<float>>::__swap_out_circular_buffer(a1, &v15);
    std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)&v15);
  }
}

void sub_20CDA3A88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<float>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

uint64_t *std::__reverse[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<std::vector<float> *>,std::__wrap_iter<std::vector<float> *>>(uint64_t *result, uint64_t *a2)
{
  uint64_t *i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result != a2)
  {
    for (i = a2 - 3; result < i; i -= 3)
    {
      v3 = *result;
      *result = *i;
      *i = v3;
      v4 = result[1];
      result[1] = i[1];
      i[1] = v4;
      v5 = result[2];
      result[2] = i[2];
      i[2] = v5;
      result += 3;
    }
  }
  return result;
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_20CDA3E78(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::vector<int>::pointer end;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<float>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_20CDA3EEC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_20CDA4144(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20CDA419C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t closestNameInContacts(void *a1, _QWORD *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  uint64_t matched;
  void *v14;
  id *v15;
  uint64_t v16;
  id v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_QWORD *, void *, void *, BOOL *);
  void *v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  id v31;
  id obj;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0x7FFFFFFFLL;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  objc_msgSend(v7, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("meContact"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (id *)(v40 + 5);
    obj = (id)v40[5];
    matched = matchAgainstContact(v10, v11, &obj);
    objc_storeStrong(v12, obj);
    v46[3] = matched;
  }
  else
  {
    matched = v46[3];
  }
  if (matched >= 2)
  {
    objc_msgSend(v9, "objectForKey:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (id *)(v40 + 5);
        v31 = (id)v40[5];
        v16 = matchAgainstContact(v10, v14, &v31);
        objc_storeStrong(v15, v31);
        v46[3] = v16;
      }
    }
    else
    {
      v23 = MEMORY[0x24BDAC760];
      v24 = 3221225472;
      v25 = __closestNameInContacts_block_invoke;
      v26 = &unk_24C58B4D0;
      v17 = v10;
      v27 = v17;
      v28 = &v45;
      v29 = &v39;
      v30 = &v33;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v23);
      v18 = (const __CFString *)v34[5];
      v19 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v17, v23, v24, v25, v26);
      if (v18)
        v20 = v18;
      else
        v20 = CFSTR("NO_MATCH");
      objc_msgSend(v9, "setObject:forKey:", v20, v19);

    }
  }
  *a2 = objc_retainAutorelease((id)v40[5]);
  v21 = v46[3];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v21;
}

void sub_20CDA4564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t matchAgainstContact(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  unint64_t v21;
  _BOOL4 v22;
  unint64_t v23;
  _BOOL4 v24;
  unint64_t v25;
  void *v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  unint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  void *v80;
  void *v81;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v114;
  int v115;
  id obj;
  int v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  _QWORD *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  id v126;
  _BOOL4 v127;
  id v128;
  id v129;
  id v130;
  void *v131;
  _BOOL4 v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  id v155;
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (!objc_opt_class())
  {
    v10 = 0x7FFFFFFFLL;
    goto LABEL_105;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBA2C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBA328]);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBA2C0]);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBA310]);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBA360]);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBA358]);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("pinyinName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("romanjiName"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v8;
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v140 = 0;
  }
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    v141 = 0;
  }
  else
  {
    objc_msgSend(v9, "subarrayWithRange:", 0, objc_msgSend(v9, "count") - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(" "));
    v141 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v139 = 0;
  }
  v125 = v9;
  v122 = a3;
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    v138 = 0;
  }
  else
  {
    objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" "));
    v138 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_msgSend(v7, "length") - 1;
  v14 = objc_msgSend(v149, "length") - 1;
  v15 = objc_msgSend(v150, "length");
  v16 = objc_msgSend(v150, "length");
  v17 = objc_msgSend(v147, "length");
  v18 = objc_msgSend(v146, "length");
  v19 = objc_msgSend(v143, "length");
  v129 = (id)objc_msgSend(v137, "count");
  v148 = v7;
  v20 = v13 <= 0x1C && stringContainsApproximateSubstring(v5, v7);
  v126 = v6;
  v21 = v15 - 1;
  v22 = v14 <= 0x1C && stringContainsApproximateSubstring(v5, v149);
  v23 = v18 - 1;
  v24 = v21 <= 0x1C && stringContainsApproximateSubstring(v5, v150);
  v25 = v17 - 1;
  v132 = v23 <= 0x1C && stringContainsApproximateSubstring(v5, v146);
  v127 = v25 <= 0x1C && stringContainsApproximateSubstring(v5, v147);
  if ((unint64_t)(v16 - 1) > 0x1C)
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(v150, "substringToIndex:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR(" "), "stringByAppendingString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v5, "containsString:", v27);

  }
  if ((unint64_t)(v19 - 1) > 0x1C)
    v29 = 0;
  else
    v29 = stringContainsApproximateSubstring(v5, v141) || stringContainsApproximateSubstring(v5, v140);
  if (v20 && v22)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v7, v149);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v131, "editDistanceFromString:threshold:", v5, 4);
  }
  else
  {
    v131 = 0;
    v30 = 0x7FFFFFFFLL;
  }
  v31 = v143;
  v123 = v30;
  if (v24)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ %@"), v7, v150, v149);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "editDistanceFromString:threshold:", v5, 4);
    v134 = v32;
    v135 = objc_msgSend(v32, "editDistanceFromStringIgnoringSpaces:threshold:", v5, 5);
    if (!v28)
      goto LABEL_43;
LABEL_47:
    v38 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v150, "substringToIndex:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%@ %@ %@"), v7, v39, v149);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = objc_msgSend(v40, "editDistanceFromString:threshold:", v5, 4);
    if (v41 >= v33 && objc_msgSend(v40, "editDistanceFromStringIgnoringSpaces:threshold:", v5, 3) >= v33)
    {
      v43 = v134;
    }
    else
    {
      v42 = v40;

      v33 = v41;
      v43 = v42;
    }
    v51 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v150, "substringToIndex:", 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stringWithFormat:", CFSTR("%@ %@. %@"), v7, v52, v149);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_msgSend(v53, "editDistanceFromString:threshold:", v5, 4);
    if (v54 < v33 || objc_msgSend(v53, "editDistanceFromStringIgnoringSpaces:threshold:", v5, 4) < v33)
    {
      v55 = v53;

      v33 = v54;
      v43 = v55;
    }
    v134 = v43;

    if (v29)
      goto LABEL_44;
    goto LABEL_61;
  }
  v134 = 0;
  v135 = 0x7FFFFFFFLL;
  v33 = 0x7FFFFFFFLL;
  if (v28)
    goto LABEL_47;
LABEL_43:
  if (v29)
  {
LABEL_44:
    v34 = objc_msgSend(v143, "editDistanceFromString:threshold:", v5, 4);
    objc_msgSend(v143, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v143, "length");
    if (v34 <= (unint64_t)(v36 - objc_msgSend(v35, "length")))
      v37 = objc_msgSend(v35, "editDistanceFromString:threshold:", v5, 4);
    else
      v37 = 0x7FFFFFFFLL;
    if (v34 >= 2 && v37 >= 2)
    {
      v44 = v35;
      v45 = v37;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v140, v141);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "editDistanceFromString:threshold:", v5, 4);
      objc_msgSend(v46, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if ((uint64_t)v47 >= v34)
      {
        v47 = v34;
        v49 = v143;
      }
      else
      {
        v49 = v46;

        v50 = objc_msgSend(v49, "length");
        if (v47 <= v50 - objc_msgSend(v48, "length"))
          v45 = objc_msgSend(v48, "editDistanceFromString:threshold:", v5, 4);
      }

      v34 = v47;
      v31 = v49;
      v37 = v45;
      v35 = v44;
    }
    if (v34 >= 2 && v37 >= 2)
    {
      v144 = v35;
      v56 = v37;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v138, v139);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v57, "editDistanceFromString:threshold:", v5, 4);
      if (v59 >= v34)
      {
        v60 = v34;
        v61 = v31;
      }
      else
      {
        v60 = v59;
        v61 = v57;

        v62 = objc_msgSend(v61, "length");
        if (v60 <= v62 - objc_msgSend(v58, "length"))
          v56 = objc_msgSend(v58, "editDistanceFromString:threshold:", v5, 4);
      }

      v34 = v60;
      v31 = v61;
      v37 = v56;
      v35 = v144;
    }
    v120 = v37;
    if (v34 >= 2 && v37 >= 2)
    {
      v63 = v35;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v139, v138);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "editDistanceFromString:threshold:", v5, 4);
      objc_msgSend(v64, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if ((uint64_t)v65 >= v34)
      {
        v65 = v34;
        v67 = v31;
      }
      else
      {
        v67 = v64;

        v68 = objc_msgSend(v67, "length");
        if (v65 <= v68 - objc_msgSend(v66, "length"))
          v120 = objc_msgSend(v66, "editDistanceFromString:threshold:", v5, 4);
      }

      v34 = v65;
      v31 = v67;
      v35 = v63;
    }

    goto LABEL_80;
  }
LABEL_61:
  v120 = 0x7FFFFFFFLL;
  v34 = 0x7FFFFFFFLL;
LABEL_80:
  v145 = v31;
  if (v129)
  {
    v155 = 0;
    v69 = bestMatchInStringCandidates(v137, v5, &v155, 1);
    v70 = v155;
    objc_msgSend(v70, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v70;
    v72 = objc_msgSend(v70, "length");
    if (v69 <= (unint64_t)(v72 - objc_msgSend(v71, "length")))
      v73 = objc_msgSend(v71, "editDistanceFromString:threshold:", v5, 4);
    else
      v73 = 0x7FFFFFFFLL;

  }
  else
  {
    v130 = 0;
    v73 = 0x7FFFFFFFLL;
    v69 = 0x7FFFFFFFLL;
  }
  if (v127 && v132)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v147, v146);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "editDistanceFromString:threshold:", v5, 4);
    objc_msgSend(v74, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v74;
    v77 = objc_msgSend(v74, "length");
    if (v75 <= v77 - objc_msgSend(v76, "length"))
      v78 = objc_msgSend(v76, "editDistanceFromString:threshold:", v5, 4);
    else
      v78 = 0x7FFFFFFFLL;

    v79 = v75 == 0;
  }
  else
  {
    v128 = 0;
    v79 = 0;
    v78 = 0x7FFFFFFFLL;
  }
  if (!v123 || !v33 || !v34 || v79 || !v69)
  {
    *v122 = objc_retainAutorelease(v5);
    v10 = -1;
LABEL_103:
    v6 = v126;
    v81 = v148;
    goto LABEL_104;
  }
  if (v123 == 1)
  {
    v80 = v131;
LABEL_102:
    *v122 = objc_retainAutorelease(v80);
    v10 = 1;
    goto LABEL_103;
  }
  if (v33 == 1)
  {
    v80 = v134;
    goto LABEL_102;
  }
  v10 = v135;
  if (v135 <= 1)
  {
    v83 = v134;
LABEL_112:
    *v122 = objc_retainAutorelease(v83);
    goto LABEL_103;
  }
  if (v34 <= 1)
  {
    *v122 = objc_retainAutorelease(v145);
    v10 = v34;
    goto LABEL_103;
  }
  v10 = v120;
  if (v120 <= 1)
  {
    v83 = v145;
    goto LABEL_112;
  }
  v81 = v148;
  if (v69 <= 1)
  {
    *v122 = objc_retainAutorelease(v130);
    v10 = v69;
LABEL_117:
    v6 = v126;
    goto LABEL_104;
  }
  if (v73 <= 1)
  {
    *v122 = objc_retainAutorelease(v130);
    v10 = v73;
    goto LABEL_117;
  }
  v6 = v126;
  if (v78 <= 1)
  {
    *v122 = objc_retainAutorelease(v128);
    v10 = 1;
    goto LABEL_104;
  }
  objc_msgSend(v5, "uppercaseString");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "componentsSeparatedByString:", CFSTR(" "));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v86 = v85;
  v124 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v151, v156, 16);
  if (!v124)
  {

    v113 = v86;
    goto LABEL_189;
  }
  obj = v86;
  v117 = 0;
  v115 = 0;
  v10 = 0;
  v118 = v5;
  v119 = *(_QWORD *)v152;
  do
  {
    v87 = 0;
    do
    {
      v136 = v10;
      if (*(_QWORD *)v152 != v119)
        objc_enumerationMutation(obj);
      v133 = v87;
      v88 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * v87);
      v89 = objc_msgSend(v88, "editDistanceFromString:threshold:", v81, 4);
      v90 = objc_msgSend(v88, "editDistanceFromString:threshold:", v142, 4);
      v91 = objc_msgSend(v88, "editDistanceFromString:threshold:", v150, 4);
      v92 = objc_msgSend(v88, "editDistanceFromString:threshold:", v149, 4);
      v93 = objc_msgSend(v88, "editDistanceFromString:threshold:", v147, 4);
      v94 = objc_msgSend(v88, "editDistanceFromString:threshold:", v146, 4);
      v95 = objc_msgSend(v88, "editDistanceFromString:threshold:", v140, 4);
      v96 = objc_msgSend(v88, "editDistanceFromString:threshold:", v141, 4);
      v97 = objc_msgSend(v88, "editDistanceFromString:threshold:", v139, 4);
      v98 = objc_msgSend(v88, "editDistanceFromString:threshold:", v138, 4);
      if (v89 >= v90)
        v99 = v90;
      else
        v99 = v89;
      if (v99 >= v91)
        v99 = v91;
      if (v99 >= v92)
        v99 = v92;
      if (v99 >= v93)
        v99 = v93;
      if (v99 >= v94)
        v99 = v94;
      if (v99 >= v95)
        v99 = v95;
      if (v99 >= v96)
        v99 = v96;
      if (v99 >= v97)
        v99 = v97;
      if (v99 >= v98)
        v100 = v98;
      else
        v100 = v99;
      if (v148 && v89 <= 1)
      {
        v101 = v100;
        objc_msgSend(v121, "appendString:", CFSTR(" "));
        v81 = v148;
        objc_msgSend(v121, "appendString:", v148);
        v117 = 1;
        v5 = v118;
LABEL_156:
        v104 = v136;
        v105 = v133;
        goto LABEL_157;
      }
      if (v142 && v90 <= 1)
      {
        v101 = v100;
        objc_msgSend(v121, "appendString:", CFSTR(" "));
        v102 = v121;
        v103 = v142;
        goto LABEL_154;
      }
      if (v150 && v91 <= 1)
      {
        v101 = v100;
        objc_msgSend(v121, "appendString:", CFSTR(" "));
        v102 = v121;
        v103 = v150;
LABEL_154:
        objc_msgSend(v102, "appendString:", v103);
        v117 = 1;
        v5 = v118;
LABEL_155:
        v81 = v148;
        goto LABEL_156;
      }
      v5 = v118;
      if (v140 && v95 <= 1)
      {
        v101 = v100;
        objc_msgSend(v121, "appendString:", CFSTR(" "));
        objc_msgSend(v121, "appendString:", v140);
        v117 = 1;
        goto LABEL_155;
      }
      v81 = v148;
      if (v139 && v97 <= 1)
      {
        v101 = v100;
        objc_msgSend(v121, "appendString:", CFSTR(" "));
        v106 = v121;
        v107 = v139;
LABEL_168:
        objc_msgSend(v106, "appendString:", v107);
        v117 = 1;
        goto LABEL_156;
      }
      if (v147 && v93 <= 1)
      {
        v101 = v100;
        objc_msgSend(v121, "appendString:", CFSTR(" "));
        v106 = v121;
        v107 = v147;
        goto LABEL_168;
      }
      if (v141 && v96 <= 1)
      {
        v101 = v100;
        objc_msgSend(v121, "appendString:", CFSTR(" "));
        v108 = v121;
        v109 = v141;
LABEL_175:
        objc_msgSend(v108, "appendString:", v109);
        v115 = 1;
        goto LABEL_156;
      }
      if (v138 && v98 <= 1)
      {
        v101 = v100;
        objc_msgSend(v121, "appendString:", CFSTR(" "));
        v108 = v121;
        v109 = v138;
        goto LABEL_175;
      }
      v101 = v100;
      v105 = v133;
      if (v146 && v94 <= 1)
      {
        objc_msgSend(v121, "appendString:", CFSTR(" "));
        v110 = v121;
        v111 = v146;
      }
      else
      {
        objc_msgSend(v121, "appendString:", CFSTR(" "));
        if (!v149 || v92 > 1)
        {
          objc_msgSend(v121, "appendString:", v88);
          goto LABEL_184;
        }
        v110 = v121;
        v111 = v149;
      }
      objc_msgSend(v110, "appendString:", v111);
      v115 = 1;
LABEL_184:
      v104 = v136;
LABEL_157:
      v10 = v101 + v104;
      v87 = v105 + 1;
    }
    while (v124 != v87);
    v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, v156, 16);
    v124 = v112;
  }
  while (v112);
  v113 = obj;

  v6 = v126;
  if ((v117 & v115 & 1) != 0)
  {
    objc_msgSend(v121, "deleteCharactersInRange:", 0, 1);
    v114 = objc_retainAutorelease(v121);
    *v122 = v114;

    goto LABEL_104;
  }
LABEL_189:

  v10 = 0x7FFFFFFFLL;
LABEL_104:

LABEL_105:
  return v10;
}

void __closestNameInContacts_block_invoke(_QWORD *a1, void *a2, void *a3, BOOL *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t matched;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v14 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x212B959E0]();
  v9 = (void *)a1[4];
  v15 = 0;
  matched = matchAgainstContact(v9, v7, &v15);
  v11 = v15;
  v12 = v15;
  v13 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (matched < v13)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v11);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = matched;
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
    v13 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
  *a4 = v13 < 1;

  objc_autoreleasePoolPop(v8);
}

BOOL isValidNameString(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  if (objc_msgSend(v1, "rangeOfString:options:", CFSTR("(([\\.\\-\\'\\,\\/])([\\.\\-\\'\\,\\/]))|(\\/)|(\\ \\.)"), 1024) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (unint64_t)objc_msgSend(v2, "length") > 5;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t isNonNameString(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(" "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 >= 2
    && (objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("-")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5 <= 2))
  {
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(&unk_24C5A5088, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(&unk_24C5A5088);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v1, "rangeOfString:", v12) != 0x7FFFFFFFFFFFFFFFLL
            || objc_msgSend(v7, "rangeOfString:", v12) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v6 = 1;
            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(&unk_24C5A5088, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v6 = 0;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v6 = 0;
    }
LABEL_16:

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

id extractBestDateString(void *a1, char a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  id v27;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v5;
  objc_msgSend(v6, "components:fromDate:", 28, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v7, "year");
  v32 = objc_msgSend(v7, "month");
  v29 = v7;
  v8 = objc_msgSend(v7, "year");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v31 = v8 + 15;
    v12 = -2147483647;
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKey:", CFSTR("Year"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        if (v17 <= 99)
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("Year"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "integerValue");

          objc_msgSend(v15, "objectForKey:", CFSTR("Year"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 <= 80)
            v21 = CFSTR("20");
          else
            v21 = CFSTR("19");
          -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v22, "integerValue");

        }
        objc_msgSend(v15, "objectForKey:", CFSTR("Month"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "integerValue");

        if ((a2 & 1) == 0)
        {
          v25 = v24 < v32 && v33 == v17;
          v26 = v33 <= v17 && v17 <= v31;
          if (!v26 || v25)
            continue;
        }
        if (v17 > v12)
        {
          v27 = v15;

          v11 = v27;
          v12 = v17;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id extractValidDateStrings(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  NSUInteger v55;
  NSUInteger v56;
  NSUInteger v57;
  NSUInteger v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSUInteger v80;
  NSUInteger v81;
  NSUInteger v82;
  NSUInteger v83;
  NSRange v84;
  NSUInteger v85;
  NSRange v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  id v95;
  int v96;
  id obj;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  int v107;
  void *v108;
  void *v109;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  _OWORD v129[6];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;
  NSRange v134;
  NSRange v135;
  NSRange v136;
  NSRange v137;
  NSRange v138;

  v133 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(0[1-9]|[12][0-9]|3[01])([\\-\\/\\.])(0[1-9]|1[012])\\2(\\d\\d)"), 0, &v128);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v128;
  objc_msgSend(v3, "addObject:", v4);

  v127 = v5;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(0[1-9]|1[012])([\\-\\/\\.])(0[1-9]|[12][0-9]|3[01])\\2(\\d\\d)"), 0, &v127);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v127;

  objc_msgSend(v3, "addObject:", v6);
  v126 = v7;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(0[1-9]|1[012])([\\-\\/\\.])((?:20)?\\d\\d)"), 0, &v126);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v126;

  objc_msgSend(v3, "addObject:", v8);
  v125 = v9;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(0[1-9]|[12][0-9]|3[01])?(JAN|FEB|MAR|APR|MAY|JUN|JLY|AUG|SEP|OCT|NOV|DEC)(\\d\\d)"), 0, &v125);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v125;

  objc_msgSend(v3, "addObject:", v10);
  v124 = v11;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?<![\\/])(20\\d\\d)([\\-\\/\\.])(0[1-9]|1[012])(?![\\/])"), 0, &v124);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v124;

  objc_msgSend(v3, "addObject:", v12);
  v123 = v13;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(0[1-9]|1[012])([\\-\\/\\.])(\\d)(\\d\\d)"), 0, &v123);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v123;

  objc_msgSend(v3, "addObject:", v14);
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v3;
  v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
  if (v99)
  {
    v15 = 0;
    v98 = *(_QWORD *)v120;
    v101 = v1;
    v102 = v2;
    do
    {
      v16 = 0;
      v96 = v15;
      v107 = v15;
      do
      {
        if (*(_QWORD *)v120 != v98)
          objc_enumerationMutation(obj);
        v100 = v16;
        objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * v16), "matchesInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = 0u;
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        v106 = v17;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v116;
          v104 = *(_QWORD *)v116;
          do
          {
            v21 = 0;
            v105 = v19;
            do
            {
              if (*(_QWORD *)v116 != v20)
                objc_enumerationMutation(v106);
              v22 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v21);
              if (objc_msgSend(v22, "range") != 0x7FFFFFFFFFFFFFFFLL)
              {
                v110 = v21;
                v23 = objc_msgSend(v22, "rangeAtIndex:", 0);
                objc_msgSend(v1, "substringWithRange:", v23, v24);
                v25 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = (void *)MEMORY[0x24BDD1968];
                v108 = v22;
                v28 = objc_msgSend(v22, "rangeAtIndex:", 0);
                objc_msgSend(v27, "valueWithRange:", v28, v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v109 = (void *)v25;
                switch(v107)
                {
                  case 0:
                    objc_msgSend(v26, "setObject:forKey:", v25, CFSTR("Result"));
                    v31 = objc_msgSend(v22, "rangeAtIndex:", objc_msgSend(v22, "numberOfRanges") - 1);
                    objc_msgSend(v1, "substringWithRange:", v31, v32);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setObject:forKey:", v33, CFSTR("Year"));
                    v34 = objc_msgSend(v22, "rangeAtIndex:", 3);
                    objc_msgSend(v1, "substringWithRange:", v34, v35);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setObject:forKey:", v36, CFSTR("Month"));
                    v37 = objc_msgSend(v22, "rangeAtIndex:", 1);
                    objc_msgSend(v1, "substringWithRange:", v37, v38);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = v26;
                    v41 = v39;
                    v42 = CFSTR("Day");
                    goto LABEL_37;
                  case 1:
                    objc_msgSend(v26, "setObject:forKey:", v25, CFSTR("Result"));
                    v70 = objc_msgSend(v22, "rangeAtIndex:", objc_msgSend(v22, "numberOfRanges") - 1);
                    objc_msgSend(v1, "substringWithRange:", v70, v71);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setObject:forKey:", v33, CFSTR("Year"));
                    v72 = objc_msgSend(v22, "rangeAtIndex:", 3);
                    objc_msgSend(v1, "substringWithRange:", v72, v73);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setObject:forKey:", v36, CFSTR("Day"));
                    v74 = objc_msgSend(v22, "rangeAtIndex:", 1);
                    objc_msgSend(v1, "substringWithRange:", v74, v75);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = v26;
                    v41 = v39;
                    v42 = CFSTR("Month");
LABEL_37:
                    objc_msgSend(v40, "setObject:forKey:", v41, v42);
                    objc_msgSend(v26, "setObject:forKey:", v30, CFSTR("substringRange"));

                    goto LABEL_42;
                  case 2:
                    v103 = v26;
                    v113 = 0u;
                    v114 = 0u;
                    v111 = 0u;
                    v112 = 0u;
                    v47 = v2;
                    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
                    if (v48)
                    {
                      v49 = v48;
                      v50 = 0;
                      v51 = *(_QWORD *)v112;
                      do
                      {
                        for (i = 0; i != v49; ++i)
                        {
                          if (*(_QWORD *)v112 != v51)
                            objc_enumerationMutation(v47);
                          objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * i), "objectForKey:", CFSTR("substringRange"));
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          v54 = v53;
                          if (v53)
                          {
                            v55 = objc_msgSend(v53, "rangeValue");
                            v57 = v56;
                            v136.location = objc_msgSend(v30, "rangeValue");
                            v136.length = v58;
                            v134.location = v55;
                            v134.length = v57;
                            v50 |= NSIntersectionRange(v134, v136).length != 0;
                          }

                        }
                        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
                      }
                      while (v49);

                      v1 = v101;
                      v2 = v102;
                      v20 = v104;
                      v19 = v105;
                      v59 = v103;
                      if ((v50 & 1) != 0)
                        goto LABEL_45;
                    }
                    else
                    {

                      v59 = v26;
                    }
                    v80 = objc_msgSend(v108, "rangeAtIndex:", 1);
                    v82 = v81;
                    v137.location = objc_msgSend(v108, "rangeAtIndex:", 2);
                    v137.length = v83;
                    v135.location = v80;
                    v135.length = v82;
                    v84 = NSUnionRange(v135, v137);
                    v138.location = objc_msgSend(v108, "rangeAtIndex:", 3);
                    v138.length = v85;
                    v86 = NSUnionRange(v84, v138);
                    objc_msgSend(v1, "substringWithRange:", v86.location, v86.length);
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "setObject:forKey:", v87, CFSTR("Result"));

                    v88 = objc_msgSend(v108, "rangeAtIndex:", objc_msgSend(v108, "numberOfRanges") - 1);
                    objc_msgSend(v1, "substringWithRange:", v88, v89);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "setObject:forKey:", v33, CFSTR("Year"));
                    v90 = objc_msgSend(v108, "rangeAtIndex:", 1);
                    objc_msgSend(v1, "substringWithRange:", v90, v91);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "setObject:forKey:", v36, CFSTR("Month"));
                    v26 = v59;
LABEL_42:

                    v20 = v104;
                    v19 = v105;
LABEL_43:
                    objc_msgSend(v26, "objectForKey:", CFSTR("Result"));
                    v92 = (void *)objc_claimAutoreleasedReturnValue();

                    v59 = v26;
                    if (v92)
                      objc_msgSend(v2, "addObject:", v26);
LABEL_45:

                    v21 = v110;
                    break;
                  case 3:
                    objc_msgSend(v26, "setObject:forKey:", v25, CFSTR("Result"));
                    v60 = objc_msgSend(v22, "rangeAtIndex:", objc_msgSend(v22, "numberOfRanges") - 1);
                    objc_msgSend(v1, "substringWithRange:", v60, v61);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setObject:forKey:", v33, CFSTR("Year"));
                    v62 = objc_msgSend(v22, "rangeAtIndex:", objc_msgSend(v22, "numberOfRanges") - 2);
                    objc_msgSend(v1, "substringWithRange:", v62, v63);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = 0;
                    v129[2] = xmmword_24C58B510;
                    v129[3] = *(_OWORD *)&off_24C58B520;
                    v129[4] = xmmword_24C58B530;
                    v129[5] = *(_OWORD *)off_24C58B540;
                    v129[0] = xmmword_24C58B4F0;
                    v129[1] = *(_OWORD *)&off_24C58B500;
                    do
                    {
                      if ((objc_msgSend(v36, "isEqualToString:", *((_QWORD *)v129 + v64)) & 1) != 0)
                      {
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02i"), ++v64);
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "setObject:forKey:", v65, CFSTR("Month"));

                      }
                      else
                      {
                        ++v64;
                      }
                    }
                    while (v64 != 12);
                    v66 = objc_msgSend(v108, "rangeAtIndex:", 1);
                    v1 = v101;
                    if (v66 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      objc_msgSend(v101, "substringWithRange:", v66, v67);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "setObject:forKey:", v68, CFSTR("Day"));

                    }
                    v69 = 88;
                    v2 = v102;
                    do
                    {

                      v69 -= 8;
                    }
                    while (v69 != -8);
                    goto LABEL_42;
                  case 4:
                    objc_msgSend(v26, "setObject:forKey:", v25, CFSTR("Result"));
                    v43 = objc_msgSend(v22, "rangeAtIndex:", 1);
                    objc_msgSend(v1, "substringWithRange:", v43, v44);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setObject:forKey:", v33, CFSTR("Year"));
                    v45 = v22;
                    v46 = 3;
                    goto LABEL_39;
                  case 5:
                    objc_msgSend(v26, "setObject:forKey:", v25, CFSTR("Result"));
                    v76 = objc_msgSend(v22, "rangeAtIndex:", 4);
                    objc_msgSend(v1, "substringWithRange:", v76, v77);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setObject:forKey:", v33, CFSTR("Year"));
                    v45 = v22;
                    v46 = 1;
LABEL_39:
                    v78 = objc_msgSend(v45, "rangeAtIndex:", v46);
                    objc_msgSend(v1, "substringWithRange:", v78, v79);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setObject:forKey:", v36, CFSTR("Month"));
                    goto LABEL_42;
                  default:
                    goto LABEL_43;
                }
              }
              ++v21;
            }
            while (v21 != v19);
            v19 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
          }
          while (v19);
        }
        ++v107;

        v16 = v100 + 1;
      }
      while (v100 + 1 != v99);
      v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
      v15 = v96 + v99;
      v99 = v93;
    }
    while (v93);
  }

  return v2;
}

id computeReferenceDateFromString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "length"))
  {
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
    v3 = objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = objc_msgSend(&unk_24C5A50A0, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
LABEL_5:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(&unk_24C5A50A0);
        objc_msgSend(v4, "setDateFormat:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8));
        objc_msgSend(v4, "dateFromString:", v3);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(&unk_24C5A50A0, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v6)
            goto LABEL_5;
          goto LABEL_15;
        }
      }
      v11 = (void *)v9;
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:", 28, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "year") >= 1981)
      {

      }
      else
      {
        objc_msgSend(v13, "setYear:", objc_msgSend(v13, "year") + 100);
        objc_msgSend(v12, "dateFromComponents:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v14;
        if (!v14)
          goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "components:fromDate:", 12, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setYear:", objc_msgSend(v16, "year") - 7);
      objc_msgSend(v15, "dateFromComponents:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v17;
    }
    else
    {
LABEL_15:
      fwrite("\nCould not extract date from ground truth. Using current date", 0x3DuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }

    v2 = (void *)v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t checkPartialCodePrefix(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v17[0] = &unk_24C5A5280;
  v17[1] = &unk_24C5A5298;
  v18[0] = &unk_24C5A50B8;
  v18[1] = &unk_24C5A50D0;
  v17[2] = &unk_24C5A52B0;
  v17[3] = &unk_24C5A52C8;
  v18[2] = &unk_24C5A50E8;
  v18[3] = &unk_24C5A5100;
  v17[4] = &unk_24C5A52E0;
  v17[5] = &unk_24C5A52F8;
  v18[4] = &unk_24C5A5118;
  v18[5] = &unk_24C5A5130;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

uint64_t checkCodePrefix(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = checkPartialCodePrefix(v1, objc_msgSend(v1, "length"));

  return v2;
}

id extractExpirationDateResults(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  void *v32;
  void *v33;
  float v34;
  double v35;
  void *v36;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.CoreRecognition.disable_year_check"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    extractValidDateStrings(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || !objc_msgSend(v10, "count"))
    {
      objc_msgSend(v3, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      extractValidDateStrings(v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }
    objc_msgSend(v3, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("expfull"));

    extractBestDateString(v10, v7, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("Result"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length") == 6)
      {
        objc_msgSend(v17, "stringByReplacingCharactersInRange:withString:", 3, 1, &stru_24C599708);
        v18 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v18;
      }
      objc_msgSend(v8, "setObject:forKey:", v17, CFSTR("expirationDate"));
      objc_msgSend(v16, "objectForKey:", CFSTR("Year"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v19, CFSTR("expirationYear"));

      objc_msgSend(v16, "objectForKey:", CFSTR("Month"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v16, "objectForKey:", CFSTR("Month"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v21, CFSTR("expirationMonth"));

      }
      objc_msgSend(v16, "objectForKey:", CFSTR("Day"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v16, "objectForKey:", CFSTR("Day"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v23, CFSTR("expirationDay"));

      }
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("expDateAccepted"));
      objc_msgSend(v3, "objectAtIndex:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", CFSTR("Result"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "rangeOfString:", v26);

      if ((unint64_t)objc_msgSend(v3, "count") >= 2)
      {
        objc_msgSend(v3, "objectAtIndex:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndex:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v29, CFSTR("dateOffset"));

        if ((unint64_t)objc_msgSend(v3, "count") < 3)
        {
          v31 = 300.0;
        }
        else
        {
          objc_msgSend(v3, "objectAtIndex:", 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (float)objc_msgSend(v30, "integerValue");

        }
        objc_msgSend(v3, "objectAtIndex:", 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndex:", v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (float)objc_msgSend(v33, "integerValue") / v31;

        *(float *)&v35 = v34;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v36, CFSTR("normalizedDateOffset"));

      }
    }

  }
  return v8;
}

id extractCardholderNameResults(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  void *v33;
  void *v34;
  float v35;
  double v36;
  void *v37;
  id v39;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      v39 = 0;
      v12 = closestNameInContacts(v11, &v39, v6, v7);
      v13 = v39;
      v14 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v11);
      objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("nameResult"));

      if ((unint64_t)objc_msgSend(v5, "count") >= 2)
      {
        objc_msgSend(v5, "objectAtIndex:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("nameOffset"));

        if ((unint64_t)objc_msgSend(v5, "count") < 3)
        {
          v18 = 300.0;
        }
        else
        {
          objc_msgSend(v5, "objectAtIndex:", 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (float)objc_msgSend(v17, "integerValue");

        }
        objc_msgSend(v5, "objectAtIndex:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (float)objc_msgSend(v20, "integerValue") / v18;

        *(float *)&v22 = v21;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v23, CFSTR("normalizedNameOffset"));

      }
      if (v13)
      {
        v24 = (int)objc_msgSend(v13, "length") / 3;
        v25 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v13);
        objc_msgSend(v8, "setObject:forKey:", v25, CFSTR("closestNameMatch"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v26, CFSTR("closestNameDistance"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v27, CFSTR("minMatchDistance"));

        if (v12 <= v24)
        {
          if (v12 < 0)
            objc_msgSend(v8, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("nameAccepted"));
          v28 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v13);
          objc_msgSend(v8, "setObject:forKey:", v28, CFSTR("cardholderName"));

          if ((unint64_t)objc_msgSend(v5, "count") >= 2)
          {
            objc_msgSend(v5, "objectAtIndex:", 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectAtIndex:", 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v30, CFSTR("nameOffset"));

            if ((unint64_t)objc_msgSend(v5, "count") < 3)
            {
              v32 = 300.0;
            }
            else
            {
              objc_msgSend(v5, "objectAtIndex:", 2);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (float)objc_msgSend(v31, "integerValue");

            }
            objc_msgSend(v5, "objectAtIndex:", 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectAtIndex:", 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (float)objc_msgSend(v34, "integerValue") / v32;

            *(float *)&v36 = v35;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v37, CFSTR("normalizedNameOffset"));

          }
        }
      }

    }
  }

  return v8;
}

id extractCardNumberResults(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    extractCardCode(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("code");
    if (v6)
    {
      objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("code"));
      v8 = (void *)MEMORY[0x24BDBD1C8];
      v7 = CFSTR("accepted");
      v9 = v2;
    }
    else
    {
      v9 = v2;
      v8 = v5;
    }
    objc_msgSend(v9, "setObject:forKey:", v8, v7);

  }
  return v2;
}

id extractCardCode(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.CoreRecognition.disable_prefix_check"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length")
    || objc_msgSend(v5, "length") != 16
    || !checkCardCode(v5)
    || (v4 & 1) == 0 && !checkCodePrefix(v5))
  {
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length")
      && objc_msgSend(v6, "length") == 15
      && checkCardCode(v6)
      && ((v4 & 1) != 0 || checkCodePrefix(v6)))
    {
      v8 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C5A5178);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "substringToIndex:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

      if (v11)
        v12 = 6;
      else
        v12 = 10;
      if (v11)
        v13 = 11;
      else
        v13 = 4;
      objc_msgSend(v8, "insertString:atIndex:", CFSTR(" "), v12);
      objc_msgSend(v8, "insertString:atIndex:", CFSTR(" "), v13);
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = v8;
    }
    else
    {
      objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v8, "length") < 0x11
        || (unint64_t)objc_msgSend(v8, "length") > 0x13
        || !checkCardCode(v8)
        || (v4 & 1) == 0 && !checkCodePrefix(v8))
      {
        objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length") != 12 && objc_msgSend(v9, "length") != 11)
          goto LABEL_40;
        if (objc_msgSend(v9, "length") == 12
          && objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 3) != 32
          || objc_msgSend(v9, "length") == 11
          && objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 2) != 32)
        {
          v7 = 0;
          goto LABEL_55;
        }
        if ((objc_msgSend(v9, "length") != 11 || objc_msgSend(v9, "characterAtIndex:", 10) == 49)
          && (objc_msgSend(v9, "substringWithRange:", 0, 10),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = checkCardCode(v16),
              v16,
              v17))
        {
          v18 = (void *)objc_msgSend(v9, "mutableCopy");
          if (objc_msgSend(v9, "length") == 12)
          {
            objc_msgSend(v18, "insertString:atIndex:", CFSTR(" "), 10);
            objc_msgSend(v18, "insertString:atIndex:", CFSTR(" "), 7);
            objc_msgSend(v18, "insertString:atIndex:", CFSTR(" "), 3);
          }
          if (objc_msgSend(v9, "length") == 11)
          {
            objc_msgSend(v18, "insertString:atIndex:", CFSTR(" "), 10);
            objc_msgSend(v18, "insertString:atIndex:", CFSTR(" "), 9);
            objc_msgSend(v18, "insertString:atIndex:", CFSTR(" "), 6);
            objc_msgSend(v18, "insertString:atIndex:", CFSTR(" "), 3);
          }
          v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v18);
        }
        else
        {
LABEL_40:
          objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "length") == 14
            && checkCardCode(v18)
            && ((v4 & 1) != 0 || checkCodePrefix(v18)))
          {
            v19 = (void *)objc_msgSend(v18, "mutableCopy");
            objc_msgSend(v19, "insertString:atIndex:", CFSTR(" "), 10);
            objc_msgSend(v19, "insertString:atIndex:", CFSTR(" "), 4);
            v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v19);
          }
          else
          {
            objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "length") == 13 && objc_msgSend(v1, "rangeOfString:", CFSTR(" ")) == 4)
            {
              objc_msgSend(CFSTR("589297"), "stringByAppendingString:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (checkCardCode(v20))
              {
                v21 = (void *)objc_msgSend(v20, "mutableCopy");
                objc_msgSend(v21, "insertString:atIndex:", CFSTR(" "), 16);
                objc_msgSend(v21, "insertString:atIndex:", CFSTR(" "), 13);
                objc_msgSend(v21, "insertString:atIndex:", CFSTR(" "), 10);
                objc_msgSend(v21, "insertString:atIndex:", CFSTR(" "), 6);
                v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v21);

              }
              else
              {
                v7 = 0;
              }
              v19 = v20;
            }
            else
            {
              v7 = 0;
            }
          }

        }
        goto LABEL_55;
      }
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = v9;
    }
    v7 = (void *)objc_msgSend(v14, "_newZStringWithString:", v15);
LABEL_55:

    goto LABEL_56;
  }
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "insertString:atIndex:", CFSTR(" "), 12);
  objc_msgSend(v6, "insertString:atIndex:", CFSTR(" "), 8);
  objc_msgSend(v6, "insertString:atIndex:", CFSTR(" "), 4);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v6);
LABEL_56:

  return v7;
}

BOOL isValidCodeLocation(void *a1, char a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  void *v11;
  uint64_t v12;
  CGRect v14;
  CGRect v15;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12 != 12)
    return 1;
  if ((a2 & 1) != 0)
    return 0;
  v14.origin.y = 0.2;
  v14.size.height = 0.6;
  v14.origin.x = 0.0;
  v14.size.width = 1.0;
  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  return CGRectContainsRect(v14, v15);
}

uint64_t isValidNameLocationForCode(void *a1, double a2, double a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(&unk_24C5A5148, "arrayByAddingObjectsFromArray:", &unk_24C5A5160, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v8 |= objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);

    v11 = v8 ^ 1 | (a3 < 14.53);
  }
  else
  {

    v11 = 1;
  }

  return v11 & 1;
}

BOOL checkCardCode(void *a1)
{
  id v1;
  _BOOL8 v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  int v9;
  int v10;
  unint64_t v11;
  signed int v12;
  unint64_t v13;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") >= 0xA && (unint64_t)objc_msgSend(v1, "length") <= 0x13)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C5A51C0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "containsObject:", v1) & 1) != 0
      || (v4 = objc_retainAutorelease(v1), v5 = objc_msgSend(v4, "UTF8String"), !objc_msgSend(v4, "length")))
    {
LABEL_9:
      v2 = 0;
    }
    else
    {
      v6 = 0;
      while (*(_BYTE *)(v5 + v6) == 48)
      {
        if (objc_msgSend(v4, "length") <= (unint64_t)++v6)
          goto LABEL_9;
      }
      v8 = objc_msgSend(v4, "length");
      v9 = objc_msgSend(v4, "length");
      if (v9 < 1)
      {
        v2 = 1;
      }
      else
      {
        v10 = 0;
        v11 = v9 + 1;
        do
        {
          LOBYTE(v12) = *(_BYTE *)(v5 + (v11 - 2)) - 48;
          if (((((_DWORD)v11 - 2) ^ v8) & 1) == 0)
          {
            v12 = (char)(2 * v12);
            if (v12 >= 10)
              v12 = v12 - 10 * (v12 / 0xAu) + v12 / 0xAu;
          }
          v10 += (char)v12;
          --v11;
        }
        while (v11 > 1);
        HIDWORD(v13) = -858993459 * v10 + 429496728;
        LODWORD(v13) = HIDWORD(v13);
        v2 = (v13 >> 1) < 0x19999999;
      }
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id extractCardCodeHK(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length") == 13 && objc_msgSend(v1, "characterAtIndex:", 3) == 32)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v3 = objc_msgSend(&unk_24C5A5190, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(&unk_24C5A5190);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "stringByAppendingString:", v2);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (checkCardCode(v7))
          {
            v13 = (void *)objc_msgSend(v7, "mutableCopy");
            objc_msgSend(v13, "insertString:atIndex:", CFSTR(" "), 18);
            v14 = v13;
            v15 = 15;
            goto LABEL_26;
          }

        }
        v4 = objc_msgSend(&unk_24C5A5190, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        v8 = 0;
        if (v4)
          continue;
        goto LABEL_27;
      }
    }
LABEL_23:
    v8 = 0;
    goto LABEL_27;
  }
  if (objc_msgSend(v2, "length") != 11)
    goto LABEL_23;
  if (objc_msgSend(v1, "characterAtIndex:", 3) != 32)
    goto LABEL_23;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(&unk_24C5A51A8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (!v9)
    goto LABEL_23;
  v10 = v9;
  v11 = *(_QWORD *)v18;
  while (2)
  {
    for (j = 0; j != v10; ++j)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(&unk_24C5A51A8);
      objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "stringByAppendingString:", v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (checkCardCode(v7))
      {
        v13 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v13, "insertString:atIndex:", CFSTR(" "), 16);
        v14 = v13;
        v15 = 10;
LABEL_26:
        objc_msgSend(v14, "insertString:atIndex:", CFSTR(" "), v15);
        objc_msgSend(v13, "insertString:atIndex:", CFSTR(" "), 9);
        objc_msgSend(v13, "insertString:atIndex:", CFSTR(" "), 6);
        v8 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v13);

        goto LABEL_27;
      }

    }
    v10 = objc_msgSend(&unk_24C5A51A8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    v8 = 0;
    if (v10)
      continue;
    break;
  }
LABEL_27:

  return v8;
}

id enrichedNumbersListHK(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  BOOL v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  BOOL v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  void *v35;
  id v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v37 = (id)objc_msgSend(v1, "mutableCopy");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v41;
    v38 = v2;
    v39 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v41 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v7, "length") >= 0xC && (unint64_t)objc_msgSend(v8, "length") >= 0xA)
        {
          v9 = objc_msgSend(v7, "length");
          if (objc_msgSend(v7, "length"))
            v10 = v9 == 0;
          else
            v10 = 1;
          if (!v10)
          {
            v11 = 0;
            while (1)
            {
              v12 = objc_msgSend(v7, "rangeOfString:options:range:", CFSTR(" "), 0, v11, v9);
              if (v12 > 0xA || ((1 << v12) & 0x428) == 0)
                break;
              v11 = v12 + 1;
              v9 = objc_msgSend(v7, "length") + ~v12;
              if (v11 >= objc_msgSend(v7, "length") || v9 == 0)
                goto LABEL_24;
            }
            if (v12 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v37, "removeObject:", v7);
              v5 = v39;
              goto LABEL_58;
            }
          }
LABEL_24:
          v15 = (void *)objc_msgSend(v7, "copy");
          v16 = objc_msgSend(v7, "characterAtIndex:", 3);
          if (v16 > 0x37)
            goto LABEL_57;
          v17 = v16;
          if (((1 << v16) & 0x81000100000000) == 0)
            goto LABEL_57;
          if ((unint64_t)objc_msgSend(v15, "length") >= 0xC
            && objc_msgSend(v15, "rangeOfString:", CFSTR(" ")) == 5)
          {
            if ((unint64_t)objc_msgSend(v15, "length") >= 0xD)
            {
              objc_msgSend(v15, "substringToIndex:", 12);
              v18 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v18;
            }
            objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "length");

            v21 = v20 >= 0xA;
            goto LABEL_49;
          }
          if ((unint64_t)objc_msgSend(v15, "length") <= 0xD)
          {
            v22 = objc_msgSend(v15, "characterAtIndex:", 5);
            if (v22 <= 0x39 && ((1 << v22) & 0x228000000000000) != 0)
            {
              objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", 5, 1, CFSTR(" "));
              v23 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v23;
            }
            objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "length");

            v26 = v25 > 9;
            v2 = v38;
            if (!v26)
              goto LABEL_57;
LABEL_51:
            if (v17 == 55 || v17 == 48)
            {
              objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", 3, 1, CFSTR(" "));
              v32 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v32;
            }
            objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "length");

            if (v34 >= 0xA && (objc_msgSend(v37, "containsObject:", v15) & 1) == 0)
            {
              v35 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v15);
              objc_msgSend(v37, "addObject:", v35);

            }
LABEL_57:

            v5 = v39;
            goto LABEL_58;
          }
          if ((unint64_t)objc_msgSend(v15, "length") < 0xE)
            goto LABEL_57;
          v27 = objc_msgSend(v15, "characterAtIndex:", 10);
          if (v27 <= 50)
          {
            if (v27 != 32)
            {
              if (v27 != 48)
                goto LABEL_57;
LABEL_45:
              objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", 10, 1, CFSTR(" "));
              v28 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v28;
            }
            if ((unint64_t)objc_msgSend(v15, "length") >= 0xF)
            {
              objc_msgSend(v15, "substringToIndex:", 14);
              v29 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v29;
            }
            objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "length");

            v21 = v31 >= 0xC;
LABEL_49:
            v2 = v38;
            if (v21)
              goto LABEL_51;
            goto LABEL_57;
          }
          if (v27 != 55 && v27 != 51)
            goto LABEL_57;
          goto LABEL_45;
        }
LABEL_58:

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v4);
  }

  return v37;
}

void sortOverlappingCALayers(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  int v43;
  double v44;
  unint64_t v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  double v51;
  double v52;
  double v53;
  BOOL v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  float v60;
  int v61;
  double v62;
  double v63;
  double v64;
  unint64_t i;
  void *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  unint64_t v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  int v84;
  double v85;
  double v86;
  double v87;
  id v88;
  id v89;
  unint64_t v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  double v106;
  CGFloat v107;
  void *v108;
  unint64_t v109;
  void *v110;
  unint64_t v111;
  void *v112;
  unint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  CGFloat v125;
  unint64_t v126;
  void *v127;
  void *v128;
  unint64_t v129;
  void *v130;
  unint64_t v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  unint64_t v137;
  void *v138;
  void *v139;
  double v140;
  uint64_t v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  void *v169;
  void *v170;
  id v171;
  id v172;
  double v173;
  void *v174;
  CGFloat rect2;
  void *rect2a;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  CGRect v181;
  void *v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;

  v172 = a1;
  v171 = a2;
  v9 = 0;
  v10 = 0;
  v11 = 2 * objc_msgSend(v172, "count");
  v12 = a4 + a6;
  do
  {
    v177 = v11;
    v13 = v10;
    v14 = v9;
    *(_QWORD *)&v181.size.height = v9;
    v182 = v10;
    sortLayersWithYCoordinate(v172, v171, &v182, (void **)&v181.size.height);
    v10 = v182;

    v9 = *(id *)&v181.size.height;
    objc_msgSend(v10, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16;
    objc_msgSend(v15, "frame");
    v19 = v12 - (v17 + v18);
    if (v19 < 0.0)
    {
      objc_msgSend(v15, "position");
      v21 = v20;
      objc_msgSend(v15, "position");
      objc_msgSend(v15, "setPosition:", v21, v19 + v22);
    }
    v179 = v15;
    v23 = objc_msgSend(v10, "count");
    if (v23 < 2)
    {
LABEL_20:

      break;
    }
    v24 = v23;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndex:", v24 - 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v24 - 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v24 - 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "unsignedIntegerValue");

      objc_msgSend(v9, "objectAtIndex:", v24 - 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedIntegerValue");

      *(_QWORD *)&v181.origin.x = v25;
      objc_msgSend(v25, "frame");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      objc_msgSend(v26, "frame");
      v189.origin.x = v39;
      v189.origin.y = v40;
      v189.size.width = v41;
      v189.size.height = v42;
      v183.origin.x = v32;
      v183.origin.y = v34;
      v183.size.width = v36;
      v183.size.height = v38;
      v184 = CGRectIntersection(v183, v189);
      *(float *)&v184.origin.x = v184.size.height;
      v43 = vcvtps_s32_f32(*(float *)&v184.origin.x);
      if (v43 >= 1)
        break;
LABEL_15:

      v54 = v24-- <= 2;
      if (v54)
        goto LABEL_20;
    }
    if (v28 < v30)
    {
      if (objc_msgSend(v10, "count") > (unint64_t)(v24 - 1))
      {
        v44 = (double)v43;
        v45 = v24;
        while (1)
        {
          objc_msgSend(v10, "objectAtIndex:", v45 - 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndex:", v45 - 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "unsignedIntegerValue");

          if (objc_msgSend(v10, "count") > v45)
          {
            objc_msgSend(v9, "objectAtIndex:", v45);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "unsignedIntegerValue");

            if (v50 < v48)
              break;
          }
          objc_msgSend(v46, "position");
          v52 = v51;
          objc_msgSend(v46, "position");
          objc_msgSend(v46, "setPosition:", v52, v53 + v44);

          v54 = objc_msgSend(v10, "count") > v45++;
          if (!v54)
            goto LABEL_15;
        }

      }
      goto LABEL_15;
    }
    objc_msgSend(*(id *)&v181.origin.x, "position");
    v56 = v55;
    objc_msgSend(*(id *)&v181.origin.x, "position");
    objc_msgSend(*(id *)&v181.origin.x, "setPosition:", v56, v57 - (double)v43);

    v11 = v177 - 1;
  }
  while (v177 != 1);
  objc_msgSend(v10, "firstObject");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "frame");
  v60 = a4 - v59;
  v61 = vcvtps_s32_f32(v60);
  if (v61 >= 1)
  {
    objc_msgSend(v58, "position");
    v63 = v62;
    objc_msgSend(v58, "position");
    objc_msgSend(v58, "setPosition:", v63, v64 + (double)v61);
  }
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    for (i = 1; objc_msgSend(v10, "count") > i; ++i)
    {
      objc_msgSend(v10, "objectAtIndex:", i - 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", i);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", i - 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "unsignedIntegerValue");

      objc_msgSend(v9, "objectAtIndex:", i);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "unsignedIntegerValue");

      objc_msgSend(v66, "frame");
      v73 = v72;
      v75 = v74;
      v77 = v76;
      v79 = v78;
      objc_msgSend(v67, "frame");
      v190.origin.x = v80;
      v190.origin.y = v81;
      v190.size.width = v82;
      v190.size.height = v83;
      v185.origin.x = v73;
      v185.origin.y = v75;
      v185.size.width = v77;
      v185.size.height = v79;
      v186 = CGRectIntersection(v185, v190);
      *(float *)&v186.origin.x = v186.size.height;
      v84 = vcvtps_s32_f32(*(float *)&v186.origin.x);
      if (v84 >= 1)
      {
        if (v71 < v69)
        {

          break;
        }
        objc_msgSend(v67, "position");
        v86 = v85;
        objc_msgSend(v67, "position");
        objc_msgSend(v67, "setPosition:", v86, v87 + (double)v84);
      }

    }
  }
  *(_QWORD *)&v181.origin.y = v9;
  *(_QWORD *)&v181.size.width = v10;
  sortLayersWithYCoordinate(v172, v171, (void **)&v181.size, (void **)&v181.origin.y);
  v88 = *(id *)&v181.size.width;

  v89 = *(id *)&v181.origin.y;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = v89;
  if (objc_msgSend(v88, "count"))
  {
    v90 = 0;
    v173 = a6 + 1.79769313e308 - a4;
    do
    {
      v91 = -1.79769313e308;
      v92 = INFINITY;
      v93 = -1.79769313e308;
      v94 = 1.79769313e308 - a4;
      if (v90)
      {
        objc_msgSend(v88, "objectAtIndex:", (v90 - 1));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "frame");
        v93 = v96;
        v91 = v97;
        v92 = v98;
        v94 = v99;

      }
      objc_msgSend(v88, "objectAtIndex:", v90);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v88, "count") - 1 <= v90)
      {
        v181.origin.x = -1.79769313e308;
        rect2 = INFINITY;
        v107 = v173;
        v104 = v12;
        if (v90)
        {
LABEL_37:
          objc_msgSend(v89, "objectAtIndex:", (v90 - 1));
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v108, "unsignedIntegerValue");

          goto LABEL_40;
        }
      }
      else
      {
        objc_msgSend(v88, "objectAtIndex:", v90 + 1);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "frame");
        v181.origin.x = v102;
        v104 = v103;
        rect2 = v105;
        v107 = v106;

        if (v90)
          goto LABEL_37;
      }
      v109 = -1;
LABEL_40:
      objc_msgSend(v89, "objectAtIndex:", v90);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend(v110, "unsignedIntegerValue");

      if (objc_msgSend(v89, "count") - 1 <= v90)
      {
        v113 = -1;
      }
      else
      {
        objc_msgSend(v89, "objectAtIndex:", v90 + 1);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend(v112, "unsignedIntegerValue");

      }
      if (v109 == -1 || v111 > v109)
      {
        objc_msgSend(v100, "frame");
        v191.origin.x = v93;
        v191.origin.y = v91;
        v191.size.width = v92;
        v191.size.height = v94;
        if (CGRectIntersectsRect(v187, v191))
          goto LABEL_49;
      }
      if (v113 == -1 || v111 >= v113)
      {
        objc_msgSend(v100, "frame");
        v192.origin.x = v181.origin.x;
        v192.origin.y = v104;
        v192.size.width = rect2;
        v192.size.height = v107;
        if (CGRectIntersectsRect(v188, v192))
        {
LABEL_49:
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v111);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "objectForKey:", v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v115)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v111);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v178, "setObject:forKey:", v115, v116);

          }
          objc_msgSend(v115, "addObject:", v100);

        }
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v111);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "objectForKey:", v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v118)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v111);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "setObject:forKey:", v118, v119);

      }
      objc_msgSend(v118, "addObject:", v100);

      ++v90;
      v89 = v174;
    }
    while (objc_msgSend(v88, "count") > v90);
  }
  objc_msgSend(v178, "allKeys");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v180, "allKeys");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "sortedArrayUsingComparator:", &__block_literal_global_354);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = v88;
  v170 = v58;
  if (objc_msgSend(v121, "count"))
  {
    v125 = 0.0;
    LODWORD(v126) = 0;
    v127 = v180;
    rect2a = v121;
    do
    {
      v181.origin.x = v125;
      objc_msgSend(v121, "objectAtIndex:", *(_QWORD *)&v125, v169, v170);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v128, "unsignedIntegerValue");

      if (objc_msgSend(v123, "count") > (unint64_t)(int)v126)
      {
        v126 = (int)v126;
        while (1)
        {
          objc_msgSend(v123, "objectAtIndex:", v126);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = objc_msgSend(v130, "unsignedIntegerValue");

          if (v129 < v131)
            break;
          objc_msgSend(v123, "objectAtIndex:", v126);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "objectForKey:", v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "arrayByAddingObjectsFromArray:", v133);
          v134 = objc_claimAutoreleasedReturnValue();

          ++v126;
          v124 = (void *)v134;
          if (objc_msgSend(v123, "count") <= v126)
            goto LABEL_63;
        }
        v134 = (uint64_t)v124;
LABEL_63:
        v124 = (void *)v134;
        v121 = rect2a;
      }
      objc_msgSend(v121, "objectAtIndex:", *(_QWORD *)&v181.origin.x);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "objectForKey:", v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v136, "count"))
      {
        v137 = 0;
        do
        {
          objc_msgSend(v124, "sortedArrayUsingComparator:", &__block_literal_global_356);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "objectAtIndex:", v137);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          v140 = a4;
          if (objc_msgSend(v138, "count"))
          {
            v141 = 0;
            v140 = a4;
            while (1)
            {
              objc_msgSend(v138, "objectAtIndex:", v141);
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v142, "frame");
              v144 = v143;
              v145 = v143 - v140;
              objc_msgSend(v139, "frame");
              if (v145 >= v146)
                break;
              objc_msgSend(v142, "frame");
              v140 = v140 + v147;

              if (objc_msgSend(v138, "count") <= (unint64_t)++v141)
                goto LABEL_70;
            }
            objc_msgSend(v139, "frame");
            v161 = vabdd_f64(v160, v140);
            objc_msgSend(v139, "frame");
            v163 = vabdd_f64(v162, v144);
            objc_msgSend(v139, "frame");
            v165 = v164;
            objc_msgSend(v139, "frame");
            if (v161 >= v163)
            {
              v140 = v144 - v167;
              objc_msgSend(v139, "frame");
            }
            v168 = v166;
            objc_msgSend(v139, "frame");
            objc_msgSend(v139, "setFrame:", v165, v140, v168);

          }
          else
          {
LABEL_70:
            objc_msgSend(v139, "frame");
            if (v12 - v140 >= v148)
            {
              objc_msgSend(v139, "frame");
              v150 = v149;
              objc_msgSend(v139, "frame");
              v152 = vabdd_f64(v150 + v151, v140);
              objc_msgSend(v139, "frame");
              v154 = vabdd_f64(v153, v12);
              objc_msgSend(v139, "frame");
              v156 = v155;
              objc_msgSend(v139, "frame");
              if (v152 >= v154)
              {
                v140 = v12 - v158;
                objc_msgSend(v139, "frame");
              }
              v159 = v157;
              objc_msgSend(v139, "frame");
              objc_msgSend(v139, "setFrame:", v156, v140, v159);
            }
          }

          ++v137;
        }
        while (objc_msgSend(v136, "count") > v137);
      }

      *(_QWORD *)&v125 = *(_QWORD *)&v181.origin.x + 1;
      v121 = rect2a;
      v127 = v180;
    }
    while (objc_msgSend(rect2a, "count") > (unint64_t)(*(_QWORD *)&v181.origin.x + 1));
  }
  else
  {
    v127 = v180;
  }

}

void sortLayersWithYCoordinate(void *a1, void *a2, void **a3, void **a4)
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a1;
  v8 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      ++v10;
    }
    while (v10 < objc_msgSend(v7, "count"));
  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __sortLayersWithYCoordinate_block_invoke;
  v21[3] = &unk_24C58B658;
  v20 = v7;
  v22 = v20;
  objc_msgSend(v9, "sortedArrayUsingComparator:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = 0;
    do
    {
      v14 = *a3;
      objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v16);

      v17 = *a4;
      objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v18, "unsignedIntegerValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v19);

      ++v13;
    }
    while (v13 < objc_msgSend(v12, "count"));
  }

}

uint64_t __sortOverlappingCALayers_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __sortOverlappingCALayers_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __sortOverlappingCALayers_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "frame");
  v7 = v6;
  objc_msgSend(v5, "frame");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "frame");
    v11 = v10;
    objc_msgSend(v5, "frame");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void keepAllLayersWithinHorizontalBounds(void *a1, double a2, double a3, double a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a1;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = a2 + a4;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "frame");
        if (v14 < a4)
        {
          objc_msgSend(v12, "frame");
          v16 = v15;
          objc_msgSend(v12, "frame");
          v18 = v17;
          objc_msgSend(v12, "frame");
          v20 = v16 < a2;
          v21 = a2;
          if (!v20)
          {
            v13 = v18 + v19;
            if (v18 + v19 <= v10)
              continue;
            objc_msgSend(v12, "frame", v13);
            v21 = v10 - v22;
          }
          objc_msgSend(v12, "position");
          objc_msgSend(v12, "setPosition:", v21);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v13);
    }
    while (v8);
  }

}

Float64 secondsBetweenTimestamps(CMTime *a1, CMTime *a2)
{
  CMTime v3;
  CMTime lhs;
  CMTime time;

  lhs = *a1;
  v3 = *a2;
  CMTimeSubtract(&time, &lhs, &v3);
  return CMTimeGetSeconds(&time);
}

id stringByTransliteratingNameToPinyin(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  const __CFLocale *v27;
  __CFStringTokenizer *v28;
  const __CFString *v29;
  const __CFString *v30;
  CFRange CurrentTokenRange;
  void *v32;
  CFIndex v33;
  _BOOL4 v34;
  char v35;
  int v36;
  const __CFString *v37;
  const __CFString *v38;
  CFRange v39;
  void *v40;
  CFIndex v41;
  _BOOL4 v42;
  char v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CFRange v60;
  CFRange v61;
  CFRange v62;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = qword_254994378;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&qword_254994378, &__block_literal_global_358);
  objc_msgSend(v5, "uppercaseString");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uppercaseString");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v8 = (id)qword_254994360;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        if (-[__CFString containsString:](v7, "containsString:", v13))
        {
          objc_msgSend((id)_MergedGlobals_6, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lowercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByReplacingOccurrencesOfString:withString:](v7, "stringByReplacingOccurrencesOfString:withString:", v13, v15);
          v16 = objc_claimAutoreleasedReturnValue();

          v7 = (__CFString *)v16;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v10);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v17 = (id)qword_254994370;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v50 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
        if (-[__CFString containsString:](v6, "containsString:", v22, (_QWORD)v49))
        {
          objc_msgSend((id)qword_254994368, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lowercaseString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByReplacingOccurrencesOfString:withString:](v6, "stringByReplacingOccurrencesOfString:withString:", v22, v24);
          v25 = objc_claimAutoreleasedReturnValue();

          v6 = (__CFString *)v25;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v27 = CFLocaleCreate(0, CFSTR("zh-Hans"));
  v60.location = 0;
  v60.length = 0;
  v28 = CFStringTokenizerCreate(0, &stru_24C599708, v60, 0, v27);
  CFRelease(v27);
  v61.length = -[__CFString length](v7, "length");
  v61.location = 0;
  CFStringTokenizerSetString(v28, v7, v61);
  while (CFStringTokenizerAdvanceToNextToken(v28))
  {
    v29 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v28, 0x10000uLL);
    if (v29)
    {
      v30 = v29;
      if (CFStringGetLength(v29) >= 1)
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v28);
        if (CurrentTokenRange.location != -1)
        {
          -[__CFString substringWithRange:](v7, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = CurrentTokenRange.location - 1;
          v34 = CurrentTokenRange.location >= 1 && -[__CFString characterAtIndex:](v7, "characterAtIndex:", v33) == 32;
          if (objc_msgSend(v32, "isCaseApplicable", v33, (_QWORD)v49))
            v35 = objc_msgSend(v32, "isLowercase");
          else
            v35 = 0;
          v36 = 0;
          if (!objc_msgSend(v32, "caseInsensitiveCompare:", v30) && (v35 & 1) == 0)
            v36 = objc_msgSend(v32, "isCaseApplicable");
          if ((v34 | v36) == 1
            && -[__CFString length](v26, "length")
            && -[__CFString characterAtIndex:](v26, "characterAtIndex:", -[__CFString length](v26, "length") - 1) != 32)
          {
            CFStringAppend(v26, CFSTR(" "));
          }
          CFStringAppend(v26, v30);
          if (v36)
            CFStringAppend(v26, CFSTR(" "));

        }
      }
      CFRelease(v30);
    }
  }
  if (-[__CFString length](v26, "length", (_QWORD)v49)
    && -[__CFString characterAtIndex:](v26, "characterAtIndex:", -[__CFString length](v26, "length") - 1) != 32)
  {
    CFStringAppend(v26, CFSTR(" "));
  }
  v62.length = -[__CFString length](v6, "length");
  v62.location = 0;
  CFStringTokenizerSetString(v28, v6, v62);
  while (CFStringTokenizerAdvanceToNextToken(v28))
  {
    v37 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v28, 0x10000uLL);
    if (v37)
    {
      v38 = v37;
      if (CFStringGetLength(v37) >= 1)
      {
        v39 = CFStringTokenizerGetCurrentTokenRange(v28);
        if (v39.location != -1)
        {
          -[__CFString substringWithRange:](v6, "substringWithRange:", v39.location, v39.length);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v39.location - 1;
          v42 = v39.location >= 1 && -[__CFString characterAtIndex:](v6, "characterAtIndex:", v41) == 32;
          if (objc_msgSend(v40, "isCaseApplicable", v41))
            v43 = objc_msgSend(v40, "isLowercase");
          else
            v43 = 0;
          v44 = 0;
          if (!objc_msgSend(v40, "caseInsensitiveCompare:", v38) && (v43 & 1) == 0)
            v44 = objc_msgSend(v40, "isCaseApplicable");
          if ((v42 | v44) == 1
            && -[__CFString length](v26, "length")
            && -[__CFString characterAtIndex:](v26, "characterAtIndex:", -[__CFString length](v26, "length") - 1) != 32)
          {
            CFStringAppend(v26, CFSTR(" "));
          }
          CFStringAppend(v26, v38);
          if (v44)
            CFStringAppend(v26, CFSTR(" "));

        }
      }
      CFRelease(v38);
    }
  }
  CFStringTransform(v26, 0, (CFStringRef)*MEMORY[0x24BDBD660], 0);
  CFRelease(v28);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByTrimmingCharactersInSet:](v26, "stringByTrimmingCharactersInSet:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "lowercaseString");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

void __stringByTransliteratingNameToPinyin_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  getZhHansLN();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = v0;

  getZhHansFN();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254994368;
  qword_254994368 = v2;

  objc_msgSend((id)_MergedGlobals_6, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_360);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_254994360;
  qword_254994360 = v5;

  objc_msgSend((id)qword_254994368, "allKeys");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_361);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_254994370;
  qword_254994370 = v7;

}

uint64_t __stringByTransliteratingNameToPinyin_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "length");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "compare:", v6);

  return v10;
}

uint64_t __stringByTransliteratingNameToPinyin_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "length");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "compare:", v6);

  return v10;
}

uint64_t bestMatchInStringCandidates(void *a1, void *a2, _QWORD *a3, int a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v32 = a3;
  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a1;
  v7 = a2;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v8)
  {
    v10 = 0;
    v12 = 0x7FFFFFFFLL;
    if (!a4)
      goto LABEL_25;
    goto LABEL_13;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v41;
  v12 = 0x7FFFFFFFLL;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v41 != v11)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      v15 = objc_msgSend(v14, "editDistanceFromString:threshold:", v7, 4, v32);
      if (v15 < v12)
      {
        v16 = v15;
        v17 = v14;

        v10 = v17;
        v12 = v16;
      }
    }
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  }
  while (v9);
  if (a4)
  {
LABEL_13:
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v6;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      v33 = *(_QWORD *)v37;
      do
      {
        v21 = 0;
        v34 = v19;
        do
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v21), "componentsSeparatedByString:", CFSTR(" "), v32);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v22, "count") >= 2)
          {
            v23 = v6;
            objc_msgSend(v22, "subarrayWithRange:", 1, objc_msgSend(v22, "count") - 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "firstObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "arrayByAddingObject:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "componentsJoinedByString:", CFSTR(" "));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "editDistanceFromString:threshold:", v7, 4);
            if (v28 < v12)
            {
              v29 = v28;
              v30 = v27;

              v10 = v30;
              v12 = v29;
            }
            v19 = v34;

            v6 = v23;
            v20 = v33;
          }

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v19);
    }

  }
LABEL_25:
  if (v32)
    *v32 = objc_retainAutorelease(v10);

  return v12;
}

id stringCandidatesByTransliteratingNameToRomaji(void *a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  const __CFLocale *v7;
  __CFStringTokenizer *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t ii;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __CFString *v69;
  __CFString *v70;
  __CFString *v71;
  id obj;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;
  CFRange v104;
  CFRange v105;
  CFRange v106;

  v103 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1, "uppercaseString");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uppercaseString");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = CFLocaleCreate(0, CFSTR("ja"));
  v104.location = 0;
  v104.length = 0;
  v8 = CFStringTokenizerCreate(0, 0, v104, 0, v7);
  CFRelease(v7);
  v105.length = -[__CFString length](v5, "length");
  v105.location = 0;
  CFStringTokenizerSetString(v8, v5, v105);
  while (CFStringTokenizerAdvanceToNextToken(v8))
  {
    v9 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v8, 0x1000000uLL);
    if (v9)
    {
      v10 = v9;
      if (CFStringGetLength(v9) >= 1)
        CFStringAppend(v6, v10);
      CFRelease(v10);
    }
  }
  if (-[__CFString length](v6, "length")
    && -[__CFString characterAtIndex:](v6, "characterAtIndex:", -[__CFString length](v6, "length") - 1) != 32)
  {
    CFStringAppend(v6, CFSTR(" "));
  }
  v106.length = -[__CFString length](v4, "length");
  v106.location = 0;
  CFStringTokenizerSetString(v8, v4, v106);
  while (CFStringTokenizerAdvanceToNextToken(v8))
  {
    v11 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v8, 0x1000000uLL);
    if (v11)
    {
      v12 = v11;
      if (CFStringGetLength(v11) >= 1)
        CFStringAppend(v6, v12);
      CFRelease(v12);
    }
  }
  CFRelease(v8);
  v13 = v6;
  v70 = v5;
  v71 = v4;
  if (qword_2549943A0 != -1)
    dispatch_once(&qword_2549943A0, &__block_literal_global_379);
  v69 = v13;
  v14 = (void *)-[__CFString mutableCopy](v13, "mutableCopy");
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v15 = (id)qword_254994398;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v94 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i);
        objc_msgSend((id)qword_254994390, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", v20, v21, 0, 0, objc_msgSend(v14, "length"));

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
    }
    while (v17);
  }

  v22 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithObject:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v90 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("っ(.)"), 1, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringByReplacingMatchesInString:options:range:withTemplate:", v31, 0, 0, objc_msgSend(v31, "length"), CFSTR("$1$1"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v33);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
    }
    while (v28);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v25, "allObjects");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v86;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v86 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("っ$"), 1, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringByReplacingMatchesInString:options:range:withTemplate:", v39, 0, 0, objc_msgSend(v39, "length"), &stru_24C599708);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v41);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
    }
    while (v36);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend(v25, "allObjects");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v82;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v82 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * m);
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("n(b|p)([aiueo])"), 1, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringByReplacingMatchesInString:options:range:withTemplate:", v47, 0, 0, objc_msgSend(v47, "length"), CFSTR("m$1$2"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v49);

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
    }
    while (v44);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v25, "allObjects");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v77, v98, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v78;
    do
    {
      for (n = 0; n != v52; ++n)
      {
        if (*(_QWORD *)v78 != v53)
          objc_enumerationMutation(v50);
        v55 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * n);
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([aiue])\\1"), 1, 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringByReplacingMatchesInString:options:range:withTemplate:", v55, 0, 0, objc_msgSend(v55, "length"), CFSTR("$1"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v57);

      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v77, v98, 16);
    }
    while (v52);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend(v25, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v74;
    do
    {
      for (ii = 0; ii != v59; ++ii)
      {
        if (*(_QWORD *)v74 != v60)
          objc_enumerationMutation(obj);
        v62 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * ii);
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(o)(o|u)"), 1, 0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "stringByReplacingMatchesInString:options:range:withTemplate:", v62, 0, 0, objc_msgSend(v62, "length"), CFSTR("$1"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v64);
        objc_msgSend(v63, "stringByReplacingMatchesInString:options:range:withTemplate:", v62, 0, 0, objc_msgSend(v62, "length"), CFSTR("$1h"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v65);

      }
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
    }
    while (v59);
  }

  objc_msgSend(v25, "valueForKey:", CFSTR("uppercaseString"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "allObjects");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  return v67;
}

BOOL stringContainsApproximateSubstring(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = a1;
  v6 = objc_msgSend(v3, "editDistance:string:", v5, v4) - 4;
  v7 = objc_msgSend(v5, "length");

  v8 = objc_msgSend(v4, "length");
  return v6 < v7 - v8;
}

id createCachedContact(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;

  v1 = a1;
  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "givenName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uppercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v3);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(v2, "setObject:forKey:", v6, *MEMORY[0x24BDBA2C8]);
    objc_msgSend(v1, "nickname");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v3);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v2, "setObject:forKey:", v9, *MEMORY[0x24BDBA328]);
    objc_msgSend(v1, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uppercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v3);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v2, "setObject:forKey:", v12, *MEMORY[0x24BDBA2C0]);
    objc_msgSend(v1, "middleName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uppercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v3);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v2, "setObject:forKey:", v15, *MEMORY[0x24BDBA310]);
    objc_msgSend(v1, "phoneticGivenName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uppercaseString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v3);
    v18 = objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(v2, "setObject:forKey:", v18, *MEMORY[0x24BDBA360]);
    v61 = (void *)v18;
    v62 = (void *)v15;
    v63 = (void *)v12;
    v64 = (void *)v9;
    v65 = (void *)v6;
    objc_msgSend(v1, "phoneticFamilyName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uppercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)v3;
    objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v3);
    v21 = objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(v2, "setObject:forKey:", v21, *MEMORY[0x24BDBA358]);
    v60 = (void *)v21;
    v22 = (void *)MEMORY[0x24BDD14A8];
    v23 = v1;
    objc_msgSend(v22, "controlCharacterSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "givenName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uppercaseString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "familyName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "uppercaseString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "stringByTrimmingCharactersInSet:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "stringByTrimmingCharactersInSet:", v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "stringByAppendingString:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[^ -~]"), 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "numberOfMatchesInString:options:range:", v31, 0, 0, objc_msgSend(v31, "length")))
    {
      stringByTransliteratingNameToPinyin(v29, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "uppercaseString");
      v34 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)v34;
    }
    else
    {
      v35 = 0;
    }

    if (v35)
      objc_msgSend(v2, "setObject:forKey:", v35, CFSTR("pinyinName"));
    v59 = v35;
    v67 = v2;
    v37 = (void *)MEMORY[0x24BDD14A8];
    v38 = v23;
    objc_msgSend(v37, "controlCharacterSet");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "givenName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "uppercaseString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "familyName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "uppercaseString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "phoneticGivenName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "uppercaseString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "phoneticFamilyName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "uppercaseString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "stringByTrimmingCharactersInSet:", v39);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "stringByTrimmingCharactersInSet:", v39);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "stringByTrimmingCharactersInSet:", v39);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "stringByTrimmingCharactersInSet:", v39);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "stringByAppendingString:", CFSTR(" "));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringByAppendingString:", v49);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v50, "stringByAppendingString:", CFSTR(" "));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringByAppendingString:", v51);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[^ -~]"), 1, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v55
      || !objc_msgSend(v55, "length")
      || !objc_msgSend(v56, "numberOfMatchesInString:options:range:", v55, 0, 0, objc_msgSend(v55, "length"))
      || (stringCandidatesByTransliteratingNameToRomaji(v50, v51),
          (v57 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (objc_msgSend(v56, "numberOfMatchesInString:options:range:", v53, 0, 0, objc_msgSend(v53, "length", v1, v59, v60)))
      {
        stringCandidatesByTransliteratingNameToRomaji(v48, v49);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v57 = 0;
      }
    }

    v36 = v67;
    if (v57)
      objc_msgSend(v67, "setObject:forKey:", v57, CFSTR("romanjiName"));

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

id deviceModel()
{
  if (qword_254994380 != -1)
    dispatch_once(&qword_254994380, &__block_literal_global_378);
  return (id)qword_254994388;
}

void __deviceModel_block_invoke()
{
  uint64_t v0;
  void *v1;
  utsname v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  memset(&v2, 0, 512);
  uname(&v2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v2.machine, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_254994388;
  qword_254994388 = v0;

}

uint64_t __sortLayersWithYCoordinate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  v10 = *(void **)(a1 + 32);
  v11 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;

  if (v9 < v14)
    return -1;
  else
    return v9 > v14;
}

void __romajiFromKana_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  getJPHepburn();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_254994390;
  qword_254994390 = v0;

  objc_msgSend((id)qword_254994390, "allKeys");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_381);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254994398;
  qword_254994398 = v2;

}

uint64_t __romajiFromKana_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "length");
  if (v6 <= objc_msgSend(v5, "length"))
  {
    v8 = objc_msgSend(v4, "length");
    v7 = v8 < objc_msgSend(v5, "length");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void NetworkParameters::initializeFromBinaryFile(NetworkParameters *this, __sFILE *__stream)
{
  int v4;
  int v5;
  size_t v6;
  _QWORD *v7;
  _DWORD *v8;
  const char *v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  int v23;
  int __ptr;
  char __s1[256];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  fread((char *)this + 116, 4uLL, 1uLL, __stream);
  fread((char *)this + 112, 4uLL, 1uLL, __stream);
  __ptr = 0;
  fread(&__ptr, 4uLL, 1uLL, __stream);
  v4 = __ptr;
  if (__ptr >= 1)
  {
    v5 = 0;
    do
    {
      v23 = 0;
      fread(&v23, 4uLL, 1uLL, __stream);
      v6 = v23;
      fread(__s1, 1uLL, v23 + 1, __stream);
      if (!strncmp(__s1, "conv", v6))
      {
        v7 = (_QWORD *)operator new();
        LayerParameters::LayerParameters((LayerParameters *)v7);
        *v7 = &off_24C58AE78;
        v8 = v7 + 9;
        v9 = "conv";
        v7[8] = 0;
      }
      else if (!strncmp(__s1, "pool", v6))
      {
        v7 = (_QWORD *)operator new();
        LayerParameters::LayerParameters((LayerParameters *)v7);
        *v7 = &off_24C58AF38;
        v8 = v7 + 8;
        v9 = "pool";
      }
      else
      {
        if (strncmp(__s1, "hidden", v6))
          exit(1);
        v7 = (_QWORD *)operator new();
        LayerParameters::LayerParameters((LayerParameters *)v7);
        *v7 = &off_24C58AED8;
        v8 = v7 + 8;
        v9 = "hidden";
      }
      *v8 = 0;
      MEMORY[0x212B95590](v7 + 1, v9);
      (*(void (**)(_QWORD *, __sFILE *))(*v7 + 56))(v7, __stream);
      v11 = (_QWORD *)*((_QWORD *)this + 26);
      v10 = *((_QWORD *)this + 27);
      if ((unint64_t)v11 >= v10)
      {
        v13 = *((_QWORD *)this + 25);
        v14 = ((uint64_t)v11 - v13) >> 3;
        if ((unint64_t)(v14 + 1) >> 61)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v15 = v10 - v13;
        v16 = v15 >> 2;
        if (v15 >> 2 <= (unint64_t)(v14 + 1))
          v16 = v14 + 1;
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
          v17 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v17 = v16;
        if (v17)
          v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<Layer<float,float,float> *>>(v17);
        else
          v18 = 0;
        v19 = (_QWORD *)(v17 + 8 * v14);
        *v19 = v7;
        v12 = v19 + 1;
        v21 = (char *)*((_QWORD *)this + 25);
        v20 = (char *)*((_QWORD *)this + 26);
        if (v20 != v21)
        {
          do
          {
            v22 = *((_QWORD *)v20 - 1);
            v20 -= 8;
            *--v19 = v22;
          }
          while (v20 != v21);
          v20 = (char *)*((_QWORD *)this + 25);
        }
        *((_QWORD *)this + 25) = v19;
        *((_QWORD *)this + 26) = v12;
        *((_QWORD *)this + 27) = v17 + 8 * v18;
        if (v20)
          operator delete(v20);
      }
      else
      {
        *v11 = v7;
        v12 = v11 + 1;
      }
      *((_QWORD *)this + 26) = v12;
      ++v5;
    }
    while (v5 != v4);
  }
}

void sub_20CDABF30(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212B95704](v1, 0x1093C40DBFFDDC9);
  _Unwind_Resume(a1);
}

void LayerParameters::LayerParameters(LayerParameters *this)
{
  *(_QWORD *)this = &unk_24C58AD68;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)this + 4, "Layer");
  *((_DWORD *)this + 14) = 1045220557;
  *((_BYTE *)this + 60) = 0;
}

void sub_20CDABFCC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

uint64_t CNNLayerParameters::getKernelSize(CNNLayerParameters *this)
{
  return *((unsigned int *)this + 16);
}

uint64_t CNNLayerParameters::putKernelSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 64) = a2;
  return this;
}

uint64_t CNNLayerParameters::getNumOutputs(CNNLayerParameters *this)
{
  return 0;
}

uint64_t CNNLayerParameters::getFirstHiddenLayerFlag(CNNLayerParameters *this)
{
  return 0;
}

size_t CNNLayerParameters::writeBinaryLayerParameters(CNNLayerParameters *this, __sFILE *a2)
{
  LayerParameters::writeBinaryLayerParameters(this, a2);
  fwrite((char *)this + 64, 4uLL, 1uLL, a2);
  fwrite((char *)this + 68, 4uLL, 1uLL, a2);
  return fwrite((char *)this + 72, 4uLL, 1uLL, a2);
}

size_t CNNLayerParameters::readBinaryLayerParamenters(CNNLayerParameters *this, __sFILE *a2)
{
  LayerParameters::readBinaryLayerParamenters(this, a2);
  fread((char *)this + 64, 4uLL, 1uLL, a2);
  fread((char *)this + 68, 4uLL, 1uLL, a2);
  return fread((char *)this + 72, 4uLL, 1uLL, a2);
}

void CNNLayerParameters::~CNNLayerParameters(void **this)
{
  LayerParameters::~LayerParameters(this);
  JUMPOUT(0x212B95704);
}

size_t LayerParameters::writeBinaryLayerParameters(LayerParameters *this, __sFILE *__stream)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  int __ptr;

  if (*((char *)this + 31) < 0)
    v4 = *((_QWORD *)this + 2);
  else
    LODWORD(v4) = *((unsigned __int8 *)this + 31);
  v5 = (_QWORD *)((char *)this + 8);
  __ptr = v4;
  fwrite(&__ptr, 4uLL, 1uLL, __stream);
  if (*((char *)this + 31) < 0)
    v5 = (_QWORD *)*v5;
  fwrite(v5, 1uLL, __ptr + 1, __stream);
  if (*((char *)this + 55) < 0)
    v6 = *((_QWORD *)this + 5);
  else
    LODWORD(v6) = *((unsigned __int8 *)this + 55);
  v7 = (_QWORD *)((char *)this + 32);
  __ptr = v6;
  fwrite(&__ptr, 4uLL, 1uLL, __stream);
  if (*((char *)this + 55) < 0)
    v7 = (_QWORD *)*v7;
  fwrite(v7, 1uLL, __ptr + 1, __stream);
  return fwrite((char *)this + 60, 1uLL, 1uLL, __stream);
}

size_t LayerParameters::readBinaryLayerParamenters(LayerParameters *this, __sFILE *__stream)
{
  int __ptr;
  _BYTE v6[256];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  __ptr = 0;
  fread(&__ptr, 4uLL, 1uLL, __stream);
  fread(v6, 1uLL, __ptr + 1, __stream);
  MEMORY[0x212B95590]((char *)this + 32, v6);
  return fread((char *)this + 60, 1uLL, 1uLL, __stream);
}

void LayerParameters::~LayerParameters(void **this)
{
  *this = &unk_24C58AD68;
  if (*((char *)this + 55) < 0)
    operator delete(this[4]);
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

uint64_t PoolingLayerParameters::getKernelSize(PoolingLayerParameters *this)
{
  return *((unsigned int *)this + 16);
}

uint64_t PoolingLayerParameters::putKernelSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 64) = a2;
  return this;
}

uint64_t PoolingLayerParameters::getNumOutputs(PoolingLayerParameters *this)
{
  return 0;
}

uint64_t PoolingLayerParameters::getFirstHiddenLayerFlag(PoolingLayerParameters *this)
{
  return 0;
}

size_t PoolingLayerParameters::writeBinaryLayerParameters(PoolingLayerParameters *this, __sFILE *a2)
{
  LayerParameters::writeBinaryLayerParameters(this, a2);
  return fwrite((char *)this + 64, 4uLL, 1uLL, a2);
}

size_t PoolingLayerParameters::readBinaryLayerParamenters(PoolingLayerParameters *this, __sFILE *a2)
{
  LayerParameters::readBinaryLayerParamenters(this, a2);
  return fread((char *)this + 64, 4uLL, 1uLL, a2);
}

void PoolingLayerParameters::~PoolingLayerParameters(void **this)
{
  LayerParameters::~LayerParameters(this);
  JUMPOUT(0x212B95704);
}

uint64_t HiddenLayerParameters::getKernelSize(HiddenLayerParameters *this)
{
  return 0;
}

uint64_t HiddenLayerParameters::getNumOutputs(HiddenLayerParameters *this)
{
  return *((unsigned int *)this + 16);
}

uint64_t HiddenLayerParameters::putNumOutputs(uint64_t this, int a2)
{
  *(_DWORD *)(this + 64) = a2;
  return this;
}

uint64_t HiddenLayerParameters::setFirstHiddenLayerFlag(uint64_t this)
{
  *(_BYTE *)(this + 60) = 1;
  return this;
}

uint64_t HiddenLayerParameters::getFirstHiddenLayerFlag(HiddenLayerParameters *this)
{
  return *((unsigned __int8 *)this + 60);
}

size_t HiddenLayerParameters::writeBinaryLayerParameters(HiddenLayerParameters *this, __sFILE *a2)
{
  LayerParameters::writeBinaryLayerParameters(this, a2);
  return fwrite((char *)this + 64, 4uLL, 1uLL, a2);
}

size_t HiddenLayerParameters::readBinaryLayerParamenters(HiddenLayerParameters *this, __sFILE *a2)
{
  LayerParameters::readBinaryLayerParamenters(this, a2);
  return fread((char *)this + 64, 4uLL, 1uLL, a2);
}

void HiddenLayerParameters::~HiddenLayerParameters(void **this)
{
  LayerParameters::~LayerParameters(this);
  JUMPOUT(0x212B95704);
}

uint64_t Corpus::Corpus(uint64_t a1, double a2, double a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8, int a9, _QWORD *a10, uint64_t a11)
{
  _QWORD *v15;
  uint64_t *v16;
  uint64_t **v17;
  uint64_t *v18;
  unint64_t v19;
  const void ***v20;
  const void **v21;
  const void **v22;
  uint64_t *v23;
  uint64_t **v24;
  uint64_t **v25;
  BOOL v26;
  uint64_t **v27;
  uint64_t *v28;
  uint64_t v29;
  const void **v30;
  const void ***v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t **v34;
  unsigned int v35;
  uint64_t **v36;
  uint64_t *v37;
  uint64_t **v38;
  uint64_t **v39;
  uint64_t **v40;
  unsigned int v41;
  uint64_t *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t **v48;
  uint64_t *v49;
  uint64_t **leaf_high;
  uint64_t *v51;
  uint64_t **v52;
  uint64_t *v53;
  uint64_t **v54;
  uint64_t **v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t **v59;
  uint64_t **v60;
  uint64_t *v61;
  uint64_t **v62;
  uint64_t *v63;
  uint64_t **v64;
  uint64_t **v65;
  uint64_t *v66;
  uint64_t **v67;
  _QWORD *v68;
  unsigned int v69;
  uint64_t **v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t *v73;
  int v74;
  const void **v75;
  uint64_t **v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t **v79;
  BOOL v80;
  _QWORD *v81;
  _QWORD *v82;
  _QWORD *v84;
  _QWORD *v85;
  void *__p;
  uint64_t *v88;
  uint64_t v89;
  uint64_t **v90;
  uint64_t *v91;
  uint64_t v92;
  int v93;
  uint64_t **v94;
  const void **v95;
  uint64_t *v96;
  const void **v97;

  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)a1 = &off_24C58B068;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_QWORD *)(a1 + 152) = 0;
  v15 = (_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 144) = a1 + 152;
  v16 = (uint64_t *)(a1 + 144);
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  v17 = (uint64_t **)(a1 + 176);
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_QWORD *)(a1 + 168) = a1 + 176;
  v18 = (uint64_t *)(a1 + 168);
  *(_QWORD *)(a1 + 184) = 0;
  *(_DWORD *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 40) = a8;
  v19 = (a8 + a5);
  *(_QWORD *)(a1 + 32) = v19;
  *(_DWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 76) = a9;
  std::vector<double>::resize(a1 + 96, v19);
  std::vector<double>::resize(a1 + 120, *(unsigned int *)(a1 + 32));
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  if (a11)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Corpus: mean");
    if (SHIBYTE(v89) < 0)
      operator delete(__p);
    std::string::basic_string[abi:ne180100]<0>(&__p, "Corpus: stddev");
    if (SHIBYTE(v89) < 0)
      operator delete(__p);
    *(double *)(a1 + 80) = a2;
    *(double *)(a1 + 88) = a3;
  }
  v88 = 0;
  v89 = 0;
  __p = &v88;
  if (a10)
  {
    v84 = v15;
    v85 = a10;
    v22 = (const void **)*a10;
    v20 = (const void ***)(a10 + 1);
    v21 = v22;
    if (v22 != (const void **)v20)
    {
      while (1)
      {
        v23 = v88;
        if (__p == &v88)
          break;
        v24 = &v88;
        if (v88)
        {
          do
          {
            v25 = (uint64_t **)v23;
            v23 = (uint64_t *)v23[1];
          }
          while (v23);
        }
        else
        {
          do
          {
            v25 = (uint64_t **)v24[2];
            v26 = *v25 == (uint64_t *)v24;
            v24 = v25;
          }
          while (v26);
        }
        if (std::less<std::string>::operator()[abi:ne180100]((uint64_t)&v89, (const void **)v25 + 4, v21 + 4))
        {
          if (!v88)
            goto LABEL_16;
LABEL_18:
          v94 = v25;
          v27 = v25 + 1;
          goto LABEL_20;
        }
        v27 = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_equal<std::string>((uint64_t)&__p, &v94, v21 + 4);
LABEL_20:
        if (!*v27)
          goto LABEL_21;
LABEL_24:
        v30 = (const void **)v21[1];
        if (v30)
        {
          do
          {
            v31 = (const void ***)v30;
            v30 = (const void **)*v30;
          }
          while (v30);
        }
        else
        {
          do
          {
            v31 = (const void ***)v21[2];
            v26 = *v31 == v21;
            v21 = (const void **)v31;
          }
          while (!v26);
        }
        v21 = (const void **)v31;
        if (v31 == v20)
          goto LABEL_30;
      }
      v25 = &v88;
      if (!v88)
      {
LABEL_16:
        v94 = &v88;
        v27 = &v88;
LABEL_21:
        std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::pair<std::string const,unsigned int> const&>((uint64_t)&v95, (uint64_t)&__p, (uint64_t)(v21 + 4));
        v29 = (uint64_t)v94;
        v28 = (uint64_t *)v95;
        *v95 = 0;
        v28[1] = 0;
        v28[2] = v29;
        *v27 = v28;
        if (*(_QWORD *)__p)
        {
          __p = *(void **)__p;
          v28 = *v27;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v88, v28);
        ++v89;
        goto LABEL_24;
      }
      goto LABEL_18;
    }
LABEL_30:
    v91 = 0;
    v92 = 0;
    v90 = &v91;
    v32 = (_QWORD *)v85[3];
    if (v32 != v85 + 4)
    {
      v33 = 0;
      v34 = &v91;
      while (1)
      {
        v35 = *((_DWORD *)v32 + 8);
        v36 = &v91;
        if (v34 == &v91)
          break;
        v37 = v33;
        v38 = &v91;
        if (v33)
        {
          do
          {
            v36 = (uint64_t **)v37;
            v37 = (uint64_t *)v37[1];
          }
          while (v37);
        }
        else
        {
          do
          {
            v36 = (uint64_t **)v38[2];
            v26 = *v36 == (uint64_t *)v38;
            v38 = v36;
          }
          while (v26);
        }
        if (*((_DWORD *)v36 + 8) < v35)
          break;
        v40 = &v91;
        v39 = &v91;
        if (!v33)
          goto LABEL_53;
        while (1)
        {
          while (1)
          {
            v39 = (uint64_t **)v33;
            v41 = *((_DWORD *)v33 + 8);
            if (v41 <= v35)
              break;
            v33 = *v39;
            v40 = v39;
            if (!*v39)
              goto LABEL_53;
          }
          if (v41 >= v35)
            break;
          v33 = v39[1];
          if (!v33)
          {
            v40 = v39 + 1;
            goto LABEL_53;
          }
        }
LABEL_56:
        v43 = (_QWORD *)v32[1];
        if (v43)
        {
          do
          {
            v44 = v43;
            v43 = (_QWORD *)*v43;
          }
          while (v43);
        }
        else
        {
          do
          {
            v44 = (_QWORD *)v32[2];
            v26 = *v44 == (_QWORD)v32;
            v32 = v44;
          }
          while (!v26);
        }
        if (v44 == v85 + 4)
          goto LABEL_63;
        v34 = v90;
        v33 = v91;
        v32 = v44;
      }
      if (v33)
        v39 = v36;
      else
        v39 = &v91;
      if (v33)
        v40 = v36 + 1;
      else
        v40 = &v91;
      if (*v40)
        goto LABEL_56;
LABEL_53:
      std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__construct_node<std::pair<unsigned int const,std::string> const&>((uint64_t)&v95, (uint64_t)&v90, (uint64_t)(v32 + 4));
      v42 = (uint64_t *)v95;
      *v95 = 0;
      v42[1] = 0;
      v42[2] = (uint64_t)v39;
      *v40 = v42;
      if (*v90)
      {
        v90 = (uint64_t **)*v90;
        v42 = *v40;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v91, v42);
      ++v92;
      goto LABEL_56;
    }
LABEL_63:
    v15 = v84;
    v93 = *((_DWORD *)v85 + 12);
  }
  else
  {
    v91 = 0;
    v92 = 0;
    v90 = &v91;
    v93 = 0;
  }
  if (v16 != (uint64_t *)&__p)
  {
    v45 = (uint64_t *)__p;
    if (*(_QWORD *)(a1 + 160))
    {
      v46 = *v16;
      *v16 = (uint64_t)v15;
      *(_QWORD *)(*v15 + 16) = 0;
      *v15 = 0;
      v15[1] = 0;
      if (*(_QWORD *)(v46 + 8))
        v47 = *(uint64_t **)(v46 + 8);
      else
        v47 = (uint64_t *)v46;
      v95 = (const void **)v16;
      v96 = v47;
      v97 = (const void **)v47;
      if (v47)
      {
        v96 = std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::__detach_next((uint64_t)v47);
        v48 = &v88;
        if (v45 != (uint64_t *)&v88)
        {
          do
          {
            std::string::operator=((std::string *)(v47 + 4), (const std::string *)(v45 + 4));
            *((_DWORD *)v47 + 14) = *((_DWORD *)v45 + 14);
            v49 = (uint64_t *)v97;
            leaf_high = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_leaf_high((uint64_t)v16, &v94, v97 + 4);
            std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at((uint64_t **)v16, (uint64_t)v94, leaf_high, v49);
            v47 = v96;
            v97 = (const void **)v96;
            if (v96)
              v96 = std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::__detach_next((uint64_t)v96);
            v51 = (uint64_t *)v45[1];
            if (v51)
            {
              do
              {
                v48 = (uint64_t **)v51;
                v51 = (uint64_t *)*v51;
              }
              while (v51);
            }
            else
            {
              do
              {
                v48 = (uint64_t **)v45[2];
                v26 = *v48 == v45;
                v45 = (uint64_t *)v48;
              }
              while (!v26);
            }
            if (!v47)
              break;
            v45 = (uint64_t *)v48;
          }
          while (v48 != &v88);
        }
      }
      else
      {
        v48 = (uint64_t **)v45;
      }
      std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v95);
      v45 = (uint64_t *)v48;
    }
    if (v45 != (uint64_t *)&v88)
    {
      do
      {
        std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::pair<std::string const,unsigned int> const&>((uint64_t)&v95, (uint64_t)v16, (uint64_t)(v45 + 4));
        v52 = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_leaf_high((uint64_t)v16, &v94, v95 + 4);
        std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at((uint64_t **)v16, (uint64_t)v94, v52, (uint64_t *)v95);
        v53 = (uint64_t *)v45[1];
        if (v53)
        {
          do
          {
            v54 = (uint64_t **)v53;
            v53 = (uint64_t *)*v53;
          }
          while (v53);
        }
        else
        {
          do
          {
            v54 = (uint64_t **)v45[2];
            v26 = *v54 == v45;
            v45 = (uint64_t *)v54;
          }
          while (!v26);
        }
        v45 = (uint64_t *)v54;
      }
      while (v54 != &v88);
    }
    v55 = v90;
    if (*(_QWORD *)(a1 + 184))
    {
      v56 = *v18;
      *v18 = (uint64_t)v17;
      (*v17)[2] = 0;
      *v17 = 0;
      v17[1] = 0;
      if (*(_QWORD *)(v56 + 8))
        v57 = *(uint64_t **)(v56 + 8);
      else
        v57 = (uint64_t *)v56;
      v95 = (const void **)v18;
      v96 = v57;
      v97 = (const void **)v57;
      if (v57)
      {
        v96 = std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::__detach_next((uint64_t)v57);
        if (v55 == &v91)
        {
          v62 = &v91;
        }
        else
        {
          do
          {
            *((_DWORD *)v57 + 8) = *((_DWORD *)v55 + 8);
            std::string::operator=((std::string *)(v57 + 5), (const std::string *)(v55 + 5));
            v58 = *v17;
            v59 = v17;
            v60 = v17;
            if (*v17)
            {
              do
              {
                while (1)
                {
                  v59 = (uint64_t **)v58;
                  if (*((_DWORD *)v97 + 8) >= *((_DWORD *)v58 + 8))
                    break;
                  v58 = (uint64_t *)*v58;
                  v60 = v59;
                  if (!*v59)
                    goto LABEL_103;
                }
                v58 = (uint64_t *)v58[1];
              }
              while (v58);
              v60 = v59 + 1;
            }
LABEL_103:
            std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at((uint64_t **)v18, (uint64_t)v59, v60, (uint64_t *)v97);
            v57 = v96;
            v97 = (const void **)v96;
            if (v96)
              v96 = std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::__detach_next((uint64_t)v96);
            v61 = v55[1];
            if (v61)
            {
              do
              {
                v62 = (uint64_t **)v61;
                v61 = (uint64_t *)*v61;
              }
              while (v61);
            }
            else
            {
              do
              {
                v62 = (uint64_t **)v55[2];
                v26 = *v62 == (uint64_t *)v55;
                v55 = v62;
              }
              while (!v26);
            }
            if (!v57)
              break;
            v55 = v62;
          }
          while (v62 != &v91);
        }
      }
      else
      {
        v62 = v55;
      }
      std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v95);
      v55 = v62;
    }
    if (v55 != &v91)
    {
      do
      {
        std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__construct_node<std::pair<unsigned int const,std::string> const&>((uint64_t)&v95, (uint64_t)v18, (uint64_t)(v55 + 4));
        v63 = *v17;
        v64 = v17;
        v65 = v17;
        if (*v17)
        {
          do
          {
            while (1)
            {
              v64 = (uint64_t **)v63;
              if (*((_DWORD *)v95 + 8) >= *((_DWORD *)v63 + 8))
                break;
              v63 = (uint64_t *)*v63;
              v65 = v64;
              if (!*v64)
                goto LABEL_123;
            }
            v63 = (uint64_t *)v63[1];
          }
          while (v63);
          v65 = v64 + 1;
        }
LABEL_123:
        std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at((uint64_t **)v18, (uint64_t)v64, v65, (uint64_t *)v95);
        v66 = v55[1];
        if (v66)
        {
          do
          {
            v67 = (uint64_t **)v66;
            v66 = (uint64_t *)*v66;
          }
          while (v66);
        }
        else
        {
          do
          {
            v67 = (uint64_t **)v55[2];
            v26 = *v67 == (uint64_t *)v55;
            v55 = v67;
          }
          while (!v26);
        }
        v55 = v67;
      }
      while (v67 != &v91);
    }
  }
  *(_DWORD *)(a1 + 192) = v93;
  std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy((uint64_t)&v90, (char *)v91);
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy((uint64_t)&__p, (char *)v88);
  v68 = *(_QWORD **)(a1 + 144);
  if (v68 == v15)
    goto LABEL_156;
  v69 = 0;
  while (1)
  {
    LODWORD(v95) = *((_DWORD *)v68 + 14);
    __p = &v95;
    v70 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)v18, (unsigned int *)&v95, (uint64_t)&std::piecewise_construct, (_DWORD **)&__p);
    v71 = *((unsigned __int8 *)v68 + 55);
    if ((v71 & 0x80u) == 0)
      v72 = (uint64_t *)*((unsigned __int8 *)v68 + 55);
    else
      v72 = (uint64_t *)v68[5];
    v73 = (uint64_t *)*((unsigned __int8 *)v70 + 63);
    v74 = (char)v73;
    if ((char)v73 < 0)
      v73 = v70[6];
    if (v72 != v73)
    {
      if (v69 >= 0x65)
        goto LABEL_156;
LABEL_160:
      exit(1);
    }
    v75 = (const void **)(v68 + 4);
    v78 = v70[5];
    v76 = v70 + 5;
    v77 = v78;
    v79 = v74 >= 0 ? v76 : (uint64_t **)v77;
    if ((v71 & 0x80) == 0)
      break;
    v80 = memcmp(*v75, v79, v68[5]) == 0;
LABEL_146:
    if (v69 == 101)
      goto LABEL_156;
    if (!v80)
      goto LABEL_160;
    v81 = (_QWORD *)v68[1];
    if (v81)
    {
      do
      {
        v82 = v81;
        v81 = (_QWORD *)*v81;
      }
      while (v81);
    }
    else
    {
      do
      {
        v82 = (_QWORD *)v68[2];
        v26 = *v82 == (_QWORD)v68;
        v68 = v82;
      }
      while (!v26);
    }
    ++v69;
    v68 = v82;
    if (v82 == v15)
      goto LABEL_156;
  }
  if (!*((_BYTE *)v68 + 55))
  {
LABEL_144:
    v80 = 1;
    goto LABEL_146;
  }
  while (*(unsigned __int8 *)v75 == *(unsigned __int8 *)v79)
  {
    v75 = (const void **)((char *)v75 + 1);
    v79 = (uint64_t **)((char *)v79 + 1);
    if (!--v71)
      goto LABEL_144;
  }
  if (v69 <= 0x64)
    goto LABEL_160;
LABEL_156:
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  if (SHIBYTE(v89) < 0)
    operator delete(__p);
  return a1;
}

void sub_20CDACCF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, void **a11, void **a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  char **v25;
  void *v27;
  void *v28;
  void *v29;

  TagMap::~TagMap(v25);
  v27 = *a11;
  if (*a11)
  {
    *(_QWORD *)(a16 + 128) = v27;
    operator delete(v27);
  }
  v28 = *a12;
  if (*a12)
  {
    *(_QWORD *)(a16 + 104) = v28;
    operator delete(v28);
  }
  v29 = *a13;
  if (*a13)
  {
    *(_QWORD *)(a16 + 56) = v29;
    operator delete(v29);
  }
  if (*(char *)(a16 + 31) < 0)
    operator delete(*a10);
  _Unwind_Resume(a1);
}

_QWORD *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_leaf_high(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *result;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v5 = (_QWORD *)v4;
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v5;
        result = v5;
        if (!*v5)
          goto LABEL_9;
      }
      v4 = v5[1];
    }
    while (v4);
    result = v5 + 1;
  }
  else
  {
    result = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v5;
  return result;
}

_QWORD *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(*(_QWORD *)a1, *(char **)(a1 + 16));
  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 16);
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = *(_QWORD *)(v3 + 16);
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(*(_QWORD *)a1, (char *)v2);
  }
  return a1;
}

void std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::pair<std::string const,unsigned int> const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  std::string *v7;

  v5 = a2 + 8;
  v6 = (char *)operator new(0x40uLL);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = 0;
  v7 = (std::string *)(v6 + 32);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((_QWORD *)v6 + 6) = *(_QWORD *)(a3 + 16);
  }
  *((_DWORD *)v6 + 14) = *(_DWORD *)(a3 + 24);
  *(_BYTE *)(a1 + 16) = 1;
}

void sub_20CDACF7C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(*(_QWORD *)a1, *(char **)(a1 + 16));
  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 16);
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = *(_QWORD *)(v3 + 16);
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(*(_QWORD *)a1, (char *)v2);
  }
  return a1;
}

void std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__construct_node<std::pair<unsigned int const,std::string> const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  std::string *v7;

  v5 = a2 + 8;
  v6 = (char *)operator new(0x40uLL);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = 0;
  *((_DWORD *)v6 + 8) = *(_DWORD *)a3;
  v7 = (std::string *)(v6 + 40);
  if (*(char *)(a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a3 + 8), *(_QWORD *)(a3 + 16));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 8);
    v7->__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 24);
  }
  *(_BYTE *)(a1 + 16) = 1;
}

void sub_20CDAD068(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::string>,void *>>>::operator()[abi:ne180100](0, v2);
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::string>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 63) < 0)
      operator delete(__p[5]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void sub_20CDAD3D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDAD5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_20CDAD9F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_20CDAE080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, void **a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v25 = v21;

  a18 = (void **)&a15;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&a18);
  _Unwind_Resume(a1);
}

void sub_20CDAE590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  void *v24;

  if (__p)
    operator delete(__p);
  v24 = *(void **)(v22 - 104);
  if (v24)
  {
    *(_QWORD *)(v22 - 96) = v24;
    operator delete(v24);
  }

  _Unwind_Resume(a1);
}

void sub_20CDAFC8C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  *(_QWORD *)(v1 + 96) = v2;

  v4 = *(void **)(v1 + 128);
  if (v4)
  {
    *(_QWORD *)(v1 + 136) = v4;
    operator delete(v4);
  }
  *(_QWORD *)(v1 + 128) = v1 + 280;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v1 + 128));
  *(_QWORD *)(v1 + 128) = v1 + 304;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v1 + 128));

  std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(*(_QWORD **)(v1 + 336));
  v5 = *(void **)(v1 + 96);
  v6 = *(void **)(v1 + 352);
  if (v6)
  {
    *(_QWORD *)(v1 + 360) = v6;
    operator delete(v6);
  }
  *(_QWORD *)(v1 + 128) = v1 + 376;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v1 + 128));
  v7 = *(void **)(v1 + 400);
  if (v7)
  {
    *(_QWORD *)(v1 + 408) = v7;
    operator delete(v7);
  }

  _Unwind_Resume(a1);
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_20CDAFFF4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::__value_type<int,std::vector<float>>,std::__map_value_compare<int,std::__value_type<int,std::vector<float>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<float>>>>::__emplace_unique_key_args<int,std::pair<int,std::vector<float>>>(uint64_t *result, int a2, uint64_t a3)
{
  uint64_t **v4;
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  int v8;
  char *v9;

  v4 = (uint64_t **)result;
  v6 = (uint64_t **)(result + 1);
  v5 = (uint64_t *)result[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = *((_DWORD *)v5 + 8);
        if (v8 <= a2)
          break;
        v5 = *v7;
        v6 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v5 = v7[1];
      if (!v5)
      {
        v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = (uint64_t **)(result + 1);
LABEL_9:
    v9 = (char *)operator new(0x40uLL);
    *((_DWORD *)v9 + 8) = *(_DWORD *)a3;
    *(_OWORD *)(v9 + 40) = *(_OWORD *)(a3 + 8);
    *((_QWORD *)v9 + 7) = *(_QWORD *)(a3 + 24);
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    return std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at(v4, (uint64_t)v7, v6, (uint64_t *)v9);
  }
  return result;
}

void std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = (char *)v1[1];
      do
      {
        v8 = (void *)*((_QWORD *)v6 - 3);
        v6 -= 24;
        v7 = v8;
        if (v8)
        {
          *((_QWORD *)v4 - 2) = v7;
          operator delete(v7);
        }
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a1);
}

void sub_20CDB0228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void sub_20CDB079C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  *(_QWORD *)(v19 - 176) = v19 - 144;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v19 - 176));

  _Unwind_Resume(a1);
}

void sub_20CDB08D4()
{
  JUMPOUT(0x20CDB08BCLL);
}

void sub_20CDB09D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB0AC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<std::vector<std::vector<float>>>::__vdeallocate(void ***a1)
{
  void **v1;
  void **v3;
  void **v4;
  void **v5;

  v1 = *a1;
  if (*a1)
  {
    v3 = a1[1];
    v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        v3 -= 3;
        v5 = v3;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v5);
      }
      while (v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_20CDB0C94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_20CDB0DCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20CDB1248(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_20CDB1348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDB13FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDB14B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDB1564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDB1D54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CDB1F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDB2170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDB24B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20CDB2598(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB2638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDB26DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDB2808(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CDB28D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB2A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_20CDB2BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDB2D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)CRCameraReader;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_20CDB3010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDB3144(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_20CDB31A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB3240(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB32A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDB32F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB3340(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB33C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDB34B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDB3798(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_20CDB394C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB3B68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB3CBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CDB4024(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_20CDB40C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDB43EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20CDB484C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_20CDB4AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_20CDB4CA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB4F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_20CDB501C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDB5728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_20CDB6234(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20CDB65FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20CDB722C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30)
{
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

void sub_20CDB75C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_20CDB774C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDB7958(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CDB7E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_20CDB7FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_20CDB80BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20CDB8184(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CDB8608(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_20CDB988C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,void *a23,void *a24,uint64_t a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  _Unwind_Resume(a1);
}

void sub_20CDBC980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id *a27,void *a28,uint64_t a29,uint64_t a30,void *a31,id *a32)
{
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;

  if (a29)
  if (v34)

  _Unwind_Resume(a1);
}

void sub_20CDBD784(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDBD7E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDBD86C(_Unwind_Exception *exception_object)
{
  void *v1;
  int v2;

  if (!v2)

  _Unwind_Resume(exception_object);
}

void sub_20CDBD8D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDBD93C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDBD9CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDBDA40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDBDEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_20CDBE78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_20CDBEBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20CDBEFBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20CDBF13C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDBF1FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDBF91C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  _Unwind_Resume(a1);
}

void sub_20CDBFCDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_20CDC0AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,void *a52)
{
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  _Unwind_Resume(a1);
}

void sub_20CDC10C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CDC1130(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDC1318(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20CDC2328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,void *a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a67;
  void *a69;
  void *a70;
  void *v70;

  _Unwind_Resume(a1);
}

void sub_20CDC2BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_20CDC2D78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDC3F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,void *a48,void *a49,uint64_t a50,uint64_t a51,void *a52,void *a53,void *a54,void *a55)
{
  void *v55;
  void *v56;

  _Unwind_Resume(a1);
}

void sub_20CDC4878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_20CDC4DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

void sub_20CDC5A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_20CDC6044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_20CDC62A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_20CDC6748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_20CDC6980(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_20CDC6B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_20CDC6BC8()
{
  JUMPOUT(0x20CDC6BB4);
}

void sub_20CDC6BD0()
{
  JUMPOUT(0x20CDC6BB8);
}

void sub_20CDC6BD8()
{
  void *v0;

  JUMPOUT(0x20CDC6BBCLL);
}

void sub_20CDC6BE4()
{
  JUMPOUT(0x20CDC6BBCLL);
}

void sub_20CDC6C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_20CDC6D48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDC6DA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDC6E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDC7034(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_20CDC790C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_20CDC7D80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CDC8568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_20CDC8820(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CDC8930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  id *v18;

  objc_destroyWeak(v18);
  _Unwind_Resume(a1);
}

void sub_20CDC8B2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDC8BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDC8BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDC8C7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDC8CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDC8DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_20CDC8E5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDC8F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_20CDC9310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_20CDC94AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDC955C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_20CDC9614(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDC9858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_20CDC9C98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v2;

  _Unwind_Resume(a1);
}

void sub_20CDC9F9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDCA114(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDCA1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_20CDCA364(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDCA3C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDCA66C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20CDCA750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDCA7D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20CDCAA6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_20CDCABC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20CDCAC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_20CDCAD5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_20CDCAE48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t tpThreadInit(unsigned int *a1, unsigned int a2, int a3, unsigned int a4, int a5)
{
  size_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  size_t v12;
  const char *v13;
  uint64_t v14;
  _DWORD *v15;
  void *v16;
  const char *v18;

  *a1 = a2;
  a1[1] = 0;
  *((_QWORD *)a1 + 1) = 0;
  if (!a2)
    return 0;
  a1[1] = a3 + a2;
  v8 = 176 * (a3 + a2);
  v9 = malloc_type_malloc(v8, 0xACD0F4C6uLL);
  *((_QWORD *)a1 + 1) = v9;
  if (!v9)
  {
    v18 = "***tpThreadInit: malloc failure";
LABEL_14:
    puts(v18);
    return 1;
  }
  bzero(v9, v8);
  if (!a1[1])
    return 0;
  v10 = 0;
  v11 = 0;
  v12 = a4;
  v13 = "***tpThreadInit: Error initializing mutex";
  while (1)
  {
    v14 = *((_QWORD *)a1 + 1);
    v15 = (_DWORD *)(v14 + v10);
    v16 = malloc_type_malloc(v12, 0x75453uLL);
    *(_QWORD *)(v14 + v10 + 144) = v16;
    if (!v16)
    {
      v18 = "***tpThreadInit: malloc failure";
      goto LABEL_14;
    }
    bzero(v16, v12);
    *v15 = 0;
    v15[32] = v11;
    if (v11 < *a1)
    {
      if (pthread_mutex_init((pthread_mutex_t *)(v14 + v10 + 8), 0))
        goto LABEL_17;
      if (pthread_cond_init((pthread_cond_t *)(v14 + v10 + 72), 0))
      {
        v13 = "***tpThreadInit: Error initializing pthreadCond";
        goto LABEL_17;
      }
      if (pthread_create((pthread_t *)(v14 + v10 + 120), 0, (void *(__cdecl *)(void *))tpThread, (void *)(v14 + v10)))
        break;
    }
    *(_DWORD *)(v14 + v10 + 168) = a5;
    ++v11;
    v10 += 176;
    if (v11 >= a1[1])
      return 0;
  }
  v13 = "***tpThreadInit: Error starting up server thread";
LABEL_17:
  puts(v13);
  free(*((void **)a1 + 1));
  *((_QWORD *)a1 + 1) = 0;
  return 2;
}

uint64_t tpThread(char *a1)
{
  thread_act_t v2;
  kern_return_t v3;
  int v4;
  const char *v5;
  integer_t policy_info;

  if ((a1[168] & 1) != 0)
  {
    policy_info = *((_DWORD *)a1 + 32) + 1;
    v2 = MEMORY[0x212B95944]();
    v3 = thread_policy_set(v2, 4u, &policy_info, 1u);
    if (v3)
      printf("setThreadAffinity: thread_policy_set returned %d\n", v3);
  }
  while (1)
  {
    if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 8)))
    {
      v5 = "***tpThread: Error acquiring lock; aborting.";
      goto LABEL_18;
    }
    while (!*(_DWORD *)a1)
    {
      v4 = pthread_cond_wait((pthread_cond_t *)(a1 + 72), (pthread_mutex_t *)(a1 + 8));
      if (v4)
      {
        printf("***tpThread: Error waiting on condition; error %d; aborting.\n", v4);
        goto LABEL_14;
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    if (*((_DWORD *)a1 + 34) == 1)
      return 0;
    *((_DWORD *)a1 + 40) = (*((uint64_t (**)(_QWORD))a1 + 19))(*((_QWORD *)a1 + 18));
    if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 8)))
    {
      v5 = "***Error acquiring lock; aborting.";
      goto LABEL_18;
    }
    *(_DWORD *)a1 = 0;
    if (pthread_cond_broadcast((pthread_cond_t *)(a1 + 72)))
    {
      v5 = "***Error waking main thread; aborting.";
      goto LABEL_18;
    }
    if (pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8)))
    {
      v5 = "***Error acquiring server lock; aborting.";
LABEL_18:
      puts(v5);
LABEL_14:
      pthread_exit(0);
    }
  }
}

void tpThreadShutdown(unsigned int *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  pthread_cond_t *v12;
  void *v13;

  if (*a1)
  {
    if (!a1[1])
      goto LABEL_8;
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *((_QWORD *)a1 + 1);
      if (v3 < *a1)
      {
        v5 = (_DWORD *)(v4 + v2);
        pthread_mutex_lock((pthread_mutex_t *)(v4 + v2 + 8));
        v5[34] = 1;
        *v5 = 1;
        pthread_cond_broadcast((pthread_cond_t *)(v4 + v2 + 72));
        pthread_mutex_unlock((pthread_mutex_t *)(v4 + v2 + 8));
      }
      free(*(void **)(v4 + v2 + 144));
      *(_QWORD *)(v4 + v2 + 144) = 0;
      ++v3;
      v2 += 176;
    }
    while (v3 < a1[1]);
    if (*a1)
    {
LABEL_8:
      v6 = 0;
      v7 = 120;
      do
      {
        v8 = *((_QWORD *)a1 + 1);
        v13 = 0;
        pthread_join(*(pthread_t *)(v8 + v7), &v13);
        ++v6;
        v9 = *a1;
        v7 += 176;
      }
      while (v6 < v9);
      if ((_DWORD)v9)
      {
        v10 = 0;
        v11 = 72;
        do
        {
          v12 = (pthread_cond_t *)(*((_QWORD *)a1 + 1) + v11);
          pthread_mutex_destroy((pthread_mutex_t *)&v12[-2].__opaque[24]);
          pthread_cond_destroy(v12);
          ++v10;
          v11 += 176;
        }
        while (v10 < *a1);
      }
    }
    free(*((void **)a1 + 1));
    *((_QWORD *)a1 + 1) = 0;
  }
}

uint64_t tpThreadDispatch(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;

  if (!a2)
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = a2;
  while (1)
  {
    v6 = *(_QWORD *)(a1 + 8);
    *(_DWORD *)(v6 + v3 + 160) = 2;
    if (pthread_mutex_lock((pthread_mutex_t *)(v6 + v3 + 8)))
    {
      v8 = "tpThreadDispatch: mutex error";
      goto LABEL_12;
    }
    if (*(_DWORD *)(v6 + v3))
    {
      printf("tpThreadDispatch: thread %u not idle\n", v4);
      return 2;
    }
    *(_DWORD *)(v6 + v3) = 1;
    if (pthread_cond_broadcast((pthread_cond_t *)(v6 + v3 + 72)))
      break;
    pthread_mutex_unlock((pthread_mutex_t *)(v6 + v3 + 8));
    ++v4;
    v3 += 176;
    if (v5 == v4)
      return 0;
  }
  v8 = "tpThreadDispatch: cond_broadcast error";
LABEL_12:
  puts(v8);
  return 2;
}

uint64_t tpThreadFinish(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;

  if (!a2)
    return 0;
  v3 = 0;
  LODWORD(v4) = 0;
  v5 = a2;
  v6 = "***tpThreadFinish: Error acquiring lock";
  while (1)
  {
    v7 = *(_QWORD *)(a1 + 8);
    v8 = v7 + 176 * v3;
    if (pthread_mutex_lock((pthread_mutex_t *)(v8 + 8)))
      break;
    while (*(_DWORD *)v8 == 1)
    {
      if (pthread_cond_wait((pthread_cond_t *)(v7 + 176 * v3 + 72), (pthread_mutex_t *)(v8 + 8)))
      {
        v6 = "***tpThreadFinish: Error waiting on condition";
        goto LABEL_15;
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v8 + 8));
    v9 = *(_DWORD *)(v7 + 176 * v3 + 160);
    if ((_DWORD)v4)
      v10 = 1;
    else
      v10 = v9 == 0;
    if (v10)
      v4 = v4;
    else
      v4 = v9;
    if (++v3 == v5)
      return v4;
  }
LABEL_15:
  puts(v6);
  return 2;
}

uint64_t ThreadPoolAuto::setupCommon(uint64_t result, unsigned int *a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v8;
  int v9;
  int v10;
  _QWORD *v11;
  void *exception;
  size_t v13;
  int v14;

  v5 = result;
  if (a2)
  {
    v6 = *a2;
    *(_DWORD *)(result + 16) = *a2;
    if (v6)
    {
      if (a4)
      {
        if (v6 > a4)
          *(_DWORD *)(result + 16) = a4;
      }
      return result;
    }
LABEL_25:
    *(_DWORD *)(v5 + 16) = 1;
    return result;
  }
  if (a3 == 1 || a4 == 1)
    goto LABEL_25;
  if (a4)
  {
    if (a3 >= a4)
      v8 = a4;
    else
      v8 = a3;
    if (!a3)
      v8 = a4;
    *(_DWORD *)(result + 16) = v8;
    goto LABEL_21;
  }
  *(_DWORD *)(result + 16) = a3;
  if (a3)
    goto LABEL_21;
  v14 = 0;
  v13 = 4;
  result = sysctlbyname("hw.physicalcpu", &v14, &v13, 0, 0);
  if ((_DWORD)result)
  {
    perror("sysctlbyname(hw.physicalcpu)");
    result = puts("***Error executing sysctlbyname(hw.physicalcpu)");
    goto LABEL_25;
  }
  v9 = v14;
  v10 = v14 <= 1 ? 1 : v14;
  *(_DWORD *)(v5 + 16) = v10;
  if (v9 >= 2)
  {
LABEL_21:
    v11 = malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
    *(_QWORD *)(v5 + 8) = v11;
    if (v11)
    {
      *v11 = 0;
      v11[1] = 0;
      result = tpThreadInit(*(unsigned int **)(v5 + 8), *(_DWORD *)(v5 + 16), 0, a5, 1);
      if (!(_DWORD)result)
      {
        *(_BYTE *)(v5 + 20) = 1;
        return result;
      }
      fwrite("***ThreadPoolAuto: tpThreadInit error\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x212B95578](exception, "tpThreadInit error");
    }
    else
    {
      fwrite("***malloc failure\n", 0x12uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x212B95578](exception, "malloc failure");
    }
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return result;
}

void sub_20CDCC39C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void ThreadPoolAuto::~ThreadPoolAuto(unsigned int **this)
{
  *this = (unsigned int *)&off_24C58AD48;
  if (*((_BYTE *)this + 20))
  {
    if (!*((_BYTE *)this + 21))
      tpThreadShutdown(this[1]);
    free(this[1]);
  }
}

{
  ThreadPoolAuto::~ThreadPoolAuto(this);
  JUMPOUT(0x212B95704);
}

uint64_t ThreadPoolAuto::runThreads(ThreadPoolAuto *this, unsigned int a2)
{
  unsigned int v2;
  uint64_t v4;
  uint64_t v5;
  FILE *v6;
  const char *v7;
  size_t v8;

  v2 = a2;
  if (!a2)
    v2 = *((_DWORD *)this + 4);
  v4 = tpThreadDispatch(*((_QWORD *)this + 1), v2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (FILE *)*MEMORY[0x24BDAC8D8];
    v7 = "***ThreadPoolAuto::runThreads: tpThreadDispatch error\n";
    v8 = 54;
LABEL_7:
    fwrite(v7, v8, 1uLL, v6);
    *((_BYTE *)this + 21) = 1;
    return v5;
  }
  v5 = tpThreadFinish(*((_QWORD *)this + 1), v2);
  if ((_DWORD)v5)
  {
    v6 = (FILE *)*MEMORY[0x24BDAC8D8];
    v7 = "***ThreadPoolAuto::runThreads: tpThreadFinish error\n";
    v8 = 52;
    goto LABEL_7;
  }
  return v5;
}

void CNNSignals::CNNSignals(CNNSignals *this, unsigned int a2)
{
  char **v3;
  char **v4;
  char **v5;
  unint64_t v6;
  char *v7;
  char *v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void *v20;
  int64x2_t v21;
  char *v22;
  char *v23;
  char *v24;
  void (**v25)(char *);
  BOOL v26;
  char *v27;
  int64x2_t *v28;
  int64x2_t *v29;
  char **v30;
  char **v31;
  char **v32;
  char **v33;
  int64x2_t *v34;
  int64x2_t *v35;
  int64x2_t *v36;
  int64x2_t *v37;
  int64x2_t *v38;
  char *v39;
  int64x2_t v40;
  char *v41;
  char *v42;

  *((_OWORD *)this + 3) = 0u;
  v32 = (char **)((char *)this + 48);
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_QWORD *)this + 12) = &off_24C58B080;
  v3 = (char **)((char *)this + 24);
  *(_OWORD *)this = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  v4 = (char **)((char *)this + 152);
  v33 = (char **)((char *)this + 176);
  *(_OWORD *)((char *)this + 200) = 0u;
  v5 = (char **)((char *)this + 200);
  v30 = (char **)((char *)this + 72);
  v31 = (char **)((char *)this + 224);
  *(_OWORD *)((char *)this + 248) = 0u;
  v28 = (int64x2_t *)((char *)this + 248);
  v29 = (int64x2_t *)((char *)this + 272);
  *(_OWORD *)((char *)this + 120) = 0u;
  v35 = (int64x2_t *)((char *)this + 344);
  *(_OWORD *)((char *)this + 136) = 0u;
  v37 = (int64x2_t *)((char *)this + 320);
  v38 = (int64x2_t *)((char *)this + 368);
  v36 = (int64x2_t *)((char *)this + 392);
  *(_OWORD *)((char *)this + 168) = 0u;
  v34 = (int64x2_t *)((char *)this + 416);
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  *(_OWORD *)((char *)this + 312) = 0u;
  *(_OWORD *)((char *)this + 328) = 0u;
  *(_OWORD *)((char *)this + 344) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  *(_OWORD *)((char *)this + 424) = 0u;
  *((_QWORD *)this + 55) = &off_24C58B080;
  *((_QWORD *)this + 56) = 0;
  *((_QWORD *)this + 57) = 0;
  *((_QWORD *)this + 58) = 0;
  *((_QWORD *)this + 59) = &off_24C58B080;
  *((_QWORD *)this + 60) = 0;
  v6 = a2;
  *((_QWORD *)this + 61) = 0;
  *((_QWORD *)this + 62) = 0;
  std::vector<matrix<float>>::resize((int64x2_t *)((char *)this + 296), a2);
  std::vector<matrix<float>>::resize(v38, v6);
  std::vector<matrix<float>>::resize(v37, v6);
  std::vector<matrix<float>>::resize(v36, v6);
  std::vector<matrix<float>>::resize(v35, v6);
  std::vector<matrix<float>>::resize(v34, v6);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize((char **)this, v6);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v4, v6);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v5, v6);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v3, v6);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v33, v6);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v32, v6);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v31, v6);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v30, v6);
  std::vector<matrix<float>>::resize(v29, v6);
  v8 = (char *)*((_QWORD *)this + 31);
  v7 = (char *)*((_QWORD *)this + 32);
  v9 = (v7 - v8) >> 5;
  if (v6 <= v9)
  {
    if (v6 < v9)
    {
      v22 = &v8[32 * v6];
      if (v7 != v22)
      {
        v23 = v7 - 32;
        v24 = v7 - 32;
        do
        {
          v25 = *(void (***)(char *))v24;
          v24 -= 32;
          (*v25)(v23);
          v26 = v23 == v22;
          v23 = v24;
        }
        while (!v26);
      }
      *((_QWORD *)this + 32) = v22;
    }
  }
  else
  {
    v10 = (char *)*((_QWORD *)this + 33);
    if (v6 - v9 <= (v10 - v7) >> 5)
    {
      v27 = &v7[32 * (v6 - v9)];
      do
      {
        *(_QWORD *)v7 = &off_24C58B0A0;
        *((_QWORD *)v7 + 1) = 0;
        *((_QWORD *)v7 + 2) = 0;
        *((_QWORD *)v7 + 3) = 0;
        v7 += 32;
      }
      while (v7 != v27);
      *((_QWORD *)this + 32) = v27;
    }
    else
    {
      v11 = (v10 - v8) >> 4;
      if (v11 <= v6)
        v11 = v6;
      if ((unint64_t)(v10 - v8) >= 0x7FFFFFFFFFFFFFE0)
        v12 = 0x7FFFFFFFFFFFFFFLL;
      else
        v12 = v11;
      v42 = (char *)this + 264;
      if (v12 >> 59)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v13 = (char *)operator new(32 * v12);
      v14 = &v13[32 * v9];
      v39 = v13;
      v40.i64[0] = (uint64_t)v14;
      v15 = &v13[32 * v12];
      v41 = v15;
      v16 = &v13[32 * v6];
      v17 = v14;
      do
      {
        *(_QWORD *)v17 = &off_24C58B0A0;
        *((_QWORD *)v17 + 1) = 0;
        *((_QWORD *)v17 + 2) = 0;
        *((_QWORD *)v17 + 3) = 0;
        v17 += 32;
      }
      while (v17 != v16);
      v40.i64[1] = (uint64_t)&v13[32 * v6];
      if (v7 == v8)
      {
        v21 = vdupq_n_s64((unint64_t)v7);
      }
      else
      {
        v18 = 0;
        do
        {
          v19 = &v14[v18];
          *((_QWORD *)v19 - 4) = &off_24C58B0A0;
          *((_QWORD *)v19 - 3) = *(_QWORD *)&v7[v18 - 24];
          *((_QWORD *)v19 - 2) = *(_QWORD *)&v7[v18 - 16];
          v20 = (void *)operator new[]();
          *((_QWORD *)v19 - 1) = v20;
          memcpy(v20, *(const void **)&v7[v18 - 8], 4 * *((_QWORD *)v19 - 3) * *((_QWORD *)v19 - 2));
          v18 -= 32;
        }
        while (&v7[v18] != v8);
        v21 = *v28;
        v16 = (char *)v40.i64[1];
        v15 = v41;
        v14 += v18;
        v10 = (char *)*((_QWORD *)this + 33);
      }
      *((_QWORD *)this + 31) = v14;
      *((_QWORD *)this + 32) = v16;
      v40 = v21;
      *((_QWORD *)this + 33) = v15;
      v41 = v10;
      v39 = (char *)v21.i64[0];
      std::__split_buffer<matrix<float>>::~__split_buffer((uint64_t)&v39);
    }
  }
}

void sub_20CDCC874(_Unwind_Exception *a1, uint64_t a2, void **a3, uint64_t a4, void **a5, void **a6, void **a7, void **a8, void **a9, void **a10, void **a11, void **a12, void **a13, void **a14, void **a15, void **a16, ...)
{
  uint64_t v16;
  void **v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void **i;
  va_list va;
  va_list va1;

  va_start(va1, a16);
  va_start(va, a16);
  for (i = va_arg(va1, void **); v20; v20 += 32)
    (**(void (***)(uint64_t))(v18 + v20))(v18 + v20);
  std::__split_buffer<matrix<float>>::~__split_buffer((uint64_t)va1);
  *(_QWORD *)(v16 + 472) = &off_24C58B080;
  v22 = *(_QWORD *)(v16 + 496);
  if (v22)
    MEMORY[0x212B956EC](v22, 0x1000C8052888210);
  *(_QWORD *)(v16 + 440) = &off_24C58B080;
  v23 = *(_QWORD *)(v16 + 464);
  if (v23)
    MEMORY[0x212B956EC](v23, 0x1000C8052888210);
  i = a12;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  i = a14;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  i = a16;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  i = a13;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  i = a15;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  i = a5;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  i = a7;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  i = a6;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  v24 = *a9;
  if (*a9)
  {
    *(_QWORD *)(v16 + 232) = v24;
    operator delete(v24);
  }
  v25 = *v19;
  if (*v19)
  {
    *(_QWORD *)(v16 + 208) = v25;
    operator delete(v25);
  }
  v26 = *a11;
  if (*a11)
  {
    *(_QWORD *)(v16 + 184) = v26;
    operator delete(v26);
  }
  v27 = *v17;
  if (*v17)
  {
    *(_QWORD *)(v16 + 160) = v27;
    operator delete(v27);
  }
  i = (void **)(v16 + 128);
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  *(_QWORD *)(v16 + 96) = &off_24C58B080;
  v28 = *(_QWORD *)(v16 + 120);
  if (v28)
    MEMORY[0x212B956EC](v28, 0x1000C8052888210);
  v29 = *a8;
  if (*a8)
  {
    *(_QWORD *)(v16 + 80) = v29;
    operator delete(v29);
  }
  v30 = *a10;
  if (*a10)
  {
    *(_QWORD *)(v16 + 56) = v30;
    operator delete(v30);
  }
  v31 = *a3;
  if (*a3)
  {
    *(_QWORD *)(v16 + 32) = v31;
    operator delete(v31);
  }
  v32 = *(void **)v16;
  if (*(_QWORD *)v16)
  {
    *(_QWORD *)(v16 + 8) = v32;
    operator delete(v32);
  }
  _Unwind_Resume(a1);
}

int64x2_t *std::vector<matrix<float>>::resize(int64x2_t *result, unint64_t a2)
{
  int64x2_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  int64x2_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t (***v21)(_QWORD);
  uint64_t (**v22)(_QWORD *);
  BOOL v23;
  _QWORD *v24;
  char *v25;
  int64x2_t v26;
  char *v27;
  int64x2_t *v28;

  v3 = result;
  v5 = (_QWORD *)result->i64[0];
  v4 = (_QWORD *)result->i64[1];
  v6 = ((uint64_t)v4 - result->i64[0]) >> 5;
  if (a2 <= v6)
  {
    if (a2 < v6)
    {
      v19 = &v5[4 * a2];
      if (v4 != v19)
      {
        v20 = v4 - 4;
        v21 = (uint64_t (***)(_QWORD))(v4 - 4);
        do
        {
          v22 = (uint64_t (**)(_QWORD *))*v21;
          v21 -= 4;
          result = (int64x2_t *)(*v22)(v20);
          v23 = v20 == v19;
          v20 = v21;
        }
        while (!v23);
      }
      v3->i64[1] = (uint64_t)v19;
    }
  }
  else
  {
    v7 = result[1].i64[0];
    if (a2 - v6 <= (v7 - (uint64_t)v4) >> 5)
    {
      v24 = &v4[4 * (a2 - v6)];
      do
      {
        *v4 = &off_24C58B080;
        v4[1] = 0;
        v4[2] = 0;
        v4[3] = 0;
        v4 += 4;
      }
      while (v4 != v24);
      result->i64[1] = (uint64_t)v24;
    }
    else
    {
      if (a2 >> 59)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v8 = (v7 - (uint64_t)v5) >> 4;
      if (v8 <= a2)
        v8 = a2;
      if ((unint64_t)(v7 - (_QWORD)v5) >= 0x7FFFFFFFFFFFFFE0)
        v9 = 0x7FFFFFFFFFFFFFFLL;
      else
        v9 = v8;
      v28 = result + 1;
      if (v9 >> 59)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v10 = (char *)operator new(32 * v9);
      v11 = &v10[32 * v6];
      v25 = v10;
      v26.i64[0] = (uint64_t)v11;
      v12 = &v10[32 * v9];
      v27 = v12;
      v13 = &v10[32 * a2];
      v14 = v11;
      do
      {
        *(_QWORD *)v14 = &off_24C58B080;
        *((_QWORD *)v14 + 1) = 0;
        *((_QWORD *)v14 + 2) = 0;
        *((_QWORD *)v14 + 3) = 0;
        v14 += 32;
      }
      while (v14 != v13);
      v26.i64[1] = (uint64_t)&v10[32 * a2];
      if (v4 == v5)
      {
        v18 = vdupq_n_s64((unint64_t)v4);
      }
      else
      {
        v15 = 0;
        do
        {
          v16 = &v11[v15 * 8];
          *((_QWORD *)v16 - 4) = &off_24C58B080;
          *((_QWORD *)v16 - 3) = v4[v15 - 3];
          *((_QWORD *)v16 - 2) = v4[v15 - 2];
          v17 = (void *)operator new[]();
          *((_QWORD *)v16 - 1) = v17;
          memcpy(v17, (const void *)v4[v15 - 1], 4 * *((_QWORD *)v16 - 3) * *((_QWORD *)v16 - 2));
          v15 -= 4;
        }
        while (&v4[v15] != v5);
        v18 = *v3;
        v13 = (char *)v26.i64[1];
        v12 = v27;
        v11 += v15 * 8;
        v7 = v3[1].i64[0];
      }
      v3->i64[0] = (uint64_t)v11;
      v3->i64[1] = (uint64_t)v13;
      v26 = v18;
      v3[1].i64[0] = (uint64_t)v12;
      v27 = (char *)v7;
      v25 = (char *)v18.i64[0];
      return (int64x2_t *)std::__split_buffer<matrix<float>>::~__split_buffer((uint64_t)&v25);
    }
  }
  return result;
}

void std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(char **a1, unint64_t a2)
{
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;

  v4 = *a1;
  v3 = a1[1];
  v5 = (v3 - *a1) >> 3;
  if (a2 <= v5)
  {
    if (a2 >= v5)
      return;
    v16 = &v4[8 * a2];
    goto LABEL_18;
  }
  v6 = a2 - v5;
  v7 = a1[2];
  if (a2 - v5 <= (v7 - v3) >> 3)
  {
    bzero(a1[1], 8 * v6);
    v16 = &v3[8 * v6];
LABEL_18:
    a1[1] = v16;
    return;
  }
  if (a2 >> 61)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v8 = v7 - v4;
  v9 = v8 >> 2;
  if (v8 >> 2 <= a2)
    v9 = a2;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
    v10 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v10 = v9;
  if (v10 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v11 = (char *)operator new(8 * v10);
  v12 = &v11[8 * v5];
  v13 = &v11[8 * v10];
  bzero(v12, 8 * v6);
  v14 = &v12[8 * v6];
  if (v3 != v4)
  {
    do
    {
      v15 = *((_QWORD *)v3 - 1);
      v3 -= 8;
      *((_QWORD *)v12 - 1) = v15;
      v12 -= 8;
    }
    while (v3 != v4);
    v3 = v4;
  }
  *a1 = v12;
  a1[1] = v14;
  a1[2] = v13;
  if (v3)
    operator delete(v3);
}

void CNNSignals::prepareLayer(CNNSignals *this, unsigned int a2, char a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = a2;
  if ((a3 & 1) != 0)
  {
    v11 = a4;
    v12 = a5;
    matrix<float>::resize((_QWORD *)(*((_QWORD *)this + 37) + 32 * a2), a4, a5, 0);
    matrix<float>::resize((_QWORD *)(*((_QWORD *)this + 46) + 32 * v10), v11, v12, 0);
    bzero(*(void **)(*((_QWORD *)this + 37) + 32 * v10 + 24), 4 * *(_QWORD *)(*((_QWORD *)this + 37) + 32 * v10 + 8) * *(_QWORD *)(*((_QWORD *)this + 37) + 32 * v10 + 16));
    bzero(*(void **)(*((_QWORD *)this + 46) + 32 * v10 + 24), 4 * *(_QWORD *)(*((_QWORD *)this + 46) + 32 * v10 + 8) * *(_QWORD *)(*((_QWORD *)this + 46) + 32 * v10 + 16));
  }
  matrix<float>::resize((_QWORD *)(*((_QWORD *)this + 40) + 32 * v10), a6, a7, 0);
  matrix<float>::resize((_QWORD *)(*((_QWORD *)this + 49) + 32 * v10), a6, a7, 0);
  bzero(*(void **)(*((_QWORD *)this + 40) + 32 * v10 + 24), 4 * *(_QWORD *)(*((_QWORD *)this + 40) + 32 * v10 + 8) * *(_QWORD *)(*((_QWORD *)this + 40) + 32 * v10 + 16));
  bzero(*(void **)(*((_QWORD *)this + 49) + 32 * v10 + 24), 4 * *(_QWORD *)(*((_QWORD *)this + 49) + 32 * v10 + 8) * *(_QWORD *)(*((_QWORD *)this + 49) + 32 * v10 + 16));
}

uint64_t CNNSignals::initLayer(_QWORD *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(a1[19] + 8 * a2) = a4;
  *(_QWORD *)(a1[25] + 8 * a2) = a5;
  *(_QWORD *)(a1[28] + 8 * a2) = a6;
  *(_QWORD *)(a1[22] + 8 * a2) = a7;
  v8 = a2;
  v9 = *(_QWORD **)(a1[25] + 8 * a2);
  v10 = a3;
  if (!v9[1])
  {
    matrix<float>::resize(v9, 1, a3, 0);
    v11 = *(_QWORD *)(a1[25] + 8 * v8);
    bzero(*(void **)(v11 + 24), 4 * *(_QWORD *)(v11 + 8) * *(_QWORD *)(v11 + 16));
    matrix<float>::resize(*(_QWORD **)(a1[22] + 8 * v8), 1, v10, 0);
    v12 = *(_QWORD *)(a1[22] + 8 * v8);
    bzero(*(void **)(v12 + 24), 4 * *(_QWORD *)(v12 + 8) * *(_QWORD *)(v12 + 16));
  }
  return matrix<float>::resize((_QWORD *)(a1[34] + 32 * v8), 1, v10, 0);
}

uint64_t CNNSignals::initConvLayer(_QWORD *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v16 = a2;
  *(_QWORD *)(*a1 + 8 * a2) = a6;
  *(_QWORD *)(a1[9] + 8 * a2) = a9;
  *(_QWORD *)(a1[19] + 8 * a2) = a7;
  *(_QWORD *)(a1[25] + 8 * a2) = a8;
  *(_QWORD *)(a1[28] + 8 * a2) = a10;
  *(_QWORD *)(a1[22] + 8 * a2) = a11;
  *(_QWORD *)(a1[3] + 8 * a2) = a12;
  *(_QWORD *)(a1[6] + 8 * a2) = a13;
  if (a5)
  {
    v17 = (a4 - 1) * (a3 - 1) + 1;
    matrix<float>::resize(*(_QWORD **)(a1[3] + 8 * a2), 1, v17, 0);
    matrix<float>::resize(*(_QWORD **)(a1[6] + 8 * v16), 1, v17, 0);
    v18 = *(_QWORD *)(a1[3] + 8 * v16);
    bzero(*(void **)(v18 + 24), 4 * *(_QWORD *)(v18 + 8) * *(_QWORD *)(v18 + 16));
    v19 = *(_QWORD *)(a1[6] + 8 * v16);
    bzero(*(void **)(v19 + 24), 4 * *(_QWORD *)(v19 + 8) * *(_QWORD *)(v19 + 16));
  }
  matrix<float>::resize(*(_QWORD **)(a1[25] + 8 * v16), a3, a4, 0);
  matrix<float>::resize(*(_QWORD **)(a1[22] + 8 * v16), a3, a4, 0);
  v20 = *(_QWORD *)(a1[25] + 8 * v16);
  bzero(*(void **)(v20 + 24), 4 * *(_QWORD *)(v20 + 8) * *(_QWORD *)(v20 + 16));
  v21 = *(_QWORD *)(a1[22] + 8 * v16);
  bzero(*(void **)(v21 + 24), 4 * *(_QWORD *)(v21 + 8) * *(_QWORD *)(v21 + 16));
  return matrix<float>::resize((_QWORD *)(a1[34] + 32 * v16), a3, a4, 0);
}

uint64_t CNNSignals::initPoolLayer(_QWORD *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
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
  _QWORD *v27;
  uint64_t result;

  v16 = a2;
  *(_QWORD *)(*a1 + 8 * a2) = a6;
  *(_QWORD *)(a1[9] + 8 * a2) = a9;
  *(_QWORD *)(a1[19] + 8 * a2) = a7;
  *(_QWORD *)(a1[25] + 8 * a2) = a8;
  *(_QWORD *)(a1[28] + 8 * a2) = a10;
  *(_QWORD *)(a1[22] + 8 * a2) = a11;
  *(_QWORD *)(a1[3] + 8 * a2) = a12;
  *(_QWORD *)(a1[6] + 8 * a2) = a13;
  if (a5)
  {
    v17 = (a4 - 1) * (a3 - 1) + 1;
    matrix<float>::resize(*(_QWORD **)(a1[3] + 8 * a2), 1, v17, 0);
    matrix<float>::resize(*(_QWORD **)(a1[6] + 8 * v16), 1, v17, 0);
    v18 = *(_QWORD *)(a1[3] + 8 * v16);
    bzero(*(void **)(v18 + 24), 4 * *(_QWORD *)(v18 + 8) * *(_QWORD *)(v18 + 16));
    v19 = *(_QWORD *)(a1[6] + 8 * v16);
    bzero(*(void **)(v19 + 24), 4 * *(_QWORD *)(v19 + 8) * *(_QWORD *)(v19 + 16));
  }
  matrix<float>::resize(*(_QWORD **)(a1[25] + 8 * v16), a3, a4, 0);
  matrix<float>::resize(*(_QWORD **)(a1[22] + 8 * v16), a3, a4, 0);
  v20 = *(_QWORD *)(a1[25] + 8 * v16);
  bzero(*(void **)(v20 + 24), 4 * *(_QWORD *)(v20 + 8) * *(_QWORD *)(v20 + 16));
  v21 = *(_QWORD *)(a1[22] + 8 * v16);
  bzero(*(void **)(v21 + 24), 4 * *(_QWORD *)(v21 + 8) * *(_QWORD *)(v21 + 16));
  v22 = a1[31];
  v23 = *(_QWORD *)(a1[25] + 8 * v16);
  v24 = *(_QWORD *)(v23 + 8);
  v25 = *(_QWORD *)(v23 + 16);
  v26 = operator new[]();
  v27 = (_QWORD *)(v22 + 32 * v16);
  result = v27[3];
  if (result)
    result = MEMORY[0x212B956EC](result, 0x1000C8052888210);
  v27[1] = v24;
  v27[2] = v25;
  v27[3] = v26;
  return result;
}

void std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  char *v7;
  void (**v8)(char *);
  BOOL v9;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = v4 - 32;
      v7 = v4 - 32;
      do
      {
        v8 = *(void (***)(char *))v7;
        v7 -= 32;
        (*v8)(v6);
        v9 = v6 == v2;
        v6 = v7;
      }
      while (!v9);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__split_buffer<matrix<float>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  void (**v4)(void);

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(void (***)(void))(i - 32);
    *(_QWORD *)(a1 + 16) = i - 32;
    (*v4)();
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_QWORD *matrix<unsigned int>::~matrix(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_24C58B0A0;
  v2 = a1[3];
  if (v2)
    MEMORY[0x212B956EC](v2, 0x1000C8052888210);
  return a1;
}

void matrix<unsigned int>::~matrix(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_24C58B0A0;
  v1 = a1[3];
  if (v1)
    MEMORY[0x212B956EC](v1, 0x1000C8052888210);
  JUMPOUT(0x212B95704);
}

void sub_20CDCD554(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20CDCD6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDCD864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20CDCD900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDCD990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDCDA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_20CDD0B20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
  MEMORY[0x24BDB6980](*(_QWORD *)&inSystemSoundID);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55E8](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55F8](retstr, t, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x24BDBC6F8](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x24BDBC708](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDBC718](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x24BDBC728](tokenizer, string, range.location, range.length);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x24BDBC730](string, range, transform, reverse);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x24BDBEDD8](path1, m, path2);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEC0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEF50](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0170](allocator, target, *(_QWORD *)&attachmentMode);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x24BDC01E0](target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0320](retstr, sbuf);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC05A0](retstr, lhs, rhs);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0668](videoDesc);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47C8](name, matrix, size);
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return MEMORY[0x24BDC4998](fontURL, *(_QWORD *)&scope, error);
}

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDC49F0](frame);
  result.length = v2;
  result.location = v1;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x24BDC49F8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x24BDC4A00](attrString);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x24BDF8FA8]();
}

uint64_t FigCreateIOSurfaceFromJPEG()
{
  return MEMORY[0x24BE15880]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x24BDF8FB8]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSPoint NSPointFromString(NSString *aString)
{
  double v1;
  double v2;
  NSPoint result;

  MEMORY[0x24BDD1148](aString);
  result.y = v2;
  result.x = v1;
  return result;
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x24BDD11D8](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x24BDD1248]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x24BDD1260]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD13D8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t RectangleFinder::findCodeRectPoints(RectangleFinder *this, vImage_Buffer *a2)
{
  return MEMORY[0x24BEB5BB8](this, a2);
}

void RectangleFinder::RectangleFinder(RectangleFinder *this)
{
  MEMORY[0x24BEB5BC0](this);
}

uint64_t CTCLayer::setCodeMap(CTCLayer *this, const int *a2)
{
  return MEMORY[0x24BEB5BC8](this, a2);
}

uint64_t CTCLayer::removeNoise()
{
  return MEMORY[0x24BEB5BD0]();
}

uint64_t CTCLayer::computeScore()
{
  return MEMORY[0x24BEB5BD8]();
}

uint64_t CTCLayer::injectSpaces()
{
  return MEMORY[0x24BEB5BE0]();
}

uint64_t CTCLayer::setActivations()
{
  return MEMORY[0x24BEB5BE8]();
}

uint64_t CTCLayer::bestPathDecoding(CTCLayer *this)
{
  return MEMORY[0x24BEB5BF0](this);
}

uint64_t CTCLayer::getMaxActivations(CTCLayer *this)
{
  return MEMORY[0x24BEB5BF8](this);
}

uint64_t CTCLayer::setCummulativeScores(CTCLayer *this)
{
  return MEMORY[0x24BEB5C00](this);
}

uint64_t CTCLayer::pathDecodingCTCSegment()
{
  return MEMORY[0x24BEB5C08]();
}

uint64_t CTCLayer::pathDecodingFixedLengthInjectSpaces(CTCLayer *this)
{
  return MEMORY[0x24BEB5C10](this);
}

void CTCLayer::CTCLayer(CTCLayer *this)
{
  MEMORY[0x24BEB5C18](this);
}

void CTCLayer::~CTCLayer(CTCLayer *this)
{
  MEMORY[0x24BEB5C20](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE80]();
}

{
  return MEMORY[0x24BEDAE98]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF18]();
}

{
  return MEMORY[0x24BEDAF50]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x24BEDB3A0]();
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x24BEDB3A8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24C58A560();
}

void operator delete(void *__p)
{
  off_24C58A568(__p);
}

uint64_t operator delete()
{
  return off_24C58A570();
}

uint64_t operator new[]()
{
  return off_24C58A578();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C58A580(__sz);
}

uint64_t operator new()
{
  return off_24C58A588();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t adaptiveThresholdIntegralImage()
{
  return MEMORY[0x24BEB5C28]();
}

uint64_t applyHomograpyMatrix()
{
  return MEMORY[0x24BEB5C30]();
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x24BDAD250](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

clock_t clock(void)
{
  return MEMORY[0x24BDAD9B0]();
}

uint64_t correctHistogram()
{
  return MEMORY[0x24BEB5C38]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

uint64_t find_homography()
{
  return MEMORY[0x24BEB5C48]();
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE840](a1, a2);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x24BDAEC60]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint64_t normalizedPointForSize()
{
  return MEMORY[0x24BEB5C50]();
}

uint64_t normalizedRectForSize()
{
  return MEMORY[0x24BEB5C58]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
  MEMORY[0x24BDAF830](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x24BDB0220](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

int uname(utsname *a1)
{
  return MEMORY[0x24BDB02A8](a1);
}

uint64_t unicodeToNSString()
{
  return MEMORY[0x24BEB5C60]();
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x24BDB3288](__A, __IA, __B, __IB, __C, __IC, __M, __N);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB39C8](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A60](src, dest, tempBuffer, *(_QWORD *)&flags);
}

uint64_t writeBuffer()
{
  return MEMORY[0x24BEB5C68]();
}

uint64_t writeBufferWithFullColor()
{
  return MEMORY[0x24BEB5C70]();
}

