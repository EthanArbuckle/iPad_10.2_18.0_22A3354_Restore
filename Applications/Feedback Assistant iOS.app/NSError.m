@implementation NSError

- (BOOL)isFBAErrorWithCode:(int64_t)a3
{
  void *v4;
  unsigned __int8 v5;

  if (-[NSError code](self, "code") != a3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.appleseed.FeedbackAssistant"));

  return v5;
}

@end
