@implementation CSIBitmapWrapper

- (CSIBitmapWrapper)initWithPixelWidth:(unsigned int)a3 pixelHeight:(unsigned int)a4
{
  CSIBitmapWrapper *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSIBitmapWrapper;
  result = -[CSIBitmapWrapper init](&v7, sel_init);
  if (result)
  {
    result->_colorSpaceID = 1;
    result->_pixelFormat = 1095911234;
    result->_width = a3;
    result->_height = a4;
    *(_WORD *)&result->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&result->_allowsPaletteImageCompression = 0;
    result->_imageAlpha = 2;
  }
  return result;
}

- (CSIBitmapWrapper)initWithCGImage:(CGImage *)a3 width:(unsigned int)a4 height:(unsigned int)a5 texturePixelFormat:(int64_t)a6
{
  char *v10;
  CSIBitmapWrapper *v11;
  CGImage *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CSIBitmapWrapper;
  v10 = -[CSIBitmapWrapper init](&v14, sel_init);
  v11 = (CSIBitmapWrapper *)v10;
  if (v10)
  {
    *((_DWORD *)v10 + 7) = a4;
    *((_DWORD *)v10 + 8) = a5;
    *((_WORD *)v10 + 24) = 257;
    *(_DWORD *)(v10 + 51) = 0;
    v12 = CGImageRetain(a3);
    v11->_sourceImage = v12;
    v11->_destImage = 0;
    v11->_texturePixelFormat = a6;
    v11->_imageAlpha = CGImageGetAlphaInfo(v12);
  }
  return v11;
}

- (void)dealloc
{
  CGContext *bitmapContext;
  CGImage *sourceImage;
  CGImage *destImage;
  objc_super v6;

  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
    CFRelease(bitmapContext);
  sourceImage = self->_sourceImage;
  if (sourceImage)
    CFRelease(sourceImage);
  destImage = self->_destImage;
  if (destImage && destImage != self->_sourceImage)
    CFRelease(destImage);
  v6.receiver = self;
  v6.super_class = (Class)CSIBitmapWrapper;
  -[CSIBitmapWrapper dealloc](&v6, sel_dealloc);
}

- (unsigned)height
{
  return self->_height;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setRowbytes:(unint64_t)a3
{
  self->_rowbytes = a3;
}

- (unint64_t)rowbytes
{
  return self->_rowbytes;
}

- (CGContext)bitmapContext
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGContext *result;
  unsigned int v11;
  signed int pixelFormat;
  BOOL v13;
  uint64_t v14;
  const CFStringRef *v15;
  const __CFString *v16;
  int v17;
  unint64_t colorSpaceID;
  int v19;
  const CFStringRef *v20;
  const CFStringRef *v21;
  uint64_t v22;
  CGColorSpace *v23;
  unsigned int v24;
  unsigned int width;
  size_t AlignedBytesPerRow;
  CGContext *v27;
  unsigned int v28;
  unint64_t v29;

  if (self->_sourceImage)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSIGenerator.m"), 2125, CFSTR("can't use a sourceImage and request a bitmapContext at the same time"));
  result = self->_bitmapContext;
  if (!result)
  {
    v11 = (self->_imageAlpha < 7) & (0x61u >> self->_imageAlpha);
    pixelFormat = self->_pixelFormat;
    if (pixelFormat > 1195456543)
    {
      if (pixelFormat != 1195456544)
      {
        if (pixelFormat == 1380401751)
        {
          colorSpaceID = self->_colorSpaceID;
          if (v11)
            v19 = 4101;
          else
            v19 = 4097;
          v13 = colorSpaceID == 4;
          v14 = v19 | ((colorSpaceID == 4) << 8);
          goto LABEL_32;
        }
LABEL_28:
        _CUILog(4, (uint64_t)"Unsupported CSIGenerator pixel format: %d", v2, v3, v4, v5, v6, v7, self->_pixelFormat);
        return 0;
      }
      if (v11)
      {
        v14 = 0;
        v16 = kCGColorSpaceGenericGrayGamma2_2;
        v17 = 1;
LABEL_40:
        v22 = 8;
        goto LABEL_41;
      }
      v16 = kCGColorSpaceSRGB;
      v14 = 8194;
    }
    else
    {
      if (pixelFormat != 1095911234)
      {
        if (pixelFormat == 1195454774)
        {
          v13 = self->_colorSpaceID == 6;
          if (v11)
          {
            if (self->_colorSpaceID == 6)
              v14 = 4352;
            else
              v14 = 4096;
            v15 = &kCGColorSpaceExtendedGray;
            if (self->_colorSpaceID != 6)
              v15 = &kCGColorSpaceGenericGrayGamma2_2;
            v16 = *v15;
            v17 = 2;
LABEL_35:
            v22 = 16;
LABEL_41:
            v23 = CGColorSpaceCreateWithName(v16);
            v24 = -[CSIBitmapWrapper allowsOptimalRowbytesPacking](self, "allowsOptimalRowbytesPacking");
            width = self->_width;
            AlignedBytesPerRow = width * v17;
            if (v24)
            {
              AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow(width * v17);
              width = self->_width;
            }
            v27 = CGBitmapContextCreate(0, width, self->_height, v22, AlignedBytesPerRow, v23, v14);
            self->_bitmapContext = v27;
            if (!v27)
              -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSIGenerator.m"), 2242, CFSTR("CoreUI: Unable to create bitmap context for distill output target with _width %d _height %d PixelFormat: %d, ColorSpace: %@, BitsPerComponent: %d, bitmapInfo: %d"), self->_width, self->_height, self->_pixelFormat, v23, v22, v14);
            CGColorSpaceRelease(v23);
            v28 = -[CSIBitmapWrapper flipped](self, "flipped");
            result = self->_bitmapContext;
            if (v28)
            {
              LODWORD(v29) = self->_height;
              CGContextTranslateCTM(result, 0.0, (double)v29);
              CGContextScaleCTM(self->_bitmapContext, 1.0, -1.0);
              return self->_bitmapContext;
            }
            return result;
          }
          if (self->_colorSpaceID == 6)
            v14 = 4353;
          else
            v14 = 4097;
LABEL_32:
          v21 = &kCGColorSpaceExtendedSRGB;
          if (!v13)
            v21 = &kCGColorSpaceDisplayP3;
          v16 = *v21;
          v17 = 8;
          goto LABEL_35;
        }
        goto LABEL_28;
      }
      if ((v11 & -[CSIBitmapWrapper allowsMultiPassEncoding](self, "allowsMultiPassEncoding")) != 0)
        v14 = 8198;
      else
        v14 = 8194;
      if (self->_colorSpaceID == 3)
        v20 = &kCGColorSpaceDisplayP3;
      else
        v20 = &kCGColorSpaceSRGB;
      v16 = *v20;
    }
    v17 = 4;
    goto LABEL_40;
  }
  return result;
}

