@implementation GamesListCollectionView

- (BOOL)canBecomeFocused
{
  _TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView *v2;
  char v3;

  v2 = self;
  v3 = sub_1AB763278();

  return v3 & 1;
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)sub_1AB7632DC(self, (uint64_t)a2, (void (*)(void))sub_1AB763334);
}

- (_TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (_TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView *)sub_1AB7635C8(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView *)sub_1AB76369C(a3);
}

@end
