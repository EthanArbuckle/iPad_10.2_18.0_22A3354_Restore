@implementation ICCalculateGraphingController.InsertionPromptController

- (void)promptTimerDidFire:(id)a3
{
  id v4;
  _TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController *v5;

  v4 = a3;
  v5 = self;
  sub_1AC9771AC();

}

- (void)noteWillPerformMerge:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_1ACA3F45C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_noteIsMerging) = 1;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)noteDidPerformMerge:(id)a3
{
  sub_1AC976BF0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AC976258);
}

- (void)documentControllerDidUpdate:(id)a3
{
  sub_1AC976BF0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AC976674);
}

- (void)textViewDidChangeText:(id)a3
{
  sub_1AC976BF0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AC976AC8);
}

- (_TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController)init
{
  _TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController *result;

  result = (_TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1AC976EF0(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state), *(void **)&self->graphingController[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state], self->state[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_editMenuInteraction));
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1AC977308();
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  if (self->state[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state] == 1)
    return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state), sel_makeMenu, a3, a4, a5);
  else
    return 0;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  _TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController *v9;

  if (self->state[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state] == 1)
  {
    v7 = a3;
    v8 = a4;
    swift_unknownObjectRetain();
    v9 = self;
    sub_1AC975748(0, 0, 2);

    swift_unknownObjectRelease();
  }
}

@end
