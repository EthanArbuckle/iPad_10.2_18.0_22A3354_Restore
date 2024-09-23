@implementation HomeEnergyListener

- (_TtC16HomeEnergyDaemon18HomeEnergyListener)init
{
  return (_TtC16HomeEnergyDaemon18HomeEnergyListener *)HomeEnergyListener.init()();
}

- (void)dealloc
{
  _TtC16HomeEnergyDaemon18HomeEnergyListener *v2;

  v2 = self;
  HomeEnergyListener.__deallocating_deinit();
}

- (void).cxx_destruct
{

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC16HomeEnergyDaemon18HomeEnergyListener *v8;
  void *v9;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)MEMORY[0x242651F34]();
  sub_23E5DCFCC(v7, (char *)&v11);
  objc_autoreleasePoolPop(v9);

  return v11;
}

@end
