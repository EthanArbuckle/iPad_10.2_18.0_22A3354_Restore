@implementation APFeatureSemioticsManager

+ (APFeatureSemioticsManager)sharedManager
{
  if (qword_2542A6610 != -1)
    swift_once();
  return (APFeatureSemioticsManager *)(id)qword_2542A6608;
}

- (id)titleForEnablementAction:(unint64_t)a3 ofFeature:(unint64_t)a4
{
  return sub_2362F87A0((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_2362F8A18);
}

- (id)systemImageNameForEnablementAction:(unint64_t)a3 ofFeature:(unint64_t)a4
{
  return sub_2362F87A0((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_2362F8DC0);
}

- (id)systemImageNameForCurrentBestAuthenticationMechanism
{
  APFeatureSemioticsManager *v2;
  id result;
  void *v4;

  v2 = self;
  switch(APGetPreferredAuthenticationMechanism())
  {
    case 0:

      result = 0;
      break;
    case 1:
    case 2:
    case 3:

      v4 = (void *)sub_2362FF938();
      swift_bridgeObjectRelease();
      result = v4;
      break;
    default:
      type metadata accessor for APAuthenticationMechanism(0);
      result = (id)sub_2362FFAF4();
      __break(1u);
      break;
  }
  return result;
}

- (id)localizedDescriptionForCurrentBestAuthenticationMechanism
{
  APFeatureSemioticsManager *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id result;

  v2 = self;
  v3 = APGetPreferredAuthenticationMechanism();
  if ((unint64_t)(v3 - 1) < 3)
  {
    v4 = APGetAuthenticationMechanismLocalizedDescription(v3);
    sub_2362FF944();

    v5 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
    return v5;
  }
  if (!v3)
  {

    v5 = 0;
    return v5;
  }
  type metadata accessor for APAuthenticationMechanism(0);
  result = (id)sub_2362FFAF4();
  __break(1u);
  return result;
}

- (APFeatureSemioticsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APFeatureSemioticsManager;
  return -[APFeatureSemioticsManager init](&v3, sel_init);
}

@end
