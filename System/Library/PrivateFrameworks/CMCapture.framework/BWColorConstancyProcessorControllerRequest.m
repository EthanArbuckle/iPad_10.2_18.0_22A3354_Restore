@implementation BWColorConstancyProcessorControllerRequest

- (BOOL)readyForProcessing
{
  if (-[BWStillImageProcessorControllerInput flashFrame](-[BWStillImageProcessorControllerRequest input](self, "input"), "flashFrame")&& -[BWStillImageProcessorControllerInput ambientFrame](-[BWStillImageProcessorControllerRequest input](self, "input"), "ambientFrame"))
  {
    return 1;
  }
  else
  {
    return -[BWStillImageProcessorControllerInput addFrameFailed](-[BWStillImageProcessorControllerRequest input](self, "input"), "addFrameFailed");
  }
}

- (int)demosaicedRawErr
{
  return self->_demosaicedRawErr;
}

- (void)setDemosaicedRawErr:(int)a3
{
  self->_demosaicedRawErr = a3;
}

@end
