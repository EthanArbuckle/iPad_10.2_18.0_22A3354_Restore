@implementation KGMutableElementIdentifierSet

- (void)mutableBitmap
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KGMutableElementIdentifierSet;
  return -[KGElementIdentifierSet mutableBitmap](&v3, sel_mutableBitmap);
}

- (void)addIdentifier:(unint64_t)a3
{
  degas::Bitmap::setBit((degas::Bitmap *)-[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap"), a3);
}

- (void)removeIdentifier:(unint64_t)a3
{
  degas::Bitmap::clearBit((degas::BitsetPtr **)-[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap"), a3);
}

- (void)removeAllIdentifiers
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  v2 = -[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap");
  *v2 = 0;
  v2[1] = 0;
  v3 = v2[2];
  for (i = v2[3]; i != v3; i -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
    *(_QWORD *)(i - 8) = 0;
  }
  v2[3] = v3;
}

- (void)unionWithIdentifierSet:(id)a3
{
  id v4;

  v4 = a3;
  degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)-[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap"), objc_msgSend(v4, "bitmap"));

}

- (void)intersectWithIdentifierSet:(id)a3
{
  id v4;

  v4 = a3;
  degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)-[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap"), (degas::Bitmap *)objc_msgSend(v4, "bitmap"));

}

- (void)subtractIdentifierSet:(id)a3
{
  id v4;

  v4 = a3;
  degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)-[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap"), (degas::Bitmap *)objc_msgSend(v4, "bitmap"));

}

- (void)formSymmetricDifferenceWithIdentifierSet:(id)a3
{
  id v4;

  v4 = a3;
  degas::Bitmap::symmetricDiffWith<degas::Bitmap>((degas::Bitmap *)-[KGMutableElementIdentifierSet mutableBitmap](self, "mutableBitmap"), objc_msgSend(v4, "bitmap"));

}

- (id)copy
{
  return -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", -[KGElementIdentifierSet bitmap](self, "bitmap"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[KGElementIdentifierSet initWithBitmap:](+[KGElementIdentifierSet allocWithZone:](KGElementIdentifierSet, "allocWithZone:", a3), "initWithBitmap:", -[KGElementIdentifierSet bitmap](self, "bitmap"));
}

@end
