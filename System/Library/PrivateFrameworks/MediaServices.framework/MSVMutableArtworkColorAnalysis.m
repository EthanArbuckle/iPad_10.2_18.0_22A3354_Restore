@implementation MSVMutableArtworkColorAnalysis

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MSVArtworkColorAnalysis _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->super._backgroundColorHex, a3);
}

- (void)setBackgroundColorLight:(BOOL)a3
{
  self->super._backgroundColorLight = a3;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->super._primaryTextColorHex, a3);
}

- (void)setPrimaryTextColorLight:(BOOL)a3
{
  self->super._primaryTextColorLight = a3;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->super._secondaryTextColorHex, a3);
}

- (void)setSecondaryTextColorLight:(BOOL)a3
{
  self->super._secondaryTextColorLight = a3;
}

- (void)setTertiaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->super._tertiaryTextColorHex, a3);
}

- (void)setTertiaryTextColorLight:(BOOL)a3
{
  self->super._tertiaryTextColorLight = a3;
}

@end
