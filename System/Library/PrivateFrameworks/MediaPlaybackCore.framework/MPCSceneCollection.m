@implementation MPCSceneCollection

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(double)a3
{
  self->_frameRate = a3;
}

- (NSArray)scenes
{
  return self->_scenes;
}

- (void)setScenes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenes, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
