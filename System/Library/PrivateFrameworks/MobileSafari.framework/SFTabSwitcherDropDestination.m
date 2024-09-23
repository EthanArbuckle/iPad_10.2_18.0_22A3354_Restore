@implementation SFTabSwitcherDropDestination

- (SFTabSwitcherDropDestination)initWithPage:(id)a3 section:(id)a4 droppingBefore:(id)a5
{
  id v7;
  id v8;
  id v9;
  SFTabSwitcherDropDestination *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (SFTabSwitcherDropDestination *)sub_18B997968((uint64_t)v7, (uint64_t)v8, (uint64_t)a5);

  return v10;
}

- (SFTabSwitcherPage)page
{
  SFTabSwitcherDropDestination *v2;
  id v3;

  v2 = self;
  v3 = sub_18B98B4DC();

  return (SFTabSwitcherPage *)v3;
}

- (SFTabSwitcherSection)section
{
  SFTabSwitcherDropDestination *v2;
  id v3;

  v2 = self;
  v3 = sub_18B98B674();

  return (SFTabSwitcherSection *)v3;
}

- (SFTabSwitcherItem)item
{
  SFTabSwitcherDropDestination *v2;
  id v3;

  v2 = self;
  v3 = sub_18B98B81C();

  return (SFTabSwitcherItem *)v3;
}

- (SFTabSwitcherDropDestination)init
{
  SFTabSwitcherDropDestination *result;

  result = (SFTabSwitcherDropDestination *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
