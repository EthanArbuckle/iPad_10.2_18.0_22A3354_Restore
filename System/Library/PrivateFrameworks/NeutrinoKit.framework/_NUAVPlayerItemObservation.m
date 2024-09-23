@implementation _NUAVPlayerItemObservation

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_playerItem, a3);
}

- (BOOL)registeredKVO
{
  return self->_registeredKVO;
}

- (void)setRegisteredKVO:(BOOL)a3
{
  self->_registeredKVO = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end
