@implementation BLSXPCBacklightProxyObserverMask(BLSHXPCBacklightProxyHost)

- (uint64_t)noActivatingMask
{
  return objc_msgSend((id)objc_opt_class(), "maskForObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:", objc_msgSend(a1, "isObservingDidCompleteUpdateToState"), objc_msgSend(a1, "isObservingEventsArray"), objc_msgSend(a1, "isObservingDidChangeAlwaysOnEnabled"), 0, 0, objc_msgSend(a1, "isObservingPerformingEvent"));
}

- (uint64_t)noPerformingEventMask
{
  return objc_msgSend((id)objc_opt_class(), "maskForObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:", objc_msgSend(a1, "isObservingDidCompleteUpdateToState"), objc_msgSend(a1, "isObservingEventsArray"), objc_msgSend(a1, "isObservingDidChangeAlwaysOnEnabled"), objc_msgSend(a1, "isObservingActivatingWithEvent"), objc_msgSend(a1, "isObservingDeactivatingWithEvent"), 0);
}

@end
