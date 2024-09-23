@implementation MEDecodeContext

- (MEDecodeContext)initWithDecodeReason:(int64_t)a3
{
  MEDecodeContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MEDecodeContext;
  result = -[MEDecodeContext init](&v5, sel_init);
  if (result)
    result->_decodeReason = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MEDecodeContext decodeReason](self, "decodeReason"), CFSTR("EFPropertyKey_decodeReason"));

}

- (MEDecodeContext)initWithCoder:(id)a3
{
  id v4;
  MEDecodeContext *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MEDecodeContext;
  v5 = -[MEDecodeContext init](&v7, sel_init);
  if (v5)
    v5->_decodeReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_decodeReason"));

  return v5;
}

- (int64_t)decodeReason
{
  return self->_decodeReason;
}

- (void)setDecodeReason:(int64_t)a3
{
  self->_decodeReason = a3;
}

@end
