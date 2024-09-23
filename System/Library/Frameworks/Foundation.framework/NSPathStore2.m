@implementation NSPathStore2

- (unint64_t)hash
{
  return CFStringHashCharacters();
}

- (BOOL)isEqualToString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int16 *v7;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned __int16 *v12;
  unsigned __int16 *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  BOOL v28;
  BOOL v29;
  uint64_t v30;
  BOOL v31;
  _BOOL8 v32;
  _BYTE v33[2080];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self == a3)
    return 1;
  if (!a3)
    return 0;
  v4 = (uint64_t)self;
  if (object_getClass(a3) == (Class)NSPathStore2)
  {
    v9 = *(_DWORD *)(v4 + 8) >> 20;
    v10 = *((_DWORD *)a3 + 2) >> 20;
    if (v9 >= v10)
      v11 = v10;
    else
      v11 = v9;
    if ((_DWORD)v11)
    {
      v12 = (unsigned __int16 *)(v4 + 12);
      v13 = (unsigned __int16 *)((char *)a3 + 12);
      while (1)
      {
        v15 = *v12++;
        v14 = v15;
        v16 = *v13++;
        v17 = v14 >= v16;
        v18 = v14 == v16;
        v19 = v14 > v16 ? 1 : v4;
        v4 = v17 ? v19 : -1;
        if (!v18)
          break;
        if (!--v11)
          goto LABEL_22;
      }
    }
    else
    {
LABEL_22:
      v17 = v9 >= v10;
      v20 = v9 > v10;
      if (v17)
        v4 = v20;
      else
        v4 = -1;
    }
  }
  else
  {
    v5 = objc_msgSend(a3, "length");
    v6 = v5;
    if (v5 >= 1041)
      v7 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    else
      v7 = (unsigned __int16 *)v33;
    objc_msgSend(a3, "getCharacters:range:", v7, 0, v6);
    v21 = (unint64_t)*(unsigned int *)(v4 + 8) >> 20;
    if (v21 >= v6)
      v22 = v6;
    else
      v22 = (unint64_t)*(unsigned int *)(v4 + 8) >> 20;
    if (v22)
    {
      v23 = (unsigned __int16 *)(v4 + 12);
      v24 = v7;
      while (1)
      {
        v26 = *v23++;
        v25 = v26;
        v27 = *v24++;
        v28 = v25 >= v27;
        v29 = v25 == v27;
        v30 = v25 > v27 ? 1 : v4;
        v4 = v28 ? v30 : -1;
        if (!v29)
          break;
        if (!--v22)
          goto LABEL_40;
      }
    }
    else
    {
LABEL_40:
      v31 = v6 > v21;
      v32 = v6 < v21;
      if (v31)
        v4 = -1;
      else
        v4 = v32;
    }
    if (v7 != (unsigned __int16 *)v33)
      free(v7);
  }
  return v4 == 0;
}

- (id)lastPathComponent
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char *v5;
  unint64_t v6;
  int v7;

  v2 = *((unsigned int *)self + 2);
  if (v2 >= 0x200000)
  {
    v3 = 0;
    v4 = v2 >> 20;
    v5 = (char *)self + 2 * v4 + 12;
    v6 = v4 - 1;
    while (v6 != v3)
    {
      v7 = *((unsigned __int16 *)v5 - 2);
      v5 -= 2;
      ++v3;
      if (v7 == 47)
        return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v5, v3);
    }
  }
  return self;
}

- (id)stringByDeletingLastPathComponent
{
  unsigned __int16 *characters;
  unint64_t lengthAndRefCount;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;

  characters = self->_characters;
  lengthAndRefCount = self->_lengthAndRefCount;
  v4 = lengthAndRefCount >> 20;
  if (self->_lengthAndRefCount >> 20 == 1)
  {
    v5 = *characters == 47;
  }
  else
  {
    if (lengthAndRefCount >= 0x100000)
    {
      while (1)
      {
        v6 = v4 - 1;
        if (v4 == 1)
          break;
        v7 = *((unsigned __int16 *)&self->_lengthAndRefCount + v4--);
        if (v7 == 47)
        {
          if (v6 == 1)
            v5 = 1;
          else
            v5 = v6 - 1;
          return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", characters, v5);
        }
      }
    }
    v5 = 0;
  }
  return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", characters, v5);
}

