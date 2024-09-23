@implementation MUStackLayoutInternal

- (MUStackLayoutInternal)initWithContainer:(id)a3 axis:(int64_t)a4
{
  swift_unknownObjectRetain();
  return (MUStackLayoutInternal *)StackLayout.init(container:axis:)((uint64_t)a3, a4);
}

- (MULayoutItem)container
{
  MUStackLayoutInternal *v2;
  void *v3;
  _BYTE v5[80];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = (void *)MEMORY[0x1940213B8](v5);
  sub_191DDFE44((uint64_t)v5);

  return (MULayoutItem *)v3;
}

- (void)setContainer:(id)a3
{
  MUStackLayoutInternal *v4;
  _BYTE v5[80];
  _BYTE v6[80];

  swift_unknownObjectRetain();
  v4 = self;
  sub_191E0F534((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_191DDFE70((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DDFE44((uint64_t)v6);
  sub_191DDFD68();
  swift_unknownObjectRelease();

}

- (int64_t)axis
{
  MUStackLayoutInternal *v2;
  int64_t v3;
  _QWORD v5[10];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = v5[1];
  sub_191DDFE44((uint64_t)v5);

  return v3;
}

- (void)setAxis:(int64_t)a3
{
  MUStackLayoutInternal *v4;
  _BYTE v5[80];
  _BYTE v6[8];
  int64_t v7;

  v4 = self;
  sub_191E0F534((uint64_t)v6);
  v7 = a3;
  sub_191DDFE70((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DDFE44((uint64_t)v6);

}

- (int64_t)distribution
{
  MUStackLayoutInternal *v2;
  unsigned int v3;
  int64_t v4;
  _DWORD v6[20];

  v2 = self;
  sub_191E0F534((uint64_t)v6);
  v3 = v6[6];
  sub_191DDFE44((uint64_t)v6);
  v4 = sub_191E1ACEC(v3);

  return v4;
}

- (void)setDistribution:(int64_t)a3
{
  MUStackLayoutInternal *v3;
  _BYTE v4[80];
  _BYTE v5[80];

  v3 = self;
  sub_191E0F534((uint64_t)v5);
  sub_191E1AD48();
  sub_191DDFE70((uint64_t)v5, (uint64_t)v4);
  sub_191E0F598((uint64_t)v4);
  sub_191DDFE44((uint64_t)v5);

}

- (BOOL)distributionBoundsContent
{
  MUStackLayoutInternal *v2;
  unsigned int v3;
  _DWORD v5[20];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = v5[6];
  sub_191DDFE44((uint64_t)v5);
  LOBYTE(v3) = sub_191E1B140(v3);

  return v3 & 1;
}

- (void)setDistributionBoundsContent:(BOOL)a3
{
  MUStackLayoutInternal *v3;
  _BYTE v4[80];
  _BYTE v5[80];

  v3 = self;
  sub_191E0F534((uint64_t)v5);
  sub_191E1B16C();
  sub_191DDFE70((uint64_t)v5, (uint64_t)v4);
  sub_191E0F598((uint64_t)v4);
  sub_191DDFE44((uint64_t)v5);

}

- (float)distributionFittingSizePriority
{
  MUStackLayoutInternal *v2;
  unsigned int v3;
  float v4;
  float v5;
  _DWORD v7[20];

  v2 = self;
  sub_191E0F534((uint64_t)v7);
  v3 = v7[6];
  sub_191DDFE44((uint64_t)v7);
  sub_191E1B110(v3);
  v5 = v4;

  return v5;
}

- (void)setDistributionFittingSizePriority:(float)a3
{
  MUStackLayoutInternal *v4;
  _BYTE v5[80];
  _BYTE v6[80];

  v4 = self;
  sub_191E0F534((uint64_t)v6);
  sub_191E1B244(a3);
  sub_191DDFE70((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DDFE44((uint64_t)v6);

}

- (int64_t)alignment
{
  MUStackLayoutInternal *v2;
  unsigned int v3;
  int64_t v4;
  _DWORD v6[20];

  v2 = self;
  sub_191E0F534((uint64_t)v6);
  v3 = v6[8];
  sub_191DDFE44((uint64_t)v6);
  v4 = sub_191E1AEF4(v3);

  return v4;
}

- (void)setAlignment:(int64_t)a3
{
  MUStackLayoutInternal *v3;
  _BYTE v4[80];
  _BYTE v5[80];

  v3 = self;
  sub_191E0F534((uint64_t)v5);
  sub_191E1AF08();
  sub_191DDFE70((uint64_t)v5, (uint64_t)v4);
  sub_191E0F598((uint64_t)v4);
  sub_191DDFE44((uint64_t)v5);

}

- (BOOL)alignmentBoundsContent
{
  MUStackLayoutInternal *v2;
  unsigned int v3;
  _DWORD v5[20];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = v5[8];
  sub_191DDFE44((uint64_t)v5);
  LOBYTE(v3) = sub_191E1B3CC(v3);

  return v3 & 1;
}

- (void)setAlignmentBoundsContent:(BOOL)a3
{
  MUStackLayoutInternal *v3;
  _BYTE v4[80];
  _BYTE v5[80];

  v3 = self;
  sub_191E0F534((uint64_t)v5);
  sub_191E1B3F8();
  sub_191DDFE70((uint64_t)v5, (uint64_t)v4);
  sub_191E0F598((uint64_t)v4);
  sub_191DDFE44((uint64_t)v5);

}

- (float)alignmentFittingSizePriority
{
  MUStackLayoutInternal *v2;
  unsigned int v3;
  float v4;
  float v5;
  _DWORD v7[20];

  v2 = self;
  sub_191E0F534((uint64_t)v7);
  v3 = v7[8];
  sub_191DDFE44((uint64_t)v7);
  sub_191E1B39C(v3);
  v5 = v4;

  return v5;
}

- (void)setAlignmentFittingSizePriority:(float)a3
{
  MUStackLayoutInternal *v4;
  _BYTE v5[80];
  _BYTE v6[80];

  v4 = self;
  sub_191E0F534((uint64_t)v6);
  sub_191E1B478(a3);
  sub_191DDFE70((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DDFE44((uint64_t)v6);

}

- (double)spacing
{
  MUStackLayoutInternal *v2;
  double v3;
  _QWORD v5[10];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = *(double *)&v5[5];
  sub_191DDFE44((uint64_t)v5);

  return v3;
}

- (void)setSpacing:(double)a3
{
  MUStackLayoutInternal *v4;
  _BYTE v5[80];
  _BYTE v6[40];
  double v7;

  v4 = self;
  sub_191E0F534((uint64_t)v6);
  v7 = a3;
  sub_191DDFE70((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DDFE44((uint64_t)v6);

}

- (NSDirectionalEdgeInsets)insets
{
  MUStackLayoutInternal *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[10];
  NSDirectionalEdgeInsets result;

  v2 = self;
  sub_191E0F534((uint64_t)v11);
  v3 = *(double *)&v11[6];
  v4 = *(double *)&v11[7];
  v5 = *(double *)&v11[8];
  v6 = *(double *)&v11[9];
  sub_191DDFE44((uint64_t)v11);

  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.trailing = v10;
  result.bottom = v9;
  result.leading = v8;
  result.top = v7;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing;
  CGFloat bottom;
  CGFloat leading;
  CGFloat top;
  MUStackLayoutInternal *v7;
  _BYTE v8[80];
  _BYTE v9[48];
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  v7 = self;
  sub_191E0F534((uint64_t)v9);
  v10 = top;
  v11 = leading;
  v12 = bottom;
  v13 = trailing;
  sub_191DDFE70((uint64_t)v9, (uint64_t)v8);
  sub_191E0F598((uint64_t)v8);
  sub_191DDFE44((uint64_t)v9);

}

- (void).cxx_destruct
{
  swift_release();
}

- (NSArray)arrangedLayoutItems
{
  MUStackLayoutInternal *v2;
  void *v3;

  v2 = self;
  StackLayout.arrangedLayoutItems.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED01B310);
  v3 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setArrangedLayoutItems:(id)a3
{
  unint64_t v4;
  MUStackLayoutInternal *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED01B310);
  v4 = sub_191EEB044();
  v5 = self;
  StackLayout.arrangedLayoutItems.setter(v4);

}

- (void)addArrangedLayoutItem:(id)a3
{
  sub_191DE1A58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))StackLayout.addArrangedLayoutItem(_:));
}

- (void)removeArrangedLayoutItem:(id)a3
{
  MUStackLayoutInternal *v4;
  void (*v5)(_BYTE *, _QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _BYTE v10[32];
  _BYTE v11[8];

  swift_unknownObjectRetain_n();
  v4 = self;
  sub_191E30B08();
  v5 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v4->super.super.isa)
                                                                                + 0xB0))(v10);
  v7 = v6;
  v8 = sub_191DE2628(sub_191DE2E5C);
  v9 = *(_QWORD *)(*(_QWORD *)v7 + 16);
  if (v9 < v8)
  {
    __break(1u);
  }
  else
  {
    sub_191DE295C(v8, v9);
    v5(v10, 0);
    sub_191DDFE80((uint64_t)v11);
    swift_unknownObjectRelease();

  }
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  MUStackLayoutInternal *v4;
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
  NSDirectionalEdgeInsets result;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = StackLayout.padding(forArrangedLayoutItem:)();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  swift_unknownObjectRelease();

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.trailing = v15;
  result.bottom = v14;
  result.leading = v13;
  result.top = v12;
  return result;
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4
{
  double trailing;
  double bottom;
  double leading;
  double top;
  MUStackLayoutInternal *v9;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  swift_unknownObjectRetain();
  v9 = self;
  StackLayout.setPadding(_:forArrangedLayoutItem:)(top, leading, bottom, trailing);
  swift_unknownObjectRelease();

}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  MUStackLayoutInternal *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIOffset result;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = StackLayout.offset(forArrangedLayoutItem:)();
  v7 = v6;
  swift_unknownObjectRelease();

  v8 = v5;
  v9 = v7;
  result.vertical = v9;
  result.horizontal = v8;
  return result;
}

- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4
{
  double vertical;
  double horizontal;
  MUStackLayoutInternal *v7;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  swift_unknownObjectRetain();
  v7 = self;
  StackLayout.setOffset(_:forArrangedLayoutItem:)(horizontal, vertical);
  swift_unknownObjectRelease();

}

- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3
{
  MUStackLayoutInternal *v4;
  unsigned int v5;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = ~sub_191DE174C();
  swift_unknownObjectRelease();

  return (v5 & 0xFFFFFFFE) != 0;
}

- (void)disableAlignmentForArrangedLayoutItem:(id)a3
{
  sub_191DE1A58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))StackLayout.disableAlignment(forArrangedLayoutItem:));
}

- (void)resetAlignmentForArrangedLayoutItem:(id)a3
{
  sub_191DE1A58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))StackLayout.resetAlignment(forArrangedLayoutItem:));
}

