@implementation SFTabSwitcherItem

- (SFTabSwitcherItem)initWithIdentifier:(id)a3
{
  return (SFTabSwitcherItem *)sub_18B98F9D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18B98BD8C);
}

- (int64_t)hash
{
  return sub_18B98DB14((char *)self, (uint64_t)a2, (uint64_t (*)(_QWORD))_s4ItemVMa, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);
}

- (BOOL)canBeClosed
{
  return sub_18B98D4BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);
}

- (void)setCanBeClosed:(BOOL)a3
{
  SFTabSwitcherItem *v4;

  v4 = self;
  sub_18B98D55C(a3, (uint64_t (*)(_QWORD))_s4ItemVMa, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);

}

- (BOOL)canBeCopied
{
  return sub_18B98D694((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);
}

- (void)setCanBeCopied:(BOOL)a3
{
  SFTabSwitcherItem *v4;

  v4 = self;
  sub_18B98D734(a3, (uint64_t (*)(_QWORD))_s4ItemVMa, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);

}

- (BOOL)canBePinned
{
  return sub_18B98D86C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);
}

- (void)setCanBePinned:(BOOL)a3
{
  SFTabSwitcherItem *v4;

  v4 = self;
  sub_18B98D90C(a3, (uint64_t (*)(_QWORD))_s4ItemVMa, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);

}

- (NSUUID)identifier
{
  return (NSUUID *)sub_18B98DD88((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped, (uint64_t (*)(_QWORD))_s4ItemVMa);
}

- (void)setIdentifier:(id)a3
{
  sub_18B98DE88(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))_s4ItemVMa, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18B9900E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SFTabSwitcherItem.isEqual(_:));
}

- (BOOL)isInteractivelyInserted
{
  char *v2;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  return v2[*(int *)(_s4ItemVMa() + 32)];
}

- (void)setIsInteractivelyInserted:(BOOL)a3
{
  SFTabSwitcherItem *v4;

  v4 = self;
  sub_18B98C248(a3);

}

- (BOOL)isUnread
{
  char *v2;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  return v2[*(int *)(_s4ItemVMa() + 44)];
}

- (void)setIsUnread:(BOOL)a3
{
  SFTabSwitcherItem *v4;

  v4 = self;
  sub_18B98C414(a3);

}

- (unint64_t)mediaStateIcon
{
  char *v2;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  return *(_QWORD *)&v2[*(int *)(_s4ItemVMa() + 48)];
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  SFTabSwitcherItem *v4;

  v4 = self;
  sub_18B98C5E0(a3);

}

- (id)searchPredicate
{
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  _QWORD aBlock[6];

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  v3 = &v2[*(int *)(_s4ItemVMa() + 52)];
  v4 = *((_QWORD *)v3 + 1);
  aBlock[4] = *(_QWORD *)v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18B98C7CC;
  aBlock[3] = &block_descriptor_108;
  v5 = _Block_copy(aBlock);
  sub_18BABFBB4();
  swift_release();
  return v5;
}

- (void)setSearchPredicate:(id)a3
{
  void *v4;
  uint64_t v5;
  SFTabSwitcherItem *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_18B997C74((uint64_t)sub_18B998C18, v5);

  swift_release();
}

- (NSArray)shareParticipants
{
  void *v2;

  swift_beginAccess();
  _s4ItemVMa();
  sub_18B8918E0(0, &qword_1EDFEB848);
  sub_18BABFD34();
  v2 = (void *)sub_18BAC0F1C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setShareParticipants:(id)a3
{
  uint64_t v4;
  SFTabSwitcherItem *v5;

  sub_18B8918E0(0, &qword_1EDFEB848);
  v4 = sub_18BAC0F28();
  v5 = self;
  sub_18B98C99C(v4);

}

- (NSString)title
{
  char *v2;
  void *v3;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  if (!*(_QWORD *)&v2[*(int *)(_s4ItemVMa() + 60) + 8])
    return (NSString *)0;
  sub_18BABFD34();
  v3 = (void *)sub_18BAC0DCC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SFTabSwitcherItem *v7;

  if (a3)
  {
    v4 = sub_18BAC0DFC();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_18B98CBE8(v4, v6);

}

- (void).cxx_destruct
{

}

- (id)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v9;

  v2 = sub_18BAC0088();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BABF9D4();
  v6 = (void *)sub_18BAC0058();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v7 = objc_msgSend(a1, sel_initWithIdentifier_, v6);

  return v7;
}

@end
