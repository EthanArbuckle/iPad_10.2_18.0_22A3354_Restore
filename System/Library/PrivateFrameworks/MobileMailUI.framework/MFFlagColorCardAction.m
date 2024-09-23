@implementation MFFlagColorCardAction

- (NSNumber)flagColor
{
  return self->_flagColor;
}

- (void)setFlagColor:(id)a3
{
  objc_storeStrong((id *)&self->_flagColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagColor, 0);
}

@end
