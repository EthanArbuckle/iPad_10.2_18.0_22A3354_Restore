@implementation KGElementIdentifierSet

- (KGElementIdentifierSet)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KGElementIdentifierSet;
  return -[KGElementIdentifierSet init](&v3, sel_init);
}

- (KGElementIdentifierSet)initWithElementIdentifier:(unint64_t)a3
{
  KGElementIdentifierSet *v4;
  KGElementIdentifierSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KGElementIdentifierSet;
  v4 = -[KGElementIdentifierSet init](&v7, sel_init);
  v5 = v4;
  if (v4)
    degas::Bitmap::setBit((degas::Bitmap *)&v4->_bitmap, a3);
  return v5;
}

- (KGElementIdentifierSet)initWithIndexSet:(id)a3
{
  id v4;
  KGElementIdentifierSet *v5;
  KGElementIdentifierSet *v6;
  _QWORD v8[4];
  KGElementIdentifierSet *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KGElementIdentifierSet;
  v5 = -[KGElementIdentifierSet init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__KGElementIdentifierSet_initWithIndexSet___block_invoke;
    v8[3] = &unk_1E83E4E48;
    v9 = v5;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v8);

  }
  return v6;
}

- (KGElementIdentifierSet)initWithIndexArray:(id)a3
{
  id v4;
  KGElementIdentifierSet *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KGElementIdentifierSet;
  v5 = -[KGElementIdentifierSet init](&v15, sel_init);
  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          degas::Bitmap::setBit((degas::Bitmap *)&v5->_bitmap, objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "unsignedLongLongValue", (_QWORD)v11));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }

  }
  return v5;
}

- (KGElementIdentifierSet)initWithIndexCollection:(id)a3
{
  id v4;
  KGElementIdentifierSet *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KGElementIdentifierSet;
  v5 = -[KGElementIdentifierSet init](&v15, sel_init);
  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          degas::Bitmap::setBit((degas::Bitmap *)&v5->_bitmap, objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "unsignedLongLongValue", (_QWORD)v11));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }

  }
  return v5;
}

- (KGElementIdentifierSet)initWithBitmap:(const void *)a3
{
  KGElementIdentifierSet *v4;
  KGElementIdentifierSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KGElementIdentifierSet;
  v4 = -[KGElementIdentifierSet init](&v7, sel_init);
  v5 = v4;
  if (v4)
    degas::Bitmap::operator=(&v4->_bitmap._bitCount, a3);
  return v5;
}

- (KGElementIdentifierSet)initWithLiteralData:(id)a3
{
  id v4;
  KGElementIdentifierSet *v5;
  _BYTE v7[16];
  uint64_t v8;
  void **v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    degas::Bitmap::Bitmap((degas::Bitmap *)v7, (const degas::LiteralBitmap *)objc_msgSend(objc_retainAutorelease(v4), "bytes"));
    v5 = -[KGElementIdentifierSet initWithBitmap:](self, "initWithBitmap:", v7);
    v9 = (void **)&v8;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v9);
  }
  else
  {
    v5 = -[KGElementIdentifierSet init](self, "init");
  }

  return v5;
}

- (const)bitmap
{
  return &self->_bitmap;
}

- (void)mutableBitmap
{
  return &self->_bitmap;
}

- (BOOL)containsIdentifier:(unint64_t)a3
{
  return degas::Bitmap::isSet((degas::Bitmap *)&self->_bitmap, a3);
}