- (void)setSourceAlphaInfo:(unsigned int)a3
{
  self->_imageAlpha = a3;
}

- (unsigned)sourceAlphaInfo
{
  return self->_imageAlpha;
}

- (void)setPixelData:(id)a3
{
  NSData *pixelData;

  pixelData = self->_pixelData;
  if (pixelData != a3)
  {

    self->_pixelData = (NSData *)a3;
  }
}

- (id)pixelData
{
  unint64_t v2;
  unint64_t v3;
  CGImage *sourceImage;
  CGContext *v7;
  CGContext *v8;
  unsigned int pixelFormat;
  CGImage *Image;
  __int16 BitmapInfo;
  size_t BitsPerComponent;
  CFStringRef *v13;
  int v14;
  CGColorSpace *v15;
  BOOL v16;
  uint32_t v17;
  uint32_t v18;
  int v19;
  CGBitmapInfo v20;
  CGColorSpace *ColorSpace;
  vImage_Error v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  size_t BytesPerRow;
  size_t v30;
  id v31;
  uint64_t v32;
  vImage_CGImageFormat v33;
  vImage_Buffer v34;

  if (self->_pixelData)
    return self->_pixelData;
  sourceImage = self->_sourceImage;
  if (sourceImage)
  {
    LODWORD(v2) = self->_width;
    LODWORD(v3) = self->_height;
    self->_pixelData = (NSData *)CUIConvertImageToPixelFormat(sourceImage, self->_flipped, self->_exifOrientation, self->_textureInterpretation, self->_texturePixelFormat, &self->_rowbytes, (double)v2, (double)v3);
    return self->_pixelData;
  }
  v7 = -[CSIBitmapWrapper bitmapContext](self, "bitmapContext");
  if (!v7)
    return self->_pixelData;
  v8 = v7;
  pixelFormat = self->_pixelFormat;
  if (pixelFormat != 1195456544 && pixelFormat != 1195454774)
  {
    BytesPerRow = CGBitmapContextGetBytesPerRow(v7);
    v30 = CGBitmapContextGetHeight(v8) * BytesPerRow;
    self->_pixelData = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", CGBitmapContextGetData(v8), v30, 0);
    self->_rowbytes = CGBitmapContextGetBytesPerRow(v8);
    return self->_pixelData;
  }
  v34.data = 0;
  Image = CGBitmapContextCreateImage(v7);
  BitmapInfo = CGImageGetBitmapInfo(Image);
  BitsPerComponent = CGImageGetBitsPerComponent(Image);
  v13 = (CFStringRef *)&kCGColorSpaceExtendedGray;
  v14 = BitmapInfo & 0x100;
  if ((BitmapInfo & 0x100) == 0)
    v13 = (CFStringRef *)&kCGColorSpaceGenericGrayGamma2_2;
  v15 = CGColorSpaceCreateWithName(*v13);
  v16 = BitsPerComponent > 8;
  if (BitsPerComponent <= 8)
    v17 = 8;
  else
    v17 = 16;
  if (v16)
    v18 = 32;
  else
    v18 = 16;
  if (v16)
    v19 = 4097;
  else
    v19 = 12289;
  v20 = v19 | v14;
  v34.height = CGImageGetHeight(Image);
  v34.width = CGImageGetWidth(Image);
  v34.rowBytes = CGBitmapGetAlignedBytesPerRow(v34.width * (v18 >> 3));
  ColorSpace = CGBitmapContextGetColorSpace(v8);
  v33.bitsPerComponent = v17;
  v33.bitsPerPixel = v18;
  v33.colorSpace = v15;
  v33.bitmapInfo = v20;
  memset(&v33.version, 0, 20);
  v22 = CUIConvertCGImageFormat(Image, ColorSpace, &v33, &v34);
  CGColorSpaceRelease(v15);
  self->_rowbytes = v34.rowBytes;
  CFRelease(Image);
  if (!v22)
  {
    v31 = objc_alloc((Class)NSData);
    self->_pixelData = (NSData *)objc_msgSend(v31, "initWithBytes:length:", v34.data, v34.height * v34.rowBytes);
    if (v34.data)
      CGBitmapFreeData(v34.data);
    return self->_pixelData;
  }
  _CUILog(4, (uint64_t)"CoreUI: Unable to create convert image to 16 Gray scale .", v23, v24, v25, v26, v27, v28, v32);
  return 0;
}

