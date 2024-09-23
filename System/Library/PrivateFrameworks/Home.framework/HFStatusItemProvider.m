@implementation HFStatusItemProvider

+ (BOOL)hasStatusItemForServiceType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CBA7E0];
  v4 = a3;
  objc_msgSend(v3, "hf_standardServiceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

id __74__HFStatusItemProvider__createStatusItemsForHome_room_valueSource_filter___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a1 + 64);
  if (v4 && !(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_buildStatusItemWithClass:home:room:valueSource:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_buildStatusItemWithClass:(Class)a3 home:(id)a4 room:(id)a5 valueSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend([a3 alloc], "initWithHome:room:valueSource:", v12, v11, v10);

  objc_opt_class();
  v14 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
    -[HFStatusItemProvider _buildStatusItemsForGroupedStatusItem:](self, "_buildStatusItemsForGroupedStatusItem:", v16);

  return v14;
}

- (HFStatusItemProvider)initWithHome:(id)a3 room:(id)a4 filter:(id)a5
{
  return -[HFStatusItemProvider initWithHome:room:overrideValueSource:filter:](self, "initWithHome:room:overrideValueSource:filter:", a3, a4, 0, a5);
}

- (HFStatusItemProvider)initWithHome:(id)a3 room:(id)a4 overrideValueSource:(id)a5 filter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HFStatusItemProvider *v19;
  void *v20;
  id filter;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(v11, "hf_characteristicValueManager");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  -[HFStatusItemProvider _createStatusItemsForHome:room:valueSource:filter:](self, "_createStatusItemsForHome:room:valueSource:filter:", v11, v12, v15, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)HFStatusItemProvider;
  v19 = -[HFStaticItemProvider initWithItems:](&v23, sel_initWithItems_, v18);

  if (v19)
  {
    objc_storeStrong((id *)&v19->_home, a3);
    objc_storeStrong((id *)&v19->_room, a4);
    objc_storeStrong((id *)&v19->_valueSource, v16);
    v20 = _Block_copy(v14);
    filter = v19->_filter;
    v19->_filter = v20;

  }
  return v19;
}

- (id)_createStatusItemsForHome:(id)a3 room:(id)a4 valueSource:(id)a5 filter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend((id)objc_opt_class(), "_statusItemClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__HFStatusItemProvider__createStatusItemsForHome_room_valueSource_filter___block_invoke;
  v21[3] = &unk_1EA731CB8;
  v24 = v12;
  v25 = v13;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  objc_msgSend(v14, "na_map:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_statusItemClasses
{
  if (_MergedGlobals_9 != -1)
    dispatch_once(&_MergedGlobals_9, &__block_literal_global_2_10);
  return (id)qword_1ED378B20;
}

void __42__HFStatusItemProvider__statusItemClasses__block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v36 = (void *)MEMORY[0x1E0C99DE8];
  v35 = objc_opt_class();
  v34 = objc_opt_class();
  v33 = objc_opt_class();
  v32 = objc_opt_class();
  v31 = objc_opt_class();
  v30 = objc_opt_class();
  v29 = objc_opt_class();
  v28 = objc_opt_class();
  v27 = objc_opt_class();
  v26 = objc_opt_class();
  v25 = objc_opt_class();
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v36, "arrayWithObjects:", v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19,
                  v18,
                  v17,
                  v16,
                  v15,
                  v14,
                  v13,
                  v12,
                  v11,
                  v0,
                  v1,
                  v2,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8,
                  v9,
                  objc_opt_class(),
                  0);
  objc_storeStrong((id *)&qword_1ED378B20, v10);
}

