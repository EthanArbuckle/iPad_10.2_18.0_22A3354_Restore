@implementation WFContentSortDescriptor

- (WFContentSortDescriptor)initWithProperty:(id)a3 ascending:(BOOL)a4 comparator:(id)a5
{
  id v10;
  id v11;
  WFContentSortDescriptor *v12;
  WFContentSortDescriptor *v13;
  uint64_t v14;
  id comparator;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  if (v10 && (objc_msgSend(v10, "isSortable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentSortDescriptor.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!property || property.sortable"));

  }
  v18.receiver = self;
  v18.super_class = (Class)WFContentSortDescriptor;
  v12 = -[WFContentSortDescriptor init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_property, a3);
    v13->_ascending = a4;
    v14 = objc_msgSend(v11, "copy");
    comparator = v13->_comparator;
    v13->_comparator = (id)v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentSortDescriptor property](self, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFContentSortDescriptor ascending](self, "ascending"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[WFContentSortDescriptor comparator](self, "comparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[WFContentSortDescriptor comparator](self, "comparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = _Block_copy(v10);
    objc_msgSend(v9, "stringWithFormat:", CFSTR(", comparator: %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, property: %@, ascending: %@%@>"), v5, self, v6, v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, property: %@, ascending: %@%@>"), v5, self, v6, v7, &stru_24C4E3948);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (NSSet)containedProperties
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[WFContentSortDescriptor property](self, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (WFContentProperty)property
{
  return self->_property;
}

- (id)comparator
{
  return self->_comparator;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

+ (id)sortDescriptorWithProperty:(id)a3 ascending:(BOOL)a4 comparator:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperty:ascending:comparator:", v9, v5, v8);

  return v10;
}

+ (id)randomSortDescriptor
{
  if (randomSortDescriptor_onceToken != -1)
    dispatch_once(&randomSortDescriptor_onceToken, &__block_literal_global_20260);
  return (id)randomSortDescriptor_randomSortDescriptor;
}

void __47__WFContentSortDescriptor_randomSortDescriptor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[WFContentSortDescriptor sortDescriptorWithProperty:ascending:comparator:](WFContentSortDescriptor, "sortDescriptorWithProperty:ascending:comparator:", 0, 1, &__block_literal_global_7_20262);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)randomSortDescriptor_randomSortDescriptor;
  randomSortDescriptor_randomSortDescriptor = v0;

}

uint64_t __47__WFContentSortDescriptor_randomSortDescriptor__block_invoke_2()
{
  return 0;
}

@end
