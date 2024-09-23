@implementation BPSDirectAssocationCorrelateHandler

- (BPSDirectAssocationCorrelateHandler)initWithCorrelating:(id)a3
{
  id v4;
  void *v5;
  BPSDirectAssocationCorrelateHandler *v6;
  uint64_t v7;
  id correlating;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v10.receiver = self;
  v10.super_class = (Class)BPSDirectAssocationCorrelateHandler;
  v6 = -[BPSCorrelateHandler initWithInitialContext:](&v10, sel_initWithInitialContext_, v5);

  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    correlating = v6->_correlating;
    v6->_correlating = (id)v7;

  }
  return v6;
}

- (void)receivePriorEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BPSCorrelateHandler context](self, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)correlateWithCurrentEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  BPSTuple *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t);
  void *v17;
  BPSDirectAssocationCorrelateHandler *v18;
  id v19;
  id v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  -[BPSCorrelateHandler context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __65__BPSDirectAssocationCorrelateHandler_correlateWithCurrentEvent___block_invoke;
  v17 = &unk_1E554CB80;
  v18 = self;
  v8 = v4;
  v19 = v8;
  v9 = v5;
  v20 = v9;
  v10 = v6;
  v21 = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v14);

  -[BPSCorrelateHandler context](self, "context", v14, v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectsAtIndexes:", v10);

  if (objc_msgSend(v9, "count"))
    v12 = -[BPSTuple initWithFirst:second:]([BPSTuple alloc], "initWithFirst:second:", v8, v9);
  else
    v12 = 0;

  return v12;
}

void __65__BPSDirectAssocationCorrelateHandler_correlateWithCurrentEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", a3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_correlating, 0);
}

@end
