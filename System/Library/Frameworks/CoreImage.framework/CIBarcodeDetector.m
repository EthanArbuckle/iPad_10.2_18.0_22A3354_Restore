@implementation CIBarcodeDetector

- (CIBarcodeDetector)initWithContext:(id)a3 options:(id)a4
{
  CIBarcodeDetector *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CIBarcodeDetector;
  v6 = -[CIDetector init](&v9, sel_init);
  if (v6)
  {
    if (!a3)
      a3 = +[CIContext _singletonContext](CIContext, "_singletonContext");
    -[CIBarcodeDetector setContext:](v6, "setContext:", a3);
    if (!v6->featureOptions)
      v6->featureOptions = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorAccuracy"));
    if (objc_msgSend(v7, "isEqual:", CFSTR("CIDetectorAccuracyHigh")))
    {
      -[NSMutableDictionary setObject:forKey:](v6->featureOptions, "setObject:forKey:", CFSTR("CIDetectorAccuracyHigh"), CFSTR("CIDetectorAccuracy"));
    }
    else if (v7 && (objc_msgSend(v7, "isEqual:", CFSTR("CIDetectorAccuracyLow")) & 1) == 0)
    {
      NSLog(CFSTR("Unknown CIDetectorAccuracy specified. Ignoring."));
    }
  }
  return v6;
}

- (void)dealloc
{
  NSMutableDictionary *featureOptions;
  objc_super v4;

  -[CIBarcodeDetector setContext:](self, "setContext:", 0);
  featureOptions = self->featureOptions;
  if (featureOptions)

  v4.receiver = self;
  v4.super_class = (Class)CIBarcodeDetector;
  -[CIBarcodeDetector dealloc](&v4, sel_dealloc);
}

- (id)featuresInImage:(id)a3 options:(id)a4
{
  NSObject *v6;
  uint64_t *ACBS;
  uint64_t *v8;
  uint64_t v9;
  const __CFAllocator *v10;
  CFArrayRef v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  uint64_t v20;
  CIContext *v21;
  size_t Width;
  size_t Height;
  const __CFArray *Value;
  const __CFArray *v25;
  int Count;
  NSObject *v27;
  __CFArray *Mutable;
  CFIndex v29;
  uint64_t v30;
  const __CFDictionary *ValueAtIndex;
  const void *v32;
  int v33;
  CFIndex v34;
  const __CFDictionary *v35;
  void *v36;
  void *v37;
  float v38;
  float v39;
  float v40;
  float v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  void *v47;
  float v48;
  float v49;
  float v50;
  float v51;
  void *v52;
  float v53;
  float v54;
  double v55;
  double v56;
  double v57;
  double v58;
  float v59;
  double v60;
  double v61;
  float v62;
  double v63;
  float v64;
  double v65;
  double v66;
  double v67;
  double v68;
  BOOL v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  const __CFDictionary *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  CIQRCodeDescriptor *v86;
  CIQRCodeFeature *v87;
  CFDictionaryRef theDict;
  CFArrayRef cf;
  uint64_t v91;
  uint64_t v92;
  id v93;
  double v94;
  double v95;
  double v96;
  double v97;
  uint8_t buf[8];
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  CIQRCodeDescriptor *v110;
  CGAffineTransform v111;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v113[2];
  void (*v114)(uint64_t);
  void *v115;
  CIBarcodeDetector *v116;
  uint64_t v117;
  uint64_t v118;
  void *values[3];
  CGRect v120;
  CGRect v121;

  values[1] = *(void **)MEMORY[0x1E0C80C00];
  v6 = ci_signpost_log_detector();
  if ((unint64_t)&self->super.super.isa + 1 >= 2)
  {
    v27 = v6;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v27, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "CIBarcodeDetector", (const char *)&unk_192520C83, buf, 2u);
    }
  }
  v113[0] = MEMORY[0x1E0C809B0];
  v113[1] = 3221225472;
  v114 = __45__CIBarcodeDetector_featuresInImage_options___block_invoke;
  v115 = &__block_descriptor_40_e5_v8__0l;
  v116 = self;
  ACBS = loadACBS();
  v8 = ACBS;
  if (!ACBS || (v9 = ((uint64_t (*)(void))*ACBS)()) == 0)
  {
    v93 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_69;
  }
  v91 = v9;
  pixelBufferOut = 0;
  values[0] = CFSTR("QR");
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)values, 1, MEMORY[0x1E0C9B378]);
  if (!v11)
    __assert_rtn("-[CIBarcodeDetector featuresInImage:options:]", "CIBarcodeDetector.mm", 89, "NULL != symbologies");
  cf = v11;
  v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a3, "extent");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  CGAffineTransformMakeTranslation(&v111, -v12, -v14);
  v20 = objc_msgSend(a3, "imageByApplyingTransform:", &v111);
  v120.origin.x = v13;
  v120.origin.y = v15;
  v120.size.width = v17;
  v120.size.height = v19;
  self->_width = CGRectGetWidth(v120);
  v121.origin.x = v13;
  v121.origin.y = v15;
  v121.size.width = v17;
  v121.size.height = v19;
  self->_height = CGRectGetHeight(v121);
  v117 = *MEMORY[0x1E0CA8FF0];
  v118 = MEMORY[0x1E0C9AA70];
  CVPixelBufferCreate(0, (unint64_t)self->_width, (unint64_t)self->_height, 0x34323066u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1), &pixelBufferOut);
  CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8EE8], (CFTypeRef)*MEMORY[0x1E0CA8F10], kCVAttachmentMode_ShouldPropagate);
  if (!pixelBufferOut)
  {
    theDict = 0;
LABEL_66:
    ((void (*)(uint64_t))v8[1])(v91);
    if (theDict)
      CFRelease(theDict);
    CFRelease(cf);
    goto LABEL_69;
  }
  v21 = -[CIBarcodeDetector context](self, "context");
  -[CIContext render:toCVPixelBuffer:](v21, "render:toCVPixelBuffer:", v20, pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  Width = CVPixelBufferGetWidth(pixelBufferOut);
  Height = CVPixelBufferGetHeight(pixelBufferOut);
  ((void (*)(uint64_t, CFArrayRef))v8[4])(v91, cf);
  ((void (*)(uint64_t, uint64_t))v8[2])(v91, 5000);
  theDict = (CFDictionaryRef)((uint64_t (*)(uint64_t, CVPixelBufferRef, _QWORD, double, double, double, double))v8[3])(v91, pixelBufferOut, 0, 0.0, 0.0, (double)Width, (double)Height);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  if (theDict)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("SymbolDescriptionArray"));
    v25 = Value;
    if (Value)
    {
      Count = CFArrayGetCount(Value);
      goto LABEL_15;
    }
  }
  else
  {
    v25 = 0;
  }
  Count = 0;
