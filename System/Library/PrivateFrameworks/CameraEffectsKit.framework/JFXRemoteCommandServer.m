@implementation JFXRemoteCommandServer

- (JFXRemoteCommandServer)initWithDelegate:(id)a3
{
  id v4;
  JFXRemoteCommandServer *v5;
  JFXRemoteCommandServer *v6;
  uint64_t v7;
  NSDistributedNotificationCenter *distributedNotificationCenter;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)JFXRemoteCommandServer;
  v5 = -[JFXRemoteCommandServer init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v7 = objc_claimAutoreleasedReturnValue();
    distributedNotificationCenter = v6->_distributedNotificationCenter;
    v6->_distributedNotificationCenter = (NSDistributedNotificationCenter *)v7;

    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onRemoveEffectsNotification_, CFSTR("JFXRemoveEffectsNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onSetAnimojiNotification_, CFSTR("JFXSetAnimojiNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onSetMemojiWithContentsOfFileNotification_, CFSTR("JFXSetMemojiWithContentsOfFileNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onSetFilterWithIdentifierNotification_, CFSTR("JFXSetFilterWithIdentifierNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onGetEffectsRequest_, CFSTR("JFXGetEffectsNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onGetEffectsResponse_, CFSTR("JFXSendEffectsNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onOpenProjectPickerNotification_, CFSTR("JFXOpenProjectPickerNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onOpenProjectNotification_, CFSTR("JFXOpenProjectNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onNewProjectNotification_, CFSTR("JFXNewProjectNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onPlayNotification_, CFSTR("JFXPlayNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onPlayClipAtIndexNotification_, CFSTR("JFXPlayClipAtIndexNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onRecordNotification_, CFSTR("JFXRecordNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onExportProjectNotification_, CFSTR("JFXExportNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onExportProjectResponseNotification_, CFSTR("JFXSendExportNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onAddPosterWithIdentifierNotification_, CFSTR("JFXAddPosterWithIdentifierNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onAddPosterWithNameNotification_, CFSTR("JFXAddPosterWithNameNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onAddEffectWithIdentifierNotification_, CFSTR("JFXAddEffectWithIdentifierNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onAddEffectWithNameNotification_, CFSTR("JFXAddEffectWithNameNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onAddAREffectWithIdentifierNotification_, CFSTR("JFXAddAREffectWithIdentifierNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onSetAspectRatioNotification_, CFSTR("JFXAspectRatioNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onAddShapeWithIdentifierNotification_, CFSTR("JFXAddShapeWithIdentifierNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onAddStickerNotification_, CFSTR("JFXAddStickerNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onAddStickerWithIdentifierNotification_, CFSTR("JFXAddStickerWithIdentifierNotification"), 0);
    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v6->_distributedNotificationCenter, "addObserver:selector:name:object:", v6, sel_onAddTextNotification_, CFSTR("JFXAddTextNotification"), 0);
  }

  return v6;
}

- (void)onRemoveEffectsNotification:(id)a3
{
  void *v4;
  id v5;

  JFXRemoveEffectsNotificationGetEffectTypeIdentifiers(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveRemoveEffectsCommandWithTypeIdentifiers:", self, v5);

}

- (void)onSetAnimojiNotification:(id)a3
{
  void *v4;
  id v5;

  JFXSetAnimojiNotificationGetEffectIdentifier(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveSetAnimojiCommandWithIdentifier:", self, v5);

}

- (void)onSetMemojiWithContentsOfFileNotification:(id)a3
{
  void *v4;
  id v5;

  JFXSetMemojiNotificationGetFile(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveSetMemojiCommandWithContentsOfFile:", self, v5);

}

- (void)onSetFilterWithIdentifierNotification:(id)a3
{
  void *v4;
  id v5;

  JFXSetFilterNotificationGetEffectIdentifier(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveSetFilterCommandWithIdentifier:", self, v5);

}

- (void)onGetEffectsRequest:(id)a3
{
  void *v4;
  id v5;

  JFXEffectsRequestGetEffectsType(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveGetEffectsRequest:", self, v5);

}

- (void)onGetEffectsResponse:(id)a3
{
  void *v4;
  id v5;

  JFXEffectsResponseGetEffects(a3, a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveGetEffectsResponse:", self, v5);

}

- (void)onOpenProjectPickerNotification:(id)a3
{
  id v4;

  -[JFXRemoteCommandServer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveOpenProjectPicker:", self, 0);

}

- (void)onOpenProjectNotification:(id)a3
{
  void *v4;
  id v5;

  JFXOpenProjectGetProjectIndex(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveOpenProjectAtIndex:", self, objc_msgSend(v5, "integerValue"));

}

- (void)onNewProjectNotification:(id)a3
{
  id v4;

  -[JFXRemoteCommandServer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveNewProject:", self, 0);

}

- (void)onPlayNotification:(id)a3
{
  id v4;

  -[JFXRemoteCommandServer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceivePlay:", self, 0);

}

- (void)onPlayClipAtIndexNotification:(id)a3
{
  void *v4;
  id v5;

  JFXPlayGetClipIndex(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceivePlayClipAtIndex:", self, v5);

}

- (void)onRecordNotification:(id)a3
{
  void *v4;
  id v5;

  JFXRecordGetDuration(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveRecordWithDuration:", self, v5);

}

- (void)onExportProjectNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  JFXExportGetProjectIndex(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  JFXExportGetAsMovie(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXRemoteCommandServer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteCommandServer:didReceiveExportProjectAtIndex:asMovie:", self, objc_msgSend(v7, "integerValue"), objc_msgSend(v5, "integerValue") != 0);

}

- (void)onExportProjectResponseNotification:(id)a3
{
  id v4;

  -[JFXRemoteCommandServer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveExportResponse:", self, 0);

}

- (void)onAddPosterWithIdentifierNotification:(id)a3
{
  void *v4;
  id v5;

  JFXAddPosterWithIdentifierNotificationGetPosterIdentifier(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveAddPosterWithPosterIdentifier:", self, v5);

}

- (void)onAddPosterWithNameNotification:(id)a3
{
  void *v4;
  id v5;

  JFXAddPosterWithNameNotificationGetPosterName(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveAddPosterWithPosterName:", self, v5);

}

- (void)onAddEffectWithIdentifierNotification:(id)a3
{
  void *v4;
  id v5;

  JFXAddEffectWithIdentifierNotificationGetEffectIdentifier(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveAddEffectWithEffectIdentifier:", self, v5);

}

- (void)onAddEffectWithNameNotification:(id)a3
{
  void *v4;
  id v5;

  JFXAddEffectWithNameNotificationGetEffectName(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveAddEffectWithEffectName:", self, v5);

}

- (void)onAddAREffectWithIdentifierNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  JFXAddAREffectWithIdentifierNotificationGetEffectIdentifier(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  JFXAddAREffectWithIdentifierNotificationGetReplayFilename(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXRemoteCommandServer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteCommandServer:didReceiveAddAREffectWithEffectIdentifier:replayFilename:", self, v7, v5);

}

- (void)onSetAspectRatioNotification:(id)a3
{
  void *v4;
  id v5;

  JFXGetAspectRatio(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveSetAspectRatio:", self, objc_msgSend(v5, "integerValue"));

}

- (void)onAddShapeWithIdentifierNotification:(id)a3
{
  void *v4;
  id v5;

  JFXAddShapeWithIdentifierNotificationGetEffectIdentifier(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXRemoteCommandServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteCommandServer:didReceiveAddShapeCommandWithIdentifier:", self, v5);

}

- (void)onAddStickerNotification:(id)a3
{
  id v4;
  double Offset;
  double v6;
  double v7;
  double Scale;
  double Rotation;
  void *v10;
  id v11;

  v4 = a3;
  JFXAddStickerNotificationGetData(v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  Offset = JFXAddStickerNotificationGetOffset(v4);
  v7 = v6;
  Scale = JFXAddStickerNotificationGetScale(v4);
  Rotation = JFXAddStickerNotificationGetRotation(v4);

  -[JFXRemoteCommandServer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteCommandServer:didReceiveAddStickerCommandWithData:offset:scale:rotation:", self, v11, Offset, v7, Scale, Rotation);

}

- (void)onAddStickerWithIdentifierNotification:(id)a3
{
  id v4;
  double Offset;
  double v6;
  double v7;
  double Scale;
  double Rotation;
  void *v10;
  id v11;

  v4 = a3;
  JFXAddStickerNotificationGetEffectIdentifier(v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  Offset = JFXAddStickerNotificationGetOffset(v4);
  v7 = v6;
  Scale = JFXAddStickerNotificationGetScale(v4);
  Rotation = JFXAddStickerNotificationGetRotation(v4);

  -[JFXRemoteCommandServer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteCommandServer:didReceiveAddStickerCommandWithIdentifier:offset:scale:rotation:", self, v11, Offset, v7, Scale, Rotation);

}

- (void)onAddTextNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  JFXAddTextNotificationGetEffectIdentifier(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  JFXAddTextNotificationGetEffectString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXRemoteCommandServer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteCommandServer:didReceiveAddTextCommandWithIdentifier:string:", self, v7, v5);

}

- (JFXRemoteCommandServerDelegate)delegate
{
  return (JFXRemoteCommandServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  return self->_distributedNotificationCenter;
}

- (void)setDistributedNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_distributedNotificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
