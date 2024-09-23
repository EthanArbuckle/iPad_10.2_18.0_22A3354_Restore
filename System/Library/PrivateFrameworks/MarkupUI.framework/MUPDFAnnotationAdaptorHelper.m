@implementation MUPDFAnnotationAdaptorHelper

+ (void)migrateAppearanceStreamFromCGPDFAnnotationDict:(CGPDFDictionary *)a3 toAKAnnotation:(id)a4 compensatingForPageRotation:(unint64_t)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  char isKindOfClass;
  uint64_t v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  __int128 v26;
  MUCGPDFFormWrapper *v27;
  MUCGPDFFormWrapper *v28;
  _QWORD v29[4];
  MUCGPDFFormWrapper *v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform t2;
  CGAffineTransform value;
  CGAffineTransform v36;
  CGAffineTransform info;
  CGPDFDictionaryRef v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v6 = a4;
  v7 = _MUReadAppearanceStreams_cachedValue;
  if (_MUReadAppearanceStreams_cachedValue == -2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("MUReadAppearanceStreams"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _MUReadAppearanceStreams_cachedValue = objc_msgSend(v10, "BOOLForKey:", CFSTR("MUReadAppearanceStreams"));

      if (_MUReadAppearanceStreams_cachedValue)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      NSLog(CFSTR("%@=%@"), CFSTR("MUReadAppearanceStreams"), v11);
    }
    else
    {
      _MUReadAppearanceStreams_cachedValue = 1;
    }

    v7 = _MUReadAppearanceStreams_cachedValue;
  }
  if (v7)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        v36.a = 0.0;
        value.a = 0.0;
        CGPDFDictionaryGetDictionary(a3, "AP", (CGPDFDictionaryRef *)&value);
        if (*(_QWORD *)&value.a)
        {
          CGPDFDictionaryGetObject(*(CGPDFDictionaryRef *)&value.a, "N", (CGPDFObjectRef *)&v36);
          if (*(_QWORD *)&v36.a)
          {
            t2.a = 0.0;
            CGPDFObjectGetValue(*(CGPDFObjectRef *)&v36.a, kCGPDFObjectTypeStream, &t2);
            if (*(_QWORD *)&t2.a
              || (v38 = 0, CGPDFObjectGetValue(*(CGPDFObjectRef *)&v36.a, kCGPDFObjectTypeDictionary, &v38), v38)
              && (*(_OWORD *)&info.a = (unint64_t)v38,
                  CGPDFDictionaryApplyFunction(v38, (CGPDFDictionaryApplierFunction)_getStreams, &info),
                  *(_QWORD *)&info.b))
            {
              v13 = CGPDFFormCreate();
              if (v13)
              {
                memset(&info, 0, sizeof(info));
                CGPDFFormGetMatrix();
                CGPDFFormGetBBox();
                v36 = info;
                v40 = CGRectApplyAffineTransform(v39, &v36);
                x = v40.origin.x;
                y = v40.origin.y;
                width = v40.size.width;
                height = v40.size.height;
                MidX = CGRectGetMidX(v40);
                v41.origin.x = x;
                v41.origin.y = y;
                v41.size.width = width;
                v41.size.height = height;
                MidY = CGRectGetMidY(v41);
                v42.origin.x = x;
                v42.origin.y = y;
                v42.size.width = width;
                v42.size.height = height;
                if (CGRectGetWidth(v42) <= 0.0
                  || (v43.origin.x = x,
                      v43.origin.y = y,
                      v43.size.width = width,
                      v43.size.height = height,
                      CGRectGetHeight(v43) <= 0.0))
                {
                  objc_msgSend(v6, "setAppearanceOverride:", &__block_literal_global_1);
                }
                else
                {
                  objc_msgSend(v6, "drawingBounds");
                  v20 = v44.origin.x;
                  v21 = v44.origin.y;
                  v22 = v44.size.width;
                  v23 = v44.size.height;
                  v24 = CGRectGetMidX(v44);
                  v45.origin.x = v20;
                  v45.origin.y = v21;
                  v45.size.width = v22;
                  v45.size.height = v23;
                  v25 = CGRectGetMidY(v45);
                  v26 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
                  *(_OWORD *)&v36.a = *MEMORY[0x24BDBD8B8];
                  *(_OWORD *)&v36.c = v26;
                  *(_OWORD *)&v36.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
                  *(_OWORD *)&value.c = v26;
                  *(_OWORD *)&value.tx = *(_OWORD *)&v36.tx;
                  t2 = info;
                  *(_OWORD *)&value.a = *(_OWORD *)&v36.a;
                  CGAffineTransformConcat(&v36, &value, &t2);
                  CGAffineTransformMakeTranslation(&v33, -MidX, -MidY);
                  t2 = v36;
                  CGAffineTransformConcat(&value, &t2, &v33);
                  v36 = value;
                  CGAffineTransformMakeTranslation(&v32, v24, v25);
                  t2 = v36;
                  CGAffineTransformConcat(&value, &t2, &v32);
                  v36 = value;
                  v27 = -[MUCGPDFFormWrapper initWithForm:]([MUCGPDFFormWrapper alloc], "initWithForm:", v13);
                  v29[1] = 3221225472;
                  v31 = v36;
                  v29[0] = MEMORY[0x24BDAC760];
                  v29[2] = __122__MUPDFAnnotationAdaptorHelper_migrateAppearanceStreamFromCGPDFAnnotationDict_toAKAnnotation_compensatingForPageRotation___block_invoke_2;
                  v29[3] = &unk_24E5D4738;
                  v30 = v27;
                  v28 = v27;
                  objc_msgSend(v6, "setAppearanceOverride:", v29);

                }
              }
            }
          }
        }
      }
    }
  }

}

