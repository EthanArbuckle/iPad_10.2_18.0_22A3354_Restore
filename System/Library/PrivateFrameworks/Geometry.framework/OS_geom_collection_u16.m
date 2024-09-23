@implementation OS_geom_collection_u16

- (OS_geom_collection_u16)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  objc_class *isa;
  objc_super v4;

  isa = self[2].super.isa;
  if (isa)
  {
    self[3].super.isa = isa;
    operator delete(isa);
  }
  v4.receiver = self;
  v4.super_class = (Class)OS_geom_collection_u16;
  -[OS_geom_collection_u16 dealloc](&v4, sel_dealloc);
}

@end
