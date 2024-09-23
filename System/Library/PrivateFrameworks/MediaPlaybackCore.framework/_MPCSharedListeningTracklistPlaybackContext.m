@implementation _MPCSharedListeningTracklistPlaybackContext

- (MSVSectionedCollection)tracklist
{
  return self->_tracklist;
}

- (void)setTracklist:(id)a3
{
  objc_storeStrong((id *)&self->_tracklist, a3);
}

- (NSIndexPath)startItemIndexPath
{
  return self->_startItemIndexPath;
}

- (void)setStartItemIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_startItemIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItemIndexPath, 0);
  objc_storeStrong((id *)&self->_tracklist, 0);
}

- (id)getSharedListeningTracklistWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(id, void *, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD1768];
  v5 = (void (**)(id, void *, void *, _QWORD))a3;
  objc_msgSend(v4, "progressWithTotalUnitCount:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCSharedListeningTracklistPlaybackContext tracklist](self, "tracklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCSharedListeningTracklistPlaybackContext startItemIndexPath](self, "startItemIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7, v8, 0);

  objc_msgSend(v6, "setCompletedUnitCount:", 1);
  return v6;
}

@end