void __122__MUPDFAnnotationAdaptorHelper_migrateAppearanceStreamFromCGPDFAnnotationDict_toAKAnnotation_compensatingForPageRotation___block_invoke_2(uint64_t a1, CGContextRef c)
{
  __int128 v4;
  CGAffineTransform v5;

  CGContextSaveGState(c);
  v4 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v5.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v5.c = v4;
  *(_OWORD *)&v5.tx = *(_OWORD *)(a1 + 72);
  CGContextConcatCTM(c, &v5);
  objc_msgSend(*(id *)(a1 + 32), "pdfForm");
  CGPDFFormGetStream();
  CGPDFFormGetResources();
  if (CGPDFDrawingContextCreateWithStream())
  {
    CGPDFDrawingContextDraw();
    CGPDFDrawingContextRelease();
  }
  CGContextRestoreGState(c);
}

+ (void)migrateAKStrokedAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5
{
  id v7;
  void *v8;
  char *__s1;
  CGPDFReal v10;
  CGPDFDictionaryRef value;

  v7 = a3;
  value = 0;
  if (CGPDFDictionaryGetDictionary(a4, "BS", &value))
  {
    __s1 = 0;
    v10 = 0.0;
    if (CGPDFDictionaryGetNumber(value, "W", &v10))
      objc_msgSend(v7, "setStrokeWidth:", v10);
    if (CGPDFDictionaryGetName(value, "S", (const char **)&__s1))
      objc_msgSend(v7, "setDashed:", strcmp(__s1, "D") == 0);
  }
  v10 = 0.0;
  if (CGPDFDictionaryGetArray(a4, "C", (CGPDFArrayRef *)&v10))
  {
    objc_msgSend(a1, "_colorFromPDFArray:", *(_QWORD *)&v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStrokeColor:", v8);

  }
}

+ (void)migrateAKFilledAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5
{
  id v7;
  void *v8;
  CGPDFArrayRef value;

  v7 = a3;
  value = 0;
  if (CGPDFDictionaryGetArray(a4, "IC", &value))
  {
    objc_msgSend(a1, "_colorFromPDFArray:", value);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFillColor:", v8);

  }
}

+ (void)migrateAKRectangularShapeAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5
{
  id v5;

  v5 = a3;
  if (CGPDFDictionaryGetRect())
    objc_msgSend(v5, "setRectangle:", 0.0, 0.0, 0.0, 0.0);

}

+ (void)migrateAKTextAnnotationPropertiesTo:(id)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4 ofPDFPage:(CGPDFPage *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGPDFStringRef string;
  CGPDFDictionaryRef dict;
  char *value;

  v8 = a3;
  value = 0;
  if (CGPDFDictionaryGetName(a4, "Subtype", (const char **)&value))
  {
    v9 = v8;
    if (!strcmp(value, "Widget"))
    {
      string = 0;
      dict = 0;
      if (!CGPDFDictionaryGetDictionary(a4, "Parent", &dict))
        dict = 0;
      if (CGPDFDictionaryGetString(a4, "V", &string) || dict && CGPDFDictionaryGetString(dict, "V", &string))
        v10 = (void *)CGPDFStringCopyTextString(string);
      else
        v10 = 0;
      if (CGPDFDictionaryGetString(a4, "DV", &string) || dict && CGPDFDictionaryGetString(dict, "DV", &string))
      {
        v11 = (void *)CGPDFStringCopyTextString(string);
        if (v11)
          objc_msgSend(v9, "setCustomPlaceholderText:", v11);
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "readDefaultAppearanceStringFromPDFDictionary:ofPage:toDictionary:", a4, a5, v13);
      objc_msgSend(a1, "readQuaddingFromPDFDictionary:toDictionary:", a4, v13);
      if (objc_msgSend(v10, "length"))
      {
        v14 = (void *)objc_msgSend(MEMORY[0x24BE03AB8], "newTextStorageOriginalFontSavvyWithString:attributes:", v10, v13);
        objc_msgSend(v9, "setAnnotationText:", v14);

      }
      else if (!objc_msgSend(v11, "length"))
      {
        objc_msgSend(v9, "setShouldUsePlaceholderText:", 0);
      }
      objc_msgSend(v9, "setTypingAttributes:", v13);

    }
    else
    {
      objc_msgSend(a1, "getTextStringForKey:fromAnnotationDictionary:", "Contents", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "length"))
      {
        objc_msgSend(v9, "setShouldUsePlaceholderText:", 0);
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!strcmp(value, "FreeText"))
      {
        objc_msgSend(a1, "readDefaultAppearanceStringFromPDFDictionary:ofPage:toDictionary:", a4, a5, v11);
        objc_msgSend(a1, "readQuaddingFromPDFDictionary:toDictionary:", a4, v11);
      }
      v12 = (void *)objc_msgSend(MEMORY[0x24BE03AB8], "newTextStorageOriginalFontSavvyWithString:attributes:", v10, v11);
      objc_msgSend(v9, "setAnnotationText:", v12);

    }
    goto LABEL_28;
  }
  NSLog(CFSTR("%s: Failed to find \"Subtype\" from annotation dictionary"), "+[MUPDFAnnotationAdaptorHelper migrateAKTextAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:]");
LABEL_29:

}

