@implementation CKReference(HMB)

- (id)hmbDescription
{
  uint64_t v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_msgSend(a1, "referenceAction");
  if (v2)
  {
    if (v2 == 1)
    {
      v3 = CFSTR("DeleteSelf");
    }
    else
    {
      v4 = objc_msgSend(a1, "referenceAction");
      if (v4 == *MEMORY[0x1E0C94A40])
      {
        v3 = CFSTR("Validate");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<UNKNOWN: %lu>"), objc_msgSend(a1, "referenceAction"));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v3 = CFSTR("None");
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmbDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
