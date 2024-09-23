@implementation SFTabSwitcherContent

- (SFTabSwitcherContent)init
{
  return (SFTabSwitcherContent *)sub_18B98A854();
}

- (NSArray)pages
{
  return (NSArray *)sub_18B98D194(self, (uint64_t)a2, (void (*)(void))sub_18B98A9CC, (void (*)(void))type metadata accessor for SFTabSwitcherPage);
}

- (void)setPages:(id)a3
{
  sub_18B98EEB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for SFTabSwitcherPage, (void (*)(uint64_t))sub_18B98AC2C);
}

- (SFTabSwitcherProfile)profileForInsertedPages
{
  SFTabSwitcherContent *v2;
  id v3;

  v2 = self;
  v3 = sub_18B98B00C();

  return (SFTabSwitcherProfile *)v3;
}

- (void)setProfileForInsertedPages:(id)a3
{
  SFTabSwitcherContent *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18B9975C8((uint64_t)a3);

}

- (SFTabSwitcherItem)selectedItem
{
  SFTabSwitcherContent *v2;
  id v3;

  v2 = self;
  v3 = sub_18B98B144();

  return (SFTabSwitcherItem *)v3;
}

- (void)setSelectedItem:(id)a3
{
  SFTabSwitcherContent *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18B997754((uint64_t)a3);

}

- (void).cxx_destruct
{

}

@end
