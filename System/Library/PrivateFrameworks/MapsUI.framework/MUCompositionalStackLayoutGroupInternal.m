@implementation MUCompositionalStackLayoutGroupInternal

- (MUCompositionalStackLayoutGroupInternal)initWithAxis:(int64_t)a3
{
  uint64_t ObjectType;
  double v5;
  MUCompositionalStackLayoutGroupInternal *v6;
  _BYTE v8[88];

  ObjectType = swift_getObjectType();
  v5 = sub_191E2C548(a3, (uint64_t)v8);
  v6 = (MUCompositionalStackLayoutGroupInternal *)(*(uint64_t (**)(_BYTE *, double))(ObjectType + 112))(v8, v5);
  swift_deallocPartialClassInstance();
  return v6;
}

- (MUCompositionalStackLayoutGroupInternal)initWithIdentifier:(id)a3 axis:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  __int128 v9;
  MUCompositionalStackLayoutGroupInternal *v10;
  _QWORD v12[4];
  int64x2_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  v5 = sub_191EEAFC0();
  v7 = v6;
  ObjectType = swift_getObjectType();
  v13 = vdupq_n_s64(0xC0000000uLL);
  v9 = *(_OWORD *)(MEMORY[0x1E0DC3298] + 16);
  v15 = *MEMORY[0x1E0DC3298];
  v12[0] = v5;
  v12[1] = v7;
  v12[2] = a4;
  v12[3] = MEMORY[0x1E0DEE9D8];
  v14 = 0;
  v16 = v9;
  v10 = (MUCompositionalStackLayoutGroupInternal *)(*(uint64_t (**)(_QWORD *))(ObjectType + 112))(v12);
  swift_deallocPartialClassInstance();
  return v10;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t ObjectType;
  void (*v5)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v6;
  void *v7;
  void *v8;
  _QWORD v10[11];

  ObjectType = swift_getObjectType();
  v5 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v6 = self;
  v5(v10);
  v7 = (void *)(*(uint64_t (**)(_QWORD *))(ObjectType + 112))(v10);

  v8 = (void *)sub_191EEB338();
  return v8;
}