+ (id)getRGBColorForKey:(const char *)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4
{
  _BOOL4 Array;
  void *v6;
  CGPDFArrayRef value;

  value = 0;
  Array = CGPDFDictionaryGetArray(a4, a3, &value);
  v6 = 0;
  if (Array)
  {
    objc_msgSend(a1, "_colorFromPDFArray:", value);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)getTextStringForKey:(const char *)a3 fromAnnotationDictionary:(CGPDFDictionary *)a4
{
  _BOOL4 String;
  __CFString *v5;
  CGPDFStringRef value;

  value = 0;
  String = CGPDFDictionaryGetString(a4, a3, &value);
  v5 = 0;
  if (String)
  {
    v5 = (__CFString *)CGPDFStringCopyTextString(value);
    if (!v5)
      v5 = 0;
  }
  return v5;
}

+ (id)getFullFieldNameFromAnnotationDictionary:(CGPDFDictionary *)a3
{
  __CFString *MutableCopy;
  const __CFString *v5;
  const __CFString *v6;
  const __CFAllocator *v7;
  CGPDFDictionary *v8;
  uint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  CGPDFDictionaryRef dict;
  CGPDFStringRef value;

  dict = 0;
  value = 0;
  MutableCopy = 0;
  if (CGPDFDictionaryGetString(a3, "T", &value))
  {
    v5 = CGPDFStringCopyTextString(value);
    if (v5)
    {
      v6 = v5;
      MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v5);
      CFRelease(v6);
    }
    else
    {
      MutableCopy = 0;
    }
  }
  if (!CGPDFDictionaryGetDictionary(a3, "Parent", &dict))
    goto LABEL_23;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = dict;
  v9 = 1;
  while (1)
  {
    v10 = v9;
    if (!CGPDFDictionaryGetString(v8, "T", &value))
    {
      dict = 0;
      goto LABEL_23;
    }
    if (MutableCopy)
    {
      CFStringInsert(MutableCopy, 0, CFSTR("."));
      v11 = CGPDFStringCopyTextString(value);
      if (!v11)
        goto LABEL_14;
      v12 = v11;
      CFStringInsert(MutableCopy, 0, v11);
      goto LABEL_13;
    }
    v13 = CGPDFStringCopyTextString(value);
    if (v13)
    {
      v12 = v13;
      MutableCopy = CFStringCreateMutableCopy(v7, 0, v13);
LABEL_13:
      CFRelease(v12);
      goto LABEL_14;
    }
    MutableCopy = 0;
LABEL_14:
    if (!CGPDFDictionaryGetDictionary(v8, "Parent", &dict))
      break;
    v8 = dict;
    if (dict)
    {
      v9 = v10 + 1;
      if (v10 < 0x63)
        continue;
    }
    goto LABEL_21;
  }
  dict = 0;
LABEL_21:
  if (v10 >= 0x63)
    NSLog(CFSTR("getFullFieldNameFromDictionary nested to deep - aborted."));
LABEL_23:
  if (!MutableCopy)
    return 0;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", MutableCopy);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(MutableCopy);
  return v14;
}

+ (void)readDefaultAppearanceStringFromPDFDictionary:(CGPDFDictionary *)a3 ofPage:(CGPDFPage *)a4 toDictionary:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  CGPDFStringRef value;

  v8 = a5;
  value = 0;
  if (CGPDFDictionaryGetString(a3, "DA", &value))
  {
    objc_msgSend(a1, "_getFontFromAppearanceString:ofPDFPage:", value, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x24BDF65F8]);
    objc_msgSend(a1, "_getColorFromAppearanceString:", value);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v8, "setObject:forKey:", v10, *MEMORY[0x24BDF6600]);

  }
}

+ (void)readQuaddingFromPDFDictionary:(CGPDFDictionary *)a3 toDictionary:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 Integer;
  uint64_t v10;
  CGPDFInteger value;

  v5 = *MEMORY[0x24BDF6628];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  value = 0;
  Integer = CGPDFDictionaryGetInteger(a3, "Q", &value);
  v10 = 0;
  if (Integer)
  {
    if (value == 1)
      v10 = 1;
    else
      v10 = 2 * (value == 2);
  }
  objc_msgSend(v8, "setAlignment:", v10);
  objc_msgSend(v6, "setObject:forKey:", v8, v5);

}

