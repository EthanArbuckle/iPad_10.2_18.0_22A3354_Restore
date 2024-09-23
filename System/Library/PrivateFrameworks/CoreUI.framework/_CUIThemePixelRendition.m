@implementation _CUIThemePixelRendition

- (CGImage)unslicedImage
{
  CGImage *result;

  result = self->_unslicedImage;
  if (result)
  {
    CFRetain(result);
    CFAutorelease(self->_unslicedImage);
    return self->_unslicedImage;
  }
  return result;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  const _csiheader *v4;
  char *v5;
  uint64_t var0;
  uint64_t v7;
  unint64_t v8;
  CGFloat height;
  char v10;
  int *v11;
  _DWORD *v12;
  unsigned int v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t var10;
  unsigned int *v23;
  _DWORD *v24;
  unint64_t v25;
  unsigned int v26;
  id v27;
  uint64_t v28;
  unsigned int v29;
  float *v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  unsigned int v38;
  float *v39;
  id v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unsigned int v45;
  uint64_t v46;
  unsigned int *p_var0;
  double Width;
  double v49;
  int var6;
  const CFStringRef *v51;
  CFStringRef v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CGColorSpace *v59;
  CFStringRef v60;
  const __CFString *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  CGColorSpaceRef DeviceRGB;
  const __CFString *v69;
  const CFStringRef *v70;
  CFStringRef v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  CFStringRef *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSAssertionHandler *v85;
  uint64_t v86;
  objc_class *v87;
  NSString *v88;
  uint64_t v89;
  uint64_t v90;
  CGImageRef v91;
  CGPoint origin;
  CGSize size;
  unint64_t v94;
  unint64_t v95;
  unsigned int *v96;
  double *v97;
  unsigned int v98;
  unsigned int v99;
  BOOL v100;
  CGImageRef v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  CUIRenditionMetrics *v120;
  uint64_t v121;
  __int16 v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  double v132;
  double v133;
  double *v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  unsigned int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v156;
  id v157;
  unsigned int *var1;
  uint64_t v160;
  _csiheader *v161;
  CGColorSpaceRef space;
  CGColorSpace *spacea;
  unint64_t v164;
  unsigned int *v165;
  NSSize v166;
  NSSize v167;
  NSSize v168;
  NSSize v169;
  unint64_t v170;
  NSSize v171;
  NSSize v172;
  NSSize v173;
  NSSize v174;
  double v175;
  double v176;
  objc_super v177;
  CGPoint v178;
  CGSize v179;
  CGPoint v180;
  CGSize v181;
  _BYTE v182[32];
  CGPoint v183;
  CGSize v184;
  CGPoint v185;
  CGSize v186;
  CGPoint v187;
  CGSize v188;
  CGPoint v189;
  CGSize v190;
  CGPoint v191;
  CGSize v192;
  CGPoint v193;
  CGSize v194;
  CGPoint v195;
  CGSize v196;
  CGPoint v197;
  CGSize v198;
  CGPoint v199;
  CGSize v200;
  CGPoint v201;
  CGSize v202;
  CGPoint v203;
  CGSize v204;
  CGPoint v205;
  CGSize v206;
  CGPoint v207;
  CGSize v208;
  NSSize v209;
  NSSize v210;
  CGRect v211;

  v4 = a3;
  v177.receiver = self;
  v177.super_class = (Class)_CUIThemePixelRendition;
  v5 = -[CUIThemeRendition _initWithCSIHeader:version:](&v177, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  var0 = v4->var11.var0;
  if (!(_DWORD)var0)
    return v5;
  v7 = 0;
  var1 = v4->var11.var1;
  v8 = (unint64_t)&v4->var11.var1[var0 + 1] + v4->var10;
  height = NSZeroSize.height;
  v10 = 1;
  v11 = &OBJC_IVAR___CUIPSDLayerEffectBevelEmboss__highlightBlendMode;
  v161 = (_csiheader *)v4;
  v164 = v8;
  do
  {
    v12 = (_DWORD *)(v8 + var1[v7]);
    if (*v12 != 1128614989 && *v12 != 1296844099)
    {
      v157 = objc_msgSend(v5, "name");
      _CUILog(4, (uint64_t)"CoreUI: Expecting a kCSIElementSignature but didn't find it: '%@'", v148, v149, v150, v151, v152, v153, (uint64_t)v157);
      goto LABEL_134;
    }
    v14 = v12[1];
    v15 = (unsigned int *)objc_msgSend(v5, "renditionFlags");
    *v15 = *v15 & 0xFFFFFFFD | (2 * ((v14 >> 1) & 1));
    if ((v10 & 1) == 0)
    {
      _CUILog(4, (uint64_t)"Warning: Ignoring extra images found in CSI", v16, v17, v18, v19, v20, v21, v156);
      return v5;
    }
    var10 = v4->var10;
    if (!(_DWORD)var10)
      goto LABEL_134;
    v160 = (uint64_t)v12;
    v165 = 0;
    space = 0;
    v23 = 0;
    v24 = (_DWORD *)(v8 - var10);
    v25 = 0x1EE531000uLL;
    do
    {
      switch(*v24)
      {
        case 0x3E9:
          v26 = v24[2];
          v165 = v24 + 2;
          *((_DWORD *)v5 + 54) = v26;
          if (v26 >= 0x11)
            -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("CUIThemeRendition.m"), 3659, CFSTR("CoreUI: have more slices than image slots: _CUIThemePixelRendition"));
          break;
        case 0x3EB:
          space = (CGColorSpaceRef)(v24 + 2);
          break;
        case 0x3EE:
          objc_msgSend(v5, "setExifOrientation:", v24[2]);
          break;
        case 0x3EF:
          *((_QWORD *)v5 + 50) = v24[2];
          break;
        case 0x3F4:
          v23 = v24 + 2;
          v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v24[2]);
          v28 = *(int *)(v25 + 3328);
          *(_QWORD *)&v5[v28] = v27;
          if (v24[2])
          {
            v29 = 0;
            v30 = (float *)(v24 + 4);
            do
            {
              v31 = objc_alloc_init((Class)(v11 + 514));
              *(float *)&v32 = v30[3];
              *(float *)&v33 = v30[4];
              objc_msgSend(v31, "setFrame:", (double)*((int *)v30 + 1), (double)*((int *)v30 + 2), (double)v32, (double)v33);
              objc_msgSend(v31, "setOpacity:", v30[6]);
              objc_msgSend(v31, "setBlendMode:", *((unsigned int *)v30 + 5));
              objc_msgSend(v31, "setFixedFrame:", *(_DWORD *)v30 & 1);
              v181 = (CGSize)0;
              memset(v182, 0, 28);
              v179 = (CGSize)0;
              v180 = (CGPoint)0;
              v178 = (CGPoint)0;
              v34 = *((_DWORD *)v30 + 7);
              if (v34 >= 0x58)
                v35 = 88;
              else
                v35 = v34;
              __memcpy_chk(&v178, v30 + 8, v35, 92);
              objc_msgSend(v31, "setReferenceKey:", -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", &v178));
              objc_msgSend(*(id *)&v5[v28], "addObject:", v31);

              v11 = &OBJC_IVAR___CUIPSDLayerEffectBevelEmboss__highlightBlendMode;
              v30 = (float *)((char *)v30 + *((unsigned int *)v30 + 7) + 32);
              ++v29;
            }
            while (v29 < *v23);
            v8 = v164;
            v25 = 0x1EE531000;
          }
          break;
        default:
          break;
      }
      v24 = (_DWORD *)((char *)v24 + v24[1] + 8);
    }
    while ((unint64_t)v24 < v8);
    if (!v23)
    {
      v36 = v161->var10;
      if ((_DWORD)v36)
      {
        v37 = (_DWORD *)(v8 - v36);
        do
        {
          if (*v37 == 1009)
          {
            *((_QWORD *)v5 + 51) = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v37[2]);
            if (v37[2])
            {
              v38 = 0;
              v39 = (float *)(v37 + 4);
              do
              {
                v40 = objc_alloc_init((Class)(v11 + 514));
                *(float *)&v41 = *v39;
                *(float *)&v42 = v39[1];
                *(float *)&v43 = v39[2];
                *(float *)&v44 = v39[3];
                objc_msgSend(v40, "setFrame:", (double)v41, (double)v42, (double)v43, (double)v44);
                objc_msgSend(v40, "setOpacity:", v39[5]);
                objc_msgSend(v40, "setBlendMode:", *((unsigned int *)v39 + 4));
                v181 = (CGSize)0;
                memset(v182, 0, 28);
                v179 = (CGSize)0;
                v180 = (CGPoint)0;
                v178 = (CGPoint)0;
                v45 = *((_DWORD *)v39 + 6);
                if (v45 >= 0x58)
                  v46 = 88;
                else
                  v46 = v45;
                __memcpy_chk(&v178, v39 + 7, v46, 92);
                objc_msgSend(v40, "setReferenceKey:", -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", &v178));
                objc_msgSend(*((id *)v5 + 51), "addObject:", v40);

                v11 = &OBJC_IVAR___CUIPSDLayerEffectBevelEmboss__highlightBlendMode;
                v39 = (float *)((char *)v39 + *((unsigned int *)v39 + 6) + 28);
                ++v38;
              }
              while (v38 < v37[2]);
            }
          }
          v37 = (_DWORD *)((char *)v37 + v37[1] + 8);
        }
        while ((unint64_t)v37 < v164);
      }
    }
    p_var0 = &v161->var0;
    if (!v165)
      goto LABEL_134;
    v175 = 0.0;
    v176 = 0.0;
    Width = (double)CGImageGetWidth(*((CGImageRef *)v5 + 44));
    v49 = (double)CGImageGetHeight(*((CGImageRef *)v5 + 44));
    v175 = Width;
    v176 = v49;
    v173 = NSZeroSize;
    v174 = v173;
    v171 = v173;
    v172 = v173;
    v170 = 0xBFF0000000000000;
    v168 = v173;
    v169 = v173;
    v166 = v173;
    v167 = v173;
    if (space)
    {
      _extractMetrics((uint64_t)space, (uint64_t)&v175, &v174.width, &v173.width, &v172.width, (int8x16_t *)&v171, &v170, &v169.width, (int8x16_t *)&v168, &v167.width, (int8x16_t *)&v166);
      Width = v175;
      v49 = v176;
    }
    var6 = v161->var6;
    if (var6 <= 1195456543)
    {
      if (var6 == 1095911234)
      {
        v78 = (CFStringRef *)&kCGColorSpaceSRGB;
        if ((*((_DWORD *)v161 + 7) & 0xFu) <= 3)
          v78 = (CFStringRef *)qword_1E41B2390[*((_DWORD *)v161 + 7) & 0xF];
        v59 = CGColorSpaceCreateWithName(*v78);
        if (v59)
          goto LABEL_71;
        _CUILog(1, (uint64_t)"Defaulting to sRGB colorspace", v79, v80, v81, v82, v83, v84, v156);
LABEL_68:
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        goto LABEL_69;
      }
      if (var6 != 1195454774)
      {
LABEL_70:
        v85 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
        v87 = (objc_class *)objc_opt_class(v5, v86);
        v88 = NSStringFromClass(v87);
        NSStringFromSelector(a2);
        v156 = (uint64_t)v88;
        p_var0 = &v161->var0;
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("CUIThemeRendition.m"), 3879, CFSTR("CoreUI: -[%@ %@] unknown pixel format %d"));
        v59 = 0;
        goto LABEL_71;
      }
      v60 = kCGColorSpaceGenericGrayGamma2_2;
      if ((*((_DWORD *)v161 + 7) & 0xF) == 6)
        v60 = kCGColorSpaceExtendedGray;
      if (*(_DWORD *)(v160 + 8) == 5)
        v61 = kCGColorSpaceDisplayP3;
      else
        v61 = v60;
      v59 = CGColorSpaceCreateWithName(v61);
      if (v59)
        goto LABEL_71;
      _CUILog(1, (uint64_t)"Can't find %@ colorspace Defaulting to Device Gray colorspace", v62, v63, v64, v65, v66, v67, (uint64_t)v61);
      DeviceRGB = CGColorSpaceCreateDeviceGray();
    }
    else
    {
      switch(var6)
      {
        case 1195456544:
          v69 = kCGColorSpaceGenericGrayGamma2_2;
          break;
        case 1380401717:
          v70 = &kCGColorSpaceSRGB;
          if ((*((_DWORD *)v161 + 7) & 0xFu) <= 3)
            v70 = (const CFStringRef *)qword_1E41B2390[*((_DWORD *)v161 + 7) & 0xF];
          v71 = *v70;
          v59 = CGColorSpaceCreateWithName(*v70);
          if (v59)
            goto LABEL_71;
          _CUILog(1, (uint64_t)"Can't find %@ colorspace Defaulting to sRGB colorspace", v72, v73, v74, v75, v76, v77, (uint64_t)v71);
          v69 = kCGColorSpaceSRGB;
          break;
        case 1380401751:
          v51 = &kCGColorSpaceSRGB;
          if ((*((_DWORD *)v161 + 7) & 0xFu) - 3 <= 2)
            v51 = (const CFStringRef *)qword_1E41B2378[(*((_DWORD *)v161 + 7) & 0xF) - 3];
          if (*(_DWORD *)(v160 + 8) == 5)
            v51 = &kCGColorSpaceDisplayP3;
          v52 = *v51;
          v59 = CGColorSpaceCreateWithName(*v51);
          if (v59)
            goto LABEL_71;
          _CUILog(1, (uint64_t)"Can't find %@ colorspace Defaulting to sRGB colorspace", v53, v54, v55, v56, v57, v58, (uint64_t)v52);
          goto LABEL_68;
        default:
          goto LABEL_70;
      }
      DeviceRGB = CGColorSpaceCreateWithName(v69);
    }
LABEL_69:
    v59 = DeviceRGB;
LABEL_71:
    v89 = p_var0[3];
    v90 = p_var0[4];
    *((double *)v5 + 52) = (double)v89;
    *((double *)v5 + 53) = (double)v90;
    v91 = -[_CUIThemePixelRendition newImageFromCSIDataSlice:ofBitmap:usingColorspace:](v5, 0, v89 | (v90 << 32), v160, v59);
    *((_QWORD *)v5 + 44) = v91;
    if (!v91)
    {
      CGColorSpaceRelease(v59);
      CGImageSetProperty(*((_QWORD *)v5 + 44), CFSTR("com.apple.coreui"), +[CUIRenditionKey renditionKeyWithKeyList:](CUIRenditionKey, "renditionKeyWithKeyList:", objc_msgSend(v5, "key")));
      v140 = p_var0[6];
      if (v140 == 1195454774
        || v140 == 1380401751
        || (*(_DWORD *)objc_msgSend(v5, "renditionFlags") & 0x3C) == 0x1C
        || (*(_DWORD *)objc_msgSend(v5, "renditionFlags") & 0x3C) == 0x30)
      {
        return v5;
      }
      v147 = "Unable to create unsliced image from csi bitmap data.";
LABEL_133:
      _CUILog(4, (uint64_t)v147, v141, v142, v143, v144, v145, v146, v156);
LABEL_134:

      return 0;
    }
    spacea = v59;
    origin = CGRectZero.origin;
    size = CGRectZero.size;
    v178 = origin;
    v179 = size;
    v180 = origin;
    v181 = size;
    *(CGPoint *)v182 = origin;
    *(CGSize *)&v182[16] = size;
    v183 = origin;
    v184 = size;
    v185 = origin;
    v186 = size;
    v187 = origin;
    v188 = size;
    v189 = origin;
    v190 = size;
    v191 = origin;
    v192 = size;
    v193 = origin;
    v194 = size;
    v195 = origin;
    v196 = size;
    v197 = origin;
    v198 = size;
    v199 = origin;
    v200 = size;
    v201 = origin;
    v202 = size;
    v203 = origin;
    v204 = size;
    v205 = origin;
    v206 = size;
    v207 = origin;
    v208 = size;
    v94 = *v165;
    if (!(_DWORD)v94)
      goto LABEL_89;
    v95 = 0;
    v96 = v165 + 4;
    v97 = (double *)&v179;
    while (1)
    {
      v99 = *(v96 - 1);
      v98 = *v96;
      if (v99)
        v100 = v98 == 0;
      else
        v100 = 1;
      if (v100)
      {
        *(_QWORD *)&v5[8 * v95 + 224] = 0;
        goto LABEL_82;
      }
      LODWORD(origin.x) = *(v96 - 3);
      v211.origin.x = (double)*(unint64_t *)&origin.x;
      v211.origin.y = (double)(v90 - (v98 + *(v96 - 2)));
      v211.size.width = (double)v99;
      v211.size.height = (double)v98;
      *(v97 - 2) = v211.origin.x;
      *(v97 - 1) = v211.origin.y;
      *v97 = (double)v99;
      v97[1] = (double)v98;
      v101 = CGImageCreateWithImageInRect(*((CGImageRef *)v5 + 44), v211);
      *(_QWORD *)&v5[8 * v95 + 224] = v101;
      if (!v101)
        break;
      v94 = *v165;
LABEL_82:
      if (v95 <= 0xE)
      {
        v96 += 4;
        ++v95;
        v97 += 4;
        if (v95 < v94)
          continue;
      }
      goto LABEL_89;
    }
    if (*((_QWORD *)v5 + 44) && objc_msgSend(v5, "type") == (id)3)
    {
      _CUILog(4, (uint64_t)"CoreUI: CUIThemeRendition invalid slicing information assuming its a OnePart image", v102, v103, v104, v105, v106, v107, v156);
      objc_msgSend(v5, "setType:", 0);
      objc_msgSend(v5, "setSubtype:", 12);
      goto LABEL_89;
    }
    if (objc_msgSend(v5, "type"))
    {
      CGColorSpaceRelease(spacea);
      v154 = *((_QWORD *)v5 + 44);
      objc_msgSend(v5, "type");
      v156 = v154;
      v147 = "Unable to create sliced image from csi bitmap data %@ type is %d slices count %d rect is {%d,%d}.";
      goto LABEL_133;
    }
LABEL_89:
    CGColorSpaceRelease(spacea);
    if (objc_msgSend(v5, "type") == (id)3)
    {
      v108 = (double)CGImageGetWidth(*((CGImageRef *)v5 + 28));
      v109 = (double)CGImageGetWidth(*((CGImageRef *)v5 + 30));
      v110 = (double)CGImageGetHeight(*((CGImageRef *)v5 + 28));
      v111 = (double)CGImageGetHeight(*((CGImageRef *)v5 + 34));
      objc_msgSend(v5, "scale");
      Width = v108 + v109 + v112;
      objc_msgSend(v5, "scale");
      v49 = v113 + v110 + v111;
      v4 = v161;
      v8 = v164;
    }
    else
    {
      v8 = v164;
      if (objc_msgSend(v5, "type") == (id)2)
      {
        v114 = (double)CGImageGetHeight(*((CGImageRef *)v5 + 28));
        v115 = v114 + (double)CGImageGetHeight(*((CGImageRef *)v5 + 30));
        objc_msgSend(v5, "scale");
        v49 = v116 + v115;
      }
      else if (objc_msgSend(v5, "type") == (id)1)
      {
        v117 = (double)CGImageGetWidth(*((CGImageRef *)v5 + 28));
        v118 = v117 + (double)CGImageGetWidth(*((CGImageRef *)v5 + 30));
        objc_msgSend(v5, "scale");
        Width = v119 + v118;
      }
      v4 = v161;
    }
    v209.width = NSZeroSize.width;
    v209.height = height;
    v210.width = Width;
    v210.height = v49;
    if (!NSEqualSizes(v209, v210))
    {
      v120 = [CUIRenditionMetrics alloc];
      v121 = v170;
      v122 = objc_msgSend(v5, "type") == (id)2 || objc_msgSend(v5, "type") == (id)3;
      v123 = objc_msgSend(v5, "type") == (id)1 || objc_msgSend(v5, "type") == (id)3;
      objc_msgSend(v5, "scale");
      *((_QWORD *)v5 + 45) = -[CUIRenditionMetrics initWithImageSize:defaultImageSize:edgeBottomLeft:edgeTopRight:contentBottomLeft:contentTopRight:baseline:auxiliary1BottomLeft:auxiliary1TopRight:auxiliary2BottomLeft:auxiliary2TopRight:scalesVertically:scalesHorizontally:scale:](v120, v122, v123, Width, v49, v175, v176, v174.width, v174.height, v173.width, v173.height, v124, v125, v126, v127, v128, *(uint64_t *)&v172.width, *(uint64_t *)&v172.height, *(uint64_t *)&v171.width,
                               *(uint64_t *)&v171.height,
                               v121,
                               *(uint64_t *)&v169.width,
                               *(uint64_t *)&v169.height,
                               *(uint64_t *)&v168.width,
                               *(uint64_t *)&v168.height,
                               *(uint64_t *)&v167.width,
                               *(uint64_t *)&v167.height,
                               *(uint64_t *)&v166.width,
                               *(uint64_t *)&v166.height,
                               v129);
      v8 = v164;
    }
    v130 = objc_msgSend(v5, "type");
    v131 = 64;
    if (v130 == (id)3)
      v131 = 256;
    v133 = v179.height;
    v132 = v179.width;
    v134 = (double *)((char *)&v178.x + v131);
    v135 = v134[2];
    v136 = v134[3];
    if (objc_msgSend(v5, "type") == (id)3)
    {
      v137 = v184.width;
      if (v184.width <= v190.width)
        v137 = v190.width;
      if (v132 == 0.0)
        v132 = v137;
      v138 = v181.height;
      if (v181.height <= *(double *)&v182[24])
        v138 = *(double *)&v182[24];
      if (v133 == 0.0)
        v133 = v138;
      if (*(double *)&v182[16] <= v188.width)
        v139 = v188.width;
      else
        v139 = *(double *)&v182[16];
      if (v135 == 0.0)
        v135 = v139;
      if (v136 == 0.0)
      {
        if (v190.height <= v192.height)
          v136 = v192.height;
        else
          v136 = v190.height;
      }
    }
    v10 = 0;
    *((_QWORD *)v5 + 46) = -[CUIRenditionSliceInformation initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:]([CUIRenditionSliceInformation alloc], "initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:", objc_msgSend(v5, "type"), 0.0, 0.0, Width, v49, v132, v133, v135, v136);
    v7 = 1;
    v11 = &OBJC_IVAR___CUIPSDLayerEffectBevelEmboss__highlightBlendMode;
  }
  while (v4->var11.var0 > 1);
  return v5;
}

