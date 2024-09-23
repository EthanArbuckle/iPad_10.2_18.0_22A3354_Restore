@implementation IDSDestinationDefaultPairedDevice

- (id)destinationURIs
{
  double v2;

  return (id)objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("__IDS_DEFAULT_PAIRED_DEVICE__"), v2);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p>"), v6, v4, self);
}

- (BOOL)isEqualToIDSDestinationDefaultPairedDevice:(id)a3
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  IDSDestinationDefaultPairedDevice *v4;
  const char *v5;
  double v6;
  char isEqualToIDSDestinationDefaultPairedDevice;

  v4 = (IDSDestinationDefaultPairedDevice *)a3;
  if (self == v4)
  {
    isEqualToIDSDestinationDefaultPairedDevice = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      isEqualToIDSDestinationDefaultPairedDevice = objc_msgSend_isEqualToIDSDestinationDefaultPairedDevice_(self, v5, (uint64_t)v4, v6);
    else
      isEqualToIDSDestinationDefaultPairedDevice = 0;
  }

  return isEqualToIDSDestinationDefaultPairedDevice;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;

  return objc_msgSend_hash(CFSTR("__IDS_DEFAULT_PAIRED_DEVICE__"), a2, v2, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