+ (void)addBoundsOfAnnotation:(id)a3 forPage:(CGPDFPage *)a4 toDictionary:(id)a5
{
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 IsInfinite;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  CGRect v23;
  CGRect BoxRect;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v22[4] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(a3, "drawingBounds");
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  IsInfinite = CGRectIsInfinite(v23);
  if (a4 && IsInfinite)
  {
    BoxRect = CGPDFPageGetBoxRect(a4, kCGPDFMediaBox);
    x = BoxRect.origin.x;
    y = BoxRect.origin.y;
    width = BoxRect.size.width;
    height = BoxRect.size.height;
  }
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MinY = CGRectGetMinY(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxX = CGRectGetMaxX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MaxY = CGRectGetMaxY(v28);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", MinX);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", MinY);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", MaxX);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", MaxY);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKey:", v21, CFSTR("/Rect"));
}

+ (void)addModificationDateOfAnnotation:(id)a3 toDictionary:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a4;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPDFUtilities createPDFDateString:](MUPDFUtilities, "createPDFDateString:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("/M"));
}

+ (void)addFlagsOfAnnotation:(id)a3 toDictionary:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a4;
  objc_msgSend(v4, "numberWithUnsignedInteger:", 4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("/F"));

}

+ (void)addContentsStringOfAnnotation:(id)a3 toDictionary:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE03AB8], "actualOrPlaceholderTextOfAnnotation:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_24E5D4C60;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "childAnnotation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "contents");
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (__CFString *)v10;
      }
    }

  }
  objc_msgSend(a1, "addString:toDictionary:forKey:", v8, v6, CFSTR("/Contents"));

}

+ (void)addTextOfAnnotation:(id)a3 toDictionary:(id)a4 forKey:(id)a5 canUsePlaceholder:(BOOL)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  if (a6)
  {
    v10 = (void *)MEMORY[0x24BE03AB8];
    v11 = a5;
    v12 = a4;
    objc_msgSend(v10, "actualOrPlaceholderTextOfAnnotation:", a3);
  }
  else
  {
    v13 = a5;
    v14 = a4;
    objc_msgSend(a3, "annotationText");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "string");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "addString:toDictionary:forKey:", v16, a4, a5);
}

+ (void)addString:(id)a3 toDictionary:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v10, "length"))
  {
    v9 = (__CFString *)objc_msgSend(v10, "mutableCopy");
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("//"), 2, 0, 1);
  }
  else
  {
    v9 = &stru_24E5D4C60;
  }
  objc_msgSend(v7, "setValue:forKey:", v9, v8);

}

+ (void)addBorderStyleOfAnnotation:(id)a3 toDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "conformsToAKStrokedAnnotationProtocol"))
  {
    v7 = v5;
    objc_msgSend(v7, "strokeWidth");
    v9 = v8;
    if (v8 != 1.0 || objc_msgSend(v7, "isDashed"))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "strokeWidth");
      if (v11 != 1.0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("/W"));

      }
      if (objc_msgSend(v7, "isDashed"))
      {
        objc_msgSend(v10, "setValue:forKey:", CFSTR("/D"), CFSTR("/S"));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9 + 7.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v13;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9 * 3.0 + 4.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[1] = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKey:", v15, CFSTR("/D"));

      }
      objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("/BS"));

    }
  }

}

+ (void)addRGBColor:(id)a3 forKey:(id)a4 toDictionary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v16 = 0.0;
  v17 = 0.0;
  v14 = 1.0;
  v15 = 0.0;
  objc_msgSend(a3, "colorUsingSRGBColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getRed:green:blue:alpha:", &v17, &v16, &v15, &v14);
  if (v14 >= 0.5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v13, v7);

  }
}

+ (void)addAppearanceStreamOfAnnotation:(id)a3 forPage:(CGPDFPage *)a4 toDictionary:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGContext *v17;
  _BOOL4 IsInfinite;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];
  CGRect v22;

  v21[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = _MUWriteAppearanceStreams_cachedValue;
  if (_MUWriteAppearanceStreams_cachedValue == -2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("MUWriteAppearanceStreams"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _MUWriteAppearanceStreams_cachedValue = objc_msgSend(v12, "BOOLForKey:", CFSTR("MUWriteAppearanceStreams"));

      if (_MUWriteAppearanceStreams_cachedValue)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      NSLog(CFSTR("%@=%@"), CFSTR("MUWriteAppearanceStreams"), v13);
    }
    else
    {
      _MUWriteAppearanceStreams_cachedValue = 1;
    }

    v9 = _MUWriteAppearanceStreams_cachedValue;
  }
  if (v9)
  {
    v14 = CGDisplayListCreate();
    if (v14)
    {
      v15 = v14;
      v16 = CGDisplayListContextCreate();
      if (v16)
      {
        v17 = (CGContext *)v16;
        objc_msgSend(v7, "drawingBounds");
        IsInfinite = CGRectIsInfinite(v22);
        if (a4 && IsInfinite)
          CGPDFPageGetBoxRect(a4, kCGPDFMediaBox);
        CGDisplayListSetBoundingBox();
        objc_msgSend(MEMORY[0x24BE03A30], "renderAnnotation:inContext:", v7, v17);
        v20 = CFSTR("/N");
        v21[0] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v19, CFSTR("/AP"));

        CGContextRelease(v17);
      }
      CGDisplayListRelease();
    }
  }

}

