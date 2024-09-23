@implementation GKPickerGroupNearbyCell

+ (NSString)reuseIdentifier
{
  return (NSString *)sub_1AB4C9310((uint64_t)a1, (uint64_t)a2, (void (*)(void))static GKPickerGroupNearbyCell.reuseIdentifier.getter);
}

+ (NSString)reuseIdentifierAX
{
  return (NSString *)sub_1AB4C9310((uint64_t)a1, (uint64_t)a2, (void (*)(void))static GKPickerGroupNearbyCell.reuseIdentifierAX.getter);
}

- (UIView)iconContainer
{
  sub_1AB5C4FA4();
}

- (void)setIconContainer:(id)a3
{
  id v5;
  _TtC12GameCenterUI23GKPickerGroupNearbyCell *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5C4FF8(a3);

}

- (UILabel)badgeLabel
{
  sub_1AB5C5044();
}

- (void)setBadgeLabel:(id)a3
{
  id v5;
  _TtC12GameCenterUI23GKPickerGroupNearbyCell *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5C5098(a3);

}

- (UILabel)titleLabel
{
  sub_1AB5C50E4();
}

- (void)setTitleLabel:(id)a3
{
  id v5;
  _TtC12GameCenterUI23GKPickerGroupNearbyCell *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5C5138(a3);

}

- (void)awakeFromNib
{
  self;
  sub_1AB5C5164();
}

- (void)configureWithBadgeCount:(int64_t)a3
{
  self;
  sub_1AB5C53C4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI23GKPickerGroupNearbyCell *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5C5698((uint64_t)a3);

}

- (BOOL)isHighlighted
{
  _TtC12GameCenterUI23GKPickerGroupNearbyCell *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB5C57A0();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC12GameCenterUI23GKPickerGroupNearbyCell *v4;

  v4 = self;
  sub_1AB5C5810(a3);

}

- (UILabel)accessibilityTitleLabel
{
  sub_1AB5C5978();
}

- (void)prepareForReuse
{
  self;
  sub_1AB5C599C();
}

- (_TtC12GameCenterUI23GKPickerGroupNearbyCell)initWithFrame:(CGRect)a3
{
  _TtC12GameCenterUI23GKPickerGroupNearbyCell *result;

  GKPickerGroupNearbyCell.init(frame:)();
  return result;
}

- (_TtC12GameCenterUI23GKPickerGroupNearbyCell)initWithCoder:(id)a3
{
  id v3;
  _TtC12GameCenterUI23GKPickerGroupNearbyCell *result;

  v3 = a3;
  GKPickerGroupNearbyCell.init(coder:)();
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
