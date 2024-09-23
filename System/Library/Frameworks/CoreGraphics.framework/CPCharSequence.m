@implementation CPCharSequence

- (CPCharSequence)initWithSizeFor:(unsigned int)a3
{
  CPCharSequence *v4;
  CPCharSequence *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPCharSequence;
  v4 = -[CPCharSequence init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v4->charArray = (CPPDFChar **)malloc_type_malloc(8 * a3, 0x2004093837F09uLL);
    v5->previousSize = a3;
    v5->size = a3;
  }
  return v5;
}

- (CPCharSequence)initWithChars:(CPPDFChar *)a3 length:(unsigned int)a4
{
  CPCharSequence *result;
  CPPDFChar *v7;
  CPPDFChar **charArray;

  result = -[CPCharSequence initWithSizeFor:](self, "initWithSizeFor:", *(_QWORD *)&a4);
  if (result)
  {
    if (a4)
    {
      v7 = &a3[a4];
      charArray = result->charArray;
      do
        *charArray++ = a3++;
      while (a3 < v7);
    }
    result->length = a4;
  }
  return result;
}

- (id)initSuper
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPCharSequence;
  return -[CPCharSequence init](&v3, sel_init);
}

- (void)dispose
{
  CPPDFChar **charArray;

  charArray = self->charArray;
  if (charArray)
  {
    if (!self->sharedMemory)
      free(charArray);
    self->charArray = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPCharSequence dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPCharSequence;
  -[CPCharSequence finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  CPMemoryOwner *sharedMemory;
  objc_super v4;

  sharedMemory = self->sharedMemory;
  if (sharedMemory)

  else
    -[CPCharSequence dispose](self, "dispose");
  v4.receiver = self;
  v4.super_class = (Class)CPCharSequence;
  -[CPCharSequence dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  CPMemoryOwner *v5;

  v4 = CPCopyObject(self, a3);
  if (v4)
  {
    if (!self->sharedMemory)
    {
      v5 = -[CPMemoryOwner initWithAllocatedMemory:]([CPMemoryOwner alloc], "initWithAllocatedMemory:", self->charArray);
      *(_QWORD *)&self->previousSize = 0;
      self->sharedMemory = v5;
    }
    *(_DWORD *)(v4 + 8) = self->length;
    *(_QWORD *)(v4 + 16) = self->charArray;
    *(_DWORD *)(v4 + 28) = self->size;
    *(_DWORD *)(v4 + 24) = self->previousSize;
    *(_QWORD *)(v4 + 32) = self->sharedMemory;
    *(_BYTE *)(v4 + 40) = self->wasMerged;
  }
  return (id)v4;
}

- (void)resize:(unsigned int)a3
{
  unsigned int length;
  CPMemoryOwner *sharedMemory;
  CPPDFChar **v6;
  CPPDFChar **v7;
  unsigned int size;
  unsigned int v9;
  unsigned int v10;
  CPPDFChar **v11;

  if (self->length <= a3)
    length = a3;
  else
    length = self->length;
  sharedMemory = self->sharedMemory;
  if (sharedMemory)
  {
    if (length)
    {
      v6 = (CPPDFChar **)malloc_type_malloc(8 * length, 0x2004093837F09uLL);
      v7 = v6;
      if (v6)
        memcpy(v6, self->charArray, 8 * self->length);
      self->charArray = v7;
      sharedMemory = self->sharedMemory;
    }
    else
    {
      self->charArray = 0;
    }
    self->previousSize = length;
    self->size = length;

    self->sharedMemory = 0;
  }
  else
  {
    size = self->size;
    if (length > size)
    {
      if (size)
      {
        v9 = self->previousSize + size;
        if (length <= v9)
          v10 = v9;
        else
          v10 = length;
        v11 = (CPPDFChar **)malloc_type_realloc(self->charArray, 8 * v10, 0x2004093837F09uLL);
        if (v11)
        {
          self->charArray = v11;
          self->previousSize = self->size;
          self->size = v10;
        }
        else
        {
          self->charArray = 0;
          self->size = 0;
          self->length = 0;
        }
      }
      else
      {
        self->charArray = (CPPDFChar **)malloc_type_malloc(8 * length, 0x2004093837F09uLL);
        self->previousSize = length;
        self->size = length;
      }
    }
  }
}

- (unsigned)length
{
  return self->length;
}

- (CPPDFChar)charAtIndex:(unsigned int)a3
{
  CPPDFChar **charArray;

  if (self->length <= a3)
    __assert_rtn("-[CPCharSequence charAtIndex:]", "CPCharSequence.m", 275, "index < length");
  charArray = self->charArray;
  if (charArray)
    return charArray[a3];
  else
    return 0;
}

- (CPPDFChar)charArray
{
  return self->charArray;
}

- (void)addChar:(CPPDFChar *)a3
{
  unsigned int length;
  CPPDFChar **charArray;
  uint64_t v7;

  length = self->length;
  if (length >= self->size)
    -[CPCharSequence resize:](self, "resize:", length + 1);
  charArray = self->charArray;
  if (charArray)
  {
    v7 = self->length;
    charArray[v7] = a3;
    self->length = v7 + 1;
  }
}

- (void)addChars:(CPPDFChar *)a3 length:(unsigned int)a4
{
  unsigned int v7;
  CPPDFChar **charArray;
  CPPDFChar *v9;
  CPPDFChar **v10;

  v7 = self->length + a4;
  -[CPCharSequence resize:](self, "resize:", v7);
  charArray = self->charArray;
  if (charArray)
  {
    if (a4)
    {
      v9 = &a3[a4];
      v10 = &charArray[self->length];
      do
        *v10++ = a3++;
      while (a3 < v9);
    }
    self->length = v7;
  }
}

- (void)addChars:(CPPDFChar *)a3 length:(unsigned int)a4 ifTrue:(void *)a5 passing:(void *)a6
{
  CPPDFChar *v8;
  uint64_t v10;
  CPPDFChar *v11;
  CPPDFChar **v12;
  unsigned int v13;
  CPPDFChar **charArray;

  if (a4)
  {
    v8 = a3;
    v10 = 0;
    v11 = &a3[a4];
    v12 = &self->charArray[self->length];
    do
    {
      if (((unsigned int (*)(CPPDFChar *, void *))a5)(v8, a6))
      {
        v13 = self->length + 1;
        self->length = v13;
        if (v13 > self->size)
        {
          -[CPCharSequence resize:](self, "resize:");
          charArray = self->charArray;
          if (!charArray)
            return;
          v12 = &charArray[v10];
        }
        *v12++ = v8;
        ++v10;
      }
      ++v8;
    }
    while (v8 < v11);
  }
}

- (void)addCharsFromSequence:(id)a3
{
  uint64_t v3;
  unsigned int v6;
  CPPDFChar **charArray;

  v3 = *((unsigned int *)a3 + 2);
  if ((_DWORD)v3)
  {
    v6 = self->length + v3;
    -[CPCharSequence resize:](self, "resize:", v6);
    charArray = self->charArray;
    if (charArray)
    {
      memcpy(&charArray[self->length], *((const void **)a3 + 2), 8 * v3);
      self->length = v6;
    }
  }
}

- (void)removeChar
{
  unsigned int length;

  length = self->length;
  if (!length)
    __assert_rtn("-[CPCharSequence removeChar]", "CPCharSequence.m", 346, "length > 0");
  self->length = length - 1;
}

- (void)removeAllChars
{
  CPMemoryOwner *sharedMemory;

  self->length = 0;
  sharedMemory = self->sharedMemory;
  if (sharedMemory)
  {

    self->sharedMemory = 0;
  }
  else
  {
    free(self->charArray);
    *(_QWORD *)&self->previousSize = 0;
  }
  self->charArray = 0;
}

- (void)replaceCharAtIndex:(unsigned int)a3 withChar:(CPPDFChar *)a4
{
  CPPDFChar **charArray;

  if (self->length <= a3)
    __assert_rtn("-[CPCharSequence replaceCharAtIndex:withChar:]", "CPCharSequence.m", 369, "index < length");
  if (self->sharedMemory)
    -[CPCharSequence resize:](self, "resize:");
  charArray = self->charArray;
  if (charArray)
    charArray[a3] = a4;
}

- (void)removeCharAtIndex:(unsigned int)a3
{
  unsigned int length;
  CPPDFChar **v6;

  length = self->length;
  if (length <= a3)
    __assert_rtn("-[CPCharSequence removeCharAtIndex:]", "CPCharSequence.m", 382, "index < length");
  if (a3 + 1 < length)
  {
    if (self->sharedMemory)
    {
      -[CPCharSequence resize:](self, "resize:");
      length = self->length;
    }
    v6 = &self->charArray[a3];
    memmove(v6, v6 + 1, 8 * (length + ~a3));
    length = self->length;
  }
  self->length = length - 1;
}

- (void)removeFrom:(unsigned int)a3
{
  if (self->length <= a3)
    __assert_rtn("-[CPCharSequence removeFrom:]", "CPCharSequence.m", 399, "length > startIndex");
  if (a3)
    self->length = a3;
  else
    -[CPCharSequence removeAllChars](self, "removeAllChars");
}

- (void)sortByAnchorYDecreasingXIncreasing
{
  -[CPCharSequence sortBy:](self, "sortBy:", compareAnchorYDecreasingXIncreasing);
}

- (void)sortByAnchorYDecreasingXIncreasingApprox
{
  -[CPCharSequence sortBy:](self, "sortBy:", compareAnchorYDecreasingXIncreasingApprox);
}

- (void)sortByAnchorXIncreasingYDecreasing
{
  -[CPCharSequence sortBy:](self, "sortBy:", compareAnchorXIncreasingYDecreasing);
}

- (void)sortBy:(void *)a3
{
  if (self->sharedMemory)
    -[CPCharSequence resize:](self, "resize:", self->length);
  qsort(self->charArray, self->length, 8uLL, (int (__cdecl *)(const void *, const void *))a3);
}

- (void)mergeByAnchorYDecreasingXIncreasing:(id)a3
{
  -[CPCharSequence merge:by:](self, "merge:by:", a3, compareAnchorYDecreasingXIncreasing);
}

- (void)mergeByAnchorXIncreasingYDecreasing:(id)a3
{
  -[CPCharSequence merge:by:](self, "merge:by:", a3, compareAnchorXIncreasingYDecreasing);
}

- (void)merge:(id)a3 by:(void *)a4
{
  uint64_t v4;
  unsigned int v8;
  CPPDFChar **charArray;
  char *v10;
  uint64_t length;
  char *v12;
  CPPDFChar **v13;
  CPPDFChar **v14;
  int v15;
  CPPDFChar **v16;

  v4 = *((unsigned int *)a3 + 2);
  if ((_DWORD)v4)
  {
    v8 = self->length + v4;
    -[CPCharSequence resize:](self, "resize:", v8);
    charArray = self->charArray;
    if (charArray)
    {
      v10 = (char *)*((_QWORD *)a3 + 2);
      if (v10)
      {
        length = self->length;
        v12 = &v10[8 * v4];
        if (!(_DWORD)length)
          goto LABEL_17;
        v13 = &charArray[length];
        v14 = &charArray[v8 - 1];
        do
        {
          v15 = ((uint64_t (*)(CPPDFChar **, char *))a4)(v13 - 1, v12 - 8);
          if (v15 <= 0)
            v16 = (CPPDFChar **)v12;
          else
            v16 = v13;
          if (v15 <= 0)
            v12 -= 8;
          else
            --v13;
          *v14-- = *(v16 - 1);
          charArray = self->charArray;
        }
        while (v13 > charArray && v12 > v10);
        if (v12 > v10)
LABEL_17:
          memcpy(charArray, v10, (v12 - v10) & 0x7FFFFFFF8);
        self->length = v8;
        self->wasMerged = 1;
      }
    }
  }
}

- (BOOL)wasMerged
{
  return self->wasMerged;
}

- (id)newSubsequenceFrom:(unsigned int)a3 length:(unsigned int)a4
{
  CPCharSequence *v7;
  CPCharSequence *v8;
  CPMemoryOwner *v9;

  if (a4 + a3 > self->length)
    __assert_rtn("-[CPCharSequence newSubsequenceFrom:length:]", "CPCharSequence.m", 493, "startIndex + newLength <= length");
  v7 = -[CPCharSequence initWithSizeFor:]([CPCharSequence alloc], "initWithSizeFor:", 0);
  v8 = v7;
  if (a4 && v7)
  {
    if (!self->sharedMemory)
    {
      v9 = -[CPMemoryOwner initWithAllocatedMemory:]([CPMemoryOwner alloc], "initWithAllocatedMemory:", self->charArray);
      *(_QWORD *)&self->previousSize = 0;
      self->sharedMemory = v9;
    }
    v8->length = a4;
    v8->charArray = &self->charArray[a3];
    v8->sharedMemory = self->sharedMemory;
    v8->wasMerged = self->wasMerged;
  }
  return v8;
}

- (void)splitToSubsequences:(id)a3 whereTrue:(void *)a4 passing:(void *)a5
{
  unsigned int length;
  uint64_t v8;
  uint64_t v11;
  CPPDFChar **charArray;
  int v13;
  id v14;
  unsigned int v15;
  id v16;

  length = self->length;
  if (length)
  {
    if (length == 1)
    {
      v8 = 0;
    }
    else
    {
      v11 = 0;
      v8 = 0;
      charArray = self->charArray;
      do
      {
        v13 = v11 + 1;
        if (((unsigned int (*)(CPPDFChar *, CPPDFChar *, void *))a4)(charArray[v11], charArray[v11 + 1], a5))
        {
          v14 = -[CPCharSequence newSubsequenceFrom:length:](self, "newSubsequenceFrom:length:", v8, (v11 - v8 + 1));
          objc_msgSend(a3, "addObject:", v14);

          v8 = v11 + 1;
        }
        v15 = v11++ + 2;
      }
      while (v15 < self->length);
      length = v13 + 1;
    }
    v16 = -[CPCharSequence newSubsequenceFrom:length:](self, "newSubsequenceFrom:length:", v8, length - v8, a5);
    objc_msgSend(a3, "addObject:", v16);

  }
}

- (BOOL)removeSubsequences:(id)a3 whereTrue:(void *)a4 passing:(void *)a5
{
  BOOL result;
  unsigned int length;
  uint64_t v11;
  char v12;
  CPPDFChar **charArray;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  id v18;

  result = 0;
  length = self->length;
  if (length)
  {
    if (length != 1)
    {
      v11 = 0;
      v12 = 0;
      charArray = self->charArray;
      v14 = 1;
      do
      {
        ++charArray;
        while (1)
        {
          v15 = v14;
          v16 = ((uint64_t (*)(_QWORD, CPPDFChar *, void *))a4)(*(charArray - 1), *charArray, a5);
          if (!v16 || (v12 & 1) == 0)
            break;
          v17 = -[CPCharSequence newSubsequenceFrom:length:](self, "newSubsequenceFrom:length:", v11, (v15 - v11));
          objc_msgSend(a3, "addObject:", v17);

          v14 = (v15 + 1);
          ++charArray;
          v12 = 1;
          v11 = v15;
          if (v14 >= self->length)
          {
            v11 = v15;
            goto LABEL_17;
          }
        }
        if (v16)
          length = v15;
        v12 |= v16;
        if (v16)
          v11 = v15;
        else
          v11 = v11;
        v14 = (v15 + 1);
      }
      while (v14 < self->length);
      if ((v12 & 1) == 0)
      {
        result = 0;
        goto LABEL_18;
      }
LABEL_17:
      v18 = -[CPCharSequence newSubsequenceFrom:length:](self, "newSubsequenceFrom:length:", v11, (v14 - v11));
      objc_msgSend(a3, "addObject:", v18);

      result = 1;
    }
LABEL_18:
    self->length = length;
  }
  return result;
}

- (void)copyToSubsequence:(id)a3 from:(unsigned int)a4 length:(unsigned int)a5
{
  unsigned int v9;
  uint64_t v10;

  if (a5 + a4 > self->length)
    __assert_rtn("-[CPCharSequence copyToSubsequence:from:length:]", "CPCharSequence.m", 578, "startIndex + numChars <= length");
  if (a5 && self->charArray)
  {
    v9 = *((_DWORD *)a3 + 2) + a5;
    objc_msgSend(a3, "resize:", v9);
    v10 = *((_QWORD *)a3 + 2);
    if (v10)
    {
      memcpy((void *)(v10 + 8 * *((unsigned int *)a3 + 2)), &self->charArray[a4], 8 * a5);
      *((_DWORD *)a3 + 2) = v9;
    }
  }
}

- (void)copyToSubsequence:(id)a3 ifTrue:(void *)a4 passing:(void *)a5
{
  uint64_t length;
  CPPDFChar **charArray;
  CPPDFChar **v10;
  unsigned int v11;
  uint64_t v12;

  length = self->length;
  if ((_DWORD)length)
  {
    charArray = self->charArray;
    v10 = &charArray[length];
    do
    {
      if (((unsigned int (*)(CPPDFChar *, void *))a4)(*charArray, a5))
      {
        v11 = *((_DWORD *)a3 + 2);
        if (v11 >= *((_DWORD *)a3 + 7))
        {
          objc_msgSend(a3, "resize:", v11 + 1);
          v12 = *((_QWORD *)a3 + 2);
          if (!v12)
            return;
          v11 = *((_DWORD *)a3 + 2);
        }
        else
        {
          v12 = *((_QWORD *)a3 + 2);
        }
        *(_QWORD *)(v12 + 8 * v11) = *charArray;
        *((_DWORD *)a3 + 2) = v11 + 1;
      }
      ++charArray;
    }
    while (charArray < v10);
  }
}

- (BOOL)removeToSubsequence:(id)a3 ifTrue:(void *)a4 passing:(void *)a5
{
  uint64_t v9;
  unsigned int v10;
  CPPDFChar *v11;
  unsigned int v12;
  uint64_t v13;

  if (!self->charArray)
    return 0;
  if (self->length)
  {
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = self->charArray[v9];
      if (((unsigned int (*)(CPPDFChar *, void *))a4)(v11, a5))
      {
        v12 = *((_DWORD *)a3 + 2);
        if (v12 >= *((_DWORD *)a3 + 7))
        {
          objc_msgSend(a3, "resize:", v12 + 1);
          v13 = *((_QWORD *)a3 + 2);
          if (!v13)
            goto LABEL_17;
          v12 = *((_DWORD *)a3 + 2);
        }
        else
        {
          v13 = *((_QWORD *)a3 + 2);
        }
        *(_QWORD *)(v13 + 8 * v12) = v11;
        *((_DWORD *)a3 + 2) = v12 + 1;
        if (self->sharedMemory)
        {
          if (v9 + 1 < (unint64_t)self->length)
          {
            -[CPCharSequence resize:](self, "resize:");
            if (!self->charArray)
              goto LABEL_17;
          }
        }
      }
      else
      {
        self->charArray[v10++] = v11;
      }
      if (++v9 >= (unint64_t)self->length)
        goto LABEL_17;
    }
  }
  v10 = 0;
  LODWORD(v9) = 0;
LABEL_17:
  self->length = v10;
  return v10 < v9;
}

- (BOOL)map:(void *)a3 passing:(void *)a4
{
  uint64_t length;
  CPPDFChar **charArray;
  CPPDFChar **v8;
  CPPDFChar **v9;
  int v10;
  BOOL v11;

  length = self->length;
  if ((_DWORD)length)
  {
    charArray = self->charArray;
    v8 = &charArray[length];
    v9 = charArray + 1;
    do
    {
      v10 = ((uint64_t (*)(_QWORD, void *))a3)(*(v9 - 1), a4);
      if (v10)
        v11 = v9 >= v8;
      else
        v11 = 1;
      ++v9;
    }
    while (!v11);
  }
  else
  {
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)mapWithIndex:(void *)a3 passing:(void *)a4
{
  uint64_t v7;
  CPPDFChar **charArray;
  int v9;

  if (self->length)
  {
    v7 = 0;
    charArray = self->charArray;
    do
    {
      v9 = ((uint64_t (*)(uint64_t, CPPDFChar *, void *))a3)(v7, charArray[v7], a4);
      if (!v9)
        break;
      ++v7;
    }
    while (v7 < self->length);
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)mapWithIndex:(void *)a3 from:(unsigned int)a4 length:(unsigned int)a5 passing:(void *)a6
{
  unsigned int v6;
  uint64_t v7;
  CPPDFChar **charArray;
  int v12;
  CPPDFChar **v13;
  unsigned int v14;
  uint64_t v15;

  v6 = a5 + a4;
  if (a5 + a4 > self->length)
    __assert_rtn("-[CPCharSequence mapWithIndex:from:length:passing:]", "CPCharSequence.m", 673, "pastEndIndex <= length");
  LODWORD(v7) = a4;
  if (v6 <= a4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    charArray = self->charArray;
    v12 = ((uint64_t (*)(_QWORD, CPPDFChar *, void *))a3)(*(_QWORD *)&a4, charArray[a4], a6);
    if (v12)
    {
      v13 = &charArray[v7 + 1];
      v14 = a5 - 1;
      while (v14)
      {
        v7 = (v7 + 1);
        v15 = (uint64_t)*v13++;
        --v14;
        if (!((unsigned int (*)(uint64_t, uint64_t, void *))a3)(v7, v15, a6))
          goto LABEL_10;
      }
      LODWORD(v7) = v6;
LABEL_10:
      LOBYTE(v12) = v7 >= v6;
    }
  }
  return v12;
}

- (BOOL)mapToPairs:(void *)a3 passing:(void *)a4
{
  uint64_t length;
  int v5;
  CPPDFChar **charArray;
  CPPDFChar **v9;
  CPPDFChar **v10;
  BOOL v11;

  length = self->length;
  if (length >= 2)
  {
    charArray = self->charArray;
    v9 = &charArray[length];
    v10 = charArray + 2;
    do
    {
      v5 = ((uint64_t (*)(_QWORD, _QWORD, void *))a3)(*(v10 - 2), *(v10 - 1), a4);
      if (v5)
        v11 = v10 >= v9;
      else
        v11 = 1;
      ++v10;
    }
    while (!v11);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)mapToPairsWithIndex:(void *)a3 passing:(void *)a4
{
  uint64_t length;
  int v5;
  uint64_t v8;
  CPPDFChar **charArray;
  CPPDFChar **v10;
  CPPDFChar **v11;
  BOOL v12;

  length = self->length;
  if (length >= 2)
  {
    v8 = 0;
    charArray = self->charArray;
    v10 = &charArray[length];
    v11 = charArray + 2;
    do
    {
      v5 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD, void *))a3)(v8, *(v11 - 2), *(v11 - 1), a4);
      v8 = (v8 + 1);
      if (v5)
        v12 = v11 >= v10;
      else
        v12 = 1;
      ++v11;
    }
    while (!v12);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)map:(void *)a3 whereNeighborsWith:(id)a4 passing:(void *)a5
{
  unint64_t v5;
  unint64_t length;
  BOOL v7;
  uint64_t *charArray;
  uint64_t *v11;
  int v12;
  int v13;
  uint64_t *v14;
  uint64_t *v15;
  int v17;
  uint64_t *v18;
  uint64_t *v19;
  int v20;

  v5 = *((unsigned int *)a4 + 2);
  length = self->length;
  if ((_DWORD)length)
    v7 = (_DWORD)v5 == 0;
  else
    v7 = 1;
  if (v7)
    goto LABEL_24;
  charArray = (uint64_t *)self->charArray;
  v11 = (uint64_t *)*((_QWORD *)a4 + 2);
  v12 = compareAnchorXIncreasingYDecreasing(charArray, v11);
  v13 = v12;
  v14 = &charArray[v12 < 1];
  v15 = &v11[v12 > 0];
  if ((v12 < 1) < length && (v12 > 0) < v5)
  {
    v18 = &charArray[length];
    v19 = &v11[v5];
    while (1)
    {
      v17 = compareAnchorXIncreasingYDecreasing(v14, v15);
      if (v17 < 1)
      {
        if (v13 >= 1)
        {
          v20 = ((uint64_t (*)(uint64_t, _QWORD, void *))a3)(*v14, *(v15 - 1), a5);
          if (!v20)
            return v20;
        }
        ++v14;
      }
      else
      {
        if (v13 <= 0)
        {
          v20 = ((uint64_t (*)(_QWORD, uint64_t, void *))a3)(*(v14 - 1), *v15, a5);
          if (!v20)
            return v20;
        }
        ++v15;
      }
      if (v14 < v18)
      {
        v13 = v17;
        if (v15 < v19)
          continue;
      }
      goto LABEL_20;
    }
  }
  v17 = v12;
LABEL_20:
  if (v17 > 0)
  {
    v20 = ((uint64_t (*)(uint64_t, _QWORD, void *))a3)(*v14, *(v15 - 1), a5);
    if (!v20)
      return v20;
LABEL_24:
    LOBYTE(v20) = 1;
    return v20;
  }
  if ((((uint64_t (*)(_QWORD, uint64_t, void *))a3)(*(v14 - 1), *v15, a5) & 1) != 0)
    goto LABEL_24;
  LOBYTE(v20) = 0;
  return v20;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CPCharSequence boundsFrom:length:](self, "boundsFrom:length:", 0, self->length);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)boundsFrom:(unsigned int)a3 length:(unsigned int)a4
{
  float64x2_t **v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t **v7;
  float64x2_t **v8;
  float64x2_t *v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  double v13;
  CGRect result;

  if (a4 + a3 > self->length)
    __assert_rtn("-[CPCharSequence boundsFrom:length:]", "CPCharSequence.m", 776, "startIndex + numChars <= length");
  if (a4)
  {
    v4 = (float64x2_t **)&self->charArray[a3];
    v5 = **v4;
    v6 = vaddq_f64(v5, (*v4)[1]);
    if (a4 != 1)
    {
      v7 = &v4[a4];
      v8 = v4 + 1;
      do
      {
        v9 = *v8++;
        v10 = vaddq_f64(*v9, v9[1]);
        v5 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v5, *v9), *(int8x16_t *)v9, (int8x16_t)v5);
        v6 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v10, v6), (int8x16_t)v10, (int8x16_t)v6);
      }
      while (v8 < v7);
    }
    v11 = vsubq_f64(v6, v5);
  }
  else
  {
    v5 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    v11 = 0uLL;
  }
  v12 = v5.f64[1];
  v13 = v11.f64[1];
  result.size.width = v11.f64[0];
  result.origin.x = v5.f64[0];
  result.size.height = v13;
  result.origin.y = v12;
  return result;
}