- (CGImageRef)destImage
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    result = (CGImageRef)*((_QWORD *)result + 8);
    if (!result)
    {
      result = (CGImageRef)v1[7];
      if (!result)
        result = CGBitmapContextCreateImage((CGContextRef)objc_msgSend(v1, "bitmapContext"));
      v1[8] = result;
    }
  }
  return result;
}

- (BOOL)allowsMultiPassEncoding
{
  return self->_allowsMultiPassEncoding;
}

- (void)setAllowsMultiPassEncoding:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  self->_allowsMultiPassEncoding = a3;
  if (__coreThemeLoggingEnabled)
    _CUILog(1, (uint64_t)"CoreUI(DEBUG) setting allowsMultiPassEncoding to %d", a3, v3, v4, v5, v6, v7, a3);
}

- (BOOL)allowsOptimalRowbytesPacking
{
  return self->_allowsOptimalRowbytesPacking;
}

- (void)setAllowsOptimalRowbytesPacking:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  self->_allowsOptimalRowbytesPacking = a3;
  if (__coreThemeLoggingEnabled)
    _CUILog(1, (uint64_t)"CoreUI(DEBUG) setting allowsOptimalRowbytesPacking to %d", a3, v3, v4, v5, v6, v7, a3);
}

- (BOOL)allowsCompactCompression
{
  return self->_allowsCompactCompression;
}

- (void)setAllowsCompactCompression:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  self->_allowsCompactCompression = a3;
  if (__coreThemeLoggingEnabled)
    _CUILog(1, (uint64_t)"CoreUI(DEBUG) setting allowsCompactCompression to %d", a3, v3, v4, v5, v6, v7, a3);
}

