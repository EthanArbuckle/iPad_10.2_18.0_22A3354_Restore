@implementation ICGatherInterestingSubviewsFromViewInArray

void __ICGatherInterestingSubviewsFromViewInArray_block_invoke()
{
  void *v0;
  Class v1;
  Class v2;
  Class v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = NSClassFromString(CFSTR("PDFView"));
  v2 = NSClassFromString(CFSTR("PDFDocumentView"));
  v3 = NSClassFromString(CFSTR("PaperKit.PaperDocumentView"));
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, NSClassFromString(CFSTR("PaperKit.AnyCanvas")), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)ICGatherInterestingSubviewsFromViewInArray_classes;
  ICGatherInterestingSubviewsFromViewInArray_classes = v4;

}

@end
