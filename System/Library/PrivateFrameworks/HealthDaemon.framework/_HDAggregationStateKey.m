@implementation _HDAggregationStateKey

+ (_QWORD)keyForCollector:(void *)a3 device:(void *)a4 aggregator:
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = objc_alloc_init((Class)objc_opt_self());
  objc_msgSend(v8, "identifierForDataAggregator:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "copy");
  v12 = (void *)v9[1];
  v9[1] = v11;

  v13 = objc_msgSend(v7, "copy");
  v14 = (void *)v9[2];
  v9[2] = v13;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[NSString isEqualToString:](self->_collectorIdentifier, "isEqualToString:", v4[1]))
  {
    v5 = -[HKDevice isEqual:](self->_device, "isEqual:", v4[2]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_collectorIdentifier, "hash");
  return -[HKDevice hash](self->_device, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_collectorIdentifier, 0);
}

@end
