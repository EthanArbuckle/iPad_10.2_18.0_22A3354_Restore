@implementation SendMenuDismissingCollectionViewLayout

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return sub_18E52DAAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18E52D8F0);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  return sub_18E52E3AC(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(double, double, double, double))sub_18E52DB54);
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7ChatKit38SendMenuDismissingCollectionViewLayout *v8;
  void *v9;
  id v10;
  uint64_t v12;

  v4 = sub_18E76644C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E76641C();
  v8 = self;
  v9 = (void *)sub_18E766410();
  v10 = -[SendMenuDismissingCollectionViewLayout layoutAttributesForItemAtIndexPath:](v8, sel_layoutAttributesForItemAtIndexPath_, v9);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v3 = sub_18E76644C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E76641C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

@end
