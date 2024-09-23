@implementation CVAPhotoExceptionMetalResourceUnavailable

- (CVAPhotoExceptionMetalResourceUnavailable)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CVAPhotoExceptionMetalResourceUnavailable;
  return -[CVAPhotoExceptionBase initWithName:reason:userInfo:](&v3, sel_initWithName_reason_userInfo_, CFSTR("CVAPhotoExceptionMetalResourceUnavailable"), CFSTR("Metal resource allocation failed!"), 0);
}

- (id)getReasonStr
{
  return CFSTR("Metal resource allocation failed!");
}

- (int)getErrorCode
{
  return -22914;
}

+ (id)throwIfNil:(id)a3
{
  id v3;
  id v5;

  v3 = a3;
  if (!v3)
  {
    v5 = (id)objc_opt_new();
    objc_exception_throw(v5);
  }
  return v3;
}

+ (id)error
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v7;

  v7 = 0;
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Metal resource allocation failed!"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "+[CVAPhotoExceptionMetalResourceUnavailable error]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAError.mm", 92, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(1, &v7, 0, 4294944382, v4);
  v5 = v7;

  return v5;
}

@end
