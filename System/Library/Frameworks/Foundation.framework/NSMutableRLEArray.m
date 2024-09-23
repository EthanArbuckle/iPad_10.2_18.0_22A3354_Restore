@implementation NSMutableRLEArray

- (void)replaceObjectsInRange:(_NSRange)a3 withObject:(id)a4 length:(unint64_t)a5
{
  _NSRefCountedRunArray *theList;
  NSUInteger length;
  id v9;
  NSUInteger location;
  id v11;
  uint64_t v12;
  unint64_t v13;
  _NSRefCountedRunArray *v14;
  NSUInteger v15;
  char *v16;
  unint64_t var0;
  unint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  char *v21;
  NSUInteger v22;
  NSUInteger v23;
  _NSRefCountedRunArray *v24;
  uint64_t var6;
  char *v26;
  unint64_t var4;
  unint64_t *v28;
  id v29;
  _NSRefCountedRunArray *v30;
  char *v31;
  unint64_t v32;
  _NSRunArrayItem *var7;
  id v34;
  objc_class *v36;
  const char *v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = 0;
  theList = self->super.theList;
  if (a3.location + a3.length > theList->var1)
  {
    v36 = (objc_class *)objc_opt_class();
    v37 = _NSNameOfClass(v36);
    v38 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s %s: Out of bounds"), v37, sel_getName(a2)), 0);
    objc_exception_throw(v38);
  }
  length = a3.length;
  if (a3.length)
  {
    v9 = a4;
    location = a3.location;
    if (a5)
      v11 = a4;
    else
      v11 = 0;
    os_unfair_lock_lock(&self->super.theList->var0);
    if (self->super.theList->var3 >= 2)
      -[NSRLEArray _makeNewListFrom:](self, "_makeNewListFrom:");
    os_unfair_lock_unlock(&theList->var0);
    v12 = blockForLocation((uint64_t)self->super.theList, location, &v39);
    v13 = v12;
    v14 = self->super.theList;
    v14->var1 -= length;
    if (v40 - location + v39 >= length)
      v15 = length;
    else
      v15 = v40 - location + v39;
    v16 = (char *)v14 + 16 * v12;
    var0 = *((_QWORD *)v16 + 5) - v15;
    *((_QWORD *)v16 + 5) = var0;
    if (!var0)
    {

      var0 = self->super.theList->var7[v13].var0;
    }
    if (var0)
      v18 = v13 + 1;
    else
      v18 = v13;
    v19 = length - v15;
    if (v19)
    {
      v20 = 16 * v13;
      do
      {
        v21 = (char *)self->super.theList + v20;
        v22 = *((_QWORD *)v21 + 7);
        if (v19 >= v22)
          v23 = *((_QWORD *)v21 + 7);
        else
          v23 = v19;
        *((_QWORD *)v21 + 7) = v22 - v23;
        if (v22 <= v19)

        v20 += 16;
        ++v13;
        v19 -= v23;
      }
      while (v19);
    }
    if (v13)
      v13 -= self->super.theList->var7[v13].var0 != 0;
    if (v18 > v13)
      goto LABEL_47;
    if (v18)
    {
      v24 = self->super.theList;
      var6 = v24->var6;
      if (v18 == var6)
      {
        v24->var2 -= *((_QWORD *)&v24->var3 + 2 * v18);
        v24->var6 = var6 - 1;
      }
      if (!v11)
        goto LABEL_40;
      v26 = (char *)v24 + 16 * v18 - 16;
      if (*((id *)v26 + 6) == v11)
      {
        *((_QWORD *)v26 + 5) += a5;
        v24->var1 += a5;
        goto LABEL_40;
      }
    }
    else
    {
      v24 = self->super.theList;
      if (!v11)
      {
        v9 = 0;
        v18 = 0;
        goto LABEL_45;
      }
    }
    var4 = v24->var4;
    if (v13 + 1 >= var4 || (v28 = &v24->var2 + 2 * v13, (id)v28[6] != v11))
    {
      if (v18 < var4)
      {
        v29 = v9;
        v9 = 0;
        v30 = self->super.theList;
        v31 = (char *)v30 + 16 * v18;
        *((_QWORD *)v31 + 5) = a5;
        *((_QWORD *)v31 + 6) = v29;
        v30->var1 += a5;
        ++v18;
      }
      goto LABEL_43;
    }
    v28[5] += a5;
    v24->var1 += a5;
    if (!v18)
    {
      v9 = 0;
      goto LABEL_45;
    }
LABEL_40:
    v32 = v13 + 1;
    if (v13 + 1 < v24->var4 && (var7 = v24->var7, v34 = (id)*((_QWORD *)&v24->var5 + 2 * v18), v34 == var7[v32].var1))
    {
      var7[v18 - 1].var0 += var7[v32].var0;

      v9 = 0;
      ++v13;
    }
    else
    {
      v9 = 0;
    }
LABEL_43:
    if (v18 > v13)
    {
LABEL_46:
      v11 = v9;
LABEL_47:
      if (v11)
        -[NSMutableRLEArray insertObject:range:](self, "insertObject:range:", v11, location, a5);
      return;
    }
    v24 = self->super.theList;
LABEL_45:
    memmove(&v24->var7[v18], &v24->var7[v13 + 1], 16 * (v24->var4 + ~v13));
    self->super.theList->var4 += v18 - (v13 + 1);
    -[NSMutableRLEArray _setBlockCapacity:](self, "_setBlockCapacity:");
    goto LABEL_46;
  }
}

