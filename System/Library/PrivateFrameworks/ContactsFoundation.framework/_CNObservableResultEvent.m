@implementation _CNObservableResultEvent

- (_CNObservableResultEvent)initWithResult:(id)a3
{
  id v5;
  _CNObservableResultEvent *v6;
  _CNObservableResultEvent *v7;
  _CNObservableResultEvent *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNObservableResultEvent;
  v6 = -[_CNObservableResultEvent init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_result, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dematerializeWithObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_CNObservableResultEvent hasValue](self, "hasValue"))
  {
    -[_CNObservableResultEvent value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "observerDidReceiveResult:", v4);

  }
}

- (id)value
{
  return self->_result;
}

- (BOOL)hasValue
{
  void *v2;
  BOOL v3;

  -[_CNObservableResultEvent value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNObservableResultEvent value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("value"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)eventType
{
  return 0;
}

- (id)error
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36___CNObservableResultEvent_isEqual___block_invoke;
  v7[3] = &unk_1E29B9D38;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = +[CNEqualsBuilder isObject:memberOfSameClassAndEqualTo:withBlocks:](CNEqualsBuilder, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v5, self, v7, 0);

  return (char)self;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __32___CNObservableResultEvent_hash__block_invoke;
  v3[3] = &unk_1E29B9B10;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v3, 0);
}

@end
