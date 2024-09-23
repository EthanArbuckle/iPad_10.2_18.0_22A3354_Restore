@implementation _CUIRawPixelRendition

- (void)dealloc
{
  unint64_t v3;
  objc_super v4;

  CGImageRelease(self->_unslicedImage);
  if (self->_nimages)
  {
    v3 = 0;
    do
      CGImageRelease(self->_image[v3++]);
    while (v3 < self->_nimages);
  }

  v4.receiver = self;
  v4.super_class = (Class)_CUIRawPixelRendition;
  -[CUIThemeRendition dealloc](&v4, sel_dealloc);
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  CGSize size;
  CGImageRef *v7;
  unsigned int var6;
  NSAssertionHandler *v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  char *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  _CUISubrangeData *v17;
  CGImageSource *v18;
  CGImageSource *v19;
  CGImageRef ImageAtIndex;
  uint64_t var0;
  uint64_t var10;
  unsigned int *v23;
  uint64_t v24;
  unsigned int *v25;
  unsigned int *v26;
  unsigned int v27;
  double Width;
  double Height;
  int v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  _DWORD *v35;
  double *v36;
  unsigned int v37;
  unsigned int v38;
  BOOL v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CUIRenditionMetrics *v49;
  uint64_t v50;
  __int16 v51;
  double v52;
  double v53;
  double v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  double v70;
  double v71;
  double *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  NSAssertionHandler *v79;
  uint64_t v80;
  objc_class *v81;
  NSString *v82;
  NSSize v83;
  NSSize v84;
  NSSize v85;
  NSSize v86;
  unint64_t v87;
  NSSize v88;
  NSSize v89;
  NSSize v90;
  NSSize v91;
  double v92;
  double v93;
  objc_super v94;
  CGPoint origin;
  _OWORD v96[2];
  CGSize v97;
  CGPoint v98;
  CGSize v99;
  CGPoint v100;
  CGSize v101;
  CGPoint v102;
  CGSize v103;
  CGPoint v104;
  CGSize v105;
  CGPoint v106;
  CGSize v107;
  CGPoint v108;
  CGSize v109;
  CGPoint v110;
  CGSize v111;
  CGPoint v112;
  CGSize v113;
  CGPoint v114;
  CGSize v115;
  CGPoint v116;
  CGSize v117;
  CGPoint v118;
  CGSize v119;
  CGPoint v120;
  CGSize v121;
  CGPoint v122;
  CGSize v123;
  CGPoint v124;
  CGSize v125;
  NSSize v126;
  NSSize v127;
  CGRect v128;

  size = CGRectZero.size;
  origin = CGRectZero.origin;
  v96[0] = size;
  v96[1] = origin;
  v97 = size;
  v98 = origin;
  v99 = size;
  v100 = origin;
  v101 = size;
  v102 = origin;
  v103 = size;
  v104 = origin;
  v105 = size;
  v106 = origin;
  v107 = size;
  v108 = origin;
  v109 = size;
  v110 = origin;
  v111 = size;
  v112 = origin;
  v113 = size;
  v114 = origin;
  v115 = size;
  v116 = origin;
  v117 = size;
  v118 = origin;
  v119 = size;
  v120 = origin;
  v121 = size;
  v122 = origin;
  v123 = size;
  v124 = origin;
  v125 = size;
  v94.receiver = self;
  v94.super_class = (Class)_CUIRawPixelRendition;
  v7 = -[CUIThemeRendition _initWithCSIHeader:version:](&v94, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  if (v7)
  {
    var6 = a3->var6;
    if (var6 != 1212500294 && var6 != 1246774599)
    {
      v9 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
      v11 = (objc_class *)objc_opt_class(v7, v10);
      v82 = NSStringFromClass(v11);
      NSStringFromSelector(a2);
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("CUIThemeRendition.m"), 2007, CFSTR("CoreUI: -[%@ %@] pixel format must be kCSIPixelFormatJPEG/kCSIPixelFormatHEIF"));
    }
    v12 = (char *)&a3->var11.var1[a3->var11.var0] + a3->var10;
    v13 = v12 + 4;
    if (*((_DWORD *)v12 + 2))
    {
      v79 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
      v81 = (objc_class *)objc_opt_class(v7, v80);
      v82 = NSStringFromClass(v81);
      NSStringFromSelector(a2);
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("CUIThemeRendition.m"), 2010, CFSTR("CoreUI:-[%@ %@]  data shouldn't be compressed here"));
    }
    *((_DWORD *)v7 + 54) = a3->var6;
    v14 = *((_DWORD *)v13 + 2);
    v15 = bswap32(v14);
    if (*(_DWORD *)v13 == 1146569042)
      v16 = v15;
    else
      v16 = v14;
    v17 = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", -[CGImageRef srcData](v7, "srcData"), v13 - (_BYTE *)objc_msgSend(-[CGImageRef srcData](v7, "srcData"), "bytes") + 12, v16);
    v7[28] = (CGImageRef)v17;
    if (v17)
    {
      v18 = CGImageSourceCreateWithData((CFDataRef)v17, 0);
      if (v18)
      {
        v19 = v18;
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v18, 0, 0);
        v7[45] = ImageAtIndex;
        CGImageSetProperty(ImageAtIndex, CFSTR("com.apple.coreui"), +[CUIRenditionKey renditionKeyWithKeyList:](CUIRenditionKey, "renditionKeyWithKeyList:", -[CGImageRef key](v7, "key")));
        CFRelease(v19);
      }
    }
    var0 = a3->var11.var0;
    if ((_DWORD)var0)
    {
      var10 = a3->var10;
      if ((_DWORD)var10)
      {
        v23 = 0;
        v24 = 0;
        v25 = &a3->var11.var1[var0 + 1];
        v26 = (unsigned int *)((char *)v25 + var10);
        do
        {
          v27 = *v25;
          if (*v25 == 1006)
          {
            -[CGImageRef setExifOrientation:](v7, "setExifOrientation:", v25[2]);
          }
          else if (v27 == 1003)
          {
            v24 = (uint64_t)(v25 + 2);
          }
          else if (v27 == 1001)
          {
            v23 = v25 + 2;
            *((_DWORD *)v7 + 55) = v25[2];
          }
          v25 = (unsigned int *)((char *)v25 + v25[1] + 8);
        }
        while (v25 < v26);
      }
      else
      {
        v24 = 0;
        v23 = 0;
      }
      v92 = 0.0;
      v93 = 0.0;
      Width = (double)CGImageGetWidth(v7[45]);
      Height = (double)CGImageGetHeight(v7[45]);
      v92 = Width;
      v93 = Height;
      v90 = NSZeroSize;
      v91 = v90;
      v88 = v90;
      v89 = v90;
      v87 = 0xBFF0000000000000;
      v85 = v90;
      v86 = v90;
      v83 = v90;
      v84 = v90;
      if (v24)
      {
        _extractMetrics(v24, (uint64_t)&v92, &v91.width, &v90.width, &v89.width, (int8x16_t *)&v88, &v87, &v86.width, (int8x16_t *)&v85, &v84.width, (int8x16_t *)&v83);
        Width = v92;
        Height = v93;
      }
      v30 = CGImageGetHeight(v7[45]);
      if (v23)
      {
        v32 = *v23;
        if ((_DWORD)v32)
        {
          v33 = v30;
          v34 = 0;
          v35 = v23 + 2;
          v36 = (double *)v96;
          do
          {
            v37 = v35[1];
            v38 = v35[2];
            if (v37)
              v39 = v38 == 0;
            else
              v39 = 1;
            if (v39)
            {
              v7[v34 + 29] = 0;
            }
            else
            {
              LODWORD(v31) = *(v35 - 1);
              v128.origin.x = (double)v31;
              v128.origin.y = (double)(v33 - (*v35 + v38));
              v128.size.width = (double)v37;
              v128.size.height = (double)v38;
              *(v36 - 2) = v128.origin.x;
              *(v36 - 1) = v128.origin.y;
              *v36 = (double)v37;
              v36[1] = (double)v38;
              v7[v34 + 29] = CGImageCreateWithImageInRect(v7[45], v128);
              v32 = *v23;
            }
            if (v34 > 0xE)
              break;
            ++v34;
            v35 += 4;
            v36 += 4;
          }
          while (v34 < v32);
        }
      }
      v40 = NSZeroSize.height;
      if (-[CGImageRef type](v7, "type") == (id)3)
      {
        v41 = (double)CGImageGetWidth(v7[29]);
        v42 = (double)CGImageGetWidth(v7[31]);
        v43 = (double)CGImageGetHeight(v7[29]);
        v44 = (double)CGImageGetHeight(v7[35]);
        -[CGImageRef scale](v7, "scale");
        Width = v41 + v42 + v45;
        v46 = v43 + v44;
      }
      else
      {
        if (-[CGImageRef type](v7, "type") != (id)2)
        {
          if (-[CGImageRef type](v7, "type") == (id)1)
          {
            v52 = (double)CGImageGetWidth(v7[29]);
            v53 = v52 + (double)CGImageGetWidth(v7[31]);
            -[CGImageRef scale](v7, "scale");
            Width = v54 + v53;
          }
          goto LABEL_43;
        }
        v47 = (double)CGImageGetHeight(v7[29]);
        v46 = v47 + (double)CGImageGetHeight(v7[31]);
      }
      -[CGImageRef scale](v7, "scale");
      Height = v48 + v46;
LABEL_43:
      v126.width = NSZeroSize.width;
      v126.height = v40;
      v127.width = Width;
      v127.height = Height;
      if (!NSEqualSizes(v126, v127))
      {
        v49 = [CUIRenditionMetrics alloc];
        v50 = v87;
        v51 = -[CGImageRef type](v7, "type") == (id)2 || -[CGImageRef type](v7, "type") == (id)3;
        v55 = -[CGImageRef type](v7, "type") == (id)1 || -[CGImageRef type](v7, "type") == (id)3;
        -[CGImageRef scale](v7, "scale");
        v7[46] = (CGImageRef)-[CUIRenditionMetrics initWithImageSize:defaultImageSize:edgeBottomLeft:edgeTopRight:contentBottomLeft:contentTopRight:baseline:auxiliary1BottomLeft:auxiliary1TopRight:auxiliary2BottomLeft:auxiliary2TopRight:scalesVertically:scalesHorizontally:scale:](v49, v51, v55, Width, Height, v92, v93, v91.width, v91.height, v90.width, v90.height, v56, v57, v58, v59, v60, *(uint64_t *)&v89.width, *(uint64_t *)&v89.height, *(uint64_t *)&v88.width,
                               *(uint64_t *)&v88.height,
                               v50,
                               *(uint64_t *)&v86.width,
                               *(uint64_t *)&v86.height,
                               *(uint64_t *)&v85.width,
                               *(uint64_t *)&v85.height,
                               *(uint64_t *)&v84.width,
                               *(uint64_t *)&v84.height,
                               *(uint64_t *)&v83.width,
                               *(uint64_t *)&v83.height,
                               v61);
      }
      if (-[CGImageRef type](v7, "type") == (id)3
        || -[CGImageRef type](v7, "type") == (id)2
        || -[CGImageRef type](v7, "type") == (id)1)
      {
        v68 = -[CGImageRef type](v7, "type");
        v69 = 64;
        if (v68 == (id)3)
          v69 = 256;
        v71 = *((double *)v96 + 1);
        v70 = *(double *)v96;
        v72 = (double *)((char *)&origin.x + v69);
        v73 = v72[2];
        v74 = v72[3];
        if (-[CGImageRef type](v7, "type") == (id)3)
        {
          v75 = v101.width;
          if (v101.width <= v107.width)
            v75 = v107.width;
          if (v70 == 0.0)
            v70 = v75;
          v76 = v97.height;
          if (v97.height <= v99.height)
            v76 = v99.height;
          if (v71 == 0.0)
            v71 = v76;
          if (v99.width <= v105.width)
            v77 = v105.width;
          else
            v77 = v99.width;
          if (v73 == 0.0)
            v73 = v77;
          if (v74 == 0.0)
          {
            if (v107.height <= v109.height)
              v74 = v109.height;
            else
              v74 = v107.height;
          }
        }
        v7[47] = (CGImageRef)-[CUIRenditionSliceInformation initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:]([CUIRenditionSliceInformation alloc], "initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:", -[CGImageRef type](v7, "type"), 0.0, 0.0, Width, Height, v70, v71, v73, v74);
      }
      if (a3->var11.var0 > 1)
        _CUILog(4, (uint64_t)"Warning: Ignoring extra images found in CSI", v62, v63, v64, v65, v66, v67, (uint64_t)v82);
    }
  }
  return v7;
}