- (id)compressedData:(BOOL)a3 usedEncoding:(int *)a4 andRowChunkSize:(unsigned int *)a5
{
  NSData *v10;
  unsigned int v11;
  unsigned int v12;
  UInt8 *Data;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  char ***v18;
  CGImage *v19;
  __CFData *v20;
  __CFData *v21;
  id v23;
  CGImage *Image;
  CGColorSpace *ColorSpace;
  CGContext *v26;
  size_t BytesPerRow;
  uint64_t v28;
  CGImage *v29;
  double v30;
  __CFData *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  CGImage *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  CGImage *v62;
  NSData *pixelData;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  size_t v67;
  CGImage *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  CGImage *v75;
  size_t v76;
  size_t BitsPerPixel;
  unsigned int v78;
  CGColorSpaceRef v79;
  CGBitmapInfo BitmapInfo;
  uint64_t pixelFormat;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  int v91;
  CGImage *v92;
  CGImage *v93;
  size_t v94;
  size_t v95;
  unsigned int v96;
  CGColorSpaceRef v97;
  CGBitmapInfo v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unsigned int v112;
  unsigned int v113;
  int64_t v114;
  int64_t v115;
  __CFWriteStream *v116;
  char v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  int64_t v125;
  unint64_t v126;
  int64_t v127;
  const __CFData *v128;
  const __CFData *v129;
  BOOL v130;
  char v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  NSArray *v138;
  NSArray *v139;
  unint64_t v140;
  size_t v141;
  _OWORD *v142;
  unsigned int v143;
  int v144;
  NSData *v145;
  vImage_Error v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  CFDataRef v151;
  CFDataRef v152;
  uint64_t v153;
  vImagePixelCount Width;
  vImagePixelCount v155;
  vImagePixelCount Height;
  vImagePixelCount v157;
  void *v158;
  void *v159;
  size_t v160;
  int *v161;
  NSData *v162;
  CFStreamPropertyKey propertyName;
  const __CFString *propertyNamea;
  uint64_t v165;
  unint64_t rowbytes;
  vImage_Buffer v167;
  vImage_Buffer v168;
  size_t v169;
  unsigned int v170;
  __int16 v171;
  unsigned int v172;
  _OWORD v173[128];
  CGRect v174;

  if (!-[CSIBitmapWrapper width](self, "width")
    && !-[CSIBitmapWrapper width](self, "width")
    && -[CSIBitmapWrapper pixelData](self, "pixelData")
    && -[CSIBitmapWrapper pixelFormat](self, "pixelFormat") == 1346651680)
  {
    *a5 = 0;
    *a4 = 0;
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", -[CSIBitmapWrapper pixelData](self, "pixelData"));
  }
  v10 = -[CSIBitmapWrapper pixelData](self, "pixelData");
  propertyName = -[NSData length](v10, "length");
  v11 = -[CSIBitmapWrapper height](self, "height");
  v12 = -[CSIBitmapWrapper width](self, "width");
  v165 = -[NSData length](v10, "length");
  Data = -[NSData bytes](v10, "bytes");
  rowbytes = self->_rowbytes;
  if (!rowbytes)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSIGenerator.m"), 2448, CFSTR("Row Bytes MUST be set"));
    rowbytes = self->_rowbytes;
  }
  v14 = v12;
  if (!a3)
    -[CSIBitmapWrapper setCompressionType:](self, "setCompressionType:", 1);
  v172 = 0;
  v171 = 0;
  v170 = 0;
  v169 = 0;
  v17 = 0;
  v18 = &off_1EE534000;
  switch(-[CSIBitmapWrapper compressionType](self, "compressionType"))
  {
    case 0:
    case 2:
      goto LABEL_40;
    case 1:
      *a5 = v11;
      v17 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v10);
      goto LABEL_14;
    case 3:
      goto LABEL_21;
    case 4:
    case 5:
      v19 = -[CSIBitmapWrapper destImage]((CGImageRef)self);
      v20 = CUIImageCompressedWithATECompression(v19, -[CSIBitmapWrapper compressionType](self, "compressionType"), -[CSIBitmapWrapper targetPlatform](self, "targetPlatform"), &v172, &v170, &v171);
      if (!v20)
        goto LABEL_21;
      v21 = v20;
      -[CSIBitmapWrapper setPixelFormat:](self, "setPixelFormat:", v170);
      -[CSIBitmapWrapper setColorSpaceID:](self, "setColorSpaceID:", v171);
      goto LABEL_32;
    case 6:
