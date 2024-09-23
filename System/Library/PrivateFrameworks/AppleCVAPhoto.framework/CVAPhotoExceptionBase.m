@implementation CVAPhotoExceptionBase

- (CVAPhotoExceptionBase)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CVAPhotoExceptionBase;
  return -[CVAPhotoExceptionBase initWithName:reason:userInfo:](&v6, sel_initWithName_reason_userInfo_, a3, a4, a5);
}

- (id)error
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v10 = 0;
  v3 = -[CVAPhotoExceptionBase getErrorCode](self, "getErrorCode");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[CVAPhotoExceptionBase getReasonStr](self, "getReasonStr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAPhotoExceptionBase error]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAError.mm", 55, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(1, &v10, 0, v3, v7);
  v8 = v10;

  return v8;
}

- (void)log
{
  void *v3;
  id v4;

  -[CVAPhotoExceptionBase getReasonStr](self, "getReasonStr");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CVAPhotoExceptionBase callStackSymbols](self, "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR(" > > > CVAPhotoException* - %@ stack: %@"), v4, v3);

}

- (id)getReasonStr
{
  return 0;
}

- (int)getErrorCode
{
  return 0;
}

@end
