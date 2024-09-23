@implementation CLSManagedBusinessItem

+ (NSString)entityName
{
  return (NSString *)CFSTR("BusinessItem");
}

- (int64_t)venueCapacity
{
  void *v2;
  void *v3;
  int64_t v4;

  -[CLSManagedBusinessItem venueCapacityAsNumber](self, "venueCapacityAsNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)setVenueCapacity:(int64_t)a3
{
  id v4;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CLSManagedBusinessItem setVenueCapacityAsNumber:](self, "setVenueCapacityAsNumber:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CLSManagedBusinessItem setVenueCapacityAsNumber:](self, "setVenueCapacityAsNumber:", v4);

  }
}

@end
