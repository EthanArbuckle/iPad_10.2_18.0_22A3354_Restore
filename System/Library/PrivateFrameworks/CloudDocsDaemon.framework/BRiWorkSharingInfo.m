@implementation BRiWorkSharingInfo

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", self->_options, CFSTR("options"));
}

- (BRiWorkSharingInfo)initWithCoder:(id)a3
{
  id v4;
  BRiWorkSharingInfo *v5;

  v4 = a3;
  v5 = -[BRiWorkSharingInfo init](self, "init");
  if (v5)
    v5->_options = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("options"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (char)options
{
  return self->_options;
}

@end
