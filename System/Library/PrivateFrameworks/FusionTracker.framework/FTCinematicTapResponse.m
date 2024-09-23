@implementation FTCinematicTapResponse

- (FTCinematicTapRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (void)setWasSuccessful:(BOOL)a3
{
  self->_wasSuccessful = a3;
}

- (FTCinematicTrack)tappedTrack
{
  return self->_tappedTrack;
}

- (void)setTappedTrack:(id)a3
{
  objc_storeStrong((id *)&self->_tappedTrack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tappedTrack, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