- (CGRect)normalizedBounds
{
  uint64_t v3;
  CGFloat width;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;
  CGRect result;
  CGRect v15;

  if (self->length)
  {
    v3 = 0;
    width = 0.0;
    x = INFINITY;
    y = INFINITY;
    height = 0.0;
    do
    {
      v15 = (CGRect)-[CPCharSequence charAtIndex:](self, "charAtIndex:", v3)[112];
      v12.origin.x = x;
      v12.origin.y = y;
      v12.size.width = width;
      v12.size.height = height;
      v13 = CGRectUnion(v12, v15);
      x = v13.origin.x;
      y = v13.origin.y;
      width = v13.size.width;
      height = v13.size.height;
      v3 = (v3 + 1);
    }
    while (v3 < self->length);
  }
  else
  {
    height = 0.0;
    y = INFINITY;
    width = 0.0;
    x = INFINITY;
  }
  v8 = x;
  v9 = y;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (double)averageRotation
{
  int v3;
  uint64_t v4;
  double v5;
  double v6;
  __double2 v7;

  v3 = -[CPCharSequence length](self, "length");
  if (v3 < 1)
  {
    v6 = 0.0;
    v5 = 0.0;
  }
  else
  {
    v4 = 0;
    v5 = 0.0;
    v6 = 0.0;
    do
    {
      v7 = __sincos_stret((double)-[CPCharSequence charAtIndex:](self, "charAtIndex:", v4)[168] * 0.0174532925);
      v6 = v6 + v7.__cosval;
      v5 = v5 + v7.__sinval;
      v4 = (v4 + 1);
    }
    while (v3 != (_DWORD)v4);
  }
  return atan2(v5 / (double)v3, v6 / (double)v3);
}

@end
