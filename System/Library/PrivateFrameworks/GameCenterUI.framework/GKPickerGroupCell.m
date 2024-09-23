@implementation GKPickerGroupCell

+ (NSString)reuseIdentifier
{
  return (NSString *)sub_1AB4C9310((uint64_t)a1, (uint64_t)a2, (void (*)(void))static GKPickerGroupCell.reuseIdentifier.getter);
}

+ (NSString)reuseIdentifierAX
{
  return (NSString *)sub_1AB4C9310((uint64_t)a1, (uint64_t)a2, (void (*)(void))static GKPickerGroupCell.reuseIdentifierAX.getter);
}

- (UIView)container
{
  sub_1AB4C936C();
}

- (void)setContainer:(id)a3
{
  id v4;
  _TtC12GameCenterUI17GKPickerGroupCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4C93C0();

}

- (UIImageView)messageIcon
{
  sub_1AB4C9408();
}

- (void)setMessageIcon:(id)a3
{
  id v4;
  _TtC12GameCenterUI17GKPickerGroupCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4C945C();

}

- (UIView)iconContainer
{
  sub_1AB4C94A4();
}

- (void)setIconContainer:(id)a3
{
  id v4;
  _TtC12GameCenterUI17GKPickerGroupCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4C94F8();

}

- (UIView)ringView
{
  sub_1AB4C9540();
}

- (void)setRingView:(id)a3
{
  id v4;
  _TtC12GameCenterUI17GKPickerGroupCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4C9594();

}

- (UILabel)titleLabel
{
  sub_1AB4C95DC();
}

- (void)setTitleLabel:(id)a3
{
  id v4;
  _TtC12GameCenterUI17GKPickerGroupCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4C9630();

}

- (UILabel)subtitleLabel
{
  sub_1AB4C9678();
}

- (void)setSubtitleLabel:(id)a3
{
  id v4;
  _TtC12GameCenterUI17GKPickerGroupCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4C96CC();

}

- (UIView)nearbyIconContainer
{
  sub_1AB4C9714();
}

- (void)setNearbyIconContainer:(id)a3
{
  id v4;
  _TtC12GameCenterUI17GKPickerGroupCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4C9768();

}

- (UIVisualEffectView)nearbyIconVisualEffectView
{
  sub_1AB4C97B0();
}

- (void)setNearbyIconVisualEffectView:(id)a3
{
  id v4;
  _TtC12GameCenterUI17GKPickerGroupCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4C9804();

}

- (UIImageView)nearbyIcon
{
  sub_1AB4C984C();
}

- (void)setNearbyIcon:(id)a3
{
  id v4;
  _TtC12GameCenterUI17GKPickerGroupCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4C98A0();

}

- (_TtP12GameCenterUI22GKPickerGroupCellProxy_)groupCellDelegate
{
  sub_1AB4C9918();
}

- (void)setGroupCellDelegate:(id)a3
{
  _TtC12GameCenterUI17GKPickerGroupCell *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AB4C99A4();

}

- (void)awakeFromNib
{
  self;
  sub_1AB4C9AE0();
}

- (void)dealloc
{
  _TtC12GameCenterUI17GKPickerGroupCell *v2;

  v2 = self;
  GKPickerGroupCell.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17GKPickerGroupCell_longPressRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17GKPickerGroupCell_playerGroupView));
  swift_bridgeObjectRelease();
  sub_1AB4CB5BC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI17GKPickerGroupCell_groupCellDelegate);
}

- (void)configureWithPlayers:(id)a3 title:(id)a4 subtitle:(id)a5 messagesGroupIdentifier:(id)a6 source:(int64_t)a7 playerSelectionProxy:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_1AB4797FC();
  v11 = sub_1AB7DB0EC();
  v12 = sub_1AB7DAF90();
  v14 = v13;
  if (a5)
  {
    sub_1AB7DAF90();
    if (!a6)
      goto LABEL_5;
  }
  else if (!a6)
  {
LABEL_5:
    self;
    swift_unknownObjectRetain();
    sub_1AB4CA16C(v11, v12, v14);
  }
  sub_1AB7DAF90();
  goto LABEL_5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI17GKPickerGroupCell *v6;

  v5 = a3;
  v6 = self;
  sub_1AB4CA684((uint64_t)a3);

}

- (void)layoutSubviews
{
  self;
  sub_1AB4CA754();
}

- (BOOL)isHighlighted
{
  _TtC12GameCenterUI17GKPickerGroupCell *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB4CAB38((SEL *)&selRef_isHighlighted);

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC12GameCenterUI17GKPickerGroupCell *v3;

  v3 = self;
  sub_1AB4CA8C8();

}

- (void)handleLongPressWithSender:(id)a3
{
  id v4;
  _TtC12GameCenterUI17GKPickerGroupCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4CAA34(v4);

}

- (BOOL)isSelected
{
  _TtC12GameCenterUI17GKPickerGroupCell *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB4CAB38((SEL *)&selRef_isSelected);

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  self;
  sub_1AB4CABB0();
}

- (UILabel)accessibilityTitleLabel
{
  sub_1AB4CAC04();
}

- (void)prepareForReuse
{
  self;
  sub_1AB4CAC28();
}

- (_TtC12GameCenterUI17GKPickerGroupCell)initWithFrame:(CGRect)a3
{
  _TtC12GameCenterUI17GKPickerGroupCell *result;

  GKPickerGroupCell.init(frame:)();
  return result;
}

- (_TtC12GameCenterUI17GKPickerGroupCell)initWithCoder:(id)a3
{
  id v3;
  _TtC12GameCenterUI17GKPickerGroupCell *result;

  v3 = a3;
  GKPickerGroupCell.init(coder:)();
  return result;
}

@end
