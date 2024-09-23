@implementation SUUIGiftCharity

- (SUUIGiftCharity)initWithCharityDictionary:(id)a3
{
  id v4;
  SUUIGiftCharity *v5;
  void *v6;
  uint64_t v7;
  NSString *amountDisclaimer;
  void *v9;
  uint64_t v10;
  NSString *description;
  void *v12;
  uint64_t v13;
  NSString *identifier;
  void *v15;
  uint64_t v16;
  NSString *legalText;
  void *v18;
  uint64_t v19;
  NSString *legalText2;
  void *v21;
  uint64_t v22;
  NSString *name;
  void *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  SUUIArtwork *v36;
  SUUIArtwork *logoArtwork;
  void *v38;
  NSArray *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  SUUIGiftAmount *v46;
  NSArray *amounts;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)SUUIGiftCharity;
  v5 = -[SUUIGiftCharity init](&v54, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("amountDisclaimer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      amountDisclaimer = v5->_amountDisclaimer;
      v5->_amountDisclaimer = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("description"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      description = v5->_description;
      v5->_description = (NSString *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("legalText"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      legalText = v5->_legalText;
      v5->_legalText = (NSString *)v16;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("legalText2"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = objc_msgSend(v18, "copy");
      legalText2 = v5->_legalText2;
      v5->_legalText2 = (NSString *)v19;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = objc_msgSend(v21, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v22;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("logo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "userInterfaceIdiom");

      if (v26 == 1)
        v27 = CFSTR("iPad");
      else
        v27 = CFSTR("iPhone");
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "scale");
      v30 = v29;

      if (v30 == 2.0)
      {
        -[__CFString stringByAppendingString:](v27, "stringByAppendingString:", CFSTR("_2x"));
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "scale");
      v33 = v32;

      if (v33 == 3.0)
      {
        -[__CFString stringByAppendingString:](v27, "stringByAppendingString:", CFSTR("_3x"));
        v34 = objc_claimAutoreleasedReturnValue();

        v27 = (__CFString *)v34;
      }
      objc_msgSend(v24, "objectForKey:", v27);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = -[SUUIArtwork initWithArtworkDictionary:]([SUUIArtwork alloc], "initWithArtworkDictionary:", v35);
        logoArtwork = v5->_logoArtwork;
        v5->_logoArtwork = v36;

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("amounts"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = v4;
      v39 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v40 = v38;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v51;
        do
        {
          v44 = 0;
          do
          {
            if (*(_QWORD *)v51 != v43)
              objc_enumerationMutation(v40);
            v45 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v44);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = -[SUUIGiftAmount initWithAmountDictionary:]([SUUIGiftAmount alloc], "initWithAmountDictionary:", v45);
              -[NSArray addObject:](v39, "addObject:", v46);

            }
            ++v44;
          }
          while (v42 != v44);
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v42);
      }

      amounts = v5->_amounts;
      v5->_amounts = v39;

      v4 = v49;
    }

  }
  return v5;
}

- (NSString)amountDisclaimer
{
  return self->_amountDisclaimer;
}

- (NSString)charityDescription
{
  return self->_description;
}

- (NSArray)donationAmounts
{
  return self->_amounts;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)legalText
{
  return self->_legalText;
}

- (NSString)legalText2
{
  return self->_legalText2;
}

- (SUUIArtwork)logoArtwork
{
  return self->_logoArtwork;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logoArtwork, 0);
  objc_storeStrong((id *)&self->_legalText2, 0);
  objc_storeStrong((id *)&self->_legalText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_amounts, 0);
  objc_storeStrong((id *)&self->_amountDisclaimer, 0);
}

@end
