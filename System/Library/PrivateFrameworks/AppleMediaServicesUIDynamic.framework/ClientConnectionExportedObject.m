@implementation ClientConnectionExportedObject

- (void)handleWithAuthenticateRequest:(id)a3 completion:(id)a4
{
  sub_1B9D75330((uint64_t)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_1B9D73CB4);
}

- (void)handleWithDialogRequest:(id)a3 completion:(id)a4
{
  sub_1B9D75330((uint64_t)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_1B9D74324);
}

- (void)handleWithEngagementRequest:(id)a3 completion:(id)a4
{
  sub_1B9D75330((uint64_t)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_1B9D749E8);
}

@end