- (void)insertObject:(id)a3 range:(_NSRange)a4
{
  _NSRefCountedRunArray *theList;
  NSUInteger length;
  NSUInteger location;
  _NSRefCountedRunArray *v9;
  unsigned int var4;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  int v15;
  unint64_t v16;
  char *v17;
  char *v18;
  unsigned int v19;
  id v20;
  char *v21;
  id v22;
  uint64_t v23;
  id v24;
  char *v25;
  id v26;
  char *v27;
  objc_class *v29;
  const char *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  theList = self->super.theList;
  if (a4.location > theList->var1)
  {
    v29 = (objc_class *)objc_opt_class();
    v30 = _NSNameOfClass(v29);
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s %s: Out of bounds"), v30, sel_getName(a2)), 0);
    objc_exception_throw(v31);
  }
  length = a4.length;
  if (a4.length)
  {
    location = a4.location;
    os_unfair_lock_lock(&self->super.theList->var0);
    if (self->super.theList->var3 >= 2)
      -[NSRLEArray _makeNewListFrom:](self, "_makeNewListFrom:");
    os_unfair_lock_unlock(&theList->var0);
    v9 = self->super.theList;
    if (location == v9->var1)
    {
      if (location)
      {
        var4 = v9->var4;
        v11 = var4 - 1;
        if (v9->var7[v11].var1 != a3)
        {
          -[NSMutableRLEArray _setBlockCapacity:](self, "_setBlockCapacity:", var4 + 1);
          v12 = a3;
          v9 = self->super.theList;
          v13 = v9->var4;
          v14 = (char *)v9 + 16 * v13;
          *((_QWORD *)v14 + 5) = length;
          *((_QWORD *)v14 + 6) = v12;
          v15 = v13 + 1;
LABEL_19:
          v9->var4 = v15;
          goto LABEL_20;
        }
        v9->var7[v11].var0 += length;
        if (v9->var6 < var4)
          goto LABEL_20;
LABEL_25:
        v9->var2 += length;
        goto LABEL_20;
      }
      -[NSMutableRLEArray _setBlockCapacity:](self, "_setBlockCapacity:", 1);
      v22 = a3;
      v9 = self->super.theList;
      v9->var7[0].var0 = length;
      v9->var7[0].var1 = v22;
    }
    else
    {
      v32 = 0;
      v33 = 0;
      v16 = blockForLocation((uint64_t)v9, location, &v32);
      v9 = self->super.theList;
      v17 = (char *)v9 + 16 * v16;
      if (*((id *)v17 + 6) == a3)
      {
        *((_QWORD *)v17 + 5) += length;
LABEL_20:
        v9->var1 += length;
        return;
      }
      if (v16)
      {
        if (v32 == location)
        {
          v18 = (char *)v9 + 16 * v16 - 16;
          if (*((id *)v18 + 6) == a3)
          {
            *((_QWORD *)v18 + 5) += length;
            if (v16 > v9->var6)
              goto LABEL_20;
            goto LABEL_25;
          }
        }
      }
      v19 = v9->var4;
      if (v32 != location)
      {
        -[NSMutableRLEArray _setBlockCapacity:](self, "_setBlockCapacity:", v19 + 2);
        v23 = 16 * v16 + 32;
        memmove((char *)self->super.theList->var7 + v23, &self->super.theList->var7[v16], 16 * (self->super.theList->var4 - v16));
        v24 = a3;
        v25 = (char *)self->super.theList + 16 * v16;
        *((_QWORD *)v25 + 7) = length;
        *((_QWORD *)v25 + 8) = v24;
        *((_QWORD *)v25 + 5) = location - v32;
        v26 = *((id *)v25 + 6);
        v9 = self->super.theList;
        v27 = (char *)v9 + v23;
        *((_QWORD *)v27 + 6) = v26;
        *((_QWORD *)v27 + 5) = v33 - location + v32;
        v15 = v9->var4 + 2;
        goto LABEL_19;
      }
      -[NSMutableRLEArray _setBlockCapacity:](self, "_setBlockCapacity:", v19 + 1);
      memmove(&self->super.theList->var7[v16 + 1], &self->super.theList->var7[v16], 16 * (self->super.theList->var4 - v16));
      v20 = a3;
      v9 = self->super.theList;
      v21 = (char *)v9 + 16 * v16;
      *((_QWORD *)v21 + 5) = length;
      *((_QWORD *)v21 + 6) = v20;
    }
    v15 = v9->var4 + 1;
    goto LABEL_19;
  }
}

- (void)_setBlockCapacity:(unint64_t)a3
{
  unint64_t v4;
  unint64_t var5;
  unint64_t v7;
  _NSRefCountedRunArray *v8;

  if (a3 <= 1)
    v4 = 1;
  else
    v4 = a3;
  var5 = self->super.theList->var5;
  if (v4 > var5 || v4 < var5 >> 1)
  {
    v7 = (v4 + 3) / 3;
    v8 = (_NSRefCountedRunArray *)MEMORY[0x186DA80E4]();
    self->super.theList = v8;
    v8->var5 = 4 * v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSRLEArray initWithRefCountedRunArray:](+[NSRLEArray allocWithZone:](NSRLEArray, "allocWithZone:", a3), "initWithRefCountedRunArray:", self->super.theList);
}

- (void)deleteObjectsInRange:(_NSRange)a3
{
  -[NSMutableRLEArray replaceObjectsInRange:withObject:length:](self, "replaceObjectsInRange:withObject:length:", a3.location, a3.length, 0, 0);
}

@end
