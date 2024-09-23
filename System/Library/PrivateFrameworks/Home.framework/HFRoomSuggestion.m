@implementation HFRoomSuggestion

+ (id)suggestionWithName:(id)a3 priority:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggestionWithName:priority:aliases:", v7, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)suggestionWithName:(id)a3 priority:(int64_t)a4 aliases:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a5;
  v8 = a3;
  v9 = (_QWORD *)objc_opt_new();
  v10 = objc_msgSend(v8, "copy");

  v11 = (void *)v9[1];
  v9[1] = v10;

  v9[3] = a4;
  if (v7)
  {
    v12 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v9[2];
  v9[2] = v12;

  return v9;
}

+ (id)priorityComparator
{
  return &__block_literal_global_149;
}

uint64_t __38__HFRoomSuggestion_priorityComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a3, "priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "priority");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSSet)aliases
{
  return self->_aliases;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