- (int)pixelFormat
{
  return self->_pixelFormat;
}

- (CGImage)unslicedImage
{
  return self->_unslicedImage;
}

- (CGSize)unslicedSize
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)CGImageGetWidth(self->_unslicedImage);
  Height = (double)CGImageGetHeight(self->_unslicedImage);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (id)imageForSliceIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((a3 & 0x8000000000000000) == 0 && self->_nimages > a3)
    return +[CUIImage imageWithCGImage:](CUIImage, "imageWithCGImage:", self->_image[a3]);
  _CUILog(4, (uint64_t)"Invalid slice index %ld for rendition", a3, v3, v4, v5, v6, v7, a3);
  return 0;
}

- (id)maskForSliceIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGImage *v8;
  size_t Width;
  size_t Height;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  BOOL ShouldInterpolate;
  CGImage *v16;
  CUIImage *v17;
  CGFloat decode[3];

  if (a3 < 0 || self->_nimages <= a3)
  {
    _CUILog(4, (uint64_t)"Invalid slice index %ld for rendition", a3, v3, v4, v5, v6, v7, a3);
    return 0;
  }
  else
  {
    v8 = self->_image[a3];
    *(_OWORD *)decode = xmmword_19EC72B00;
    Width = CGImageGetWidth(v8);
    Height = CGImageGetHeight(v8);
    BitsPerComponent = CGImageGetBitsPerComponent(v8);
    BitsPerPixel = CGImageGetBitsPerPixel(v8);
    BytesPerRow = CGImageGetBytesPerRow(v8);
    DataProvider = CGImageGetDataProvider(v8);
    ShouldInterpolate = CGImageGetShouldInterpolate(v8);
    v16 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, decode, ShouldInterpolate);
    v17 = +[CUIImage imageWithCGImage:](CUIImage, "imageWithCGImage:", v16);
    CGImageRelease(v16);
  }
  return v17;
}

- (id)sliceInformation
{
  return self->_sliceInformation;
}

- (id)metrics
{
  return self->_renditionMetrics;
}

- (BOOL)isScaled
{
  return -[CUIThemeRendition subtype](self, "subtype") == 31
      || -[CUIThemeRendition subtype](self, "subtype") == 12
      || (id)-[CUIThemeRendition type](self, "type") == (id)2
      || (id)-[CUIThemeRendition type](self, "type") == (id)1;
}

@end
