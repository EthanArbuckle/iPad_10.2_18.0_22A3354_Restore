@implementation PDFPageEvaluator

+ (void)isPageCandidateForOCR:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, BOOL);
  int v8;
  PDFPageEvaluator *v9;
  NSObject *v10;
  void (**v11)(id, id, BOOL);
  id v12;
  PDFPageEvaluator *v13;
  _QWORD block[4];
  PDFPageEvaluator *v15;
  id v16;
  void (**v17)(id, id, BOOL);

  v6 = a3;
  v7 = (void (**)(id, id, BOOL))a4;
  v8 = objc_msgSend(v6, "isCandidateForOCR");
  if (v8 != 2)
    v7[2](v7, v6, v8 == 1);
  v9 = -[PDFPageEvaluator initWithPage:]([PDFPageEvaluator alloc], "initWithPage:", v6);
  objc_msgSend(a1, "asyncWorkQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__PDFPageEvaluator_isPageCandidateForOCR_completion___block_invoke;
  block[3] = &unk_24C25CB00;
  v15 = v9;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v9;
  dispatch_async(v10, block);

}

uint64_t __53__PDFPageEvaluator_isPageCandidateForOCR_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "scan");
  objc_msgSend(*(id *)(a1 + 40), "setCandidateForOCR:", objc_msgSend(*(id *)(a1 + 32), "isPageCandidateForOCR"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (BOOL)isPageCandidateForOCR:(id)a3
{
  id v3;
  int v4;
  PDFPageEvaluator *v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "isCandidateForOCR");
  if (v4 == 2)
  {
    v5 = -[PDFPageEvaluator initWithPage:]([PDFPageEvaluator alloc], "initWithPage:", v3);
    -[PDFPageEvaluator scan](v5, "scan");
    v6 = -[PDFPageEvaluator isPageCandidateForOCR](v5, "isPageCandidateForOCR");
    objc_msgSend(v3, "setCandidateForOCR:", v6);

  }
  else
  {
    LOBYTE(v6) = v4 == 1;
  }

  return v6;
}

+ (CGPDFOperatorTable)createOperatorTable
{
  CGPDFOperatorTable *v2;
  uint64_t i;

  v2 = CGPDFOperatorTableCreate();
  if (v2)
  {
    for (i = 0; i != 16; i += 2)
      CGPDFOperatorTableSetCallback(v2, (&operators)[i], (CGPDFOperatorCallback)(&operators)[i + 1]);
  }
  return v2;
}

+ (OS_dispatch_queue)asyncWorkQueue
{
  if (+[PDFPageEvaluator asyncWorkQueue]::onceToken != -1)
    dispatch_once(&+[PDFPageEvaluator asyncWorkQueue]::onceToken, &__block_literal_global_4);
  return (OS_dispatch_queue *)(id)+[PDFPageEvaluator asyncWorkQueue]::asyncWorkQueue;
}

void __34__PDFPageEvaluator_asyncWorkQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_DEFAULT, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PDFKit.PDFPageEvaluator.asyncWorkQueue", attr);
  v2 = (void *)+[PDFPageEvaluator asyncWorkQueue]::asyncWorkQueue;
  +[PDFPageEvaluator asyncWorkQueue]::asyncWorkQueue = (uint64_t)v1;

}

- (PDFPageEvaluator)initWithPage:(id)a3
{
  id v4;
  PDFPageEvaluator *v5;
  CGPDFPage *v6;
  double Width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat Height;
  CGPDFContentStreamRef v14;
  PDFPageEvaluator *v15;
  CGRect BoxRect;

  v4 = a3;
  v5 = -[PDFPageEvaluator initWithParent:](self, "initWithParent:", 0);
  if (v5)
  {
    v6 = CGPDFPageRetain((CGPDFPageRef)objc_msgSend(v4, "pageRef"));
    v5->_page = v6;
    if (!v6)
    {
LABEL_7:
      v15 = 0;
      goto LABEL_8;
    }
    BoxRect = CGPDFPageGetBoxRect(v6, kCGPDFCropBox);
    v5->_pageBounds = BoxRect;
    Width = CGRectGetWidth(BoxRect);
    Height = CGRectGetHeight(v5->_pageBounds);
    v5->_pageArea = (unint64_t)Width * (unint64_t)Height;
    if (!is_mul_ok((unint64_t)Width, (unint64_t)Height))
    {
      _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"OCR", (uint64_t)"%s: Page area would cause overflow", v8, v9, v10, v11, v12, (uint64_t)"-[PDFPageEvaluator initWithPage:]");
      goto LABEL_7;
    }
    v14 = CGPDFContentStreamCreateWithPage((CGPDFPageRef)objc_msgSend(v4, "pageRef"));
    v5->_cs = v14;
    if (!v14)
      goto LABEL_7;
  }
  v15 = v5;
