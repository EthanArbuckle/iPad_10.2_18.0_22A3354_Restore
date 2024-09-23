@implementation MSVLyricsAudioAttributes

- (double)lyricsOffset
{
  return self->_lyricsOffset;
}

- (void)setLyricsOffset:(double)a3
{
  self->_lyricsOffset = a3;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isSpatialRole
{
  return self->_spatialRole;
}

- (void)setSpatialRole:(BOOL)a3
{
  self->_spatialRole = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
}

@end
