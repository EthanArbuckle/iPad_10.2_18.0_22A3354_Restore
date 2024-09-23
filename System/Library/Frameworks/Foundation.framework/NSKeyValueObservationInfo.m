@implementation NSKeyValueObservationInfo

- (id)_copyByAddingObservance:(id)a3
{
  NSKeyValueObservationInfo *v5;
  NSUInteger v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t cachedHash;
  unsigned __int8 *v15;
  unint64_t i;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  NSUInteger v22;
  uint64_t v23;
  id *v24;
  NSUInteger v25;
  id v26;
  int v27;
  CFStringRef v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(NSKeyValueObservationInfo);
  v6 = -[NSArray count](self->_observances, "count");
  v7 = v6;
  if (a3)
  {
    v8 = *((_BYTE *)a3 + 40) & 0x20;
    v9 = 8;
    if ((*((_BYTE *)a3 + 40) & 0x20) == 0)
      v9 = 32;
    v10 = *(_QWORD *)((char *)a3 + v9);
  }
  else
  {
    v10 = 0;
    v8 = MEMORY[0x28] & 0x20;
  }
  v11 = *((_OWORD *)a3 + 1);
  if (v8)
    v12 = *((_QWORD *)a3 + 4);
  else
    v12 = 0;
  LODWORD(v13) = 0;
  cachedHash = self->_cachedHash;
  v31 = v10;
  v32 = v11;
  v33 = v12;
  v15 = (unsigned __int8 *)&v31 + 3;
  for (i = 36; i > 7; i -= 4)
  {
    v17 = *(v15 - 3) + 16 * v13;
    v18 = *(v15 - 2) + 16 * (v17 ^ (16 * (v17 >> 28)));
    v19 = *(v15 - 1) + 16 * (v18 ^ (16 * (v18 >> 28)));
    v20 = *v15;
    v15 += 4;
    v21 = v20 + 16 * (v19 ^ (16 * (v19 >> 28)));
    v13 = (v21 ^ ((v21 & 0xF0000000) >> 24)) & ~(v21 & 0xF0000000);
  }
  v5->_cachedHash = ((v13 << (v6 & 0x3F)) | (v13 >> (v6 & 0x3F))) ^ cachedHash;
  v22 = v6 + 1;
  if ((v6 + 1) >> 60)
  {
    v29 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6 + 1, v31, v32, v33, v34);
    v30 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v29, 0);
    CFRelease(v29);
    objc_exception_throw(v30);
  }
  v31 = 0;
  v23 = _CFCreateArrayStorage();
  -[NSArray getObjects:range:](self->_observances, "getObjects:range:", v23, 0, v7);
  *(_QWORD *)(v23 + 8 * v7) = a3;
  if (v7 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v24 = (id *)v23;
    v25 = v22;
    do
    {
      v26 = *v24++;
      --v25;
    }
    while (v25);
  }
  v5->_observances = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "_initByAdoptingBuffer:count:size:", v23, v22, v22);
  LOBYTE(v27) = self->_cachedIsShareable;
  if ((_BYTE)v27)
    v27 = (*((unsigned __int8 *)a3 + 40) >> 6) & 1;
  v5->_cachedIsShareable = v27;
  return v5;
}

