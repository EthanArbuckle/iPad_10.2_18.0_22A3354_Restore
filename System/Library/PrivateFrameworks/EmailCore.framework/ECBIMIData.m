@implementation ECBIMIData

+ (id)bimiDataForHeaders:(id)a3
{
  +[_ECBIMIHeaderParser bimiDataForHeaders:]((uint64_t)_ECBIMIHeaderParser, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ECBIMIData)initWithIndicator:(id)a3 location:(id)a4 evidenceLocation:(id)a5 indicatorHash:(id)a6 hashAlgorithm:(id)a7
{
  id v13;
  id v14;
  id v15;
  ECBIMIData *v16;
  ECBIMIData *v17;
  id v19;
  id v20;
  objc_super v21;

  v20 = a3;
  v19 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ECBIMIData;
  v16 = -[ECBIMIData init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_indicator, a3);
    objc_storeStrong((id *)&v17->_location, a4);
    objc_storeStrong((id *)&v17->_evidenceLocation, a5);
    objc_storeStrong((id *)&v17->_indicatorHash, a6);
    objc_storeStrong((id *)&v17->_hashAlgorithm, a7);
    -[ECBIMIData _calculateHash]((uint64_t)v17);
  }

  return v17;
}

- (uint64_t)_calculateHash
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 16), "hash");
    v3 = objc_msgSend(*(id *)(v1 + 24), "hash");
    v4 = objc_msgSend(*(id *)(v1 + 32), "hash");
    v5 = objc_msgSend(*(id *)(v1 + 40), "hash");
    result = objc_msgSend(*(id *)(v1 + 48), "hash");
    *(_QWORD *)(v1 + 8) = 33 * (33 * (33 * (33 * v2 + v3) + v4) + v5) + result + 39135393;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  ECBIMIData *v4;
  ECBIMIData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (ECBIMIData *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if ((-[ECBIMIData isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    -[ECBIMIData indicator](self, "indicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECBIMIData indicator](v5, "indicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFObjectsAreEqual())
    {
      -[ECBIMIData location](self, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ECBIMIData location](v5, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual())
      {
        -[ECBIMIData evidenceLocation](self, "evidenceLocation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ECBIMIData evidenceLocation](v5, "evidenceLocation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual())
        {
          -[ECBIMIData indicatorHash](self, "indicatorHash");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[ECBIMIData indicatorHash](v5, "indicatorHash");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (EFObjectsAreEqual())
          {
            -[ECBIMIData hashAlgorithm](self, "hashAlgorithm");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[ECBIMIData hashAlgorithm](v5, "hashAlgorithm");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = EFObjectsAreEqual();

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSData)indicator
{
  return self->_indicator;
}

- (NSURL)location
{
  return self->_location;
}

- (NSURL)evidenceLocation
{
  return self->_evidenceLocation;
}

- (NSString)indicatorHash
{
  return self->_indicatorHash;
}

- (NSString)hashAlgorithm
{
  return self->_hashAlgorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashAlgorithm, 0);
  objc_storeStrong((id *)&self->_indicatorHash, 0);
  objc_storeStrong((id *)&self->_evidenceLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_indicator, 0);
}

@end
