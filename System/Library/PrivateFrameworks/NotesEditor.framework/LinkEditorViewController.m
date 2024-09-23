@implementation LinkEditorViewController

- (UIView)urlTextFieldView
{
  LinkEditorViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1DD92AF1C();

  return (UIView *)v3;
}

- (ICLinkEditorDelegate)delegate
{
  swift_beginAccess();
  return (ICLinkEditorDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (int64_t)addApproach
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___LinkEditorViewController_addApproach);
  swift_beginAccess();
  return *v2;
}

- (void)setAddApproach:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___LinkEditorViewController_addApproach);
  swift_beginAccess();
  *v4 = a3;
}

- (ICLinkAcceleratorController)linkAcceleratorController
{
  return (ICLinkAcceleratorController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController));
}

- (void)setLinkAcceleratorController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController) = (Class)a3;
  v3 = a3;

}

- (NSString)currentQueryString
{
  void *v2;

  if (*(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR___LinkEditorViewController_currentQueryString))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1DD9D2140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setCurrentQueryString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a3)
  {
    v4 = sub_1DD9D2170();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___LinkEditorViewController_currentQueryString);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (LinkEditorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DD932910();
}

- (void)setupObservers
{
  LinkEditorViewController *v2;

  v2 = self;
  sub_1DD92B798();

}

- (void)viewDidLoad
{
  LinkEditorViewController *v2;

  v2 = self;
  sub_1DD92D6E4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  LinkEditorViewController *v3;

  v3 = self;
  sub_1DD932E78();

}

- (void)viewWillLayoutSubviews
{
  LinkEditorViewController *v2;

  v2 = self;
  sub_1DD92DC3C();

}

- (void)handleKeyboardDidHide
{
  LinkEditorViewController *v2;

  v2 = self;
  sub_1DD92DE48();

}

- (void)handleKeyboardWillShow
{
  LinkEditorViewController *v2;

  v2 = self;
  sub_1DD92E010();

}

- (void)handleArrowDown:(id)a3
{
  id v4;
  LinkEditorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DD932EF0();

}

- (void)handleArrowUp:(id)a3
{
  id v4;
  LinkEditorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DD93300C();

}

- (void)handleReturnKey:(id)a3
{
  uint64_t v3;
  void *v6;
  id v7;
  LinkEditorViewController *v8;
  id v9;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController);
  if (v3)
  {
    v6 = *(void **)(v3 + OBJC_IVAR___ICLinkAcceleratorController_viewController);
    type metadata accessor for iOSLinkAcceleratorViewController();
    if (swift_dynamicCastClass())
    {
      v7 = a3;
      v8 = self;
      v9 = v6;
      sub_1DD922994();

    }
  }
}

- (void)handleEscape:(id)a3
{
  void *v3;
  id v5;
  LinkEditorViewController *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v7 = v3;
    LinkAcceleratorController.hideAccelerator()();

  }
}

- (void)hideAccelerator
{
  LinkEditorViewController *v2;

  v2 = self;
  sub_1DD92E58C();

}

- (void)presentAcceleratorIfNecessary
{
  LinkEditorViewController *v2;

  v2 = self;
  sub_1DD92E64C();

}

- (NSArray)keyCommands
{
  void *v2;

  if (sub_1DD933198())
  {
    sub_1DD7C0C74(0, &qword_1F03F7840);
    v2 = (void *)sub_1DD9D229C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)insertAndDismissWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  LinkEditorViewController *v7;
  LinkEditorViewController *v8;
  _QWORD v9[6];

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1DD9081FC;
    v9[4] = sub_1DD9081FC;
    v9[5] = v5;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 1107296256;
    v9[2] = sub_1DD7C0D48;
    v9[3] = &block_descriptor_77_1;
    v6 = _Block_copy(v9);
    v7 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    v8 = self;
    v6 = 0;
  }
  -[LinkEditorViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, v6);
  _Block_release(v6);
  sub_1DD8FE450((uint64_t)v4);

}

- (void)doneAction
{
  LinkEditorViewController *v2;

  v2 = self;
  sub_1DD92F180();

}

