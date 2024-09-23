@implementation CVAPhotoExceptionThirdPartyAPIMismatch

- (CVAPhotoExceptionThirdPartyAPIMismatch)initWithReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CVAPhotoExceptionThirdPartyAPIMismatch;
  return -[CVAPhotoExceptionBase initWithName:reason:userInfo:](&v4, sel_initWithName_reason_userInfo_, CFSTR("CVAPhotoExceptionThirdPartyAPIMismatch"), a3, 0);
}

- (id)getReasonStr
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_reason);
}

- (int)getErrorCode
{
  return -22915;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->reasonStr, 0);
}

@end
