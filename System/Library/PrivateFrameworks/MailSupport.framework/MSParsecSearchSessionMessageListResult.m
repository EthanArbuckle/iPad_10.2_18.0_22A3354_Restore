@implementation MSParsecSearchSessionMessageListResult

- (id)feedbackResult
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSParsecSearchSessionMessageListResult;
  -[MSParsecSearchSessionMessageResult feedbackResult](&v4, sel_feedbackResult);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSectionBundleIdentifier:", CFSTR("com.apple.mail.search.messagelist"));
  objc_msgSend(v2, "setResultBundleId:", CFSTR("com.apple.mail.search.messageresult"));
  return v2;
}

@end
