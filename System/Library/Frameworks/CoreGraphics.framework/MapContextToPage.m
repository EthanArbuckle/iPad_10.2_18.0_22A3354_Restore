@implementation MapContextToPage

void __MapContextToPage_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CPAnnotation *v5;
  CPAnnotation *v6;

  if (CGPDFAnnotationGetType(a3) == 25 || CGPDFAnnotationGetType(a3) == 4)
  {
    v5 = -[CPAnnotation initWithCGPDFAnnotation:]([CPAnnotation alloc], "initWithCGPDFAnnotation:", a3);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 32), "addAnnotation:", v5);

    }
  }
}

@end
