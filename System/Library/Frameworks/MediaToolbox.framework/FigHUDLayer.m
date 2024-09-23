@implementation FigHUDLayer

- (FigHUDLayer)init
{
  void *v2;
  void *v3;
  FigHUDLayer *v4;
  FigHUDLayer *v5;
  const __CFAllocator *v6;
  const __CFDictionary *v7;
  const CFArrayCallBacks *v8;
  objc_super v10;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0CA8550];
  keys[0] = *(void **)MEMORY[0x1E0CA8188];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x1E0C9B0D0];
  values[0] = v3;
  values[1] = v3;
  v10.receiver = self;
  v10.super_class = (Class)FigHUDLayer;
  v4 = -[FigHUDLayer init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_Font = (__CTFont *)v3;
    v4->_FontSize = 24.0;
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v5->_TextAttributes = CFDictionaryCreateMutableCopy(v6, 2, v7);
    CFRelease(v7);
    v8 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    v5->_Labels = CFArrayCreateMutable(v6, 0, MEMORY[0x1E0C9B378]);
    v5->_Values = CFArrayCreateMutable(v6, 0, v8);
    v5->_LabelColors = CFArrayCreateMutable(v6, 0, v8);
    v5->_ValueColors = CFArrayCreateMutable(v6, 0, v8);
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
  __CFArray *LabelColors;
  __CFArray *ValueColors;
  objc_super v10;

  Font = self->_Font;
  if (Font)
    v4 = Font == (__CTFont *)*MEMORY[0x1E0C9B0D0];
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
  LabelColors = self->_LabelColors;
  if (LabelColors)
    CFRelease(LabelColors);
  ValueColors = self->_ValueColors;
  if (ValueColors)
    CFRelease(ValueColors);
  v10.receiver = self;
  v10.super_class = (Class)FigHUDLayer;
  -[FigHUDLayer dealloc](&v10, sel_dealloc);
}

- (void)setFont:(__CFString *)a3 withPointSize:(double)a4
{
  __CTFont *Font;
  __CTFont *v8;
  __CTFont *v9;

  Font = self->_Font;
  v8 = (__CTFont *)*MEMORY[0x1E0C9B0D0];
  if (Font != (__CTFont *)*MEMORY[0x1E0C9B0D0])
  {
    CFRelease(Font);
    self->_Font = v8;
  }
  self->_FontSize = a4;
  v9 = CTFontCreateWithName(a3, a4, 0);
  self->_Font = v9;
  CFDictionarySetValue(self->_TextAttributes, (const void *)*MEMORY[0x1E0CA8188], v9);
}

- (void)resetLines
{
  __CFArray *Labels;
  __CFArray *Values;
  __CFArray *LabelColors;
  __CFArray *ValueColors;

  Labels = self->_Labels;
  if (Labels)
    CFArrayRemoveAllValues(Labels);
  Values = self->_Values;
  if (Values)
    CFArrayRemoveAllValues(Values);
  LabelColors = self->_LabelColors;
  if (LabelColors)
    CFArrayRemoveAllValues(LabelColors);
  ValueColors = self->_ValueColors;
  if (ValueColors)
    CFArrayRemoveAllValues(ValueColors);
}

- (int64_t)addLine:(__CFString *)a3 withColorIndex:(int)a4
{
  return -[FigHUDLayer addLine:withLabelColorIndex:withValueColorIndex:](self, "addLine:withLabelColorIndex:withValueColorIndex:", a3, *(_QWORD *)&a4, 0);
}

- (int64_t)addLine:(__CFString *)a3 withLabelColorIndex:(int)a4 withValueColorIndex:(int)a5
{
  CGColorRef v8;
  CGColorRef v9;
  CFStringRef Copy;

  v8 = figHUDCGColorCreateWithIndex(a4);
  v9 = figHUDCGColorCreateWithIndex(a5);
  Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
  CFArrayAppendValue(self->_Labels, Copy);
  CFArrayAppendValue(self->_LabelColors, v8);
  CFArrayAppendValue(self->_Values, (const void *)*MEMORY[0x1E0C9B0D0]);
  CFArrayAppendValue(self->_ValueColors, v9);
  CFRelease(Copy);
  CFRelease(v8);
  CFRelease(v9);
  return CFArrayGetCount(self->_Labels) - 1;
}

- (__CFArray)getValues
{
  return self->_Values;
}

- (__CFArray)getLabels
{
  return self->_Labels;
}

- (void)setValue:(__CFString *)a3 atIndex:(int)a4
{
  CFStringRef Copy;

  if (CFArrayGetCount(self->_Values) > a4)
  {
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
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
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a4, &v8);
    CFArraySetValueAtIndex(self->_Values, a3, v7);

  }
}

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  __CTFont *v6;
  CFIndex v7;
  const void *v8;
  const __CFString *ValueAtIndex;
  const __CFString *v10;
  const void *v11;
  const void *v12;
  const __CFAttributedString *v13;
  const __CTLine *v14;
  const __CTLine *v15;
  double v16;
  void *value;
  const __CFAllocator *alloc;
  const __CFAttributedString *cf;
  CGAffineTransform v20;

  CGAffineTransformMakeScale(&v20, 1.0, -1.0);
  CGContextSetTextMatrix(a3, &v20);
  v5 = (void *)*MEMORY[0x1E0C9B0D0];
  if (self->_Font == (__CTFont *)*MEMORY[0x1E0C9B0D0])
  {
    v6 = CTFontCreateWithName(CFSTR("Helvetica"), self->_FontSize, 0);
    self->_Font = v6;
    CFDictionarySetValue(self->_TextAttributes, (const void *)*MEMORY[0x1E0CA8188], v6);
  }
  if (CFArrayGetCount(self->_Labels) <= 0)
  {
    v8 = (const void *)*MEMORY[0x1E0CA8550];
  }
  else
  {
    value = v5;
    v7 = 0;
    v8 = (const void *)*MEMORY[0x1E0CA8550];
    alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(self->_Labels, v7);
      v10 = (const __CFString *)CFArrayGetValueAtIndex(self->_Values, v7);
      v11 = CFArrayGetValueAtIndex(self->_LabelColors, v7);
      v12 = CFArrayGetValueAtIndex(self->_ValueColors, v7);
      CFDictionarySetValue(self->_TextAttributes, v8, v11);
      cf = CFAttributedStringCreate(alloc, ValueAtIndex, self->_TextAttributes);
      CFDictionarySetValue(self->_TextAttributes, v8, v12);
      v13 = CFAttributedStringCreate(alloc, v10, self->_TextAttributes);
      v14 = CTLineCreateWithAttributedString(cf);
      v15 = CTLineCreateWithAttributedString(v13);
      CGContextSetTextPosition(a3, 0.0, self->_FontSize * (double)(int)++v7);
      CTLineDraw(v14, a3);
      -[FigHUDLayer bounds](self, "bounds");
      CGContextSetTextPosition(a3, v16 * 0.5, self->_FontSize * (double)(int)v7);
      CTLineDraw(v15, a3);
      CFRelease(v14);
      CFRelease(v15);
      CFRelease(cf);
      CFRelease(v13);
    }
    while (CFArrayGetCount(self->_Labels) > v7);
    v5 = value;
  }
  CFDictionarySetValue(self->_TextAttributes, v8, v5);
}

@end
