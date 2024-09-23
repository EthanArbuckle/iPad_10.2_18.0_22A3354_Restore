@implementation OS_geom_collection_i

- (OS_geom_collection_i)init
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
  v4.super_class = (Class)OS_geom_collection_i;
  -[OS_geom_collection_i dealloc](&v4, sel_dealloc);
}

@end
