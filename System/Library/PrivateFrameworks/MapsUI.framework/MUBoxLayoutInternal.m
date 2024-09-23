@implementation MUBoxLayoutInternal

- (MUBoxLayoutInternal)initWithContainer:(id)a3
{
  MUBoxLayoutInternal *v3;

  swift_unknownObjectRetain();
  v3 = (MUBoxLayoutInternal *)sub_191DEA8C4();
  swift_unknownObjectRelease();
  return v3;
}

- (MULayoutItem)container
{
  MUBoxLayoutInternal *v2;
  void *v3;
  _BYTE v5[64];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = (void *)MEMORY[0x1940213B8](v5);
  sub_191DEA974((uint64_t)v5);

  return (MULayoutItem *)v3;
}

- (void)setContainer:(id)a3
{
  MUBoxLayoutInternal *v4;
  _BYTE v5[64];
  _BYTE v6[64];

  swift_unknownObjectRetain();
  v4 = self;
  sub_191E0F534((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_191DEA9A0((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DEA974((uint64_t)v6);
  swift_unknownObjectRelease();

}

- (int64_t)verticalAlignment
{
  MUBoxLayoutInternal *v2;
  unsigned int v3;
  int64_t v4;
  _DWORD v6[16];

  v2 = self;
  sub_191E0F534((uint64_t)v6);
  v3 = v6[4];
  sub_191DEA974((uint64_t)v6);
  v4 = sub_191E1AEF4(v3);

  return v4;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  MUBoxLayoutInternal *v3;
  _BYTE v4[64];
  _BYTE v5[64];

  v3 = self;
  sub_191E0F534((uint64_t)v5);
  sub_191E1AF08();
  sub_191DEA9A0((uint64_t)v5, (uint64_t)v4);
  sub_191E0F598((uint64_t)v4);
  sub_191DEA974((uint64_t)v5);

}

- (BOOL)verticalAlignmentBoundsContent
{
  MUBoxLayoutInternal *v2;
  unsigned int v3;
  _DWORD v5[16];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = v5[4];
  sub_191DEA974((uint64_t)v5);
  LOBYTE(v3) = sub_191E1B3CC(v3);

  return v3 & 1;
}

- (void)setVerticalAlignmentBoundsContent:(BOOL)a3
{
  MUBoxLayoutInternal *v3;
  _BYTE v4[64];
  _BYTE v5[64];

  v3 = self;
  sub_191E0F534((uint64_t)v5);
  sub_191E1B3F8();
  sub_191DEA9A0((uint64_t)v5, (uint64_t)v4);
  sub_191E0F598((uint64_t)v4);
  sub_191DEA974((uint64_t)v5);

}

- (float)verticalAlignmentFittingSizePriority
{
  MUBoxLayoutInternal *v2;
  unsigned int v3;
  float v4;
  float v5;
  _DWORD v7[16];

  v2 = self;
  sub_191E0F534((uint64_t)v7);
  v3 = v7[4];
  sub_191DEA974((uint64_t)v7);
  sub_191E1B39C(v3);
  v5 = v4;

  return v5;
}

- (void)setVerticalAlignmentFittingSizePriority:(float)a3
{
  MUBoxLayoutInternal *v4;
  _BYTE v5[64];
  _BYTE v6[64];

  v4 = self;
  sub_191E0F534((uint64_t)v6);
  sub_191E1B478(a3);
  sub_191DEA9A0((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DEA974((uint64_t)v6);

}

- (int64_t)horizontalAlignment
{
  MUBoxLayoutInternal *v2;
  unsigned int v3;
  int64_t v4;
  _DWORD v6[16];

  v2 = self;
  sub_191E0F534((uint64_t)v6);
  v3 = v6[6];
  sub_191DEA974((uint64_t)v6);
  v4 = sub_191E1AEF4(v3);

  return v4;
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  MUBoxLayoutInternal *v3;
  _BYTE v4[64];
  _BYTE v5[64];

  v3 = self;
  sub_191E0F534((uint64_t)v5);
  sub_191E1AF08();
  sub_191DEA9A0((uint64_t)v5, (uint64_t)v4);
  sub_191E0F598((uint64_t)v4);
  sub_191DEA974((uint64_t)v5);

}

- (BOOL)horizontalAlignmentBoundsContent
{
  MUBoxLayoutInternal *v2;
  unsigned int v3;
  _DWORD v5[16];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = v5[6];
  sub_191DEA974((uint64_t)v5);
  LOBYTE(v3) = sub_191E1B3CC(v3);

  return v3 & 1;
}

- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3
{
  MUBoxLayoutInternal *v3;
  _BYTE v4[64];
  _BYTE v5[64];

  v3 = self;
  sub_191E0F534((uint64_t)v5);
  sub_191E1B3F8();
  sub_191DEA9A0((uint64_t)v5, (uint64_t)v4);
  sub_191E0F598((uint64_t)v4);
  sub_191DEA974((uint64_t)v5);

}

- (float)horizontalAlignmentFittingSizePriority
{
  MUBoxLayoutInternal *v2;
  unsigned int v3;
  float v4;
  float v5;
  _DWORD v7[16];

  v2 = self;
  sub_191E0F534((uint64_t)v7);
  v3 = v7[6];
  sub_191DEA974((uint64_t)v7);
  sub_191E1B39C(v3);
  v5 = v4;

  return v5;
}

- (void)setHorizontalAlignmentFittingSizePriority:(float)a3
{
  MUBoxLayoutInternal *v4;
  _BYTE v5[64];
  _BYTE v6[64];

  v4 = self;
  sub_191E0F534((uint64_t)v6);
  sub_191E1B478(a3);
  sub_191DEA9A0((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DEA974((uint64_t)v6);

}

- (NSDirectionalEdgeInsets)insets
{
  MUBoxLayoutInternal *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[8];
  NSDirectionalEdgeInsets result;

  v2 = self;
  sub_191E0F534((uint64_t)v11);
  v3 = *(double *)&v11[4];
  v4 = *(double *)&v11[5];
  v5 = *(double *)&v11[6];
  v6 = *(double *)&v11[7];
  sub_191DEA974((uint64_t)v11);

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
  MUBoxLayoutInternal *v7;
  _BYTE v8[64];
  _BYTE v9[32];
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
  sub_191DEA9A0((uint64_t)v9, (uint64_t)v8);
  sub_191E0F598((uint64_t)v8);
  sub_191DEA974((uint64_t)v9);

}

- (void).cxx_destruct
{
  swift_release();
}

- (NSArray)arrangedLayoutItems
{
  MUBoxLayoutInternal *v2;
  void *v3;

  v2 = self;
  BoxLayout.arrangedLayoutItems.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED01B310);
  v3 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setArrangedLayoutItems:(id)a3
{
  unint64_t v4;
  MUBoxLayoutInternal *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED01B310);
  v4 = sub_191EEB044();
  v5 = self;
  BoxLayout.arrangedLayoutItems.setter(v4);

}

- (void)addArrangedLayoutItem:(id)a3
{
  sub_191DE1A58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))BoxLayout.addArrangedLayoutItem(_:));
}

- (void)removeArrangedLayoutItem:(id)a3
{
  MUBoxLayoutInternal *v4;
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
                                                                                + 0x98))(v10);
  v7 = v6;
  sub_191DEA500(sub_191DE2E5C);
  v9 = *(_QWORD *)(*(_QWORD *)v7 + 16);
  if (v9 < v8)
  {
    __break(1u);
  }
  else
  {
    sub_191DEABC4(v8, v9);
    v5(v10, 0);
    sub_191DDFE80((uint64_t)v11);
    swift_unknownObjectRelease();

  }
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  MUBoxLayoutInternal *v4;
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
  v5 = BoxLayout.padding(forArrangedLayoutItem:)();
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
  MUBoxLayoutInternal *v9;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  swift_unknownObjectRetain();
  v9 = self;
  BoxLayout.setPadding(_:forArrangedLayoutItem:)(top, leading, bottom, trailing);
  swift_unknownObjectRelease();

}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  MUBoxLayoutInternal *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIOffset result;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = BoxLayout.offset(forArrangedLayoutItem:)();
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
  MUBoxLayoutInternal *v7;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  swift_unknownObjectRetain();
  v7 = self;
  BoxLayout.setOffset(_:forArrangedLayoutItem:)(horizontal, vertical);
  swift_unknownObjectRelease();

}

- (BOOL)hasVerticalAlignmentForArrangedLayoutItem:(id)a3
{
  return sub_191DE9A20(self, (uint64_t)a2, (uint64_t)a3, (unsigned int (*)(uint64_t))sub_191DE9058);
}

- (void)disableVerticalAlignmentForArrangedLayoutItem:(id)a3
{
  sub_191DE1A58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))BoxLayout.disableVerticalAlignment(forArrangedLayoutItem:));
}

