@implementation CPMLKMeansModel

- (id)cluster
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = *((_QWORD *)self->super._mData + 4);
  if ((unint64_t)(v4 + 6) >= 7)
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)self->super._mData + v5 + 6));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v5;
    }
    while (v4 != v5);
  }
  return v3;
}

- (id)centers
{
  _QWORD *mData;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v12;
  id v13;

  v13 = (id)objc_opt_new();
  mData = self->super._mData;
  v12 = mData[2];
  if (v12)
  {
    v4 = 0;
    v5 = mData[3];
    v6 = 8 * (unint64_t)self->super._realBase[3];
    do
    {
      v7 = (void *)objc_opt_new();
      v8 = v6;
      for (i = v5; i; --i)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)((char *)self->super._realBase + v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v10);

        v8 += 8;
      }
      objc_msgSend(v13, "addObject:", v7);

      ++v4;
      v6 += 8 * v5;
    }
    while (v4 != v12);
  }
  return v13;
}

- (id)totss
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->super._realBase[2]);
}

- (id)withinss
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = *((_QWORD *)self->super._mData + 2);
  if (v4)
  {
    v5 = (unint64_t)self->super._realBase[4];
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->super._realBase[v5]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v5;
      --v4;
    }
    while (v4);
  }
  return v3;
}

- (id)totalWithinss
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[CPMLKMeansModel withinss](self, "withinss");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "doubleValue");
        v6 = v6 + v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)betweenss
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[CPMLKMeansModel totss](self, "totss");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  -[CPMLKMeansModel totalWithinss](self, "totalWithinss");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v5 - v7;

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
}

- (id)size
{
  void *v3;
  _QWORD *mData;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  mData = self->super._mData;
  v5 = mData[2];
  if (v5)
  {
    v6 = 8 * mData[5];
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)((char *)self->super._mData + v6));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      v6 += 8;
      --v5;
    }
    while (v5);
  }
  return v3;
}

- (id)iter
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)self->super._mData + 1));
}

@end
