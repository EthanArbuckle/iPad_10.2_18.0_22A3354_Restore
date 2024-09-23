@implementation AutoFavoritesService

- (void)prepareFavorites:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  sub_1D5CC0D0C((uint64_t)sub_1D5B54D5C, v4);
  swift_release();
  swift_release();
}

@end
