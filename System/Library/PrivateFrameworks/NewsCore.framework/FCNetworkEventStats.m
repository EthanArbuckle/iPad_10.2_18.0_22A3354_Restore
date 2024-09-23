@implementation FCNetworkEventStats

- (FCNetworkEventStats)initWithValues:(id)a3
{
  id v4;
  FCNetworkEventStats *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  unint64_t v28;
  double v29;
  double v30;
  unint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)FCNetworkEventStats;
  v5 = -[FCNetworkEventStats init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF > 0"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v5->_count = objc_msgSend(v7, "count");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@min.self"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForKeyPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v5->_min = (unint64_t)v10;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@max.self"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForKeyPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v5->_max = (unint64_t)v13;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@avg.self"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForKeyPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v5->_mean = (unint64_t)v16;

      objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (double)(unint64_t)objc_msgSend(v17, "count") * 0.5;
      v19 = (double)(unint64_t)objc_msgSend(v17, "count") * 0.95;
      v20 = floor(v18);
      v21 = (double)(unint64_t)(objc_msgSend(v7, "count") - 1);
      if (v20 < v21)
        v21 = v20;
      v22 = (unint64_t)v21;
      v23 = ceil(v18);
      v24 = (double)(unint64_t)(objc_msgSend(v7, "count") - 1);
      if (v23 < v24)
        v24 = v23;
      v25 = (unint64_t)v24;
      v26 = floor(v19);
      v27 = (double)(unint64_t)(objc_msgSend(v7, "count") - 1);
      if (v26 < v27)
        v27 = v26;
      v28 = (unint64_t)v27;
      v29 = ceil(v19);
      v30 = (double)(unint64_t)(objc_msgSend(v7, "count") - 1);
      if (v29 < v30)
        v30 = v29;
      v31 = (unint64_t)v30;
      objc_msgSend(v17, "objectAtIndex:", v22);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "doubleValue");
      v34 = v33;
      objc_msgSend(v17, "objectAtIndex:", v25);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "doubleValue");
      v5->_median = (unint64_t)((v34 + v36) * 0.5);

      objc_msgSend(v17, "objectAtIndex:", v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      v39 = v38;
      objc_msgSend(v17, "objectAtIndex:", v31);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "doubleValue");
      v5->_percentile95 = (unint64_t)((v39 + v41) * 0.5);

    }
  }

  return v5;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)mean
{
  return self->_mean;
}

- (void)setMean:(unint64_t)a3
{
  self->_mean = a3;
}

- (unint64_t)median
{
  return self->_median;
}

- (void)setMedian:(unint64_t)a3
{
  self->_median = a3;
}

- (unint64_t)percentile95
{
  return self->_percentile95;
}

- (void)setPercentile95:(unint64_t)a3
{
  self->_percentile95 = a3;
}

- (unint64_t)min
{
  return self->_min;
}

- (void)setMin:(unint64_t)a3
{
  self->_min = a3;
}

- (unint64_t)max
{
  return self->_max;
}

- (void)setMax:(unint64_t)a3
{
  self->_max = a3;
}

@end
