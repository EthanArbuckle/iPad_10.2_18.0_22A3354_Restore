@implementation BWStereoDisparityRequest

- (BOOL)readyForProcessing
{
  uint64_t v3;

  v3 = -[BWStillImageProcessorControllerInput referenceSbuf](-[BWStillImageProcessorControllerRequest input](self, "input"), "referenceSbuf");
  if (v3)
    LOBYTE(v3) = -[BWStillImageProcessorControllerInput auxiliarySbuf](-[BWStillImageProcessorControllerRequest input](self, "input"), "auxiliarySbuf") != 0;
  return v3;
}

@end