- (int64_t)alignmentForArrangedLayoutItem:(id)a3
{
  MUStackLayoutInternal *v4;
  unsigned int v5;
  int64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = sub_191DE174C();
  if ((~v5 & 0xFFFFFFFE) == 0)
    v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v4->super.super.isa) + 0x118))();
  v6 = sub_191E1AEF4(v5);
  swift_unknownObjectRelease();

  return v6;
}

- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  MUStackLayoutInternal *v5;

  swift_unknownObjectRetain();
  v5 = self;
  StackLayout.setAlignmentKind(_:forArrangedLayoutItem:)();
  swift_unknownObjectRelease();

}

- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  MUStackLayoutInternal *v4;
  unsigned int v5;
  char v6;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = sub_191DE174C();
  if ((~v5 & 0xFFFFFFFE) != 0)
    v6 = sub_191E1B3CC(v5);
  else
    v6 = 0;
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  MUStackLayoutInternal *v5;

  swift_unknownObjectRetain();
  v5 = self;
  StackLayout.setAlignmentBoundsContent(_:forArrangedLayoutItem:)();
  swift_unknownObjectRelease();

}

- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  MUStackLayoutInternal *v4;
  unsigned int v5;
  float v6;
  float v7;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = sub_191DE174C();
  v6 = 0.0;
  if ((~v5 & 0xFFFFFFFE) != 0)
  {
    sub_191E1B39C(v5);
    v6 = v7;
  }
  swift_unknownObjectRelease();

  return v6;
}

- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  MUStackLayoutInternal *v6;

  swift_unknownObjectRetain();
  v6 = self;
  StackLayout.setAlignmentFittingSizePriority(_:forArrangedLayoutItem:)(a3);
  swift_unknownObjectRelease();

}

@end