- (BOOL)intersectsIdentifierSet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BitsetPtr *begin;
  BitsetPtr *end;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  BOOL v22;

  v4 = a3;
  v5 = objc_msgSend(v4, "bitmap");
  v6 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 24) - v6;
  if ((v7 >> 4))
  {
    begin = self->_bitmap._bitSets.__begin_;
    end = self->_bitmap._bitSets.__end_;
    if (begin != end)
    {
      v10 = 0;
      v11 = (v7 >> 4);
      while (1)
      {
        v12 = *(_QWORD *)(v6 + 16 * v10);
        v13 = *(_QWORD *)begin;
        v14 = *(_QWORD *)(*(_QWORD *)begin + 8);
        v15 = *(_QWORD *)(v12 + 8);
        if (v14 >= v15)
        {
          if (v14 <= v15)
          {
            if ((*(_DWORD *)(v12 + 16) & *(_DWORD *)(v13 + 16)) != 0)
            {
LABEL_19:
              v22 = 1;
              goto LABEL_18;
            }
            v16 = 0;
            v17 = v12 + 20;
            v18 = v13 + 20;
            while (v16 != 31)
            {
              v19 = v16 + 1;
              v20 = *(_DWORD *)(v18 + 4 * v16);
              v21 = *(_DWORD *)(v17 + 4 * v16++);
              if ((v21 & v20) != 0)
              {
                if ((unint64_t)(v19 - 1) < 0x1F)
                  goto LABEL_19;
                break;
              }
            }
            begin = (BitsetPtr *)((char *)begin + 16);
          }
          ++v10;
        }
        else
        {
          begin = (BitsetPtr *)((char *)begin + 16);
        }
        v22 = 0;
        if (begin == end || v10 >= v11)
          goto LABEL_18;
      }
    }
  }
  v22 = 0;
LABEL_18:

  return v22;
}

- (BOOL)isSubsetOfIdentifierSet:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "bitmap");
  LOBYTE(self) = degas::Bitmap::isSubsetOf<degas::Bitmap>((uint64_t)self->_bitmap._bitSets.__begin_, (uint64_t)self->_bitmap._bitSets.__end_, *(_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 24));

  return (char)self;
}

- (BOOL)containsIdentifierSet:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "bitmap");
  LOBYTE(self) = degas::Bitmap::isSubsetOf<degas::Bitmap>(*(_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 24), (uint64_t)self->_bitmap._bitSets.__begin_, (uint64_t)self->_bitmap._bitSets.__end_);

  return (char)self;
}

- (NSIndexSet)indexSet
{
  id v3;
  BOOL v4;
  unint64_t v6[3];

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  degas::Bitmap::begin(&self->_bitmap._bitCount, v6);
  while (1)
  {
    v4 = (Bitmap *)v6[0] == &self->_bitmap && v6[1] == -1;
    if (v4 && (BitsetPtr *)v6[2] == self->_bitmap._bitSets.__end_)
      break;
    objc_msgSend(v3, "addIndex:");
    degas::Bitmap::iterator::operator++(v6);
  }
  return (NSIndexSet *)v3;
}

- (NSArray)indexArray
{
  id v3;
  BOOL v4;
  void *v5;
  unint64_t v7[3];

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  degas::Bitmap::begin(&self->_bitmap._bitCount, v7);
  while (1)
  {
    v4 = (Bitmap *)v7[0] == &self->_bitmap && v7[1] == -1;
    if (v4 && (BitsetPtr *)v7[2] == self->_bitmap._bitSets.__end_)
      break;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

    degas::Bitmap::iterator::operator++(v7);
  }
  return (NSArray *)v3;
}

