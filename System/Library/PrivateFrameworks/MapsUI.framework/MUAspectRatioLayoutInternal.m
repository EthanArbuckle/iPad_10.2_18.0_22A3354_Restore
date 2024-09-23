@implementation MUAspectRatioLayoutInternal

- (MUAspectRatioLayoutInternal)initWithItem:(id)a3 aspectRatio:(double)a4
{
  MUAspectRatioLayoutInternal *v6;

  swift_unknownObjectRetain();
  v6 = (MUAspectRatioLayoutInternal *)sub_191E1AA6C(a3, a4);
  swift_unknownObjectRelease();
  return v6;
}

- (MULayoutItem)item
{
  MUAspectRatioLayoutInternal *v2;
  void *v3;
  _BYTE v5[16];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = (void *)MEMORY[0x1940213B8](v5);
  sub_191DBE818((uint64_t)v5);

  return (MULayoutItem *)v3;
}

- (void)setItem:(id)a3
{
  MUAspectRatioLayoutInternal *v4;
  _BYTE v5[16];
  _BYTE v6[16];

  v4 = self;
  if (a3)
    objc_msgSend((id)swift_unknownObjectRetain(), sel__mapsui_disableTranslatesAutoresizingMaskIntoConstraints);
  sub_191E0F534((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_191E1AB10((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DBE818((uint64_t)v6);

  swift_unknownObjectRelease();
}

- (double)aspectRatio
{
  MUAspectRatioLayoutInternal *v2;
  double v3;
  _QWORD v5[2];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = *(double *)&v5[1];
  sub_191DBE818((uint64_t)v5);

  return v3;
}

- (void)setAspectRatio:(double)a3
{
  MUAspectRatioLayoutInternal *v4;
  _BYTE v5[16];
  _BYTE v6[8];
  double v7;

  v4 = self;
  sub_191E0F534((uint64_t)v6);
  v7 = a3;
  sub_191E1AB10((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191DBE818((uint64_t)v6);

}

- (void).cxx_destruct
{
  swift_release();
}

@end