- (void)resetVerticalAlignmentForArrangedLayoutItem:(id)a3
{
  sub_191DE1A58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))BoxLayout.resetVerticalAlignment(forArrangedLayoutItem:));
}

- (int64_t)verticalAlignmentForArrangedLayoutItem:(id)a3
{
  MUBoxLayoutInternal *v4;
  unsigned int v5;
  int64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = sub_191DE9058();
  if ((~v5 & 0xFFFFFFFE) == 0)
    v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v4->super.super.isa) + 0xA0))();
  v6 = sub_191E1AEF4(v5);
  swift_unknownObjectRelease();

  return v6;
}

- (void)setVerticalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  sub_191DE9E5C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))BoxLayout.setVerticalAlignmentKind(_:forArrangedLayoutItem:));
}

- (BOOL)verticalAlignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  return sub_191DE9F08(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_191DE9058);
}

- (void)setVerticalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  sub_191DE9E5C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))BoxLayout.setVerticalAlignmentBoundsContent(_:forArrangedLayoutItem:));
}

- (float)verticalFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  return sub_191DEA14C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_191DE9058);
}

- (void)setVerticalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  sub_191DEA354(self, a3, (uint64_t)a2, (uint64_t)a4, (void (*)(uint64_t, float))BoxLayout.setVerticalFittingSizePriority(_:forArrangedLayoutItem:));
}

