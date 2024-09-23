@implementation ATXGroupHistogram

- (ATXGroupHistogram)init
{
  ATXGroupHistogram *v2;
  uint64_t v3;
  NSMutableDictionary *histogram;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXGroupHistogram;
  v2 = -[ATXGroupHistogram init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    histogram = v2->_histogram;
    v2->_histogram = (NSMutableDictionary *)v3;

    v2->_total = 0.0;
    v2->_isTotalScoreValid = 1;
    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)ATXGroupHistogram;
  -[ATXGroupHistogram dealloc](&v3, sel_dealloc);
}

- (void)addScore:(double)a3 group:(id)a4
{
  id v6;
  void *v7;
  ATXGroupHistogramEntry *v8;
  id v9;

  v6 = a4;
  if (v6)
  {
    v9 = v6;
    pthread_mutex_lock(&self->_lock);
    self->_isTotalScoreValid = 0;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v9);
      v8 = (ATXGroupHistogramEntry *)objc_claimAutoreleasedReturnValue();
      -[ATXGroupHistogramEntry addScore:](v8, "addScore:", a3);
    }
    else
    {
      v8 = -[ATXGroupHistogramEntry initWithScore:]([ATXGroupHistogramEntry alloc], "initWithScore:", a3);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v8, v9);
    }

    pthread_mutex_unlock(&self->_lock);
    v6 = v9;
  }

}

- (double)getScoreForGroup:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    pthread_mutex_lock(&self->_lock);
    -[ATXGroupHistogram _getTotalScore](self, "_getTotalScore");
    if (v6 == 0.0)
    {
      v10 = 0.0;
    }
    else
    {
      v7 = v6;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "score");
      v10 = v9 / v7;

    }
    pthread_mutex_unlock(p_lock);
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)_getTotalScore
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_isTotalScoreValid)
  {
    self->_total = 0.0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_histogram, "objectEnumerator", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          v9 = (double)(int)objc_msgSend(v8, "count");
          objc_msgSend(v8, "score");
          self->_total = self->_total + v9 * v10;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    self->_isTotalScoreValid = 1;
  }
  return self->_total;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogram, 0);
}

@end
