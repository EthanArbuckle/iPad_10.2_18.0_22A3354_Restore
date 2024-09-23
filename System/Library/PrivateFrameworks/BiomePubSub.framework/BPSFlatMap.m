@implementation BPSFlatMap

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSFlatMap upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (BOOL)completed
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  -[BPSFlatMap currentPublisher](self, "currentPublisher");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[BPSFlatMap currentPublisher](self, "currentPublisher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "completed");

    if (!v6)
      return 0;
  }
  -[BPSFlatMap upstream](self, "upstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "completed");

  return v8;
}

- (id)validateBookmark:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      v9 = objc_opt_class();
      v4 = (id)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ expected bookmark dictionary of class %@, but received %@"), v9, objc_opt_class(), v3);
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      goto LABEL_13;
    }
    v4 = v3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentEvent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentPublisherBookmark"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      v14 = objc_opt_class();
      v12 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@ expected current publisher bookmark node of class %@, but received %@"), v14, objc_opt_class(), v4);
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      v19 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ expected current event, but received nil"), objc_opt_class());
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_11;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (id)startWithSubscriber:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[BPSFlatMap setSubscriber:](self, "setSubscriber:", v4);
  v7.receiver = self;
  v7.super_class = (Class)BPSFlatMap;
  -[BPSPublisher startWithSubscriber:](&v7, sel_startWithSubscriber_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)applyBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentEvent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("currentPublisherBookmark"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSFlatMap setCurrentEvent:](self, "setCurrentEvent:", v5);
    -[BPSFlatMap transform](self, "transform");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[BPSFlatMap currentEvent](self, "currentEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSFlatMap setCurrentPublisher:](self, "setCurrentPublisher:", v9);

    if (v6)
    {
      -[BPSFlatMap currentPublisher](self, "currentPublisher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EEAF4F80);

      if (v11)
      {
        -[BPSFlatMap currentPublisher](self, "currentPublisher");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "applyBookmarkNode:", v6);

      }
    }

    v4 = v13;
  }

}

- (id)bookmark
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[BPSFlatMap currentPublisher](self, "currentPublisher");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[BPSFlatMap currentEvent](self, "currentEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[BPSFlatMap currentPublisher](self, "currentPublisher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EEAF4F80);

      if (v7)
      {
        -[BPSFlatMap currentPublisher](self, "currentPublisher");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend((id)objc_opt_class(), "isPipelineBookmarkable:", v8) & 1) != 0)
        {
          objc_msgSend(v8, "bookmarkNode");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v13[0] = CFSTR("currentEvent");
          -[BPSFlatMap currentEvent](self, "currentEvent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v13[1] = CFSTR("currentPublisherBookmark");
          v14[0] = v10;
          v14[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          return v11;
        }

      }
    }
  }
  return 0;
}

- (id)currentEvent
{
  return self->_currentEvent;
}

- (id)nextEvent
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  -[BPSFlatMap currentPublisher](self, "currentPublisher");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_14;
  v4 = (void *)v3;
  -[BPSFlatMap currentPublisher](self, "currentPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "completed");

  if ((v6 & 1) != 0
    || (-[BPSFlatMap currentPublisher](self, "currentPublisher"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "nextEvent"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
LABEL_14:
    while (1)
    {
      -[BPSFlatMap currentPublisher](self, "currentPublisher");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        -[BPSFlatMap currentPublisher](self, "currentPublisher");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "completed");

        if (!v12)
          goto LABEL_9;
      }
      -[BPSFlatMap upstream](self, "upstream");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "nextEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_9:
        v8 = 0;
        return v8;
      }
      -[BPSFlatMap transform](self, "transform");
      v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v15)[2](v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[BPSFlatMap subscriber](self, "subscriber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v16, "startWithSubscriber:", v17);

      -[BPSFlatMap currentPublisher](self, "currentPublisher");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reset");

      -[BPSFlatMap setCurrentPublisher:](self, "setCurrentPublisher:", v16);
      -[BPSFlatMap setCurrentEvent:](self, "setCurrentEvent:", v14);
      -[BPSFlatMap currentPublisher](self, "currentPublisher");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "nextEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        break;

    }
  }
  return v8;
}

- (BPSPublisher)currentPublisher
{
  return self->_currentPublisher;
}

- (void)reset
{
  objc_super v3;

  -[BPSFlatMap setCurrentPublisher:](self, "setCurrentPublisher:", 0);
  -[BPSFlatMap setCurrentEvent:](self, "setCurrentEvent:", 0);
  -[BPSFlatMap setSubscriber:](self, "setSubscriber:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BPSFlatMap;
  -[BPSPublisher reset](&v3, sel_reset);
}

- (void)setCurrentPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_currentPublisher, a3);
}

- (void)setCurrentEvent:(id)a3
{
  objc_storeStrong(&self->_currentEvent, a3);
}

- (void)setSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_subscriber, a3);
}

- (id)transform
{
  return self->_transform;
}

- (BPSSubscriber)subscriber
{
  return self->_subscriber;
}

- (BPSFlatMap)initWithUpstream:(id)a3 maxPublishers:(int64_t)a4 transform:(id)a5
{
  id v9;
  id v10;
  BPSFlatMap *v11;
  BPSFlatMap *v12;
  uint64_t v13;
  id transform;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BPSFlatMap;
  v11 = -[BPSFlatMap init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_upstream, a3);
    v12->_maxPublishers = a4;
    v13 = objc_msgSend(v10, "copy");
    transform = v12->_transform;
    v12->_transform = (id)v13;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong(&self->_currentEvent, 0);
  objc_storeStrong((id *)&self->_currentPublisher, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong(&self->_transform, 0);
}

- (void)subscribe:(id)a3
{
  id v4;
  _BPSFlatMapOuter *v5;
  int64_t v6;
  void *v7;
  void *v8;
  _BPSFlatMapOuter *v9;

  v4 = a3;
  v5 = [_BPSFlatMapOuter alloc];
  v6 = -[BPSFlatMap maxPublishers](self, "maxPublishers");
  -[BPSFlatMap transform](self, "transform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_BPSFlatMapOuter initWithDownstream:maxPublishers:map:](v5, "initWithDownstream:maxPublishers:map:", v4, v6, v7);

  objc_msgSend(v4, "receiveSubscription:", v9);
  -[BPSFlatMap upstream](self, "upstream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribe:", v9);

}

- (int64_t)maxPublishers
{
  return self->_maxPublishers;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  BPSFlatMap *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BPSFlatMap *v12;

  v6 = a3;
  v7 = a4;
  v8 = [BPSFlatMap alloc];
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "maxPublishers");
  objc_msgSend(v6, "transform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BPSFlatMap initWithUpstream:maxPublishers:transform:](v8, "initWithUpstream:maxPublishers:transform:", v9, v10, v11);

  return v12;
}

- (id)bookmarkableUpstreams
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[BPSFlatMap upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[BPSFlatMap upstream](self, "upstream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end
