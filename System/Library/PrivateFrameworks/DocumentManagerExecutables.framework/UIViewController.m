@implementation UIViewController

void __70__UIViewController_DOCAppearanceInheritance___notifyAppearanceChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "effectiveAppearanceDidChange:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_notifyAppearanceChange:", *(_QWORD *)(a1 + 40));

}

- (void)doc_removeFromParentWithRemoveSubviewBlock:(id)a3
{
  void *v4;
  uint64_t (*v5)();
  UIViewController *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = sub_21EAB01F0;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  _sSo16UIViewControllerC26DocumentManagerExecutablesE024doc_removeFromParentViewB00G7SubviewyySo0A0CcSg_tF_0((void (*)(void))v5);
  sub_21EA5CA7C((uint64_t)v5);

}

- (int64_t)enclosingTabSwitcherStyle
{
  return (int64_t)sub_21EA8FC34(self, (uint64_t)a2, (SEL *)&selRef_enclosingTabSwitcherStyle);
}

- (int64_t)enclosingDocumentLandingMode
{
  return (int64_t)sub_21EA8FC34(self, (uint64_t)a2, (SEL *)&selRef_enclosingDocumentLandingMode);
}

- (BOOL)enclosedInUIPDocumentLanding
{
  UIViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_21EA8FAFC(&qword_2540A6E08);

  return v3 & 1;
}

- (void)doc_dismissViewController
{
  UIViewController *v2;

  v2 = self;
  UIViewController.doc_dismiss(animated:includingPresented:completion:)(1, 1, (uint64_t)nullsub_1, 0);

}

- (void)registerForTabSwitcherTraitChangesWithHandler:(id)a3
{
  uint64_t ObjectType;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  UIViewController *v9;

  ObjectType = swift_getObjectType();
  v6 = _Block_copy(a3);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_21EAA9EFC;
  v8[3] = v7;
  v8[4] = ObjectType;
  v9 = self;
  sub_21EB01F10();
  UIViewController.registerForUIPTraitChanges<A>(tabStyle:documentLanding:options:_:)(1, 0, 0, 1, (uint64_t)sub_21EA5EA84, (uint64_t)v8, ObjectType);

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

- (void)registerForUIPDocumentLandingTraitChangesWithHandler:(id)a3
{
  uint64_t ObjectType;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  UIViewController *v9;

  ObjectType = swift_getObjectType();
  v6 = _Block_copy(a3);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_21EAA9EFC;
  v8[3] = v7;
  v8[4] = ObjectType;
  v9 = self;
  sub_21EB01F10();
  UIViewController.registerForUIPTraitChanges<A>(tabStyle:documentLanding:options:_:)(0, 1, 0, 1, (uint64_t)sub_21EA5EA84, (uint64_t)v8, ObjectType);

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

- (BOOL)doc_inWindowPerformingSnapshotting
{
  UIViewController *v2;
  UIView *v3;
  UIViewController *v4;
  unsigned __int8 v5;

  v2 = self;
  v3 = -[UIViewController viewIfLoaded](v2, sel_viewIfLoaded);
  if (v3)
  {
    v4 = (UIViewController *)v3;
    v5 = -[UIView doc_inWindowPerformingSnapshotting](v3, sel_doc_inWindowPerformingSnapshotting);

    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)doc_addChildViewController:(id)a3 addSubviewBlock:(id)a4
{
  void (*v6)(void);
  id v7;
  UIViewController *v8;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(void))sub_21EAACDF4;
  }
  v7 = a3;
  v8 = self;
  UIViewController.doc_addChildViewController(_:addSubview:)(v7, v6);
  sub_21EA5CA7C((uint64_t)v6);

}

- (void)doc_addChildWithEqualAutoresizingFrame:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;

  v4 = (UIViewController *)a3;
  v5 = self;
  UIViewController.doc_addChildWithEqualAutoresizingFrame(_:)(v4);

}

- (BOOL)doc_scheduleHandlerIfInLiveResize:(SEL)a3
{
  UIViewController *v3;
  UIView *v4;

  v3 = self;
  v4 = -[UIViewController viewIfLoaded](v3, sel_viewIfLoaded);

  return 0;
}

+ (void)doc_performWithDeferredTransitionsAndAnimationsDisabled:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  _QWORD aBlock[6];

  v3 = _Block_copy(a3);
  v8[2] = v3;
  v4 = objc_opt_self();
  v5 = swift_allocObject();
  *(_BYTE *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = sub_21EAA9EF0;
  *(_QWORD *)(v5 + 32) = v8;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_21EAB01EC;
  *(_QWORD *)(v6 + 24) = v5;
  aBlock[4] = sub_21EA5EA80;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EA5EADC;
  aBlock[3] = &block_descriptor_47_0;
  v7 = _Block_copy(aBlock);
  sub_21EB01F10();
  swift_release();
  objc_msgSend((id)v4, sel__performWithoutDeferringTransitions_, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  _Block_release(v3);
  if ((v4 & 1) != 0)
    __break(1u);
}

- (void)_doc_liveResizeDidEnd
{
  uint64_t v3;
  void *v4;
  UIViewController *v5;
  _QWORD v6[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v6[4] = sub_21EAAFEC8;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_21EA5EAB0;
  v6[3] = &block_descriptor_30_3;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v4);

}

@end
