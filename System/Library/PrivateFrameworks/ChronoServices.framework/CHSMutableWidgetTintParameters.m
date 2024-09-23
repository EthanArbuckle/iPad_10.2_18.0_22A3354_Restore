@implementation CHSMutableWidgetTintParameters

- (void)setPrimaryTintColor:(id)a3
{
  objc_storeStrong((id *)&self->super._primaryTintColor, a3);
}

- (void)setSecondaryTintColor:(id)a3
{
  objc_storeStrong((id *)&self->super._secondaryTintColor, a3);
}

- (void)setFilterStyle:(int64_t)a3
{
  self->super._filterStyle = a3;
}

- (void)setFallbackFilterStyle:(int64_t)a3
{
  self->super._fallbackFilterStyle = a3;
}

- (void)setFraction:(double)a3
{
  self->super._fraction = a3;
}

- (void)setAccentedAlternateBackground:(BOOL)a3
{
  self->super._accentedAlternateBackground = a3;
}

- (void)setAccentedDesaturatedMode:(int64_t)a3
{
  self->super._accentedDesaturatedMode = a3;
}

@end
