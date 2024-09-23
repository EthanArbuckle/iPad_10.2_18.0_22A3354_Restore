@implementation CNChangeHistoryResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryResult)initWithCoder:(id)a3
{
  id v4;
  CNChangeHistoryResult *v5;
  void *v6;
  uint64_t v7;
  CNChangeHistoryAnchor *latestChangeAnchor;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *contactChanges;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *groupChanges;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *labeledValueChanges;
  CNChangeHistoryResult *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNChangeHistoryResult;
  v5 = -[CNChangeHistoryResult init](&v29, sel_init);
  if (v5)
  {
    v5->_changesTruncated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_changesTruncated"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_latestChangeAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    latestChangeAnchor = v5->_latestChangeAnchor;
    v5->_latestChangeAnchor = (CNChangeHistoryAnchor *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_contactChanges"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    contactChanges = v5->_contactChanges;
    v5->_contactChanges = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_groupChanges"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    groupChanges = v5->_groupChanges;
    v5->_groupChanges = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("_labeledValueChanges"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    labeledValueChanges = v5->_labeledValueChanges;
    v5->_labeledValueChanges = (NSArray *)v25;

    v5->_unifyResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_unifyResults"));
    v5->_changesCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_changesCount"));
    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 changesTruncated;
  id v5;

  changesTruncated = self->_changesTruncated;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", changesTruncated, CFSTR("_changesTruncated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestChangeAnchor, CFSTR("_latestChangeAnchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactChanges, CFSTR("_contactChanges"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupChanges, CFSTR("_groupChanges"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labeledValueChanges, CFSTR("_labeledValueChanges"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_unifyResults, CFSTR("_unifyResults"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changesCount, CFSTR("_changesCount"));

}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryResult changesTruncated](self, "changesTruncated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("changesTruncated"), v4);

  -[CNChangeHistoryResult latestChangeAnchor](self, "latestChangeAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("latestChangeAnchor"), v6);

  -[CNChangeHistoryResult contactChanges](self, "contactChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactChanges"), v8);

  -[CNChangeHistoryResult groupChanges](self, "groupChanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("groupChanges"), v10);

  -[CNChangeHistoryResult labeledValueChanges](self, "labeledValueChanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("labeledValueChanges"), v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNChangeHistoryResult unifyResults](self, "unifyResults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("unifyResults"), v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNChangeHistoryResult changesCount](self, "changesCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("changesCount"), v16);

  objc_msgSend(v3, "build");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)enumerateContactChangesWithKeysToFetch:(id)a3 fromContactStore:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v9;
  void *v10;

  v9 = a6;
  -[CNChangeHistoryResult contactChangesEnumeratorWithKeysToFetch:contactStore:](self, "contactChangesEnumeratorWithKeysToFetch:contactStore:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[CNChangeHistoryResult enumerateEnumerator:usingBlock:]((uint64_t)CNChangeHistoryResult, v10, v9);

  return (char)a3;
}

+ (uint64_t)enumerateEnumerator:(void *)a3 usingBlock:
{
  id v4;
  void (**v5)(id, _QWORD, char *);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v5[2](v5, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), &v17);
        if (v17)
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (id)contactChangesEnumeratorWithKeysToFetch:(id)a3 contactStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CNChangeHistoryResult contactChanges](self, "contactChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNChangeHistoryLegacyResultEnumerator contactEnumeratorWithChanges:keysToFetch:unifyResults:contactStore:](CNChangeHistoryLegacyResultEnumerator, "contactEnumeratorWithChanges:keysToFetch:unifyResults:contactStore:", v8, v7, -[CNChangeHistoryResult unifyResults](self, "unifyResults"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)enumerateGroupChangesFromContactStore:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  -[CNChangeHistoryResult groupChangesEnumeratorWithContactStore:](self, "groupChangesEnumeratorWithContactStore:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = +[CNChangeHistoryResult enumerateEnumerator:usingBlock:]((uint64_t)CNChangeHistoryResult, v8, v7);

  return (char)self;
}

- (id)groupChangesEnumeratorWithContactStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNChangeHistoryResult groupChanges](self, "groupChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNChangeHistoryLegacyResultEnumerator groupEnumeratorWithChanges:contactStore:](CNChangeHistoryLegacyResultEnumerator, "groupEnumeratorWithChanges:contactStore:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)labeledValueChangesEnumeratorWithContactStore:(id)a3
{
  void *v3;
  void *v4;

  -[CNChangeHistoryResult labeledValueChanges](self, "labeledValueChanges", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)changesTruncated
{
  return self->_changesTruncated;
}

- (void)setChangesTruncated:(BOOL)a3
{
  self->_changesTruncated = a3;
}

- (CNChangeHistoryAnchor)latestChangeAnchor
{
  return self->_latestChangeAnchor;
}

- (void)setLatestChangeAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_latestChangeAnchor, a3);
}

- (NSArray)contactChanges
{
  return self->_contactChanges;
}

- (void)setContactChanges:(id)a3
{
  objc_storeStrong((id *)&self->_contactChanges, a3);
}

- (NSArray)groupChanges
{
  return self->_groupChanges;
}

- (void)setGroupChanges:(id)a3
{
  objc_storeStrong((id *)&self->_groupChanges, a3);
}

- (NSArray)labeledValueChanges
{
  return self->_labeledValueChanges;
}

- (void)setLabeledValueChanges:(id)a3
{
  objc_storeStrong((id *)&self->_labeledValueChanges, a3);
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (BOOL)unifyResults
{
  return self->_unifyResults;
}

- (void)setUnifyResults:(BOOL)a3
{
  self->_unifyResults = a3;
}

- (int64_t)changesCount
{
  return self->_changesCount;
}

- (void)setChangesCount:(int64_t)a3
{
  self->_changesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_labeledValueChanges, 0);
  objc_storeStrong((id *)&self->_groupChanges, 0);
  objc_storeStrong((id *)&self->_contactChanges, 0);
  objc_storeStrong((id *)&self->_latestChangeAnchor, 0);
}

@end
