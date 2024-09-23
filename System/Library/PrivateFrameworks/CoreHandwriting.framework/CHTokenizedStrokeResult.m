@implementation CHTokenizedStrokeResult

- (CHTokenizedStrokeResult)initWithStrokeIdentifiers:(id)a3 resultLevel:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CHTokenizedStrokeResult *v12;
  uint64_t v13;
  NSSet *strokeIdentifiers;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHTokenizedStrokeResult;
  v12 = -[CHTokenizedStrokeResult init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend_copy(v6, v7, v8, v9, v10, v11);
    strokeIdentifiers = v12->_strokeIdentifiers;
    v12->_strokeIdentifiers = (NSSet *)v13;

    v12->_resultLevel = a4;
  }

  return v12;
}

- (int64_t)resultLevel
{
  return self->_resultLevel;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end
