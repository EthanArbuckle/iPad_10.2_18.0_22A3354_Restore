@implementation DKWalletLocalPaymentCardViewModel

- (NSString)subtitle
{
  return self->subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->subtitle, a3);
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->title, a3);
}

- (NSString)uniqueIdentifier
{
  return self->uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->uniqueIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_storeStrong((id *)&self->subtitle, 0);
}

@end
