@implementation _PFResultArray

- (void)release
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 - 1, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    *p_cd_rc += 0x20000000;
    -[_PFResultArray dealloc](self, "dealloc");
  }
}

- (void)dealloc
{
  $90161CA090A212753249BD5EF7BDB7E6 *resultSet;
  objc_super v4;

  resultSet = self->_resultSet;
  if (resultSet)
    bufferResultSetDeallocate((uint64_t)resultSet);

  self->_weakRequestStore = 0;
  self->_metadata = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PFResultArray;
  -[_PFResultArray dealloc](&v4, sel_dealloc);
}

- (unint64_t)count
{
  if ((*(_BYTE *)&self->_resultSet->var7 & 0x40) != 0)
    return 0;
  else
    return self->_count;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t result;
  unint64_t count;
  unint64_t v12;
  unint64_t v13;
  id v14;

  if ((*(_BYTE *)&self->_resultSet->var7 & 0x40) != 0)
    return 0;
  var0 = a3->var0;
  if (!a3->var0)
    a3->var2 = (unint64_t *)&self->_count;
  result = 0;
  a3->var1 = a4;
  if (a5)
  {
    count = self->_count;
    if (var0 < count)
    {
      result = 0;
      do
      {
        v12 = result;
        v13 = var0 + result;
        v14 = -[_PFResultArray objectAtIndex:](self, "objectAtIndex:", var0 + result);
        result = v12 + 1;
        a4[v12] = v14;
      }
      while (v13 + 1 < count && result < a5);
      var0 += result;
    }
  }
  a3->var0 = var0;
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  $90161CA090A212753249BD5EF7BDB7E6 *resultSet;
  $832F591C28F8B7CE1ACC7DCBC97655CC var7;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  char *v19;
  uint64_t v20;
  objc_class *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  resultSet = self->_resultSet;
  var7 = resultSet->var7;
  if ((*(_BYTE *)&var7 & 0x10) != 0)
  {
    if ((*(_BYTE *)&var7 & 0x40) != 0)
    {
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99778];
      v25 = _NSMethodExceptionProem();
      v18 = CFSTR("%@: backing buffer has been purged");
    }
    else
    {
      if ((*(_BYTE *)&var7 & 0x20) == 0)
        goto LABEL_2;
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99778];
      v25 = _NSMethodExceptionProem();
      v18 = CFSTR("%@: backing buffer can be purged");
    }
    objc_msgSend(v16, "raise:format:", v17, v18, v25, v26, v27);
    return 0;
  }
LABEL_2:
  if (self->_count <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%lu) beyond bounds (%lu)"), _NSMethodExceptionProem(), a3, self->_count);
    return 0;
  }
  if (!resultSet->var5)
  {
    v13 = 0;
LABEL_19:
    v14 = (unsigned int *)resultSet->var9[v13];
    goto LABEL_20;
  }
  v12 = 0;
  v13 = 0;
  while (1)
  {
    v14 = (unsigned int *)resultSet->var9[v13];
    v15 = *v14;
    if (v12 + (unint64_t)(v15 - 1) >= a3)
      break;
    v12 += v15;
LABEL_9:
    if (++v13 >= (unint64_t)resultSet->var5)
      goto LABEL_19;
  }
  if (v15 < (int)a3 - (int)v12)
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("Index beyond buffer: %ld, %ld, %ld, %ld"), a3, v3, v4, v5, v6, v7, v13);
    resultSet = self->_resultSet;
    goto LABEL_9;
  }
  v23 = a3 - v12;
  if (a3 == v12)
  {
LABEL_20:
    v20 = 8;
    goto LABEL_21;
  }
  v24 = v14[1];
  v20 = 8;
  do
  {
    v20 += *(unsigned int *)((char *)v14 + v24);
    v24 += 4;
    --v23;
  }
  while (v23);
LABEL_21:
  v19 = (char *)v14 + v20;
  if (!*(_QWORD *)((char *)v14 + v20))
  {
    v21 = (objc_class *)objc_opt_class();
    object_setClass(v19, v21);
  }
  objc_msgSend(v19, "_setParentBuffer:", self);
  return v19;
}

