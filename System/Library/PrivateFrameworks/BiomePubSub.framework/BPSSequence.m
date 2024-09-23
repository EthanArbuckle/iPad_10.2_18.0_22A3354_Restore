@implementation BPSSequence

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
}

- (BOOL)finished
{
  return self->_finished;
}

- (id)nextEvent
{
  void *v3;
  void *v4;
  id v5;

  -[BPSSequence enumerator](self, "enumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    -[BPSSequence setFinished:](self, "setFinished:", 1);

  return v4;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void)reset
{
  void *v3;
  char isKindOfClass;
  id v5;

  -[BPSSequence setFinished:](self, "setFinished:", 0);
  -[BPSSequence enumerator](self, "enumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[BPSSequence enumerator](self, "enumerator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

  }
}

- (id)bookmark
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[BPSSequence enumerator](self, "enumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[BPSSequence enumerator](self, "enumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bookmark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (BPSSequence)initWithSequence:(id)a3
{
  id v4;
  BPSBookmarkableArrayEnumerator *v5;
  BPSSequence *v6;

  v4 = a3;
  v5 = -[BPSBookmarkableArrayEnumerator initWithArray:]([BPSBookmarkableArrayEnumerator alloc], "initWithArray:", v4);

  v6 = -[BPSSequence initWithBookmarkableEnumerator:](self, "initWithBookmarkableEnumerator:", v5);
  return v6;
}

- (BPSSequence)initWithEnumerator:(id)a3
{
  id v4;
  BPSSequence *v5;
  BPSSequence *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BPSSequence;
  v5 = -[BPSSequence init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BPSSequence setEnumerator:](v5, "setEnumerator:", v4);

  return v6;
}

- (void)setEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_enumerator, a3);
}

- (void)subscribe:(id)a3
{
  void *v4;
  _BPSSequenceInner *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[BPSSequence enumerator](self, "enumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_BPSSequenceInner initWithDownstream:enumerator:]([_BPSSequenceInner alloc], "initWithDownstream:enumerator:", v8, v4);
  if (v4)
  {
    objc_msgSend(v8, "receiveSubscription:", v5);
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v8, "receiveSubscription:", v6);

    +[BPSCompletion success](BPSCompletion, "success");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "receiveCompletion:", v7);

    -[_BPSSequenceInner cancel](v5, "cancel");
  }

}

- (id)validateBookmark:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;

  v4 = a3;
  -[BPSSequence enumerator](self, "enumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[BPSSequence enumerator](self, "enumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "validateBookmark:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)applyBookmark:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  -[BPSSequence enumerator](self, "enumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[BPSSequence enumerator](self, "enumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyBookmark:", v7);

  }
}

- (id)bookmarkableUpstreams
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