- (unint64_t)firstElement
{
  unint64_t result;

  result = degas::Bitmap::firstBit((degas::Bitmap *)&self->_bitmap);
  if (result == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (unint64_t)lastElement
{
  if (self->_bitmap._bitSets.__begin_ == self->_bitmap._bitSets.__end_)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return degas::Bitmap::lastBit((degas::Bitmap *)&self->_bitmap);
}

- (BOOL)isEmpty
{
  return self->_bitmap._bitSets.__begin_ == self->_bitmap._bitSets.__end_;
}

- (unint64_t)count
{
  return degas::Bitmap::count((degas::Bitmap *)&self->_bitmap);
}

- (unint64_t)elementAtOffset:(unint64_t)a3
{
  return degas::Bitmap::bitAtIndex((degas::Bitmap *)&self->_bitmap, a3);
}

- (unint64_t)randomElement
{
  uint32_t v3;

  v3 = degas::Bitmap::count((degas::Bitmap *)&self->_bitmap);
  if (-[KGElementIdentifierSet isEmpty](self, "isEmpty"))
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[KGElementIdentifierSet elementAtOffset:](self, "elementAtOffset:", arc4random_uniform(v3));
}

- (KGElementIdentifierSetIndex)indexWithIterator:(const void *)a3
{
  unint64_t v3;
  int64_t v4;
  KGElementIdentifierSetIndex result;

  v3 = *((_QWORD *)a3 + 1);
  v4 = (uint64_t)(*((_QWORD *)a3 + 2) - *(_QWORD *)(*(_QWORD *)a3 + 16)) >> 4;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (KGElementIdentifierSetIndex)startIndex
{
  unint64_t v3;
  int64_t v4;
  _QWORD v5[3];
  KGElementIdentifierSetIndex result;

  degas::Bitmap::begin(&self->_bitmap._bitCount, v5);
  v3 = -[KGElementIdentifierSet indexWithIterator:](self, "indexWithIterator:", v5);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (KGElementIdentifierSetIndex)endIndex
{
  BitsetPtr *end;
  unint64_t v3;
  int64_t v4;
  _QWORD v5[3];
  KGElementIdentifierSetIndex result;

  end = self->_bitmap._bitSets.__end_;
  v5[0] = &self->_bitmap;
  v5[1] = -1;
  v5[2] = end;
  v3 = -[KGElementIdentifierSet indexWithIterator:](self, "indexWithIterator:", v5);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (KGElementIdentifierSetIndex)indexAfterIndex:(KGElementIdentifierSetIndex)a3
{
  unint64_t v4;
  int64_t v5;
  unint64_t v6[3];
  KGElementIdentifierSetIndex result;

  v6[0] = (unint64_t)&self->_bitmap;
  v6[1] = a3.var0;
  v6[2] = (unint64_t)self->_bitmap._bitSets.__begin_ + 16 * a3.var1;
  degas::Bitmap::iterator::operator++(v6);
  v4 = -[KGElementIdentifierSet indexWithIterator:](self, "indexWithIterator:", v6);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (id)extractRangeByIndex:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  Bitmap *p_bitmap;
  unint64_t v7;
  KGElementIdentifierSet *v9;
  unint64_t v11;
  unint64_t v12;
  BitsetPtr *v13;
  __int128 v14;
  _BYTE v15[32];

  length = a3.length;
  location = a3.location;
  v14 = 0u;
  memset(v15, 0, 25);
  p_bitmap = &self->_bitmap;
  degas::Bitmap::begin(&self->_bitmap._bitCount, &v11);
  degas::Bitmap::iterator::seek(&v11, location);
  while (length)
  {
    v7 = v12;
    if ((Bitmap *)v11 == p_bitmap && v12 == -1)
    {
      if (v13 == self->_bitmap._bitSets.__end_)
        break;
      v7 = -1;
    }
    degas::Bitmap::setBit((degas::Bitmap *)&v14, v7);
    --length;
    degas::Bitmap::iterator::operator++(&v11);
  }
  v9 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v14);
  v11 = (unint64_t)v15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
  return v9;
}

- (id)prefix:(unint64_t)a3
{
  KGElementIdentifierSet *v3;
  __int128 v5;
  uint64_t v6;
  _BYTE v7[23];
  void **v8;

  *(_OWORD *)v7 = 0u;
  degas::Bitmap::getBatch((unint64_t *)-[KGElementIdentifierSet bitmap](self, "bitmap", 0, 0, 0, 0, 0, *(_QWORD *)&v7[15]), (degas::Bitmap *)&v5, a3);
  v3 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &v5);
  v8 = (void **)&v6;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v8);
  return v3;
}

- (id)identifierSetByAddingIdentifier:(unint64_t)a3
{
  KGElementIdentifierSet *v4;

  v4 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &self->_bitmap);
  degas::Bitmap::setBit((degas::Bitmap *)&v4->_bitmap, a3);
  return v4;
}

- (id)identifierSetByRemovingIdentifier:(unint64_t)a3
{
  KGElementIdentifierSet *v4;

  v4 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &self->_bitmap);
  degas::Bitmap::clearBit((degas::BitsetPtr **)&v4->_bitmap, a3);
  return v4;
}

- (id)identifierSetByFormingUnion:(id)a3
{
  id v4;
  KGElementIdentifierSet *v5;

  v4 = a3;
  v5 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &self->_bitmap);
  degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v5->_bitmap, (uint64_t)v4 + 8);

  return v5;
}

- (id)identifierSetByIntersectingIdentifierSet:(id)a3
{
  char *v4;
  KGElementIdentifierSet *v5;

  v4 = (char *)a3;
  v5 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &self->_bitmap);
  degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v5->_bitmap, (degas::Bitmap *)(v4 + 8));

  return v5;
}