LABEL_8:

  return v15;
}

- (PDFPageEvaluator)initWithParent:(id)a3
{
  id v4;
  PDFPageEvaluator *v5;
  uint64_t Copy;
  uint64_t v7;
  PDFPageEvaluator *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PDFPageEvaluator;
  v5 = -[PDFPageEvaluator init](&v10, sel_init);
  if (!v5
    || (!v4 ? (Copy = CGPDFRStateCreate()) : (objc_msgSend(v4, "rstate"), Copy = CGPDFRStateCreateCopy()),
        (v5->_rstate = (CGPDFRState *)Copy) != 0
     && (v5->_gstate = (CGPDFGState *)CGPDFRStateGetGState(),
         v7 = objc_msgSend((id)objc_opt_class(), "createOperatorTable"),
         (v5->_table = (CGPDFOperatorTable *)v7) != 0)))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PDFPageEvaluator)initWithParent:(id)a3 stream:(CGPDFStream *)a4 resources:(CGPDFDictionary *)a5
{
  id v8;
  PDFPageEvaluator *v9;

  v8 = a3;
  v9 = -[PDFPageEvaluator initWithParent:](self, "initWithParent:", v8);
  if (v9)
    v9->_cs = CGPDFContentStreamCreateWithStream(a4, a5, (CGPDFContentStreamRef)objc_msgSend(v8, "contentStream"));

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CGPDFPageRelease(self->_page);
  CGPDFRStateRelease();
  CGPDFOperatorTableRelease(self->_table);
  CGPDFContentStreamRelease(self->_cs);
  v3.receiver = self;
  v3.super_class = (Class)PDFPageEvaluator;
  -[PDFPageEvaluator dealloc](&v3, sel_dealloc);
}

- (void)scan
{
}

- (void)stopScan:(CGPDFScanner *)a3
{
  CGPDFScannerStop(a3);
}

- (BOOL)isPageCandidateForOCR
{
  return self->_containsLargeImage && !self->_containsText;
}

- (void)op_q:(CGPDFScanner *)a3
{
  CGPDFRStateGSave();
  self->_gstate = (CGPDFGState *)CGPDFRStateGetGState();
}

- (void)op_Q:(CGPDFScanner *)a3
{
  CGPDFRStateGRestore();
  self->_gstate = (CGPDFGState *)CGPDFRStateGetGState();
}

- (void)op_cm:(CGPDFScanner *)a3
{
  CGPDFReal value;
  CGPDFReal v5;
  CGPDFReal v6;
  CGPDFReal v7;
  CGPDFReal v8;
  CGPDFReal v9;

  v8 = 0.0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  value = 0.0;
  v5 = 0.0;
  if (CGPDFScannerPopNumber(a3, &value)
    && CGPDFScannerPopNumber(a3, &v5)
    && CGPDFScannerPopNumber(a3, &v6)
    && CGPDFScannerPopNumber(a3, &v7)
    && CGPDFScannerPopNumber(a3, &v8)
    && CGPDFScannerPopNumber(a3, &v9))
  {
    CGPDFGStateConcatCTM();
  }
}

- (void)op_Tj:(CGPDFScanner *)a3
{
  CGPDFStringRef value;

  value = 0;
  if (CGPDFScannerPopString(a3, &value))
  {
    if (CGPDFStringGetLength(value))
    {
      self->_containsText = 1;
      -[PDFPageEvaluator stopScan:](self, "stopScan:", a3);
    }
  }
}

- (void)op_TJ:(CGPDFScanner *)a3
{
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  CGPDFArrayRef value;

  value = 0;
  if (CGPDFScannerPopArray(a3, &value))
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __26__PDFPageEvaluator_op_TJ___block_invoke;
    v5[3] = &unk_24C25CB28;
    v5[4] = &v6;
    CGPDFArrayApplyBlock(value, v5, 0);
    if (v7[3])
    {
      self->_containsText = 1;
      -[PDFPageEvaluator stopScan:](self, "stopScan:", a3);
    }
    _Block_object_dispose(&v6, 8);
  }
}