- (BOOL)hasHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
  return sub_191DE9A20(self, (uint64_t)a2, (uint64_t)a3, (unsigned int (*)(uint64_t))sub_191DE98E0);
}

- (void)disableHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
  sub_191DE1A58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))BoxLayout.disableHorizontalAlignment(forArrangedLayoutItem:));
}

- (void)resetHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
  sub_191DE1A58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))BoxLayout.resetHorizontalAlignment(forArrangedLayoutItem:));
}

- (int64_t)horizontalAlignmentForArrangedLayoutItem:(id)a3
{
  MUBoxLayoutInternal *v4;
  unsigned int v5;
  int64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = sub_191DE98E0();
  if ((~v5 & 0xFFFFFFFE) == 0)
    v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v4->super.super.isa) + 0x100))();
  v6 = sub_191E1AEF4(v5);
  swift_unknownObjectRelease();

  return v6;
}

- (void)setHorizontalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  sub_191DE9E5C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))BoxLayout.setHorizontalAlignmentKind(_:forArrangedLayoutItem:));
}

- (BOOL)horizontalAlignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  return sub_191DE9F08(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_191DE98E0);
}

- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  sub_191DE9E5C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))BoxLayout.setHorizontalAlignmentBoundsContent(_:forArrangedLayoutItem:));
}

- (float)horizontalFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  return sub_191DEA14C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_191DE98E0);
}

- (void)setHorizontalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  sub_191DEA354(self, a3, (uint64_t)a2, (uint64_t)a4, (void (*)(uint64_t, float))BoxLayout.setHorizontalFittingSizePriority(_:forArrangedLayoutItem:));
}

@end