- (CGImageRef)newImageFromCSIDataSlice:(unint64_t)a3 ofBitmap:(uint64_t)a4 usingColorspace:(CGColorSpace *)a5
{
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  int v18;
  int v19;
  size_t v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  objc_class *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  size_t v31;
  int v32;
  int v33;
  NSString *v34;
  int v35;
  int v36;
  unsigned int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  int v46;
  CSIHelper *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  CGImageRef ImageAtIndex;
  CGDataProvider *v58;
  size_t v59;
  CGDataProvider *Direct;
  int v61;
  CGImageSource *v62;
  CGImageSource *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  id AlignedBytesPerRow;
  id v74;
  CGFloat *decode;
  NSAssertionHandler *bitmapInfoa;
  CGBitmapInfo bitmapInfo;
  CGColorSpace *space;
  unsigned int v79;
  int v80;
  size_t bitsPerComponent;

  if (!a1)
    return 0;
  v10 = objc_msgSend(objc_msgSend(a1, "srcData"), "bytes");
  v17 = v10;
  v19 = v10[3];
  v18 = v10[4];
  v80 = 4;
  LODWORD(bitsPerComponent) = 8;
  v20 = HIDWORD(a3);
  v79 = 1;
  v21 = v10[6];
  space = a5;
  if (v21 <= 1195456543)
  {
    if (v21 == 1095911234)
    {
LABEL_11:
      v24 = 4;
      v80 = 4;
      LODWORD(bitsPerComponent) = 8;
      if ((*(_BYTE *)(a4 + 4) & 2) != 0)
        v25 = 8198;
      else
        v25 = 8194;
      if (!HIDWORD(a3))
        goto LABEL_44;
      goto LABEL_33;
    }
    v22 = 1195454774;
  }
  else
  {
    if (v21 == 1195456544)
    {
      v24 = 2;
      v80 = 2;
      LODWORD(bitsPerComponent) = 8;
      v25 = 12291;
      if (!HIDWORD(a3))
        goto LABEL_44;
      goto LABEL_33;
    }
    if (v21 == 1380401717)
    {
      LODWORD(bitsPerComponent) = 5;
      v79 = 0;
      v25 = 4102;
      v24 = 2;
      if (!HIDWORD(a3))
        goto LABEL_44;
      goto LABEL_33;
    }
    v22 = 1380401751;
  }
  if (v21 != v22)
    goto LABEL_31;
  v23 = *(_DWORD *)(a4 + 8);
  if (v23 <= 0xC && ((1 << v23) & 0x10A0) != 0)
    goto LABEL_11;
  if (v21 > 1380401716)
  {
    if (v21 == 1380401751)
    {
      v80 = 4;
      LODWORD(bitsPerComponent) = 16;
      v79 = 2;
      if ((*(_BYTE *)(a4 + 4) & 2) != 0)
        v25 = 4101;
      else
        v25 = 4097;
      if ((v10[7] & 0xE) == 4)
      {
        v25 |= 0x100u;
        v79 = 5;
      }
      v24 = 8;
      if (!HIDWORD(a3))
        goto LABEL_44;
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  if (v21 != 1195454774)
  {
LABEL_31:
    bitmapInfoa = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v27 = (objc_class *)objc_opt_class(a1, v26);
    v28 = a3;
    v29 = a4;
    v30 = a2;
    v31 = v20;
    v32 = v18;
    v33 = v19;
    v34 = NSStringFromClass(v27);
    NSStringFromSelector(sel_newImageFromCSIDataSlice_ofBitmap_usingColorspace_);
    decode = (CGFloat *)v34;
    v19 = v33;
    v18 = v32;
    v20 = v31;
    a2 = v30;
    a4 = v29;
    a3 = v28;
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](bitmapInfoa, "handleFailureInMethod:object:file:lineNumber:description:", sel_newImageFromCSIDataSlice_ofBitmap_usingColorspace_, a1, CFSTR("CUIThemeRendition.m"), 3452, CFSTR("CoreUI: -[%@ %@] unknown pixel format %d"));
    v25 = 0;
    goto LABEL_32;
  }
  v80 = 2;
  LODWORD(bitsPerComponent) = 16;
  v79 = 2;
  if ((*(_BYTE *)(a4 + 4) & 2) != 0)
    v25 = 4101;
  else
    v25 = 4097;
  if ((v10[7] & 0xF) == 6)
  {
    v25 |= 0x100u;
    v79 = 5;
  }
LABEL_32:
  v24 = 4;
  if (!(_DWORD)v20)
  {
LABEL_44:
    _CUILog(4, (uint64_t)"CoreUI: degenerate slice geometry", v11, v12, v13, v14, v15, v16, (uint64_t)decode);
    return 0;
  }
LABEL_33:
  if (!(_DWORD)a3)
    goto LABEL_44;
  bitmapInfo = v25;
  v35 = v19;
  v36 = *(_DWORD *)(a4 + 8);
  v37 = (unsigned int *)objc_msgSend(a1, "renditionFlags");
  *v37 = *v37 & 0xFFFFFFC3 | (4 * (v36 & 0xF));
  v44 = *(_DWORD *)(a4 + 8);
  if (v44 > 0xC)
  {
    _CUILog(4, (uint64_t)"-[CUIThemeRendition newImageFromCSIDataSlice:ofBitmap: usingColorspace:] Unsupported pixel format in CSI got %d", v38, v39, v40, v41, v42, v43, *(unsigned int *)(a4 + 8));
    v58 = 0;
    goto LABEL_58;
  }
  v45 = v18 - (HIDWORD(a2) + v20);
  v46 = 1 << v44;
  if ((v46 & 0xF7E) != 0)
    goto LABEL_36;
  if ((v46 & 0x1080) == 0)
  {
    v72 = a4 + v24 * ((_DWORD)a2 + v35 * v45) + 16;
    if (objc_msgSend(a1, "sourceRowbytes"))
    {
      AlignedBytesPerRow = objc_msgSend(a1, "sourceRowbytes");
    }
    else
    {
      v59 = v24 * v35;
      if (v17[6] != 1195456544)
      {
LABEL_73:
        v74 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v72, v59 * v20);
        __CFSetLastAllocationEventName(v74, "_CUIThemePixelRendition_bytes");
        Direct = CGDataProviderCreateWithData(v74, objc_msgSend(v74, "bytes"), (size_t)objc_msgSend(v74, "length"), (CGDataProviderReleaseDataCallback)__releaseData);
        goto LABEL_47;
      }
      AlignedBytesPerRow = (id)CGBitmapGetAlignedBytesPerRow(v24 * v35);
    }
    v59 = (size_t)AlignedBytesPerRow;
    goto LABEL_73;
  }
  CUIUpdateImageProviderForATECompressedData(v17[6], &bitsPerComponent, &v80, &v79, v40, v41, v42, v43);
  v24 = (v80 * bitsPerComponent) >> 3;
LABEL_36:
  v47 = objc_alloc_init(CSIHelper);
  *(_QWORD *)&v47->slice.x = a2;
  *(_QWORD *)&v47->slice.width = a3;
  v47->slice.y = v45;
  v47->csiData = (NSData *)objc_msgSend(a1, "srcData");
  v47->bmp = (_csibitmap *)a4;
  v47->renditionLock._os_unfair_lock_opaque = 0;
  objc_storeWeak((id *)&v47->rendition, a1);
  v47->blockDataCacheKeyRGBX = 0;
  v47->blockDataCacheKeyGray = 0;
  v47->blockDataCacheKeyBGRX = 0;
  objc_storeWeak((id *)&v47->sharedBlockDataBGRX, 0);
  objc_storeWeak((id *)&v47->sharedBlockDataRGBX, 0);
  objc_storeWeak((id *)&v47->sharedBlockDataGray, 0);
  v47->sourceRowbytes = (unint64_t)objc_msgSend(a1, "sourceRowbytes");
  *((_BYTE *)v47 + 120) = *((_BYTE *)v47 + 120) & 0xFE | (*(_DWORD *)(a4 + 8) != 1);
  if (v79)
  {
    if (__providerOptionsOnce != -1)
      dispatch_once(&__providerOptionsOnce, &__block_literal_global_369);
    if ((*(_DWORD *)(a4 + 4) & 2) != 0)
      v48 = &__opaqueProviderOptions;
    else
      v48 = &__nonOpaqueProviderOptions;
    v49 = CGImageProviderCreate(v79, space, v47, &csiCompressImageProviderCallbacks, *v48, (double)a3, (double)v20);
    v56 = v49;
    if (v49)
    {
      ImageAtIndex = (CGImageRef)CGImageCreateWithImageProvider(v49, 0, 1, 0);
      v58 = 0;
      goto LABEL_60;
    }
    _CUILog(4, (uint64_t)"CoreUI: failed to create image provider for %d %d componentType %d colorSpace %@ options %@", v50, v51, v52, v53, v54, v55, a3);
    v58 = 0;
    goto LABEL_59;
  }
  v59 = CGBitmapGetAlignedBytesPerRow(v24 * a3);
  *((_BYTE *)v47 + 120) |= 2u;
  Direct = CGDataProviderCreateDirect(v47, v59 * v20, &csiCompressDataProviderCallbacks);
LABEL_47:
  v58 = Direct;
  if (Direct)
  {
    v61 = *(_DWORD *)(a4 + 8);
    if (v61 != 12 && v61 != 7)
    {
      ImageAtIndex = CGImageCreate(a3, v20, bitsPerComponent, 8 * v24, v59, space, bitmapInfo, Direct, 0, 1, kCGRenderingIntentDefault);
      goto LABEL_56;
    }
    v62 = CGImageSourceCreateWithDataProvider(Direct, 0);
    if (v62)
    {
      v63 = v62;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v62, 0, 0);
      CFRelease(v63);
LABEL_56:
      v56 = 0;
      goto LABEL_60;
    }
  }
