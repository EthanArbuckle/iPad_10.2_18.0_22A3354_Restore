@implementation MADVITextLookupResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVITextLookupResult)initWithSearchSections:(id)a3
{
  id v5;
  MADVITextLookupResult *v6;
  MADVITextLookupResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVITextLookupResult;
  v6 = -[MADResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchSections, a3);

  return v7;
}

- (MADVITextLookupResult)initWithCoder:(id)a3
{
  id v4;
  MADVITextLookupResult *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *searchSections;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADVITextLookupResult;
  v5 = -[MADResult initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v7 = (void *)getSFResultSectionClass_softClass;
    v19 = getSFResultSectionClass_softClass;
    if (!getSFResultSectionClass_softClass)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getSFResultSectionClass_block_invoke;
      v15[3] = &unk_1E97E2300;
      v15[4] = &v16;
      __getSFResultSectionClass_block_invoke((uint64_t)v15);
      v7 = (void *)v17[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v16, 8);
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("SearchSections"));
    v11 = objc_claimAutoreleasedReturnValue();
    searchSections = v5->_searchSections;
    v5->_searchSections = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVITextLookupResult;
  v4 = a3;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchSections, CFSTR("SearchSections"), v5.receiver, v5.super_class);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  int v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MADVITextLookupResult *v33;
  void *context;
  unint64_t v35;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("searchSections:\n"));
  if (-[NSArray count](self->_searchSections, "count"))
  {
    v6 = 0;
    v33 = self;
    do
    {
      context = (void *)MEMORY[0x1D825F3AC]();
      v35 = v6;
      -[NSArray objectAtIndexedSubscript:](self->_searchSections, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("<results:["));
      objc_msgSend(v7, "results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v10 = 0;
        do
        {
          v11 = (void *)MEMORY[0x1D825F3AC]();
          objc_msgSend(v7, "results");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "description");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v14);

          objc_msgSend(v7, "results");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "title");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "text");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("(title: %@)"), v18);

          objc_msgSend(v7, "results");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count") - 1;

          if (v10 < v20)
            objc_msgSend(v3, "appendFormat:", CFSTR(", "));
          objc_autoreleasePoolPop(v11);
          ++v10;
          objc_msgSend(v7, "results");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

        }
        while (v10 < v22);
      }
      objc_msgSend(v3, "appendFormat:", CFSTR("] "));
      objc_msgSend(v3, "appendFormat:", CFSTR("maxInitiallyVisibleResults:%lu "), objc_msgSend(v7, "maxInitiallyVisibleResults"));
      v23 = objc_msgSend(v7, "isInitiallyHidden");
      v24 = CFSTR("NO");
      if (v23)
        v24 = CFSTR("YES");
      objc_msgSend(v3, "appendFormat:", CFSTR("isInitiallyHidden:%@ "), v24);
      objc_msgSend(v7, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("identifier:%@ "), v25);

      objc_msgSend(v7, "bundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("bundleIdentifier:%@ "), v26);

      objc_msgSend(v7, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("title:%@ "), v27);

      objc_msgSend(v7, "moreText");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("moreText:%@ "), v28);

      objc_msgSend(v7, "button");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "description");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("button:%@ "), v30);

      objc_msgSend(v7, "rankingScore");
      objc_msgSend(v3, "appendFormat:", CFSTR("rankingScore:%lf>"), v31);
      self = v33;
      if (v35 < -[NSArray count](v33->_searchSections, "count") - 1)
        objc_msgSend(v3, "appendFormat:", CFSTR(",\n"));

      objc_autoreleasePoolPop(context);
      v6 = v35 + 1;
    }
    while (v35 + 1 < -[NSArray count](v33->_searchSections, "count"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSArray)searchSections
{
  return self->_searchSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSections, 0);
}

@end
