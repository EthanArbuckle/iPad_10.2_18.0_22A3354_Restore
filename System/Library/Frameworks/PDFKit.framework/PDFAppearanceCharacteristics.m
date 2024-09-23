@implementation PDFAppearanceCharacteristics

- (PDFAppearanceCharacteristics)init
{
  PDFAppearanceCharacteristics *v2;
  PDFAppearanceCharacteristicsPrivate *v3;
  PDFAppearanceCharacteristicsPrivate *v4;
  PDFAppearanceCharacteristicsPrivate *v5;
  UIColor *backgroundColor;
  PDFAppearanceCharacteristicsPrivate *v7;
  UIColor *borderColor;
  PDFAppearanceCharacteristicsPrivate *v9;
  NSString *caption;
  PDFAppearanceCharacteristicsPrivate *v11;
  NSString *rolloverCaption;
  PDFAppearanceCharacteristicsPrivate *v13;
  NSString *downCaption;
  PDFAppearanceCharacteristics *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PDFAppearanceCharacteristics;
  v2 = -[PDFAppearanceCharacteristics init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PDFAppearanceCharacteristicsPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    v5 = v2->_private;
    backgroundColor = v5->backgroundColor;
    v5->backgroundColor = 0;

    v7 = v2->_private;
    borderColor = v7->borderColor;
    v7->borderColor = 0;

    v2->_private->rotation = 0;
    v2->_private->controlType = -1;
    v9 = v2->_private;
    caption = v9->caption;
    v9->caption = 0;

    v11 = v2->_private;
    rolloverCaption = v11->rolloverCaption;
    v11->rolloverCaption = 0;

    v13 = v2->_private;
    downCaption = v13->downCaption;
    v13->downCaption = 0;

    v2->_private->icon = 0;
    v2->_private->scaleCircumstance = 0;
    v2->_private->scaleProportional = 1;
    v15 = v2;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PDFAppearanceCharacteristicsPrivate *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PDFAppearanceCharacteristicsPrivate *v23;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = objc_alloc_init(PDFAppearanceCharacteristicsPrivate);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[UIColor copyWithZone:](self->_private->backgroundColor, "copyWithZone:", a3);
    v9 = v5[1];
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = v8;

    v11 = -[UIColor copyWithZone:](self->_private->borderColor, "copyWithZone:", a3);
    v12 = v5[1];
    v13 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = v11;

    *(_QWORD *)(v5[1] + 24) = self->_private->rotation;
    *(_QWORD *)(v5[1] + 32) = self->_private->controlType;
    v14 = -[NSString copyWithZone:](self->_private->caption, "copyWithZone:", a3);
    v15 = v5[1];
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = -[NSString copyWithZone:](self->_private->rolloverCaption, "copyWithZone:", a3);
    v18 = v5[1];
    v19 = *(void **)(v18 + 48);
    *(_QWORD *)(v18 + 48) = v17;

    v20 = -[NSString copyWithZone:](self->_private->downCaption, "copyWithZone:", a3);
    v21 = v5[1];
    v22 = *(void **)(v21 + 56);
    *(_QWORD *)(v21 + 56) = v20;

    v23 = self->_private;
    if (v23->icon)
    {
      CGPDFFormGetStream();
      *(_QWORD *)(v5[1] + 64) = CGPDFFormCreate();
      v23 = self->_private;
    }
    *(_DWORD *)(v5[1] + 72) = v23->scaleCircumstance;
    *(_BYTE *)(v5[1] + 76) = self->_private->scaleProportional;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_private->icon)
    CGPDFFormRelease();
  v3.receiver = self;
  v3.super_class = (Class)PDFAppearanceCharacteristics;
  -[PDFAppearanceCharacteristics dealloc](&v3, sel_dealloc);
}

- (UIColor)backgroundColor
{
  return self->_private->backgroundColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  uint64_t v4;
  PDFAppearanceCharacteristicsPrivate *v5;
  UIColor *v6;

  v4 = -[UIColor copy](backgroundColor, "copy");
  v5 = self->_private;
  v6 = v5->backgroundColor;
  v5->backgroundColor = (UIColor *)v4;

}

- (UIColor)borderColor
{
  return self->_private->borderColor;
}

- (void)setBorderColor:(UIColor *)borderColor
{
  uint64_t v4;
  PDFAppearanceCharacteristicsPrivate *v5;
  UIColor *v6;

  v4 = -[UIColor copy](borderColor, "copy");
  v5 = self->_private;
  v6 = v5->borderColor;
  v5->borderColor = (UIColor *)v4;

}

- (NSInteger)rotation
{
  return self->_private->rotation;
}

- (void)setRotation:(NSInteger)rotation
{
  self->_private->rotation = rotation;
}

- (CGPDFForm)icon
{
  return self->_private->icon;
}

- (BOOL)scaleProportional
{
  return self->_private->scaleProportional;
}

