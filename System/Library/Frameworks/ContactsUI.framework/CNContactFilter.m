@implementation CNContactFilter

- (NSString)fullTextString
{
  NSString *v3;

  v3 = -[NSString length](self->_fullTextString, "length");
  if (v3)
    v3 = self->_fullTextString;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullTextString, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CNContactFilter fullTextString](self, "fullTextString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFullTextString:", v5);

  return v4;
}

- (void)setFullTextString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[CNContactFilter fullTextString](self, "fullTextString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "fullTextString"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CNContactFilter fullTextString](self, "fullTextString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fullTextString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (CNContactFilter)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  CNContactFilter *v5;
  void *v6;
  uint64_t v7;
  NSString *fullTextString;

  v4 = a3;
  v5 = -[CNContactFilter init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CNContactFilterDictionaryKeyFullTextString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    fullTextString = v5->_fullTextString;
    v5->_fullTextString = (NSString *)v7;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[CNContactFilter fullTextString](self, "fullTextString");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6 = CFSTR("CNContactFilterDictionaryKeyFullTextString");
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> fullTextString: %@"), objc_opt_class(), self, self->_fullTextString);
}

- (BOOL)supportsSections
{
  void *v2;
  BOOL v3;

  -[CNContactFilter fullTextString](self, "fullTextString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSPredicate)predicate
{
  void *v2;
  void *v3;

  -[CNContactFilter fullTextString](self, "fullTextString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K BEGINSWITH[cd] %@) OR (%K BEGINSWITH[cd] %@) OR (%K BEGINSWITH[cd] %@)"), *MEMORY[0x1E0C966D0], v2, *MEMORY[0x1E0C966C0], v2, *MEMORY[0x1E0C967B8], v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSPredicate *)v3;
}

- (BOOL)rankSortedResults
{
  return self->_rankSortedResults;
}

- (void)setRankSortedResults:(BOOL)a3
{
  self->_rankSortedResults = a3;
}

@end
