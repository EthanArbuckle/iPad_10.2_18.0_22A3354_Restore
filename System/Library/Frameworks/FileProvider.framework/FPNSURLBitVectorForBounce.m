@implementation FPNSURLBitVectorForBounce

- (FPNSURLBitVectorForBounce)init
{
  FPNSURLBitVectorForBounce *v2;
  int v3;
  __CFBitVector *Mutable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FPNSURLBitVectorForBounce;
  v2 = -[FPNSURLBitVectorForBounce init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "fp_maximumBounceLevel");
    v2->_bitCount = v3;
    Mutable = CFBitVectorCreateMutable(0, v3);
    v2->_vector = Mutable;
    CFBitVectorSetCount(Mutable, v2->_bitCount);
  }
  return v2;
}

- (void)markBounceNumberAsFound:(id)a3
{
  unsigned int v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "unsignedIntValue");
  if (objc_msgSend(MEMORY[0x1E0CB3940], "fp_maximumBounceLevel") >= (unint64_t)v4)
    CFBitVectorSetBitAtIndex(self->_vector, (int)(objc_msgSend(v5, "intValue") - 1), 1u);

}

- (id)findNextAvailableBounceNumberFromIndex:(int)a3
{
  CFRange v4;

  v4.location = a3;
  v4.length = self->_bitCount - 1;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CFBitVectorGetFirstIndexOfBit(self->_vector, v4, 0));
}

- (id)findNextAvailableBounceNumber
{
  return -[FPNSURLBitVectorForBounce findNextAvailableBounceNumberFromIndex:](self, "findNextAvailableBounceNumberFromIndex:", 1);
}

- (BOOL)foundAllAvailableBounceNumbers
{
  CFRange v3;

  v3.length = self->_bitCount - 1;
  v3.location = 1;
  return CFBitVectorGetCountOfBit(self->_vector, v3, 1u) == self->_bitCount - 2;
}

- (int)bitCount
{
  return self->_bitCount;
}

@end
