@implementation MUCompositionalStackLayoutGroup

- (MUCompositionalStackLayoutGroup)initWithAxis:(int64_t)a3
{
  MUCompositionalStackLayoutGroupInternal *v4;
  MUCompositionalStackLayoutGroup *v5;
  MUCompositionalStackLayoutGroup *v6;
  NSArray *arrangedLayoutItems;
  objc_super v9;

  v4 = -[MUCompositionalStackLayoutGroupInternal initWithAxis:]([MUCompositionalStackLayoutGroupInternal alloc], "initWithAxis:", a3);
  v9.receiver = self;
  v9.super_class = (Class)MUCompositionalStackLayoutGroup;
  v5 = -[MUCompositionalStackLayoutGroup init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_internal, v4);
    arrangedLayoutItems = v6->_arrangedLayoutItems;
    v6->_arrangedLayoutItems = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v6;
}

- (MUCompositionalStackLayoutGroup)initWithIdentifier:(id)a3 axis:(int64_t)a4
{
  id v6;
  MUCompositionalStackLayoutGroupInternal *v7;
  MUCompositionalStackLayoutGroup *v8;
  MUCompositionalStackLayoutGroup *v9;
  NSArray *arrangedLayoutItems;
  objc_super v12;

  v6 = a3;
  v7 = -[MUCompositionalStackLayoutGroupInternal initWithIdentifier:axis:]([MUCompositionalStackLayoutGroupInternal alloc], "initWithIdentifier:axis:", v6, a4);

  v12.receiver = self;
  v12.super_class = (Class)MUCompositionalStackLayoutGroup;
  v8 = -[MUCompositionalStackLayoutGroup init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_internal, v7);
    arrangedLayoutItems = v9->_arrangedLayoutItems;
    v9->_arrangedLayoutItems = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = (void *)-[MUCompositionalStackLayoutGroupInternal copy](self->_internal, "copy");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAxis:", -[MUCompositionalStackLayoutGroup axis](self, "axis"));
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;
  v8 = v5;

  objc_storeStrong((id *)(v6 + 8), self->_arrangedLayoutItems);
  return (id)v6;
}

- (NSString)identifier
{
  return -[MUCompositionalStackLayoutGroupInternal identifier](self->_internal, "identifier");
}

- (void)setIdentifier:(id)a3
{
  -[MUCompositionalStackLayoutGroupInternal setIdentifier:](self->_internal, "setIdentifier:", a3);
}

- (int64_t)axis
{
  return -[MUCompositionalStackLayoutGroupInternal axis](self->_internal, "axis");
}

- (void)setAxis:(int64_t)a3
{
  -[MUCompositionalStackLayoutGroupInternal setAxis:](self->_internal, "setAxis:", a3);
}

- (int64_t)distribution
{
  return -[MUCompositionalStackLayoutGroupInternal distribution](self->_internal, "distribution");
}

- (void)setDistribution:(int64_t)a3
{
  -[MUCompositionalStackLayoutGroupInternal setDistribution:](self->_internal, "setDistribution:", a3);
}

- (BOOL)distributionBoundsContent
{
  return -[MUCompositionalStackLayoutGroupInternal distributionBoundsContent](self->_internal, "distributionBoundsContent");
}

- (void)setDistributionBoundsContent:(BOOL)a3
{
  -[MUCompositionalStackLayoutGroupInternal setDistributionBoundsContent:](self->_internal, "setDistributionBoundsContent:", a3);
}

- (float)distributionFittingSizePriority
{
  float result;

  -[MUCompositionalStackLayoutGroupInternal distributionFittingSizePriority](self->_internal, "distributionFittingSizePriority");
  return result;
}

- (void)setDistributionFittingSizePriority:(float)a3
{
  -[MUCompositionalStackLayoutGroupInternal setDistributionFittingSizePriority:](self->_internal, "setDistributionFittingSizePriority:");
}

- (int64_t)alignment
{
  return -[MUCompositionalStackLayoutGroupInternal alignment](self->_internal, "alignment");
}

- (void)setAlignment:(int64_t)a3
{
  -[MUCompositionalStackLayoutGroupInternal setAlignment:](self->_internal, "setAlignment:", a3);
}

