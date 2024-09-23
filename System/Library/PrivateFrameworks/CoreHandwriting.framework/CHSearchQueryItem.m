@implementation CHSearchQueryItem

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CHSearchQueryItem;
  -[CHSearchQueryItem description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v10, (uint64_t)CFSTR(" strokeIdentifiers: %@"), v11, v12, v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqualToSearchQueryItem:(id)a3
{
  CHSearchQueryItem *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isEqual;
  int v18;
  CHSearchQueryItem *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (CHSearchQueryItem *)a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v10 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v18 = 138412290;
        v19 = v4;
        _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_FAULT, "item should be of class CHSearchQueryItem: %@", (uint8_t *)&v18, 0xCu);
      }

    }
    if (v4 == self)
    {
      isEqual = 1;
    }
    else
    {
      objc_msgSend_strokeIdentifiers(v4, v5, v6, v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v11, v12, (uint64_t)self->_strokeIdentifiers, v13, v14, v15);

    }
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToSearchQueryItem;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToSearchQueryItem = objc_msgSend_isEqualToSearchQueryItem_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToSearchQueryItem;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_hash(self->_strokeIdentifiers, a2, v2, v3, v4, v5);
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end
