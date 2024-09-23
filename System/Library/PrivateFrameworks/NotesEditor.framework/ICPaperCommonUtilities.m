@implementation ICPaperCommonUtilities

+ (BOOL)shouldShowLinksWhenComposingQuickNote
{
  return sub_1DD9AFC64() & 1;
}

+ (BOOL)shouldResumeLastQuickNote
{
  return sub_1DD9AFC64() & 1;
}

+ (id)activitiesToExcludeForNote:(id)a3 currentUserActivity:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  _s11NotesEditor20PaperCommonUtilitiesC19activitiesToExclude7forNote19currentUserActivitySaySo06NSUserM0CGSo6ICNoteC_AHSgtFZ_0((uint64_t)v5, a4);

  sub_1DD7C0C74(0, &qword_1F03F75E0);
  v7 = (void *)sub_1DD9D229C();
  swift_bridgeObjectRelease();
  return v7;
}

- (ICPaperCommonUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ICPaperCommonUtilities init](&v3, sel_init);
}

@end
