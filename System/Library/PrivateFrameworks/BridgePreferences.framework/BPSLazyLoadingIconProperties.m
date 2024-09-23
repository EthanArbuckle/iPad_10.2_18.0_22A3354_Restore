@implementation BPSLazyLoadingIconProperties

- (NSString)squareIconName
{
  return self->_squareIconName;
}

- (void)setSquareIconName:(id)a3
{
  objc_storeStrong((id *)&self->_squareIconName, a3);
}

- (NSString)lazyIconID
{
  return self->_lazyIconID;
}

- (void)setLazyIconID:(id)a3
{
  objc_storeStrong((id *)&self->_lazyIconID, a3);
}

- (BOOL)flipsForRTL
{
  return self->_flipsForRTL;
}

- (void)setFlipsForRTL:(BOOL)a3
{
  self->_flipsForRTL = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void)setBundlePath:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lazyIconID, 0);
  objc_storeStrong((id *)&self->_squareIconName, 0);
}

@end
