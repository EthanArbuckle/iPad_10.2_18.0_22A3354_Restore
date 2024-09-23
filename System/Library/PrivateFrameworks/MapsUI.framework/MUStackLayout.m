@implementation MUStackLayout

- (MUStackLayout)initWithContainer:(id)a3 axis:(int64_t)a4
{
  id v6;
  MUStackLayoutInternal *v7;
  MUStackLayout *v8;
  MUStackLayout *v9;
  objc_super v11;

  v6 = a3;
  v7 = -[MUStackLayoutInternal initWithContainer:axis:]([MUStackLayoutInternal alloc], "initWithContainer:axis:", v6, a4);

  v11.receiver = self;
  v11.super_class = (Class)MUStackLayout;
  v8 = -[MUConstraintLayout initWithInternal:](&v11, sel_initWithInternal_, v7);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_internal, v7);

  return v9;
}

- (MULayoutItem)container
{
  return -[MUStackLayoutInternal container](self->_internal, "container");
}

- (void)setContainer:(id)a3
{
  -[MUStackLayoutInternal setContainer:](self->_internal, "setContainer:", a3);
}

- (int64_t)axis
{
  return -[MUStackLayoutInternal axis](self->_internal, "axis");
}

- (void)setAxis:(int64_t)a3
{
  -[MUStackLayoutInternal setAxis:](self->_internal, "setAxis:", a3);
}

- (int64_t)distribution
{
  return -[MUStackLayoutInternal distribution](self->_internal, "distribution");
}

- (void)setDistribution:(int64_t)a3
{
  -[MUStackLayoutInternal setDistribution:](self->_internal, "setDistribution:", a3);
}

- (BOOL)distributionBoundsContent
{
  return -[MUStackLayoutInternal distributionBoundsContent](self->_internal, "distributionBoundsContent");
}

- (void)setDistributionBoundsContent:(BOOL)a3
{
  -[MUStackLayoutInternal setDistributionBoundsContent:](self->_internal, "setDistributionBoundsContent:", a3);
}

- (float)distributionFittingSizePriority
{
  float result;

  -[MUStackLayoutInternal distributionFittingSizePriority](self->_internal, "distributionFittingSizePriority");
  return result;
}

- (void)setDistributionFittingSizePriority:(float)a3
{
  -[MUStackLayoutInternal setDistributionFittingSizePriority:](self->_internal, "setDistributionFittingSizePriority:");
}

- (int64_t)alignment
{
  return -[MUStackLayoutInternal alignment](self->_internal, "alignment");
}

- (void)setAlignment:(int64_t)a3
{
  -[MUStackLayoutInternal setAlignment:](self->_internal, "setAlignment:", a3);
}

- (BOOL)alignmentBoundsContent
{
  return -[MUStackLayoutInternal alignmentBoundsContent](self->_internal, "alignmentBoundsContent");
}

- (void)setAlignmentBoundsContent:(BOOL)a3
{
  -[MUStackLayoutInternal setAlignmentBoundsContent:](self->_internal, "setAlignmentBoundsContent:", a3);
}

- (float)alignmentFittingSizePriority
{
  float result;

  -[MUStackLayoutInternal alignmentFittingSizePriority](self->_internal, "alignmentFittingSizePriority");
  return result;
}

- (void)setAlignmentFittingSizePriority:(float)a3
{
  -[MUStackLayoutInternal setAlignmentFittingSizePriority:](self->_internal, "setAlignmentFittingSizePriority:");
}

- (double)spacing
{
  double result;

  -[MUStackLayoutInternal spacing](self->_internal, "spacing");
  return result;
}

- (void)setSpacing:(double)a3
{
  -[MUStackLayoutInternal setSpacing:](self->_internal, "setSpacing:", a3);
}

- (NSDirectionalEdgeInsets)insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[MUStackLayoutInternal insets](self->_internal, "insets");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
  -[MUStackLayoutInternal setInsets:](self->_internal, "setInsets:", a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (NSArray)arrangedLayoutItems
{
  return -[MUStackLayoutInternal arrangedLayoutItems](self->_internal, "arrangedLayoutItems");
}

- (void)setArrangedLayoutItems:(id)a3
{
  -[MUStackLayoutInternal setArrangedLayoutItems:](self->_internal, "setArrangedLayoutItems:", a3);
}

- (void)addArrangedLayoutItem:(id)a3
{
  -[MUStackLayoutInternal addArrangedLayoutItem:](self->_internal, "addArrangedLayoutItem:", a3);
}

- (void)removeArrangedLayoutItem:(id)a3
{
  -[MUStackLayoutInternal removeArrangedLayoutItem:](self->_internal, "removeArrangedLayoutItem:", a3);
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  -[MUStackLayoutInternal paddingForArrangedLayoutItem:](self->_internal, "paddingForArrangedLayoutItem:", a3);
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4
{
  -[MUStackLayoutInternal setPadding:forArrangedLayoutItem:](self->_internal, "setPadding:forArrangedLayoutItem:", a4, a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  double v3;
  double v4;
  UIOffset result;

  -[MUStackLayoutInternal offsetForArrangedLayoutItem:](self->_internal, "offsetForArrangedLayoutItem:", a3);
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4
{
  -[MUStackLayoutInternal setOffset:forArrangedLayoutItem:](self->_internal, "setOffset:forArrangedLayoutItem:", a4, a3.horizontal, a3.vertical);
}

- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3
{
  return -[MUStackLayoutInternal hasAlignmentForArrangedLayoutItem:](self->_internal, "hasAlignmentForArrangedLayoutItem:", a3);
}

- (void)disableAlignmentForArrangedLayoutItem:(id)a3
{
  -[MUStackLayoutInternal disableAlignmentForArrangedLayoutItem:](self->_internal, "disableAlignmentForArrangedLayoutItem:", a3);
}

- (void)resetAlignmentForArrangedLayoutItem:(id)a3
{
  -[MUStackLayoutInternal resetAlignmentForArrangedLayoutItem:](self->_internal, "resetAlignmentForArrangedLayoutItem:", a3);
}

- (int64_t)alignmentForArrangedLayoutItem:(id)a3
{
  return -[MUStackLayoutInternal alignmentForArrangedLayoutItem:](self->_internal, "alignmentForArrangedLayoutItem:", a3);
}

- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  -[MUStackLayoutInternal setAlignment:forArrangedLayoutItem:](self->_internal, "setAlignment:forArrangedLayoutItem:", a3, a4);
}

- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  return -[MUStackLayoutInternal alignmentBoundsContentForArrangedLayoutItem:](self->_internal, "alignmentBoundsContentForArrangedLayoutItem:", a3);
}

- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  -[MUStackLayoutInternal setAlignmentBoundsContent:forArrangedLayoutItem:](self->_internal, "setAlignmentBoundsContent:forArrangedLayoutItem:", a3, a4);
}

- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  float result;

  -[MUStackLayoutInternal alignmentFittingSizePriorityForArrangedLayoutItem:](self->_internal, "alignmentFittingSizePriorityForArrangedLayoutItem:", a3);
  return result;
}

- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  -[MUStackLayoutInternal setAlignmentFittingSizePriority:forArrangedLayoutItem:](self->_internal, "setAlignmentFittingSizePriority:forArrangedLayoutItem:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
