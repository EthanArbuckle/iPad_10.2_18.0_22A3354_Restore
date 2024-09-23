@implementation DTTapDataMemo

- (BOOL)supportsPeek
{
  return *((_BYTE *)&self->super._tapVersion + 4);
}

- (void)setSupportsPeek:(BOOL)a3
{
  *((_BYTE *)&self->super._tapVersion + 4) = a3;
}

- (BOOL)finalMemo
{
  return *((_BYTE *)&self->super._tapVersion + 5);
}

- (void)setFinalMemo:(BOOL)a3
{
  *((_BYTE *)&self->super._tapVersion + 5) = a3;
}

@end
