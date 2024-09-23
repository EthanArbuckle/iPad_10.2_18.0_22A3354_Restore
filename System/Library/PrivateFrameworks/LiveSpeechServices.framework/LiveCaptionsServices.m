@implementation LiveCaptionsServices

+ (void)startLiveCaptionsAndReturnError:(id *)a3
{
  id v4;

  +[LiveSpeechCaptionsClient shared](LiveSpeechCaptionsClient, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startLiveCaptionsAndReturnError:", a3);

}

+ (void)stopLiveCaptionsAndReturnError:(id *)a3
{
  id v4;

  +[LiveSpeechCaptionsClient shared](LiveSpeechCaptionsClient, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopLiveCaptionsAndReturnError:", a3);

}

@end
