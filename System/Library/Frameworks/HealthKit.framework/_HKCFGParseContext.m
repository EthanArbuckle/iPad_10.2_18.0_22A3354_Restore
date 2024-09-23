@implementation _HKCFGParseContext

- (_HKCFGParseContext)initWithScanner:(id)a3 lengthAllowance:(unint64_t)a4
{
  id v7;
  _HKCFGParseContext *v8;
  _HKCFGParseContext *v9;
  _HKCFGNodeCache *v10;
  _HKCFGNodeCache *cache;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKCFGParseContext;
  v8 = -[_HKCFGParseContext init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scanner, a3);
    v9->_lengthAllowance = a4;
    v9->_recursiveDepth = 0;
    v10 = objc_alloc_init(_HKCFGNodeCache);
    cache = v9->_cache;
    v9->_cache = v10;

  }
  return v9;
}

- (NSScanner)scanner
{
  return self->_scanner;
}

- (_HKCFGNodeCache)cache
{
  return self->_cache;
}

- (unint64_t)lengthAllowance
{
  return self->_lengthAllowance;
}

- (void)decreaseLengthAllowance:(unint64_t)a3
{
  self->_lengthAllowance -= a3;
}

- (void)incrementRecursiveDepth
{
  ++self->_recursiveDepth;
}

- (void)increaseLengthAllowance:(unint64_t)a3
{
  self->_lengthAllowance += a3;
}

- (void)decrementRecursiveDepth
{
  --self->_recursiveDepth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
}

- (unint64_t)recursiveDepth
{
  return self->_recursiveDepth;
}

@end
