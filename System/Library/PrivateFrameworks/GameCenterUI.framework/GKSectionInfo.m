@implementation GKSectionInfo

- (id)description
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t section;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  NSString *title;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  -[GKSectionInfo items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)MEMORY[0x1E0CB3940];
  v24.receiver = self;
  v24.super_class = (Class)GKSectionInfo;
  -[GKSectionInfo description](&v24, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  section = self->_section;
  v23 = v6;
  if (section == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = &stru_1E59EB978;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_section);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)v11;
    objc_msgSend(v10, "stringWithFormat:", CFSTR(" %@: %@"), v11, v21);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  title = self->_title;
  if (title)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR(" %@: %@"), v2, self->_title);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_6;
  }
  else
  {
    v14 = &stru_1E59EB978;
    if (v5)
    {
LABEL_6:
      v15 = (void *)MEMORY[0x1E0CB3940];
      _gkBeautifyVariableName();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR(" %@: %@"), v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@%@%@%@"), v7, v9, v14, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!title)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@%@%@%@"), v7, v9, v14, &stru_1E59EB978);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (title)
  {
LABEL_7:

  }
LABEL_8:
  if (section != 0x7FFFFFFFFFFFFFFFLL)
  {

  }
  return v19;
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptors, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
