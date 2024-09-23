@implementation MIUIMedicalIDLearnMoreNavigationViewControllerFactory

+ (id)makeViewController
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  Class v8;
  id v9;
  uint64_t v11;

  v2 = type metadata accessor for MedicalIDLearnMoreNavigationView();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v11 - v6;
  *v5 = swift_getKeyPath();
  sub_2415F630C();
  swift_storeEnumTagMultiPayload();
  sub_2415F6360((uint64_t)v5, (uint64_t)v7);
  sub_2415F63A4();
  v9 = objc_allocWithZone(v8);
  return (id)sub_2416BA54C();
}

- (MIUIMedicalIDLearnMoreNavigationViewControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIUIMedicalIDLearnMoreNavigationViewControllerFactory;
  return -[MIUIMedicalIDLearnMoreNavigationViewControllerFactory init](&v3, sel_init);
}

@end
