@implementation FINodeIteratorWithExtraChildren

- (FINodeIteratorWithExtraChildren)initWithIterator:(id)a3 extraChildren:(id)a4 extraChildrenFullyPopulated:(BOOL)a5 options:(unsigned int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  id v11;
  id v12;
  FINodeIteratorWithExtraChildren *v13;
  FIChildrenIterator *v14;
  FINodeIterator *extraIterator;
  objc_super v17;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FINodeIteratorWithExtraChildren;
  v13 = -[FINodeIteratorWithExtraChildren init](&v17, sel_init);
  objc_storeStrong((id *)&v13->_baseIterator, a3);
  v14 = -[FIChildrenIterator initWithChildren:fullyPopulated:options:]([FIChildrenIterator alloc], "initWithChildren:fullyPopulated:options:", v12, v7, v6);
  extraIterator = v13->_extraIterator;
  v13->_extraIterator = (FINodeIterator *)v14;

  return v13;
}

- (id)first
{
  void *v3;

  -[FINodeIterator first](self->_baseIterator, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[FINodeIterator first](self->_extraIterator, "first");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)next
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_baseIteratorDone)
  {
    -[FINodeIterator next](self->_extraIterator, "next");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FINodeIterator next](self->_baseIterator, "next");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      self->_baseIteratorDone = 1;
      -[FINodeIterator first](self->_extraIterator, "first");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v6;

  }
  return v3;
}

- (BOOL)fullyPopulated
{
  _BOOL4 v3;

  v3 = -[FINodeIterator fullyPopulated](self->_baseIterator, "fullyPopulated");
  if (v3)
    LOBYTE(v3) = -[FINodeIterator fullyPopulated](self->_extraIterator, "fullyPopulated");
  return v3;
}

- (unint64_t)estimatedSize
{
  unint64_t v3;

  v3 = -[FINodeIterator estimatedSize](self->_baseIterator, "estimatedSize");
  return -[FINodeIterator estimatedSize](self->_extraIterator, "estimatedSize") + v3;
}

- (FINodeIterator)baseIterator
{
  return self->_baseIterator;
}

- (void)setBaseIterator:(id)a3
{
  objc_storeStrong((id *)&self->_baseIterator, a3);
}

- (BOOL)baseIteratorDone
{
  return self->_baseIteratorDone;
}

- (void)setBaseIteratorDone:(BOOL)a3
{
  self->_baseIteratorDone = a3;
}

- (FINodeIterator)extraIterator
{
  return self->_extraIterator;
}

- (void)setExtraIterator:(id)a3
{
  objc_storeStrong((id *)&self->_extraIterator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraIterator, 0);
  objc_storeStrong((id *)&self->_baseIterator, 0);
}

@end
