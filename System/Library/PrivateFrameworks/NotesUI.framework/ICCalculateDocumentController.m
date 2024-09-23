@implementation ICCalculateDocumentController

- (ICNote)note
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___ICCalculateDocumentController_note;
  swift_beginAccess();
  return (ICNote *)(id)MEMORY[0x1AF446658](v2);
}

- (void)setNote:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (ICCalculateDocumentController)initWithNote:(id)a3
{
  return (ICCalculateDocumentController *)ICCalculateDocumentController.init(note:)(a3);
}

- (void)scheduleUpdateAffectingChangeCounts:(BOOL)a3
{
  ICCalculateDocumentController *v3;
  id v4;

  if (a3)
    *((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculateDocumentController_nextUpdateAffectsChangeCounts) = 1;
  v3 = self;
  v4 = sub_1AC8FDA5C();
  objc_msgSend(v4, sel_requestFire);

}

- (void)cancelUpdate
{
  id v2;
  void *v3;
  ICCalculateDocumentController *v4;

  v4 = self;
  v2 = sub_1AC8FDA5C();
  objc_msgSend(v2, sel_cancelPreviousFireRequests);

  v3 = *(Class *)((char *)&v4->super.isa + OBJC_IVAR___ICCalculateDocumentController_currentScanRequest);
  if (v3)
    objc_msgSend(v3, sel_cancel);

}

- (void)performUpdate
{
  ICCalculateDocumentController *v2;

  v2 = self;
  sub_1AC8FDC48();

}

- (BOOL)isUpdating
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculateDocumentController_updating);
}

- (BOOL)updateAffectingChangeCounts:(BOOL)a3
{
  _BOOL4 v3;
  ICCalculateDocumentController *v4;
  _QWORD *v5;
  char v6;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculateDocumentController_needsDocumentUpdate) == 1)
  {
    v3 = a3;
    v4 = self;
    -[ICCalculateDocumentController cancelUpdate](v4, sel_cancelUpdate);
    sub_1AC8FD3D4();
    v5 = sub_1AC8E3FBC(0, 0, 1);
    swift_release();
    v6 = sub_1AC8FE2C0(v3, (uint64_t)v5);

    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (void)updateAffectingChangeCounts:(BOOL)a3 completion:(id)a4
{
  void *v6;
  ICCalculateDocumentController *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1AC907B60(a3, (unsigned __int8 *)v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (BOOL)hasExpressions
{
  ICCalculateDocumentController *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = self;
  sub_1AC8FE088();
  v3 = sub_1ACA41EC8();
  swift_release();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1ACA42C84();

    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease();
  return v4 != 0;
}

- (NSIndexSet)expressionsIndexSet
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  ICCalculateDocumentController *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1ACA3FAE0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  _sSo29ICCalculateDocumentControllerC7NotesUIE19expressionsIndexSet10Foundation0gH0Vvg_0((uint64_t)v6);

  v8 = (void *)sub_1ACA3FAA4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSIndexSet *)v8;
}

- (BOOL)updateHighlights
{
  ICCalculateDocumentController *v2;
  char v3;

  v2 = self;
  sub_1AC8FD524();
  v3 = sub_1ACA1D578();
  swift_release();
  sub_1AC8FD524();
  sub_1ACA1D354();

  swift_release();
  return v3 & 1;
}

- (id)expressionStringForResultAttachment:(id)a3
{
  return sub_1AC903208(self, (uint64_t)a2, a3, (void (*)(id))sub_1AC902E28);
}

- (_NSRange)expressionRangeForResultAttachment:(id)a3
{
  id v4;
  ICCalculateDocumentController *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = a3;
  v5 = self;
  v6 = sub_1AC902FA0(v4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)errorStringForResultAttachment:(id)a3
{
  return sub_1AC903208(self, (uint64_t)a2, a3, (void (*)(id))sub_1AC90309C);
}

- (id)numberLiteralAtLocation:(int64_t)a3
{
  ICCalculateDocumentController *v4;
  id v5;

  v4 = self;
  v5 = sub_1AC903E68(a3);

  return v5;
}

- (BOOL)isExpressionFormattingEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ICCalculateDocumentController_isExpressionFormattingEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsExpressionFormattingEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___ICCalculateDocumentController_isExpressionFormattingEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (void)formatExpressionsInAttributedString:(id)a3 range:(_NSRange)a4 textStorageOffset:(int64_t)a5 skipStaleExpressions:(BOOL)a6
{
  Swift::Int length;
  Swift::Int location;
  id v11;
  __C::_NSRange v12;
  ICCalculateDocumentController *v13;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  v13 = self;
  v12.location = location;
  v12.length = length;
  ICCalculateDocumentController.formatExpressions(in:range:textStorageOffset:skipStaleExpressions:)((NSMutableAttributedString)v11, v12, a5, a6);

}

- (void)noteDidPerformMerge:(id)a3
{
  sub_1AC9053B0(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (void)undoManagerDidUndo:(id)a3
{
  sub_1AC9053B0(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)undoManagerDidRedo:(id)a3
{
  sub_1AC9053B0(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)noteDidChangeCalculatePreviewBehavior:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  ICCalculateDocumentController *v9;
  uint64_t v10;

  v4 = sub_1ACA3F45C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  v8 = OBJC_IVAR___ICCalculateDocumentController_updating;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculateDocumentController_updating) = 1;
  v9 = self;
  sub_1AC8FD524();
  sub_1ACA1D354();
  swift_release();
  *((_BYTE *)&self->super.isa + v8) = 0;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)textStorageDidProcessEndEditing:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ICCalculateDocumentController *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = sub_1ACA3F45C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F42C();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICCalculateDocumentController_needsDocumentUpdate) = 1;
  v8 = self;
  sub_1AC8FE088();
  v9 = sub_1ACA41EB0();
  swift_release();
  sub_1AC8FCEF4(v9);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)contextMenuForResultAttachment:(id)a3
{
  id v4;
  ICCalculateDocumentController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1AC9055F8(v4);

  return v6;
}

- (ICCalculateDocumentController)init
{
  ICCalculateDocumentController *result;

  result = (ICCalculateDocumentController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateDocumentController____lazy_storage___updateDelayer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateDocumentController____lazy_storage___numberFormatter));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
