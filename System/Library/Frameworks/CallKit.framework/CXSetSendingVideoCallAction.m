@implementation CXSetSendingVideoCallAction

- (CXSetSendingVideoCallAction)initWithCallUUID:(id)a3 sendingVideo:(BOOL)a4
{
  CXSetSendingVideoCallAction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXSetSendingVideoCallAction;
  result = -[CXCallAction initWithCallUUID:](&v6, sel_initWithCallUUID_, a3);
  if (result)
    result->_sendingVideo = a4;
  return result;
}

- (id)customDescription
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXSetSendingVideoCallAction;
  -[CXCallAction customDescription](&v5, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sendingVideo=%d"), -[CXSetSendingVideoCallAction isSendingVideo](self, "isSendingVideo"));
  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetSendingVideoCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v7, sel_updateCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setSendingVideo:", -[CXSetSendingVideoCallAction isSendingVideo](self, "isSendingVideo", v7.receiver, v7.super_class));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetSendingVideoCallAction)initWithCoder:(id)a3
{
  id v4;
  CXSetSendingVideoCallAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetSendingVideoCallAction;
  v5 = -[CXCallAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_isSendingVideo);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sendingVideo = objc_msgSend(v4, "decodeBoolForKey:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSetSendingVideoCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = -[CXSetSendingVideoCallAction isSendingVideo](self, "isSendingVideo", v7.receiver, v7.super_class);
  NSStringFromSelector(sel_isSendingVideo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

}

- (BOOL)isSendingVideo
{
  return self->_sendingVideo;
}

- (void)setSendingVideo:(BOOL)a3
{
  self->_sendingVideo = a3;
}

@end
