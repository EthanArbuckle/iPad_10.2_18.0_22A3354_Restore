@implementation ICCalculateScrubberController

- (UITextView)textView
{
  return (UITextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___ICCalculateScrubberController_textView));
}

- (ICNote)note
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_note);
  swift_beginAccess();
  return (ICNote *)*v2;
}

- (void)setNote:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_note);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isScrubbing
{
  ICCalculateScrubberController *v2;
  char v3;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_scrubber))
  {
    v2 = self;
    swift_retain();
    v3 = sub_1ACA3FB7C();

    swift_release();
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (ICCalculateScrubberController)initWithTextView:(id)a3
{
  return (ICCalculateScrubberController *)sub_1ACA196B8((uint64_t)a3);
}

- (BOOL)isShowing
{
  void *v2;
  ICCalculateScrubberController *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_viewController);
  if (!v2)
    goto LABEL_5;
  v3 = self;
  v4 = objc_msgSend(v2, sel_view);
  if (!v4)
  {
    __break(1u);
    return (char)v4;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_window);

  if (v6)
  {

    LOBYTE(v4) = 1;
  }
  else
  {
LABEL_5:
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)showScrubberForNumberLiteral:(id)a3 isCompact:(BOOL)a4
{
  id v7;
  ICCalculateScrubberController *v8;

  v7 = a3;
  v8 = self;
  sub_1ACA19954(a3, a4);

}

- (void)hideScrubber
{
  ICCalculateScrubberController *v2;

  v2 = self;
  ICCalculateScrubberController.hideScrubber()();

}

- (void)didBeginScrub
{
  -[ICCalculateScrubberController startPausingUndoActions](self, sel_startPausingUndoActions);
}

- (void)updateText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  ICCalculateScrubberController *v7;
  Swift::String v8;

  v4 = sub_1ACA420C0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  ICCalculateScrubberController.updateText(string:)(v8);

  swift_bridgeObjectRelease();
}

- (void)didEndScrub
{
  ICCalculateScrubberController *v2;
  ICNote *v3;

  v2 = self;
  v3 = -[ICCalculateScrubberController note](v2, sel_note);
  -[ICNote updateModificationDateAndChangeCountAndSaveImmediately](v3, sel_updateModificationDateAndChangeCountAndSaveImmediately);

}

- (void)hideIfNotScrubbing
{
  ICCalculateScrubberController *v2;

  v2 = self;
  ICCalculateScrubberController.hideIfNotScrubbing()();

}

- (void)deselectText
{
  ICCalculateScrubberController *v2;

  v2 = self;
  sub_1ACA1A47C();

}

- (void)startBlockingMerge
{
  ICCalculateScrubberController *v2;

  v2 = self;
  sub_1ACA1A58C();

}

- (void)endBlockingMerge
{
  ICCalculateScrubberController *v2;

  v2 = self;
  sub_1ACA1A68C();

}

- (void)startPausingUndoActions
{
  ICCalculateScrubberController *v2;
  ICNote *v3;
  ICTTTextStorage *v4;

  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_isPausingUndoActions) & 1) == 0)
  {
    *((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_isPausingUndoActions) = 1;
    v2 = self;
    v3 = -[ICCalculateScrubberController note](v2, sel_note);
    v4 = -[ICNote textStorage](v3, sel_textStorage);

    -[ICTTTextStorage setIsPausingUndoActions:](v4, sel_setIsPausingUndoActions_, 1);
  }
}

- (void)endPausingUndoActions
{
  ICCalculateScrubberController *v2;
  ICNote *v3;
  ICTTTextStorage *v4;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_isPausingUndoActions) == 1)
  {
    *((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_isPausingUndoActions) = 0;
    v2 = self;
    v3 = -[ICCalculateScrubberController note](v2, sel_note);
    v4 = -[ICNote textStorage](v3, sel_textStorage);

    -[ICTTTextStorage setIsPausingUndoActions:](v4, sel_setIsPausingUndoActions_, 0);
  }
}

- (void)dealloc
{
  ICCalculateScrubberController *v2;
  objc_super v3;

  v2 = self;
  -[ICCalculateScrubberController hideScrubber](v2, sel_hideScrubber);
  v3.receiver = v2;
  v3.super_class = (Class)ICCalculateScrubberController;
  -[ICCalculateScrubberController dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateScrubberController____lazy_storage___hoverController));

}

- (ICCalculateScrubberController)init
{
  ICCalculateScrubberController *result;

  result = (ICCalculateScrubberController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)setHoveredCharacterIndex:(int64_t)a3
{
  ICCalculateScrubberController *v4;
  char *v5;
  uint64_t v6;
  char v7;
  _BYTE *v8;

  v4 = self;
  v8 = sub_1ACA1977C();
  v5 = &v8[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_hoveredCharacterIndex];
  v6 = *(_QWORD *)&v8[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_hoveredCharacterIndex];
  v7 = v8[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_hoveredCharacterIndex + 8];
  *(_QWORD *)v5 = a3;
  v5[8] = 0;
  sub_1ACA1AB60(v6, v7);

}

- (void)resetHoverTimer
{
  ICCalculateScrubberController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = sub_1ACA1977C();
  v4 = sub_1ACA1AE58();
  objc_msgSend(v4, sel_cancelPreviousFireRequests);

}

@end
