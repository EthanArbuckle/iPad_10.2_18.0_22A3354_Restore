@implementation MAElementFilter

- (MAElementFilter)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  unsigned int v6;
  id v8;
  id v9;
  MAElementFilter *v10;
  NSSet *v11;
  NSSet *labels;
  KGElementIdentifierSet *v13;
  KGElementIdentifierSet *domains;
  objc_super v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MAElementFilter;
  v10 = -[MAElementFilter init](&v16, sel_init);
  if (v10)
  {
    if (v8)
      v11 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v8, 0);
    else
      v11 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    labels = v10->_labels;
    v10->_labels = v11;

    if (v6)
      v13 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", v6);
    else
      v13 = objc_alloc_init(KGElementIdentifierSet);
    domains = v10->_domains;
    v10->_domains = v13;

    objc_storeStrong((id *)&v10->_properties, a5);
  }

  return v10;
}

- (MAElementFilter)initWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return -[MAElementFilter initWithLabel:domain:properties:](self, "initWithLabel:domain:properties:", a3, a4, MEMORY[0x1E0C9AA70]);
}

- (MAElementFilter)initWithLabels:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  unsigned int v6;
  id v9;
  id v10;
  MAElementFilter *v11;
  MAElementFilter *v12;
  KGElementIdentifierSet *v13;
  KGElementIdentifierSet *domains;
  objc_super v16;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MAElementFilter;
  v11 = -[MAElementFilter init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_labels, a3);
    if (v6)
      v13 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", v6);
    else
      v13 = objc_alloc_init(KGElementIdentifierSet);
    domains = v12->_domains;
    v12->_domains = v13;

    objc_storeStrong((id *)&v12->_properties, a5);
  }

  return v12;
}

- (MAElementFilter)initWithLabel:(id)a3 domains:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  id v10;
  MAElementFilter *v11;
  NSSet *v12;
  NSSet *labels;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MAElementFilter;
  v11 = -[MAElementFilter init](&v15, sel_init);
  if (v11)
  {
    if (v8)
      v12 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v8, 0);
    else
      v12 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    labels = v11->_labels;
    v11->_labels = v12;

    objc_storeStrong((id *)&v11->_domains, a4);
    objc_storeStrong((id *)&v11->_properties, a5);
  }

  return v11;
}

- (MAElementFilter)initWithLabels:(id)a3 domains:(id)a4 properties:(id)a5
{
  id v9;
  id v10;
  id v11;
  MAElementFilter *v12;
  MAElementFilter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MAElementFilter;
  v12 = -[MAElementFilter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_labels, a3);
    objc_storeStrong((id *)&v13->_domains, a4);
    objc_storeStrong((id *)&v13->_properties, a5);
  }

  return v13;
}

- (BOOL)matchesLabelOfElement:(id)a3
{
  id v4;
  NSSet *labels;
  void *v6;
  char v7;

  v4 = a3;
  if (-[NSSet count](self->_labels, "count"))
  {
    labels = self->_labels;
    objc_msgSend(v4, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSSet containsObject:](labels, "containsObject:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)matchesDomainOfElement:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[KGElementIdentifierSet count](self->_domains, "count"))
    v5 = -[KGElementIdentifierSet containsIdentifier:](self->_domains, "containsIdentifier:", objc_msgSend(v4, "domain"));
  else
    v5 = 1;

  return v5;
}

- (BOOL)matchesPropertiesOfElement:(id)a3
{
  id v4;
  KGElementFilter *v5;
  KGElementFilter *v6;
  void *v7;

  v4 = a3;
  v5 = [KGElementFilter alloc];
  v6 = -[KGElementFilter initWithRequiredLabels:optionalLabels:properties:](v5, "initWithRequiredLabels:optionalLabels:properties:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], self->_properties);
  objc_msgSend(v4, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = -[KGElementFilter matchesProperties:](v6, "matchesProperties:", v7);
  return (char)v4;
}

- (BOOL)matchesElement:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[MAElementFilter matchesLabelOfElement:](self, "matchesLabelOfElement:", v4)
    && -[MAElementFilter matchesDomainOfElement:](self, "matchesDomainOfElement:", v4)
    && -[MAElementFilter matchesPropertiesOfElement:](self, "matchesPropertiesOfElement:", v4);

  return v5;
}

- (NSArray)kgRequiredLabels
{
  id v3;
  void *v4;
  unsigned __int16 v5;
  void *v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSSet count](self->_labels, "count") == 1)
  {
    -[NSSet anyObject](self->_labels, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (-[KGElementIdentifierSet count](self->_domains, "count") == 1)
  {
    v5 = -[KGElementIdentifierSet firstElement](self->_domains, "firstElement");
    if (v5 != 1)
    {
      +[MAKGDomainConversion kgLabelForMADomain:](MAKGDomainConversion, "kgLabelForMADomain:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v3, "addObject:", v6);
      }
      else
      {
        KGLoggingConnection();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138412290;
          v11 = v9;
          _os_log_fault_impl(&dword_1CA0A5000, v7, OS_LOG_TYPE_FAULT, "Attempting to filter with invalid domain (%@)", (uint8_t *)&v10, 0xCu);

        }
      }

    }
  }
  return (NSArray *)v3;
}

- (NSArray)kgOptionalLabels
{
  id v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  KGElementIdentifierSet *domains;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSSet count](self->_labels, "count") >= 2)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_labels;
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  if (-[KGElementIdentifierSet count](self->_domains, "count") >= 2)
  {
    domains = self->_domains;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __35__MAElementFilter_kgOptionalLabels__block_invoke;
    v11[3] = &unk_1E83E4E48;
    v12 = v3;
    -[KGElementIdentifierSet enumerateIdentifiersWithBlock:](domains, "enumerateIdentifiersWithBlock:", v11);

  }
  return (NSArray *)v3;
}

