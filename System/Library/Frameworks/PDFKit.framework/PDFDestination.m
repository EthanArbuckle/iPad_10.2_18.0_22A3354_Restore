@implementation PDFDestination

- (PDFDestination)init
{
  PDFDestination *v2;
  PDFDestination *v3;
  PDFDestination *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDFDestination;
  v2 = -[PDFDestination init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PDFDestination commonInit](v2, "commonInit");
    v4 = v3;
  }

  return v3;
}

- (PDFDestination)initWithPage:(PDFPage *)page atPoint:(CGPoint)point
{
  CGFloat y;
  CGFloat x;
  PDFPage *v7;
  PDFDestination *v8;
  PDFDestination *v9;
  void *v10;
  PDFDestination *v11;

  y = point.y;
  x = point.x;
  v7 = page;
  if (v7)
  {
    v8 = -[PDFDestination init](self, "init");
    if (!v8)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v9 = v8;
    -[PDFPage document](v7, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_private->document, v10);

    objc_storeWeak((id *)&v9->_private->page, v7);
    v9->_private->type = 0;
    v9->_private->left = x;
    v9->_private->top = y;
    self = v9;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

LABEL_7:
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id WeakRetained;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v4[1] + 32) = self->_private->type;
  *(double *)(v4[1] + 40) = self->_private->left;
  *(double *)(v4[1] + 48) = self->_private->top;
  *(double *)(v4[1] + 56) = self->_private->right;
  *(double *)(v4[1] + 64) = self->_private->bottom;
  *(double *)(v4[1] + 72) = self->_private->zoom;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_storeWeak((id *)(v4[1] + 16), WeakRetained);

  return v4;
}

- (void)dealloc
{
  PDFDestinationPrivate *v3;
  objc_super v4;

  v3 = self->_private;
  if (v3 && v3->array)
    CGPDFArrayRelease();
  v4.receiver = self;
  v4.super_class = (Class)PDFDestination;
  -[PDFDestination dealloc](&v4, sel_dealloc);
}

- (id)document
{
  return objc_loadWeakRetained((id *)&self->_private->document);
}

