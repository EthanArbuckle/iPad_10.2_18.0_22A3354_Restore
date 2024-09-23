@implementation NSProgress(DOCAdditions)

- (BOOL)doc_isPending
{
  double v3;

  if ((objc_msgSend(a1, "isIndeterminate") & 1) != 0)
    return 1;
  objc_msgSend(a1, "fractionCompleted");
  return v3 == 0.0;
}

@end
