@implementation _CNFilteringResponsePreparer

- (_CNFilteringResponsePreparer)initWithResponsePreparer:(id)a3 delegate:(id)a4 filter:(id)a5
{
  id v8;
  _CNFilteringResponsePreparer *v9;
  uint64_t v10;
  id filter;
  _CNFilteringResponsePreparer *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CNFilteringResponsePreparer;
  v9 = -[_CNAutocompleteResponsePreparerDecorator initWithResponsePreparer:delegate:](&v14, sel_initWithResponsePreparer_delegate_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    filter = v9->_filter;
    v9->_filter = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[_CNFilteringResponsePreparer filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_filter:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CNALoggingContextDebug();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v9, "count");
    if (v11 < 0x1F5)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v11, v17);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first %lu of %lu"), 500, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_cn_take:", 500);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543619;
    v19 = v12;
    v20 = 2113;
    v21 = v13;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "Filtered results: (%{public}@): %{private}@", buf, 0x16u);

  }
  -[_CNAutocompleteResponsePreparerDecorator preparer](self, "preparer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "prepareResults:forFetch:", v9, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)filter
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
}

@end
