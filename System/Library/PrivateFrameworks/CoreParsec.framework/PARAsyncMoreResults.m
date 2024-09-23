@implementation PARAsyncMoreResults

- (PARAsyncMoreResults)initWithCoder:(id)a3
{
  id v4;
  PARAsyncMoreResults *v5;
  uint64_t v6;
  NSURL *moreResultsURL;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PARAsyncMoreResults;
  v5 = -[SFMoreResults initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_moreResultsURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    moreResultsURL = v5->_moreResultsURL;
    v5->_moreResultsURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_scale"));
    v5->_scale = v8;
    v5->_queryId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_queryId"));
    v5->_clientQueryId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_clientQueryId"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PARAsyncMoreResults;
  v4 = a3;
  -[SFMoreResults encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_moreResultsURL, CFSTR("_moreResultsURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_scale"), self->_scale);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_queryId, CFSTR("_queryId"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_clientQueryId, CFSTR("_clientQueryId"));

}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSURL)moreResultsURL
{
  return self->_moreResultsURL;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (unint64_t)clientQueryId
{
  return self->_clientQueryId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreResultsURL, 0);
}

+ (id)moreResults:(id)a3 label:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7
{
  id v10;
  id v11;
  PARAsyncMoreResults *v12;
  uint64_t v13;
  NSURL *moreResultsURL;

  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(PARAsyncMoreResults);
  -[SFMoreResults setLabel:](v12, "setLabel:", v10);

  v13 = objc_msgSend(v11, "copy");
  moreResultsURL = v12->_moreResultsURL;
  v12->_moreResultsURL = (NSURL *)v13;

  v12->_scale = a6;
  v12->_queryId = a7;
  return v12;
}

+ (id)moreResults:(id)a3 label:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7 clientQueryId:(unint64_t)a8
{
  id result;

  result = (id)objc_msgSend(a1, "moreResults:label:session:scale:queryId:", a3, a4, a5, a7, a6);
  if (result)
    *((_QWORD *)result + 5) = a8;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
