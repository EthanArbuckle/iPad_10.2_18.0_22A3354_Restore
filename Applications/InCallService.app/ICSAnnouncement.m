@implementation ICSAnnouncement

- (ICSAnnouncement)init
{
  ICSAnnouncement *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICSAnnouncement;
  result = -[ICSAnnouncement init](&v3, "init");
  if (result)
    result->_delay = 1.0;
  return result;
}

- (void)pause
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement speechSynthesizer](self, "speechSynthesizer"));
  objc_msgSend(v2, "pauseSpeakingAtBoundary:", 1);

}

- (void)start
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement text](self, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSpeechUtterance speechUtteranceWithString:](AVSpeechUtterance, "speechUtteranceWithString:", v3));
  -[ICSAnnouncement setSpeechUtterance:](self, "setSpeechUtterance:", v4);

  -[ICSAnnouncement delay](self, "delay");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement speechUtterance](self, "speechUtterance"));
  objc_msgSend(v7, "setPreUtteranceDelay:", v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement speechSynthesizer](self, "speechSynthesizer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement speechUtterance](self, "speechUtterance"));
  objc_msgSend(v9, "speakUtterance:", v8);

}

- (void)stop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement speechSynthesizer](self, "speechSynthesizer"));
  objc_msgSend(v2, "stopSpeakingAtBoundary:", 1);

}

- (AVSpeechSynthesizer)speechSynthesizer
{
  AVSpeechSynthesizer *speechSynthesizer;
  AVSpeechSynthesizer *v4;
  AVSpeechSynthesizer *v5;

  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    v4 = (AVSpeechSynthesizer *)objc_alloc_init((Class)AVSpeechSynthesizer);
    v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    -[AVSpeechSynthesizer setDelegate:](self->_speechSynthesizer, "setDelegate:", self);
    speechSynthesizer = self->_speechSynthesizer;
  }
  return speechSynthesizer;
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "announcementDidStart:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
    objc_msgSend(v9, "announcementDidStart:", self);

  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[ICSAnnouncement setSpeechUtterance:](self, "setSpeechUtterance:", 0, a4);
  -[ICSAnnouncement setText:](self, "setText:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "announcementDidFinish:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
    objc_msgSend(v7, "announcementDidFinish:", self);

  }
}

- (void)speechSynthesizer:(id)a3 didPauseSpeechUtterance:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "announcementDidPause:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
    objc_msgSend(v9, "announcementDidPause:", self);

  }
}

- (void)speechSynthesizer:(id)a3 didContinueSpeechUtterance:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "announcementDidContinue:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
    objc_msgSend(v9, "announcementDidContinue:", self);

  }
}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }

  -[ICSAnnouncement speechSynthesizer:didFinishSpeechUtterance:](self, "speechSynthesizer:didFinishSpeechUtterance:", v7, v6);
}

- (ICSAnnouncementDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ICSAnnouncementDelegate *)a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSpeechSynthesizer:(id)a3
{
  objc_storeStrong((id *)&self->_speechSynthesizer, a3);
}

- (AVSpeechUtterance)speechUtterance
{
  return self->_speechUtterance;
}

- (void)setSpeechUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_speechUtterance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechUtterance, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
