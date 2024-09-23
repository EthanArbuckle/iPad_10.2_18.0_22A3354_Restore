@implementation WKSecureCodingArchivingDelegate

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  char isKindOfClass;
  CFTypeID v7;
  WKSecureCodingURLWrapper *v9;
  char v10;
  char v11;
  char v12;
  char v13;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a4 && (isKindOfClass & 1) != 0 && self->transformURLs)
  {
    v9 = -[WKSecureCodingURLWrapper initWithURL:]([WKSecureCodingURLWrapper alloc], "initWithURL:", a4);
  }
  else
  {
    if (self->rewriteMutableArray)
    {
      objc_opt_class();
      v10 = objc_opt_isKindOfClass();
      if (a4)
      {
        if ((v10 & 1) != 0)
          goto LABEL_23;
      }
    }
    if (self->rewriteMutableData && (objc_opt_class(), v11 = objc_opt_isKindOfClass(), a4) && (v11 & 1) != 0
      || self->rewriteMutableDictionary && (objc_opt_class(), v12 = objc_opt_isKindOfClass(), a4) && (v12 & 1) != 0
      || self->rewriteMutableString && (objc_opt_class(), v13 = objc_opt_isKindOfClass(), a4) && (v13 & 1) != 0)
    {
LABEL_23:
      v9 = (WKSecureCodingURLWrapper *)objc_msgSend(a4, "copy");
    }
    else
    {
      v7 = CFGetTypeID(a4);
      if (v7 != CGColorGetTypeID())
        return a4;
      v9 = -[WKSecureCodingCGColorWrapper initWithCGColor:]([WKSecureCodingCGColorWrapper alloc], "initWithCGColor:", a4);
    }
  }
  return (id)(id)CFMakeCollectable(v9);
}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  void *v6;
  void *v7;

  objc_opt_class();
  if (!((a4 == 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    v6 = (void *)objc_msgSend(a4, "wrappedURL");
    v7 = v6;
    if (!v6)
    {
LABEL_6:
      CFRelease(a4);
      return v7;
    }
LABEL_5:
    CFRetain(v6);
    goto LABEL_6;
  }
  objc_opt_class();
  if (!((a4 == 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    v6 = (void *)objc_msgSend(a4, "wrappedColor");
    v7 = v6;
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  return a4;
}

- (WKSecureCodingArchivingDelegate)init
{
  WKSecureCodingArchivingDelegate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKSecureCodingArchivingDelegate;
  result = -[WKSecureCodingArchivingDelegate init](&v3, sel_init);
  if (result)
  {
    *(_DWORD *)&result->rewriteMutableArray = 0;
    result->transformURLs = 1;
  }
  return result;
}

- (void)setRewriteMutableDictionary:(BOOL)a3
{
  self->rewriteMutableDictionary = a3;
}

- (BOOL)rewriteMutableArray
{
  return self->rewriteMutableArray;
}

- (void)setRewriteMutableArray:(BOOL)a3
{
  self->rewriteMutableArray = a3;
}

- (BOOL)rewriteMutableData
{
  return self->rewriteMutableData;
}

- (void)setRewriteMutableData:(BOOL)a3
{
  self->rewriteMutableData = a3;
}

- (BOOL)rewriteMutableDictionary
{
  return self->rewriteMutableDictionary;
}

- (BOOL)rewriteMutableString
{
  return self->rewriteMutableString;
}

- (void)setRewriteMutableString:(BOOL)a3
{
  self->rewriteMutableString = a3;
}

- (BOOL)transformURLs
{
  return self->transformURLs;
}

- (void)setTransformURLs:(BOOL)a3
{
  self->transformURLs = a3;
}

@end
