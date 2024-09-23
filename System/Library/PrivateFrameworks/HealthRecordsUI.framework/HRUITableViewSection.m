@implementation HRUITableViewSection

- (NSString)identifier
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRUITableViewSection_identifier);
}

- (void)setIdentifier:(id)a3
{
  sub_1BC518D88((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___HRUITableViewSection_identifier);
}

- (NSString)headerString
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRUITableViewSection_headerString);
}

- (void)setHeaderString:(id)a3
{
  sub_1BC518D88((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___HRUITableViewSection_headerString);
}

- (NSString)footerString
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRUITableViewSection_footerString);
}

- (void)setFooterString:(id)a3
{
  sub_1BC518D88((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___HRUITableViewSection_footerString);
}

- (NSArray)rows
{
  return (NSArray *)sub_1BC518E64((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___HRUITableViewSection_rows, (void (*)(uint64_t))type metadata accessor for TableViewRow);
}

- (void)setRows:(id)a3
{
  sub_1BC518F34((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for TableViewRow, &OBJC_IVAR___HRUITableViewSection_rows);
}

- (NSNumber)estimatedNumRows
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HRUITableViewSection_estimatedNumRows);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setEstimatedNumRows:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___HRUITableViewSection_estimatedNumRows);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (HRUITableViewSection)initWithIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = sub_1BC62C680();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (HRUITableViewSection *)TableViewSection.init(identifier:)(v3, v4);
}

- (void)addRow:(id)a3
{
  sub_1BC519468((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___HRUITableViewSection_rows);
}

- (void)addRowForReuseIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  uint64_t *v9;
  HRUITableViewSection *v10;
  _QWORD *v11;
  uint64_t v12;
  objc_super v13;

  v4 = sub_1BC62C680();
  v6 = v5;
  v7 = (objc_class *)type metadata accessor for TableViewRow();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = (uint64_t *)&v8[OBJC_IVAR___HRUITableViewRow_reuseIdentifier];
  *v9 = v4;
  v9[1] = v6;
  v13.receiver = v8;
  v13.super_class = v7;
  v10 = self;
  swift_bridgeObjectRetain();
  -[HRUITableViewSection init](&v13, sel_init);
  v11 = (Class *)((char *)&v10->super.isa + OBJC_IVAR___HRUITableViewSection_rows);
  v12 = swift_beginAccess();
  MEMORY[0x1BCCF1B30](v12);
  if (*(_QWORD *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1BC62C8B4();
  sub_1BC62C8D8();
  sub_1BC62C890();
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (HRUITableViewSection)init
{
  HRUITableViewSection *result;

  result = (HRUITableViewSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
