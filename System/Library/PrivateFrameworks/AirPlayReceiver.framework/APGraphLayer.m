@implementation APGraphLayer

- (void)setUpGraphs:(int)a3
{
  float *Mins;
  float *Maxes;
  int *NumValues;
  float **Values;
  uint64_t v9;
  int *StartIndex;

  if (self->_NumGraphs != a3)
  {
    Mins = self->_Mins;
    if (Mins)
      free(Mins);
    self->_Mins = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    Maxes = self->_Maxes;
    if (Maxes)
      free(Maxes);
    self->_Maxes = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    NumValues = self->_NumValues;
    if (NumValues)
      free(NumValues);
    self->_NumValues = (int *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    Values = self->_Values;
    if (Values)
      free(Values);
    self->_Values = (float **)malloc_type_malloc(8 * a3, 0x80040B8603338uLL);
    if (a3 >= 1)
    {
      v9 = 0;
      do
      {
        self->_Mins[v9] = 0.0;
        self->_Maxes[v9] = 0.0;
        self->_NumValues[v9] = 0;
        self->_Values[v9++] = 0;
      }
      while (a3 != v9);
    }
    StartIndex = self->_StartIndex;
    if (StartIndex)
      free(StartIndex);
    self->_StartIndex = (int *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    self->_NumGraphs = a3;
  }
}

- (void)setUpGraph:(int)a3 min:(float)a4 max:(float)a5 numValues:(int)a6
{
  uint64_t v10;
  float *v11;
  CGPoint *Lines;
  float *v13;
  uint64_t v14;

  v10 = a3;
  if (self->_NumValues[a3] == a6)
    goto LABEL_5;
  v11 = self->_Values[a3];
  if (v11)
    free(v11);
  self->_Values[v10] = (float *)malloc_type_malloc(4 * a6, 0x100004052888210uLL);
  if (self->_Values[v10])
  {
LABEL_5:
    if (self->_MaxLength < a6)
    {
      Lines = self->_Lines;
      if (Lines)
        free(Lines);
      self->_Lines = (CGPoint *)malloc_type_malloc(32 * a6, 0x238A610FuLL);
      self->_MaxLength = a6;
    }
    if (a6 >= 1)
    {
      v13 = self->_Values[v10];
      v14 = a6;
      do
      {
        *v13++ = a4;
        --v14;
      }
      while (v14);
    }
    self->_Mins[v10] = a4;
    self->_Maxes[v10] = a5;
    self->_NumValues[v10] = a6;
    self->_StartIndex[v10] = 0;
  }
}

- (void)updateValue:(int)a3 value:(float)a4
{
  float *Maxes;
  float *Mins;
  int *StartIndex;
  uint64_t v7;

  if (self->_NumGraphs > a3)
  {
    Maxes = self->_Maxes;
    if (Maxes[a3] < a4)
      a4 = Maxes[a3];
    Mins = self->_Mins;
    if (a4 < Mins[a3])
      a4 = Mins[a3];
    StartIndex = self->_StartIndex;
    v7 = StartIndex[a3];
    self->_Values[a3][v7] = a4;
    StartIndex[a3] = ((int)v7 + 1) % self->_NumValues[a3];
  }
}

- (APGraphLayer)init
{
  void *v2;
  void *v3;
  APGraphLayer *v4;
  APGraphLayer *v5;
  const __CFAllocator *v6;
  const __CFDictionary *v7;
  objc_super v9;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BDC4EE0];
  keys[0] = *(void **)MEMORY[0x24BDC4C28];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x24BDBD430];
  values[0] = v3;
  values[1] = v3;
  v9.receiver = self;
  v9.super_class = (Class)APGraphLayer;
  v4 = -[APGraphLayer init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_Values = 0;
    v4->_Mins = 0;
    v4->_Maxes = 0;
    v4->_NumValues = 0;
    v4->_NumGraphs = 0;
    v4->_MaxLength = 0;
    v4->_Lines = 0;
    v4->_Font = (__CTFont *)v3;
    v4->_StartIndex = 0;
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v5->_TextAttributes = CFDictionaryCreateMutableCopy(v6, 2, v7);
    CFRelease(v7);
  }
  return v5;
}