- (NSString)identifier
{
  void (*v2)(uint64_t *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  void *v4;
  uint64_t v6;

  v2 = *(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(&v6);
  swift_bridgeObjectRetain();
  sub_191E2C75C((uint64_t)&v6);

  v4 = (void *)sub_191EEAF9C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_BYTE *);
  MUCompositionalStackLayoutGroupInternal *v8;
  void (*v9)(_BYTE *, _QWORD);
  uint64_t *v10;
  _BYTE v11[32];

  v4 = sub_191EEAFC0();
  v6 = v5;
  v7 = *(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v8 = self;
  v9 = (void (*)(_BYTE *, _QWORD))v7(v11);
  *v10 = v4;
  v10[1] = v6;
  swift_bridgeObjectRelease();
  v9(v11, 0);

}

- (int64_t)axis
{
  void (*v2)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  _QWORD v5[11];

  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v5);
  sub_191E2C75C((uint64_t)v5);

  return v5[2];
}

- (void)setAxis:(int64_t)a3
{
  uint64_t (*v4)(_BYTE *);
  MUCompositionalStackLayoutGroupInternal *v5;
  void (*v6)(_BYTE *, _QWORD);
  uint64_t v7;
  _BYTE v8[32];

  v4 = *(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v5 = self;
  v6 = (void (*)(_BYTE *, _QWORD))v4(v8);
  *(_QWORD *)(v7 + 16) = a3;
  v6(v8, 0);

}

- (int64_t)distribution
{
  void (*v2)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  int64_t v4;
  _QWORD v6[4];
  uint64_t v7;

  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v6);
  v4 = sub_191E1ACEC(v7);
  sub_191E2C75C((uint64_t)v6);

  return v4;
}

- (void)setDistribution:(int64_t)a3
{
  uint64_t (*v3)(_BYTE *);
  MUCompositionalStackLayoutGroupInternal *v4;
  void (*v5)(_BYTE *, _QWORD);
  _BYTE v6[32];

  v3 = *(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v4 = self;
  v5 = (void (*)(_BYTE *, _QWORD))v3(v6);
  sub_191E1AD48();
  v5(v6, 0);

}

- (BOOL)distributionBoundsContent
{
  void (*v2)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  _QWORD v5[4];
  uint64_t v6;

  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v5);
  LOBYTE(v2) = sub_191E1B140(v6);
  sub_191E2C75C((uint64_t)v5);

  return v2 & 1;
}

- (void)setDistributionBoundsContent:(BOOL)a3
{
  uint64_t (*v3)(_BYTE *);
  MUCompositionalStackLayoutGroupInternal *v4;
  void (*v5)(_BYTE *, _QWORD);
  _BYTE v6[32];

  v3 = *(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v4 = self;
  v5 = (void (*)(_BYTE *, _QWORD))v3(v6);
  sub_191E1B16C();
  v5(v6, 0);

}

- (float)distributionFittingSizePriority
{
  void (*v2)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  float v4;
  float v5;
  _QWORD v7[4];
  uint64_t v8;

  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v7);
  sub_191E1B110(v8);
  v5 = v4;
  sub_191E2C75C((uint64_t)v7);

  return v5;
}

- (void)setDistributionFittingSizePriority:(float)a3
{
  uint64_t (*v4)(_BYTE *);
  MUCompositionalStackLayoutGroupInternal *v5;
  void (*v6)(_BYTE *, _QWORD);
  _BYTE v7[32];

  v4 = *(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v5 = self;
  v6 = (void (*)(_BYTE *, _QWORD))v4(v7);
  sub_191E1B244(a3);
  v6(v7, 0);

}

- (int64_t)alignment
{
  void (*v2)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v6);
  v4 = sub_191E1AEF4(v7);
  sub_191E2C75C((uint64_t)v6);

  return v4;
}

- (void)setAlignment:(int64_t)a3
{
  uint64_t (*v3)(_BYTE *);
  MUCompositionalStackLayoutGroupInternal *v4;
  void (*v5)(_BYTE *, _QWORD);
  _BYTE v6[32];

  v3 = *(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v4 = self;
  v5 = (void (*)(_BYTE *, _QWORD))v3(v6);
  sub_191E1AF08();
  v5(v6, 0);

}

- (BOOL)alignmentBoundsContent
{
  void (*v2)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  _QWORD v5[5];
  uint64_t v6;

  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v5);
  LOBYTE(v2) = sub_191E1B3CC(v6);
  sub_191E2C75C((uint64_t)v5);

  return v2 & 1;
}

- (void)setAlignmentBoundsContent:(BOOL)a3
{
  uint64_t (*v3)(_BYTE *);
  MUCompositionalStackLayoutGroupInternal *v4;
  void (*v5)(_BYTE *, _QWORD);
  _BYTE v6[32];

  v3 = *(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v4 = self;
  v5 = (void (*)(_BYTE *, _QWORD))v3(v6);
  sub_191E1B3F8();
  v5(v6, 0);

}

- (float)alignmentFittingSizePriority
{
  void (*v2)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  float v4;
  float v5;
  _QWORD v7[5];
  uint64_t v8;

  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v7);
  sub_191E1B39C(v8);
  v5 = v4;
  sub_191E2C75C((uint64_t)v7);

  return v5;
}

- (void)setAlignmentFittingSizePriority:(float)a3
{
  uint64_t (*v4)(_BYTE *);
  MUCompositionalStackLayoutGroupInternal *v5;
  void (*v6)(_BYTE *, _QWORD);
  _BYTE v7[32];

  v4 = *(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v5 = self;
  v6 = (void (*)(_BYTE *, _QWORD))v4(v7);
  sub_191E1B478(a3);
  v6(v7, 0);

}

- (double)spacing
{
  void (*v2)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  _QWORD v5[11];

  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v5);
  sub_191E2C75C((uint64_t)v5);

  return *(double *)&v5[6];
}

- (void)setSpacing:(double)a3
{
  uint64_t (*v4)(_BYTE *);
  MUCompositionalStackLayoutGroupInternal *v5;
  void (*v6)(_BYTE *, _QWORD);
  uint64_t v7;
  _BYTE v8[32];

  v4 = *(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v5 = self;
  v6 = (void (*)(_BYTE *, _QWORD))v4(v8);
  *(double *)(v7 + 48) = a3;
  v6(v8, 0);

}

- (NSDirectionalEdgeInsets)insets
{
  void (*v2)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[11];
  NSDirectionalEdgeInsets result;

  v2 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v8);
  sub_191E2C75C((uint64_t)v8);

  v4 = *(double *)&v8[7];
  v5 = *(double *)&v8[8];
  v6 = *(double *)&v8[9];
  v7 = *(double *)&v8[10];
  result.trailing = v7;
  result.bottom = v6;
  result.leading = v5;
  result.top = v4;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing;
  CGFloat bottom;
  CGFloat leading;
  CGFloat top;
  uint64_t (*v7)(_BYTE *);
  MUCompositionalStackLayoutGroupInternal *v8;
  void (*v9)(_BYTE *, _QWORD);
  CGFloat *v10;
  _BYTE v11[32];

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  v7 = *(uint64_t (**)(_BYTE *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x68);
  v8 = self;
  v9 = (void (*)(_BYTE *, _QWORD))v7(v11);
  v10[7] = top;
  v10[8] = leading;
  v10[9] = bottom;
  v10[10] = trailing;
  v9(v11, 0);

}

- (NSArray)arrangedLayoutItems
{
  MUCompositionalStackLayoutGroupInternal *v2;
  void *v3;

  v2 = self;
  CompositionalStackLayout.GroupRef.arrangedLayoutItems.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED01B2D8);
  v3 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setArrangedLayoutItems:(id)a3
{
  unint64_t v4;
  MUCompositionalStackLayoutGroupInternal *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED01B2D8);
  v4 = sub_191EEB044();
  v5 = self;
  CompositionalStackLayout.GroupRef.arrangedLayoutItems.setter(v4);

}

- (void)addArrangedLayoutItem:(id)a3
{
  sub_191DE1A58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))CompositionalStackLayout.GroupRef.addArrangedLayoutItem(_:));
}

