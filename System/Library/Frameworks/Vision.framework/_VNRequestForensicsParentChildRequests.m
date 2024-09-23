@implementation _VNRequestForensicsParentChildRequests

- (_VNRequestForensicsParentChildRequests)initWithParentRequest:(id)a3 orderedChildRequests:(id)a4
{
  id v7;
  id v8;
  _VNRequestForensicsParentChildRequests *v9;
  _VNRequestForensicsParentChildRequests *v10;
  uint64_t v11;
  NSArray *orderedChildRequests;
  _VNRequestForensicsParentChildRequests *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_VNRequestForensicsParentChildRequests;
  v9 = -[_VNRequestForensicsParentChildRequests init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentRequest, a3);
    v11 = objc_msgSend(v8, "copy");
    orderedChildRequests = v10->_orderedChildRequests;
    v10->_orderedChildRequests = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_VNRequestForensicsParentChildRequests parentRequest](self, "parentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VNRequestForensicsParentChildRequests orderedChildRequests](self, "orderedChildRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("( %@, [ %@ ])"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_VNRequestForensicsParentChildRequests parentRequest](self, "parentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[_VNRequestForensicsParentChildRequests orderedChildRequests](self, "orderedChildRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ __ROR8__(v4, 51);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _VNRequestForensicsParentChildRequests *v4;
  _VNRequestForensicsParentChildRequests *v5;
  VNRequest *parentRequest;
  VNRequest *v7;
  BOOL v8;
  NSArray *orderedChildRequests;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;

  v4 = (_VNRequestForensicsParentChildRequests *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      parentRequest = self->_parentRequest;
      -[_VNRequestForensicsParentChildRequests parentRequest](v5, "parentRequest");
      v7 = (VNRequest *)objc_claimAutoreleasedReturnValue();

      if (parentRequest != v7)
      {
        v8 = 0;
LABEL_14:

        goto LABEL_15;
      }
      orderedChildRequests = self->_orderedChildRequests;
      -[_VNRequestForensicsParentChildRequests orderedChildRequests](v5, "orderedChildRequests");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = orderedChildRequests;
      v12 = v10;
      if (v11 != v12)
      {
        v13 = -[NSArray count](v11, "count");
        if (-[NSArray count](v12, "count") != v13)
        {
LABEL_11:
          v8 = 0;
LABEL_13:

          goto LABEL_14;
        }
        if (v13)
        {
          -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 == v15)
          {
            v17 = 1;
            while (v13 != v17)
            {
              -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              ++v17;
              if (v18 != v19)
              {
                v20 = v17 - 1;
                goto LABEL_21;
              }
            }
            v20 = v13;
LABEL_21:
            v8 = v20 >= v13;
            goto LABEL_13;
          }
          goto LABEL_11;
        }
      }
      v8 = 1;
      goto LABEL_13;
    }
    v8 = 0;
  }
LABEL_15:

  return v8;
}

- (VNRequest)parentRequest
{
  return self->_parentRequest;
}

- (NSArray)orderedChildRequests
{
  return self->_orderedChildRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedChildRequests, 0);
  objc_storeStrong((id *)&self->_parentRequest, 0);
}

@end