- (_PFResultArray)retain
{
  int *p_cd_rc;
  unsigned int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (_PFResultArray)initWithObjects:(id *)a3 count:(unsigned int)a4 store:(id)a5 metadata:(id)a6
{
  _PFResultArray *v9;
  _PFResultArray *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_PFResultArray;
  v9 = -[_PFResultArray init](&v12, sel_init, a3, *(_QWORD *)&a4);
  v10 = v9;
  if (v9)
  {
    v9->_count = a3->var0;
    v9->_weakRequestStore = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", a5);
    v10->_resultSet = a3;
    v10->_resultType = 2;
    v10->_metadata = (NSKnownKeysDictionary *)a6;
  }
  return v10;
}

+ (void)initialize
{
  objc_opt_self();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[_PFResultArray indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, 0, self->_count);
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  uint64_t v9;
  uint64_t (*v10)(id, char *, id);
  id v11;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  length = a4.length;
  location = a4.location;
  v8 = a4.location + a4.length;
  v9 = objc_msgSend(a3, "methodForSelector:", sel_isEqual_);
  if (location >= v8)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = (uint64_t (*)(id, char *, id))v9;
  while (1)
  {
    v11 = -[_PFResultArray objectAtIndex:](self, "objectAtIndex:", location);
    if (v11 == a3 || (v10(a3, sel_isEqual_, v11) & 1) != 0)
      break;
    ++location;
    if (!--length)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return location;
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  return -[_PFResultArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, self->_count);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  if ((*(_BYTE *)&self->_resultSet->var7 & 0x40) != 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  length = a4.length;
  location = a4.location;
  if (a4.location >= a4.location + a4.length)
    return 0x7FFFFFFFFFFFFFFFLL;
  while (-[_PFResultArray objectAtIndex:](self, "objectAtIndex:", location) != a3)
  {
    ++location;
    if (!--length)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return location;
}

- (BOOL)_setPurgeable:(BOOL)a3
{
  $90161CA090A212753249BD5EF7BDB7E6 *resultSet;

  resultSet = self->_resultSet;
  if (a3)
    return bufferResultSetPurgeable((uint64_t)resultSet);
  else
    return bufferResultSetNonPurgeable((uint64_t)resultSet);
}

- (void)getObjects:(id *)a3
{
  unsigned int count;
  unsigned int v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  count = self->_count;
  MEMORY[0x1E0C80A78](self);
  v8 = (char *)v12 - v7;
  if (count > 0x200)
  {
    v8 = (char *)NSAllocateScannedUncollectable();
    if (self->_count)
    {
LABEL_3:
      v9 = 0;
      do
      {
        *(_QWORD *)&v8[8 * v9] = -[_PFResultArray objectAtIndex:](self, "objectAtIndex:", v9);
        ++v9;
        v10 = self->_count;
      }
      while (v9 < v10);
      v11 = 8 * v10;
      goto LABEL_8;
    }
  }
  else
  {
    bzero((char *)v12 - v7, 8 * v6);
    if (count)
      goto LABEL_3;
  }
  v11 = 0;
LABEL_8:
  memmove(a3, v8, v11);
  if (count >= 0x201)
    NSZoneFree(0, v8);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _PFResultArray *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  NSUInteger v11;
  _QWORD v13[2];

  length = a4.length;
  location = a4.location;
  v7 = self;
  v13[1] = *MEMORY[0x1E0C80C00];
  if (a4.location + a4.length > self->_count)
    self = (_PFResultArray *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%lu) beyond bounds (%lu)"), _NSMethodExceptionProem(), a4.location + a4.length - 1, self->_count);
  if (length)
  {
    MEMORY[0x1E0C80A78](self);
    v9 = (char *)v13 - v8;
    if (length > 0x200)
      v9 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v13 - v8, 8 * length);
    if (location < v7->_count)
    {
      v10 = 0;
      do
      {
        v11 = location + v10;
        *(_QWORD *)&v9[8 * v10] = -[_PFResultArray objectAtIndex:](v7, "objectAtIndex:", location + v10);
        ++v10;
      }
      while (v11 + 1 < v7->_count && length > v10);
    }
    memmove(a3, v9, 8 * length);
    if (length >= 0x201)
      NSZoneFree(0, v9);
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

@end
