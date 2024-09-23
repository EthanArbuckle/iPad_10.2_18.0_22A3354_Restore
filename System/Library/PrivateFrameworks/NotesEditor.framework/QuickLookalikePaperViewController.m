@implementation QuickLookalikePaperViewController

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController__undoManager));
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC11NotesEditor33QuickLookalikePaperViewController *v6;
  _QWORD v7[4];
  objc_super v8;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for QuickLookalikePaperViewController();
  v8.receiver = self;
  v8.super_class = v5;
  v6 = self;
  -[QuickLookalikePaperViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  if (*((_BYTE *)&v6->super.super.super.super.isa
       + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_wantsToJumpIntoAutoFill) == 1)
  {
    v7[3] = v5;
    v7[0] = v6;
    v6 = v6;
    sub_1DD972A3C();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v7);
  }

}

- (void)undo:(id)a3
{
  sub_1DD972624(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_undo);
}

- (void)redo:(id)a3
{
  sub_1DD972624(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_redo);
}

- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DD976534();
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4;
  _TtC11NotesEditor33QuickLookalikePaperViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DD973C10();

}

- (void)done:(id)a3
{
  _TtC11NotesEditor33QuickLookalikePaperViewController *v4;
  uint64_t *v5;
  void (*v6)(_TtC11NotesEditor33QuickLookalikePaperViewController *);
  uint64_t v7;
  uint64_t v8;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1DD9D2AC4();
  swift_unknownObjectRelease();
  v5 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_dismissAction);
  v6 = *(void (**)(_TtC11NotesEditor33QuickLookalikePaperViewController *))((char *)&v4->super.super.super.super.isa
                                                                                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_dismissAction);
  if (v6)
  {
    swift_retain();
    v6(v4);
    sub_1DD8FE450((uint64_t)v6);
    v7 = *v5;
  }
  else
  {
    v7 = 0;
  }
  *v5 = 0;
  v5[1] = 0;
  sub_1DD8FE450(v7);

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v8);
}

- (void)fillForm:(id)a3
{
  sub_1DD972D64(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1DD972A3C);
}

- (void)markup:(id)a3
{
  sub_1DD972D64(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1DD972BD0);
}

- (void)share:(id)a3
{
  _TtC11NotesEditor33QuickLookalikePaperViewController *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1DD9D2AC4();
  swift_unknownObjectRelease();
  v5 = sub_1DD9726D4();
  v6 = objc_msgSend(v5, sel_popoverPresentationController);
  if (v6)
  {
    v7 = v6;
    v8 = objc_retain(*(id *)((char *)&v4->super.super.super.super.isa
                           + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_shareButton));
    objc_msgSend(v7, sel_setBarButtonItem_, v8);

  }
  -[QuickLookalikePaperViewController presentViewController:animated:completion:](v4, sel_presentViewController_animated_completion_, v5, 1, 0);

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v9);
}

- (void)print:(id)a3
{
  _TtC11NotesEditor33QuickLookalikePaperViewController *v4;
  _TtC11NotesEditor33QuickLookalikePaperViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DD9D2AC4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1DD972EA4();

  sub_1DD8FF244((uint64_t)v6, &qword_1EDBFA300);
}

- (void)saveToFiles
{
  _TtC11NotesEditor33QuickLookalikePaperViewController *v2;

  v2 = self;
  sub_1DD973258();

}

- (void)find:(id)a3
{
  sub_1DD9734AC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_find_);
}

- (void)findNext:(id)a3
{
  sub_1DD9734AC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_findNext_);
}

- (void)findPrevious:(id)a3
{
  sub_1DD9734AC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_findPrevious_);
}

- (void)findAndReplace:(id)a3
{
  sub_1DD9734AC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_findAndReplace_);
}

- (void)findSessionDidBegin:(id)a3
{
  sub_1DD973B70(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1DD973678);
}

- (void)findSessionDidEnd:(id)a3
{
  sub_1DD973B70(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1DD9738F0);
}

- (void)updateBarButtonItems
{
  _TtC11NotesEditor33QuickLookalikePaperViewController *v2;

  v2 = self;
  sub_1DD973C10();

}

- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC11NotesEditor33QuickLookalikePaperViewController *result;

  result = (_TtC11NotesEditor33QuickLookalikePaperViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC11NotesEditor33QuickLookalikePaperViewController *result;

  v3 = a3;
  result = (_TtC11NotesEditor33QuickLookalikePaperViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11NotesEditor33QuickLookalikePaperViewController *result;

  v4 = a4;
  result = (_TtC11NotesEditor33QuickLookalikePaperViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_paperDocumentViewController));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_markupButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_findButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_formFillingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_undoButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_redoButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController__undoManager));
  sub_1DD8FF058((uint64_t)self + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_dataSource);
  sub_1DD8FE450(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_dismissAction));
}

@end
