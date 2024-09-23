@implementation HFRoomBuilderItem

- (HFRoomBuilderItem)initWithRoomBuilder:(id)a3
{
  id v6;
  HFRoomBuilderItem *v7;
  HFRoomBuilderItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFRoomBuilderItem.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("roomBuilder"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HFRoomBuilderItem;
  v7 = -[HFRoomBuilderItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_roomBuilder, a3);

  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFMutableItemUpdateOutcome *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  -[HFRoomBuilderItem roomBuilder](self, "roomBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFRoomBuilderItem roomBuilder](self, "roomBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v8;
  if (v6)
  {
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, CFSTR("title"));
  }
  else
  {
    HFLocalizedStringWithFormat(CFSTR("HFRoomSuggestionNameFormat"), CFSTR("%@"), v9, v10, v11, v12, v13, v14, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, CFSTR("title"));

  }
  -[HFRoomBuilderItem roomBuilder](self, "roomBuilder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, CFSTR("roomBuilder"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HFRoomBuilder)roomBuilder
{
  return self->_roomBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomBuilder, 0);
}

@end