- (PDFPage)page
{
  void *WeakRetained;
  id v4;
  CGPDFArray *array;
  void *v6;
  void *v7;
  unint64_t v9;
  unint64_t v10;
  CGPDFDictionaryRef value;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  if (!WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)&self->_private->document);
    if (!v4)
      return (PDFPage *)0;
    array = self->_private->array;

    if (!array)
      return (PDFPage *)0;
    -[PDFDestination document](self, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    value = 0;
    if (CGPDFArrayGetDictionary(self->_private->array, 0, &value))
    {
      -[PDFDestination document](self, "document");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "findPageWithCGPDFDictionaryPageRef:", value);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
      WeakRetained = 0;
      if (CGPDFArrayGetInteger(self->_private->array, 0, (CGPDFInteger *)&v10))
      {
        v9 = v10;
        if (v9 >= objc_msgSend(v6, "pageCount"))
        {
          WeakRetained = 0;
        }
        else
        {
          objc_msgSend(v6, "pageAtIndex:", v10);
          WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    objc_storeWeak((id *)&self->_private->page, WeakRetained);

  }
  return (PDFPage *)WeakRetained;
}

- (id)pageIfExists
{
  return objc_loadWeakRetained((id *)&self->_private->page);
}

- (CGPoint)point
{
  double top;
  double left;
  PDFDestinationPrivate *v5;
  CGPoint result;

  if (-[PDFDestination type](self, "type"))
  {
    top = 3.40282347e38;
    left = 3.40282347e38;
  }
  else
  {
    v5 = self->_private;
    left = v5->left;
    top = v5->top;
  }
  result.y = top;
  result.x = left;
  return result;
}

- (CGFloat)zoom
{
  if (-[PDFDestination type](self, "type"))
    return 3.40282347e38;
  else
    return self->_private->zoom;
}

- (void)setZoom:(CGFloat)zoom
{
  if (!-[PDFDestination type](self, "type"))
    self->_private->zoom = zoom;
}

- (NSComparisonResult)compare:(PDFDestination *)destination
{
  PDFDestination *v4;
  void *v5;
  void *v6;
  void *v7;
  NSComparisonResult v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double MaxY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v4 = destination;
  -[PDFDestination page](self, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFDestination page](v4, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = NSOrderedAscending;
  v9 = 0;
  if (v6)
  {
    if (v5)
    {
      objc_msgSend(v5, "document");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "document");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v9)
      {
        v10 = objc_msgSend(v9, "indexForPage:", v5);
        v11 = objc_msgSend(v9, "indexForPage:", v6);
        if (v10 <= v11)
        {
          if (v10 >= v11)
          {
            -[PDFDestination point](self, "point");
            MaxY = v12;
            -[PDFDestination point](v4, "point");
            v15 = v14;
            if (MaxY == 3.40282347e38)
            {
              objc_msgSend(v5, "boundsForBox:", 0);
              MaxY = PDFRectGetMaxY(v16, v17, v18, v19);
            }
            if (v15 == 3.40282347e38)
            {
              objc_msgSend(v6, "boundsForBox:", 0);
              v15 = PDFRectGetMaxY(v20, v21, v22, v23);
            }
            if (MaxY > v15)
              v8 = NSOrderedAscending;
            else
              v8 = (unint64_t)(MaxY < v15);
          }
          else
          {
            v8 = NSOrderedAscending;
          }
        }
        else
        {
          v8 = NSOrderedDescending;
        }
        v7 = v9;
      }
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[PDFDestination page](self, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PDFDestination document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexForPage:", v3);

    v6 = v5;
  }
  else
  {
    v6 = 0xFFFFFFFFLL;
  }
  v7 = 0;
  switch(-[PDFDestination type](self, "type"))
  {
    case 0xFFFFFFFF:
      goto LABEL_15;
    case 0u:
      if (self->_private->left == 3.40282347e38)
      {
        v8 = CFSTR("N/A");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&self->_private->left);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (self->_private->top == 3.40282347e38)
      {
        v10 = CFSTR("N/A");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&self->_private->top);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (self->_private->zoom == 3.40282347e38)
      {
        v11 = CFSTR("N/A");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&self->_private->zoom);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XYZ, page = %d, left = %@, top = %@, zoom = %@\n"), v6, v8, v10, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 1u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fit, page = %d\n"), v6, v12, v13, v14, v15);
      goto LABEL_14;
    case 2u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FitH, page = %d, t = %.1f\n"), v6, *(_QWORD *)&self->_private->top, v13, v14, v15);
      goto LABEL_14;
    case 3u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FitV, page = %d, l = %.1f\n"), v6, *(_QWORD *)&self->_private->left, v13, v14, v15);
      goto LABEL_14;
    case 4u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FitR, page = %d, l = %.1f, b = %.1f, r = %.1f, t = %.1f\n"), v6, *(_QWORD *)&self->_private->left, *(_QWORD *)&self->_private->bottom, *(_QWORD *)&self->_private->right, *(_QWORD *)&self->_private->top);
      goto LABEL_14;
    case 5u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FitB, page = %d\n"), v6, v12, v13, v14, v15);
      goto LABEL_14;
    case 6u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FitBH, page = %d, t = %.1f\n"), v6, *(_QWORD *)&self->_private->top, v13, v14, v15);
      goto LABEL_14;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FitBV, page = %d, l = %.1f\n"), v6, *(_QWORD *)&self->_private->left, v13, v14, v15);
LABEL_14:
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      return v7;
  }
}