- (void)dealloc
{
  CGPoint *Lines;
  float *Mins;
  float *Maxes;
  int *NumValues;
  float **Values;
  int NumGraphs;
  uint64_t i;
  float *v10;
  int *StartIndex;
  __CTFont *Font;
  BOOL v13;
  __CFDictionary *TextAttributes;
  objc_super v15;

  Lines = self->_Lines;
  if (Lines)
    free(Lines);
  Mins = self->_Mins;
  if (Mins)
    free(Mins);
  Maxes = self->_Maxes;
  if (Maxes)
    free(Maxes);
  NumValues = self->_NumValues;
  if (NumValues)
    free(NumValues);
  Values = self->_Values;
  if (Values)
  {
    NumGraphs = self->_NumGraphs;
    if (NumGraphs >= 1)
    {
      for (i = 0; i < NumGraphs; ++i)
      {
        v10 = self->_Values[i];
        if (v10)
        {
          free(v10);
          NumGraphs = self->_NumGraphs;
        }
      }
      Values = self->_Values;
    }
    free(Values);
  }
  StartIndex = self->_StartIndex;
  if (StartIndex)
    free(StartIndex);
  Font = self->_Font;
  if (Font)
    v13 = Font == (__CTFont *)*MEMORY[0x24BDBD430];
  else
    v13 = 1;
  if (!v13)
    CFRelease(Font);
  TextAttributes = self->_TextAttributes;
  if (TextAttributes)
    CFRelease(TextAttributes);
  v15.receiver = self;
  v15.super_class = (Class)APGraphLayer;
  -[APGraphLayer dealloc](&v15, sel_dealloc);
}

