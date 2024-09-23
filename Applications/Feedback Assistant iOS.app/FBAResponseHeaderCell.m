@implementation FBAResponseHeaderCell

- (UILabel)nameLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_nameLabel));
}

- (void)setNameLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_nameLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_nameLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)dateLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_dateLabel));
}

- (void)setDateLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_dateLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_dateLabel) = (Class)a3;
  v3 = a3;

}

- (UIImageView)contactImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_contactImageView));
}

- (void)setContactImageView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_contactImageView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_contactImageView) = (Class)a3;
  v3 = a3;

}

- (UIView)roleView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleView));
}

- (void)setRoleView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleView) = (Class)a3;
  v3 = a3;

}

- (UILabel)roleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleLabel));
}

- (void)setRoleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleLabel) = (Class)a3;
  v3 = a3;

}

- (NSLayoutConstraint)leadingConstraint
{
  return (NSLayoutConstraint *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_leadingConstraint, a2);
}

- (void)setLeadingConstraint:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_leadingConstraint, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return (NSLayoutConstraint *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_topConstraint, a2);
}

- (void)setTopConstraint:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_topConstraint, a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  _TtC18Feedback_Assistant21FBAResponseHeaderCell *v7;

  v7 = self;
  v4 = a3;
  v5 = -[FBAResponseHeaderCell traitCollection](v7, "traitCollection");
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (!v4 || v6 != objc_msgSend(v4, "userInterfaceStyle"))
    sub_1000913CC();

}

- (void)awakeFromNib
{
  _TtC18Feedback_Assistant21FBAResponseHeaderCell *v2;

  v2 = self;
  sub_1000914E8();

}

- (void)configureForContentItem:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant21FBAResponseHeaderCell *v5;

  v4 = a3;
  v5 = self;
  sub_100091954(v4);

}

- (void)configureForFollowup:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant21FBAResponseHeaderCell *v5;

  v4 = a3;
  v5 = self;
  sub_100091B70(v4);

}

- (void)configureAssigneeForContentItem:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant21FBAResponseHeaderCell *v5;

  v4 = a3;
  v5 = self;
  sub_100092354(v4);

}

- (void)configureForAppleFeedbackWithFollowup:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant21FBAResponseHeaderCell *v5;

  v4 = a3;
  v5 = self;
  sub_100092660(v4);

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBAResponseHeaderCell();
  v2 = v3.receiver;
  -[FBAResponseHeaderCell prepareForReuse](&v3, "prepareForReuse");
  objc_msgSend(v2, "setSelectionStyle:", 0, v3.receiver, v3.super_class);
  objc_msgSend(v2, "setAccessoryType:", 0);
  *((_BYTE *)v2 + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleState) = 0;
  sub_100090AA4();

}

- (int64_t)selectionStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBAResponseHeaderCell();
  return -[FBAResponseHeaderCell selectionStyle](&v3, "selectionStyle");
}

- (void)setSelectionStyle:(int64_t)a3
{
  id v4;
  UIAccessibilityTraits v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBAResponseHeaderCell();
  v4 = v6.receiver;
  -[FBAResponseHeaderCell setSelectionStyle:](&v6, "setSelectionStyle:", a3);
  if (objc_msgSend(v4, "selectionStyle", v6.receiver, v6.super_class))
    v5 = UIAccessibilityTraitButton;
  else
    v5 = 0;
  objc_msgSend(v4, "setAccessibilityTraits:", v5);

}

- (_TtC18Feedback_Assistant21FBAResponseHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC18Feedback_Assistant21FBAResponseHeaderCell *)sub_100092C30(a3, (uint64_t)a4, v6);
}

- (_TtC18Feedback_Assistant21FBAResponseHeaderCell)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant21FBAResponseHeaderCell *)sub_100092D78(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_contactImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleLabel));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_leadingConstraint);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_topConstraint);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAResponseHeaderCell_roleCenteringConstraint));
}

@end
