@implementation BWSmartStyleRenderingProcessorControllerRequest

- (BOOL)readyForProcessing
{
  if (-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](self, "input"), "inputFrame"))
  {
    return 1;
  }
  else
  {
    return -[BWStillImageProcessorControllerInput addFrameFailed](-[BWStillImageProcessorControllerRequest input](self, "input"), "addFrameFailed");
  }
}

@end
