@implementation LiveSpeechCaptionsClient

+ (LiveSpeechCaptionsClient)shared
{
  if (qword_254356788 != -1)
    swift_once();
  return (LiveSpeechCaptionsClient *)(id)qword_254356780;
}

- (LiveSpeechCaptionsClient)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___LiveSpeechCaptionsClient__client) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[LiveSpeechCaptionsClient init](&v5, sel_init);
}

- (void)dealloc
{
  objc_class *ObjectType;
  LiveSpeechCaptionsClient *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_2409D2864();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[LiveSpeechCaptionsClient dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{

}

- (BOOL)startLiveSpeechAndReturnError:(id *)a3
{
  LiveSpeechCaptionsClient *v3;

  v3 = self;
  LiveSpeechCaptionsClient.startLiveSpeech()();

  return 1;
}

- (BOOL)stopLiveSpeechAndReturnError:(id *)a3
{
  LiveSpeechCaptionsClient *v3;

  v3 = self;
  LiveSpeechCaptionsClient.stopLiveSpeech()();

  return 1;
}

- (BOOL)startLiveCaptionsAndReturnError:(id *)a3
{
  LiveSpeechCaptionsClient *v3;

  v3 = self;
  LiveSpeechCaptionsClient.startLiveCaptions()();

  return 1;
}

- (BOOL)stopLiveCaptionsAndReturnError:(id *)a3
{
  LiveSpeechCaptionsClient *v3;

  v3 = self;
  LiveSpeechCaptionsClient.stopLiveCaptions()();

  return 1;
}

- (NSString)serviceName
{
  return (NSString *)(id)sub_2409D8328();
}

- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4
{
  return objc_msgSend((id)objc_opt_self(), sel_mainAccessQueue);
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v5;
  LiveSpeechCaptionsClient *v6;

  v5 = a3;
  v6 = self;
  LiveSpeechCaptionsClient.connectionWithServiceWasInterrupted(forUserInterfaceClient:)((uint64_t)a3);

}

@end
