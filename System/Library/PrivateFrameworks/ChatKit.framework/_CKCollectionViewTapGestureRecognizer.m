@implementation _CKCollectionViewTapGestureRecognizer

- (void)setOriginatingItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_originatingItemIdentifier, a3);
}

- (NSString)originatingItemIdentifier
{
  return self->_originatingItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingItemIdentifier, 0);
}

@end