+ (void)addDefaultAppearanceStreamOfAnnotation:(id)a3 toDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  __int128 v31;
  double v32[3];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v31 = xmmword_220028A48;
  *(_OWORD *)v32 = unk_220028A58;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:
    v8 = 0;
    v10 = 0;
    v11 = 0;
    if (!v26[5])
      goto LABEL_25;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BE03AB8], "actualOrPlaceholderTextOfAnnotation:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    goto LABEL_7;
  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __84__MUPDFAnnotationAdaptorHelper_addDefaultAppearanceStreamOfAnnotation_toDictionary___block_invoke;
  v18[3] = &unk_24E5D4760;
  v18[4] = &v25;
  v18[5] = &v19;
  objc_msgSend(MEMORY[0x24BE03AB8], "enumerateFontAttributesOfAttributedString:usingBlock:", v7, v18);
  objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF6600], 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26[5])
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_25;
  }
  if (v8)
  {
    objc_msgSend(v8, "colorUsingSRGBColorSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "getRed:green:blue:alpha:", &v31, (char *)&v31 + 8, v32, &v32[1]);
    v8 = v9;
  }
LABEL_8:
  v12 = *(double *)&v31 * 1000.0;
  v13 = round(*(double *)&v31 * 1000.0);
  if (*(double *)&v31 == *((double *)&v31 + 1) && *(double *)&v31 == v32[0])
  {
    if (v13 == v12)
    {
      if (round(*(double *)&v31 * 100.0) == *(double *)&v31 * 100.0)
      {
        v14 = round(*(double *)&v31);
        if (round(*(double *)&v31 * 10.0) == *(double *)&v31 * 10.0)
          v15 = CFSTR("%.0f g");
        else
          v15 = CFSTR("%.1f g");
      }
      else
      {
        v14 = round(*(double *)&v31);
        v15 = CFSTR("%.2f g");
      }
    }
    else
    {
      v14 = round(*(double *)&v31);
      v15 = CFSTR("%.3f g");
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v15, *(_QWORD *)&v14);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13 == v12
      && round(*((double *)&v31 + 1) * 1000.0) == *((double *)&v31 + 1) * 1000.0
      && round(v32[0] * 1000.0) == v32[0] * 1000.0)
    {
      if (round(*(double *)&v31 * 100.0) == *(double *)&v31 * 100.0
        && round(*((double *)&v31 + 1) * 100.0) == *((double *)&v31 + 1) * 100.0
        && round(v32[0] * 100.0) == v32[0] * 100.0)
      {
        if (round(*(double *)&v31 * 10.0) == *(double *)&v31 * 10.0
          && round(*((double *)&v31 + 1) * 10.0) == *((double *)&v31 + 1) * 10.0
          && round(v32[0] * 10.0) == v32[0] * 10.0)
        {
          v16 = CFSTR("%.0f %.0f %.0f rg");
        }
        else
        {
          v16 = CFSTR("%.1f %.1f %.1f rg");
        }
      }
      else
      {
        v16 = CFSTR("%.2f %.2f %.2f rg");
      }
    }
    else
    {
      v16 = CFSTR("%.3f %.3f %.3f rg");
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v16, v31, *(_QWORD *)&v32[0]);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v17;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("//%@ %@ Tf %@"), v26[5], v20[5], v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("/DA"));
LABEL_25:

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

}

void __84__MUPDFAnnotationAdaptorHelper_addDefaultAppearanceStreamOfAnnotation_toDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v7 = a2;
  if (v7)
  {
    v16 = v7;
    objc_msgSend(v7, "fontName");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v16, "pointSize");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%.0f"), round(v12));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v7 = v16;
    if (a5)
      *a5 = 1;
  }

}

+ (void)addQuaddingOfAnnotation:(id)a3 toDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (objc_msgSend(v11, "conformsToAKTextAnnotationProtocol"))
  {
    objc_msgSend(MEMORY[0x24BE03AB8], "actualOrPlaceholderTextOfAnnotation:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF6628], 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "alignment");
      if (v8)
      {
        if (v8 == 1)
          v9 = 1;
        else
          v9 = 2 * (v8 == 2);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("/Q"));

      }
    }

  }
}

