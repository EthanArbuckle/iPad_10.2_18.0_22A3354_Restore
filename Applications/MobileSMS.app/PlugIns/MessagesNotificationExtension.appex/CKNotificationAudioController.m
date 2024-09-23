@implementation CKNotificationAudioController

- (CKNotificationAudioController)initWithMediaObjects:(id)a3 completionBlock:(id)a4
{
  id v5;
  CKNotificationAudioController *v6;
  id v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKNotificationAudioController;
  v6 = -[CKNotificationAudioController init](&v10, "init");
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)CKAudioController), "initWithMediaObjects:", v5);
    -[CKNotificationAudioController setAudioController:](v6, "setAudioController:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKNotificationAudioController audioController](v6, "audioController"));
    objc_msgSend(v8, "setDelegate:", v6);

  }
  return v6;
}

- (void)play
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CKNotificationAudioController audioController](self, "audioController"));
  objc_msgSend(v2, "play");

}

+ (void)playMessageID:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatHistoryController sharedInstance](IMChatHistoryController, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003448;
  v10[3] = &unk_1000040A0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "loadMessageWithGUID:completionBlock:", v9, v10);

}

- (void)audioControllerDidPause:(id)a3
{
  void (**completionBlock)(id, SEL, id);
  CKAudioController *audioController;
  id v6;

  completionBlock = (void (**)(id, SEL, id))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2](completionBlock, a2, a3);
    audioController = self->_audioController;
    self->_audioController = 0;

    v6 = self->_completionBlock;
    self->_completionBlock = 0;

  }
}

- (void)audioControllerDidStop:(id)a3
{
  void (**completionBlock)(id, SEL, id);
  CKAudioController *audioController;
  id v6;

  completionBlock = (void (**)(id, SEL, id))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2](completionBlock, a2, a3);
    audioController = self->_audioController;
    self->_audioController = 0;

    v6 = self->_completionBlock;
    self->_completionBlock = 0;

  }
}

- (CKAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
  objc_storeStrong((id *)&self->_audioController, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
}

@end