- (BOOL)alignmentBoundsContent
{
  return -[MUCompositionalStackLayoutGroupInternal alignmentBoundsContent](self->_internal, "alignmentBoundsContent");
}

- (void)setAlignmentBoundsContent:(BOOL)a3
{
  -[MUCompositionalStackLayoutGroupInternal setAlignmentBoundsContent:](self->_internal, "setAlignmentBoundsContent:", a3);
}

- (float)alignmentFittingSizePriority
{
  float result;

  -[MUCompositionalStackLayoutGroupInternal alignmentFittingSizePriority](self->_internal, "alignmentFittingSizePriority");
  return result;
}

- (void)setAlignmentFittingSizePriority:(float)a3
{
  -[MUCompositionalStackLayoutGroupInternal setAlignmentFittingSizePriority:](self->_internal, "setAlignmentFittingSizePriority:");
}

- (double)spacing
{
  double result;

  -[MUCompositionalStackLayoutGroupInternal spacing](self->_internal, "spacing");
  return result;
}

- (void)setSpacing:(double)a3
{
  -[MUCompositionalStackLayoutGroupInternal setSpacing:](self->_internal, "setSpacing:", a3);
}

- (NSDirectionalEdgeInsets)insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[MUCompositionalStackLayoutGroupInternal insets](self->_internal, "insets");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
  -[MUCompositionalStackLayoutGroupInternal setInsets:](self->_internal, "setInsets:", a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (void)setArrangedLayoutItems:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  char v6;
  NSArray *v7;
  NSArray *arrangedLayoutItems;
  void *v9;
  NSArray *v10;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_arrangedLayoutItems != v4)
  {
    v10 = v4;
    v6 = -[NSArray isEqual:](v4, "isEqual:");
    v5 = v10;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      arrangedLayoutItems = self->_arrangedLayoutItems;
      self->_arrangedLayoutItems = v7;

      MUMap(self->_arrangedLayoutItems, &__block_literal_global_9);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUCompositionalStackLayoutGroupInternal setArrangedLayoutItems:](self->_internal, "setArrangedLayoutItems:", v9);

      v5 = v10;
    }
  }

}

id __58__MUCompositionalStackLayoutGroup_setArrangedLayoutItems___block_invoke(uint64_t a1, void *a2)
{
  return unwrapLayoutItem(a2);
}