LABEL_58:
  v56 = 0;
LABEL_59:
  ImageAtIndex = 0;
LABEL_60:
  CGDataProviderRelease(v58);
  CGImageProviderRelease(v56);
  if (!ImageAtIndex)
  {
    v64 = CUIConvertCompressionTypeToString(*(_DWORD *)(a4 + 8));
    _CUILog(4, (uint64_t)"CoreUI: failed to create an image because of a bad pixel format or failure to create an appropriate image provider for encoding '%s'", v65, v66, v67, v68, v69, v70, (uint64_t)v64);
  }
  return ImageAtIndex;
}

- (unint64_t)sourceRowbytes
{
  return self->_sourceRowbytes;
}

- (id)metrics
{
  return self->_renditionMetrics;
}

- (id)copySharedBlockDataWithPixelFormat:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return *(id *)((char *)&self->super.super.isa + *off_1E41B23B0[a3]);
}

- (void)setSharedBlockData:(id)a3
{
  int v4;
  _CSIRenditionBlockData *cachedBlockDataGray;
  _QWORD v6[5];
  int v7;

  if (!a3)
    goto LABEL_5;
  v4 = *((_DWORD *)a3 + 3);
  switch(v4)
  {
    case 2:
      cachedBlockDataGray = self->_cachedBlockDataGray;
      if (cachedBlockDataGray == a3)
        return;
      self->_cachedBlockDataGray = (_CSIRenditionBlockData *)a3;
      v4 = 2;
      break;
    case 1:
      cachedBlockDataGray = self->_cachedBlockDataRGBX;
      if (cachedBlockDataGray == a3)
        return;
      self->_cachedBlockDataRGBX = (_CSIRenditionBlockData *)a3;
      v4 = 1;
      break;
    case 0:
LABEL_5:
      cachedBlockDataGray = self->_cachedBlockDataBGRX;
      if (cachedBlockDataGray == a3)
        return;
      v4 = 0;
      self->_cachedBlockDataBGRX = (_CSIRenditionBlockData *)a3;
      break;
    default:
      cachedBlockDataGray = 0;
      break;
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __46___CUIThemePixelRendition_setSharedBlockData___block_invoke;
  v6[3] = &unk_1E41B2338;
  v7 = v4;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (int)pixelFormat
{
  return *((_DWORD *)-[NSData bytes](-[CUIThemeRendition srcData](self, "srcData"), "bytes") + 6);
}

- (CGSize)unslicedSize
{
  double width;
  double height;
  CGSize result;

  -[CUIThemeRendition originalUncroppedSize](self, "originalUncroppedSize");
  if (width == 0.0 || height == 0.0)
  {
    width = self->_unslicedSize.width;
    height = self->_unslicedSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)dealloc
{
  unint64_t v3;
  CGImage **image;
  objc_super v5;

  CGImageRelease(self->_unslicedImage);
  self->_unslicedImage = 0;
  if (self->_nimages)
  {
    v3 = 0;
    image = self->_image;
    do
    {
      CGImageRelease(image[v3]);
      image[v3++] = 0;
    }
    while (v3 < self->_nimages);
  }

  self->_cachedBlockDataBGRX = 0;
  self->_cachedBlockDataRGBX = 0;

  self->_cachedBlockDataGray = 0;
  self->_renditionMetrics = 0;

  self->_sliceInformation = 0;
  v5.receiver = self;
  v5.super_class = (Class)_CUIThemePixelRendition;
  -[CUIThemeRendition dealloc](&v5, sel_dealloc);
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

- (id)layerReferences
{
  return self->_layers;
}

- (id)sliceInformation
{
  return self->_sliceInformation;
}

- (BOOL)isTiled
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((id)-[CUIThemeRendition type](self, "type") == (id)3
    || !-[CUIThemeRendition type](self, "type")
    || (id)-[CUIThemeRendition type](self, "type") == (id)5
    || (id)-[CUIThemeRendition type](self, "type") == (id)8)
  {
    return -[CUIThemeRendition subtype](self, "subtype") == 30 || -[CUIThemeRendition subtype](self, "subtype") == 11;
  }
  v4 = -[CUIThemeRendition name](self, "name");
  _CUILog(1, (uint64_t)"WARNING: -isTiled called on rendition named: %@, which is not a one-part or nine-part image, but the method is only meaningful for one-part and nine-part images. Returning NO.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  return 0;
}

- (BOOL)isScaled
{
  return -[CUIThemeRendition subtype](self, "subtype") == 31
      || -[CUIThemeRendition subtype](self, "subtype") == 12
      || (id)-[CUIThemeRendition type](self, "type") == (id)2
      || (id)-[CUIThemeRendition type](self, "type") == (id)1;
}

- (BOOL)edgesOnly
{
  return -[CUIThemeRendition subtype](self, "subtype") == 34
      && CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIThemeRendition key](self, "key"), 11) != 2;
}

@end
