@implementation ICActivityStreamSelection

- (ICActivityStreamSelection)initWithItemIDs:(id)a3 filter:(id)a4 displayDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICActivityStreamSelection *v12;
  ICActivityStreamSelection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICActivityStreamSelection;
  v12 = -[ICActivityStreamSelection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemIDs, a3);
    objc_storeStrong((id *)&v13->_filter, a4);
    objc_storeStrong((id *)&v13->_displayDate, a5);
  }

  return v13;
}

- (ICActivityStreamSelection)initWithFilter:(id)a3 displayDate:(id)a4
{
  return -[ICActivityStreamSelection initWithItemIDs:filter:displayDate:](self, "initWithItemIDs:filter:displayDate:", 0, a3, a4);
}

- (ICActivityStreamSelection)initWithMentions:(id)a3
{
  ICActivityStreamSelection *v4;

  -[ICActivityStreamSelection objc_initWithMentions:](self, "objc_initWithMentions:", a3);
  v4 = (ICActivityStreamSelection *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICActivityStreamSelection itemIDs](self, "itemIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICActivityStreamSelection filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICActivityStreamSelection displayDate](self, "displayDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, itemIDs: %@, filter: %@, displayDate: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  int v15;
  void *v16;
  void *v17;
  char v18;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICActivityStreamSelection itemIDs](self, "itemIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v6)
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;
    if (v8 == v7)
      v11 = 0;
    else
      v11 = v7;
    v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10)
        v14 = v12 == 0;
      else
        v14 = 1;
      if (v14)
        goto LABEL_17;
      v15 = objc_msgSend((id)v10, "isEqual:", v12);

      if (!v15)
      {
        v18 = 0;
        goto LABEL_19;
      }
    }
    objc_msgSend(v5, "filter");
    v10 = objc_claimAutoreleasedReturnValue();
    -[ICActivityStreamSelection filter](self, "filter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v10, "isEqual:", v13))
    {
      objc_msgSend(v5, "displayDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICActivityStreamSelection displayDate](self, "displayDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

LABEL_18:
LABEL_19:

      return v18;
    }
LABEL_17:
    v18 = 0;
    goto LABEL_18;
  }
  return 1;
}

- (unint64_t)hash
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[ICActivityStreamSelection itemIDs](self, "itemIDs");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v6 += ICHashWithObject(*(void **)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  -[ICActivityStreamSelection filter](self, "filter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[ICActivityStreamSelection displayDate](self, "displayDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hash");
  v22 = ICHashWithHashKeys(v6, v15, v16, v17, v18, v19, v20, v21, v13);

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICActivityStreamSelection *v4;
  void *v5;
  void *v6;
  void *v7;
  ICActivityStreamSelection *v8;

  v4 = +[ICActivityStreamSelection allocWithZone:](ICActivityStreamSelection, "allocWithZone:", a3);
  -[ICActivityStreamSelection itemIDs](self, "itemIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICActivityStreamSelection filter](self, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICActivityStreamSelection displayDate](self, "displayDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICActivityStreamSelection initWithItemIDs:filter:displayDate:](v4, "initWithItemIDs:filter:displayDate:", v5, v6, v7);

  return v8;
}

- (NSSet)itemIDs
{
  return self->_itemIDs;
}

- (void)setItemIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ICTTTextEditFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (void)setDisplayDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

- (id)objc_initWithMentions:(id)a3
{
  unint64_t v3;

  sub_1AC7C3570(0, &qword_1EECA2B18);
  v3 = sub_1ACA42228();
  return ICActivityStreamSelection.init(mentions:)(v3);
}

+ (id)objc_selectionFromData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  v3 = a3;
  v4 = sub_1ACA3F840();
  v6 = v5;

  v7 = _sSo25ICActivityStreamSelectionC7NotesUIE4from4dataABSg10Foundation4DataV_tFZ_0();
  sub_1AC921E84(v4, v6);
  return v7;
}

- (id)objc_encodedData
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  ICActivityStreamSelection *v6;
  ICActivityStreamSelection *v7;
  NSSet *v8;
  NSSet *v9;
  uint64_t v10;
  ICTTTextEditFilter *v11;
  NSDate *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v18;

  v3 = type metadata accessor for ICActivityStreamSelection.Model();
  MEMORY[0x1E0C80A78](v3);
  v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1ACA3F3A8();
  swift_allocObject();
  v6 = self;
  sub_1ACA3F39C();
  v7 = v6;
  v8 = -[ICActivityStreamSelection itemIDs](v7, sel_itemIDs);
  if (v8)
  {
    v9 = v8;
    v10 = sub_1ACA42348();

  }
  else
  {
    v10 = 0;
  }
  *v5 = v10;
  v11 = -[ICActivityStreamSelection filter](v7, sel_filter);
  sub_1ACA42570();
  v12 = -[ICActivityStreamSelection displayDate](v7, sel_displayDate);
  sub_1ACA3F990();

  sub_1AC7C3B88(&qword_1EECA4DB0, (uint64_t (*)(uint64_t))type metadata accessor for ICActivityStreamSelection.Model, (uint64_t)&protocol conformance descriptor for ICActivityStreamSelection.Model);
  v13 = sub_1ACA3F390();
  v15 = v14;
  sub_1ACA016F0((uint64_t)v5);

  swift_release();
  v16 = (void *)sub_1ACA3F834();
  sub_1AC921E84(v13, v15);
  return v16;
}

@end
