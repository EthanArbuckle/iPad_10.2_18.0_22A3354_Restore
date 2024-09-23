@implementation CloudLibraryStatusController

- (void)cloudLibraryEnabledDidChange:(id)a3
{
  sub_21D304890((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21D30482C);
}

- (void)cloudLibraryIsLoadedDidChange:(id)a3
{
  sub_21D304890((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21D304858);
}

@end
