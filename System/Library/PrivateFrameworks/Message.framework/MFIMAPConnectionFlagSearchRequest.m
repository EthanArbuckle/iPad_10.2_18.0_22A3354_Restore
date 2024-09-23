@implementation MFIMAPConnectionFlagSearchRequest

+ (id)requestWithMask:(unint64_t)a3 searchTerms:(id)a4 positiveMatch:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMask:searchTerms:positiveMatch:", a3, v8, v5);

  return v9;
}

- (MFIMAPConnectionFlagSearchRequest)initWithMask:(unint64_t)a3 searchTerms:(id)a4 positiveMatch:(BOOL)a5
{
  id v8;
  MFIMAPConnectionFlagSearchRequest *v9;
  MFIMAPConnectionFlagSearchRequest *v10;
  uint64_t v11;
  NSArray *searchTerms;
  MFIMAPConnectionFlagSearchRequest *v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFIMAPConnectionFlagSearchRequest;
  v9 = -[MFIMAPConnectionFlagSearchRequest init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_mask = a3;
    v9->_isPositiveMatch = a5;
    v11 = objc_msgSend(v8, "copy");
    searchTerms = v10->_searchTerms;
    v10->_searchTerms = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (unint64_t)mask
{
  return self->_mask;
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (BOOL)isPositiveMatch
{
  return self->_isPositiveMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerms, 0);
}

@end
