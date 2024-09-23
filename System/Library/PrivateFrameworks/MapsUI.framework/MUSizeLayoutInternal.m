@implementation MUSizeLayoutInternal

+ (double)useIntrinsicContentSize
{
  if (qword_1ED01B720 != -1)
    swift_once();
  return *(double *)&static SizeLayout.useIntrinsicContentSize;
}

- (MUSizeLayoutInternal)initWithItem:(id)a3 size:(CGSize)a4
{
  double v4;

  LODWORD(v4) = 1148846080;
  return -[MUSizeLayoutInternal initWithItem:size:priority:](self, sel_initWithItem_size_priority_, a3, a4.width, a4.height, v4);
}

- (MUSizeLayoutInternal)initWithItem:(id)a3 size:(CGSize)a4 priority:(float)a5
{
  double height;
  double width;

  height = a4.height;
  width = a4.width;
  swift_unknownObjectRetain();
  return (MUSizeLayoutInternal *)SizeLayout.init(item:size:priority:)((uint64_t)a3, width, height, a5);
}

- (MULayoutItem)item
{
  MUSizeLayoutInternal *v2;
  void *v3;
  _BYTE v5[40];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = (void *)MEMORY[0x1940213B8](v5);
  sub_191DBE818((uint64_t)v5);

  return (MULayoutItem *)v3;
}

- (void)setItem:(id)a3
{
  MUSizeLayoutInternal *v4;
  _BYTE v5[40];
  _BYTE v6[40];

  v4 = self;
  if (a3)
    objc_msgSend((id)swift_unknownObjectRetain(), sel__mapsui_disableTranslatesAutoresizingMaskIntoConstraints);
  sub_191E0F534((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_191DE45EC((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DBE818((uint64_t)v6);
  swift_unknownObjectRelease();

}

- (CGSize)size
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  MUSizeLayoutInternal *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0x88);
  v4 = self;
  v5 = v3();
  if ((v6 & 1) != 0)
  {
    if (qword_1ED01B720 != -1)
      swift_once();
    v7 = static SizeLayout.useIntrinsicContentSize;
  }
  else
  {
    v7 = v5;
  }
  v8 = (*(uint64_t (**)(void))((*v2 & (uint64_t)v4->super.super.isa) + 0xA0))();
  if ((v9 & 1) != 0)
  {
    if (qword_1ED01B720 != -1)
      swift_once();
    v11 = static SizeLayout.useIntrinsicContentSize;

  }
  else
  {
    v10 = v8;

    v11 = v10;
  }
  v12 = *(double *)&v7;
  v13 = *(double *)&v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height;
  double width;
  MUSizeLayoutInternal *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  SizeLayout.size.setter(width, height);

}

- (float)priority
{
  MUSizeLayoutInternal *v2;
  float v3;
  _BYTE v5[36];
  float v6;

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = v6;
  sub_191DBE818((uint64_t)v5);

  return v3;
}

- (void)setPriority:(float)a3
{
  MUSizeLayoutInternal *v4;
  _BYTE v5[40];
  _BYTE v6[36];
  float v7;

  v4 = self;
  sub_191E0F534((uint64_t)v6);
  v7 = a3;
  sub_191DE45EC((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DBE818((uint64_t)v6);

}

- (void).cxx_destruct
{
  swift_release();
}

@end