- (PDFDestination)initWithDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4
{
  id v6;
  PDFDestination *v7;
  PDFDestination *v8;
  CGPDFObject *Destination;
  char *v10;
  PDFDestination *v11;
  PDFDestinationPrivate *v12;
  PDFDestinationPrivate *v13;
  int v14;
  CGPDFArray *v15;
  CGPDFReal *p_top;
  PDFDestinationPrivate *v17;
  int v18;
  size_t v19;
  CGPDFDictionaryRef dict;
  char *__s1;
  CGPDFArrayRef array;
  CGPDFObjectRef value;

  v6 = a4;
  array = 0;
  value = 0;
  __s1 = 0;
  v7 = -[PDFDestination init](self, "init");
  v8 = v7;
  if (!v7)
    goto LABEL_20;
  objc_storeWeak((id *)&v7->_private->document, v6);
  if (!CGPDFDictionaryGetObject(a3, "Dest", &value) && !CGPDFDictionaryGetObject(a3, "D", &value))
    goto LABEL_20;
  if (CGPDFObjectGetValue(value, kCGPDFObjectTypeString, 0) || CGPDFObjectGetValue(value, kCGPDFObjectTypeName, 0))
  {
    dict = 0;
    objc_msgSend(v6, "documentRef");
    Destination = (CGPDFObject *)CGPDFDocumentGetDestination();
    value = Destination;
    if (!Destination)
    {
LABEL_34:
      v11 = v8;
      goto LABEL_35;
    }
    if (CGPDFObjectGetValue(Destination, kCGPDFObjectTypeDictionary, &dict)
      && !CGPDFDictionaryGetObject(dict, "D", &value))
    {
      goto LABEL_20;
    }
  }
  if (!CGPDFObjectGetValue(value, kCGPDFObjectTypeArray, &array))
    goto LABEL_20;
  v8->_private->array = (CGPDFArray *)CGPDFArrayRetain();
  if (!CGPDFArrayGetName(array, 1uLL, (const char **)&__s1))
    goto LABEL_20;
  v10 = __s1;
  if (!strcmp(__s1, "XYZ"))
  {
    v8->_private->type = 0;
    if (get_number(array, 2uLL, &v8->_private->left))
    {
      if (get_number(array, 3uLL, &v8->_private->top))
      {
        if (get_number(array, 4uLL, &v8->_private->zoom))
        {
          v12 = v8->_private;
          if (v12->zoom == 0.0)
            v12->zoom = 3.40282347e38;
        }
      }
    }
    goto LABEL_34;
  }
  if (!strcmp(v10, "Fit"))
  {
    v13 = v8->_private;
    v14 = 1;
LABEL_27:
    v13->type = v14;
    goto LABEL_34;
  }
  if (!strcmp(v10, "FitH"))
  {
    v8->_private->type = 2;
LABEL_29:
    v15 = array;
    p_top = &v8->_private->top;
LABEL_32:
    v19 = 2;
LABEL_33:
    get_number(v15, v19, p_top);
    goto LABEL_34;
  }
  if (!strcmp(v10, "FitV"))
  {
    v17 = v8->_private;
    v18 = 3;
LABEL_31:
    v17->type = v18;
    v15 = array;
    p_top = &v8->_private->left;
    goto LABEL_32;
  }
  if (!strcmp(v10, "FitR"))
  {
    v8->_private->type = 4;
    if (!get_number(array, 2uLL, &v8->_private->left)
      || !get_number(array, 3uLL, &v8->_private->bottom)
      || !get_number(array, 4uLL, &v8->_private->right))
    {
      goto LABEL_34;
    }
    v15 = array;
    p_top = &v8->_private->top;
    v19 = 5;
    goto LABEL_33;
  }
  if (!strcmp(v10, "FitB"))
  {
    v13 = v8->_private;
    v14 = 5;
    goto LABEL_27;
  }
  if (!strcmp(v10, "FitBH"))
  {
    v8->_private->type = 6;
    goto LABEL_29;
  }
  if (!strcmp(v10, "FitBV"))
  {
    v17 = v8->_private;
    v18 = 7;
    goto LABEL_31;
  }
  NSLog(CFSTR("Unknown PDF destination type: %s"), v10);
LABEL_20:
  v11 = 0;
LABEL_35:

  return v11;
}

- (void)commonInit
{
  PDFDestinationPrivate *v3;
  PDFDestinationPrivate *v4;

  v3 = objc_alloc_init(PDFDestinationPrivate);
  v4 = self->_private;
  self->_private = v3;

  objc_storeWeak((id *)&self->_private->document, 0);
  objc_storeWeak((id *)&self->_private->page, 0);
  self->_private->type = -1;
  self->_private->left = 3.40282347e38;
  self->_private->top = 3.40282347e38;
  self->_private->right = 3.40282347e38;
  self->_private->bottom = 3.40282347e38;
  self->_private->zoom = 3.40282347e38;
}

- (int)type
{
  return self->_private->type;
}

