@implementation MLMultiArrayAsNSArrayWrapper

- (id)initWrappingMultiArray:(id)a3
{
  id v5;
  MLMultiArrayAsNSArrayWrapper *v6;
  MLMultiArrayAsNSArrayWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLMultiArrayAsNSArrayWrapper;
  v6 = -[MLMultiArrayAsNSArrayWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_multiArray, a3);

  return v7;
}

- (unint64_t)count
{
  return -[MLMultiArray count](self->_multiArray, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[MLMultiArray objectAtIndexedSubscript:](self->_multiArray, "objectAtIndexedSubscript:", a3);
}

- (MLMultiArray)multiArray
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMultiArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiArray, 0);
}

@end
