@implementation SFTabSwitcherPage

- (SFTabSwitcherPage)initWithIdentifier:(id)a3
{
  return (SFTabSwitcherPage *)sub_18B98F9D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18B98CF98);
}

- (NSArray)allItems
{
  return (NSArray *)sub_18B98D194(self, (uint64_t)a2, (void (*)(void))sub_18B98D1F0, (void (*)(void))type metadata accessor for SFTabSwitcherItem);
}

- (BOOL)allowsLargeTitle
{
  return sub_18B98D4BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);
}

- (void)setAllowsLargeTitle:(BOOL)a3
{
  SFTabSwitcherPage *v4;

  v4 = self;
  sub_18B98D55C(a3, (uint64_t (*)(_QWORD))_s4PageVMa, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);

}

- (BOOL)allowsRetitling
{
  return sub_18B98D694((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);
}

- (void)setAllowsRetitling:(BOOL)a3
{
  SFTabSwitcherPage *v4;

  v4 = self;
  sub_18B98D734(a3, (uint64_t (*)(_QWORD))_s4PageVMa, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);

}

- (BOOL)allowsSharing
{
  return sub_18B98D86C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);
}

- (void)setAllowsSharing:(BOOL)a3
{
  SFTabSwitcherPage *v4;

  v4 = self;
  sub_18B98D90C(a3, (uint64_t (*)(_QWORD))_s4PageVMa, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);

}

- (BOOL)hasAnyItems
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  SFTabSwitcherPage *v7;
  uint64_t v9;

  v3 = _s4PageVMa();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  sub_18B894B48(v6, (uint64_t)v5, (uint64_t (*)(_QWORD))_s4PageVMa);
  v7 = self;
  LOBYTE(v6) = sub_18BA8D000();
  sub_18B894A9C((uint64_t)v5, (uint64_t (*)(_QWORD))_s4PageVMa);

  return v6 & 1;
}

- (int64_t)hash
{
  return sub_18B98DB14((char *)self, (uint64_t)a2, (uint64_t (*)(_QWORD))_s4PageVMa, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);
}

- (NSUUID)identifier
{
  return (NSUUID *)sub_18B98DD88((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped, (uint64_t (*)(_QWORD))_s4PageVMa);
}

- (void)setIdentifier:(id)a3
{
  sub_18B98DE88(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))_s4PageVMa, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);
}

- (UIImage)image
{
  char *v2;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  return (UIImage *)*(id *)&v2[*(int *)(_s4PageVMa() + 32)];
}

- (void)setImage:(id)a3
{
  SFTabSwitcherPage *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18B997DD4(a3);

}

- (BOOL)isEqual:(id)a3
{
  return sub_18B9900E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SFTabSwitcherPage.isEqual(_:));
}

- (BOOL)isLocked
{
  char *v2;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  return v2[*(int *)(_s4PageVMa() + 40)];
}

- (void)setIsLocked:(BOOL)a3
{
  SFTabSwitcherPage *v4;

  v4 = self;
  SFTabSwitcherPage.isLocked.setter(a3);

}

- (int64_t)itemCount
{
  SFTabSwitcherPage *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_18B98E570();

  return v3;
}

- (BOOL)itemsCanMoveBetweenPages
{
  char *v2;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  return v2[*(int *)(_s4PageVMa() + 48)];
}

- (void)setItemsCanMoveBetweenPages:(BOOL)a3
{
  SFTabSwitcherPage *v4;

  v4 = self;
  sub_18B98E79C(a3);

}

- (SFTabSwitcherPageOverlay)overlay
{
  SFTabSwitcherPage *v2;
  id v3;

  v2 = self;
  v3 = sub_18B98E8FC();

  return (SFTabSwitcherPageOverlay *)v3;
}

- (void)setOverlay:(id)a3
{
  SFTabSwitcherPage *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18B997F24((unint64_t)a3);

}

- (SFTabSwitcherPagePeekingOverlay)peekingOverlay
{
  char *v2;
  uint64_t v3;
  SFTabSwitcherPage *v4;
  int v5;
  _BYTE *v6;
  objc_super v8;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  v3 = _s4PageVMa();
  v4 = 0;
  v5 = v2[*(int *)(v3 + 56)];
  if (v5 != 3)
  {
    v6 = objc_allocWithZone((Class)SFTabSwitcherPagePeekingOverlay);
    v6[OBJC_IVAR___SFTabSwitcherPagePeekingOverlay_wrapped] = v5;
    v8.receiver = v6;
    v8.super_class = (Class)SFTabSwitcherPagePeekingOverlay;
    v4 = -[SFTabSwitcherPage init](&v8, sel_init);
  }
  return (SFTabSwitcherPagePeekingOverlay *)v4;
}

- (void)setPeekingOverlay:(id)a3
{
  SFTabSwitcherPage *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18B99809C((uint64_t)a3);

}

- (SFTabSwitcherProfile)profile
{
  SFTabSwitcherPage *v2;
  id v3;

  v2 = self;
  v3 = sub_18B98EB18();

  return (SFTabSwitcherProfile *)v3;
}

- (void)setProfile:(id)a3
{
  SFTabSwitcherPage *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18B9981E4((uint64_t)a3);

}

- (NSArray)sections
{
  return (NSArray *)sub_18B98D194(self, (uint64_t)a2, (void (*)(void))sub_18B98EC44, (void (*)(void))type metadata accessor for SFTabSwitcherSection);
}

- (void)setSections:(id)a3
{
  sub_18B98EEB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for SFTabSwitcherSection, (void (*)(uint64_t))sub_18B98EF14);
}

- (SFTabSwitcherShareConfiguration)shareConfiguration
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  id v11;
  objc_super v13;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  v3 = &v2[*(int *)(_s4PageVMa() + 68)];
  v4 = *(void **)v3;
  v5 = (void *)*((_QWORD *)v3 + 1);
  v7 = *((_QWORD *)v3 + 2);
  v6 = *((_QWORD *)v3 + 3);
  v8 = (char *)objc_allocWithZone((Class)SFTabSwitcherShareConfiguration);
  v9 = &v8[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped];
  *(_QWORD *)v9 = v4;
  *((_QWORD *)v9 + 1) = v5;
  *((_QWORD *)v9 + 2) = v7;
  *((_QWORD *)v9 + 3) = v6;
  v13.receiver = v8;
  v13.super_class = (Class)SFTabSwitcherShareConfiguration;
  v10 = v4;
  v11 = v5;
  sub_18BABFBB4();
  return (SFTabSwitcherShareConfiguration *)-[SFTabSwitcherPage init](&v13, sel_init);
}

- (void)setShareConfiguration:(id)a3
{
  SFTabSwitcherPage *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_18B998384((uint64_t)v5);

}

- (NSString)title
{
  void *v2;

  swift_beginAccess();
  _s4PageVMa();
  sub_18BABFD34();
  v2 = (void *)sub_18BAC0DCC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  sub_18B990A0C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_18B98F470);
}

- (void).cxx_destruct
{

}

@end
