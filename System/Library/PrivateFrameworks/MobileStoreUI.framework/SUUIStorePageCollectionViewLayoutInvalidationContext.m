@implementation SUUIStorePageCollectionViewLayoutInvalidationContext

- (BOOL)invalidateItemPinningLayoutInformation
{
  return *((_BYTE *)&self->super._flowLayoutInvalidationFlags + 4);
}

- (void)setInvalidateItemPinningLayoutInformation:(BOOL)a3
{
  *((_BYTE *)&self->super._flowLayoutInvalidationFlags + 4) = a3;
}

- (BOOL)invalidatePinnedBackdropViewStyle
{
  return *((_BYTE *)&self->super._flowLayoutInvalidationFlags + 5);
}

- (void)setInvalidatePinnedBackdropViewStyle:(BOOL)a3
{
  *((_BYTE *)&self->super._flowLayoutInvalidationFlags + 5) = a3;
}

@end