- (id)pathComponents
{
  return _NSPathComponents(self->_characters, (unint64_t)self->_lengthAndRefCount >> 20);
}

- (id)stringByResolvingSymlinksInPath
{
  return -[NSPathStore2 _stringByResolvingSymlinksInPathUsingCache:](self, "_stringByResolvingSymlinksInPathUsingCache:", 0);
}

- (unint64_t)length
{
  return (unint64_t)self->_lengthAndRefCount >> 20;
}

- (const)_fastCharacterContents
{
  return self->_characters;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  void *v4;

  if (a4.location + a4.length >= ((unint64_t)self->_lengthAndRefCount >> 20) + 1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: index (%lu) beyond bounds (%d)"), _NSMethodExceptionProem((objc_class *)self, a2), a4.location + a4.length, (self->_lengthAndRefCount >> 20) + 1), 0);
    objc_exception_throw(v4);
  }
  if (a4.length)
    memmove(a3, &self->_characters[a4.location], 2 * a4.length);
}

- (id)_stringByResolvingSymlinksInPathUsingCache:(BOOL)a3
{
  _BOOL4 v3;
  NSPathStore2 *v4;
  unsigned __int16 *characters;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned __int16 *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  BOOL v13;
  BOOL v14;
  unint64_t v16;
  unsigned __int16 v17[1024];
  uint64_t v18;

  v3 = a3;
  v4 = self;
  v18 = *MEMORY[0x1E0C80C00];
  v16 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSExpandTildeInPath((uint64_t)v17, &v16);
  _NSResolveSymlinksInPathUsingCache(v17, (uint64_t *)&v16, v3);
  _NSStandardizePathUsingCache(v17, (uint64_t *)&v16, v3);
  v7 = (unint64_t)v4->_lengthAndRefCount >> 20;
  if (v7 >= v16)
    v8 = v16;
  else
    v8 = (unint64_t)v4->_lengthAndRefCount >> 20;
  if (v8)
  {
    v9 = v17;
    while (1)
    {
      v11 = *characters++;
      v10 = v11;
      v12 = *v9++;
      v13 = v10 >= v12;
      v14 = v10 == v12;
      if (v10 > v12)
        v6 = 1;
      if (!v13)
        v6 = -1;
      if (!v14)
        break;
      if (!--v8)
        goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    v6 = v16 < v7;
    if (v16 > v7)
      return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v17, v16);
  }
  if (v6)
    return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v17, v16);
  return v4;
}

- (id)stringByAppendingPathExtension:(id)a3
{
  NSPathStore2 *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _WORD *v12;
  _WORD *v13;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unsigned __int16 *characters;
  uint64_t v19;
  unint64_t v20;
  NSString *v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  BOOL v28;
  BOOL v29;
  void *v30;
  _QWORD v31[2];
  uint64_t v32[2];

  v4 = self;
  v32[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v30 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v30);
  }
  v6 = objc_msgSend(a3, "length");
  if (!v6)
    return -[NSPathStore2 copy](v4, "copy");
  v7 = v6;
  v31[1] = v31;
  v8 = (unint64_t)v4->_lengthAndRefCount >> 20;
  v9 = v6 + v8 + 1;
  MEMORY[0x1E0C80A78](v6);
  v12 = (_WORD *)((char *)v31 - v11);
  if (v10 > 0x100)
  {
    v13 = malloc_type_malloc(2 * v10, 0x1000040BDFB0063uLL);
    v12 = v13;
  }
  else
  {
    bzero((char *)v31 - v11, 2 * v10);
  }
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v31 - v16;
  if (v9 > 0x100)
    v17 = (char *)malloc_type_malloc(2 * v15, 0x1000040BDFB0063uLL);
  else
    bzero((char *)v31 - v16, 2 * v15);
  objc_msgSend(a3, "getCharacters:range:", v12, 0, v7);
  characters = v4->_characters;
  memmove(v17, v4->_characters, 2 * v8);
  v32[0] = v8;
  if ((_NSAppendPathExtension((unsigned __int16 *)v17, v32, v9, v12, v7) & 1) != 0)
  {
    _NSTransmutePathSlashes(v17, v32);
    v20 = v32[0];
    if (v32[0] >= 2 && *(_WORD *)&v17[2 * v32[0] - 2] == 47)
    {
      while (v20 > 2)
      {
        v19 = *(unsigned __int16 *)&v17[2 * v20-- - 4];
        if ((_DWORD)v19 != 47)
          goto LABEL_19;
      }
      v20 = 1;
    }
LABEL_19:
    v22 = (unint64_t)v4->_lengthAndRefCount >> 20;
    if (v22 >= v20)
      v23 = v20;
    else
      v23 = (unint64_t)v4->_lengthAndRefCount >> 20;
    if (v23)
    {
      v24 = v17;
      while (1)
      {
        v26 = *characters++;
        v25 = v26;
        v27 = *(unsigned __int16 *)v24;
        v24 += 2;
        v28 = v25 >= v27;
        v29 = v25 == v27;
        if (v25 > v27)
          v19 = 1;
        if (!v28)
          v19 = -1;
        if (!v29)
          break;
        if (!--v23)
          goto LABEL_31;
      }
    }
    else
    {
LABEL_31:
      v19 = v20 < v22;
      if (v20 > v22)
      {
LABEL_33:
        v4 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v17);
        goto LABEL_34;
      }
    }
    if (v19)
      goto LABEL_33;
  }
  else
  {
    v21 = _NSMethodExceptionProem((objc_class *)v4, a2);
    NSLog((NSString *)CFSTR("%@: cannot append extension '%@' to path '%@'"), v21, a3, v4);
    v4 = 0;
  }
