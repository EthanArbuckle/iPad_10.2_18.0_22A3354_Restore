@implementation ICPDFGenerator

- (ICPDFGenerator)init
{
  -[ICPDFGenerator doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICPDFGenerator)initWithURL:(id)a3 pageRect:(CGRect)a4 title:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  ICPDFGenerator *v13;
  ICPDFGenerator *v14;
  objc_super v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICPDFGenerator;
  v13 = -[ICPDFGenerator init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[ICPDFGenerator setFileURL:](v13, "setFileURL:", v11);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    if (CGRectEqualToRect(v17, *MEMORY[0x1E0C9D628]))
    {
      x = *(double *)&kICPDFGeneratorDefaultPageRect;
      y = unk_1EF50A750;
      width = *(double *)&qword_1EF50A758;
      height = unk_1EF50A760;
    }
    -[ICPDFGenerator setPageRect:](v14, "setPageRect:", x, y, width, height);
    -[ICPDFGenerator setTitle:](v14, "setTitle:", v12);
  }

  return v14;
}

- (ICPDFGenerator)initWithMutableData:(id)a3 pageRect:(CGRect)a4 title:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  ICPDFGenerator *v13;
  ICPDFGenerator *v14;
  objc_super v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICPDFGenerator;
  v13 = -[ICPDFGenerator init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[ICPDFGenerator setData:](v13, "setData:", v11);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    if (CGRectEqualToRect(v17, *MEMORY[0x1E0C9D628]))
    {
      x = *(double *)&kICPDFGeneratorDefaultPageRect;
      y = unk_1EF50A750;
      width = *(double *)&qword_1EF50A758;
      height = unk_1EF50A760;
    }
    -[ICPDFGenerator setPageRect:](v14, "setPageRect:", x, y, width, height);
    -[ICPDFGenerator setTitle:](v14, "setTitle:", v12);
  }

  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (self->_pdfContext)
  {
    v3 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Forgot to call finishGenerating", buf, 2u);
    }

    -[ICPDFGenerator finishGenerating](self, "finishGenerating");
  }
  v4.receiver = self;
  v4.super_class = (Class)ICPDFGenerator;
  -[ICPDFGenerator dealloc](&v4, sel_dealloc);
}

- (BOOL)startGenerating
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  const __CFURL *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFData *v21;
  CGDataConsumer *v22;
  BOOL v23;
  NSObject *v24;
  CGRect mediaBox;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  if (self->_pdfContext)
  {
    v2 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[ICPDFGenerator startGenerating].cold.2(v2, v3, v4, v5, v6, v7, v8, v9);
LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  v27[0] = *MEMORY[0x1E0C9DB88];
  -[ICPDFGenerator title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = *MEMORY[0x1E0C9DB40];
  v28[0] = v11;
  v28[1] = CFSTR("Notes");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v2 = objc_claimAutoreleasedReturnValue();

  -[ICPDFGenerator pageRect](self, "pageRect");
  mediaBox.origin.x = v12;
  mediaBox.origin.y = v13;
  mediaBox.size.width = v14;
  mediaBox.size.height = v15;
  -[ICPDFGenerator fileURL](self, "fileURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ICPDFGenerator fileURL](self, "fileURL");
    v17 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    self->_pdfContext = CGPDFContextCreateWithURL(v17, &mediaBox, (CFDictionaryRef)v2);

  }
  else
  {
    -[ICPDFGenerator data](self, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_10:
      v24 = os_log_create("com.apple.notes", "Export");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[ICPDFGenerator startGenerating].cold.1(self, v24);

      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPDFGenerator data](self, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setData:", v19);

    -[ICPDFGenerator data](self, "data");
    v21 = (__CFData *)objc_claimAutoreleasedReturnValue();
    v22 = CGDataConsumerCreateWithCFData(v21);

    self->_pdfContext = CGPDFContextCreate(v22, &mediaBox, (CFDictionaryRef)v2);
    CGDataConsumerRelease(v22);
  }
  if (!self->_pdfContext)
    goto LABEL_10;
  v23 = 1;
LABEL_14:

  return v23;
}

- (void)addPageWithRenderBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[ICPDFGenerator pageRect](self, "pageRect");
  -[ICPDFGenerator addPageWithPageRect:renderBlock:](self, "addPageWithPageRect:renderBlock:", v4);

}

- (void)addPageWithPageRect:(CGRect)a3 renderBlock:(id)a4
{
  void (**v5)(id, CGContext *, double, double, double, double);
  __CFDictionary *Mutable;
  CFDataRef v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGRect v16;

  v16 = a3;
  v5 = (void (**)(id, CGContext *, double, double, double, double))a4;
  if (self->_pdfContext)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v7 = CFDataCreate(0, (const UInt8 *)&v16, 32);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9DB58], v7);
    CGPDFContextBeginPage(self->_pdfContext, Mutable);
    v5[2](v5, self->_pdfContext, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    CGPDFContextEndPage(self->_pdfContext);
    CFRelease(Mutable);
    CFRelease(v7);
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICPDFGenerator addPageWithPageRect:renderBlock:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)finishGenerating
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "Attempted to finish generating without successfully starting", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CGRect)pageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_pageRect.origin.x;
  y = self->_pageRect.origin.y;
  width = self->_pageRect.size.width;
  height = self->_pageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPageRect:(CGRect)a3
{
  self->_pageRect = a3;
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)startGenerating
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "Attempted to start generating multiple times", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)addPageWithPageRect:(uint64_t)a3 renderBlock:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "Attempted to add a page without a pdf context", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
