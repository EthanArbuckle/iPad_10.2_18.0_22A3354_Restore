@implementation ICTTCRVectorTimestamp

- (ICTTCRVectorTimestamp)init
{
  ICTTCRVectorTimestamp *v2;
  ICCRVectorTimestamp *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICTTCRVectorTimestamp;
  v2 = -[ICTTVectorTimestamp init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ICCRVectorTimestamp);
    -[ICTTCRVectorTimestamp setCrTimestamp:](v2, "setCrTimestamp:", v3);

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICTTCRVectorTimestamp *v4;

  v4 = -[ICTTCRVectorTimestamp init](+[ICTTCRVectorTimestamp allocWithZone:](ICTTCRVectorTimestamp, "allocWithZone:", a3), "init");
  -[ICTTVectorTimestamp mergeWithTimestamp:](v4, "mergeWithTimestamp:", self);
  return v4;
}

- (id)clockElementForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICTTVectorTimestampElement *v7;

  v4 = a3;
  -[ICTTCRVectorTimestamp crTimestamp](self, "crTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clockElementForUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(ICTTVectorTimestampElement);
    -[ICTTVectorTimestampElement setClock:](v7, "setClock:", objc_msgSend(v6, "clock"));
    -[ICTTVectorTimestampElement setSubclock:](v7, "setSubclock:", objc_msgSend(v6, "subclock"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)clockForUUID:(id)a3
{
  void *v3;
  unint64_t v4;

  -[ICTTCRVectorTimestamp clockElementForUUID:](self, "clockElementForUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "clock");

  return v4;
}

- (unint64_t)subclockForUUID:(id)a3
{
  void *v3;
  unint64_t v4;

  -[ICTTCRVectorTimestamp clockElementForUUID:](self, "clockElementForUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "subclock");

  return v4;
}

- (void)setClock:(unint64_t)a3 forUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ICTTCRVectorTimestamp crTimestamp](self, "crTimestamp");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClock:forUUID:", a3, v6);

}

- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[ICTTCRVectorTimestamp crTimestamp](self, "crTimestamp");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClock:subclock:forUUID:", a3, a4, v8);

}

- (id)allUUIDs
{
  void *v2;
  void *v3;

  -[ICTTCRVectorTimestamp crTimestamp](self, "crTimestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sortedUUIDs
{
  void *v2;
  void *v3;

  -[ICTTCRVectorTimestamp crTimestamp](self, "crTimestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICCRVectorTimestamp)crTimestamp
{
  return self->_crTimestamp;
}

- (void)setCrTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_crTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crTimestamp, 0);
}

@end