LABEL_34:
  if (v7 >= 0x101)
    free(v12);
  if (v9 >= 0x101)
    free(v17);
  return v4;
}

- (id)pathExtension
{
  unint64_t v3;
  uint64_t v4;

  v3 = (unint64_t)self->_lengthAndRefCount >> 20;
  v4 = _NSStartOfPathExtension((uint64_t)self->_characters, v3);
  if (v4 < 1)
    return &stru_1E0F56070;
  else
    return -[NSString substringWithRange:](self, "substringWithRange:", v4 + 1, ~v4 + v3);
}

- (id)stringByDeletingPathExtension
{
  unsigned __int16 *characters;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  characters = self->_characters;
  v3 = (unint64_t)self->_lengthAndRefCount >> 20;
  v4 = _NSStartOfPathExtension((uint64_t)self->_characters, v3);
  if (v4 <= 0)
    v5 = v3;
  else
    v5 = v4;
  return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", characters, v5);
}

+ (id)pathWithComponents:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  size_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 *v20;
  unint64_t v21;
  unsigned __int16 *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  int i;
  NSString *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  NSObject *v34;
  id v36;
  uint64_t v37;
  void *v38;
  CFStringRef v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  void *v45;
  objc_class *v46;
  const char *v47;
  unint64_t v48;
  uint64_t v49[2];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v46 = (objc_class *)a1;
  v47 = a2;
  v54 = *MEMORY[0x1E0C80C00];
  if (!a3 || (_NSIsNSArray() & 1) == 0)
  {
    v38 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: components argument is not an array"), _NSMethodExceptionProem(v46, v47)), 0);
    objc_exception_throw(v38);
  }
  if (!objc_msgSend(a3, "count"))
    return &stru_1E0F56070;
  v4 = objc_msgSend(a3, "count");
  v5 = v4;
  if (v4 >> 60)
  {
    v39 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v4);
    v40 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v39, 0);
    CFRelease(v39);
    objc_exception_throw(v40);
  }
  if (v4 <= 1)
    v4 = 1;
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v41 - v7;
  v49[1] = 0;
  v9 = 8 * v6;
  v44 = &v41;
  v42 = a3;
  if (v5 >= 0x101)
  {
    v8 = (char *)_CFCreateArrayStorage();
    v10 = (char *)malloc_type_malloc(v9, 0x100004000313F17uLL);
    v49[0] = 0;
    v45 = v8;
  }
  else
  {
    MEMORY[0x1E0C80A78](v6);
    v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v10, v9);
    v49[0] = 0;
    if (!v5)
    {
      v17 = 0;
      v45 = 0;
      v14 = 0;
      goto LABEL_17;
    }
    v45 = 0;
  }
  v13 = 0;
  v14 = 0;
  v15 = 0;
  do
  {
    v16 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v13);
    *(_QWORD *)&v8[8 * v13] = v16;
    v11 = objc_msgSend(v16, "length");
    *(_QWORD *)&v10[8 * v13] = v11;
    if ((uint64_t)v14 <= v11)
      v14 = v11;
    v15 += v11;
    ++v13;
  }
  while (v5 != v13);
  v17 = 1;