LABEL_14:
      v172 = 6;
      *(_QWORD *)&v173[0] = 0;
      v168.data = 0;
      *a5 = v11;
      if ((encodeRadiosity(v14, v11, rowbytes, (uint64_t)Data, (uint64_t)v173, (uint64_t)&v168, v15, v16, 40.0) & 0x80000000) != 0)
        goto LABEL_34;
      v23 = objc_alloc((Class)NSData);
      v21 = (__CFData *)objc_msgSend(v23, "initWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)&v173[0], v168.data, 1);
      goto LABEL_33;
    case 7:
      if (-[CSIBitmapWrapper sourceAlphaInfo](self, "sourceAlphaInfo")
        && -[CSIBitmapWrapper sourceAlphaInfo](self, "sourceAlphaInfo") != 5
        && -[CSIBitmapWrapper sourceAlphaInfo](self, "sourceAlphaInfo") != 6
        || self->_pixelFormat != 1095911234)
      {
LABEL_21:
        v29 = -[CSIBitmapWrapper destImage]((CGImageRef)self);
        if (-[CSIBitmapWrapper allowsHevcCompression](self, "allowsHevcCompression"))
        {
          -[CSIBitmapWrapper compressionQuality](self, "compressionQuality");
          v31 = CUIImageCompressedWithHEVC(v29, &v170, &v171, &v169, v30);
          if (v31)
          {
            v21 = v31;
            v172 = 9;
            goto LABEL_31;
          }
          if (-[CSIBitmapWrapper name](self, "name"))
            v32 = -[NSString UTF8String](-[CSIBitmapWrapper name](self, "name"), "UTF8String");
          else
            v32 = "a rendition";
          if (-[CSIBitmapWrapper pixelFormat](self, "pixelFormat") == 1195456544)
          {
            _CUILog(4, (uint64_t)"CoreUI: HEVC lossy compression failed for %s. Re-try again with default lossless fallback.", v33, v34, v35, v36, v37, v38, (uint64_t)v32);
            goto LABEL_67;
          }
          _CUILog(4, (uint64_t)"CoreUI: HEVC lossy compression failed for %s. Re-try again with jpeg+lzfse fallback.", v33, v34, v35, v36, v37, v38, (uint64_t)v32);
        }
        -[CSIBitmapWrapper compressionQuality](self, "compressionQuality");
        v21 = CUIImageCompressedWithJPEGandLZFSE(v29, &v170, &v171, &v169, v40);
        v172 = 5;
        if (!v21)
        {
          _CUILog(4, (uint64_t)"CoreUI: Lossy fallback compression failed. Re-try again with fallback.", v41, v42, v43, v44, v45, v46, v153);
          goto LABEL_40;
        }
LABEL_31:
        -[CSIBitmapWrapper setPixelFormat:](self, "setPixelFormat:", v170);
        -[CSIBitmapWrapper setColorSpaceID:](self, "setColorSpaceID:", v171);
        self->_rowbytes = v169;
LABEL_32:
        *a5 = v11;
LABEL_33:
        v17 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v21);

        goto LABEL_34;
      }
      -[CSIBitmapWrapper allowsCompactCompression](self, "allowsCompactCompression");
      CGBitmapContextGetBitsPerPixel(-[CSIBitmapWrapper bitmapContext](self, "bitmapContext"));
      Image = CGBitmapContextCreateImage(-[CSIBitmapWrapper bitmapContext](self, "bitmapContext"));
      ColorSpace = CGBitmapContextGetColorSpace(-[CSIBitmapWrapper bitmapContext](self, "bitmapContext"));
      v26 = CGBitmapContextCreate(0, v14, v11, 5uLL, 0, ColorSpace, 0x1006u);
      v174.size.width = (double)v14;
      v174.size.height = (double)v11;
      v174.origin.x = 0.0;
      v174.origin.y = 0.0;
      CGContextDrawImage(v26, v174, Image);
      CGImageRelease(Image);
      Data = (UInt8 *)CGBitmapContextGetData(v26);
      CFRelease(self->_bitmapContext);
      self->_bitmapContext = v26;
      BytesPerRow = CGBitmapContextGetBytesPerRow(v26);
      self->_rowbytes = BytesPerRow;
      rowbytes = BytesPerRow;
      v28 = BytesPerRow * v11;
      v18 = &off_1EE534000;
      v10 = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", Data, v28, 0);
      -[CSIBitmapWrapper setPixelData:](self, "setPixelData:", v10);

      -[CSIBitmapWrapper setPixelFormat:](self, "setPixelFormat:", 1380401717);
      propertyName = (CFStreamPropertyKey)v28;
      v165 = v28;
