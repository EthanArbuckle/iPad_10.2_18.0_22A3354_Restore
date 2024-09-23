@implementation GDPersonNameComponents

- (id)description
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  __CFString *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  __CFString *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;

  v41 = (id)MEMORY[0x1E0CB3940];
  objc_msgSend_prefixes(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_prefixes(self, v4, v5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v40, v7, (uint64_t)CFSTR("|"));
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = &stru_1E5DDB0B8;
  }
  objc_msgSend_givenNames(self, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_givenNames(self, v8, v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v39, v11, (uint64_t)CFSTR("|"));
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = &stru_1E5DDB0B8;
  }
  objc_msgSend_middleNames(self, v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_middleNames(self, v12, v13);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v38, v15, (uint64_t)CFSTR("|"));
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = &stru_1E5DDB0B8;
  }
  objc_msgSend_familyNames(self, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend_familyNames(self, v16, v17);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v37, v19, (uint64_t)CFSTR("|"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = &stru_1E5DDB0B8;
  }
  objc_msgSend_suffixes(self, v16, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend_suffixes(self, v21, v22);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v36, v24, (uint64_t)CFSTR("|"));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = &stru_1E5DDB0B8;
  }
  objc_msgSend_nicknames(self, v21, v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_msgSend_nicknames(self, v26, v27);
    v29 = v10;
    v30 = v6;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v31, v32, (uint64_t)CFSTR("|"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v41, v34, (uint64_t)CFSTR("<GDPersonNameComponents p:%@ g:%@ m:%@ f:%@ s:%@ n:%@>"), v45, v44, v43, v20, v25, v33);
    v42 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v30;
    v10 = v29;
  }
  else
  {
    objc_msgSend_stringWithFormat_(v41, v26, (uint64_t)CFSTR("<GDPersonNameComponents p:%@ g:%@ m:%@ f:%@ s:%@ n:%@>"), v45, v44, v43, v20, v25, &stru_1E5DDB0B8);
    v42 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v23)
  {

  }
  if (v18)
  {

  }
  if (v14)
  {

  }
  if (v10)
  {

  }
  if (v6)
  {

  }
  return v42;
}

- (GDPersonNameComponents)initWithNameComponentsBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  GDPersonNameComponents *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *prefixes;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *givenNames;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *middleNames;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSArray *familyNames;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSArray *suffixes;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  NSArray *nicknames;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)GDPersonNameComponents;
  v7 = -[GDPersonNameComponents init](&v49, sel_init);
  if (v7)
  {
    objc_msgSend_prefixes(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_copy(v8, v9, v10);
    prefixes = v7->_prefixes;
    v7->_prefixes = (NSArray *)v11;

    objc_msgSend_givenNames(v4, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_copy(v15, v16, v17);
    givenNames = v7->_givenNames;
    v7->_givenNames = (NSArray *)v18;

    objc_msgSend_middleNames(v4, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_copy(v22, v23, v24);
    middleNames = v7->_middleNames;
    v7->_middleNames = (NSArray *)v25;

    objc_msgSend_familyNames(v4, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_copy(v29, v30, v31);
    familyNames = v7->_familyNames;
    v7->_familyNames = (NSArray *)v32;

    objc_msgSend_suffixes(v4, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_copy(v36, v37, v38);
    suffixes = v7->_suffixes;
    v7->_suffixes = (NSArray *)v39;

    objc_msgSend_nicknames(v4, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend_copy(v43, v44, v45);
    nicknames = v7->_nicknames;
    v7->_nicknames = (NSArray *)v46;

  }
  return v7;
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (NSArray)givenNames
{
  return self->_givenNames;
}

- (NSArray)middleNames
{
  return self->_middleNames;
}

- (NSArray)familyNames
{
  return self->_familyNames;
}

- (NSArray)suffixes
{
  return self->_suffixes;
}

- (NSArray)nicknames
{
  return self->_nicknames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknames, 0);
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_familyNames, 0);
  objc_storeStrong((id *)&self->_middleNames, 0);
  objc_storeStrong((id *)&self->_givenNames, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
}

@end
