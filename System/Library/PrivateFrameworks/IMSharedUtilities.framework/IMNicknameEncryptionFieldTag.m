@implementation IMNicknameEncryptionFieldTag

+ (id)tagWithDataRepresentation:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "_tagWithDataRepresentation:length:error:", a3, 32, a4);
}

- (BOOL)isEqualToTag:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMNicknameEncryptionFieldTag;
  return -[IMNicknameEncryptionTag isEqualToTag:error:](&v5, sel_isEqualToTag_error_, a3, a4);
}

@end