- (PDFAppearanceCharacteristics)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forControlType:(int64_t)a4
{
  PDFAppearanceCharacteristics *v6;
  uint64_t v7;
  PDFAppearanceCharacteristicsPrivate *v8;
  UIColor *backgroundColor;
  uint64_t v10;
  PDFAppearanceCharacteristicsPrivate *v11;
  UIColor *borderColor;
  CFStringRef v13;
  PDFAppearanceCharacteristicsPrivate *v14;
  NSString *caption;
  CFStringRef v16;
  PDFAppearanceCharacteristicsPrivate *v17;
  NSString *rolloverCaption;
  CFStringRef v19;
  PDFAppearanceCharacteristicsPrivate *v20;
  NSString *downCaption;
  char *v22;
  int v23;
  PDFAppearanceCharacteristics *v24;
  char *__s1;
  CGPDFDictionaryRef v27;
  CGPDFStreamRef v28;
  CGPDFStringRef string;
  CGPDFArrayRef value;
  CGPDFInteger v31;

  value = 0;
  v31 = 0;
  v28 = 0;
  string = 0;
  __s1 = 0;
  v27 = 0;
  v6 = -[PDFAppearanceCharacteristics init](self, "init");
  if (v6)
  {
    if (CGPDFDictionaryGetArray(a3, "BG", &value))
    {
      PDFColorCreateFromCGPDFArray(value);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v6->_private;
      backgroundColor = v8->backgroundColor;
      v8->backgroundColor = (UIColor *)v7;

    }
    if (CGPDFDictionaryGetArray(a3, "BC", &value))
    {
      PDFColorCreateFromCGPDFArray(value);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v6->_private;
      borderColor = v11->borderColor;
      v11->borderColor = (UIColor *)v10;

    }
    if (CGPDFDictionaryGetInteger(a3, "R", &v31))
      v6->_private->rotation = v31;
    v6->_private->controlType = a4;
    if (v6->_private->controlType <= 2uLL && CGPDFDictionaryGetString(a3, "CA", &string))
    {
      v13 = CGPDFStringCopyTextString(string);
      v14 = v6->_private;
      caption = v14->caption;
      v14->caption = &v13->isa;

    }
    if (!v6->_private->controlType && CGPDFDictionaryGetString(a3, "RC", &string))
    {
      v16 = CGPDFStringCopyTextString(string);
      v17 = v6->_private;
      rolloverCaption = v17->rolloverCaption;
      v17->rolloverCaption = &v16->isa;

    }
    if (!v6->_private->controlType && CGPDFDictionaryGetString(a3, "AC", &string))
    {
      v19 = CGPDFStringCopyTextString(string);
      v20 = v6->_private;
      downCaption = v20->downCaption;
      v20->downCaption = &v19->isa;

    }
    if (!v6->_private->controlType && CGPDFDictionaryGetStream(a3, "I", &v28))
      v6->_private->icon = (CGPDFForm *)CGPDFFormCreate();
    if (v6->_private->controlType || !CGPDFDictionaryGetDictionary(a3, "IF", &v27))
      goto LABEL_33;
    if (CGPDFDictionaryGetName(a3, "SW", (const char **)&__s1))
    {
      v22 = __s1;
      if (!strcmp(__s1, "B"))
      {
        v23 = 1;
        goto LABEL_29;
      }
      if (!strcmp(v22, "S"))
      {
        v23 = 2;
        goto LABEL_29;
      }
      if (!strcmp(v22, "N"))
      {
        v23 = 3;
LABEL_29:
        v6->_private->scaleCircumstance = v23;
      }
    }
    if (CGPDFDictionaryGetName(a3, "S", (const char **)&__s1) && !strcmp(__s1, "A"))
      v6->_private->scaleProportional = 0;
LABEL_33:
    v24 = v6;
  }

  return v6;
}

- (__CFDictionary)createDictionaryRef
{
  const __CFAllocator *v3;
  __CFDictionary *Mutable;
  CFNumberRef v5;
  CFNumberRef v6;
  void *v7;
  PDFAppearanceCharacteristicsPrivate *v8;
  NSString *v9;
  PDFAppearanceCharacteristicsPrivate *v10;
  NSString *v11;
  int valuePtr;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    valuePtr = self->_private->rotation;
    if (valuePtr)
    {
      v5 = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
      if (v5)
      {
        v6 = v5;
        CFDictionarySetValue(Mutable, CFSTR("/R"), v5);
        CFRelease(v6);
      }
    }
    -[PDFAppearanceCharacteristics borderColor](self, "borderColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAppearanceCharacteristics addColor:forKey:toDictionaryRef:](self, "addColor:forKey:toDictionaryRef:", v7, CFSTR("/BC"), Mutable);

    -[PDFAppearanceCharacteristics addColor:forKey:toDictionaryRef:](self, "addColor:forKey:toDictionaryRef:", self->_private->backgroundColor, CFSTR("/BG"), Mutable);
    v8 = self->_private;
    if (v8->controlType > 2uLL)
    {
      v9 = 0;
    }
    else
    {
      v9 = v8->caption;
      if (v9)
        CFDictionarySetValue(Mutable, CFSTR("/CA"), v9);
    }
    v10 = self->_private;
    if (!v10->controlType)
    {
      v11 = v10->rolloverCaption;

      if (v11)
        CFDictionarySetValue(Mutable, CFSTR("/RC"), v11);
      v9 = self->_private->downCaption;

      if (v9)
        CFDictionarySetValue(Mutable, CFSTR("/AC"), v9);
    }

  }
  return Mutable;
}

