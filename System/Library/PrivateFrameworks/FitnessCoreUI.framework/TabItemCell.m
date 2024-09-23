@implementation TabItemCell

- (BOOL)isHighlighted
{
  return sub_23C03B960(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TabItemCell();
  v4 = v6.receiver;
  -[TabItemCell setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (objc_msgSend(v4, sel_isHighlighted, v6.receiver, v6.super_class)
    && !objc_msgSend(v4, sel_isSelected))
  {
    v5 = 0.8;
  }
  else
  {
    v5 = 1.0;
  }
  objc_msgSend(v4, sel_setAlpha_, v5);

}

- (BOOL)isSelected
{
  return sub_23C03B960(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TabItemCell();
  v4 = v5.receiver;
  -[TabItemCell setSelected:](&v5, sel_setSelected_, v3);
  sub_23C03C8AC((char)objc_msgSend(v4, sel_isSelected, v5.receiver, v5.super_class));

}

- (_TtC13FitnessCoreUI11TabItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC13FitnessCoreUI11TabItemCell *)TabItemCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FitnessCoreUI11TabItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s13FitnessCoreUI11TabItemCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)prepareForReuse
{
  _TtC13FitnessCoreUI11TabItemCell *v2;

  v2 = self;
  sub_23C03C2F8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel));
  sub_23C03CEB4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem), *(uint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem), *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem), *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem), *(uint64_t *)((char *)&self->super.super.super._animationInfo+ OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem), *(uint64_t *)((char *)&self->super.super.super._swiftAnimationInfo+ OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem), *(uint64_t *)((char *)&self->super.super.super._traitChangeRegistry+ OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem), *(uint64_t *)((char *)&self->super.super.super._layerRetained+ OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem), *(uint64_t *)((char *)&self->super.super.super._subviewCache
               + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackViewTrailingConstraint));
}

@end
