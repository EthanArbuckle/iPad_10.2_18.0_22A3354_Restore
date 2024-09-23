@implementation SFTabSwitcherSection

- (SFTabSwitcherSection)initWithIdentifier:(id)a3
{
  return (SFTabSwitcherSection *)sub_18B98F9D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18B98F854);
}

- (int64_t)hash
{
  SFTabSwitcherSection *v2;
  int64_t v3;

  v2 = self;
  v3 = SFTabSwitcherSection.hash.getter();

  return v3;
}

- (NSUUID)identifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = sub_18BAC0088();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherSection__internal)
     + OBJC_IVAR____TtC12MobileSafari28SFTabSwitcherSectionInternal_wrapped;
  swift_beginAccess();
  v8 = _s7SectionVMa();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 20)], v3);
  v9 = (void *)sub_18BAC0058();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v9;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  SFTabSwitcherSection *v7;
  uint64_t v8;

  v4 = sub_18BAC0088();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC0070();
  v7 = self;
  sub_18B98FCF0((uint64_t)v6);

}

- (BOOL)isEqual:(id)a3
{
  return sub_18B9900E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SFTabSwitcherSection.isEqual(_:));
}

- (BOOL)isPinned
{
  char *v2;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherSection__internal)
     + OBJC_IVAR____TtC12MobileSafari28SFTabSwitcherSectionInternal_wrapped;
  swift_beginAccess();
  return v2[*(int *)(_s7SectionVMa() + 24)];
}

- (void)setIsPinned:(BOOL)a3
{
  SFTabSwitcherSection *v4;

  v4 = self;
  sub_18B990204(a3);

}

- (NSArray)items
{
  return (NSArray *)sub_18B98D194(self, (uint64_t)a2, (void (*)(void))sub_18B990348, (void (*)(void))type metadata accessor for SFTabSwitcherItem);
}

- (void)setItems:(id)a3
{
  sub_18B98EEB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for SFTabSwitcherItem, (void (*)(uint64_t))sub_18B9905B4);
}

- (NSString)title
{
  void *v2;

  swift_beginAccess();
  _s7SectionVMa();
  sub_18BABFD34();
  v2 = (void *)sub_18BAC0DCC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  sub_18B990A0C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_18B990A6C);
}

- (void).cxx_destruct
{

}

@end