- (void)addArrangedLayoutItem:(id)a3
{
  void *v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *arrangedLayoutItems;
  id v10;

  v10 = a3;
  unwrapLayoutItem(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray count](self->_arrangedLayoutItems, "count");
  -[MUCompositionalStackLayoutGroupInternal addArrangedLayoutItem:](self->_internal, "addArrangedLayoutItem:", v4);
  -[MUCompositionalStackLayoutGroupInternal arrangedLayoutItems](self->_internal, "arrangedLayoutItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 != v7)
  {
    -[NSArray arrayByAddingObject:](self->_arrangedLayoutItems, "arrayByAddingObject:", v10);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    arrangedLayoutItems = self->_arrangedLayoutItems;
    self->_arrangedLayoutItems = v8;

  }
}

- (void)removeArrangedLayoutItem:(id)a3
{
  void *v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray *arrangedLayoutItems;
  id v11;

  v11 = a3;
  unwrapLayoutItem(v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray count](self->_arrangedLayoutItems, "count");
  -[MUCompositionalStackLayoutGroupInternal removeArrangedLayoutItem:](self->_internal, "removeArrangedLayoutItem:", v4);
  -[MUCompositionalStackLayoutGroupInternal arrangedLayoutItems](self->_internal, "arrangedLayoutItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 != v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_arrangedLayoutItems);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v11);
    v9 = (NSArray *)objc_msgSend(v8, "copy");
    arrangedLayoutItems = self->_arrangedLayoutItems;
    self->_arrangedLayoutItems = v9;

  }
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *internal;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSDirectionalEdgeInsets result;

  internal = self->_internal;
  unwrapLayoutItem(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal paddingForArrangedLayoutItem:](internal, "paddingForArrangedLayoutItem:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.trailing = v16;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4
{
  double trailing;
  double bottom;
  double leading;
  double top;
  MUCompositionalStackLayoutGroupInternal *internal;
  id v9;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  internal = self->_internal;
  unwrapLayoutItem(a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal setPadding:forArrangedLayoutItem:](internal, "setPadding:forArrangedLayoutItem:", v9, top, leading, bottom, trailing);

}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *internal;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIOffset result;

  internal = self->_internal;
  unwrapLayoutItem(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal offsetForArrangedLayoutItem:](internal, "offsetForArrangedLayoutItem:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.vertical = v10;
  result.horizontal = v9;
  return result;
}

- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4
{
  double vertical;
  double horizontal;
  MUCompositionalStackLayoutGroupInternal *internal;
  id v7;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  internal = self->_internal;
  unwrapLayoutItem(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal setOffset:forArrangedLayoutItem:](internal, "setOffset:forArrangedLayoutItem:", v7, horizontal, vertical);

}

- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *internal;
  void *v4;

  internal = self->_internal;
  unwrapLayoutItem(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(internal) = -[MUCompositionalStackLayoutGroupInternal hasAlignmentForArrangedLayoutItem:](internal, "hasAlignmentForArrangedLayoutItem:", v4);

  return (char)internal;
}

- (void)disableAlignmentForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *internal;
  id v4;

  internal = self->_internal;
  unwrapLayoutItem(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal disableAlignmentForArrangedLayoutItem:](internal, "disableAlignmentForArrangedLayoutItem:", v4);

}

- (void)resetAlignmentForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *internal;
  id v4;

  internal = self->_internal;
  unwrapLayoutItem(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal resetAlignmentForArrangedLayoutItem:](internal, "resetAlignmentForArrangedLayoutItem:", v4);

}

- (int64_t)alignmentForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *internal;
  void *v4;
  int64_t v5;

  internal = self->_internal;
  unwrapLayoutItem(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUCompositionalStackLayoutGroupInternal alignmentForArrangedLayoutItem:](internal, "alignmentForArrangedLayoutItem:", v4);

  return v5;
}

- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  MUCompositionalStackLayoutGroupInternal *internal;
  id v6;

  internal = self->_internal;
  unwrapLayoutItem(a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal setAlignment:forArrangedLayoutItem:](internal, "setAlignment:forArrangedLayoutItem:", a3, v6);

}

- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *internal;
  void *v4;

  internal = self->_internal;
  unwrapLayoutItem(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(internal) = -[MUCompositionalStackLayoutGroupInternal alignmentBoundsContentForArrangedLayoutItem:](internal, "alignmentBoundsContentForArrangedLayoutItem:", v4);

  return (char)internal;
}

- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  _BOOL8 v4;
  MUCompositionalStackLayoutGroupInternal *internal;
  id v6;

  v4 = a3;
  internal = self->_internal;
  unwrapLayoutItem(a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal setAlignmentBoundsContent:forArrangedLayoutItem:](internal, "setAlignmentBoundsContent:forArrangedLayoutItem:", v4, v6);

}

- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *internal;
  void *v4;
  float v5;
  float v6;

  internal = self->_internal;
  unwrapLayoutItem(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal alignmentFittingSizePriorityForArrangedLayoutItem:](internal, "alignmentFittingSizePriorityForArrangedLayoutItem:", v4);
  v6 = v5;

  return v6;
}

- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  MUCompositionalStackLayoutGroupInternal *internal;
  double v6;
  id v7;

  internal = self->_internal;
  unwrapLayoutItem(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  -[MUCompositionalStackLayoutGroupInternal setAlignmentFittingSizePriority:forArrangedLayoutItem:](internal, "setAlignmentFittingSizePriority:forArrangedLayoutItem:", v7, v6);

}

- (NSArray)arrangedLayoutItems
{
  return self->_arrangedLayoutItems;
}

- (MUCompositionalStackLayoutGroupInternal)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
  objc_storeStrong((id *)&self->_internal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_arrangedLayoutItems, 0);
}

@end