- (void)_appendPropertyOption:(id)a3 toString:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  switch(objc_msgSend(v5, "kgPropertyType"))
  {
    case 0:
      KGLoggingConnection();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v5;
        _os_log_fault_impl(&dword_1CA0A5000, v7, OS_LOG_TYPE_FAULT, "Unsupported property value: (%@)", buf, 0xCu);
      }
      goto LABEL_7;
    case 1:
      v7 = v5;
      if ((-[NSObject integerValue](v7, "integerValue") & 0x8000000000000000) == 0)
        objc_msgSend(v6, "appendString:", CFSTR("+"));
      objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v7);
LABEL_7:

      break;
    case 2:
      objc_msgSend(v5, "doubleValue");
      objc_msgSend(v6, "appendFormat:", CFSTR("%f"), v8);
      break;
    case 3:
      objc_msgSend(v6, "appendFormat:", CFSTR("'%@'"), v5);
      break;
    case 4:
      objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v5);
      break;
    default:
      break;
  }

}

- (void)appendVisualStringToString:(id)a3
{
  id v4;
  NSSet *labels;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  KGElementIdentifierSet *domains;
  id v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  NSDictionary *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  MAElementFilter *v36;
  uint64_t *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "appendString:", CFSTR(":"));
  labels = self->_labels;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("self"), 1, sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet sortedArrayUsingDescriptors:](labels, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(v4, "appendString:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v12 = v43[3] + 1;
        v43[3] = v12;
        if (v12 < objc_msgSend(obj, "count"))
          objc_msgSend(v4, "appendString:", CFSTR("/"));
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "appendString:", CFSTR(":"));
  v43[3] = 0;
  domains = self->_domains;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __46__MAElementFilter_appendVisualStringToString___block_invoke;
  v34[3] = &unk_1E83E4898;
  v14 = v4;
  v36 = self;
  v37 = &v42;
  v35 = v14;
  -[KGElementIdentifierSet enumerateIdentifiersWithBlock:](domains, "enumerateIdentifiersWithBlock:", v34);
  if (-[NSDictionary count](self->_properties, "count"))
  {
    objc_msgSend(v14, "appendString:", CFSTR(" { "));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = self->_properties;
    v15 = -[NSDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v47, 16);
    if (v15)
    {
      v24 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v23);
          v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v14, "appendFormat:", CFSTR("%@:"), v17);
          -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v14, "appendString:", CFSTR("["));
            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            v19 = v18;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v46, 16);
            if (v20)
            {
              v21 = *(_QWORD *)v27;
              do
              {
                for (k = 0; k != v20; ++k)
                {
                  if (*(_QWORD *)v27 != v21)
                    objc_enumerationMutation(v19);
                  -[MAElementFilter _appendPropertyOption:toString:](self, "_appendPropertyOption:toString:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k), v14);
                  objc_msgSend(v14, "appendString:", CFSTR(", "));
                }
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v46, 16);
              }
              while (v20);
            }

            objc_msgSend(v14, "appendString:", CFSTR("]"));
          }
          else
          {
            -[MAElementFilter _appendPropertyOption:toString:](self, "_appendPropertyOption:toString:", v18, v14);
          }
          objc_msgSend(v14, "appendString:", CFSTR(", "));

        }
        v15 = -[NSDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v47, 16);
      }
      while (v15);
    }

    objc_msgSend(v14, "appendString:", CFSTR("}"));
  }

  _Block_object_dispose(&v42, 8);
}

