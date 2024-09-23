@implementation CKTranscriptPluginPresentationConfiguration

- (CKTranscriptPluginPresentationConfiguration)initWithSourceView:(id)a3 permittedArrowDirections:(unint64_t)a4 shouldDisableSnapshotView:(BOOL)a5
{
  id v8;
  CKTranscriptPluginPresentationConfiguration *v9;
  CKTranscriptPluginPresentationConfiguration *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptPluginPresentationConfiguration;
  v9 = -[CKTranscriptPluginPresentationConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_sourceView, v8);
    v10->_permittedArrowDirections = a4;
    v10->_shouldDisableSnapshotView = a5;
  }

  return v10;
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (BOOL)shouldDisableSnapshotView
{
  return self->_shouldDisableSnapshotView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