LABEL_17:
  MEMORY[0x1E0C80A78](v11);
  v20 = (unsigned __int16 *)((char *)&v41 - v19);
  v48 = v21;
  if (v21 >= 0x101)
  {
    v22 = (unsigned __int16 *)malloc_type_malloc(2 * v18, 0x1000040BDFB0063uLL);
    v20 = v22;
  }
  else
  {
    bzero((char *)&v41 - v19, 2 * v18);
  }
  MEMORY[0x1E0C80A78](v22);
  v25 = (char *)&v41 - v24;
  v43 = &v41;
  if (v14 >= 0x101)
  {
    v25 = (char *)malloc_type_malloc(2 * v23, 0x1000040BDFB0063uLL);
    if (!v17)
      goto LABEL_36;
  }
  else
  {
    bzero((char *)&v41 - v24, 2 * v23);
    if (!v17)
      goto LABEL_36;
  }
  v26 = 0;
  do
  {
    objc_msgSend(*(id *)&v8[8 * v26], "getCharacters:range:", v25, 0, *(_QWORD *)&v10[8 * v26]);
    if (*(_QWORD *)&v10[8 * v26] + v49[0] >= 1019)
    {
      _NSTransmutePathSlashes(v20, v49);
      v27 = v49[0];
      if (v49[0] >= 2)
      {
        for (i = v20[v49[0] - 1]; i == 47; i = v20[v27-- - 2])
        {
          if (v27 <= 2)
          {
            v27 = 1;
            break;
          }
        }
        v49[0] = v27;
      }
    }
    if ((_NSAppendPathComponent(v20, v49, v48, v25, *(_QWORD *)&v10[8 * v26]) & 1) == 0)
    {
      v29 = _NSMethodExceptionProem(v46, v47);
      NSLog((NSString *)CFSTR("%@: cannot append path '%@' to path '%@'"), v29, *(_QWORD *)&v8[8 * v26], +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v20, v49[0]));
    }
    ++v26;
  }
  while (v26 != v5);
LABEL_36:
  if (v14 >= 0x101)
    free(v25);
  _NSTransmutePathSlashes(v20, v49);
  v30 = v49[0];
  if (v49[0] < 2)
    goto LABEL_45;
  if (v20[v49[0] - 1] == 47)
  {
    do
    {
      if ((unint64_t)v30 <= 2)
      {
        v32 = 0;
        v30 = 1;
        v49[0] = 1;
        goto LABEL_50;
      }
      v31 = v20[v30-- - 2];
    }
    while (v31 == 47);
    v49[0] = v30;
    if (v30 < 2)
      goto LABEL_45;
  }
  if (*v20 == 92)
    v32 = 2 * (v20[1] == 92);
  else
LABEL_45:
    v32 = 0;
  if (v32 < v30)
  {
LABEL_50:
    if (!v20[v32])
    {
LABEL_54:
      v34 = _NSOSLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        v36 = v42;
        v37 = objc_msgSend(v42, "valueForKey:", CFSTR("length"));
        *(_DWORD *)buf = 138478083;
        v51 = v36;
        v52 = 2112;
        v53 = v37;
        _os_log_fault_impl(&dword_1817D9000, v34, OS_LOG_TYPE_FAULT, "Creating path from components (%{private}@, lengths: %@) resulted in an embedded NUL character", buf, 0x16u);
      }
      v12 = 0;
      goto LABEL_57;
    }
    while (v30 - 1 != v32)
    {
      if (!v20[++v32])
      {
        if (v32 >= v30)
          break;
        goto LABEL_54;
      }
    }
  }
  v12 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v20);
LABEL_57:
  if (v48 >= 0x101)
    free(v20);
  if (v5 >= 0x101)
    free(v10);
  free(v45);
  return v12;
}

