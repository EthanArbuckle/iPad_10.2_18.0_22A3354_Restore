@implementation ICAuthorHighlightsUpdater

- (ICAuthorHighlightsController)authorHighlightsController
{
  return (ICAuthorHighlightsController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR___ICAuthorHighlightsUpdater_authorHighlightsController));
}

- (ICTK2TextLayoutManager)textLayoutManager
{
  return (ICTK2TextLayoutManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICAuthorHighlightsUpdater_textLayoutManager));
}

- (ICAuthorHighlightsUpdater)initWithAuthorHighlightsController:(id)a3 textLayoutManager:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (ICAuthorHighlightsUpdater *)AuthorHighlightsUpdater.init(authorHighlightsController:textLayoutManager:)(v5, a4);
}

- (void)dealloc
{
  ICAuthorHighlightsUpdater *v2;

  v2 = self;
  AuthorHighlightsUpdater.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (double)highlightedValue
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___ICAuthorHighlightsUpdater_highlightedValue);
  swift_beginAccess();
  return *v2;
}

- (void)setHighlightedValue:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___ICAuthorHighlightsUpdater_highlightedValue);
  swift_beginAccess();
  *v4 = a3;
}

- (ICTTTextEditFilter)filter
{
  return (ICTTTextEditFilter *)sub_1DD94B700((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICAuthorHighlightsUpdater_filter);
}

- (void)setFilter:(id)a3
{
  id *v5;
  id v6;
  id v7;
  ICAuthorHighlightsUpdater *v8;
  id v9;
  id v10;

  v5 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_filter);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  v9 = sub_1DD9B4990();
  v10 = *v5;
  objc_msgSend(v9, sel_setFilter_, v10);

}

- (BOOL)showsCollaboratorStatuses
{
  ICAuthorHighlightsUpdater *v2;
  char v3;

  v2 = self;
  v3 = AuthorHighlightsUpdater.showsCollaboratorStatuses.getter();

  return v3 & 1;
}

- (ICSearchResultRegexMatchFinder)searchHighlightRegexFinder
{
  return (ICSearchResultRegexMatchFinder *)sub_1DD94B700((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICAuthorHighlightsUpdater_searchHighlightRegexFinder);
}

- (void)setSearchHighlightRegexFinder:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_searchHighlightRegexFinder);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)hasHighlights
{
  ICAuthorHighlightsUpdater *v2;
  char v3;

  v2 = self;
  v3 = AuthorHighlightsUpdater.hasHighlights.getter();

  return v3 & 1;
}

- (BOOL)didScheduleUpdate
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_updateTimer) != 0;
}

- (void)scheduleUpdateAnimated:(BOOL)a3
{
  char v4;
  ICAuthorHighlightsUpdater *v5;

  v4 = *((_BYTE *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_forceNextUpdate);
  v5 = self;
  AuthorHighlightsUpdater.scheduleUpdate(animated:force:)(a3, v4);

}

- (void)scheduleUpdateAnimated:(BOOL)a3 force:(BOOL)a4
{
  ICAuthorHighlightsUpdater *v6;

  v6 = self;
  AuthorHighlightsUpdater.scheduleUpdate(animated:force:)(a3, a4);

}

- (BOOL)updatesVisibleRangesOnly
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ICAuthorHighlightsUpdater_updatesVisibleRangesOnly;
  swift_beginAccess();
  return *v2;
}

- (void)setUpdatesVisibleRangesOnly:(BOOL)a3
{
  char *v5;
  char v6;
  ICAuthorHighlightsUpdater *v7;

  v5 = (char *)self + OBJC_IVAR___ICAuthorHighlightsUpdater_updatesVisibleRangesOnly;
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = self;
  sub_1DD9B6ACC(v6);

}

- (void)updateAnimated:(BOOL)a3
{
  char v4;
  ICAuthorHighlightsUpdater *v5;

  v4 = *((_BYTE *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_forceNextUpdate);
  v5 = self;
  AuthorHighlightsUpdater.update(animated:force:)(a3, v4);

}

- (void)updateAnimated:(BOOL)a3 force:(BOOL)a4
{
  ICAuthorHighlightsUpdater *v6;

  v6 = self;
  AuthorHighlightsUpdater.update(animated:force:)(a3, a4);

}

- (void)flashHighlightsForRanges:(id)a3 inTextStorage:(id)a4
{
  uint64_t v6;
  id v7;
  ICAuthorHighlightsUpdater *v8;

  type metadata accessor for _NSRange(0);
  v6 = sub_1DD9D22A8();
  v7 = a4;
  v8 = self;
  AuthorHighlightsUpdater.flashHighlights(for:in:)(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)flashHighlightsForFilter:(id)a3
{
  id v4;
  ICAuthorHighlightsUpdater *v5;

  v4 = a3;
  v5 = self;
  AuthorHighlightsUpdater.flashHighlights(for:)((uint64_t)v4);

}

- (void)noteShowsCollaboratorCursorsDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ICAuthorHighlightsUpdater *v8;
  uint64_t v9;

  v4 = sub_1DD9D0538();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0514();
  v8 = self;
  sub_1DD9B9ED8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (ICAuthorHighlightsUpdater)init
{
  ICAuthorHighlightsUpdater *result;

  result = (ICAuthorHighlightsUpdater *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSValue)focusedRangeValue
{
  char *v2;
  id v3;

  v2 = (char *)self + OBJC_IVAR___ICAuthorHighlightsUpdater_focusedRange;
  swift_beginAccess();
  v3 = 0;
  if ((v2[16] & 1) == 0)
    v3 = objc_msgSend((id)objc_opt_self(), sel_valueWithRange_, *(_QWORD *)v2, *((_QWORD *)v2 + 1));
  return (NSValue *)v3;
}

- (void)setFocusedRangeValue:(id)a3
{
  ICAuthorHighlightsUpdater *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char *v9;

  v4 = self;
  if (a3)
  {
    v5 = objc_msgSend(a3, sel_rangeValue);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a3 == 0;
  v9 = (char *)v4 + OBJC_IVAR___ICAuthorHighlightsUpdater_focusedRange;
  swift_beginAccess();
  *(_QWORD *)v9 = v5;
  *((_QWORD *)v9 + 1) = v7;
  v9[16] = v8;

}

- (NSValue)highlightedRangeValue
{
  ICAuthorHighlightsUpdater *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;

  v2 = self;
  v3 = sub_1DD9B9434();
  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend((id)objc_opt_self(), sel_valueWithRange_, v3, v4);

  return (NSValue *)v6;
}

@end
