@implementation SFCapsuleNavigationBarLabelLayoutInfo

- (NSLayoutConstraint)constraintForHorizontalAlignment
{
  return self->_constraintForHorizontalAlignment;
}

- (UIView)view
{
  return self->_view;
}

- (void)setConstraintForHorizontalAlignment:(id)a3
{
  objc_storeStrong((id *)&self->_constraintForHorizontalAlignment, a3);
}

- (SFCapsuleNavigationBarLabelLayoutInfo)initWithView:(id)a3
{
  id v5;
  SFCapsuleNavigationBarLabelLayoutInfo *v6;
  SFCapsuleNavigationBarLabelLayoutInfo *v7;
  SFCapsuleNavigationBarLabelLayoutInfo *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCapsuleNavigationBarLabelLayoutInfo;
  v6 = -[SFCapsuleNavigationBarLabelLayoutInfo init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_view, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintForHorizontalAlignment, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
