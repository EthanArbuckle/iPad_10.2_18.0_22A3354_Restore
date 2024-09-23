@implementation GDPersonViewPerson

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  unsigned int isFavorite;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_entityIdentifier(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nameComponents(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v8;
  if (v8)
    v12 = (const __CFString *)v8;
  else
    v12 = &stru_1E5DDB0B8;
  objc_msgSend_dateOfBirth(self, v9, v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v13;
  if (v13)
    v17 = (const __CFString *)v13;
  else
    v17 = &stru_1E5DDB0B8;
  objc_msgSend_names(self, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v18, v19, (uint64_t)CFSTR("|"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  isFavorite = objc_msgSend_isFavorite(self, v21, v22);
  v26 = objc_msgSend_type(self, v24, v25);
  objc_msgSend_stringWithFormat_(v4, v27, (uint64_t)CFSTR("<GDPersonViewPerson %@, %@, dob:%@, ns:%@, f:%d, t:%td>"), v5, v12, v17, v20, isFavorite, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end
