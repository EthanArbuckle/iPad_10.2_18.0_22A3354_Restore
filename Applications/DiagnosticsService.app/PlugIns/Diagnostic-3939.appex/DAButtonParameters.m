@implementation DAButtonParameters

- (DAButtonParameters)initWithDictionary:(id)a3
{
  id v4;
  DAButtonParameters *v5;
  DAButtonParameters *v6;
  NSSet *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *segments;
  BOOL v12;
  objc_super v14;
  char v15;

  v4 = a3;
  v15 = 0;
  v14.receiver = self;
  v14.super_class = (Class)DAButtonParameters;
  v5 = -[DAParameters initWithDictionary:](&v14, "initWithDictionary:", v4);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:", CFSTR("segments"), v8, 100, &v15));

    v10 = objc_claimAutoreleasedReturnValue(+[DASpecification specificationFromArray:](DAButtonSegment, "specificationFromArray:", v9));
    segments = v6->_segments;
    v6->_segments = (NSArray *)v10;

    v12 = v15 == 0;
  }
  else
  {
    v12 = 1;
  }
  if (!v6->_segments || !v12)
  {

    v6 = 0;
  }

  return v6;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
