@implementation ICCalculateRecognitionController.ErrorInteractionController

- (void)didTapTextView:(id)a3
{
  id v4;
  _TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController *v5;

  v4 = a3;
  v5 = self;
  sub_1ACA1BEA8(v4);

}

- (_TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController)init
{
  _TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController *result;

  result = (_TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1ACA1C434(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state), *(_QWORD *)&self->recognitionController[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state], *(_QWORD *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state], *(_QWORD *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 8], *(_QWORD *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 16], *(_QWORD *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 24], *(_QWORD *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 32], self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state + 40]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_errorMenuGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_editMenuInteraction));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6;
  id v7;
  _TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1ACA1C7E8(v7);

  return v9 & 1;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v4 = (double *)((char *)self
                + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state);
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if (!self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state
                  + 40])
  {
    v7 = v4[5];
    v8 = v4[6];
    v5 = v4[3];
    v6 = v4[4];
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  id v8;
  _TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1ACA1CA70();

  return v10;
}

@end
