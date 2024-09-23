@implementation HomeManager

- (BOOL)homesLoaded
{
  return sub_23A7CF040() & 1;
}

- (void)setHomesLoaded:(BOOL)a3
{
  sub_23A7CF0A0(a3);
}

- (_TtC10DropInCore11HomeManager)init
{
  _TtC10DropInCore11HomeManager *result;

  HomeManager.init()();
  return result;
}

- (void)loadHomes:(id)a3
{
  void *v4;
  _TtC10DropInCore11HomeManager *v5;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_23A7CF4BC();

  swift_release();
}

- (void)loadHomeSynchronous
{
  _TtC10DropInCore11HomeManager *v2;

  v2 = self;
  sub_23A7CF90C();

}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;

  swift_unknownObjectRetain();
  v6 = a4;
  self;
  sub_23A7CF944();
}

- (NSArray)allHomes
{
  _TtC10DropInCore11HomeManager *v2;
  void *v3;

  v2 = self;
  sub_23A7CFC94();

  sub_23A77E424(0, &qword_2542D7050);
  v3 = (void *)sub_23A7F21CC();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (HMHome)currentHome
{
  _TtC10DropInCore11HomeManager *v2;
  id v3;

  v2 = self;
  v3 = sub_23A7CFCC8();

  return (HMHome *)v3;
}

- (HMAccessory)currentAccessory
{
  _TtC10DropInCore11HomeManager *v2;
  id v3;

  v2 = self;
  v3 = sub_23A7CFD24();

  return (HMAccessory *)v3;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;

  v4 = a3;
  self;
  HomeManager.homeManagerDidUpdateHomes(_:)((HMHomeManager)v4);
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6;

  v6 = a3;
  HomeManager.homeManager(_:didAdd:)((HMHomeManager)self, (HMHome)a4);
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6;

  v6 = a3;
  HomeManager.homeManager(_:didRemove:)((HMHomeManager)self, (HMHome)a4);
}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  id v4;

  v4 = a3;
  self;
  HomeManager.homeDidUpdateAccessControl(forCurrentUser:)((HMHome)v4);
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  HomeManager.home(_:didAdd:)((HMHome)v6, (HMAccessory)v7);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  HomeManager.home(_:didRemove:)((HMHome)v6, (HMAccessory)v7);
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  HomeManager.home(_:didAdd:)((HMHome)v6, (HMUser)v7);
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  HomeManager.home(_:didRemove:)((HMHome)v6, (HMUser)v7);
}

- (void)accessoryDidUpdateName:(id)a3
{
  id v4;

  v4 = a3;
  self;
  HomeManager.accessoryDidUpdateName(_:)((HMAccessory)v4);
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  id v4;

  v4 = a3;
  self;
  HomeManager.accessoryDidUpdateControllable(_:)((HMAccessory)v4);
}

@end
