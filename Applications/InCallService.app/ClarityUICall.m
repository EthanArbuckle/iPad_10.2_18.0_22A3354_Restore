@implementation ClarityUICall

- (void)updateCallStatusWithNotification:(id)a3
{
  sub_10019B650((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_10019B5B8);
}

- (void)updateIsEmergencyWithNotification:(id)a3
{
  sub_10019B650((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_10019B604);
}

@end
