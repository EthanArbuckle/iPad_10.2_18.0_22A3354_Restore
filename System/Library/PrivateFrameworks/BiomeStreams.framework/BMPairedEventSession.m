@implementation BMPairedEventSession

- (BMPairedEventSession)initWithKey:(id)a3 startEvent:(id)a4 endEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BMPairedEventSession *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v11;
  v12 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)BMPairedEventSession;
  v14 = -[BMEventSession initWithKey:events:](&v16, sel_initWithKey_events_, v8, v13);

  if (!v10)
  {

    if (v9)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v9)
    goto LABEL_9;
LABEL_7:

  return v14;
}

- (BMStoreEvent)startEvent
{
  void *v3;
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->super._events, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->super._events, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (BMStoreEvent *)v5;
}

- (BMStoreEvent)endEvent
{
  void *v3;
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->super._events, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->super._events, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (BMStoreEvent *)v5;
}

+ (id)sessionPublisherWithStreamPublisher:(id)a3 startingBlock:(id)a4 sessionKeyBlock:(id)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if ((a6 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BMEventSession.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(options & BMIncludeRepeatedStartEvent) == NO"));

  }
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __98__BMPairedEventSession_sessionPublisherWithStreamPublisher_startingBlock_sessionKeyBlock_options___block_invoke;
  v23[3] = &unk_1E2649468;
  v15 = v12;
  v24 = v15;
  +[BMEventSession sessionPublisherWithStreamPublisher:startingBlock:endingBlock:sessionKeyBlock:options:](BMEventSession, "sessionPublisherWithStreamPublisher:startingBlock:endingBlock:sessionKeyBlock:options:", v11, v15, v23, v13, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __98__BMPairedEventSession_sessionPublisherWithStreamPublisher_startingBlock_sessionKeyBlock_options___block_invoke_2;
  v21[3] = &unk_1E2649490;
  v22 = v15;
  v17 = v15;
  objc_msgSend(v16, "mapWithTransform:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __98__BMPairedEventSession_sessionPublisherWithStreamPublisher_startingBlock_sessionKeyBlock_options___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

BMPairedEventSession *__98__BMPairedEventSession_sessionPublisherWithStreamPublisher_startingBlock_sessionKeyBlock_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BMPairedEventSession *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BMPairedEventSession *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  BMPairedEventSession *v17;
  void *v18;
  void *v19;

  v3 = a2;
  objc_msgSend(v3, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 2)
  {
    v6 = [BMPairedEventSession alloc];
    objc_msgSend(v3, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "events");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "events");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BMPairedEventSession initWithKey:startEvent:endEvent:](v6, "initWithKey:startEvent:endEvent:", v7, v9, v11);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "events");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v15);

    v17 = [BMPairedEventSession alloc];
    objc_msgSend(v3, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "events");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v18 = v9;
      v19 = 0;
    }
    else
    {
      v18 = 0;
      v19 = v9;
    }
    v12 = -[BMPairedEventSession initWithKey:startEvent:endEvent:](v17, "initWithKey:startEvent:endEvent:", v7, v18, v19);
  }

  return v12;
}

+ (id)openSessionsFromBookmark:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "upstreams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMEventSession openSessionsFromBookmark:](BMEventSession, "openSessionsFromBookmark:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_56);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BMPairedEventSession *__49__BMPairedEventSession_openSessionsFromBookmark___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BMPairedEventSession *v3;
  void *v4;
  void *v5;
  void *v6;
  BMPairedEventSession *v7;

  v2 = a2;
  v3 = [BMPairedEventSession alloc];
  objc_msgSend(v2, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BMPairedEventSession initWithKey:startEvent:endEvent:](v3, "initWithKey:startEvent:endEvent:", v4, v6, 0);

  return v7;
}

@end
