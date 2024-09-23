@implementation HKValueHistogramCollection

- (HKValueHistogramCollection)initWithQuantityRanges:(id)a3 valueHistogramsByDateIntervalIndex:(id)a4 anchorDate:(id)a5 intervalComponents:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKValueHistogramCollection *v15;
  HKValueHistogramCollection *v16;
  _HKDateIntervalCollection *v17;
  _HKDateIntervalCollection *intervalCollection;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HKValueHistogramCollection;
  v15 = -[HKValueHistogramCollection init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_quantityRanges, a3);
    objc_storeStrong((id *)&v16->_valueHistogramsByDateIntervalIndex, a4);
    objc_storeStrong((id *)&v16->_anchorDate, a5);
    objc_storeStrong((id *)&v16->_intervalComponents, a6);
    v17 = -[_HKDateIntervalCollection initWithAnchorDate:intervalComponents:]([_HKDateIntervalCollection alloc], "initWithAnchorDate:intervalComponents:", v13, v14);
    intervalCollection = v16->_intervalCollection;
    v16->_intervalCollection = v17;

  }
  return v16;
}

- (NSArray)valueHistograms
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[NSDictionary allKeys](self->_valueHistogramsByDateIntervalIndex, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HKValueHistogramCollection_valueHistograms__block_invoke;
  v7[3] = &unk_1E37F0548;
  v7[4] = self;
  objc_msgSend(v4, "hk_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

uint64_t __45__HKValueHistogramCollection_valueHistograms__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", a2);
}

- (id)valueHistogramForDate:(id)a3
{
  id v4;
  NSDictionary *valueHistogramsByDateIntervalIndex;
  void *v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  v4 = -[_HKDateIntervalCollection dateIntervalContainingDate:index:](self->_intervalCollection, "dateIntervalContainingDate:index:", a3, &v9);
  valueHistogramsByDateIntervalIndex = self->_valueHistogramsByDateIntervalIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](valueHistogramsByDateIntervalIndex, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HKValueHistogramCollection *v4;
  HKValueHistogramCollection *v5;
  char v6;

  v4 = (HKValueHistogramCollection *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (-[HKValueHistogramCollection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    if (-[NSArray isEqual:](self->_quantityRanges, "isEqual:", v5->_quantityRanges)
      && -[NSDictionary isEqual:](self->_valueHistogramsByDateIntervalIndex, "isEqual:", v5->_valueHistogramsByDateIntervalIndex)&& -[NSDate isEqual:](self->_anchorDate, "isEqual:", v5->_anchorDate))
    {
      v6 = -[NSDateComponents isEqual:](self->_intervalComponents, "isEqual:", v5->_intervalComponents);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p quantityRanges=%@ valueHistograms=%@ anchorDate=%@ intervalComponents=%@>"), objc_opt_class(), self, self->_quantityRanges, self->_valueHistogramsByDateIntervalIndex, self->_anchorDate, self->_intervalComponents);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKValueHistogramCollection)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKValueHistogramCollection *v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "hk_typesForArrayOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("quantityRanges"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "hk_typesForDictionaryMapping:to:", v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("valueHistogramsByDateIntervalIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchorDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intervalComponents"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HKValueHistogramCollection initWithQuantityRanges:valueHistogramsByDateIntervalIndex:anchorDate:intervalComponents:](self, "initWithQuantityRanges:valueHistogramsByDateIntervalIndex:anchorDate:intervalComponents:", v7, v11, v12, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *quantityRanges;
  id v5;

  quantityRanges = self->_quantityRanges;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", quantityRanges, CFSTR("quantityRanges"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_valueHistogramsByDateIntervalIndex, CFSTR("valueHistogramsByDateIntervalIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchorDate, CFSTR("anchorDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intervalComponents, CFSTR("intervalComponents"));

}

- (NSArray)quantityRanges
{
  return self->_quantityRanges;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (NSDictionary)valueHistogramsByDateIntervalIndex
{
  return self->_valueHistogramsByDateIntervalIndex;
}

- (_HKDateIntervalCollection)intervalCollection
{
  return self->_intervalCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalCollection, 0);
  objc_storeStrong((id *)&self->_valueHistogramsByDateIntervalIndex, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_quantityRanges, 0);
}

@end
