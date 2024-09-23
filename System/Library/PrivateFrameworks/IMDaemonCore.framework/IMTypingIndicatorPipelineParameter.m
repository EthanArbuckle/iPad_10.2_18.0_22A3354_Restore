@implementation IMTypingIndicatorPipelineParameter

- (IMTypingIndicatorPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  IMTypingIndicatorPipelineParameter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMTypingIndicatorPipelineParameter;
  v7 = -[IMTextMessagePipelineParameter initWithBD:idsTrustedData:](&v19, sel_initWithBD_idsTrustedData_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "messageSubType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "typingIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v11, "dataUsingEncoding:error:", 0, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;

    objc_msgSend(v9, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && !v12)
    {
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1D166D32C((uint64_t)v13, v15);

    }
    -[IMTypingIndicatorPipelineParameter setIsFinished:](v7, "setIsFinished:", objc_msgSend(v9, "isFinished"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "balloonPluginBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMTypingIndicatorPipelineParameter setBalloonPluginBundleID:](v7, "setBalloonPluginBundleID:", v16);

    }
    -[IMTypingIndicatorPipelineParameter setTypingIndicatorIconData:](v7, "setTypingIndicatorIconData:", v12);

  }
  return v7;
}

- (IMTypingIndicatorPipelineParameter)initWithBDBasic:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  IMTypingIndicatorPipelineParameter *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMTypingIndicatorPipelineParameter;
  v7 = -[IMTextMessagePipelineParameter initWithBDBasic:idsTrustedData:](&v11, sel_initWithBDBasic_idsTrustedData_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "messageSubType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "typingIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMTypingIndicatorPipelineParameter setIsFinished:](v7, "setIsFinished:", objc_msgSend(v9, "isFinished"));
  }

  return v7;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (NSString)balloonPluginBundleID
{
  return self->_balloonPluginBundleID;
}

- (void)setBalloonPluginBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSData)typingIndicatorIconData
{
  return self->_typingIndicatorIconData;
}

- (void)setTypingIndicatorIconData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingIndicatorIconData, 0);
  objc_storeStrong((id *)&self->_balloonPluginBundleID, 0);
}

@end
