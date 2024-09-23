@implementation _NSConstantArray

- (unint64_t)retainCount
{
  return 1;
}

+ (id)alloc
{
  void *v2;
  uint64_t v3;
  objc_class *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCA98];
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Calling Alloc on %@ is not allowed"), NSStringFromClass(v4));
  return 0;
}

- (void)dealloc
{
  void *v2;
  uint64_t v3;
  objc_class *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCA98];
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Calling Dealloc on %@ is not allowed"), NSStringFromClass(v4));
}

- (unint64_t)count
{
  return LODWORD(self[1].super.super.isa);
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (-[_NSConstantArray count](self, "count") > a3)
    return self[a3 + 2].super.super.isa;
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Bounds of array exceeded. Accessed index %d in %d elements array"), a3, -[_NSConstantArray count](self, "count"));
  return 0;
}

- (id)objectEnumerator
{
  return -[_NSConstantArrayEnumerator initWithArray:capacity:]([_NSConstantArrayEnumerator alloc], "initWithArray:capacity:", &self[2], LODWORD(self[1].super.super.isa));
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0)
    return 0;
  a3->var0 = -1;
  a3->var1 = (id *)&self[2].super.super.isa;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  return LODWORD(self[1].super.super.isa);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  -[_NSConstantArray enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t isa_low;
  _NSConstantArray *v6;
  uint64_t v7;
  uint64_t v8;
  _NSConstantArray *v9;
  BOOL v10;
  uint64_t v11;
  char v12;
  char v13;

  v6 = self + 1;
  isa_low = LODWORD(self[1].super.super.isa);
  if ((a3 & 2) != 0)
  {
    do
    {
      if ((int)isa_low < 1)
        break;
      v11 = isa_low - 1;
      v12 = 0;
      (*((void (**)(id, Class, uint64_t, char *))a4 + 2))(a4, v6[isa_low].super.super.isa, isa_low - 1, &v12);
      isa_low = v11;
    }
    while (!v12);
  }
  else if ((int)isa_low >= 1)
  {
    v7 = 0;
    v8 = isa_low - 1;
    v9 = self + 2;
    do
    {
      v13 = 0;
      (*((void (**)(id, Class, uint64_t, char *))a4 + 2))(a4, v9[v7].super.super.isa, v7, &v13);
      if (v13)
        v10 = 1;
      else
        v10 = v8 == v7;
      ++v7;
    }
    while (!v10);
  }
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v6;
  int v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v16;

  v6 = a4;
  v9 = objc_msgSend(a3, "count");
  v10 = (uint64_t *)malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  objc_msgSend(a3, "getIndexes:maxCount:inIndexRange:", v10, v9, 0);
  if ((v6 & 2) != 0)
  {
    for (i = v9; (int)i >= 1; i = v16)
    {
      v16 = i - 1;
      (*((void (**)(id, Class))a5 + 2))(a5, self[v10[i - 1] + 2].super.super.isa);
    }
  }
  else if (v9 >= 1)
  {
    v11 = v9 - 1;
    v12 = v10;
    do
    {
      v13 = *v12++;
      (*((void (**)(id, Class))a5 + 2))(a5, self[v13 + 2].super.super.isa);
    }
    while (v11-- != 0);
  }
  free(v10);
}

@end
