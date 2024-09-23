@implementation IMNicknameEncryptionRecordTag

+ (id)tagWithDataRepresentation:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "_tagWithDataRepresentation:length:error:", a3, 16, a4);
}

+ (id)tagWithStringRepresentation:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__tagWithStringRepresentation_length_error_);
}

- (BOOL)isEqualToTag:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMNicknameEncryptionRecordTag;
  return -[IMNicknameEncryptionTag isEqualToTag:error:](&v5, sel_isEqualToTag_error_, a3, a4);
}

@end