- (NSString)visualString
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[MAElementFilter appendVisualStringToString:](self, "appendVisualStringToString:", v3);
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  MAElementFilter *v4;
  MAElementFilter *v5;
  KGElementIdentifierSet *domains;
  void *v7;
  NSSet *labels;
  void *v9;
  NSDictionary *properties;
  void *v11;
  char v12;

  v4 = (MAElementFilter *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      domains = self->_domains;
      -[MAElementFilter domains](v5, "domains");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(domains) = -[KGElementIdentifierSet isEqualToElementIdentifierSet:](domains, "isEqualToElementIdentifierSet:", v7);

      if ((_DWORD)domains
        && (labels = self->_labels,
            -[MAElementFilter labels](v5, "labels"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(labels) = -[NSSet isEqualToSet:](labels, "isEqualToSet:", v9),
            v9,
            (_DWORD)labels))
      {
        properties = self->_properties;
        -[MAElementFilter properties](v5, "properties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSDictionary isEqualToDictionary:](properties, "isEqualToDictionary:", v11);

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

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[KGElementIdentifierSet hash](self->_domains, "hash") + 2654435769u;
  v4 = (-[NSSet hash](self->_labels, "hash") + (v3 << 6) + (v3 >> 2) + 2654435769u) ^ v3;
  return (-[NSDictionary hash](self->_properties, "hash") + (v4 << 6) + (v4 >> 2) + 2654435769u) ^ v4;
}

- (id)filterBySettingProperties:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabels:domains:properties:", self->_labels, self->_domains, v4);

  return v5;
}

- (NSSet)labels
{
  return self->_labels;
}

- (KGElementIdentifierSet)domains
{
  return self->_domains;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

unint64_t __46__MAElementFilter_appendVisualStringToString___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%lu"), a2);
  v3 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count");
  if (v3 < result)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("/"));
  return result;
}

void __35__MAElementFilter_kgOptionalLabels__block_invoke(uint64_t a1, unsigned __int16 a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[MAKGDomainConversion kgLabelForMADomain:](MAKGDomainConversion, "kgLabelForMADomain:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    KGLoggingConnection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_fault_impl(&dword_1CA0A5000, v5, OS_LOG_TYPE_FAULT, "Attempting to filter with invalid domain (%@)", (uint8_t *)&v7, 0xCu);

    }
  }

}

+ (BOOL)scanElementFilterLabels:(id *)a3 domains:(id *)a4 properties:(id *)a5 withScanner:(id)a6
{
  id v10;
  char v11;

  v10 = a6;
  if (objc_msgSend(v10, "scanString:intoString:", CFSTR(":"), 0)
    && objc_msgSend(a1, "scanLabels:withScanner:", a3, v10)
    && objc_msgSend(a1, "scanDomains:withScanner:", a4, v10))
  {
    v11 = objc_msgSend(a1, "scanProperties:withScanner:", a5, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)scanLabels:(id *)a3 withScanner:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v17;
  id v18;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "scanString:intoString:", CFSTR(":"), 0))
  {
    v7 = objc_retainAutorelease(v6);
    v8 = 0;
LABEL_3:
    *a3 = v7;
    v9 = 1;
    goto LABEL_19;
  }
  v18 = 0;
  v10 = objc_msgSend(v5, "scanUpToString:intoString:", CFSTR(":"), &v18);
  v11 = v18;
  v8 = v11;
  if (!v10)
  {
    v9 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v11, "length"))
  {
    v7 = objc_retainAutorelease(v6);
    goto LABEL_3;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v8);
  v13 = 0;
  LOBYTE(v14) = 1;
  do
  {
    if ((v14 & 1) == 0)
    {
      v9 = 0;
      *a3 = objc_retainAutorelease(v6);
      goto LABEL_18;
    }
    v17 = v13;
    v14 = objc_msgSend(v12, "scanUpToString:intoString:", CFSTR("/"), &v17);
    v15 = v17;

    if (v14)
      v14 = objc_msgSend(v15, "length") != 0;
    objc_msgSend(v6, "addObject:", v15);
    v13 = v15;
  }
  while ((objc_msgSend(v12, "scanString:intoString:", CFSTR("/"), 0) & 1) != 0);
  *a3 = objc_retainAutorelease(v6);
  if (v14)
    v9 = objc_msgSend(v5, "scanString:intoString:", CFSTR(":"), 0);
  else
    v9 = 0;
  v13 = v15;
LABEL_18:

LABEL_19:
  return v9;
}

+ (BOOL)scanDomains:(id *)a3 withScanner:(id)a4
{
  id v5;
  KGMutableElementIdentifierSet *v6;
  KGMutableElementIdentifierSet *v7;
  uint64_t v9;

  v5 = a4;
  v6 = objc_alloc_init(KGMutableElementIdentifierSet);
  v9 = 0;
  if (objc_msgSend(v5, "scanUnsignedLongLong:", &v9))
  {
    do
    {
      -[KGMutableElementIdentifierSet addIdentifier:](v6, "addIdentifier:", v9);
      objc_msgSend(v5, "scanString:intoString:", CFSTR("/"), 0);
    }
    while ((objc_msgSend(v5, "scanUnsignedLongLong:", &v9) & 1) != 0);
  }
  v7 = objc_retainAutorelease(v6);
  *a3 = v7;

  return 1;
}

