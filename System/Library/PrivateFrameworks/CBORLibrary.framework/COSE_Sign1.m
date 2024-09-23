@implementation COSE_Sign1

- (COSE_Sign1)initWithProtectedHeaders:(id)a3 unprotectedHeaders:(id)a4 payload:(id)a5 signature:(id)a6 includeCBORTag:(BOOL)a7
{
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  COSE_Sign1 *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (a7)
    v11 = 18;
  else
    v11 = -1;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[CBOR cborWithData:](CBOR, "cborWithData:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (COSE_Sign1 *)-[COSE initWithProtectedHeaders:unprotectedHeaders:payload:type:additionalCBORs:](self, v14, v13, v12, v11, v16);

  return v17;
}

- (COSE_Sign1)initWithCBOR:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  COSE_Sign1 *v16;
  COSE_Sign1 *v17;
  objc_super v19;

  v4 = a3;
  if (objc_msgSend(v4, "type") != 4)
    goto LABEL_9;
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < 4)
    goto LABEL_9;
  objc_msgSend(v4, "tag");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  objc_msgSend(v4, "tag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numeric");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 == 18)
  {
LABEL_5:
    objc_msgSend(v4, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "type") == 2 || objc_msgSend(v13, "type") == 11)
    {
      objc_msgSend(v4, "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "type") == 2)
      {
        v19.receiver = self;
        v19.super_class = (Class)COSE_Sign1;
        v16 = -[COSE initWithCBOR:](&v19, sel_initWithCBOR_, v4);
        -[COSE setType:]((uint64_t)v16, 18);
        self = v16;
        v17 = self;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
LABEL_9:
    v17 = 0;
  }

  return v17;
}

- (NSArray)x509bag
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509Bag);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_16;
  if (objc_msgSend(v2, "type") == 4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "array", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "data");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v7);
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v4, 0);
    goto LABEL_15;
  }
  if (objc_msgSend(v3, "type") != 2)
  {
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v12 = (void *)v11;

LABEL_17:
  return (NSArray *)v12;
}

- (NSArray)x509chain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(&unk_24C7D6498, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COSE _searchForHeaderLabel:](self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_16;
  if (objc_msgSend(v4, "type") == 4)
  {
    v5 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "array", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "data");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v5, 0);
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "type") != 2)
  {
LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v13 = (void *)v12;

LABEL_17:
  return (NSArray *)v13;
}

- (NSString)x509uri
{
  void *v3;
  void *v4;

  -[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509Uri);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3
     || (-[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509UriSender),
         (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    && objc_msgSend(v3, "type") == 3)
  {
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)x509hashAlgorithmIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509Hash);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3
     || (-[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509HashSender),
         (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    && objc_msgSend(v3, "type") == 4
    && (objc_msgSend(v3, "array"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5 == 2))
  {
    objc_msgSend(v3, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isWholeNumber"))
    {
      objc_msgSend(v7, "numeric");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v7, "type") == 3)
    {
      objc_msgSend(v7, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return (NSString *)v9;
}

- (NSData)x509hashValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509Hash);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3
     || (-[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509HashSender),
         (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    && objc_msgSend(v3, "type") == 4
    && (objc_msgSend(v3, "array"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5 == 2))
  {
    objc_msgSend(v3, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "type") == 2)
    {
      objc_msgSend(v7, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return (NSData *)v8;
}

- (NSData)signature
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[COSE sourceObject]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "type") == 2)
  {
    objc_msgSend(v4, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[COSE protectedHeadererDictionary](self, "protectedHeadererDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COSE unprotectedHeaderParameters](self, "unprotectedHeaderParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COSE_Sign1 signature](self, "signature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COSE tag](self, "tag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ProtectedHeaders: %@, UnprotectedHeaders: %@, signature: %@, tag: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
