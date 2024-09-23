@implementation CAMAnalyticsMessagesCaptureEvent

- (CAMAnalyticsMessagesCaptureEvent)init
{
  CAMAnalyticsMessagesCaptureEvent *v2;
  CAMAnalyticsMessagesCaptureEvent *v3;
  CAMAnalyticsMessagesCaptureEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMAnalyticsMessagesCaptureEvent;
  v2 = -[CAMAnalyticsEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)populateFromReviewAsset:(id)a3 withSourceType:(unint64_t)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;

  v6 = a3;
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  v8 = CFSTR("MessagesCamera");
  if (a4 != 2)
    v8 = 0;
  if (a4 == 4)
    v9 = CFSTR("FunCam");
  else
    v9 = v8;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("Origin"));
  v10 = objc_msgSend(v6, "mediaType");

  v11 = CFSTR("Photo");
  if (v10 != 1)
    v11 = 0;
  if (v10 == 2)
    v12 = CFSTR("Video");
  else
    v12 = v11;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("CaptureType"));

}

- (id)eventName
{
  return CFSTR("messages.capture");
}

@end
