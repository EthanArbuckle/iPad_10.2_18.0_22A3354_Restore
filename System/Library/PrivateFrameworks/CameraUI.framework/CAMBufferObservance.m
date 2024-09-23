@implementation CAMBufferObservance

- (CAMBufferObservance)initWithPredicate:(id)a3 removedOnceEnabled:(BOOL)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMBufferObservance;
  v7 = -[CAMBufferObservance init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)*((_QWORD *)v7 + 2);
    *((_QWORD *)v7 + 2) = v8;

    v7[8] = a4;
    *(_WORD *)(v7 + 9) = 0;
    v10 = v7;
  }

  return (CAMBufferObservance *)v7;
}

- (BOOL)shouldBeFulfilledByChange:(id)a3
{
  return 1;
}

- (void)fulfillWithChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (-[CAMBufferObservance shouldBeFulfilledByChange:](self, "shouldBeFulfilledByChange:", a3))
  {
    if (!-[CAMBufferObservance isFulfilled](self, "isFulfilled"))
      -[CAMBufferObservance setFulfilled:](self, "setFulfilled:", 1);
    -[CAMBufferObservance predicate](self, "predicate");
    v4 = objc_claimAutoreleasedReturnValue();
    v6 = (id)v4;
    if (v4)
      v5 = (*(uint64_t (**)(void))(v4 + 16))();
    else
      v5 = 0;
    -[CAMBufferObservance setEnabled:](self, "setEnabled:", v5);

  }
}

- (BOOL)isRemovedOnceEnabled
{
  return self->_removedOnceEnabled;
}

- (id)predicate
{
  return self->_predicate;
}

- (BOOL)isFulfilled
{
  return self->_fulfilled;
}

- (void)setFulfilled:(BOOL)a3
{
  self->_fulfilled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicate, 0);
}

@end
