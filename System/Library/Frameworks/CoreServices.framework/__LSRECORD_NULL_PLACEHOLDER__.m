@implementation __LSRECORD_NULL_PLACEHOLDER__

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__LSRECORD_NULL_PLACEHOLDER__)initWithCoder:(id)a3
{
  __LSRECORD_NULL_PLACEHOLDER__ *v4;

  LaunchServices::Record::getNullPlaceholder((LaunchServices::Record *)self);
  v4 = (__LSRECORD_NULL_PLACEHOLDER__ *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  return CFSTR("(null)");
}

- (id)debugDescription
{
  return CFSTR("(LSRecord.null)");
}

@end
