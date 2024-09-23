@implementation GEOURLWithHeaders

- (GEOURLWithHeaders)initWithURL:(id)a3 headerFields:(id)a4
{
  id v7;
  id v8;
  GEOURLWithHeaders *v9;
  GEOURLWithHeaders *v10;
  uint64_t v11;
  NSDictionary *headerFields;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GEOURLWithHeaders;
  v9 = -[GEOURLWithHeaders init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    v11 = objc_msgSend(v8, "copy");
    headerFields = v10->_headerFields;
    v10->_headerFields = (NSDictionary *)v11;

  }
  return v10;
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (GEOURLWithHeaders)init
{
  GEOURLWithHeaders *result;

  result = (GEOURLWithHeaders *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

@end
