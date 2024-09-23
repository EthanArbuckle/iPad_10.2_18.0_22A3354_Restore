@implementation GDVisualIdentifierViewLocation

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const char *v12;
  __CFString *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_entityIdentifier(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_names(self, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &stru_1E5DDB0B8;
  if (v10)
  {
    objc_msgSend_names(self, v8, v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v35, v12, (uint64_t)CFSTR("|"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_1E5DDB0B8;
  }
  objc_msgSend_label(self, v8, v9);
  v14 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v14;
  if (v14)
    v11 = (const __CFString *)v14;
  objc_msgSend_addresses(self, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_count(v18, v19, v20);
  objc_msgSend_addresses(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v24;
  if (v21 == 1)
  {
    objc_msgSend_firstObject(v24, v25, v26);
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v32 = (void *)v28;
    objc_msgSend_stringWithFormat_(v4, v29, (uint64_t)CFSTR("<GDVisualIdentifierViewLocation id:%@ n:%@ l:%@ a:%@>"), v5, v13, v11, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (objc_msgSend_count(v24, v25, v26))
  {
    objc_msgSend_addresses(self, v30, v31);
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend_stringWithFormat_(v4, v30, (uint64_t)CFSTR("<GDVisualIdentifierViewLocation id:%@ n:%@ l:%@ a:%@>"), v5, v13, v11, &stru_1E5DDB0B8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  if (v10)
  {

  }
  return v33;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
