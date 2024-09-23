@implementation AMSLookupItemArtwork

- (AMSLookupItemArtwork)initWithArtworkDictionary:(id)a3
{
  id v5;
  AMSLookupItemArtwork *v6;
  AMSLookupItemArtwork *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSLookupItemArtwork;
  v6 = -[AMSLookupItemArtwork init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_artworkDictionary, a3);

  return v7;
}

- (id)colorWithKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  AMSLookupItemArtworkColor *v9;

  v4 = a3;
  -[AMSLookupItemArtwork artworkDictionary](self, "artworkDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
    goto LABEL_5;
  }
  v7 = v6;

  if (!v7)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v7 = objc_retainAutorelease(v7);
  v8 = strtoul((const char *)objc_msgSend(v7, "UTF8String"), 0, 16);
  v9 = objc_alloc_init(AMSLookupItemArtworkColor);
  -[AMSLookupItemArtworkColor setRed:](v9, "setRed:", (double)BYTE2(v8) / 255.0);
  -[AMSLookupItemArtworkColor setGreen:](v9, "setGreen:", (double)BYTE1(v8) / 255.0);
  -[AMSLookupItemArtworkColor setBlue:](v9, "setBlue:", (double)v8 / 255.0);
  -[AMSLookupItemArtworkColor setAlpha:](v9, "setAlpha:", 1.0);
LABEL_6:

  return v9;
}

- (double)width
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;

  -[AMSLookupItemArtwork artworkDictionary](self, "artworkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("width"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)height
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;

  -[AMSLookupItemArtwork artworkDictionary](self, "artworkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("height"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (NSString)URLString
{
  void *v2;
  void *v3;
  id v4;

  -[AMSLookupItemArtwork artworkDictionary](self, "artworkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 cropStyle:(id)a5 format:(id)a6
{
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t i;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  _QWORD v31[13];

  v31[12] = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a5;
  v11 = (__CFString *)a6;
  if (v10)
    v12 = v10;
  else
    v12 = CFSTR("bb");
  if (v11)
    v13 = v11;
  else
    v13 = CFSTR("jpg");
  -[AMSLookupItemArtwork URLString](self, "URLString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    v23 = 0;
    goto LABEL_24;
  }
  v28 = v14;
  v16 = v14;
  v31[0] = CFSTR("{h}");
  v31[1] = a3;
  v31[2] = 0;
  v31[3] = CFSTR("{w}");
  v31[4] = a4;
  v31[5] = 0;
  v31[6] = CFSTR("{f}");
  v31[7] = 0;
  v29 = v13;
  v31[8] = v13;
  v31[9] = CFSTR("{c}");
  v31[10] = 0;
  v30 = v12;
  v17 = 0;
  v18 = 0;
  v31[11] = v12;
  do
  {
    v20 = objc_msgSend(v16, "rangeOfString:options:", v31[v17], 4);
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_16;
    v21 = v19;
    v22 = (id)v31[v17 + 2];
    if (v22)
    {
      if (!v18)
        goto LABEL_14;
    }
    else
    {
      v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), v31[v17 + 1]);
      if (!v18)
      {
LABEL_14:
        v18 = (id)objc_msgSend(v16, "mutableCopy");

        v16 = v18;
      }
    }
    objc_msgSend(v18, "replaceCharactersInRange:withString:", v20, v21, v22);

LABEL_16:
    v17 += 3;
  }
  while (v17 != 12);
  v13 = v29;
  v12 = v30;
  v15 = v28;
  if (!v18
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18),
        (v23 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v24 = (void *)MEMORY[0x1E0C99E98];
    -[AMSLookupItemArtwork URLString](self, "URLString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URLWithString:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  for (i = 0; i != -12; i -= 3)
  {

  }
LABEL_24:

  return v23;
}

- (NSDictionary)artworkDictionary
{
  return self->_artworkDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDictionary, 0);
}

@end
