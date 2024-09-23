@implementation DATouchButtonParameters

- (DATouchButtonParameters)initWithDictionary:(id)a3
{
  id v4;
  DATouchButtonParameters *v5;
  NSSet *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *targetEvents;
  BOOL v11;
  objc_super v13;
  char v14;

  v4 = a3;
  v14 = 0;
  v13.receiver = self;
  v13.super_class = (Class)DATouchButtonParameters;
  v5 = -[DAParameters initWithDictionary:](&v13, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:", CFSTR("targetEvents"), v7, 100, &v14));

    v9 = objc_claimAutoreleasedReturnValue(+[DASpecification specificationFromArray:](DATouchButtonTargetEvent, "specificationFromArray:", v8));
    targetEvents = v5->_targetEvents;
    v5->_targetEvents = (NSArray *)v9;

    v11 = v14 == 0;
  }
  else
  {
    v11 = 1;
  }
  if (!v5->_targetEvents || !v11)
  {

    v5 = 0;
  }

  return v5;
}

- (NSArray)targetEvents
{
  return self->_targetEvents;
}

- (void)setTargetEvents:(id)a3
{
  objc_storeStrong((id *)&self->_targetEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetEvents, 0);
}

@end
