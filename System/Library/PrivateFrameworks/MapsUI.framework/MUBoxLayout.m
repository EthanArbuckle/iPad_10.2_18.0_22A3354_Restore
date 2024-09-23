@implementation MUBoxLayout

- (MUBoxLayout)initWithContainer:(id)a3
{
  id v4;
  MUBoxLayoutInternal *v5;
  MUBoxLayout *v6;
  MUBoxLayout *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[MUBoxLayoutInternal initWithContainer:]([MUBoxLayoutInternal alloc], "initWithContainer:", v4);

  v9.receiver = self;
  v9.super_class = (Class)MUBoxLayout;
  v6 = -[MUConstraintLayout initWithInternal:](&v9, sel_initWithInternal_, v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internal, v5);

  return v7;
}

- (MULayoutItem)container
{
  return -[MUBoxLayoutInternal container](self->_internal, "container");
}

- (void)setContainer:(id)a3
{
  -[MUBoxLayoutInternal setContainer:](self->_internal, "setContainer:", a3);
}

- (int64_t)verticalAlignment
{
  return -[MUBoxLayoutInternal verticalAlignment](self->_internal, "verticalAlignment");
}

- (void)setVerticalAlignment:(int64_t)a3
{
  -[MUBoxLayoutInternal setVerticalAlignment:](self->_internal, "setVerticalAlignment:", a3);
}

- (BOOL)verticalAlignmentBoundsContent
{
  return -[MUBoxLayoutInternal verticalAlignmentBoundsContent](self->_internal, "verticalAlignmentBoundsContent");
}

- (void)setVerticalAlignmentBoundsContent:(BOOL)a3
{
  -[MUBoxLayoutInternal setVerticalAlignmentBoundsContent:](self->_internal, "setVerticalAlignmentBoundsContent:", a3);
}

- (float)verticalAlignmentFittingSizePriority
{
  float result;

  -[MUBoxLayoutInternal verticalAlignmentFittingSizePriority](self->_internal, "verticalAlignmentFittingSizePriority");
  return result;
}

- (void)setVerticalAlignmentFittingSizePriority:(float)a3
{
  -[MUBoxLayoutInternal setVerticalAlignmentFittingSizePriority:](self->_internal, "setVerticalAlignmentFittingSizePriority:");
}

- (int64_t)horizontalAlignment
{
  return -[MUBoxLayoutInternal horizontalAlignment](self->_internal, "horizontalAlignment");
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  -[MUBoxLayoutInternal setHorizontalAlignment:](self->_internal, "setHorizontalAlignment:", a3);
}

- (BOOL)horizontalAlignmentBoundsContent
{
  return -[MUBoxLayoutInternal horizontalAlignmentBoundsContent](self->_internal, "horizontalAlignmentBoundsContent");
}

- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3
{
  -[MUBoxLayoutInternal setHorizontalAlignmentBoundsContent:](self->_internal, "setHorizontalAlignmentBoundsContent:", a3);
}

- (float)horizontalAlignmentFittingSizePriority
{
  float result;

  -[MUBoxLayoutInternal horizontalAlignmentFittingSizePriority](self->_internal, "horizontalAlignmentFittingSizePriority");
  return result;
}

- (void)setHorizontalAlignmentFittingSizePriority:(float)a3
{
  -[MUBoxLayoutInternal setHorizontalAlignmentFittingSizePriority:](self->_internal, "setHorizontalAlignmentFittingSizePriority:");
}

