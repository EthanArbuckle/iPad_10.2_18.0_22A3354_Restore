@implementation CKLStatusFilter

- (BOOL)matchesEvent:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  char hasSuffix;

  v3 = a3;
  if (objc_msgSend_type(v3, v4, v5) == 2560)
  {
    objc_msgSend_processImagePath(v3, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    hasSuffix = objc_msgSend_hasSuffix_(v8, v9, (uint64_t)CFSTR("cloudd"));

  }
  else
  {
    hasSuffix = 0;
  }

  return hasSuffix;
}

@end
