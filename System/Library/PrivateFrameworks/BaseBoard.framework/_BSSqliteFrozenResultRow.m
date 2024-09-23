@implementation _BSSqliteFrozenResultRow

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)keyAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_frozenColumnNames, "objectAtIndexedSubscript:", a3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_frozenObjects, "objectAtIndexedSubscript:", a3);
}

- (int64_t)integerAtIndex:(unint64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_frozenIntegers, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (double)doubleAtIndex:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSArray objectAtIndexedSubscript:](self->_frozenDoubles, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (id)stringAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_frozenStrings, "objectAtIndexedSubscript:", a3);
}

- (id)dataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_frozenDatas, "objectAtIndexedSubscript:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenDatas, 0);
  objc_storeStrong((id *)&self->_frozenStrings, 0);
  objc_storeStrong((id *)&self->_frozenDoubles, 0);
  objc_storeStrong((id *)&self->_frozenIntegers, 0);
  objc_storeStrong((id *)&self->_frozenObjects, 0);
  objc_storeStrong((id *)&self->_frozenColumnNames, 0);
}

@end
