@implementation BMEventSession

- (BMEventSession)initWithKey:(id)a3 events:(id)a4
{
  id v7;
  id v8;
  BMEventSession *v9;
  BMEventSession *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMEventSession;
  v9 = -[BMEventSession init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_events, a4);
  }

  return v10;
}

- (NSArray)events
{
  return (NSArray *)-[NSArray _pas_filteredArrayWithTest:](self->_events, "_pas_filteredArrayWithTest:", &__block_literal_global_15);
}

BOOL __24__BMEventSession_events__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99E38];
  v3 = a2;
  objc_msgSend(v2, "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 != v3;
}

+ (id)sessionPublisherWithStreamPublisher:(id)a3 startingBlock:(id)a4 endingBlock:(id)a5 sessionKeyBlock:(id)a6 options:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a3;
  v15 = (void *)objc_opt_new();
  v28[0] = v15;
  v28[1] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __104__BMEventSession_sessionPublisherWithStreamPublisher_startingBlock_endingBlock_sessionKeyBlock_options___block_invoke;
  v23[3] = &unk_1E2649400;
  v24 = v13;
  v25 = v11;
  v26 = v12;
  v27 = a7;
  v17 = v12;
  v18 = v11;
  v19 = v13;
  objc_msgSend(v14, "scanWithInitial:nextPartialResult:", v16, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "flatMapWithTransform:", &__block_literal_global_6_1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __104__BMEventSession_sessionPublisherWithStreamPublisher_startingBlock_endingBlock_sessionKeyBlock_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  id *v12;
  id *v13;
  uint64_t v14;
  BMEventSession *v15;
  void *v16;
  id *v17;
  BMEventSession *v18;
  void *v19;
  void *v20;
  BMEventSession *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BMEventSession *v26;
  BMEventSession *v28;
  void *v29;
  void *v30;
  BMEventSession *v31;
  _QWORD v32[2];
  BMEventSession *v33;
  _QWORD v34[2];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v12 = (id *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v10)
  {
    if (v11)
    {
      if (v12)
      {
        objc_msgSend(v12[1], "addObject:", v5);
        objc_msgSend(v6, "removeObjectForKey:", v7);
        v18 = v13;
      }
      else
      {
        if ((*(_BYTE *)(a1 + 56) & 4) == 0)
          goto LABEL_22;
        v21 = [BMEventSession alloc];
        v36 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "mutableCopy");
        v18 = -[BMEventSession initWithKey:events:](v21, "initWithKey:events:", v7, v23);

        if (!v18)
          goto LABEL_22;
      }
      goto LABEL_12;
    }
    if (v12)
      goto LABEL_14;
    if ((*(_BYTE *)(a1 + 56) & 4) != 0)
    {
      v15 = [BMEventSession alloc];
      v35 = v5;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = &v35;
      goto LABEL_21;
    }
LABEL_22:
    v32[0] = v6;
    v32[1] = MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    goto LABEL_23;
  }
  if (!v12)
  {
    v15 = [BMEventSession alloc];
    v37 = v5;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = &v37;
    goto LABEL_21;
  }
  v14 = *(_QWORD *)(a1 + 56);
  if ((v14 & 1) != 0)
    goto LABEL_22;
  if ((v14 & 2) != 0)
  {
LABEL_14:
    objc_msgSend(v12[1], "addObject:", v5);
    goto LABEL_22;
  }
  if ((v14 & 4) == 0)
  {
    v15 = [BMEventSession alloc];
    v38 = v5;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = &v38;
LABEL_21:
    objc_msgSend(v16, "arrayWithObjects:count:", v17, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");
    v26 = -[BMEventSession initWithKey:events:](v15, "initWithKey:events:", v7, v25);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, v7);

    goto LABEL_22;
  }
  v18 = v12;
  v28 = [BMEventSession alloc];
  v39[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");
  v31 = -[BMEventSession initWithKey:events:](v28, "initWithKey:events:", v7, v30);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, v7);

LABEL_12:
  v33 = v18;
  v34[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v20;
}

id __104__BMEventSession_sessionPublisherWithStreamPublisher_startingBlock_endingBlock_sessionKeyBlock_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bpsPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)openSessionsFromBookmark:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "upstreams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSCopying *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_events, CFSTR("events"));

}

- (BMEventSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BMEventSession *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("events"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BMEventSession initWithKey:events:](self, "initWithKey:events:", v5, v9);
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4[2], "isEqual:", self->_key))
    v5 = objc_msgSend(v4[1], "isEqualToArray:", self->_events);
  else
    v5 = 0;

  return v5;
}

- (NSCopying)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
