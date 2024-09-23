@implementation HRUITableViewSectionConfiguration

- (NSArray)sections
{
  return (NSArray *)sub_1BC518E64((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___HRUITableViewSectionConfiguration_sections, (void (*)(uint64_t))type metadata accessor for TableViewSection);
}

- (void)setSections:(id)a3
{
  sub_1BC518F34((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for TableViewSection, &OBJC_IVAR___HRUITableViewSectionConfiguration_sections);
}

- (HRUITableViewSectionConfiguration)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUITableViewSectionConfiguration_sections) = (Class)MEMORY[0x1E0DEE9D8];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TableViewSectionConfiguration();
  return -[HRUITableViewSectionConfiguration init](&v3, sel_init);
}

- (void)addSection:(id)a3
{
  sub_1BC519468((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___HRUITableViewSectionConfiguration_sections);
}

- (id)addSectionWithIdentifier:(id)a3 firstRowReuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HRUITableViewSectionConfiguration *v13;
  id v14;

  if (!a3)
  {
    v6 = 0;
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v12 = MEMORY[0x1E0DEE9D8];
    goto LABEL_6;
  }
  v6 = sub_1BC62C680();
  v8 = v7;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v9 = sub_1BC62C680();
  v11 = v10;
  sub_1BC359F44();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BC639590;
  *(_QWORD *)(v12 + 32) = v9;
  *(_QWORD *)(v12 + 40) = v11;
LABEL_6:
  v13 = self;
  swift_bridgeObjectRetain();
  v14 = sub_1BC5181E0(v6, v8, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

- (id)addSectionWithIdentifier:(id)a3 rowReuseIdentifiers:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  HRUITableViewSectionConfiguration *v9;
  id v10;

  if (a3)
  {
    v5 = sub_1BC62C680();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = sub_1BC62C878();
  v9 = self;
  v10 = sub_1BC5181E0(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (void)removeAllSections
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HRUITableViewSectionConfiguration_sections);
  swift_beginAccess();
  *v2 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  HRUITableViewSectionConfiguration *v4;
  int64_t v5;

  v4 = self;
  v5 = sub_1BC51869C(a3);

  return v5;
}

- (id)rowAtIndexPath:(id)a3
{
  id v4;
  HRUITableViewSectionConfiguration *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1BC518848(v4);

  return v6;
}

- (NSString)description
{
  HRUITableViewSectionConfiguration *v2;
  void *v3;

  v2 = self;
  sub_1BC518AFC();

  v3 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