- (void)removeLink
{
  uint64_t v3;
  void *v4;
  LinkEditorViewController *v5;
  _QWORD v6[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v6[4] = sub_1DD9343C4;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1DD7C0D48;
  v6[3] = &block_descriptor_71;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_retain();
  swift_release();
  -[LinkEditorViewController dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, v4);
  _Block_release(v4);
  swift_release();

}

- (void)cancelAction:(id)a3
{
  LinkEditorViewController *v3;
  LinkEditorViewController *v4;
  LinkEditorViewController *v5;
  char *v6;
  char *v7;
  LinkEditorViewController *v8;
  _OWORD v9[2];

  v3 = self;
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DD9D2AC4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self;
  }
  v6 = *(char **)((char *)&v3->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController);
  if (v6 && (v7 = &v6[OBJC_IVAR___ICLinkAcceleratorController_isShowing], swift_beginAccess(), *v7 == 1))
  {
    v8 = v6;
    LinkAcceleratorController.hideAccelerator()();

    v3 = v8;
  }
  else
  {
    -[LinkEditorViewController dismissViewControllerAnimated:completion:](v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }

  sub_1DD8FF244((uint64_t)v9, &qword_1EDBFA300);
}

- (void)selectedSuggestionWithSelection:(id)a3
{
  id v5;
  LinkEditorViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1DD9300A0(a3);

}

- (void)selectedURLWithSelection:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  LinkEditorViewController *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBF97F0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1DD9D06E8();
    v8 = sub_1DD9D0724();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1DD9D0724();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1DD9301F8((uint64_t)v7);

  sub_1DD8FF244((uint64_t)v7, &qword_1EDBF97F0);
}

- (void)validateSelection
{
  LinkEditorViewController *v2;
  id v3;
  char v4;

  v2 = self;
  v3 = sub_1DD9304E8();
  swift_beginAccess();
  swift_retain();
  v4 = sub_1DD9D0F04();
  swift_release();
  objc_msgSend(v3, sel_setEnabled_, v4 & 1);

}

- (void)horizontalSizeClassDidChange
{
  LinkEditorViewController *v2;

  v2 = self;
  sub_1DD930580();

}

- (LinkEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  LinkEditorViewController *result;

  v4 = a4;
  result = (LinkEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1DD8FF244((uint64_t)self + OBJC_IVAR___LinkEditorViewController_linkEditorView, &qword_1F03F7678);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_1DD9343F0((uint64_t)self + OBJC_IVAR___LinkEditorViewController_textSelection, type metadata accessor for TextSelection);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LinkEditorViewController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LinkEditorViewController____lazy_storage___doneBarButtonItem));
}

- (_NSRange)lastSelectedRangeForAccelerator
{
  LinkEditorViewController *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  swift_beginAccess();
  v3 = self;
  swift_retain();
  sub_1DD9D0F40();
  swift_release();
  v4 = sub_1DD9D21C4();

  swift_bridgeObjectRelease();
  v5 = 0;
  v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

- (void)acceleratorOriginNeedsUpdate
{
  LinkEditorViewController *v2;

  v2 = self;
  LinkEditorViewController.acceleratorOriginNeedsUpdate()();

}

- (BOOL)languageHasSpaces
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_delegate);
  swift_beginAccess();
  if (*v2)
    return objc_msgSend(*v2, sel_languageHasSpaces);
  else
    return 1;
}

- (int64_t)writingDirection
{
  int64_t *v2;
  int64_t result;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___LinkEditorViewController_delegate);
  swift_beginAccess();
  result = *v2;
  if (*v2)
    return (int64_t)objc_msgSend((id)result, sel_writingDirection);
  return result;
}

- (ICNote)note
{
  return (ICNote *)0;
}

- (UIView)acceleratorHostingView
{
  LinkEditorViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)LinkEditorViewController.acceleratorHostingView.getter();

  return (UIView *)v3;
}

- (ICNAEventReporter)eventReporter
{
  return (ICNAEventReporter *)0;
}

- (NSString)searchString
{
  LinkEditorViewController *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  swift_beginAccess();
  v3 = self;
  swift_retain();
  v4 = sub_1DD9D0F40();
  v6 = v5;
  swift_release();
  sub_1DD92B6C4(v4, v6);

  swift_bridgeObjectRelease();
  v7 = (void *)sub_1DD9D2140();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void)didSelectNoteSuggestionWithIdentifier:(id)a3 title:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  LinkEditorViewController *v11;
  Swift::String v12;
  Swift::String v13;

  v5 = sub_1DD9D2170();
  v7 = v6;
  v8 = sub_1DD9D2170();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  LinkEditorViewController.didSelectNoteSuggestion(withIdentifier:title:)(v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