- (void)drawInContext:(CGContext *)a3
{
  double height;
  CGFloat x;
  double y;
  double v8;
  double v9;
  uint64_t NumGraphs;
  uint64_t v11;
  float *Mins;
  float *Maxes;
  int v14;
  double v15;
  CGColor *v16;
  double *v17;
  uint64_t v18;
  double v19;
  CGColor *v21;
  int v22;
  uint64_t v23;
  double v24;
  double v25;
  int v26;
  float *v27;
  float *v28;
  float v29;
  float *v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  int v35;
  CGPoint *v36;
  double v37;
  int v38;
  double v39;
  CGColor *v40;
  __CTFont *v41;
  int v42;
  uint64_t v43;
  double PenOffsetForFlush;
  double v45;
  float *v46;
  float v47;
  float *v48;
  float v49;
  CGColor *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFAttributedString *v53;
  const __CFAttributedString *v54;
  const __CTLine *v55;
  const __CTLine *v56;
  double v57;
  double v58;
  double width;
  const __CFAllocator *alloc;
  void *key;
  int v63;
  CGColor *cf;
  CGContextRef c;
  CGAffineTransform v66;
  CGPoint points;
  _QWORD v68[12];
  CGRect ClipBoundingBox;
  CGRect v70;
  CGRect v71;
  CGRect ImageBounds;
  CGRect v73;

  v68[10] = *MEMORY[0x24BDAC8D0];
  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  width = ClipBoundingBox.size.width;
  height = ClipBoundingBox.size.height;
  c = a3;
  v70 = CGContextGetClipBoundingBox(a3);
  x = v70.origin.x;
  y = v70.origin.y;
  v8 = v70.size.width;
  v9 = v70.size.height;
  NumGraphs = self->_NumGraphs;
  if ((int)NumGraphs < 2)
  {
    v14 = 1;
  }
  else
  {
    v11 = 0;
    Mins = self->_Mins;
    while (!Mins || Mins[v11] == Mins[v11 + 1])
    {
      Maxes = self->_Maxes;
      if (Maxes)
      {
        if (Maxes[v11] != Maxes[v11 + 1])
          break;
      }
      if (NumGraphs - 1 == ++v11)
        goto LABEL_12;
    }
    v14 = v11 + 1;
  }
  if (v14 == (_DWORD)NumGraphs)
  {
LABEL_12:
    v63 = NumGraphs - 1;
    v15 = 0.0;
  }
  else
  {
    v63 = 0;
    v9 = v70.size.height + -24.0;
    v15 = 12.0;
    y = v70.origin.y + 12.0;
  }
  v16 = (CGColor *)CGColorCreateWithRGB();
  CGContextSetFillColorWithColor(a3, v16);
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = v8;
  v71.size.height = v9;
  CGContextFillRect(a3, v71);
  CFRelease(v16);
  v17 = (double *)v68;
  v18 = -3;
  do
  {
    *(v17 - 2) = 0.0;
    v19 = v15 + v9 * (float)(v18 + 4) * 0.25;
    *(v17 - 1) = v19;
    *v17 = v8;
    v17[1] = v19;
    v17 += 4;
  }
  while (!__CFADD__(v18++, 1));
  v21 = (CGColor *)CGColorCreateWithRGB();
  CGContextSetStrokeColorWithColor(a3, v21);
  CGContextStrokeLineSegments(a3, &points, 6uLL);
  CFRelease(v21);
  if (self->_Lines && self->_NumValues && self->_Values)
  {
    v22 = self->_NumGraphs;
    if (v22 >= 1)
    {
      v23 = 0;
      v24 = v9 + -1.0 + v15;
      v25 = -(v9 + -2.0);
      do
      {
        v26 = self->_NumValues[v23];
        if (v26 >= 2)
        {
          v27 = self->_Values[v23];
          if (v27)
          {
            v28 = self->_Mins;
            if (v28)
              v29 = v28[v23];
            else
              v29 = 0.0;
            v30 = self->_Maxes;
            if (v30)
              v31 = v30[v23];
            else
              v31 = 1.0;
            v32 = 0;
            v33 = (v26 - 1);
            v34 = v8 / (double)(int)v33;
            v35 = self->_StartIndex[v23];
            v36 = self->_Lines + 1;
            v37 = v25 / (float)(v31 - v29);
            do
            {
              v38 = (v35 + (int)v32) % v26;
              v39 = (float)(int)v32;
              v36[-1].x = v34 * v39;
              v36[-1].y = v24 + v37 * (float)(v27[v38] - v29);
              v36->x = v34 + v34 * v39;
              v36->y = v24 + v37 * (float)(v27[(v38 + 1) % v26] - v29);
              ++v32;
              v36 += 2;
            }
            while (v33 != v32);
            v40 = +[APGraphLayer copyGraphColorWithIndex:](APGraphLayer, "copyGraphColorWithIndex:", v23);
            CGContextSetStrokeColorWithColor(a3, v40);
            CGContextStrokeLineSegments(a3, self->_Lines, (2 * v33));
            CFRelease(v40);
            v22 = self->_NumGraphs;
          }
        }
        ++v23;
      }
      while (v23 < v22);
    }
    CGAffineTransformMakeScale(&v66, 1.0, -1.0);
    CGContextSetTextMatrix(a3, &v66);
    if (self->_Font == (__CTFont *)*MEMORY[0x24BDBD430])
    {
      v41 = CTFontCreateWithName(CFSTR("Helvetica"), 12.0, 0);
      self->_Font = v41;
      CFDictionarySetValue(self->_TextAttributes, (const void *)*MEMORY[0x24BDC4C28], v41);
    }
    v42 = self->_NumGraphs;
    if (v42 > v63)
    {
      alloc = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      key = (void *)*MEMORY[0x24BDC4EE0];
      v43 = v42 - 1;
      PenOffsetForFlush = 0.0;
      v45 = 0.0;
      do
      {
        v46 = self->_Mins;
        if (v46)
          v47 = v46[v43];
        else
          v47 = 0.0;
        v48 = self->_Maxes;
        if (v48)
          v49 = v48[v43];
        else
          v49 = 1.0;
        if (v63)
          v50 = (CGColor *)CGColorCreateWithRGB();
        else
          v50 = +[APGraphLayer copyGraphColorWithIndex:](APGraphLayer, "copyGraphColorWithIndex:", (v42 - 1));
        cf = v50;
        CFDictionarySetValue(self->_TextAttributes, key, v50);
        v51 = CFStringCreateWithFormat(alloc, 0, CFSTR("%1.1f"), v49);
        v52 = CFStringCreateWithFormat(alloc, 0, CFSTR("%1.1f"), v47);
        v53 = CFAttributedStringCreate(alloc, v51, self->_TextAttributes);
        v54 = CFAttributedStringCreate(alloc, v52, self->_TextAttributes);
        v55 = CTLineCreateWithAttributedString(v53);
        v56 = CTLineCreateWithAttributedString(v54);
        ImageBounds = CTLineGetImageBounds(v55, c);
        v57 = ImageBounds.size.width;
        v58 = ImageBounds.size.height;
        v73 = CTLineGetImageBounds(v56, c);
        if (v42 == self->_NumGraphs)
        {
          PenOffsetForFlush = CTLineGetPenOffsetForFlush(v55, 1.0, width);
          v45 = CTLineGetPenOffsetForFlush(v56, 1.0, width);
        }
        else
        {
          PenOffsetForFlush = PenOffsetForFlush + v57 * -1.25;
          v45 = v45 + v73.size.width * -1.25;
        }
        if (v45 < PenOffsetForFlush)
          PenOffsetForFlush = v45;
        CGContextSetTextPosition(c, PenOffsetForFlush, v58 + v58 * 0.25);
        CTLineDraw(v55, c);
        CGContextSetTextPosition(c, PenOffsetForFlush, height + v58 * -0.25);
        CTLineDraw(v56, c);
        CFRelease(v53);
        CFRelease(v55);
        CFRelease(v51);
        CFRelease(v54);
        CFRelease(v56);
        CFRelease(v52);
        CFRelease(cf);
        --v42;
      }
      while (v43-- > v63);
    }
  }
}

+ (CGColor)copyGraphColorWithIndex:(int)a3
{
  CGColorSpace *RGB;

  RGB = (CGColorSpace *)CGColorSpaceGetRGB();
  return CGColorCreate(RGB, &copyGraphColorWithIndex__graphColors[4 * a3]);
}

@end