- (void)addColor:(id)a3 forKey:(__CFString *)a4 toDictionaryRef:(__CFDictionary *)a5
{
  CGColor *v7;
  size_t NumberOfComponents;
  const CGFloat *Components;
  double *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id value;

  if (a3)
  {
    v7 = (CGColor *)objc_msgSend(objc_retainAutorelease(a3), "CGColor");
    NumberOfComponents = CGColorGetNumberOfComponents(v7);
    Components = CGColorGetComponents(v7);
    v10 = (double *)Components;
    switch(NumberOfComponents)
    {
      case 5uLL:
        v11 = objc_alloc(MEMORY[0x24BDBCE30]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10[1]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10[2]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10[3]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        value = (id)objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, 0);

        break;
      case 4uLL:
        v16 = objc_alloc(MEMORY[0x24BDBCE30]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10[1]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10[2]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        value = (id)objc_msgSend(v16, "initWithObjects:", v12, v13, v17, 0);

        break;
      case 2uLL:
        if (Components[1] == 0.0)
        {
          value = objc_alloc_init(MEMORY[0x24BDBCE30]);
          CFDictionarySetValue(a5, a4, value);
LABEL_14:

          return;
        }
        v18 = objc_alloc(MEMORY[0x24BDBCE30]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        value = (id)objc_msgSend(v18, "initWithObjects:", v19, 0);

LABEL_13:
        CFDictionarySetValue(a5, a4, value);
        goto LABEL_14;
      default:
        value = 0;
        CFDictionarySetValue(a5, a4, 0);
        goto LABEL_14;
    }

    goto LABEL_13;
  }
}

- (PDFWidgetControlType)controlType
{
  return self->_private->controlType;
}

- (void)setControlType:(PDFWidgetControlType)controlType
{
  self->_private->controlType = controlType;
}

- (NSString)caption
{
  return self->_private->caption;
}

- (void)setCaption:(NSString *)caption
{
  uint64_t v4;
  PDFAppearanceCharacteristicsPrivate *v5;
  NSString *v6;

  v4 = -[NSString copy](caption, "copy");
  v5 = self->_private;
  v6 = v5->caption;
  v5->caption = (NSString *)v4;

}

- (NSString)rolloverCaption
{
  return self->_private->rolloverCaption;
}

- (void)setRolloverCaption:(NSString *)rolloverCaption
{
  uint64_t v4;
  PDFAppearanceCharacteristicsPrivate *v5;
  NSString *v6;

  v4 = -[NSString copy](rolloverCaption, "copy");
  v5 = self->_private;
  v6 = v5->rolloverCaption;
  v5->rolloverCaption = (NSString *)v4;

}

- (NSString)downCaption
{
  return self->_private->downCaption;
}

- (void)setDownCaption:(NSString *)downCaption
{
  uint64_t v4;
  PDFAppearanceCharacteristicsPrivate *v5;
  NSString *v6;

  v4 = -[NSString copy](downCaption, "copy");
  v5 = self->_private;
  v6 = v5->downCaption;
  v5->downCaption = (NSString *)v4;

}

- (NSDictionary)appearanceCharacteristicsKeyValues
{
  id v3;
  void *v4;
  PDFAppearanceCharacteristicsPrivate *v5;
  UIColor *backgroundColor;
  void *v7;
  UIColor *borderColor;
  void *v9;
  NSString *caption;
  void *v11;
  NSString *rolloverCaption;
  void *v13;
  NSString *downCaption;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_private->rotation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("R"));

  v5 = self->_private;
  backgroundColor = v5->backgroundColor;
  if (backgroundColor)
  {
    v7 = (void *)-[UIColor copyWithZone:](backgroundColor, "copyWithZone:", 0);
    objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("BG"));

    v5 = self->_private;
  }
  borderColor = v5->borderColor;
  if (borderColor)
  {
    v9 = (void *)-[UIColor copyWithZone:](borderColor, "copyWithZone:", 0);
    objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("BC"));

    v5 = self->_private;
  }
  caption = v5->caption;
  if (caption)
  {
    v11 = (void *)-[NSString copyWithZone:](caption, "copyWithZone:", 0);
    objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("CA"));

    v5 = self->_private;
  }
  rolloverCaption = v5->rolloverCaption;
  if (rolloverCaption)
  {
    v13 = (void *)-[NSString copyWithZone:](rolloverCaption, "copyWithZone:", 0);
    objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("RC"));

    v5 = self->_private;
  }
  downCaption = v5->downCaption;
  if (downCaption)
  {
    v15 = (void *)-[NSString copyWithZone:](downCaption, "copyWithZone:", 0);
    objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("AC"));

  }
  return (NSDictionary *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
