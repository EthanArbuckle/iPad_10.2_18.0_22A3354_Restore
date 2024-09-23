@implementation TDThemeLook

- (void)setSupportsContrastAdjustment:(BOOL)a3
{
  if (*((_BYTE *)&self->super._identifier + 4) != a3)
  {
    -[TDThemeLook willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supportsContrastAdjustment"));
    *((_BYTE *)&self->super._identifier + 4) = a3;
    -[TDThemeLook didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supportsContrastAdjustment"));
  }
}

- (BOOL)supportsContrastAdjustment
{
  char v3;

  -[TDThemeLook willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("supportsContrastAdjustment"));
  v3 = *((_BYTE *)&self->super._identifier + 4);
  -[TDThemeLook didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("supportsContrastAdjustment"));
  return v3;
}

@end
