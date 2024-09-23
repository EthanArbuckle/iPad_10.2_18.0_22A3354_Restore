@implementation GDVUSocialGroup

- (GDVUSocialGroup)initWithNumberOfMomentNodes:(id)a3 tags:(id)a4
{
  id v5;
  GDVUSocialGroup *result;

  sub_1AE924918();
  sub_1AE9261CC();
  v5 = a3;
  GDVUSocialGroup.init(numberOfMomentNodes:tags:)(a3);
  return result;
}

- (NSNumber)numberOfMomentNodes
{
  GDVUSocialGroup *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AE8D88B0();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSArray)tags
{
  return (NSArray *)sub_1AE8D8978(self, (uint64_t)a2, sub_1AE8D89B4);
}

- (GDVUSocialGroup)init
{
  GDVUSocialGroup.init()();
}

- (void).cxx_destruct
{
  sub_1AE501338();
}

@end
