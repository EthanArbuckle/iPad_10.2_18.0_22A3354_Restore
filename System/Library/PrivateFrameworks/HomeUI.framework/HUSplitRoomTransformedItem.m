@implementation HUSplitRoomTransformedItem

- (HUSplitRoomTransformedItem)initWithSourceItem:(id)a3 room:(id)a4
{
  id v7;
  HUSplitRoomTransformedItem *v8;
  HUSplitRoomTransformedItem *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUSplitRoomTransformedItem;
  v8 = -[HFTransformItem initWithSourceItem:resultKeyExclusionFilter:](&v11, sel_initWithSourceItem_resultKeyExclusionFilter_, a3, MEMORY[0x1E0C9AA60]);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_room, a4);

  return v9;
}

- (id)updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  HUSplitRoomTransformedItem *v13;
  objc_super v14;

  v4 = a3;
  -[HUSplitRoomTransformedItem room](self, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)HUSplitRoomTransformedItem;
  -[HUSplitRoomTransformedItem updateWithOptions:](&v14, sel_updateWithOptions_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__HUSplitRoomTransformedItem_updateWithOptions___block_invoke;
  v11[3] = &unk_1E6F57690;
  v12 = v6;
  v13 = self;
  v8 = v6;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __48__HUSplitRoomTransformedItem_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0D30E48]);
  objc_msgSend(*(id *)(a1 + 40), "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30E10]);

  v7 = (void *)MEMORY[0x1E0D519C0];
  v8 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_3_7 != -1)
    dispatch_once(&_MergedGlobals_3_7, &__block_literal_global_65_0);
  return (NAIdentity *)(id)qword_1EF226B18;
}

void __41__HUSplitRoomTransformedItem_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_70_0);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_71_0);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1EF226B18;
  qword_1EF226B18 = v3;

}

uint64_t __41__HUSplitRoomTransformedItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "room");
}

uint64_t __41__HUSplitRoomTransformedItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sourceItem");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[HFTransformItem sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "copyWithZone:", a3);
LABEL_5:
    v7 = (void *)v6;

    v5 = v7;
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "copy");
    goto LABEL_5;
  }
LABEL_6:
  v8 = objc_alloc((Class)objc_opt_class());
  -[HUSplitRoomTransformedItem room](self, "room");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithSourceItem:room:", v5, v9);

  objc_msgSend(v10, "copyLatestResultsFromItem:", self);
  return v10;
}

- (id)_descriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSplitRoomTransformedItem room](self, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("room"));

  -[HFTransformItem sourceItem](self, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("sourceItem"));

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "hasInternalDiagnostics") & 1) != 0)
  {
    -[HUSplitRoomTransformedItem _descriptionBuilder](self, "_descriptionBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "build");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (HMRoom)room
{
  return self->_room;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_room, 0);
}

@end
