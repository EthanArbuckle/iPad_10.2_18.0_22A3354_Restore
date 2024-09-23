@implementation FlexSegmentAudioFileInfo

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(int64_t)a3
{
  self->_sampleCount = a3;
}

- (int64_t)bpm
{
  return self->_bpm;
}

- (void)setBpm:(int64_t)a3
{
  self->_bpm = a3;
}

- (int64_t)bars
{
  return self->_bars;
}

- (void)setBars:(int64_t)a3
{
  self->_bars = a3;
}

- (int64_t)samplesPerBar
{
  return self->_samplesPerBar;
}

- (void)setSamplesPerBar:(int64_t)a3
{
  self->_samplesPerBar = a3;
}

- (NSArray)customBarMarkers
{
  return self->_customBarMarkers;
}

- (void)setCustomBarMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_customBarMarkers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBarMarkers, 0);
}

@end
