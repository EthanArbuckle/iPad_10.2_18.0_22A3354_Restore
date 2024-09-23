@implementation SUUIStorePageSplitsDescription

- (void)enumerateSplitsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  SUUIStorePageSplit *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  v11[0] = self->_topSplit;
  v11[1] = self->_leftSplit;
  v11[2] = self->_rightSplit;
  v5 = self->_bottomSplit;
  v6 = 0;
  v7 = 0;
  v11[3] = v5;
  do
  {
    v10 = 0;
    v8 = v11[v6];
    if (v8)
    {
      v4[2](v4, v8, v7, &v10);
      if (v10)
        break;
      ++v7;
    }
    ++v6;
  }
  while (v6 != 4);
  for (i = 3; i != -1; --i)

}

- (SUUIStorePageSplit)firstSplit
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__55;
  v9 = __Block_byref_object_dispose__55;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SUUIStorePageSplitsDescription_firstSplit__block_invoke;
  v4[3] = &unk_2511FAB50;
  v4[4] = &v5;
  -[SUUIStorePageSplitsDescription enumerateSplitsUsingBlock:](self, "enumerateSplitsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUIStorePageSplit *)v2;
}

void __44__SUUIStorePageSplitsDescription_firstSplit__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

- (int64_t)numberOfSplits
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__SUUIStorePageSplitsDescription_numberOfSplits__block_invoke;
  v4[3] = &unk_2511FAB50;
  v4[4] = &v5;
  -[SUUIStorePageSplitsDescription enumerateSplitsUsingBlock:](self, "enumerateSplitsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __48__SUUIStorePageSplitsDescription_numberOfSplits__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (void)sizeSplitsToFitWidth:(double)a3 usingBlock:(id)a4
{
  id v6;
  SUUIStorePageSplit *rightSplit;
  SUUIStorePageSplit *v8;
  id v9;
  SUUIStorePageSplit *v10;
  _QWORD v11[5];
  SUUIStorePageSplit *v12;
  id v13;
  _QWORD *v14;
  double v15;
  _QWORD v16[4];

  v6 = a4;
  rightSplit = self->_rightSplit;
  if (!rightSplit)
    rightSplit = self->_leftSplit;
  v8 = rightSplit;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  *(double *)&v16[3] = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__SUUIStorePageSplitsDescription_sizeSplitsToFitWidth_usingBlock___block_invoke;
  v11[3] = &unk_2511FAB78;
  v11[4] = self;
  v9 = v6;
  v13 = v9;
  v15 = a3;
  v10 = v8;
  v12 = v10;
  v14 = v16;
  -[SUUIStorePageSplitsDescription enumerateSplitsUsingBlock:](self, "enumerateSplitsUsingBlock:", v11);

  _Block_object_dispose(v16, 8);
}

void __66__SUUIStorePageSplitsDescription_sizeSplitsToFitWidth_usingBlock___block_invoke(double *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  __n128 v8;
  id *v9;
  double v10;
  double v11;
  float v12;
  double v13;
  void *v14;
  uint64_t v15;
  id v16;

  v7 = a2;
  v9 = (id *)*((_QWORD *)a1 + 4);
  v16 = v7;
  if (v9[4] == v7 || v9[1] == v7)
  {
    v15 = *((_QWORD *)a1 + 6);
    v8.n128_f64[0] = a1[8];
LABEL_9:
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, __n128))(v15 + 16))(v15, v16, a3, a4, v8);
    v14 = v16;
    goto LABEL_10;
  }
  if (*((id *)a1 + 5) == v7)
  {
    v15 = *((_QWORD *)a1 + 6);
    v8.n128_u64[0] = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 7) + 8) + 24);
    goto LABEL_9;
  }
  objc_msgSend(v9[2], "widthFraction");
  if (v10 < 0.00000011920929)
  {
    objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 24), "widthFraction");
    v10 = 1.0 - v11;
  }
  v12 = v10 * a1[8];
  v13 = roundf(v12);
  (*(void (**)(double))(*((_QWORD *)a1 + 6) + 16))(v13);
  v14 = v16;
  *(double *)(*(_QWORD *)(*((_QWORD *)a1 + 7) + 8) + 24) = *(double *)(*(_QWORD *)(*((_QWORD *)a1 + 7) + 8) + 24)
                                                             - v13;
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setBottomSplit:", self->_bottomSplit);
  objc_msgSend(v4, "setLeftSplit:", self->_leftSplit);
  objc_msgSend(v4, "setRightSplit:", self->_rightSplit);
  objc_msgSend(v4, "setTopSplit:", self->_topSplit);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUIStorePageSplitsDescription;
  -[SUUIStorePageSplitsDescription description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Splits: [T: %@, L: %@, R: %@, B: %@]"), v4, self->_topSplit, self->_leftSplit, self->_rightSplit, self->_bottomSplit);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SUUIStorePageSplit)bottomSplit
{
  return self->_bottomSplit;
}

- (void)setBottomSplit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SUUIStorePageSplit)leftSplit
{
  return self->_leftSplit;
}

- (void)setLeftSplit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SUUIStorePageSplit)rightSplit
{
  return self->_rightSplit;
}

- (void)setRightSplit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SUUIStorePageSplit)topSplit
{
  return self->_topSplit;
}

- (void)setTopSplit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSplit, 0);
  objc_storeStrong((id *)&self->_rightSplit, 0);
  objc_storeStrong((id *)&self->_leftSplit, 0);
  objc_storeStrong((id *)&self->_bottomSplit, 0);
}

@end