- (id)stringByAppendingPathComponent:(id)a3
{
  NSPathStore2 *v3;
  unint64_t v6;
  __objc2_class *Class;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _WORD *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  NSString *v18;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[12];
  _BOOL4 v25;
  _BYTE *v26;
  uint64_t v27;
  int v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  NSPathStore2 *v33;
  __int16 v34;
  uint64_t v35;
  _QWORD v36[262];

  v3 = self;
  v36[260] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return v3;
  v6 = (unint64_t)self->_lengthAndRefCount >> 20;
  Class = (__objc2_class *)object_getClass(a3);
  if (Class == NSPathStore2)
  {
    v25 = 0;
    v9 = (unint64_t)*((unsigned int *)a3 + 2) >> 20;
    v10 = (char *)a3 + 12;
  }
  else
  {
    v8 = objc_msgSend(a3, "length");
    v9 = v8;
    v10 = (char *)v36;
    if (v8 >= 1041)
      v10 = (char *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
    v25 = v10 != (char *)v36;
    Class = (__objc2_class *)objc_msgSend(a3, "getCharacters:range:", v10, 0, v9);
  }
  v26 = v24;
  v27 = v6;
  v11 = v6 + v9 + 1;
  MEMORY[0x1E0C80A78](Class);
  v14 = &v24[-v13];
  if (v11 > 0x100)
    v14 = malloc_type_malloc(2 * v12, 0x1000040BDFB0063uLL);
  else
    bzero(&v24[-v13], 2 * v12);
  memmove(v14, v3->_characters, 2 * v6);
  if ((_NSAppendPathComponent(v14, &v27, v6 + v9 + 1, v10, v9) & 1) == 0)
  {
    v18 = _NSMethodExceptionProem((objc_class *)v3, a2);
    NSLog((NSString *)CFSTR("%@: cannot append path '%@' to path '%@'"), v18, a3, v3);
    return 0;
  }
  _NSTransmutePathSlashes(v14, &v27);
  v15 = v27;
  if (v27 < 2)
    goto LABEL_19;
  if (v14[v27 - 1] == 47)
  {
    do
    {
      if ((unint64_t)v15 <= 2)
      {
        v17 = 0;
        v15 = 1;
        v27 = 1;
        goto LABEL_26;
      }
      v16 = (unsigned __int16)v14[v15-- - 2];
    }
    while (v16 == 47);
    v27 = v15;
    if (v15 < 2)
      goto LABEL_19;
  }
  if (*v14 == 92)
    v17 = 2 * (v14[1] == 92);
  else
LABEL_19:
    v17 = 0;
  if (v17 >= v15)
    goto LABEL_21;
LABEL_26:
  if (!v14[v17])
  {
LABEL_30:
    v20 = _NSOSLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v22 = objc_msgSend(a3, "length");
      v23 = -[NSPathStore2 length](v3, "length");
      v28 = 138478595;
      v29 = a3;
      v30 = 2048;
      v31 = v22;
      v32 = 2113;
      v33 = v3;
      v34 = 2048;
      v35 = v23;
      _os_log_fault_impl(&dword_1817D9000, v20, OS_LOG_TYPE_FAULT, "Appending path component %{private}@ (length: %lu) to string %{private}@ (length: %lu) resulted in an embedded NUL character", (uint8_t *)&v28, 0x2Au);
    }
    return 0;
  }
  while (v15 - 1 != v17)
  {
    if (!v14[++v17])
    {
      if (v17 >= v15)
        break;
      goto LABEL_30;
    }
  }
LABEL_21:
  if (v25)
  {
    free(v10);
    v15 = v27;
  }
  v3 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v14, v15);
  if (v11 >= 0x101)
    free(v14);
  return v3;
}

+ (id)pathStoreWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  unint64_t v4;
  objc_class *v6;
  _DWORD *v7;
  _DWORD *v8;

  v4 = a4;
  if (a4 > 0x400)
    return +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", a3, a4);
  v6 = (objc_class *)objc_opt_self();
  v7 = NSAllocateObject(v6, 2 * v4, 0);
  v8 = v7;
  if (v4)
  {
    memmove(v7 + 3, a3, 2 * v4);
    if (v4 != 1)
    {
      while (*((_WORD *)v8 + v4 + 5) == 47)
      {
        if (v4-- <= 2)
        {
          LODWORD(v4) = 1;
          break;
        }
      }
    }
  }
  v8[2] = (_DWORD)v4 << 20;
  return v8;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  void *v4;

  if (a3 >= (unint64_t)self->_lengthAndRefCount >> 20)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: index (%lu) beyond bounds (%d)"), _NSMethodExceptionProem((objc_class *)self, a2), a3, self->_lengthAndRefCount >> 20), 0);
    objc_exception_throw(v4);
  }
  return self->_characters[a3];
}

