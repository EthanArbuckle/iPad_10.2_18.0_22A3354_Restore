@implementation CoreDataMessageStore

- (void)willResetSync:(id)a3
{
  sub_23B3497A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23B342064);
}

- (void)didResetSync:(id)a3
{
  sub_23B3497A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23B342E24);
}

- (void)storeMergedChanges:(id)a3
{
  sub_23B3497A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23B34720C);
}

- (void)storeDidSave:(id)a3
{
  sub_23B3497A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23B348FF0);
}

@end
