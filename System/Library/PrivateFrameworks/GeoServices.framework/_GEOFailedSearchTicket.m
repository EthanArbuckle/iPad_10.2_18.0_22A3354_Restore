@implementation _GEOFailedSearchTicket

- (_GEOFailedSearchTicket)initWithError:(id)a3 searchQuery:(id)a4 traits:(id)a5
{
  id v8;
  _GEOFailedSearchTicket *v9;
  uint64_t v10;
  NSString *searchQuery;
  _GEOFailedSearchTicket *v12;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GEOFailedSearchTicket;
  v9 = -[_GEOFailedTicket initWithError:traits:](&v14, sel_initWithError_traits_, a3, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    searchQuery = v9->_searchQuery;
    v9->_searchQuery = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->searchQuery, 0);
}

@end