- (__CFArray)createArrayRef
{
  void *v3;
  void *v4;
  void *v5;
  PDFDestinationPrivate *v6;
  const __CFString *v7;
  double *p_left;
  double left;
  CFNumberRef v10;
  const __CFString *v11;
  const __CFString *v12;
  double *v13;
  double v14;
  CFNumberRef v15;
  CFIndex v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  CFNumberRef v21;
  __CFArray *v22;
  PDFDestinationPrivate *v23;
  double *p_top;
  double top;
  CFNumberRef v26;
  PDFDestinationPrivate *v27;
  double *p_bottom;
  double bottom;
  CFNumberRef v30;
  PDFDestinationPrivate *v31;
  double *p_zoom;
  double zoom;
  CFNumberRef v34;
  PDFDestinationPrivate *v35;
  double *p_right;
  double right;
  CFNumberRef v38;
  PDFDestinationPrivate *v39;
  double *v40;
  double v41;
  CFNumberRef v42;
  CFTypeID v43;
  CFTypeID v44;
  CFTypeID v45;
  CFTypeID v46;
  void *values;
  CFTypeRef cf[2];
  CFTypeRef v50[2];
  CFTypeRef v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v51 = 0;
  *(_OWORD *)cf = 0u;
  *(_OWORD *)v50 = 0u;
  -[PDFDestination page](self, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  values = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("/#%ld"), objc_msgSend(v5, "indexForPage:", v3) + 1);

  if (values)
  {
    v6 = self->_private;
    v7 = CFSTR("/Fit");
    switch(v6->type)
    {
      case 0:
        cf[0] = CFSTR("/XYZ");
        left = v6->left;
        p_left = &v6->left;
        if (left == 3.40282347e38)
          v10 = (CFNumberRef)*MEMORY[0x24BDBD430];
        else
          v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCGFloatType, p_left);
        cf[1] = v10;
        if (!v10)
          goto LABEL_47;
        v23 = self->_private;
        top = v23->top;
        p_top = &v23->top;
        v26 = top == 3.40282347e38
            ? (CFNumberRef)*MEMORY[0x24BDBD430]
            : CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCGFloatType, p_top);
        v50[0] = v26;
        if (!v26)
          goto LABEL_47;
        v31 = self->_private;
        zoom = v31->zoom;
        p_zoom = &v31->zoom;
        v34 = zoom == 3.40282347e38
            ? (CFNumberRef)*MEMORY[0x24BDBD430]
            : CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCGFloatType, p_zoom);
        v50[1] = v34;
        if (!v34)
          goto LABEL_47;
        v16 = 5;
        goto LABEL_20;
      case 1:
        goto LABEL_10;
      case 2:
        v11 = CFSTR("/FitH");
        goto LABEL_12;
      case 3:
        v12 = CFSTR("/FitV");
        goto LABEL_14;
      case 4:
        cf[0] = CFSTR("/FitR");
        v14 = v6->left;
        v13 = &v6->left;
        if (v14 == 3.40282347e38)
          v15 = (CFNumberRef)*MEMORY[0x24BDBD430];
        else
          v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCGFloatType, v13);
        cf[1] = v15;
        if (!v15)
          goto LABEL_47;
        v27 = self->_private;
        bottom = v27->bottom;
        p_bottom = &v27->bottom;
        v30 = bottom == 3.40282347e38
            ? (CFNumberRef)*MEMORY[0x24BDBD430]
            : CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCGFloatType, p_bottom);
        v50[0] = v30;
        if (!v30)
          goto LABEL_47;
        v35 = self->_private;
        right = v35->right;
        p_right = &v35->right;
        v38 = right == 3.40282347e38
            ? (CFNumberRef)*MEMORY[0x24BDBD430]
            : CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCGFloatType, p_right);
        v50[1] = v38;
        if (!v38)
          goto LABEL_47;
        v39 = self->_private;
        v41 = v39->top;
        v40 = &v39->top;
        v42 = v41 == 3.40282347e38
            ? (CFNumberRef)*MEMORY[0x24BDBD430]
            : CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCGFloatType, v40);
        v51 = v42;
        if (!v42)
          goto LABEL_47;
        v16 = 6;
        goto LABEL_20;
      case 5:
        v7 = CFSTR("/FitB");
LABEL_10:
        cf[0] = v7;
        v16 = 2;
        goto LABEL_20;
      case 6:
        v11 = CFSTR("/FitBH");
LABEL_12:
        cf[0] = v11;
        v18 = v6->top;
        v17 = &v6->top;
        v19 = v18;
        goto LABEL_15;
      case 7:
        v12 = CFSTR("/FitBV");
LABEL_14:
        cf[0] = v12;
        v20 = v6->left;
        v17 = &v6->left;
        v19 = v20;
LABEL_15:
        if (v19 == 3.40282347e38)
          v21 = (CFNumberRef)*MEMORY[0x24BDBD430];
        else
          v21 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCGFloatType, v17);
        cf[1] = v21;
        if (!v21)
          goto LABEL_47;
        v16 = 3;
LABEL_20:
        v22 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&values, v16, MEMORY[0x24BDBD690]);
        break;
      default:
        goto LABEL_47;
    }
  }
  else
  {
LABEL_47:
    v22 = 0;
  }
  if (cf[1])
  {
    v43 = CFGetTypeID(cf[1]);
    if (v43 != CFNullGetTypeID())
      CFRelease(cf[1]);
  }
  if (v50[0])
  {
    v44 = CFGetTypeID(v50[0]);
    if (v44 != CFNullGetTypeID())
      CFRelease(v50[0]);
  }
  if (v50[1])
  {
    v45 = CFGetTypeID(v50[1]);
    if (v45 != CFNullGetTypeID())
      CFRelease(v50[1]);
  }
  if (v51)
  {
    v46 = CFGetTypeID(v51);
    if (v46 != CFNullGetTypeID())
      CFRelease(v51);
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
