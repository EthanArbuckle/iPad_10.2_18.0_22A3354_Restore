@implementation BWDeferredProcessorControllerRequest

- (BOOL)readyForProcessing
{
  return -[BWStillImageProcessorControllerInput container](-[BWStillImageProcessorControllerRequest input](self, "input"), "container") != 0;
}

@end