- (void)removeArrangedLayoutItem:(id)a3
{
  sub_191DE1A58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))CompositionalStackLayout.GroupRef.removeArrangedLayoutItem(_:));
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *v5;
  double v6;
  double *v7;
  double *v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSDirectionalEdgeInsets result;

  swift_unknownObjectRetain();
  v5 = self;
  sub_191E2A9E8((uint64_t)a3, &v17);
  if (v18)
  {
    v6 = v19;
    v7 = (double *)&v20;
    v8 = (double *)&v21;
    v9 = (double *)&v22;
  }
  else
  {
    v9 = (double *)(MEMORY[0x1E0DC3298] + 24);
    v8 = (double *)(MEMORY[0x1E0DC3298] + 16);
    v7 = (double *)(MEMORY[0x1E0DC3298] + 8);
    v6 = *MEMORY[0x1E0DC3298];
  }
  v10 = *v9;
  v11 = *v8;
  v12 = *v7;
  sub_191DCA330((uint64_t)&v17, (uint64_t *)&unk_1ED01B1C8);
  swift_unknownObjectRelease();

  v13 = v6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  result.trailing = v16;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4
{
  CGFloat trailing;
  CGFloat bottom;
  CGFloat leading;
  CGFloat top;
  MUCompositionalStackLayoutGroupInternal *v10;
  CGFloat *v11;
  void (*v12)(uint64_t *, char);
  _QWORD v13[4];

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  swift_unknownObjectRetain();
  v10 = self;
  v12 = sub_191E2B0C4(v13, (uint64_t)a4);
  if (*((_QWORD *)v11 + 3))
  {
    v11[5] = top;
    v11[6] = leading;
    v11[7] = bottom;
    v11[8] = trailing;
  }
  v12(v13, 0);

  swift_unknownObjectRelease();
}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  uint64_t v11;
  double v12;
  double v13;
  UIOffset result;

  swift_unknownObjectRetain();
  v5 = self;
  sub_191E2A9E8((uint64_t)a3, &v10);
  if (v11)
    v6 = v12;
  else
    v6 = *MEMORY[0x1E0DC51A8];
  if (v11)
    v7 = v13;
  else
    v7 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
  sub_191DCA330((uint64_t)&v10, (uint64_t *)&unk_1ED01B1C8);
  swift_unknownObjectRelease();

  v8 = v6;
  v9 = v7;
  result.vertical = v9;
  result.horizontal = v8;
  return result;
}

- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4
{
  CGFloat vertical;
  CGFloat horizontal;
  MUCompositionalStackLayoutGroupInternal *v8;
  CGFloat *v9;
  void (*v10)(uint64_t *, char);
  _QWORD v11[4];

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  swift_unknownObjectRetain();
  v8 = self;
  v10 = sub_191E2B0C4(v11, (uint64_t)a4);
  if (*((_QWORD *)v9 + 3))
  {
    v9[9] = horizontal;
    v9[10] = vertical;
  }
  v10(v11, 0);

  swift_unknownObjectRelease();
}

- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  swift_unknownObjectRetain();
  v5 = self;
  sub_191E2A9E8((uint64_t)a3, &v9);
  if (v10)
  {
    v6 = v12;
    v7 = sub_191DCA330((uint64_t)&v9, (uint64_t *)&unk_1ED01B1C8);
    (*(void (**)(__int128 *__return_ptr, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v5->super.isa) + 0x58))(&v9, v7);
    sub_191E2C75C((uint64_t)&v9);
    LODWORD(v6) = ~sub_191E1ACC8(v11, v6);
    swift_unknownObjectRelease();

    return (v6 & 0xFFFFFFFE) != 0;
  }
  else
  {
    sub_191DCA330((uint64_t)&v9, (uint64_t *)&unk_1ED01B1C8);
    swift_unknownObjectRelease();

    return 0;
  }
}

- (void)disableAlignmentForArrangedLayoutItem:(id)a3
{
  sub_191E2B7A0(self, (uint64_t)a2, (uint64_t)a3, 3221225470);
}

- (void)resetAlignmentForArrangedLayoutItem:(id)a3
{
  sub_191E2B7A0(self, (uint64_t)a2, (uint64_t)a3, 4294967294);
}

- (int64_t)alignmentForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *v5;
  int64_t v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = CompositionalStackLayout.GroupRef.alignmentKind(forArrangedLayoutItem:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  MUCompositionalStackLayoutGroupInternal *v7;

  swift_unknownObjectRetain();
  v7 = self;
  CompositionalStackLayout.GroupRef.setAlignmentKind(_:forArrangedLayoutItem:)(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

}

- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *v5;
  char v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = CompositionalStackLayout.GroupRef.alignmentBoundsContent(forArrangedLayoutItem:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  _BOOL8 v5;
  MUCompositionalStackLayoutGroupInternal *v7;

  v5 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  CompositionalStackLayout.GroupRef.setAlignmentBoundsContent(_:forArrangedLayoutItem:)(v5, (uint64_t)a4);
  swift_unknownObjectRelease();

}

- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  MUCompositionalStackLayoutGroupInternal *v5;
  float v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = CompositionalStackLayout.GroupRef.alignmentFittingSizePriority(forArrangedLayoutItem:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  MUCompositionalStackLayoutGroupInternal *v7;

  swift_unknownObjectRetain();
  v7 = self;
  CompositionalStackLayout.GroupRef.setAlignmentFittingSizePriority(_:forArrangedLayoutItem:)((uint64_t)a4, a3);
  swift_unknownObjectRelease();

}

- (MUCompositionalStackLayoutGroupInternal)init
{
  MUCompositionalStackLayoutGroupInternal *result;

  result = (MUCompositionalStackLayoutGroupInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
