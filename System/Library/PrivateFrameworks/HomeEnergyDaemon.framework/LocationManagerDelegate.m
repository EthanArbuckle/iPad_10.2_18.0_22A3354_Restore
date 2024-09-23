@implementation LocationManagerDelegate

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC16HomeEnergyDaemon23LocationManagerDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_23E69EF34(v4);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v6;
  _TtC16HomeEnergyDaemon23LocationManagerDelegate *v7;
  id v8;

  sub_23E5DC5A0(0, &qword_254337DC8);
  v6 = sub_23E718C38();
  v8 = a3;
  v7 = self;
  sub_23E69F15C(v6);
  swift_bridgeObjectRelease();

}

- (_TtC16HomeEnergyDaemon23LocationManagerDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocationManagerDelegate();
  return -[LocationManagerDelegate init](&v3, sel_init);
}

@end