+ (BOOL)scanProperties:(id *)a3 withScanner:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  id v13;
  id v15;
  id v16;

  v6 = a4;
  if (objc_msgSend(v6, "scanString:intoString:", CFSTR("{"), 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("}"), 0) & 1) != 0)
    {
LABEL_3:
      if (a3)
        *a3 = objc_retainAutorelease(v7);
      v8 = 1;
    }
    else
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v10 = objc_msgSend(v6, "scanCharactersFromSet:intoString:", v9, &v16);
        v11 = v16;

        if (!v10 || !objc_msgSend(v6, "scanString:intoString:", CFSTR(":"), 0))
          break;
        v15 = 0;
        v12 = objc_msgSend(a1, "scanPropertyValue:withScanner:", &v15, v6);
        v13 = v15;
        if (!v12)
          goto LABEL_13;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v11);

        if (objc_msgSend(v6, "scanString:intoString:", CFSTR("}"), 0))
          goto LABEL_3;
      }
      v13 = 0;
LABEL_13:

      v8 = 0;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)scanPropertyOption:(id *)a3 withScanner:(id)a4
{
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  double v13;
  id v14;
  uint64_t v15;

  v5 = a4;
  if (objc_msgSend(v5, "scanString:intoString:", CFSTR("'"), 0))
  {
    if ((objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("'"), a3) & 1) != 0
      && objc_msgSend(v5, "scanString:intoString:", CFSTR("'"), 0))
    {
      goto LABEL_19;
    }
  }
  else if (objc_msgSend(v5, "scanString:intoString:", CFSTR("+"), 0))
  {
    v15 = 123456789;
    if (objc_msgSend(v5, "scanInteger:", &v15))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v10 = objc_msgSend(v5, "scanString:intoString:", CFSTR(", "), 0);
      goto LABEL_20;
    }
  }
  else
  {
    v14 = 0;
    v6 = objc_msgSend(v5, "scanUpToString:intoString:", CFSTR(","), &v14);
    v7 = v14;
    v8 = v7;
    if (v6)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v7);
      v15 = 123456789;
      if (objc_msgSend(v9, "scanInteger:", &v15) && objc_msgSend(v9, "isAtEnd"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v8);
        v13 = NAN;
        if (objc_msgSend(v11, "scanDouble:", &v13) && objc_msgSend(v11, "isAtEnd"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      goto LABEL_19;
    }

  }
  v10 = 0;
LABEL_20:

  return v10;
}

+ (BOOL)scanPropertyValue:(id *)a3 withScanner:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  char v11;
  id v13;

  v6 = a4;
  if (!objc_msgSend(v6, "scanString:intoString:", CFSTR("["), 0))
  {
    v11 = objc_msgSend(a1, "scanPropertyOption:withScanner:", a3, v6);
    goto LABEL_12;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = 0;
  while (1)
  {
    v9 = v8;
    v13 = 0;
    v10 = objc_msgSend(a1, "scanPropertyOption:withScanner:", &v13, v6);
    v8 = v13;

    if (!v10 || !v8)
      break;
    objc_msgSend(v7, "addObject:", v8);
LABEL_7:
    if (objc_msgSend(v6, "scanString:intoString:", CFSTR("], "), 0))
    {
      *a3 = objc_retainAutorelease(v7);
      v11 = 1;
      goto LABEL_11;
    }
  }
  if (v10)
    goto LABEL_7;
  v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

+ (BOOL)scanInstance:(id *)a3 withScanner:(id)a4
{
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  id v15;
  id v16;

  v15 = 0;
  v16 = 0;
  v14 = 0;
  v6 = objc_msgSend(a1, "scanElementFilterLabels:domains:properties:withScanner:", &v16, &v15, &v14, a4);
  v7 = v16;
  v8 = v15;
  if (a3 && v6)
  {
    v9 = v14;
    v10 = objc_alloc((Class)a1);
    if (v9)
      v11 = v9;
    else
      v11 = (id)MEMORY[0x1E0C9AA70];
    v12 = (id)objc_msgSend(v10, "initWithLabels:domains:properties:", v7, v8, v11);

    *a3 = v12;
  }

  return v6;
}

+ (id)scanFilterWithScanner:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "scanLocation");
  v11 = 0;
  v6 = objc_msgSend(a1, "scanInstance:withScanner:", &v11, v4);
  v7 = v11;
  v8 = v7;
  if (v6)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v4, "setScanLocation:", v5);
    v9 = 0;
  }

  return v9;
}

+ (id)any
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithLabel:domain:properties:", 0, 0, MEMORY[0x1E0C9AA70]);
}

@end