+ (id)newAKAnnotationFromCGPDFAnnotation:(CGPDFAnnotation *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  CGPDFDictionary *CGPDFDictionary;
  void *v11;
  CFStringRef v12;
  CFStringRef v13;
  void *v14;
  CGPDFDictionary *v15;
  CGPDFStringRef string;
  CGPDFDictionaryRef value;

  v5 = _MUReadEmbeddedAKAnnotation_cachedValue;
  if (_MUReadEmbeddedAKAnnotation_cachedValue == -2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("MUReadEmbeddedAKAnnotation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _MUReadEmbeddedAKAnnotation_cachedValue = objc_msgSend(v8, "BOOLForKey:", CFSTR("MUReadEmbeddedAKAnnotation"));

      if (_MUReadEmbeddedAKAnnotation_cachedValue)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      NSLog(CFSTR("%@=%@"), CFSTR("MUReadEmbeddedAKAnnotation"), v9);
    }
    else
    {
      _MUReadEmbeddedAKAnnotation_cachedValue = 1;
    }

    v5 = _MUReadEmbeddedAKAnnotation_cachedValue;
  }
  if (v5)
  {
    CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
    if (CGPDFDictionary)
    {
      v11 = (void *)MEMORY[0x2207DC428]();
      value = 0;
      if (CGPDFDictionaryGetDictionary(CGPDFDictionary, "AAPL:AKExtras", &value)
        && (string = 0, CGPDFDictionaryGetString(value, "AAPL:AKAnnotationObject", &string))
        && (v12 = CGPDFStringCopyTextString(string)) != 0)
      {
        v13 = v12;
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v12, 0);
        objc_msgSend(MEMORY[0x24BE03A10], "annotationWithData:", v14);
        CGPDFDictionary = (CGPDFDictionary *)objc_claimAutoreleasedReturnValue();
        CFRelease(v13);

        objc_autoreleasePoolPop(v11);
        if (CGPDFDictionary
          && (objc_msgSend(a1, "_shouldUseAKAnnotation:toRepresentCGPDFAnnotation:", CGPDFDictionary, a3) & 1) == 0)
        {
          goto LABEL_16;
        }
      }
      else
      {
        objc_autoreleasePoolPop(v11);
        CGPDFDictionary = 0;
      }
      CGPDFDictionary = CGPDFDictionary;
      v15 = CGPDFDictionary;
      goto LABEL_20;
    }
LABEL_16:
    v15 = 0;
LABEL_20:

    return v15;
  }
  return 0;
}

+ (void)addAKAnnotation:(id)a3 toAnnotationDictionary:(__CFDictionary *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CFDictionaryRef Copy;
  CFDictionaryRef v16;
  id v17;

  v17 = a3;
  v5 = _MUWriteEmbeddedAKAnnotation_cachedValue;
  if (_MUWriteEmbeddedAKAnnotation_cachedValue == -2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("MUWriteEmbeddedAKAnnotation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _MUWriteEmbeddedAKAnnotation_cachedValue = objc_msgSend(v8, "BOOLForKey:", CFSTR("MUWriteEmbeddedAKAnnotation"));

      if (_MUWriteEmbeddedAKAnnotation_cachedValue)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      NSLog(CFSTR("%@=%@"), CFSTR("MUWriteEmbeddedAKAnnotation"), v9);
    }
    else
    {
      _MUWriteEmbeddedAKAnnotation_cachedValue = 0;
    }

    v5 = _MUWriteEmbeddedAKAnnotation_cachedValue;
  }
  if (v5)
  {
    v10 = (void *)MEMORY[0x2207DC428]();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("/AAPL:AKAnnotationObject"));
      Copy = CFDictionaryCreateCopy(0, a4);
      if (Copy)
      {
        v16 = Copy;
        objc_msgSend(v11, "setObject:forKey:", Copy, CFSTR("/AAPL:AKPDFAnnotationDictionary"));

      }
      CFDictionarySetValue(a4, CFSTR("/AAPL:AKExtras"), v11);

    }
    objc_autoreleasePoolPop(v10);
  }

}

+ (id)_colorFromPDFArray:(CGPDFArray *)a3
{
  size_t Count;
  CGColorSpace *v5;
  CGPDFReal *v6;
  CGPDFArray *v7;
  size_t v8;
  CGColorRef v9;
  void *v10;
  __int128 v12;
  CGPDFReal v13[3];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = xmmword_220028A68;
  *(_OWORD *)v13 = unk_220028A78;
  Count = CGPDFArrayGetCount(a3);
  switch(Count)
  {
    case 4uLL:
      v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF280]);
      CGPDFArrayGetNumber(a3, 0, (CGPDFReal *)&v12);
      CGPDFArrayGetNumber(a3, 1uLL, (CGPDFReal *)&v12 + 1);
      CGPDFArrayGetNumber(a3, 2uLL, v13);
      v6 = &v13[1];
      v7 = a3;
      v8 = 3;
      break;
    case 3uLL:
      v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
      CGPDFArrayGetNumber(a3, 0, (CGPDFReal *)&v12);
      CGPDFArrayGetNumber(a3, 1uLL, (CGPDFReal *)&v12 + 1);
      v6 = v13;
      v7 = a3;
      v8 = 2;
      break;
    case 1uLL:
      v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF290]);
      v6 = (CGPDFReal *)&v12;
      v7 = a3;
      v8 = 0;
      break;
    default:
      return 0;
  }
  CGPDFArrayGetNumber(v7, v8, v6);
  v9 = CGColorCreate(v5, (const CGFloat *)&v12);
  CGColorSpaceRelease(v5);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v9, v12, *(_OWORD *)v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v9);
    return v10;
  }
  return 0;
}