LABEL_40:
      if (-[CSIBitmapWrapper allowsPaletteImageCompression](self, "allowsPaletteImageCompression")
        && !-[CSIBitmapWrapper allowsDeepmap2ImageCompression](self, "allowsDeepmap2ImageCompression")
        && (id)-[CSIBitmapWrapper colorSpaceID](self, "colorSpaceID") != (id)2
        && (id)-[CSIBitmapWrapper colorSpaceID](self, "colorSpaceID") != (id)6
        && (id)-[CSIBitmapWrapper compressionType](self, "compressionType") != (id)7)
      {
        v172 = 8;
        v55 = -[CSIBitmapWrapper destImage]((CGImageRef)self);
        if (!v55 || (v62 = v55, !CGImageGetWidth(v55)) || !CGImageGetHeight(v62))
        {
          _CUILog(4, (uint64_t)"CoreUI: Invalid image for lossless compression, fallback to Deepmap lossless compression...", v56, v57, v58, v59, v60, v61, v153);
          goto LABEL_51;
        }
        memset(v173, 0, 40);
        v168.data = 0;
        v168.height = CGImageGetHeight(v62);
        *(_OWORD *)&v168.width = CGImageGetWidth(v62);
        pixelData = self->_pixelData;
        if (pixelData)
        {
          v64 = -[NSData bytes](self->_pixelData, "bytes");
          v67 = self->_rowbytes;
          v168.data = v64;
          v168.rowBytes = v67;
        }
        else
        {
          v146 = CUIGetRGBAImageBuffer(v62, (uint64_t)v173, &v168);
          if (v146 || !v168.width || !v168.height)
          {
            if (v146)
              _CUILog(4, (uint64_t)"CoreUI: Image conversion failed vImage error %d, fallback to other lossless compression...", v147, v148, v149, v150, v65, v66, v146);
            else
              _CUILog(4, (uint64_t)"CoreUI: Image conversion failed vImage returned degenerate image (width=%lu, height=%lu), fallback to other lossless compression...", v147, v148, v149, v150, v65, v66, v168.width);
            goto LABEL_51;
          }
        }
        v162 = pixelData;
        v167 = v168;
        v151 = CUIImageCompressedWithColorQuantization((uint64_t)v62, (uint64_t *)&v167, 0, (int *)&v170, &v171, &v169, v65, v66);
        if (v151)
        {
          v152 = v151;
          -[CSIBitmapWrapper setPixelFormat:](self, "setPixelFormat:", v170);
          -[CSIBitmapWrapper setColorSpaceID:](self, "setColorSpaceID:", v171);
          self->_rowbytes = v169;
          *a5 = v11;
          v17 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v152);

          if (!v162)
            CUIDeallocateRGBAImageBuffer((uint64_t)v173, &v168.data);
LABEL_34:
          v47 = 0;
          goto LABEL_35;
        }
        if (!pixelData)
          CUIDeallocateRGBAImageBuffer((uint64_t)v173, &v168.data);
      }
LABEL_51:
      if ((id)-[CSIBitmapWrapper compressionType](self, "compressionType") != (id)7)
      {
        if (-[CSIBitmapWrapper allowsDeepmap2ImageCompression](self, "allowsDeepmap2ImageCompression"))
        {
          v172 = 11;
          v68 = -[CSIBitmapWrapper destImage]((CGImageRef)self);
          if (v68)
          {
            v75 = v68;
            if (CGImageGetWidth(v68))
            {
              if (CGImageGetHeight(v75))
              {
                v160 = v14;
                v161 = a4;
                v158 = -[NSData bytes](self->_pixelData, "bytes");
                Height = CGImageGetHeight(v75);
                Width = CGImageGetWidth(v75);
                v76 = self->_rowbytes;
                BitsPerPixel = CGImageGetBitsPerPixel(v75);
                v78 = 8 * ((BitsPerPixel >> 3) / (BitsPerPixel / CGImageGetBitsPerComponent(v75)));
                v79 = CGImageGetColorSpace(v75);
                BitmapInfo = CGImageGetBitmapInfo(v75);
                pixelFormat = self->_pixelFormat;
                *(_QWORD *)&v173[0] = __PAIR64__(BitsPerPixel, v78);
                *((_QWORD *)&v173[0] + 1) = v79;
                LODWORD(v173[1]) = BitmapInfo;
                memset((char *)&v173[1] + 4, 0, 20);
                v168.data = v158;
                v168.height = Height;
                v168.width = Width;
                v168.rowBytes = v76;
                v83 = CUIImageCompressedWithDeepmap2((unsigned int *)v173, &v168, pixelFormat, &v170, &v171, &v169, a5, v82);
                if (!v83)
                {
                  v90 = "CoreUI: Deepmap 2.0 image compression returned nil, fallback to other lossless compression...";
                  v91 = 4;
LABEL_145:
                  _CUILog(v91, (uint64_t)v90, v84, v85, v86, v87, v88, v89, v153);
                  v14 = v160;
                  a4 = v161;
                  goto LABEL_67;
                }
                goto LABEL_63;
              }
            }
          }
          v102 = "CoreUI: Invalid image for lossless compression with kCSICompressedDeepmap2Encoding encoding, fallback t"
                 "o default lossless compression...";
LABEL_66:
          _CUILog(4, (uint64_t)v102, v69, v70, v71, v72, v73, v74, v153);
          goto LABEL_67;
        }
        if (-[CSIBitmapWrapper allowsDeepmapImageCompression](self, "allowsDeepmapImageCompression"))
        {
          v172 = 10;
          v92 = -[CSIBitmapWrapper destImage]((CGImageRef)self);
          if (v92)
          {
            v93 = v92;
            if (CGImageGetWidth(v92))
            {
              if (CGImageGetHeight(v93))
              {
                v160 = v14;
                v161 = a4;
                v159 = -[NSData bytes](self->_pixelData, "bytes");
                v157 = CGImageGetHeight(v93);
                v155 = CGImageGetWidth(v93);
                v94 = self->_rowbytes;
                v95 = CGImageGetBitsPerPixel(v93);
                v96 = 8 * ((v95 >> 3) / (v95 / CGImageGetBitsPerComponent(v93)));
                v97 = CGImageGetColorSpace(v93);
                v98 = CGImageGetBitmapInfo(v93);
                v99 = self->_pixelFormat;
                *(_QWORD *)&v173[0] = __PAIR64__(v95, v96);
                *((_QWORD *)&v173[0] + 1) = v97;
                LODWORD(v173[1]) = v98;
                memset((char *)&v173[1] + 4, 0, 20);
                v168.data = v159;
                v168.height = v157;
                v168.width = v155;
                v168.rowBytes = v94;
                v83 = CUIImageCompressedWithDeepmap((unsigned int *)v173, (__int128 *)&v168, v99, &v170, &v171, &v169, a5, v100);
                if (!v83)
                {
                  v90 = "CoreUI: Deepmap image compression returned early, fallback to other lossless compression...";
                  v91 = 3;
                  goto LABEL_145;
                }
LABEL_63:
                v101 = v83;
                -[CSIBitmapWrapper setPixelFormat:](self, "setPixelFormat:", v170);
                -[CSIBitmapWrapper setColorSpaceID:](self, "setColorSpaceID:", v171);
                self->_rowbytes = v169;
                v17 = v101;
                v47 = 0;
LABEL_119:
                a4 = v161;
                v18 = &off_1EE534000;
                goto LABEL_35;
              }
            }
          }
          v102 = "CoreUI: Invalid image for lossless compression with kCSICompressedDeepmapEncoding encoding, fallback to"
                 " default lossless compression...";
          goto LABEL_66;
        }
      }