+ (id)sortOrderForStatusItemCategory:(unint64_t)a3
{
  uint64_t *v3;
  dispatch_once_t *v5;
  void *v6;

  switch(a3)
  {
    case 0uLL:
      if (qword_1ED378B28 == -1)
      {
        v3 = &qword_1ED378B30;
        goto LABEL_13;
      }
      v5 = &qword_1ED378B28;
      v6 = &__block_literal_global_43_0;
      goto LABEL_19;
    case 1uLL:
      if (qword_1ED378B38 == -1)
      {
        v3 = &qword_1ED378B40;
        goto LABEL_13;
      }
      v5 = &qword_1ED378B38;
      v6 = &__block_literal_global_46_4;
      goto LABEL_19;
    case 2uLL:
      if (qword_1ED378B48 == -1)
      {
        v3 = &qword_1ED378B50;
        goto LABEL_13;
      }
      v5 = &qword_1ED378B48;
      v6 = &__block_literal_global_48_0;
      goto LABEL_19;
    case 3uLL:
      if (qword_1ED378B58 == -1)
      {
        v3 = &qword_1ED378B60;
        goto LABEL_13;
      }
      v5 = &qword_1ED378B58;
      v6 = &__block_literal_global_50_1;
      goto LABEL_19;
    case 4uLL:
      if (qword_1ED378B68 == -1)
      {
        v3 = &qword_1ED378B70;
      }
      else
      {
        v5 = &qword_1ED378B68;
        v6 = &__block_literal_global_53_1;
LABEL_19:
        dispatch_once(v5, v6);
        v3 = v5 + 1;
      }
LABEL_13:
      a1 = (id)*v3;
      return a1;
    default:
      return a1;
  }
}

void __55__HFStatusItemProvider_sortOrderForStatusItemCategory___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378B30;
  qword_1ED378B30 = v0;

}

void __55__HFStatusItemProvider_sortOrderForStatusItemCategory___block_invoke_4()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378B40;
  qword_1ED378B40 = v0;

}

void __55__HFStatusItemProvider_sortOrderForStatusItemCategory___block_invoke_6()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];

  v2[12] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378B50;
  qword_1ED378B50 = v0;

}

void __55__HFStatusItemProvider_sortOrderForStatusItemCategory___block_invoke_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v14 = (void *)MEMORY[0x1E0C99DE8];
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v14, "arrayWithObjects:", v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  objc_storeStrong((id *)&qword_1ED378B60, v10);
}

void __55__HFStatusItemProvider_sortOrderForStatusItemCategory___block_invoke_11()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];

  v2[11] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378B70;
  qword_1ED378B70 = v0;

}

+ (id)statusItemComparator
{
  return &__block_literal_global_55_0;
}

uint64_t __44__HFStatusItemProvider_statusItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  id v36;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("statusItemCategory"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &unk_1EA7CC298;
  v10 = v9;

  objc_msgSend(v5, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("statusItemCategory"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = &unk_1EA7CC298;
  v15 = v14;

  v16 = objc_msgSend(v10, "compare:", v15);
  if (!v16)
  {
    +[HFStatusItemProvider sortOrderForStatusItemCategory:](HFStatusItemProvider, "sortOrderForStatusItemCategory:", objc_msgSend(v10, "integerValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", objc_opt_class()));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", objc_opt_class()));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v18, "compare:", v19);
    if (!v16)
    {
      objc_msgSend(v4, "latestResults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("priority"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = &unk_1EA7CC2B0;
      if (v21)
        v23 = (void *)v21;
      v36 = v23;

      objc_msgSend(v5, "latestResults");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("priority"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = &unk_1EA7CC2B0;
      if (v25)
        v27 = (void *)v25;
      v28 = v27;

      v29 = v36;
      if (objc_msgSend(v36, "isEqualToNumber:", v28))
      {
        objc_msgSend(v4, "latestResults");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sortKey"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "latestResults");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("sortKey"));
        v34 = v28;
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v36;
        v16 = objc_msgSend(v35, "localizedStandardCompare:", v32);

        v28 = v34;
      }
      else
      {
        v16 = objc_msgSend(v28, "compare:", v36);
      }

    }
  }

  return v16;
}

- (HFStatusItemProvider)initWithItems:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_room_overrideValueSource_filter_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFStatusItemProvider.m"), 236, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFStatusItemProvider initWithItems:]",
    v6);

  return 0;
}

- (HFStatusItemProvider)initWithHome:(id)a3 room:(id)a4
{
  return -[HFStatusItemProvider initWithHome:room:filter:](self, "initWithHome:room:filter:", a3, a4, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFStatusItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItemProvider room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItemProvider valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItemProvider filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithHome:room:overrideValueSource:filter:", v5, v6, v7, v8);

  return v9;
}

- (void)_buildStatusItemsForGroupedStatusItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "statusItemClasses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HFStatusItemProvider__buildStatusItemsForGroupedStatusItem___block_invoke;
  v7[3] = &unk_1EA731CE0;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "na_each:", v7);

}

void __62__HFStatusItemProvider__buildStatusItemsForGroupedStatusItem___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_buildStatusItemWithClass:home:room:valueSource:", a2, v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addItem:", v8);
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (id)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