- (BOOL)isAbsolutePath
{
  int v3;

  if (self->_lengthAndRefCount < 0x100000)
    return 0;
  v3 = self->_characters[0];
  return v3 == 126 || v3 == 47;
}

- (id)stringByStandardizingPath
{
  return -[NSPathStore2 _stringByStandardizingPathUsingCache:](self, "_stringByStandardizingPathUsingCache:", 0);
}

- (id)_stringByStandardizingPathUsingCache:(BOOL)a3
{
  _BOOL4 v3;
  NSPathStore2 *v4;
  unsigned __int16 *characters;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned __int16 *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  BOOL v13;
  BOOL v14;
  unint64_t v16;
  unsigned __int16 v17[1024];
  uint64_t v18;

  v3 = a3;
  v4 = self;
  v18 = *MEMORY[0x1E0C80C00];
  v16 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSExpandTildeInPath((uint64_t)v17, &v16);
  _NSStandardizePathUsingCache(v17, (uint64_t *)&v16, v3);
  v7 = (unint64_t)v4->_lengthAndRefCount >> 20;
  if (v7 >= v16)
    v8 = v16;
  else
    v8 = (unint64_t)v4->_lengthAndRefCount >> 20;
  if (v8)
  {
    v9 = v17;
    while (1)
    {
      v11 = *characters++;
      v10 = v11;
      v12 = *v9++;
      v13 = v10 >= v12;
      v14 = v10 == v12;
      if (v10 > v12)
        v6 = 1;
      if (!v13)
        v6 = -1;
      if (!v14)
        break;
      if (!--v8)
        goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    v6 = v16 < v7;
    if (v16 > v7)
      return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v17, v16);
  }
  if (v6)
    return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v17, v16);
  return v4;
}

- (id)stringByExpandingTildeInPath
{
  NSPathStore2 *v2;
  unsigned __int16 *characters;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int16 *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  BOOL v12;
  unint64_t v14;
  _BYTE v15[2048];
  uint64_t v16;

  v2 = self;
  v16 = *MEMORY[0x1E0C80C00];
  v14 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSExpandTildeInPath((uint64_t)v15, &v14);
  v5 = (unint64_t)v2->_lengthAndRefCount >> 20;
  if (v5 >= v14)
    v6 = v14;
  else
    v6 = (unint64_t)v2->_lengthAndRefCount >> 20;
  if (v6)
  {
    v7 = (unsigned __int16 *)v15;
    while (1)
    {
      v9 = *characters++;
      v8 = v9;
      v10 = *v7++;
      v11 = v8 >= v10;
      v12 = v8 == v10;
      if (v8 > v10)
        v4 = 1;
      if (!v11)
        v4 = -1;
      if (!v12)
        break;
      if (!--v6)
        goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    v4 = v14 < v5;
    if (v14 > v5)
      return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v15, v14);
  }
  if (v4)
    return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v15, v14);
  return v2;
}

- (id)stringByAbbreviatingWithTildeInPath
{
  NSPathStore2 *v2;
  unsigned __int16 *characters;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int16 *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  BOOL v12;
  unint64_t v14;
  unsigned __int16 v15[1024];
  uint64_t v16;

  v2 = self;
  v16 = *MEMORY[0x1E0C80C00];
  v14 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSAbbreviatePathWithTilde(v15, (uint64_t *)&v14);
  v5 = (unint64_t)v2->_lengthAndRefCount >> 20;
  if (v5 >= v14)
    v6 = v14;
  else
    v6 = (unint64_t)v2->_lengthAndRefCount >> 20;
  if (v6)
  {
    v7 = v15;
    while (1)
    {
      v9 = *characters++;
      v8 = v9;
      v10 = *v7++;
      v11 = v8 >= v10;
      v12 = v8 == v10;
      if (v8 > v10)
        v4 = 1;
      if (!v11)
        v4 = -1;
      if (!v12)
        break;
      if (!--v6)
        goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    v4 = v14 < v5;
    if (v14 > v5)
      return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v15, v14);
  }
  if (v4)
    return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v15, v14);
  return v2;
}

@end
