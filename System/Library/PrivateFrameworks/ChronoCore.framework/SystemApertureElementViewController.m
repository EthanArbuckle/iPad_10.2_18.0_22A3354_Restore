@implementation SystemApertureElementViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_maximumLayoutMode) = (Class)a3;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return (NSString *)sub_1D28A8064((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_associatedScenePersistenceIdentifier);
}

- (void)setAssociatedScenePersistenceIdentifier:(id)a3
{
  sub_1D28A80C8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_associatedScenePersistenceIdentifier);
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)sub_1D28A8064((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_associatedAppBundleIdentifier);
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  sub_1D28A80C8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_associatedAppBundleIdentifier);
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_elementIdentifier) = (Class)a3;
  v3 = a3;

}

- (BOOL)attachedMinimalViewRequiresZeroPadding
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_attachedMinimalViewRequiresZeroPadding);
}

- (void)setAttachedMinimalViewRequiresZeroPadding:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_attachedMinimalViewRequiresZeroPadding) = a3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_leadingView));
}

- (void)setLeadingView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_leadingView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_leadingView) = (Class)a3;
  v3 = a3;

}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_trailingView));
}

- (void)setTrailingView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_trailingView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_trailingView) = (Class)a3;
  v3 = a3;

}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_minimalView));
}

- (void)setMinimalView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_minimalView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_minimalView) = (Class)a3;
  v3 = a3;

}

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  uint64_t v3;
  _TtC10ChronoCore35SystemApertureElementViewController *v4;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_presentationBehaviors);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_presentationBehaviors) = (Class)a3;
  if (v3 != a3)
  {
    v4 = self;
    objc_msgSend(-[SystemApertureElementViewController systemApertureElementContext](v4, sel_systemApertureElementContext), sel_setElementNeedsUpdate);

    swift_unknownObjectRelease();
  }
}

- (NSURL)launchURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC10ChronoCore35SystemApertureElementViewController *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED94D920);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1D28A8388((uint64_t)v5);

  v7 = sub_1D29C162C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1D29C15CC();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (UIColor)keyColor
{
  _TtC10ChronoCore35SystemApertureElementViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D28A8524();

  return (UIColor *)v3;
}

- (_TtC10ChronoCore35SystemApertureElementViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D28ADA70();
}

- (void)invalidate
{
  _TtC10ChronoCore35SystemApertureElementViewController *v2;

  v2 = self;
  sub_1D28A94C4();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  uint64_t v5;
  void *v6;
  _TtC10ChronoCore35SystemApertureElementViewController *v7;
  _QWORD v8[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = self;
  v8[4] = sub_1D28AED90;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1D283D720;
  v8[3] = &block_descriptor_29_0;
  v6 = _Block_copy(v8);
  v7 = self;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(a3, sel_animateAlongsideTransition_completion_, v6, 0);
  _Block_release(v6);
  swift_unknownObjectRelease();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC10ChronoCore35SystemApertureElementViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D28A9CD4(a3);

}

- (id)_timelinesForDateInterval:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10ChronoCore35SystemApertureElementViewController *v8;
  void *v9;
  uint64_t v11;

  v4 = sub_1D29C13E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D29C13C8();
  v8 = self;
  sub_1D28AA3B4((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1D2728FEC(0, &qword_1EFC8F0F0);
  v9 = (void *)sub_1D29C5B74();
  swift_bridgeObjectRelease();
  return v9;
}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC10ChronoCore35SystemApertureElementViewController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1D28AA8BC(a3, (uint64_t)sub_1D28AED54, v7);

  swift_release();
}

- (_TtC10ChronoCore35SystemApertureElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1D28AD10C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_elementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_expandedUIHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_leadingUIHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_trailingUIHostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController_minimalUIHostingController));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore35SystemApertureElementViewController__logger;
  v4 = sub_1D29C29A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end
