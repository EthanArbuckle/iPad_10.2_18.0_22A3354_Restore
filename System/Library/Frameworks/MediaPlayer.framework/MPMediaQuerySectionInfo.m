@implementation MPMediaQuerySectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (unint64_t)count
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[NSArray lastObject](self->_sections, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "range");
    v6 = v4 + v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setSectionIndexTitles:(id)a3
{
  NSArray *v4;
  NSArray *sectionIndexTitles;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;
  id v11;

  v11 = a3;
  v4 = (NSArray *)objc_msgSend(v11, "copy");
  sectionIndexTitles = self->_sectionIndexTitles;
  self->_sectionIndexTitles = v4;

  -[NSArray lastObject](self->_sections, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sectionIndexTitleIndex");
  if (v7 == objc_msgSend(v11, "count") - 1 && (objc_msgSend(v6, "range"), v8))
  {
    self->_hasUnknownSection = 1;
    v9 = (NSArray *)objc_msgSend(v11, "copy");
  }
  else
  {
    self->_hasUnknownSection = 0;
    objc_msgSend(v11, "subarrayWithRange:", 0, objc_msgSend(v11, "count") - 1);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v10 = self->_sectionIndexTitles;
  self->_sectionIndexTitles = v9;

}

- (NSArray)sections
{
  return self->_sections;
}

- (NSArray)sectionIndexTitles
{
  return self->_sectionIndexTitles;
}

- (id)description
{
  return -[NSArray description](self->_sections, "description");
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPMediaQuerySectionInfo *v4;
  uint64_t v5;
  NSArray *sections;
  uint64_t v7;
  NSArray *sectionIndexTitles;

  v4 = objc_alloc_init(MPMediaQuerySectionInfo);
  v5 = -[NSArray copy](self->_sections, "copy");
  sections = v4->_sections;
  v4->_sections = (NSArray *)v5;

  v7 = -[NSArray copy](self->_sectionIndexTitles, "copy");
  sectionIndexTitles = v4->_sectionIndexTitles;
  v4->_sectionIndexTitles = (NSArray *)v7;

  return v4;
}

- (MPMediaQuerySectionInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSArray *sections;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t i;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("MPSections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v26 = v8;
      sections = v8;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](sections, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v33;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(sections);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          if (v11 == ++v13)
          {
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](sections, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            if (v11)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        v14 = sections;
        sections = self->_sections;
        self->_sections = v14;
      }

      v8 = v26;
    }
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("MPSectionIndexTitles"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_25;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v20)
    {
      v21 = v20;
      v27 = v8;
      v22 = *(_QWORD *)v29;
      v23 = 1;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          objc_opt_class();
          v23 &= objc_opt_isKindOfClass();
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v21);

      v8 = v27;
      if ((v23 & 1) == 0)
        goto LABEL_25;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_sectionIndexTitles, v18);
LABEL_25:

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_sections, CFSTR("MPSections"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_sectionIndexTitles, CFSTR("MPSectionIndexTitles"));
  }

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MPMediaQueryMutableSectionInfo *v4;
  uint64_t v5;
  NSArray *sections;
  uint64_t v7;
  NSArray *sectionIndexTitles;

  v4 = objc_alloc_init(MPMediaQueryMutableSectionInfo);
  v5 = -[NSArray mutableCopy](self->_sections, "mutableCopy");
  sections = v4->super._sections;
  v4->super._sections = (NSArray *)v5;

  v7 = -[NSArray copy](self->_sectionIndexTitles, "copy");
  sectionIndexTitles = v4->super._sectionIndexTitles;
  v4->super._sectionIndexTitles = (NSArray *)v7;

  return v4;
}

- (unint64_t)indexOfSectionForSectionIndexTitleAtIndex:(unint64_t)a3
{
  NSUInteger v5;
  NSArray *sections;
  unint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = -[NSArray count](self->_sectionIndexTitles, "count") - 1;
  sections = self->_sections;
  if (v5 == a3)
  {
    v7 = -[NSArray count](sections, "count") - 1;
    v11[3] = v7;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__MPMediaQuerySectionInfo_indexOfSectionForSectionIndexTitleAtIndex___block_invoke;
    v9[3] = &unk_1E31585C0;
    v9[4] = &v10;
    v9[5] = a3;
    -[NSArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", v9);
    v7 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)hasUnknownSection
{
  return self->_hasUnknownSection;
}

- (void)setHasUnknownSection:(BOOL)a3
{
  self->_hasUnknownSection = a3;
}

unint64_t __69__MPMediaQuerySectionInfo_indexOfSectionForSectionIndexTitleAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t result;
  unint64_t v8;

  result = objc_msgSend(a2, "sectionIndexTitleIndex");
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (result != v8)
    {
      if (result <= v8)
        return result;
      --a3;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
