@implementation MUPDFUtilities

+ (id)createPDFDateString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDD1500];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyyMMddHHmm"));
  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v6);

  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("GMT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v7);

  objc_msgSend(v5, "stringFromDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("D:%@Z00'00'"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)createDictionaryFromPDFDictionary:(CGPDFDictionary *)a3
{
  id v4;
  CFSetCallBacks v6;

  v6 = *(CFSetCallBacks *)byte_24E5D45A8;
  seenObjects = (uint64_t)CFSetCreateMutable(0, 0, &v6);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  CGPDFDictionaryApplyFunction(a3, (CGPDFDictionaryApplierFunction)_dictionaryApplierFunction, v4);
  CFRelease((CFTypeRef)seenObjects);
  return v4;
}

+ (unint64_t)indexOfDictionary:(CGPDFDictionary *)a3 inArray:(CGPDFArray *)a4
{
  size_t Count;
  size_t v7;
  size_t v8;
  CGPDFDictionaryRef value;

  Count = CGPDFArrayGetCount(a4);
  if (!Count)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = Count;
  v8 = 0;
  while (1)
  {
    value = 0;
    if (CGPDFArrayGetDictionary(a4, v8, &value) && value == a3)
      break;
    if (v7 == ++v8)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

+ (unint64_t)normalizedRotationAngleOfPage:(CGPDFPage *)a3
{
  int v3;

  v3 = CGPDFPageGetRotationAngle(a3) % 360;
  if (v3 >= 0)
    return v3;
  else
    return v3 + 360;
}

+ (int64_t)exifOrientationOfPage:(CGPDFPage *)a3
{
  uint64_t v3;
  int64_t v4;

  v3 = objc_msgSend(a1, "normalizedRotationAngleOfPage:", a3);
  v4 = 1;
  if (v3 == 90)
    v4 = 6;
  if (v3 == 180)
    v4 = 3;
  if (v3 == 270)
    return 8;
  else
    return v4;
}

+ (CGAffineTransform)flattenRotationTransformForPage:(SEL)a3 outMediaBox:(CGPDFPage *)a4 outCropBox:(CGRect *)a5
{
  int RotationAngle;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  CGFloat v15;
  CGFloat v16;
  double v17;
  unsigned int v18;
  unsigned int v19;
  double v20;
  uint64_t v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  CGAffineTransform *result;
  double v29;
  CGRect BoxRect;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  RotationAngle = CGPDFPageGetRotationAngle(a4);
  BoxRect = CGPDFPageGetBoxRect(a4, kCGPDFMediaBox);
  x = BoxRect.origin.x;
  y = BoxRect.origin.y;
  width = BoxRect.size.width;
  height = BoxRect.size.height;
  v31 = CGPDFPageGetBoxRect(a4, kCGPDFCropBox);
  v15 = v31.size.width;
  v16 = v31.size.height;
  v17 = v31.origin.x - x;
  v18 = RotationAngle
      + 360
      * (((RotationAngle & ~(RotationAngle >> 31)) - (RotationAngle + (RotationAngle >> 31))) / 0x168
       + (RotationAngle >> 31));
  v19 = v18 - 360;
  if (v18 < 0x168)
    v19 = 0;
  v20 = v31.origin.y - y;
  v21 = v18 - 360 * ((v19 + 359) / 0x168);
  if ((int)v21 > 179)
  {
    if ((_DWORD)v21 == 180)
    {
      v36.origin.x = 0.0;
      v36.origin.y = 0.0;
      v36.size.width = width;
      v36.size.height = height;
      v26 = CGRectGetWidth(v36);
      v37.origin.x = v17;
      v37.origin.y = v20;
      v37.size.width = v15;
      v37.size.height = v16;
      v23 = v26 - (v17 + CGRectGetWidth(v37));
      v38.origin.x = 0.0;
      v38.origin.y = 0.0;
      v38.size.width = width;
      v38.size.height = height;
      v27 = CGRectGetHeight(v38);
      v39.origin.x = v23;
      v39.origin.y = v20;
      v39.size.width = v15;
      v39.size.height = v16;
      v20 = v27 - (v20 + CGRectGetHeight(v39));
      v22 = height;
      goto LABEL_14;
    }
    if ((_DWORD)v21 == 270)
    {
      v34.origin.x = 0.0;
      v34.origin.y = 0.0;
      v34.size.width = height;
      v34.size.height = width;
      v24 = CGRectGetWidth(v34);
      v35.origin.x = v17;
      v35.origin.y = v20;
      v35.size.width = v16;
      v35.size.height = v15;
      v22 = width;
      v23 = v24 - (v20 + CGRectGetWidth(v35));
      v20 = v17;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if ((_DWORD)v21)
  {
    if ((_DWORD)v21 == 90)
    {
      v32.origin.x = 0.0;
      v32.origin.y = 0.0;
      v32.size.width = height;
      v32.size.height = width;
      v29 = CGRectGetHeight(v32);
      v33.origin.x = v20;
      v33.origin.y = v20;
      v33.size.width = v16;
      v33.size.height = v15;
      v22 = width;
      v23 = v20;
      v20 = v29 - (v17 + CGRectGetHeight(v33));
LABEL_10:
      v25 = v16;
      v16 = v15;
      width = height;
      goto LABEL_15;
    }
LABEL_11:
    NSLog(CFSTR("%s: Unexpected page rotation (%d)"), "+[MUPDFUtilities flattenRotationTransformForPage:outMediaBox:outCropBox:]", v21);
  }
  v22 = height;
  v23 = v17;
LABEL_14:
  v25 = v15;
LABEL_15:
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v40.origin.x = v23;
  v40.origin.y = v20;
  v40.size.width = v25;
  v40.size.height = v16;
  result = CGPDFPageGetDrawingTransform(retstr, a4, kCGPDFCropBox, v40, 0, 1);
  if (a5)
  {
    a5->origin.x = 0.0;
    a5->origin.y = 0.0;
    a5->size.width = width;
    a5->size.height = v22;
  }
  if (a6)
  {
    a6->origin.x = v23;
    a6->origin.y = v20;
    a6->size.width = v25;
    a6->size.height = v16;
  }
  return result;
}

@end
