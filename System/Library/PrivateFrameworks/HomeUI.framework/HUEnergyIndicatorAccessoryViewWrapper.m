@implementation HUEnergyIndicatorAccessoryViewWrapper

+ (void)updateWithEnergyIndicatorView:(id)a3 with:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  _s6HomeUI35EnergyIndicatorAccessoryViewWrapperC6update06energydF04withySo16UIViewControllerC_So6HMHomeCtFZ_0(v5, v6);

}

+ (id)createEnergyIndicatorViewWithHome:(id)a3
{
  id v4;
  id v5;

  v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F608));
  v5 = a3;
  return (id)sub_1B93ED4FC();
}

- (HUEnergyIndicatorAccessoryViewWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EnergyIndicatorAccessoryViewWrapper();
  return -[HUEnergyIndicatorAccessoryViewWrapper init](&v3, sel_init);
}

@end
