@implementation APHUDLayer

- (APHUDLayer)init
{
  void *v2;
  void *v3;
  APHUDLayer *v4;
  APHUDLayer *v5;
  const __CFAllocator *v6;
  const __CFDictionary *v7;
  const CFArrayCallBacks *v8;
  objc_super v10;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BDC4EE0];
  keys[0] = *(void **)MEMORY[0x24BDC4C28];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x24BDBD430];
  values[0] = v3;
  values[1] = v3;
  v10.receiver = self;
  v10.super_class = (Class)APHUDLayer;
  v4 = -[APHUDLayer init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_Font = (__CTFont *)v3;
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v5->_TextAttributes = CFDictionaryCreateMutableCopy(v6, 2, v7);
    CFRelease(v7);
    v8 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
    v5->_Labels = CFArrayCreateMutable(v6, 0, MEMORY[0x24BDBD690]);
    v5->_Values = CFArrayCreateMutable(v6, 0, v8);
    v5->_Colors = CFArrayCreateMutable(v6, 0, v8);
  }
  return v5;
}

- (void)dealloc
{
  __CTFont *Font;
  BOOL v4;
  __CFDictionary *TextAttributes;
  __CFArray *Labels;
  __CFArray *Values;
  __CFArray *Colors;
  objc_super v9;

  Font = self->_Font;
  if (Font)
    v4 = Font == (__CTFont *)*MEMORY[0x24BDBD430];
  else
    v4 = 1;
  if (!v4)
    CFRelease(Font);
  TextAttributes = self->_TextAttributes;
  if (TextAttributes)
    CFRelease(TextAttributes);
  Labels = self->_Labels;
  if (Labels)
    CFRelease(Labels);
  Values = self->_Values;
  if (Values)
    CFRelease(Values);
  Colors = self->_Colors;
  if (Colors)
    CFRelease(Colors);
  v9.receiver = self;
  v9.super_class = (Class)APHUDLayer;
  -[APHUDLayer dealloc](&v9, sel_dealloc);
}

- (void)addLine:(__CFString *)a3 withColorIndex:(int)a4
{
  CGColor *v6;
  CFStringRef Copy;

  v6 = +[APGraphLayer copyGraphColorWithIndex:](APGraphLayer, "copyGraphColorWithIndex:", *(_QWORD *)&a4);
  Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a3);
  CFArrayAppendValue(self->_Labels, Copy);
  CFArrayAppendValue(self->_Colors, v6);
  CFArrayAppendValue(self->_Values, (const void *)*MEMORY[0x24BDBD430]);
  CFRelease(Copy);
  CFRelease(v6);
}

- (void)setValue:(__CFString *)a3 atIndex:(int)a4
{
  CFStringRef Copy;

  if (CFArrayGetCount(self->_Values) > a4)
  {
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a3);
    CFArraySetValueAtIndex(self->_Values, a4, Copy);
    CFRelease(Copy);
  }
}

- (void)setValueAtIndex:(int)a3 format:(id)a4
{
  void *v7;
  uint64_t v8;

  if (CFArrayGetCount(self->_Values) > a3)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a4, &v8);
    CFArraySetValueAtIndex(self->_Values, a3, v7);

  }
}

- (void)drawInContext:(CGContext *)a3
{
  __CTFont *v5;
  CFIndex v6;
  const void *v7;
  const __CFAllocator *v8;
  const __CFString *ValueAtIndex;
  const __CFString *v10;
  const void *v11;
  const __CFAttributedString *v12;
  const __CFAttributedString *v13;
  const __CTLine *v14;
  const __CTLine *v15;
  void *v16;
  void *value;
  CGAffineTransform v18;

  value = (void *)CGColorCreateWithRGB();
  CGAffineTransformMakeScale(&v18, 1.0, -1.0);
  CGContextSetTextMatrix(a3, &v18);
  v16 = (void *)*MEMORY[0x24BDBD430];
  if (self->_Font == (__CTFont *)*MEMORY[0x24BDBD430])
  {
    v5 = CTFontCreateWithName(CFSTR("Helvetica"), 12.0, 0);
    self->_Font = v5;
    CFDictionarySetValue(self->_TextAttributes, (const void *)*MEMORY[0x24BDC4C28], v5);
  }
  v6 = 0;
  v7 = (const void *)*MEMORY[0x24BDC4EE0];
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (CFArrayGetCount(self->_Labels) > v6)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(self->_Labels, v6);
    v10 = (const __CFString *)CFArrayGetValueAtIndex(self->_Values, v6);
    v11 = CFArrayGetValueAtIndex(self->_Colors, v6);
    CFDictionarySetValue(self->_TextAttributes, v7, v11);
    v12 = CFAttributedStringCreate(v8, ValueAtIndex, self->_TextAttributes);
    CFDictionarySetValue(self->_TextAttributes, v7, value);
    v13 = CFAttributedStringCreate(v8, v10, self->_TextAttributes);
    v14 = CTLineCreateWithAttributedString(v12);
    v15 = CTLineCreateWithAttributedString(v13);
    CGContextSetTextPosition(a3, 0.0, (float)((float)(int)++v6 * 12.0));
    CTLineDraw(v14, a3);
    CGContextSetTextPosition(a3, 60.0, (float)((float)(int)v6 * 12.0));
    CTLineDraw(v15, a3);
    CFRelease(v14);
    CFRelease(v15);
    CFRelease(v12);
    CFRelease(v13);
  }
  CFDictionarySetValue(self->_TextAttributes, v7, v16);
  CFRelease(value);
}

@end
