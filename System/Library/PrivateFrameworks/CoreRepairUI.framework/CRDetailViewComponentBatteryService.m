@implementation CRDetailViewComponentBatteryService

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (objc_class *)objc_opt_new();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

@end
