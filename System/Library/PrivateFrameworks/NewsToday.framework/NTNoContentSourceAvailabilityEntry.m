@implementation NTNoContentSourceAvailabilityEntry

- (NTNoContentSourceAvailabilityEntry)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTNoContentSourceAvailabilityEntry;
  return -[NTNoContentSourceAvailabilityEntry init](&v3, sel_init);
}

- (Class)todayResultsFetchDescriptorClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)availabilityChangedNotificationBlock
{
  return self->availabilityChangedNotificationBlock;
}

- (void)setAvailabilityChangedNotificationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->availabilityChangedNotificationBlock, 0);
}

@end
