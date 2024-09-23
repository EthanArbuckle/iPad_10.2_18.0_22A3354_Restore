@implementation CPArchive

- (CPArchive)init
{
  CPArchive *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPArchive;
  v2 = -[CPArchive init](&v4, sel_init);
  if (v2)
    v2->selections = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  return v2;
}

- (void)dispose
{
  __CFArray *selections;
  __CFArray *imageNodes;

  selections = self->selections;
  if (selections)
  {
    CFRelease(selections);
    self->selections = 0;
    imageNodes = self->imageNodes;
    if (imageNodes)
    {
      CFRelease(imageNodes);
      self->imageNodes = 0;
    }
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPArchive dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPArchive;
  -[CPArchive finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPArchive dispose](self, "dispose");

  v3.receiver = self;
  v3.super_class = (Class)CPArchive;
  -[CPArchive dealloc](&v3, sel_dealloc);
}

- (void)addSelection:(CGPDFSelection *)a3
{
  NSMutableString *htmlString;
  NSData *webArchiveData;
  NSMutableString *plainText;

  if (a3)
  {
    CFArrayAppendValue(self->selections, a3);
    htmlString = self->htmlString;
    if (htmlString)
    {
      webArchiveData = self->webArchiveData;
      if (webArchiveData)
      {

        self->webArchiveData = 0;
        htmlString = self->htmlString;
      }

      self->htmlString = 0;
    }
    plainText = self->plainText;
    if (plainText)
    {

      self->plainText = 0;
    }
  }
}

- (id)plainText
{
  uint64_t Count;
  CFIndex v4;
  char v5;
  uint64_t *ValueAtIndex;
  uint64_t *String;
  const __CFString *v8;
  uint64_t Length;
  CFIndex i;
  int CharacterAtIndex;
  UniChar chars;

  if (!self->plainText)
  {
    self->plainText = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    Count = CFArrayGetCount(self->selections);
    if (Count)
    {
      v4 = 0;
      v5 = 0;
      do
      {
        ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex(self->selections, v4);
        String = CGPDFSelectionCreateString(ValueAtIndex);
        if (String)
        {
          v8 = (const __CFString *)String;
          Length = CFStringGetLength((CFStringRef)String);
          if (Length)
          {
            if ((v5 & 1) != 0)
              CFStringAppend((CFMutableStringRef)self->plainText, CFSTR("\n"));
            for (i = 0; i != Length; ++i)
            {
              chars = 0;
              CharacterAtIndex = CFStringGetCharacterAtIndex(v8, i);
              chars = CharacterAtIndex;
              if (CharacterAtIndex != 65532)
                CFStringAppendCharacters((CFMutableStringRef)self->plainText, &chars, 1);
            }
            v5 = 1;
          }
          CFRelease(v8);
        }
        ++v4;
      }
      while (v4 != Count);
    }
  }
  return self->plainText;
}

- (id)html
{
  unsigned int Count;
  uint64_t v4;
  CFIndex v5;
  _QWORD *ValueAtIndex;
  uint64_t v7;
  NSMutableString *htmlString;
  CGPDFString *imageNodes;
  uint64_t v10;
  CFTypeRef v11;
  CGPDFString *v12;
  uint64_t v13;
  CGPDFDocument *v14;
  CGPDFDictionary *Info;
  CFStringRef Mutable;
  __CFString *v17;
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
  const __CFString *v28;
  const __CFString *v29;
  CGPDFString *v30;
  CGPDFString *i;
  uint64_t v32;
  CGPDFString *Range;
  CGPDFString *v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  const __CFAllocator *alloc;
  uint64_t v44;
  CGPDFStringRef value[11];
  int v46[3];

  if (!self->htmlString)
  {
    self->htmlString = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    self->imageNodes = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    Count = CFArrayGetCount(self->selections);
    v4 = Count;
    if (Count)
    {
      v5 = 0;
      v44 = Count;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->selections, v5);
        v7 = (uint64_t)ValueAtIndex;
        htmlString = self->htmlString;
        imageNodes = self->imageNodes;
        if (ValueAtIndex && (v10 = ValueAtIndex[21]) != 0)
        {
          v11 = CGPDFPageCopyLayout(v10);
          v12 = (CGPDFString *)CFAutorelease(v11);
          if (!v5)
            goto LABEL_9;
        }
        else
        {
          v12 = 0;
          if (!v5)
          {
LABEL_9:
            value[0] = 0;
            if (v12
              && ((v13 = *((_QWORD *)v12 + 2)) == 0 ? (v14 = 0) : (v14 = *(CGPDFDocument **)(v13 + 16)),
                  Info = CGPDFDocumentGetInfo(v14),
                  CGPDFDictionaryGetString(Info, "Title", value)))
            {
              Mutable = CGPDFStringCopyTextString(value[0]);
            }
            else
            {
              Mutable = CFStringCreateMutable(alloc, 0);
            }
            v17 = (__CFString *)Mutable;
            v46[0] = 0;
            CFStringAppend((CFMutableStringRef)htmlString, CFSTR("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">"));
            startIndent((__CFString *)htmlString, v46);
            startTagWithAttributes((__CFString *)htmlString, CFSTR("html"), 0, v18, v19, v20, v21, v22, (uint64_t)CFSTR("xmlns"), (uint64_t)CFSTR("http://www.w3.org/1999/xhtml"));
            startIndent((__CFString *)htmlString, v46);
            startTag((__CFString *)htmlString, CFSTR("head"), 0);
            startIndent((__CFString *)htmlString, v46);
            startTagWithAttributes((__CFString *)htmlString, CFSTR("meta"), 1, v23, v24, v25, v26, v27, (uint64_t)CFSTR("http-equiv"), (uint64_t)CFSTR("Content-Type"));
            --v46[0];
            startIndent((__CFString *)htmlString, v46);
            startTag((__CFString *)htmlString, CFSTR("title"), 0);
            if (v17)
            {
              v28 = CGPDFCopyStringEscapingElementMarkup(v17);
              if (v28)
              {
                v29 = v28;
                CFStringAppend((CFMutableStringRef)htmlString, v28);
                CFRelease(v29);
              }
              CFStringAppendFormat((CFMutableStringRef)htmlString, 0, CFSTR("</%@>"), CFSTR("title"));
              --v46[0];
              endIndent((__CFString *)htmlString, v46);
              CFStringAppendFormat((CFMutableStringRef)htmlString, 0, CFSTR("</%@>"), CFSTR("head"));
              startIndent((__CFString *)htmlString, v46);
              startTag((__CFString *)htmlString, CFSTR("body"), 0);
              CFRelease(v17);
            }
            else
            {
              CFStringAppendFormat((CFMutableStringRef)htmlString, 0, CFSTR("</%@>"), CFSTR("title"));
              --v46[0];
              endIndent((__CFString *)htmlString, v46);
              CFStringAppendFormat((CFMutableStringRef)htmlString, 0, CFSTR("</%@>"), CFSTR("head"));
              startIndent((__CFString *)htmlString, v46);
              startTag((__CFString *)htmlString, CFSTR("body"), 0);
            }
            v4 = v44;
          }
        }
        ++v5;
        if (v12)
        {
          v30 = (CGPDFString *)*((_QWORD *)v12 + 13);
          for (i = (CGPDFString *)CGPDFSelectionGetContainingNode(v7); i; i = (CGPDFString *)*((_QWORD *)i + 1))
          {
            if (*(_DWORD *)i == 1538)
              break;
          }
          if (v7)
          {
            v32 = *(_QWORD *)(v7 + 24);
            if (v32)
            {
              if (*(_BYTE *)(v32 + 40))
                CPIndexSetNormalize(v32);
              if (*(uint64_t *)(v32 + 16) >= 1)
              {
                if (!i)
                  i = v30;
                Range = (CGPDFString *)CPIndexSetGetRange(v32, 0);
                value[0] = v12;
                value[1] = (CGPDFStringRef)v32;
                value[2] = 0;
                value[3] = Range;
                value[5] = 0;
                value[6] = 0;
                value[4] = v34;
                value[7] = (CGPDFStringRef)htmlString;
                value[8] = (CGPDFStringRef)2;
                value[9] = i;
                value[10] = imageNodes;
                if (v30)
                  v35 = *(_DWORD *)v30;
                else
                  v35 = 0;
                v36 = 1;
                while (kCGPDFNodeTypeOrder[v36] != v35)
                {
                  if (++v36 == 12)
                  {
                    LODWORD(v36) = 0;
                    break;
                  }
                }
                ((void (*)(_QWORD, CGPDFString *, CGPDFStringRef *))htmlFuncArray[v36])(0, v30, value);
                goto LABEL_43;
              }
            }
          }
          if (v5 == v4)
            break;
        }
        else
        {
LABEL_43:
          if (v5 == v4)
          {
            LODWORD(value[0]) = 2;
            endIndent((__CFString *)htmlString, (int *)value);
            CFStringAppendFormat((CFMutableStringRef)htmlString, 0, CFSTR("</%@>"), CFSTR("body"));
            endIndent((__CFString *)htmlString, (int *)value);
            CFStringAppendFormat((CFMutableStringRef)htmlString, 0, CFSTR("</%@>"), CFSTR("html"));
            break;
          }
        }
      }
    }
    self->htmlStringNoImages = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v37 = -[NSMutableString length](self->htmlString, "length");
    v38 = 0;
    do
    {
      v39 = -[NSMutableString rangeOfString:options:range:](self->htmlString, "rangeOfString:options:range:", CFSTR("<img"), 2, v38, v37 - v38);
      if (v39 == 0x7FFFFFFFFFFFFFFFLL)
        v40 = v37;
      else
        v40 = v39;
      -[NSMutableString appendString:](self->htmlStringNoImages, "appendString:", -[NSMutableString substringWithRange:](self->htmlString, "substringWithRange:", v38, v40 - v38));
      v41 = -[NSMutableString rangeOfString:options:range:](self->htmlString, "rangeOfString:options:range:", CFSTR(">"), 2, v40, v37 - v40);
      if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        v38 = v37;
      else
        v38 = v41 + 1;
    }
    while (v38 < v37);
  }
  return self->htmlStringNoImages;
}

- (id)webArchiveData
{
  id result;
  id v4;
  id v5;
  id v6;
  objc_class *v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  unsigned int Count;
  uint64_t v12;
  void *v13;
  size_t v14;
  const void **v15;
  uint64_t v16;
  _QWORD *v17;
  int v18;
  _QWORD *i;
  unint64_t v20;
  uint64_t v21;
  int v22;
  CGPDFStream *v23;
  CGPDFStream *v24;
  CGFloat *v25;
  double PageRotation;
  double width;
  double height;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  BOOL v37;
  BOOL v38;
  double v39;
  BOOL v40;
  unint64_t *Image;
  CGImage *v42;
  CGColorSpaceRef ColorSpace;
  uint64_t v44;
  CGImageRef v45;
  CGImageRef v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  __double2 v52;
  double v53;
  size_t v54;
  size_t v55;
  CGColorSpaceRef v56;
  uint64_t v57;
  CGColorSpace *v58;
  CGContext *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  float64x2_t v68;
  CGColor *v69;
  CFDataRef v70;
  CFMutableDataRef Mutable;
  CFMutableDataRef v72;
  uint64_t ImageData_f;
  const void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CFNumberRef v79;
  CFDictionaryRef v80;
  const __CFString *ImageName;
  const __CFString *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  objc_class *v89;
  void *v90;
  unsigned int v91;
  double v92;
  void *v93;
  objc_class *v94;
  __CFString *theString;
  double x;
  double y;
  const __CFAllocator *allocator;
  CGAffineTransform v99;
  CFDataRef v100;
  double valuePtr;
  CGAffineTransform transform;
  void *values[2];
  uint64_t v104;
  CFRange v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;

  v104 = *MEMORY[0x1E0C80C00];
  if (self->webArchiveData)
    return self->webArchiveData;
  -[CPArchive html](self, "html");
  result = self->htmlString;
  if (result)
  {
    result = (id)objc_msgSend(result, "dataUsingEncoding:allowLossyConversion:", 4, 1);
    if (result)
    {
      v4 = result;
      result = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/"));
      if (result)
      {
        v5 = result;
        v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WebKit"));
        if (v6
          || (result = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/WebKit.framework")), (v6 = result) != 0))
        {
          result = (id)objc_msgSend(v6, "classNamed:", CFSTR("WebResource"));
          if (result)
          {
            v7 = (objc_class *)result;
            result = (id)objc_msgSend(v6, "classNamed:", CFSTR("WebArchive"));
            if (result)
            {
              v8 = (objc_class *)result;
              v9 = objc_msgSend([v7 alloc], "initWithData:URL:MIMEType:textEncodingName:frameName:", v4, v5, CFSTR("text/html"), CFSTR("utf-8"), 0);
              if (!v9)
                return self->webArchiveData;
              v10 = (void *)v9;
              Count = CFArrayGetCount(self->imageNodes);
              v12 = Count;
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
              v91 = Count;
              if (!Count)
                goto LABEL_129;
              allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
              theString = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
              v14 = 8 * Count;
              v15 = (const void **)malloc_type_malloc(v14, 0x2004093837F09uLL);
              v105.location = 0;
              v105.length = Count;
              CFArrayGetValues(self->imageNodes, v105, v15);
              v16 = 0;
              v17 = 0;
              v18 = 0;
              do
              {
                for (i = v15[v16]; i; i = (_QWORD *)i[1])
                {
                  if (*(_DWORD *)i == 517)
                    break;
                }
                if (i == v17)
                {
                  i = v17;
                }
                else
                {
                  if (v17)
                    CGPDFNodeLoadPaths((_DWORD **)&v15[v18], v16 - v18);
                  v18 = v16;
                }
                ++v16;
                v17 = i;
              }
              while (v16 != v12);
              v93 = v13;
              v94 = v7;
              v89 = v8;
              v90 = v10;
              CGPDFNodeLoadPaths((_DWORD **)&v15[v18], v91 - v18);
              v20 = 0;
              while (1)
              {
                v21 = (uint64_t)v15[v20 / 8];
                if (v21)
                {
                  v22 = *(_DWORD *)v21;
                  if (*(_DWORD *)v21 == 513 || v22 == 258)
                  {
                    Image = (unint64_t *)CGPDFNodeCreateImage((uint64_t)v15[v20 / 8]);
                    goto LABEL_91;
                  }
                  if (v22 == 257)
                    break;
                }
LABEL_114:
                v20 += 8;
                if (v14 == v20)
                {
                  CGPDFNodePurgePaths((uint64_t *)v15, v91);
                  free(v15);
                  CFRelease(theString);
                  v8 = v89;
                  v10 = v90;
                  v13 = v93;
LABEL_129:
                  v87 = (void *)objc_msgSend([v8 alloc], "initWithMainResource:subresources:subframeArchives:", v10, v13, 0);
                  if (v87)
                  {
                    v88 = v87;
                    self->webArchiveData = (NSData *)(id)objc_msgSend(v87, "data");

                  }
                  return self->webArchiveData;
                }
              }
              v23 = *(CGPDFStream **)(v21 + 120);
              v24 = CPPDFCreateMaskingImageFromStream(v23);
              v25 = 0;
              valuePtr = 0.0;
              if (!v24)
                v25 = (CGFloat *)CPPDFCreateMaskingColorsFromStream((uint64_t)v23, &valuePtr);
              v100 = 0;
              PageRotation = CGPDFNodeGetPageRotation(v21);
              x = *(double *)(v21 + 64);
              width = *(double *)(v21 + 80);
              y = *(double *)(v21 + 72);
              height = *(double *)(v21 + 88);
              v29 = *(double *)(v21 + 136);
              v30 = *(double *)(v21 + 144);
              v31 = *(double *)(v21 + 152);
              v32 = *(double *)(v21 + 160);
              *(_OWORD *)values = *(_OWORD *)(v21 + 168);
              v33 = v29 * v32 - v30 * v31;
              if (v24)
                v34 = 0;
              else
                v34 = v25 == 0;
              if (v34
                && PageRotation == 0.0
                && ((v35 = fabs(v30), v36 = fabs(v31), v33 > 0.0) ? (v37 = v35 > 1.0) : (v37 = 1),
                    !v37 ? (v38 = v36 > 1.0) : (v38 = 1),
                    !v38))
              {
                v39 = vabdd_f64(v32, height);
                v40 = vabdd_f64(v29, width) > 1.0 || v39 > 1.0;
                if (!v40
                  && *(double *)(v21 + 184) == 1.0
                  && !*(_QWORD *)(v21 + 192)
                  && CGPDFNodeHasRectClips(v21))
                {
                  Image = *(unint64_t **)(v21 + 128);
                  if (Image)
                  {
                    CFRetain(*(CFTypeRef *)(v21 + 128));
LABEL_91:
                    v70 = 0;
                    goto LABEL_92;
                  }
                  if (!v23)
                  {
                    Image = 0;
                    goto LABEL_91;
                  }
                  LODWORD(transform.a) = 0;
                  v70 = CGPDFStreamCopyData(v23, (CGPDFDataFormat *)&transform);
                  if (!v70)
                    goto LABEL_126;
                  if (LODWORD(transform.a))
                  {
                    if (LODWORD(transform.a) == 2)
                    {
                      CFStringReplaceAll(theString, CFSTR("image/jp2"));
                      goto LABEL_126;
                    }
                    if (LODWORD(transform.a) == 1)
                    {
                      CFStringReplaceAll(theString, CFSTR("image/jpeg"));
                      if (CPPDFCreateJPEGImageFromImageStream((uint64_t)v23, v70, 0, &v100))
                      {
                        CFRelease(v70);
                        Image = 0;
                        v70 = v100;
                        goto LABEL_92;
                      }
LABEL_126:
                      Image = 0;
LABEL_92:
                      if (!Image)
                        goto LABEL_107;
                      Mutable = CFDataCreateMutable(allocator, 0);
                      if (Mutable)
                      {
                        v72 = Mutable;
                        if (CGPDFNodeCreateImageData_predicate != -1)
                          dispatch_once(&CGPDFNodeCreateImageData_predicate, &__block_literal_global_20576);
                        ImageData_f = CGPDFNodeCreateImageData_f(v72, CFSTR("public.png"), 1, 0);
                        if (ImageData_f)
                        {
                          v74 = (const void *)ImageData_f;
                          v75 = *(double *)(v21 + 80) * *(double *)(v21 + 88);
                          v76 = (double)Image[5] * (double)Image[6];
                          v77 = v75 * 256.0;
                          v78 = v76 / v75;
                          if (v76 >= v77)
                            v78 = 256.0;
                          valuePtr = sqrt(v78) * 72.0;
                          v79 = CFNumberCreate(allocator, kCFNumberCGFloatType, &valuePtr);
                          *(_OWORD *)&transform.a = xmmword_1E16626F0;
                          values[0] = v79;
                          values[1] = v79;
                          v80 = CFDictionaryCreate(allocator, (const void **)&transform, (const void **)values, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                          CFRelease(v79);
                          if (CGPDFNodeCreateImageData_predicate_29 != -1)
                            dispatch_once(&CGPDFNodeCreateImageData_predicate_29, &__block_literal_global_31_20578);
                          CGPDFNodeCreateImageData_f_28(v74, Image, v80);
                          CFRelease(v80);
                          if (CGPDFNodeCreateImageData_predicate_34 != -1)
                            dispatch_once(&CGPDFNodeCreateImageData_predicate_34, &__block_literal_global_36_20579);
                          CGPDFNodeCreateImageData_f_33(v74);
                          CFRelease(v74);
                          CFStringReplaceAll(theString, CFSTR("image/png"));
                          goto LABEL_106;
                        }
                        CFRelease(v72);
                      }
                      v72 = v70;
LABEL_106:
                      CFRelease(Image);
                      v70 = v72;
LABEL_107:
                      if (v70)
                      {
                        ImageName = CGPDFNodeCreateImageName(v21);
                        if (ImageName)
                        {
                          v82 = ImageName;
                          v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", CFStringGetLength(ImageName) + 1);
                          objc_msgSend(v83, "appendString:", CFSTR("/"));
                          objc_msgSend(v83, "appendString:", v82);
                          v84 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v83);
                          if (v84)
                          {
                            v85 = objc_msgSend([v94 alloc], "initWithData:URL:MIMEType:textEncodingName:frameName:", v70, v84, theString, 0, 0);
                            if (v85)
                            {
                              v86 = (void *)v85;
                              objc_msgSend(v93, "addObject:", v85);

                            }
                          }

                          CFRelease(v82);
                        }
                        CFRelease(v70);
                      }
                      goto LABEL_114;
                    }
                    Image = 0;
                  }
                  else
                  {
                    Image = (unint64_t *)CPPDFCreateImageFromRawData((uint64_t)v23, v70, 0, 0);
                  }
                  CFRelease(v70);
                  goto LABEL_91;
                }
                Image = (unint64_t *)CGPDFNodeCreateImage(v21);
              }
              else
              {
                v42 = CGPDFNodeCreateImage(v21);
                Image = (unint64_t *)v42;
                if (v25)
                {
                  if (v42)
                  {
                    ColorSpace = CGImageGetColorSpace(v42);
                    v44 = ColorSpace ? *(_QWORD *)(*((_QWORD *)ColorSpace + 3) + 40) : 0;
                    if (v44 == *(_QWORD *)&valuePtr)
                    {
                      v45 = CGImageCreateWithMaskingColors((CGImageRef)Image, v25);
                      CFRelease(Image);
                      Image = (unint64_t *)v45;
                    }
                  }
                  free(v25);
                }
                if (v24)
                {
                  if (Image)
                  {
                    v46 = CPImageCreateWithMask((CGImage *)Image, (uint64_t)v24);
                    CFRelease(Image);
                    Image = (unint64_t *)v46;
                  }
                  CFRelease(v24);
                }
              }
              if (Image)
              {
                v47 = fabs(v33);
                v48 = (double)Image[5] * (double)Image[6];
                v49 = v47 * 256.0;
                v50 = v48 / v47;
                if (v48 >= v49)
                  v51 = 256.0;
                else
                  v51 = v50;
                if (PageRotation != 0.0)
                {
                  v52 = __sincos_stret(PageRotation);
                  v99.a = v52.__cosval;
                  v99.b = v52.__sinval;
                  v99.c = -v52.__sinval;
                  v99.d = v52.__cosval;
                  v99.tx = 0.0;
                  v99.ty = 0.0;
                  v106.origin.x = x;
                  v106.origin.y = y;
                  v106.size.width = width;
                  v106.size.height = height;
                  v107 = CGRectApplyAffineTransform(v106, &v99);
                  x = v107.origin.x;
                  y = v107.origin.y;
                  width = v107.size.width;
                  height = v107.size.height;
                }
                v53 = sqrt(v51);
                v54 = vcvtpd_u64_f64(v53 * width);
                v92 = v53;
                v55 = vcvtpd_u64_f64(v53 * height);
                v56 = CGImageGetColorSpace((CGImageRef)Image);
                if (v56 && ((v57 = *((_QWORD *)v56 + 3), *(_BYTE *)(v57 + 13)) || *(_BYTE *)(v57 + 14)))
                {
                  v58 = CGColorSpaceCreateWithName(CFSTR("kCGColorSpaceExtendedSRGB"));
                  v59 = CGBitmapContextCreateWithData(0, v54, v55, 0x10uLL, 0, v58, 0x1101u, 0, 0);
                }
                else
                {
                  v58 = CGColorSpaceCreateWithName(CFSTR("kCGColorSpaceSRGB"));
                  v59 = CGBitmapContextCreateWithData(0, v54, v55, 8uLL, 4 * v54, v58, 1u, 0, 0);
                }
                v60 = (uint64_t)v59;
                if (v59)
                {
                  v108.size.width = (double)v54;
                  v108.size.height = (double)v55;
                  v108.origin.x = 0.0;
                  v108.origin.y = 0.0;
                  CGContextClearRect(v59, v108);
                  if (*(_DWORD *)(v60 + 16) == 1129601108)
                  {
                    v67 = *(_QWORD *)(v60 + 96);
                    v68 = vmulq_n_f64(*(float64x2_t *)(v67 + 40), v92);
                    *(float64x2_t *)(v67 + 24) = vmulq_n_f64(*(float64x2_t *)(v67 + 24), v92);
                    *(float64x2_t *)(v67 + 40) = v68;
                  }
                  else
                  {
                    handle_invalid_context((char)"CGContextScaleCTM", v60, v61, v62, v63, v64, v65, v66);
                  }
                  if (*(_DWORD *)(v60 + 16) == 1129601108)
                    *(float64x2_t *)(*(_QWORD *)(v60 + 96) + 56) = vmlsq_lane_f64(vmlsq_lane_f64(*(float64x2_t *)(*(_QWORD *)(v60 + 96) + 56), *(float64x2_t *)(*(_QWORD *)(v60 + 96) + 24), x, 0), *(float64x2_t *)(*(_QWORD *)(v60 + 96) + 40), y, 0);
                  else
                    handle_invalid_context((char)"CGContextTranslateCTM", v60, v61, v62, v63, v64, v65, v66);
                  if (PageRotation != 0.0)
                    CGContextRotateCTM((CGContextRef)v60, PageRotation);
                  CGPDFNodeApplyClipToContext(v21, (CGContextRef)v60);
                  transform.a = v29;
                  transform.b = v30;
                  transform.c = v31;
                  transform.d = v32;
                  *(_OWORD *)&transform.tx = *(_OWORD *)values;
                  CGContextConcatCTM((CGContextRef)v60, &transform);
                  CGContextSetAlpha((CGContextRef)v60, *(CGFloat *)(v21 + 184));
                  v69 = *(CGColor **)(v21 + 192);
                  if (v69)
                    CGContextSetFillColorWithColor((CGContextRef)v60, v69);
                  v109.origin.x = 0.0;
                  v109.origin.y = 0.0;
                  v109.size.width = 1.0;
                  v109.size.height = 1.0;
                  CGContextDrawImage((CGContextRef)v60, v109, (CGImageRef)Image);
                  CFRelease(Image);
                  Image = (unint64_t *)CGBitmapContextCreateImage((CGContextRef)v60);
                  CFRelease((CFTypeRef)v60);
                }
                CGColorSpaceRelease(v58);
              }
              goto LABEL_91;
            }
          }
        }
      }
    }
  }
  return result;
}

@end
