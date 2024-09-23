@implementation TDNamedArtworkProduction

- (void)setDateOfLastChange:(id)a3
{
  if (!-[TDNamedArtworkProduction hasCustomDateOfLastChange](self, "hasCustomDateOfLastChange"))
    -[TDNamedArtworkProduction setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", a3, CFSTR("dateOfLastChange"));
}

- (BOOL)hasCustomDateOfLastChange
{
  return self->_hasCustomDateOfLastChange;
}

- (void)setHasCustomDateOfLastChange:(BOOL)a3
{
  self->_hasCustomDateOfLastChange = a3;
}

@end