- (id)_initWithObservances:(id *)a3 count:(unint64_t)a4 hashValue:(unint64_t)a5
{
  NSKeyValueObservationInfo *v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v16;
  unsigned __int8 *v17;
  unint64_t i;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  int v23;
  objc_super v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)NSKeyValueObservationInfo;
  v8 = -[NSKeyValueObservationInfo init](&v25, sel_init);
  if (!v8)
    return v8;
  v8->_observances = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", a3, a4);
  v8->_cachedHash = a5;
  v8->_cachedIsShareable = 1;
  if (!a5)
  {
    if (!a4)
      return v8;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = a3[v10];
      if (v11)
      {
        if ((v11[40] & 0x20) != 0)
          v12 = 8;
        else
          v12 = 32;
        v13 = *(_QWORD *)&v11[v12];
        if ((v11[40] & 0x20) != 0)
        {
LABEL_15:
          v14 = *((_QWORD *)v11 + 4);
          goto LABEL_18;
        }
      }
      else
      {
        v13 = 0;
        if ((MEMORY[0x28] & 0x20) != 0)
          goto LABEL_15;
      }
      v14 = 0;
LABEL_18:
      LODWORD(v15) = 0;
      v16 = *((_OWORD *)v11 + 1);
      v26 = v13;
      v27 = v16;
      v28 = v14;
      v17 = (unsigned __int8 *)&v26 + 3;
      for (i = 36; i > 7; i -= 4)
      {
        v19 = *(v17 - 3) + 16 * v15;
        v20 = *(v17 - 2) + 16 * (v19 ^ (16 * (v19 >> 28)));
        v21 = *(v17 - 1) + 16 * (v20 ^ (16 * (v20 >> 28)));
        v22 = *v17;
        v17 += 4;
        v23 = v22 + 16 * (v21 ^ (16 * (v21 >> 28)));
        v15 = (v23 ^ ((v23 & 0xF0000000) >> 24)) & ~(v23 & 0xF0000000);
      }
      v9 ^= (v15 << (v10 & 0x3F)) | (v15 >> (v10 & 0x3F));
      v8->_cachedHash = v9;
      if ((v11[40] & 0x40) == 0)
        v8->_cachedIsShareable = 0;
      if (++v10 == a4)
        return v8;
    }
  }
  for (; a4; --a4)
  {
    if ((*((_BYTE *)*a3 + 40) & 0x40) == 0)
      v8->_cachedIsShareable = 0;
    ++a3;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueObservationInfo;
  -[NSKeyValueObservationInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)containsOnlyInternalObservationHelpers
{
  NSArray *observances;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  observances = self->_observances;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](observances, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(observances);
        if ((*(char *)(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i) + 40) & 0x80000000) == 0)
          return 0;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](observances, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      if (v4)
        continue;
      break;
    }
  }
  return 1;
}

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (a3 == self)
    return 1;
  v5 = -[NSArray count](self->_observances, "count");
  v6 = objc_msgSend(*((id *)a3 + 1), "count");
  if (v6 != v5)
    return 0;
  v7 = 8 * v5;
  if (8 * v5 > 0x80)
  {
    v8 = malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
    -[NSArray getObjects:range:](self->_observances, "getObjects:range:", v8, 0, v5);
    v9 = malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
    objc_msgSend(*((id *)a3 + 1), "getObjects:range:", v9, 0, v5);
    if (!v5)
    {
      v10 = 1;
LABEL_16:
      free(v8);
      free(v9);
      return v10;
    }
    goto LABEL_9;
  }
  if (!v5)
  {
    -[NSArray getObjects:range:](self->_observances, "getObjects:range:", 0, 0, 0);
    objc_msgSend(*((id *)a3 + 1), "getObjects:range:", 0, 0, 0);
    return 1;
  }
  MEMORY[0x1E0C80A78](v6);
  v8 = (_QWORD *)((char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v8, 8 * v5);
  v11 = -[NSArray getObjects:range:](self->_observances, "getObjects:range:", v8, 0, v5);
  MEMORY[0x1E0C80A78](v11);
  v9 = v8;
  bzero(v8, 8 * v5);
  objc_msgSend(*((id *)a3 + 1), "getObjects:range:", v8, 0, v5);
LABEL_9:
  if (*v8 == *v9)
  {
    v12 = 1;
    do
    {
      v13 = v12;
      if (v5 == v12)
        break;
      v14 = v8[v12];
      v15 = v9[v12++];
    }
    while (v14 == v15);
    v10 = v13 >= v5;
  }
  else
  {
    v10 = 0;
  }
  if (v7 >= 0x81)
    goto LABEL_16;
  return v10;
}

- (id)description
{
  NSMutableString *v3;
  NSUInteger v4;
  uint64_t v5;
  size_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = +[NSString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %p> (\n"), objc_opt_class(), self);
  v4 = -[NSArray count](self->_observances, "count");
  v5 = v4;
  v6 = 8 * v4;
  if (8 * v4 <= 0x80)
  {
    if (!v4)
    {
      _NSKeyValueObservationInfoGetObservances((uint64_t)self, 0, 0);
      -[NSMutableString appendString:](v3, "appendString:", CFSTR(")"));
      return v3;
    }
    MEMORY[0x1E0C80A78](v4);
    v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v7, v6);
    _NSKeyValueObservationInfoGetObservances((uint64_t)self, (uint64_t)v7, v5);
  }
  else
  {
    v7 = (char *)malloc_type_malloc(8 * v4, 0x80040B8603338uLL);
    _NSKeyValueObservationInfoGetObservances((uint64_t)self, (uint64_t)v7, v5);
    if (!v5)
    {
      -[NSMutableString appendString:](v3, "appendString:", CFSTR(")"));
LABEL_9:
      free(v7);
      return v3;
    }
  }
  v8 = 0;
  do
  {
    -[NSMutableString appendString:](v3, "appendString:", objc_msgSend(*(id *)&v7[8 * v8], "description"));
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n"));
    ++v8;
  }
  while (v5 != v8);
  -[NSMutableString appendString:](v3, "appendString:", CFSTR(")"));
  if (v6 > 0x80)
    goto LABEL_9;
  return v3;
}

@end
