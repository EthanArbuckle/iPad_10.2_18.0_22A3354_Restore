@implementation ABPhoneNumber

- (void)dealloc
{
  char *phoneNumberBytes;
  objc_super v4;

  phoneNumberBytes = self->_phoneNumberBytes;
  if (phoneNumberBytes)
    free(phoneNumberBytes);

  v4.receiver = self;
  v4.super_class = (Class)ABPhoneNumber;
  -[ABPhoneNumber dealloc](&v4, sel_dealloc);
}

- (ABPhoneNumber)initWithPhoneNumberString:(id)a3 countryCode:(id)a4
{
  char *v6;
  ABPhoneNumber *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ABPhoneNumber;
  v6 = -[ABPhoneNumber init](&v10, sel_init);
  v7 = (ABPhoneNumber *)v6;
  if (v6)
  {
    v8 = ABCreateNormalizedPhoneNumberAndDecompose(a3, (uint64_t)a4, 1, (uint64_t *)v6 + 10, v6 + 8);
    v7->_phoneNumberBytes = (char *)v8;
    if (v8)
    {
      v7->_originalStringValue = (NSString *)objc_msgSend(a3, "copy");
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- ($2A2B7EFAB7F70232912E632107C7A237)decomposedPhoneNumberPointer
{
  return ($2A2B7EFAB7F70232912E632107C7A237 *)&self->_decomposedPhoneNumber;
}

- (NSString)lastFour
{
  return self->_lastFour;
}

- (char)normalizedPhoneChars
{
  return self->_phoneNumberBytes;
}

- (NSString)originalStringValue
{
  return self->_originalStringValue;
}

@end