BOOL __26__PDFPageEvaluator_op_TJ___block_invoke(uint64_t a1, int a2, CGPDFObjectRef object)
{
  CGPDFStringRef value;

  if (CGPDFObjectGetType(object) == kCGPDFObjectTypeString)
  {
    value = 0;
    if (CGPDFObjectGetValue(object, kCGPDFObjectTypeString, &value))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += CGPDFStringGetLength(value);
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

- (void)op_singlequote:(CGPDFScanner *)a3
{
  CGPDFStringRef value;

  value = 0;
  if (CGPDFScannerPopString(a3, &value))
  {
    if (CGPDFStringGetLength(value))
    {
      self->_containsText = 1;
      -[PDFPageEvaluator stopScan:](self, "stopScan:", a3);
    }
  }
}

- (void)op_doublequote:(CGPDFScanner *)a3
{
  CGPDFReal v5;
  CGPDFReal v6;
  CGPDFStringRef value;

  v6 = 0.0;
  value = 0;
  v5 = 0.0;
  if (CGPDFScannerPopString(a3, &value) && CGPDFScannerPopNumber(a3, &v6) && CGPDFScannerPopNumber(a3, &v5))
  {
    if (CGPDFStringGetLength(value))
    {
      self->_containsText = 1;
      -[PDFPageEvaluator stopScan:](self, "stopScan:", a3);
    }
  }
}

- (void)op_Do:(CGPDFScanner *)a3
{
  CGPDFContentStream *ContentStream;
  CGPDFObject *Resource;
  CGPDFDictionary *Dictionary;
  CGPDFDictionary *v8;
  char *v9;
  PDFPageEvaluator *v10;
  PDFPageEvaluator *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  CGAffineTransform v23;
  CGPDFDictionaryRef v24[2];
  __int128 v25;
  __int128 v26;
  char *v27;
  CGPDFStreamRef v28;
  char *value;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  value = 0;
  if (CGPDFScannerPopName(a3, (const char **)&value))
  {
    ContentStream = CGPDFScannerGetContentStream(a3);
    if (ContentStream)
    {
      Resource = CGPDFContentStreamGetResource(ContentStream, "XObject", value);
      if (Resource)
      {
        v28 = 0;
        if (CGPDFObjectGetValue(Resource, kCGPDFObjectTypeStream, &v28))
        {
          Dictionary = CGPDFStreamGetDictionary(v28);
          if (Dictionary)
          {
            v8 = Dictionary;
            v27 = 0;
            if (CGPDFDictionaryGetName(Dictionary, "Subtype", (const char **)&v27))
            {
              v9 = v27;
              if (!strcmp(v27, "Image"))
              {
                v25 = 0u;
                v26 = 0u;
                *(_OWORD *)v24 = 0u;
                CGPDFGStateGetCTM();
                memset(&v23, 0, sizeof(v23));
                v30.origin.x = 0.0;
                v30.origin.y = 0.0;
                v30.size.width = 1.0;
                v30.size.height = 1.0;
                v31 = CGRectApplyAffineTransform(v30, &v23);
                x = v31.origin.x;
                y = v31.origin.y;
                width = v31.size.width;
                height = v31.size.height;
                v16 = (unint64_t)CGRectGetWidth(v31);
                v32.origin.x = x;
                v32.origin.y = y;
                v32.size.width = width;
                v32.size.height = height;
                v22 = CGRectGetHeight(v32);
                if (is_mul_ok(v16, (unint64_t)v22))
                  self->_containsLargeImage |= v16 * (unint64_t)v22 >= self->_pageArea >> 1;
                else
                  _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"OCR", (uint64_t)"%s: Image area would cause overflow", v17, v18, v19, v20, v21, (uint64_t)"-[PDFPageEvaluator op_Do:]");
              }
              else if (!strcmp(v9, "Form"))
              {
                v24[0] = 0;
                if (CGPDFDictionaryGetDictionary(v8, "Resources", v24))
                {
                  v10 = [PDFPageEvaluator alloc];
                  v11 = -[PDFPageEvaluator initWithParent:stream:resources:](v10, "initWithParent:stream:resources:", self, v28, v24[0]);
                  -[PDFPageEvaluator scan](v11, "scan");
                  if (v11->_containsText)
                  {
                    self->_containsText = 1;
                    -[PDFPageEvaluator stopScan:](self, "stopScan:", a3);
                  }

                }
              }
            }
          }
        }
      }
    }
  }
}

- (CGPDFContentStream)contentStream
{
  return self->_contentStream;
}

- (CGPDFRState)rstate
{
  return self->_rstate;
}

- (BOOL)containsText
{
  return self->_containsText;
}

- (void)setContainsText:(BOOL)a3
{
  self->_containsText = a3;
}

- (BOOL)containsLargeImage
{
  return self->_containsLargeImage;
}

- (void)setContainsLargeImage:(BOOL)a3
{
  self->_containsLargeImage = a3;
}

- (_QWORD)scan
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C25BE20;
  return result;
}

- (uint64_t)scan
{
    return a1 + 8;
  else
    return 0;
}

@end
