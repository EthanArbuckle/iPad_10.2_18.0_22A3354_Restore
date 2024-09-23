@implementation HUServiceDetailsRoomItem

- (HUServiceDetailsRoomItem)initWithSourceServiceItem:(id)a3 home:(id)a4 serviceLikeBuilder:(id)a5
{
  id v9;
  HUServiceDetailsRoomItem *v10;
  HUServiceDetailsRoomItem *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUServiceDetailsRoomItem;
  v10 = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](&v13, sel_initWithSourceServiceItem_home_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_serviceLikeBuilder, a5);

  return v11;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKitObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "services");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v10 = 0;
      goto LABEL_9;
    }
    v7 = (void *)MEMORY[0x1E0CBA7E0];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_roomsForServices:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_7:
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "hf_parentRoom");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = (void *)v12;
    objc_msgSend(v11, "na_setWithSafeObject:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "room");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "room");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "na_setWithSafeObject:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;

LABEL_9:
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D30B80];
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B80]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v10)
    objc_msgSend(v18, "unionSet:", v10);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v16);
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRoomTitle"), CFSTR("HUServiceDetailsRoomTitle"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30D18]);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccessoryDetails.Room"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30BA0]);

  -[HUServiceDetailsRoomItem serviceLikeBuilder](self, "serviceLikeBuilder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "room");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 && objc_msgSend(v23, "length"))
  {
    objc_msgSend(v13, "na_safeSetObject:forKey:", v23, *MEMORY[0x1E0D30BF8]);
  }
  else if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "anyObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");

    objc_msgSend(v13, "na_safeSetObject:forKey:", v26, *MEMORY[0x1E0D30BF8]);
  }
  else if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsMultipleRooms"), CFSTR("HUServiceDetailsMultipleRooms"), 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D30BF8]);

  }
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "latestResults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F00]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_safeSetObject:forKey:", v30, *MEMORY[0x1E0D30C80]);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30CE8]);
  if (-[HUServiceDetailsAbstractItem isContainedInAParent](self, "isContainedInAParent")
    && -[HUServiceDetailsAbstractItem canShowAsIndividualTiles](self, "canShowAsIndividualTiles")
    && !-[HUServiceDetailsAbstractItem isSensorService](self, "isSensorService"))
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[HUServiceDetailsAbstractItem isAccessoryDisplayedAsIndividualTiles](self, "isAccessoryDisplayedAsIndividualTiles"))
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  v31 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "futureWithResult:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (HFServiceLikeBuilder)serviceLikeBuilder
{
  return self->_serviceLikeBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLikeBuilder, 0);
}

@end