LABEL_67:
      if (rowbytes * v11 > 0xFFF || (v103 = self->_pixelFormat, v103 == 1195454774) || v103 == 1380401751)
      {
        *(_QWORD *)&v173[0] = 0;
        v168.data = 0;
        if (__environmentRequestedCompression == 2)
        {
          v104 = 4;
        }
        else if (__environmentRequestedCompression == 1)
        {
          v104 = 3;
        }
        else
        {
          if (__environmentRequestedCompression)
          {
LABEL_77:
            v105 = -[CSIBitmapWrapper allowsMultiPassEncoding](self, "allowsMultiPassEncoding");
            if (v14 > 1)
              v112 = v105;
            else
              v112 = 0;
            if (v14 * (unint64_t)v11 > 0xFFF)
              v113 = v112;
            else
              v113 = 0;
            if (v113 == 1)
            {
              if (__coreThemeLoggingEnabled)
                _CUILog(1, (uint64_t)"CoreUI(DEBUG): doing multipass encoding", v106, v107, v108, v109, v110, v111, v153);
              if (rowbytes * v11 < 0x5000)
              {
                v11 >>= 1;
              }
              else if (v11 >= 3)
              {
                v11 /= 3u;
              }
            }
            v161 = a4;
            *a5 = v11;
            v114 = v165;
            if (v165 >= 1)
            {
              v17 = 0;
              v47 = 0;
              v115 = rowbytes * v11;
              propertyNamea = kCFStreamPropertyDataWritten;
              while (1)
              {
                v116 = CFWriteStreamCreateWithAllocatedBuffers(kCFAllocatorDefault, kCFAllocatorDefault);
                CFWriteStreamOpen(v116);
                *(_QWORD *)&v173[0] = 0;
                _StreamSys_init_write((unint64_t)v173, (uint64_t)v116);
                v168.data = 0;
                v117 = v172 == 3 ? 4 : 5;
                v118 = v172 == 2 ? 1 : v117;
                if (_BOMFileNewFromCFWriteStreamSys(&v168, *(__int128 **)&v173[0], v118))
                  break;
                v125 = 0;
                if (v115 >= v114)
                  v126 = v114;
                else
                  v126 = v115;
                if (v126)
                {
                  while (1)
                  {
                    v127 = BOMFileWrite((uint64_t)v168.data, &Data[v125], v126);
                    if (v127 < 1)
                      break;
                    v125 += v127;
                    v126 -= v127;
                    if (!v126)
                      goto LABEL_105;
                  }
                  BOMFileClose((uint64_t)v168.data);
                  CFRelease(v116);
                  _CUILog(4, (uint64_t)"CoreUI: Failure to write to stream", v132, v133, v134, v135, v136, v137, v153);
                  v138 = v17;
                  return 0;
                }
LABEL_105:
                BOMFileClose((uint64_t)v168.data);
                BomSys_free(*(void **)&v173[0]);
                v128 = (const __CFData *)CFWriteStreamCopyProperty(v116, propertyNamea);
                v129 = v128;
                if (__loggingEnabled)
                  v47 += CFDataGetLength(v128);
                if (!v17)
                  v17 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
                Data += v125;
                -[NSArray addObject:](v17, "addObject:", v129);

                CFRelease(v116);
                v130 = v114 <= v125;
                v114 -= v125;
                if (v130)
                  v131 = 0;
                else
                  v131 = v113;
                if ((v131 & 1) == 0)
                  goto LABEL_118;
              }
              if (v116)
                CFRelease(v116);
              _CUILog(4, (uint64_t)"CoreUI: Unable to create compressed output stream.", v119, v120, v121, v122, v123, v124, v153);

              return 0;
            }
            v47 = 0;
            v17 = 0;
LABEL_118:
            v139 = v17;
            goto LABEL_119;
          }
          v104 = 2;
        }
        v172 = v104;
        goto LABEL_77;
      }
      v140 = v165 + 8 * v11 + 12;
      if (v140 <= 0x800)
        v141 = 2048;
      else
        v141 = v165 + 8 * v11 + 12;
      if (v140 >= 0x800)
        v142 = malloc_type_malloc(v141, 0x73C041C6uLL);
      else
        v142 = v173;
      if (self->_sourceImage || self->_texturePixelFormat)
      {
        v172 = 0;
        if (v140 >= 0x800)
          free(v142);
        v47 = 0;
      }
      else
      {
        if (self->_pixelFormat == 1195456544)
          v143 = 3;
        else
          v143 = 4;
        v144 = pk_compressData((uint64_t)Data, v143, v14, v11, rowbytes, (unsigned int *)v142, v141, v39);
        v47 = v144;
        if (v144 < 1 || (uint64_t)propertyName <= v144)
        {
          v172 = 0;
          if (v140 >= 0x800)
            free(v142);
        }
        else
        {
          v172 = 1;
          if (v140 > 0x7FF)
            v145 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v142, v144, 1);
          else
            v145 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v142, v144);
          v10 = v145;
        }
      }
      v18 = &off_1EE534000;
      *a5 = v11;
      v17 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v10);