LABEL_15:
  Mutable = CFArrayCreateMutable(v10, 4, MEMORY[0x1E0C9B378]);
  if (Count >= 1)
  {
    v29 = 0;
    v30 = Count;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v25, v29);
      v32 = CFDictionaryGetValue(ValueAtIndex, CFSTR("BarcodeType"));
      if (CFEqual(v32, CFSTR("QR")))
        CFArrayAppendValue(Mutable, ValueAtIndex);
      ++v29;
    }
    while (v30 != v29);
  }
  if (!Mutable)
    goto LABEL_65;
  v33 = CFArrayGetCount(Mutable);
  if (v33 < 1)
  {
LABEL_64:
    CFRelease(Mutable);
LABEL_65:
    CVPixelBufferRelease(pixelBufferOut);
    goto LABEL_66;
  }
  v34 = 0;
  v92 = v33;
  while (1)
  {
    v35 = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v34);
    v36 = (void *)CFDictionaryGetValue(v35, CFSTR("CodeLocation"));
    v37 = (void *)objc_msgSend(v36, "objectAtIndex:", 0);
    objc_msgSend((id)objc_msgSend(v37, "objectForKey:", CFSTR("X")), "floatValue");
    v39 = v38;
    objc_msgSend((id)objc_msgSend(v37, "objectForKey:", CFSTR("Y")), "floatValue");
    v41 = v40;
    v42 = (void *)objc_msgSend(v36, "objectAtIndex:", 1);
    objc_msgSend((id)objc_msgSend(v42, "objectForKey:", CFSTR("X")), "floatValue");
    v44 = v43;
    objc_msgSend((id)objc_msgSend(v42, "objectForKey:", CFSTR("Y")), "floatValue");
    v46 = v45;
    v47 = (void *)objc_msgSend(v36, "objectAtIndex:", 2);
    objc_msgSend((id)objc_msgSend(v47, "objectForKey:", CFSTR("X")), "floatValue");
    v49 = v48;
    objc_msgSend((id)objc_msgSend(v47, "objectForKey:", CFSTR("Y")), "floatValue");
    v51 = v50;
    v52 = (void *)objc_msgSend(v36, "objectAtIndex:", 3);
    objc_msgSend((id)objc_msgSend(v52, "objectForKey:", CFSTR("X")), "floatValue");
    v54 = v53;
    objc_msgSend((id)objc_msgSend(v52, "objectForKey:", CFSTR("Y")), "floatValue");
    v55 = v39;
    v56 = v44;
    v57 = v51;
    v58 = v54;
    v60 = self->_height;
    v61 = v60 - v41;
    v62 = v44;
    v63 = v60 - v46;
    v64 = v39;
    v65 = v60 - v57;
    v66 = v60 - v59;
    if (v49 >= v54)
      v67 = v54;
    else
      v67 = v49;
    v96 = v49;
    v97 = v56;
    if (v49 <= v54)
      v68 = v54;
    else
      v68 = v49;
    v69 = v64 <= v62;
    if (v64 >= v62)
      v70 = v56;
    else
      v70 = v55;
    if (v69)
      v71 = v56;
    else
      v71 = v55;
    if (v70 >= v67)
      v72 = v67;
    else
      v72 = v70;
    if (v71 <= v68)
      v73 = v68;
    else
      v73 = v71;
    if (v65 >= v66)
      v74 = v66;
    else
      v74 = v65;
    if (v65 <= v66)
      v75 = v66;
    else
      v75 = v65;
    if (v61 >= v63)
      v76 = v63;
    else
      v76 = v61;
    if (v61 <= v63)
      v77 = v63;
    else
      v77 = v61;
    if (v76 >= v74)
      v78 = v74;
    else
      v78 = v76;
    if (v77 <= v75)
      v79 = v75;
    else
      v79 = v77;
    v94 = v79;
    v95 = v73;
    v80 = (const __CFDictionary *)CFDictionaryGetValue(v35, CFSTR("CodeProperties"));
    v81 = objc_msgSend((id)CFDictionaryGetValue(v80, CFSTR("ErrorCorrectionLevel")), "intValue");
    if (v81 >= 4)
      __assert_rtn("-[CIBarcodeDetector featuresInImage:options:]", "CIBarcodeDetector.mm", 187, "0 && \"unreachable\");
    v82 = qword_19248E3F8[v81];
    v83 = objc_msgSend((id)CFDictionaryGetValue(v80, CFSTR("SymbolVersion")), "integerValue");
    v84 = objc_msgSend((id)CFDictionaryGetValue(v80, CFSTR("QRMASK")), "unsignedCharValue");
    v85 = (id)CFDictionaryGetValue(v35, CFSTR("BarcodeRawData"));
    if (!v85)
      break;
    v86 = +[CIQRCodeDescriptor descriptorWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:](CIQRCodeDescriptor, "descriptorWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:", v85, v83, v84, v82);
    *(double *)buf = v72;
    v99 = v78;
    v100 = v95 - v72;
    v101 = v94 - v78;
    v102 = v55;
    v103 = v61;
    v104 = v58;
    v105 = v66;
    v106 = v97;
    v107 = v63;
    v108 = v96;
    v109 = v65;
    v110 = v86;
    v87 = -[CIQRCodeFeature initWithInternalRepresentation:]([CIQRCodeFeature alloc], "initWithInternalRepresentation:", buf);

    if (v87)
      objc_msgSend(v93, "addObject:", v87);

    if (v92 == ++v34)
      goto LABEL_64;
  }
  v93 = 0;
LABEL_69:
  v114((uint64_t)v113);
  return v93;
}

void __45__CIBarcodeDetector_featuresInImage_options___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = ci_signpost_log_detector();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v2;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_END, v3, "CIBarcodeDetector", (const char *)&unk_192520C83, v5, 2u);
    }
  }
}

- (id)featuresInImage:(id)a3
{
  return -[CIBarcodeDetector featuresInImage:options:](self, "featuresInImage:options:", a3, 0);
}

- (CIContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
