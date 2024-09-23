@implementation CycleTrackingFinishSetupDataSource

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_2319E9FF0(v3);

  swift_release();
}

- (void)shouldShowCycleTrackingEducationTileUpdatedWithDidUpdate:(BOOL)a3
{
  swift_retain();
  sub_2319EA39C(a3);
  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v4;
  id v5;

  v5 = *(id *)self->analysis;
  *(_QWORD *)self->analysis = a4;
  v4 = a4;

}

@end