LABEL_35:
      if (*((_BYTE *)v18 + 1273))
      {
        v48 = CUIConvertCompressionTypeToString(v172);
        NSLocalizedFileSizeDescription(v47, 1536, 0);
        _CUILog(1, (uint64_t)"CSI: %s Compressed [%lu x %lu]\t\t%lu\trowbytes %lu\t to size %@\twith compressionFactor:\t%.2f", v49, v50, v51, v52, v53, v54, (uint64_t)v48);
      }
      if (a4)
        *a4 = v172;
      return v17;
    default:
      goto LABEL_34;
  }
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (BOOL)allowsPaletteImageCompression
{
  return self->_allowsPaletteImageCompression;
}

- (void)setAllowsPaletteImageCompression:(BOOL)a3
{
  self->_allowsPaletteImageCompression = a3;
}

- (BOOL)allowsHevcCompression
{
  return self->_allowsHevcCompression;
}

- (void)setAllowsHevcCompression:(BOOL)a3
{
  self->_allowsHevcCompression = a3;
}

- (BOOL)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

- (void)setCompressionQuality:(double)a3
{
  self->_compressionQuality = a3;
}

- (int64_t)compressionType
{
  return self->_compressionType;
}

- (void)setCompressionType:(int64_t)a3
{
  self->_compressionType = a3;
}

- (int64_t)targetPlatform
{
  return self->_targetPlatform;
}

- (void)setTargetPlatform:(int64_t)a3
{
  self->_targetPlatform = a3;
}

- (unint64_t)colorSpaceID
{
  return self->_colorSpaceID;
}

- (void)setColorSpaceID:(unint64_t)a3
{
  self->_colorSpaceID = a3;
}

- (int64_t)textureInterpretation
{
  return self->_textureInterpretation;
}

- (void)setTextureInterpretation:(int64_t)a3
{
  self->_textureInterpretation = a3;
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setExifOrientation:(int)a3
{
  self->_exifOrientation = a3;
}

- (BOOL)allowsDeepmapImageCompression
{
  return self->_allowsDeepmapImageCompression;
}

- (void)setAllowsDeepmapImageCompression:(BOOL)a3
{
  self->_allowsDeepmapImageCompression = a3;
}

- (BOOL)allowsDeepmap2ImageCompression
{
  return self->_allowsDeepmap2ImageCompression;
}

- (void)setAllowsDeepmap2ImageCompression:(BOOL)a3
{
  self->_allowsDeepmap2ImageCompression = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)a3;
}

@end
