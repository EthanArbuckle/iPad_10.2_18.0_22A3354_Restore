@implementation _MXExtensionInternalStreamingServiceRequestDispatcher

- (void)startSendingUpdatesForRequest:(id)a3 vendor:(id)a4 toObserver:(id)a5
{
  objc_msgSend(a4, "startSendingUpdatesForRequest:toObserver:", a3, a5);
}

- (void)stopSendingUpdatesForRequest:(id)a3 vendor:(id)a4
{
  objc_msgSend(a4, "stopSendingUpdatesForRequest:", a3);
}

- (id)serviceProtocol
{
  return &unk_1EE079980;
}

@end
