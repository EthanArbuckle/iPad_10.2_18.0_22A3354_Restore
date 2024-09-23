@implementation PDFRenderer

- (PDFRenderer)init
{
  PDFRenderer *v2;
  CFMutableDictionaryRef Mutable;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFRenderer;
  v2 = -[CGRenderer init](&v5, sel_init);
  if (v2)
  {
    Mutable = CFDictionaryCreateMutable(0, 2, 0, 0);
    v2->info = Mutable;
    -[__CFDictionary setValue:forKey:](Mutable, "setValue:forKey:", CFSTR("Apple, Inc."), *MEMORY[0x1E0C9DB40]);
  }
  return v2;
}

- (void)dealloc
{
  __CFData *data;
  CGDataConsumer *dataConsumer;
  objc_super v5;

  CFRelease(self->info);
  data = self->data;
  if (data)
    CFRelease(data);
  dataConsumer = self->dataConsumer;
  if (dataConsumer)
    CGDataConsumerRelease(dataConsumer);
  v5.receiver = self;
  v5.super_class = (Class)PDFRenderer;
  -[CGRenderer dealloc](&v5, sel_dealloc);
}

- (void)setFileURL:(id)a3
{
  CGDataConsumer *dataConsumer;
  CGContext *context;
  CGDataConsumer *v7;
  __CFData *data;
  __CFData *Mutable;

  dataConsumer = self->dataConsumer;
  if (dataConsumer)
    CGDataConsumerRelease(dataConsumer);
  context = self->super.context;
  if (context)
  {
    CGContextRelease(context);
    self->super.context = 0;
  }
  if (a3)
  {
    v7 = CGDataConsumerCreateWithURL((CFURLRef)objc_msgSend(a3, "URLByAppendingPathExtension:", CFSTR("pdf")));
  }
  else
  {
    data = self->data;
    if (data)
      CFRelease(data);
    Mutable = CFDataCreateMutable(0, 0);
    self->data = Mutable;
    v7 = CGDataConsumerCreateWithCFData(Mutable);
  }
  self->dataConsumer = v7;
}

- (void)setFileTitle:(id)a3
{
  -[__CFDictionary setValue:forKey:](self->info, "setValue:forKey:", a3, *MEMORY[0x1E0C9DB88]);
}

- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4
{
  CGContext *context;
  BOOL v11;
  CGRect v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  __asm { FMOV            V2.2D, #-20.0 }
  v13.origin = _Q2;
  v13.size.width = (double)a3 + 40.0;
  v13.size.height = (double)a4 + 40.0;
  context = self->super.context;
  if (context)
  {
    CGPDFContextEndPage(context);
    v14 = *MEMORY[0x1E0C9DB58];
    v15 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v13, 32);
    v11 = 1;
    CGPDFContextBeginPage(self->super.context, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, *(_OWORD *)&v13.origin, *(_QWORD *)&v13.size.width, *(_QWORD *)&v13.size.height));
  }
  else
  {
    self->super.context = CGPDFContextCreate(self->dataConsumer, &v13, self->info);
    v16 = *MEMORY[0x1E0C9DB58];
    v17[0] = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v13, 32);
    CGPDFContextBeginPage(self->super.context, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, *(_OWORD *)&v13.origin, *(_QWORD *)&v13.size.width, *(_QWORD *)&v13.size.height));
    return self->super.context != 0;
  }
  return v11;
}

- (void)flushRender
{
  CGPDFContextEndPage(self->super.context);
  CGPDFContextClose(self->super.context);
}

- (__CFData)pdfdata
{
  return CFDataCreateCopy(0, self->data);
}

@end
