@implementation MUEdgeLayoutInternal

- (MUEdgeLayoutInternal)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5 edges:(unint64_t)a6 priority:(float)a7
{
  double trailing;
  double bottom;
  double leading;
  double top;
  MUEdgeLayoutInternal *v15;

  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v15 = (MUEdgeLayoutInternal *)sub_191DD6E50(a3, top, leading, bottom, trailing, a7, (uint64_t)a4, a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v15;
}

- (MUEdgeLayoutInternal)initWithItem:(id)a3 container:(id)a4
{
  return -[MUEdgeLayoutInternal initWithItem:container:insets:](self, sel_initWithItem_container_insets_, a3, a4, *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
}

- (MUEdgeLayoutInternal)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5
{
  double v5;

  LODWORD(v5) = 1148846080;
  return -[MUEdgeLayoutInternal initWithItem:container:insets:edges:priority:](self, sel_initWithItem_container_insets_edges_priority_, a3, a4, 15, a5.top, a5.leading, a5.bottom, a5.trailing, v5);
}

- (MULayoutItem)item
{
  MUEdgeLayoutInternal *v2;
  void *v3;
  _BYTE v5[64];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = (void *)MEMORY[0x1940213B8](v5);
  sub_191DD6F84((uint64_t)v5);

  return (MULayoutItem *)v3;
}

- (void)setItem:(id)a3
{
  MUEdgeLayoutInternal *v4;
  _BYTE v5[64];
  _BYTE v6[64];

  v4 = self;
  if (a3)
    objc_msgSend((id)swift_unknownObjectRetain(), sel__mapsui_disableTranslatesAutoresizingMaskIntoConstraints);
  sub_191E0F534((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_191DD6FB0((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DD6F84((uint64_t)v6);
  swift_unknownObjectRelease();

}

- (MULayoutItem)container
{
  MUEdgeLayoutInternal *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;

  v2 = self;
  sub_191E0F534((uint64_t)&v5);
  v3 = (void *)MEMORY[0x1940213B8](&v6);
  sub_191DD6F84((uint64_t)&v5);

  return (MULayoutItem *)v3;
}

- (void)setContainer:(id)a3
{
  MUEdgeLayoutInternal *v4;
  _BYTE v5[64];
  _BYTE v6[64];

  swift_unknownObjectRetain();
  v4 = self;
  sub_191E0F534((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_191DD6FB0((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DD6F84((uint64_t)v6);
  swift_unknownObjectRelease();

}

- (NSDirectionalEdgeInsets)insets
{
  MUEdgeLayoutInternal *v2;
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
  v3 = *(double *)&v11[2];
  v4 = *(double *)&v11[3];
  v5 = *(double *)&v11[4];
  v6 = *(double *)&v11[5];
  sub_191DD6F84((uint64_t)v11);

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
  MUEdgeLayoutInternal *v7;
  _BYTE v8[64];
  _BYTE v9[16];
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
  sub_191DD6FB0((uint64_t)v9, (uint64_t)v8);
  sub_191E0F598((uint64_t)v8);
  sub_191DD6F84((uint64_t)v9);

}

- (unint64_t)edges
{
  MUEdgeLayoutInternal *v2;
  unint64_t v3;
  _QWORD v5[8];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = v5[6];
  sub_191DD6F84((uint64_t)v5);

  return v3;
}

- (void)setEdges:(unint64_t)a3
{
  MUEdgeLayoutInternal *v4;
  _BYTE v5[64];
  _BYTE v6[48];
  unint64_t v7;

  v4 = self;
  sub_191E0F534((uint64_t)v6);
  v7 = a3;
  sub_191DD6FB0((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DD6F84((uint64_t)v6);

}

- (float)priority
{
  MUEdgeLayoutInternal *v2;
  float v3;
  _DWORD v5[16];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = *(float *)&v5[14];
  sub_191DD6F84((uint64_t)v5);

  return v3;
}

- (void)setPriority:(float)a3
{
  MUEdgeLayoutInternal *v4;
  _BYTE v5[64];
  _BYTE v6[56];
  float v7;

  v4 = self;
  sub_191E0F534((uint64_t)v6);
  v7 = a3;
  sub_191DD6FB0((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DD6F84((uint64_t)v6);

}

- (void).cxx_destruct
{
  swift_release();
}

@end
