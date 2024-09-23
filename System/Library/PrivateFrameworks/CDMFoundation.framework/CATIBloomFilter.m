@implementation CATIBloomFilter

- (CATIBloomFilter)initWithExceptedNumberOfItems:(unint64_t)a3 falsePositiveRate:(double)a4 seed:(unsigned int)a5
{
  CATIBloomFilter *v8;
  CATIBloomFilter *v9;
  unint64_t v10;
  unint64_t v11;
  CATIBitVector *v12;
  CATIBitVector *bitVector;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CATIBloomFilter;
  v8 = -[CATIBloomFilter init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_seed = a5;
    v10 = a3 + a5;
    v8->_expectedNumberOfItems = v10;
    v8->_falsePositiveRate = a4;
    v11 = vcvtpd_u64_f64(log(a4) * (double)v10 / -0.480453014);
    v9->_numberOfBits = v11;
    v9->_numberHashes = vcvtpd_u64_f64((double)(v11 / v10) * 0.693147181);
    v12 = -[CATIBitVector initWithNumberOfBits:]([CATIBitVector alloc], "initWithNumberOfBits:", v9->_numberOfBits);
    bitVector = v9->bitVector;
    v9->bitVector = v12;

  }
  return v9;
}

- (void)add:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;

  v10 = objc_retainAutorelease(a3);
  v4 = +[MurmurHash3 hash128WithKey:length:seed:](MurmurHash3, "hash128WithKey:length:seed:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), self->_seed);
  if (self->_numberHashes)
  {
    v6 = v4;
    v7 = v5;
    v8 = 0;
    v9 = 0;
    do
    {
      -[CATIBitVector setAtIndex:](self->bitVector, "setAtIndex:", (v6 + v8 * v7) % self->_numberOfBits);
      v8 = ++v9;
    }
    while (self->_numberHashes > v9);
  }

}

- (BOOL)contains:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;

  v4 = objc_retainAutorelease(a3);
  v5 = +[MurmurHash3 hash128WithKey:length:seed:](MurmurHash3, "hash128WithKey:length:seed:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), self->_seed);
  if (self->_numberHashes)
  {
    v7 = v5;
    v8 = v6;
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = -[CATIBitVector testAtIndex:](self->bitVector, "testAtIndex:", (v7 + v9 * v8) % self->_numberOfBits);
      if (!v11)
        break;
      v9 = ++v10;
    }
    while (self->_numberHashes > v10);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (unsigned)seed
{
  return self->_seed;
}

- (unint64_t)expectedNumberOfItems
{
  return self->_expectedNumberOfItems;
}

- (double)falsePositiveRate
{
  return self->_falsePositiveRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bitVector, 0);
}

@end
