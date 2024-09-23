@implementation CNPostalAddress(CalLocalizedAddress)

- (uint64_t)formattedAddressString
{
  return objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", a1, 0);
}

- (id)formattedAddressStrings
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("\n"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (CalLocation)CalLocation
{
  CalLocation *v2;
  void *v3;

  v2 = objc_alloc_init(CalLocation);
  objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", a1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalLocation setAddress:](v2, "setAddress:", v3);

  -[CalLocation setType:](v2, "setType:", 5);
  return v2;
}

@end
