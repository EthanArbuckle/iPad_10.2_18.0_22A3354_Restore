@implementation WFEmailAddress

- (WFEmailAddress)initWithAddress:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  WFEmailAddress *v8;
  uint64_t v9;
  NSString *address;
  uint64_t v11;
  NSString *label;
  WFEmailAddress *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFEmailAddress;
  v8 = -[WFEmailAddress init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    address = v8->_address;
    v8->_address = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    label = v8->_label;
    v8->_label = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSString)localizedLabel
{
  void *v2;
  void *v3;

  -[WFEmailAddress label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[WFContactLabeledValue localizedStringForLabel:](WFContactLabeledValue, "localizedStringForLabel:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  WFEmailAddress *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFEmailAddress *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFEmailAddress address](self, "address");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFEmailAddress address](v4, "address");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFEmailAddress address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") ^ 0xCAFEBEEFLL;

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[WFEmailAddress address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFEmailAddress address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAddress:label:", v5, 0);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFEmailAddress address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("address"));

  -[WFEmailAddress label](self, "label");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("label"));

}

- (WFEmailAddress)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFEmailAddress *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFEmailAddress initWithAddress:label:](self, "initWithAddress:label:", v5, v6);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[WFEmailAddress address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("link.contentkit.emailaddress"));

  objc_msgSend(v3, "setValue:forKey:", self->_label, CFSTR("link.contentkit.emaillabel"));
  return v3;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

+ (id)emailAddressesInString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    +[WFDataDetector resultsForString:ofTypes:error:](WFDataDetector, "resultsForString:ofTypes:error:", v6, 32, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textCheckingResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(a1, "addressesWithTextCheckingResult:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

+ (BOOL)stringContainsEmailAddresses:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "emailAddressesInString:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

+ (id)addressesWithTextCheckingResult:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("mailto"));

  if (v6)
  {
    objc_msgSend(a1, "addressesWithMailtoURL:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

+ (id)addressesWithMailtoURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void (**v12)(void *, void *);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[4];
  void (**v22)(void *, void *);
  _QWORD aBlock[4];
  id v24;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v7, "length") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "hasPrefix:", CFSTR("//")))
  {
    objc_msgSend(v8, "substringFromIndex:", 2);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__WFEmailAddress_addressesWithMailtoURL___block_invoke;
  aBlock[3] = &unk_24C4E08D0;
  v11 = v5;
  v24 = v11;
  v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (objc_msgSend(v8, "rangeOfString:", CFSTR("?")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12[2](v12, v8);
  }
  else
  {
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("?"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v15);

      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "dc_dictionaryFromQueryString:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __41__WFEmailAddress_addressesWithMailtoURL___block_invoke_2;
    v21[3] = &unk_24C4E08F8;
    v22 = v12;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v21);

  }
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __41__WFEmailAddress_addressesWithMailtoURL___block_invoke_3;
  v20[3] = &__block_descriptor_40_e37___WFEmailAddress_24__0__NSString_8Q16l;
  v20[4] = a1;
  objc_msgSend(v11, "if_map:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)addressWithEmailAddress:(id)a3
{
  return (id)objc_msgSend(a1, "addressWithEmailAddress:label:", a3, 0);
}

+ (id)addressWithEmailAddress:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAddress:label:", v7, v6);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.emailaddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.emaillabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAddress:label:", v5, v6);
  return v7;
}

void __41__WFEmailAddress_addressesWithMailtoURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __41__WFEmailAddress_addressesWithMailtoURL___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(a2, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("to"));

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "stringByRemovingPercentEncoding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    *a4 = 1;
  }

}

uint64_t __41__WFEmailAddress_addressesWithMailtoURL___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addressWithEmailAddress:", a2);
}

@end
