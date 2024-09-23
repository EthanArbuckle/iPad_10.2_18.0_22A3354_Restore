@implementation BWScalerProcessorControllerRequest

- (BOOL)readyForProcessing
{
  return -[BWStillImageProcessorControllerInput frame](-[BWStillImageProcessorControllerRequest input](self, "input"), "frame") != 0;
}

@end
