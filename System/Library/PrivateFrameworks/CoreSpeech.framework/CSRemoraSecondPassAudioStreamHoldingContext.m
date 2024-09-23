@implementation CSRemoraSecondPassAudioStreamHoldingContext

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setAudioStreamHolding:(id)a3
{
  objc_storeStrong((id *)&self->_audioStreamHolding, a3);
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_audioStreamHolding, 0);
}

@end
