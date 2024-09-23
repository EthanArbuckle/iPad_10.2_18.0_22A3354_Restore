@implementation MAEdgeFilter

- (BOOL)matchesEdge:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MAEdgeFilter;
  return -[MAElementFilter matchesElement:](&v4, sel_matchesElement_, a3);
}

- (KGEdgeFilter)kgEdgeFilter
{
  KGEdgeFilter *v3;
  void *v4;
  void *v5;
  void *v6;
  KGEdgeFilter *v7;

  v3 = [KGEdgeFilter alloc];
  -[MAElementFilter kgRequiredLabels](self, "kgRequiredLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementFilter kgOptionalLabels](self, "kgOptionalLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementFilter properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[KGElementFilter initWithRequiredLabels:optionalLabels:properties:](v3, "initWithRequiredLabels:optionalLabels:properties:", v4, v5, v6);

  return v7;
}

- (void)appendVisualStringToString:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "appendString:", CFSTR("["));
  v5.receiver = self;
  v5.super_class = (Class)MAEdgeFilter;
  -[MAElementFilter appendVisualStringToString:](&v5, sel_appendVisualStringToString_, v4);
  objc_msgSend(v4, "appendString:", CFSTR("]"));

}

- (MARelation)outRelation
{
  return (MARelation *)-[MANeighborRelation initWithEdgeType:edgeFilter:]([MANeighborRelation alloc], "initWithEdgeType:edgeFilter:", 2, self);
}

- (MARelation)inRelation
{
  return (MARelation *)-[MANeighborRelation initWithEdgeType:edgeFilter:]([MANeighborRelation alloc], "initWithEdgeType:edgeFilter:", 1, self);
}

- (MARelation)anyDirectionRelation
{
  return (MARelation *)-[MANeighborRelation initWithEdgeType:edgeFilter:]([MANeighborRelation alloc], "initWithEdgeType:edgeFilter:", 3, self);
}

- (id)relationWithType:(unint64_t)a3
{
  return -[MANeighborRelation initWithEdgeType:edgeFilter:]([MANeighborRelation alloc], "initWithEdgeType:edgeFilter:", a3, self);
}

+ (BOOL)scanInstance:(id *)a3 withScanner:(id)a4
{
  id v6;
  char v7;
  objc_super v9;

  v6 = a4;
  if (objc_msgSend(v6, "scanString:intoString:", CFSTR("["), 0)
    && (v9.receiver = a1,
        v9.super_class = (Class)&OBJC_METACLASS___MAEdgeFilter,
        objc_msgSendSuper2(&v9, sel_scanInstance_withScanner_, a3, v6)))
  {
    v7 = objc_msgSend(v6, "scanString:intoString:", CFSTR("]"), 0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)edgeFilterWithVisualString:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3900];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  objc_msgSend(a1, "scanFilterWithScanner:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
