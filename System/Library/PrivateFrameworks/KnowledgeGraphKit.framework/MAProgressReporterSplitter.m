@implementation MAProgressReporterSplitter

- (MAProgressReporterSplitter)initWithProgressReporter:(id)a3
{
  id v5;
  MAProgressReporterSplitter *v6;
  MAProgressReporterSplitter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAProgressReporterSplitter;
  v6 = -[MAProgressReporterSplitter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progressReporter, a3);
    v7->_previousCheckpoint = 0.0;
  }

  return v7;
}

- (id)childProgressReporterToCheckpoint:(double)a3
{
  id result;

  result = -[MAProgressReporter childProgressReporterFromStart:toEnd:](self->_progressReporter, "childProgressReporterFromStart:toEnd:", self->_previousCheckpoint, a3);
  self->_previousCheckpoint = a3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressReporter, 0);
}

@end
