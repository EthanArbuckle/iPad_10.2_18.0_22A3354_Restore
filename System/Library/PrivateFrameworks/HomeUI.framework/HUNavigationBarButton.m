@implementation HUNavigationBarButton

- (void)setAction:(SEL)a3
{
  HUNavigationBarButton *v4;

  v4 = self;
  sub_1B8E23A98((uint64_t)a3);

}

- (void)setMenu:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NavigationBarButton();
  v4 = a3;
  v5 = v6.receiver;
  -[HUNavigationBarButton setMenu:](&v6, sel_setMenu_, v4);
  sub_1B8E236A0();

}

- (UIMenu)menu
{
  return (UIMenu *)sub_1B8E23CD0(self, (uint64_t)a2, (SEL *)&selRef_menu);
}

- (void)setTarget:(id)a3
{
  HUNavigationBarButton *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1B8E23B88((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (HUNavigationBarButton)init
{
  return (HUNavigationBarButton *)sub_1B8E23808();
}

- (id)target
{
  return sub_1B8E23CD0(self, (uint64_t)a2, (SEL *)&selRef_target);
}

- (SEL)action
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NavigationBarButton();
  return -[HUNavigationBarButton action](&v3, sel_action);
}

- (NSString)identifier
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___HUNavigationBarButton_identifier;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  sub_1B93ECF74();
  v3 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSNumber)badgeValue
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUNavigationBarButton_badgeValue);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

+ (id)editDoneButtonWithOwner:(id)a3
{
  return sub_1B8E51F30((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s6HomeUI19NavigationBarButtonC08editDoneE04withAcA0cdE5Owner_p_tFZ_0);
}

+ (id)announceButtonWithOwner:(id)a3
{
  return sub_1B8E51F30((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s6HomeUI19NavigationBarButtonC08announceE04withAcA0cdE5Owner_p_tFZ_0);
}

+ (id)homeButtonWithOwner:(id)a3
{
  return sub_1B8E51F30((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s6HomeUI19NavigationBarButtonC04homeE04withAcA0cdE5Owner_p_tFZ_0);
}

+ (id)addButtonWithOwner:(id)a3
{
  return sub_1B8E51F30((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s6HomeUI19NavigationBarButtonC03addE04withAcA0cdE5Owner_p_tFZ_0);
}

- (HUNavigationBarButton)initWithCoder:(id)a3
{
  return (HUNavigationBarButton *)sub_1B8FB6870(a3);
}

- (NSString)description
{
  HUNavigationBarButton *v2;
  void *v3;

  v2 = self;
  sub_1B8FB69B4();

  v3 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1B93EDDB4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HUNavigationBarButton_identifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (HUNavigationBarButtonOwner)owner
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUNavigationBarButton_owner;
  swift_beginAccess();
  return (HUNavigationBarButtonOwner *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (void)setOwner:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)setBadgeValue:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  HUNavigationBarButton *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___HUNavigationBarButton_badgeValue);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_1B8FB7024(v6);

}

- (UIFont)font
{
  HUNavigationBarButton *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B8FB7284();

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v5;
  HUNavigationBarButton *v6;

  v5 = a3;
  v6 = self;
  sub_1B8FB7424(a3);

}

- (void)handleTap:(id)a3
{
  id v4;
  HUNavigationBarButton *v5;

  v4 = a3;
  v5 = self;
  sub_1B8FB7E88();

}

- (void)performAction
{
  void (*v2)(HUNavigationBarButton *);
  HUNavigationBarButton *v3;

  v2 = *(void (**)(HUNavigationBarButton *))((char *)&self->super.super.super.isa
                                                      + OBJC_IVAR___HUNavigationBarButton_actionHandler);
  if (v2)
  {
    v3 = self;
    sub_1B8ED4C10((uint64_t)v2);
    v2(v3);
    sub_1B8E6FE50((uint64_t)v2);

  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUNavigationBarButton_owner);

  sub_1B8E6FE50(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUNavigationBarButton_actionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUNavigationBarButton____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUNavigationBarButton____lazy_storage___badgeSpacerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUNavigationBarButton____lazy_storage___badgeView));
}

@end
