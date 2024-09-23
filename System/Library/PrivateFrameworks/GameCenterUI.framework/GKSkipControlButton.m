@implementation GKSkipControlButton

- (NSString)skipValueString
{
  return self->_skipValueString;
}

- (void)setSkipValueString:(id)a3
{
  objc_storeStrong((id *)&self->_skipValueString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipValueString, 0);
}

@end