- (id)identifierSetBySubtractingIdentifierSet:(id)a3
{
  char *v4;
  KGElementIdentifierSet *v5;

  v4 = (char *)a3;
  v5 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &self->_bitmap);
  degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v5->_bitmap, (degas::Bitmap *)(v4 + 8));

  return v5;
}

- (id)identifierSetByFormingSymmetricDifferenceWithIdentifierSet:(id)a3
{
  id v4;
  KGElementIdentifierSet *v5;

  v4 = a3;
  v5 = -[KGElementIdentifierSet initWithBitmap:]([KGElementIdentifierSet alloc], "initWithBitmap:", &self->_bitmap);
  degas::Bitmap::symmetricDiffWith<degas::Bitmap>((degas::Bitmap *)&v5->_bitmap, (uint64_t)v4 + 8);

  return v5;
}

- (id)identifierSetByFilteringUsingBlock:(id)a3
{
  id v4;
  id v5;
  KGElementIdentifierSet *v6;
  KGElementIdentifierSet *v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4447;
  v16 = __Block_byref_object_dispose__4448;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__KGElementIdentifierSet_identifierSetByFilteringUsingBlock___block_invoke;
  v9[3] = &unk_1E83E53B8;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v5 = v4;
  -[KGElementIdentifierSet enumerateIdentifiersWithBlock:](self, "enumerateIdentifiersWithBlock:", v9);
  v6 = (KGElementIdentifierSet *)v13[5];
  if (!v6)
    v6 = self;
  v7 = v6;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)enumerateIdentifiersWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  Bitmap *p_bitmap;
  BitsetPtr *end;
  BOOL v7;
  unint64_t v9[3];
  char v10;

  v4 = (void (**)(_QWORD))a3;
  v10 = 0;
  p_bitmap = &self->_bitmap;
  degas::Bitmap::begin(&self->_bitmap._bitCount, v9);
  end = self->_bitmap._bitSets.__end_;
  while (1)
  {
    v7 = (Bitmap *)v9[0] == p_bitmap && v9[1] == -1;
    if (v7 && v9[2] == (_QWORD)end)
      break;
    v4[2](v4);
    if (v10)
      break;
    degas::Bitmap::iterator::operator++(v9);
  }

}

- (BOOL)isEqualToElementIdentifierSet:(id)a3
{
  KGElementIdentifierSet *v4;
  KGElementIdentifierSet *v5;
  BOOL v6;

  v4 = (KGElementIdentifierSet *)a3;
  v5 = v4;
  v6 = v4 == self
    || degas::Bitmap::operator==((uint64_t)-[KGElementIdentifierSet bitmap](v4, "bitmap"), (uint64_t)&self->_bitmap);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  KGElementIdentifierSet *v4;
  BOOL v5;

  v4 = (KGElementIdentifierSet *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[KGElementIdentifierSet isEqualToElementIdentifierSet:](self, "isEqualToElementIdentifierSet:", v4);
  }

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;

  -[KGElementIdentifierSet indexArray](self, "indexArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mutableCopy
{
  return -[KGElementIdentifierSet initWithBitmap:]([KGMutableElementIdentifierSet alloc], "initWithBitmap:", &self->_bitmap);
}

- (id)literalDataRepresentation
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  degas::LiteralBitmap::makeLiteralBitmap((degas::LiteralBitmap *)&self->_bitmap, (const Bitmap *)a2);
  v3 = v2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v3, (144 * *(unsigned int *)(v3 + 4)) | 8);
  MEMORY[0x1CAA4ADC8](v3, 0x1000C4000313F17);
  return v4;
}

- (void).cxx_destruct
{
  vector<degas::BitsetPtr, std::allocator<degas::BitsetPtr>> *p_bitSets;

  p_bitSets = &self->_bitmap._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitSets);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 33) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

uint64_t __61__KGElementIdentifierSet_identifierSetByFilteringUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v5)
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    return objc_msgSend(v5, "removeIdentifier:", a2);
  }
  return result;
}

uint64_t __43__KGElementIdentifierSet_initWithIndexSet___block_invoke(uint64_t a1, unint64_t a2)
{
  return degas::Bitmap::setBit((degas::Bitmap *)(*(_QWORD *)(a1 + 32) + 8), a2);
}

+ (void)drainBitsetPool
{
  if (degas::getBitsetPool(void)::onceToken != -1)
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3736);
  degas::BitsetPool::purgeEmptyPages((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool);
}

@end
