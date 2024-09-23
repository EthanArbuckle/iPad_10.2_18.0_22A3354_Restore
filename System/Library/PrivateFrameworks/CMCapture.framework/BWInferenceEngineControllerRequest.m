@implementation BWInferenceEngineControllerRequest

- (BOOL)readyForProcessing
{
  return -[BWStillImageProcessorControllerInput expectsMoreData](-[BWStillImageProcessorControllerRequest input](self, "input"), "expectsMoreData") ^ 1;
}

@end
