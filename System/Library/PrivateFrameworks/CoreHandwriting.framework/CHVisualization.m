@implementation CHVisualization

- (CHVisualization)initWithRecognitionSession:(id)a3
{
  id v5;
  CHVisualization *v6;
  CHVisualization *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHVisualization;
  v6 = -[CHVisualization init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_recognitionSession, a3);

  return v7;
}

- (CHRecognitionSession)recognitionSession
{
  return self->_recognitionSession;
}

- (CHVisualizationDelegate)delegate
{
  return (CHVisualizationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recognitionSession, 0);
}

- (int64_t)layeringPriority
{
  return 1;
}

- (BOOL)wantsInputDrawings
{
  return 0;
}

@end