+ (id)_getFontFromAppearanceString:(CGPDFString *)a3 ofPDFPage:(CGPDFPage *)a4
{
  __CFString *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  CGPDFDocument *Document;
  CGPDFDictionary *Catalog;
  void *v13;
  CGFont *Font;
  CFStringRef v15;
  CFStringRef v16;
  char Flags;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  int v24;
  CGPDFDictionaryRef v26;
  CGPDFDictionaryRef dict;
  CGPDFDictionaryRef value;
  CGPDFObjectRef v29;

  v6 = (__CFString *)CGPDFStringCopyTextString(a3);
  if (!v6)
  {
    v10 = 0;
    v7 = 0;
    v21 = (void *)MEMORY[0x24BDF6A70];
LABEL_35:
    v9 = 12.0;
    goto LABEL_36;
  }
  objc_msgSend(a1, "_tokenizeAppearanceString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pointSizeFromAppearanceTokens:", v7);
  v9 = v8;
  objc_msgSend(a1, "_fontNameFromAppearanceTokens:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_34;
  value = 0;
  v29 = 0;
  dict = 0;
  Document = CGPDFPageGetDocument(a4);
  Catalog = CGPDFDocumentGetCatalog(Document);
  if (Catalog
    && CGPDFDictionaryGetDictionary(Catalog, "AcroForm", &value)
    && CGPDFDictionaryGetDictionary(value, "DR", &dict))
  {
    v26 = 0;
    v13 = 0;
    if (!CGPDFDictionaryGetDictionary(dict, "Font", &v26))
      goto LABEL_22;
    if (CGPDFDictionaryGetObject(v26, (const char *)objc_msgSend(objc_retainAutorelease(v10), "cStringUsingEncoding:", 1), &v29)&& CGPDFFontCreateWithObject())
    {
      Font = (CGFont *)CGPDFFontGetFont();
      v15 = CGFontCopyPostScriptName(Font);
      if (v15)
      {
        v16 = v15;
        objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", v15, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          CGPDFFontGetFontDescriptor();
          Flags = CGPDFFontDescriptorGetFlags();
          v18 = CFSTR("Courier");
          if ((Flags & 1) == 0)
            v18 = CFSTR("Times");
          v19 = CFSTR("Helvetica");
          if ((Flags & 1) != 0)
            v19 = CFSTR("Monaco");
          if ((Flags & 2) != 0)
            v20 = v18;
          else
            v20 = v19;
          objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", v20, v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        CFRelease(v16);
      }
      else
      {
        v13 = 0;
      }
      CGPDFFontRelease();
      if (v13)
        goto LABEL_33;
      goto LABEL_22;
    }
  }
  v13 = 0;
LABEL_22:
  if (v9 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", v10, v9);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
LABEL_37:
      v13 = (void *)v22;
      goto LABEL_38;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("Helv")))
    {
      v21 = (void *)MEMORY[0x24BDF6A70];
      v23 = CFSTR("Helvetica");
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("HeBo")))
    {
      v21 = (void *)MEMORY[0x24BDF6A70];
      v23 = CFSTR("Helvetica-Bold");
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Cour")))
    {
      v21 = (void *)MEMORY[0x24BDF6A70];
      v23 = CFSTR("Courier");
    }
    else
    {
      v24 = objc_msgSend(v10, "isEqualToString:", CFSTR("ZaDb"));
      v21 = (void *)MEMORY[0x24BDF6A70];
      if (!v24)
        goto LABEL_36;
      v23 = CFSTR("ZapfDingbats");
    }
    objc_msgSend(v21, "fontWithName:size:", v23, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_33:
  if (!v13)
  {
LABEL_34:
    v21 = (void *)MEMORY[0x24BDF6A70];
    if (v9 <= 0.0)
      goto LABEL_35;
LABEL_36:
    objc_msgSend(v21, "fontWithName:size:", CFSTR("Helvetica"), v9);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
LABEL_38:

  return v13;
}

+ (id)_getColorFromAppearanceString:(CGPDFString *)a3
{
  __CFString *v4;
  void *v5;
  void *v6;

  v4 = (__CFString *)CGPDFStringCopyTextString(a3);
  if (v4)
  {
    objc_msgSend(a1, "_tokenizeAppearanceString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_colorFromAppearanceTokens:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }

  return v6;
}

+ (id)_tokenizeAppearanceString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
  v5 = objc_msgSend(v3, "length");
  v6 = 0;
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      if (objc_msgSend(v3, "characterAtIndex:", i) == 32)
      {
        if (i == v6)
        {
          ++v6;
        }
        else
        {
          objc_msgSend(v3, "substringWithRange:", v6, i - v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v8);

          v6 = i + 1;
        }
      }
    }
  }
  objc_msgSend(v3, "substringWithRange:", v6, v5 - v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  return v4;
}

+ (double)_pointSizeFromAppearanceTokens:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  float v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = 0.0;
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    while (1)
    {
      if (v7)
      {
        objc_msgSend(v3, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Tf"));

        if (v9)
          break;
      }
      if (v6 == ++v7)
        goto LABEL_8;
    }
    objc_msgSend(v3, "objectAtIndex:", v7 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v5 = v11;

  }
LABEL_8:

  return v5;
}

+ (id)_fontNameFromAppearanceTokens:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = 0;
    while (1)
    {
      if (v5 >= 2)
      {
        objc_msgSend(v3, "objectAtIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Tf"));

        if (v7)
        {
          objc_msgSend(v3, "objectAtIndex:", v5 - 2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "length");

          if (v9)
            break;
        }
      }
      if (v4 == (void *)++v5)
      {
        v4 = 0;
        goto LABEL_9;
      }
    }
    objc_msgSend(v3, "objectAtIndex:", v5 - 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringWithRange:", 1, v9 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v4;
}

+ (id)_colorFromAppearanceTokens:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  float v21;
  void *v22;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (!v4)
  {
LABEL_9:
    v22 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = 0;
  while (v6 < 3)
  {
    if (v6)
      goto LABEL_7;
LABEL_8:
    if (v5 == ++v6)
      goto LABEL_9;
  }
  objc_msgSend(v3, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("rg"));

  if (v8)
  {
    v13 = (void *)MEMORY[0x24BDF6950];
    objc_msgSend(v3, "objectAtIndex:", v6 - 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;
    objc_msgSend(v3, "objectAtIndex:", v6 - 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;
    objc_msgSend(v3, "objectAtIndex:", v6 - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    objc_msgSend(v13, "akColorWithSRGBRed:green:blue:alpha:", v16, v19, v21, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_7:
  objc_msgSend(v3, "objectAtIndex:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("g"));

  if (!v10)
    goto LABEL_8;
  v11 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(v3, "objectAtIndex:", v6 - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  objc_msgSend(v11, "akColorWithWhite:alpha:", v12, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  return v22;
}

+ (BOOL)_shouldUseAKAnnotation:(id)a3 toRepresentCGPDFAnnotation:(CGPDFAnnotation *)a4
{
  id v4;
  char IsPristine;
  CGPDFDictionary *CGPDFDictionary;
  CGPDFDictionary *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  float64x2_t v12;
  double v13;
  double v14;
  double v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  void *v21;
  CFStringRef v22;
  float64_t v23;
  float64_t v24;
  float64_t v25;
  CGPDFStringRef string;
  float64x2_t v27;
  float64x2_t v28;
  CGPDFDictionaryRef v29;
  CGPDFDictionaryRef value;

  v4 = a3;
  if (!CGPDFAnnotationIsVersioned())
  {
    CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
    if (CGPDFDictionary)
    {
      v7 = CGPDFDictionary;
      value = 0;
      if (!CGPDFDictionaryGetDictionary(CGPDFDictionary, "AAPL:AKExtras", &value))
      {
LABEL_11:
        IsPristine = 0;
        goto LABEL_15;
      }
      v29 = 0;
      if (CGPDFDictionaryGetDictionary(value, "AAPL:AKPDFAnnotationDictionary", &v29))
      {
        objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 1282, 512);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        _dictionaryForPDFDictionary(v29, v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 1282, 512);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _dictionaryForPDFDictionary(v7, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("AAPL:AKExtras"));
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("AP"));
        -[__CFString removeObjectForKey:](v9, "removeObjectForKey:", CFSTR("AP"));
        IsPristine = objc_msgSend(v11, "isEqualToDictionary:", v9);

LABEL_7:
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = *(float64x2_t *)(MEMORY[0x24BDBF090] + 16);
        v27 = *(float64x2_t *)MEMORY[0x24BDBF090];
        v28 = v12;
        if (CGPDFDictionaryGetRect())
        {
          objc_msgSend(v4, "drawingBounds");
          v25 = v13;
          objc_msgSend(v4, "drawingBounds");
          v24 = v14;
          objc_msgSend(v4, "drawingBounds");
          v23 = v15;
          objc_msgSend(v4, "drawingBounds");
          v16.f64[0] = v25;
          v16.f64[1] = v24;
          v17.f64[1] = v23;
          v18 = vabdq_f64(v28, v17);
          v19 = (float64x2_t)vdupq_n_s64(0x3F747AE147AE147BuLL);
          if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgeq_f64(v19, vabdq_f64(v27, v16)), (int32x4_t)vcgeq_f64(v19, v18))))) & 1) != 0)goto LABEL_11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if ((objc_opt_respondsToSelector() & 1) == 0
                || (objc_msgSend(v4, "annotationText"),
                    v21 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v21, "string"),
                    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
                    v21,
                    !v8))
              {
                v8 = &stru_24E5D4C60;
              }
              string = 0;
              v9 = &stru_24E5D4C60;
              if (CGPDFDictionaryGetString(v7, "Contents", &string))
              {
                v22 = CGPDFStringCopyTextString(string);
                if (v22)
                  v9 = (__CFString *)v22;
              }
              IsPristine = -[__CFString isEqualToString:](v8, "isEqualToString:", v9);
              goto LABEL_7;
            }
          }
        }
      }
    }
    IsPristine = 1;
    goto LABEL_15;
  }
  IsPristine = CGPDFAnnotationIsPristine();
LABEL_15:

  return IsPristine;
}

@end
