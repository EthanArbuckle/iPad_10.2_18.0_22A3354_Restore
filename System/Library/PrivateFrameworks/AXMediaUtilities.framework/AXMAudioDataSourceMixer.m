@implementation AXMAudioDataSourceMixer

- (AXMAudioDataSourceMixer)initWithName:(id)a3 sampleRate:(double)a4 circular:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  AXMAudioDataSourceMixer *v9;
  AXMAudioDataSourceMixer *v10;
  uint64_t v11;
  NSSet *dataSources;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXMAudioDataSourceMixer;
  v9 = -[AXMAudioDataSource initWithName:sampleRate:circular:](&v14, sel_initWithName_sampleRate_circular_, v8, v5, a4);
  v10 = v9;
  if (v9)
  {
    v9->_panning = 0.5;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    dataSources = v10->_dataSources;
    v10->_dataSources = (NSSet *)v11;

  }
  return v10;
}

- (void)setCurrentSampleIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[AXMAudioDataSource currentSampleIndex](self, "currentSampleIndex");
  if (-[AXMAudioDataSource isCircular](self, "isCircular"))
  {
    v6 = a3 % -[AXMAudioDataSource length](self, "length");
  }
  else if ((a3 & 0x8000000000000000) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = -[AXMAudioDataSource length](self, "length") - 1;
    v6 = a3;
    if (v7 < a3)
      v6 = -[AXMAudioDataSource length](self, "length", a3) - 1;
  }
  v17.receiver = self;
  v17.super_class = (Class)AXMAudioDataSourceMixer;
  -[AXMAudioDataSource setCurrentSampleIndex:](&v17, sel_setCurrentSampleIndex_, v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AXMAudioDataSourceMixer dataSources](self, "dataSources", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = a3 - v5;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setCurrentSampleIndex:", v10 + objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "currentSampleIndex"));
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

}

- (void)addDataSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *dataSources;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setCurrentSampleIndex:", -[AXMAudioDataSource currentSampleIndex](self, "currentSampleIndex"));
  v4 = (void *)MEMORY[0x1E0C99E20];
  -[AXMAudioDataSourceMixer dataSources](self, "dataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v9);
  v7 = (NSSet *)objc_msgSend(v6, "copy");
  dataSources = self->_dataSources;
  self->_dataSources = v7;

}

- (void)removeDataSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *dataSources;
  id v9;

  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99E20];
  -[AXMAudioDataSourceMixer dataSources](self, "dataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObject:", v9);
  v7 = (NSSet *)objc_msgSend(v6, "copy");
  dataSources = self->_dataSources;
  self->_dataSources = v7;

}

- (void)removeAllDataSources
{
  NSSet *v3;
  NSSet *dataSources;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  dataSources = self->_dataSources;
  self->_dataSources = v3;

}

- (void)prepareNextSamples:(unint64_t)a3
{
  uint64_t v4;
  _BOOL4 v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  _QWORD *v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = -[AXMAudioDataSource sampleBuffer](self, "sampleBuffer");
  if (a3)
  {
    v4 = 0;
    do
    {
      v5 = -[AXMAudioDataSource isCircular](self, "isCircular");
      v6 = -[AXMAudioDataSource currentSampleIndex](self, "currentSampleIndex") + v4;
      if (v5)
        v6 %= -[AXMAudioDataSource length](self, "length");
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[AXMAudioDataSourceMixer dataSources](self, "dataSources");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v27 = v6;
      v9 = 0;
      if (v8)
      {
        v10 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if (objc_msgSend(v12, "isCircular"))
            {
              v13 = objc_msgSend(v12, "currentSampleIndex");
              v14 = (v13 + v4) % (unint64_t)objc_msgSend(v12, "length");
            }
            else
            {
              v14 = objc_msgSend(v12, "currentSampleIndex") + v4;
            }
            v15 = (_QWORD *)objc_msgSend(v12, "sampleBuffer");
            if (v14 < objc_msgSend(v12, "length"))
            {
              objc_msgSend(v12, "level");
              v17 = v16;
              v18 = *(_DWORD *)(*v15 + 4 * v14);
              -[AXMAudioDataSource level](self, "level");
              v20 = v19 * (double)(uint64_t)((double)v9 + v17 * (double)v18);
              v9 = (uint64_t)v20;
              v21 = (uint64_t)v20 >= 0 ? (uint64_t)v20 : -v9;
              if (v21 >= 0x7EF5)
              {
                if (v9 > 0)
                  v9 = 32500;
                else
                  v9 = -32500;
              }
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v8);
      }

      if (v27 < (uint64_t)(v26[1] - *v26) >> 2)
      {
        if (-[AXMAudioDataSourceMixer isMonoOutput](self, "isMonoOutput"))
        {
          *(_DWORD *)(*v26 + 4 * v27) = v9;
        }
        else
        {
          -[AXMAudioDataSourceMixer panning](self, "panning");
          v23 = v22;
          -[AXMAudioDataSourceMixer panning](self, "panning");
          *(_DWORD *)(*v26 + 4 * v27) = (int)((1.0 - v23) * (double)v9) + ((int)(v24 * (double)v9) << 16);
        }
      }
      ++v4;
    }
    while (v4 != a3);
  }
}

- (BOOL)isMonoOutput
{
  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AXMAudioDataSourceMixer name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AXMAudioDataSource isCircular](self, "isCircular");
  v7 = -[AXMAudioDataSource currentSampleIndex](self, "currentSampleIndex");
  v8 = -[AXMAudioDataSource length](self, "length");
  -[AXMAudioDataSourceMixer dataSources](self, "dataSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p name=%@ circular=%d currentSample=%lu length=%lu sources=\n%@>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)panning
{
  return self->_panning;
}

- (void)setPanning:(double)a3
{
  self->_panning = a3;
}

- (NSSet)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_dataSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
