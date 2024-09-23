@implementation BWPhotoEncoderControllerRequest

- (BOOL)readyForProcessing
{
  return -[BWStillImageProcessorControllerInput receivedAllFramesInSingleContainer](-[BWStillImageProcessorControllerRequest input](self, "input"), "receivedAllFramesInSingleContainer");
}

@end
