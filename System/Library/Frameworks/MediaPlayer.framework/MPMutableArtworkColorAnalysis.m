@implementation MPMutableArtworkColorAnalysis

- (void)setTertiaryTextColorLight:(BOOL)a3
{
  self->super._tertiaryTextColorLight = a3;
}

- (void)setTertiaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->super._tertiaryTextColor, a3);
}

- (void)setSecondaryTextColorLight:(BOOL)a3
{
  self->super._secondaryTextColorLight = a3;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->super._secondaryTextColor, a3);
}

- (void)setPrimaryTextColorLight:(BOOL)a3
{
  self->super._primaryTextColorLight = a3;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->super._primaryTextColor, a3);
}

- (void)setBackgroundColorLight:(BOOL)a3
{
  self->super._backgroundColorLight = a3;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->super._backgroundColor, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPArtworkColorAnalysis _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

@end