- (NSDirectionalEdgeInsets)insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[MUBoxLayoutInternal insets](self->_internal, "insets");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
  -[MUBoxLayoutInternal setInsets:](self->_internal, "setInsets:", a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (NSArray)arrangedLayoutItems
{
  return -[MUBoxLayoutInternal arrangedLayoutItems](self->_internal, "arrangedLayoutItems");
}

- (void)setArrangedLayoutItems:(id)a3
{
  -[MUBoxLayoutInternal setArrangedLayoutItems:](self->_internal, "setArrangedLayoutItems:", a3);
}

- (void)addArrangedLayoutItem:(id)a3
{
  -[MUBoxLayoutInternal addArrangedLayoutItem:](self->_internal, "addArrangedLayoutItem:", a3);
}

- (void)removeArrangedLayoutItem:(id)a3
{
  -[MUBoxLayoutInternal removeArrangedLayoutItem:](self->_internal, "removeArrangedLayoutItem:", a3);
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  -[MUBoxLayoutInternal paddingForArrangedLayoutItem:](self->_internal, "paddingForArrangedLayoutItem:", a3);
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4
{
  -[MUBoxLayoutInternal setPadding:forArrangedLayoutItem:](self->_internal, "setPadding:forArrangedLayoutItem:", a4, a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  double v3;
  double v4;
  UIOffset result;

  -[MUBoxLayoutInternal offsetForArrangedLayoutItem:](self->_internal, "offsetForArrangedLayoutItem:", a3);
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4
{
  -[MUBoxLayoutInternal setOffset:forArrangedLayoutItem:](self->_internal, "setOffset:forArrangedLayoutItem:", a4, a3.horizontal, a3.vertical);
}

- (BOOL)hasVerticalAlignmentForArrangedLayoutItem:(id)a3
{
  return -[MUBoxLayoutInternal hasVerticalAlignmentForArrangedLayoutItem:](self->_internal, "hasVerticalAlignmentForArrangedLayoutItem:", a3);
}

- (void)disableVerticalAlignmentForArrangedLayoutItem:(id)a3
{
  -[MUBoxLayoutInternal disableVerticalAlignmentForArrangedLayoutItem:](self->_internal, "disableVerticalAlignmentForArrangedLayoutItem:", a3);
}

- (void)resetVerticalAlignmentForArrangedLayoutItem:(id)a3
{
  -[MUBoxLayoutInternal resetVerticalAlignmentForArrangedLayoutItem:](self->_internal, "resetVerticalAlignmentForArrangedLayoutItem:", a3);
}

- (int64_t)verticalAlignmentForArrangedLayoutItem:(id)a3
{
  return -[MUBoxLayoutInternal verticalAlignmentForArrangedLayoutItem:](self->_internal, "verticalAlignmentForArrangedLayoutItem:", a3);
}

- (void)setVerticalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  -[MUBoxLayoutInternal setVerticalAlignment:forArrangedLayoutItem:](self->_internal, "setVerticalAlignment:forArrangedLayoutItem:", a3, a4);
}

- (BOOL)verticalAlignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  return -[MUBoxLayoutInternal verticalAlignmentBoundsContentForArrangedLayoutItem:](self->_internal, "verticalAlignmentBoundsContentForArrangedLayoutItem:", a3);
}

- (void)setVerticalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  -[MUBoxLayoutInternal setVerticalAlignmentBoundsContent:forArrangedLayoutItem:](self->_internal, "setVerticalAlignmentBoundsContent:forArrangedLayoutItem:", a3, a4);
}

- (float)verticalFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  float result;

  -[MUBoxLayoutInternal verticalFittingSizePriorityForArrangedLayoutItem:](self->_internal, "verticalFittingSizePriorityForArrangedLayoutItem:", a3);
  return result;
}

- (void)setVerticalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  -[MUBoxLayoutInternal setVerticalFittingSizePriority:forArrangedLayoutItem:](self->_internal, "setVerticalFittingSizePriority:forArrangedLayoutItem:", a4);
}

- (BOOL)hasHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
  return -[MUBoxLayoutInternal hasHorizontalAlignmentForArrangedLayoutItem:](self->_internal, "hasHorizontalAlignmentForArrangedLayoutItem:", a3);
}

- (void)disableHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
  -[MUBoxLayoutInternal disableHorizontalAlignmentForArrangedLayoutItem:](self->_internal, "disableHorizontalAlignmentForArrangedLayoutItem:", a3);
}

- (void)resetHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
  -[MUBoxLayoutInternal resetHorizontalAlignmentForArrangedLayoutItem:](self->_internal, "resetHorizontalAlignmentForArrangedLayoutItem:", a3);
}

- (int64_t)horizontalAlignmentForArrangedLayoutItem:(id)a3
{
  return -[MUBoxLayoutInternal horizontalAlignmentForArrangedLayoutItem:](self->_internal, "horizontalAlignmentForArrangedLayoutItem:", a3);
}

- (void)setHorizontalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  -[MUBoxLayoutInternal setHorizontalAlignment:forArrangedLayoutItem:](self->_internal, "setHorizontalAlignment:forArrangedLayoutItem:", a3, a4);
}

- (BOOL)horizontalAlignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  return -[MUBoxLayoutInternal horizontalAlignmentBoundsContentForArrangedLayoutItem:](self->_internal, "horizontalAlignmentBoundsContentForArrangedLayoutItem:", a3);
}

- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  -[MUBoxLayoutInternal setHorizontalAlignmentBoundsContent:forArrangedLayoutItem:](self->_internal, "setHorizontalAlignmentBoundsContent:forArrangedLayoutItem:", a3, a4);
}

- (float)horizontalFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  float result;

  -[MUBoxLayoutInternal horizontalFittingSizePriorityForArrangedLayoutItem:](self->_internal, "horizontalFittingSizePriorityForArrangedLayoutItem:", a3);
  return result;
}

- (void)setHorizontalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  -[MUBoxLayoutInternal setHorizontalFittingSizePriority:forArrangedLayoutItem:](self->_internal, "setHorizontalFittingSizePriority:forArrangedLayoutItem:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
