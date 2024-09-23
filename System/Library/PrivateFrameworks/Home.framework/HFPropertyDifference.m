@implementation HFPropertyDifference

- (HFPropertyDifference)initWithObjectA:(id)a3 toObjectB:(id)a4 key:(id)a5 priority:(unint64_t)a6
{
  id v11;
  id v12;
  HFPropertyDifference *v13;
  HFPropertyDifference *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFPropertyDifference;
  v13 = -[HFDifference initWithKey:priority:](&v16, sel_initWithKey_priority_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_valueA, a3);
    objc_storeStrong(&v14->_valueB, a4);
  }

  return v14;
}

+ (id)compareObjectA:(id)a3 toObjectB:(id)a4 key:(id)a5 priority:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(a1, "object:isEqualToObject:", v10, v11) & 1) != 0)
    v13 = 0;
  else
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObjectA:toObjectB:key:priority:", v10, v11, v12, a6);

  return v13;
}

+ (BOOL)object:(id)a3 isEqualToObject:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  char v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {
    v11 = 1;
    v12 = v7;
    v13 = v7;
LABEL_16:

    goto LABEL_17;
  }
  if (!v7)
  {

    goto LABEL_7;
  }
  v10 = objc_msgSend(v7, "isEqual:", v8);

  if ((v10 & 1) == 0)
  {
LABEL_7:
    objc_opt_class();
    v14 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v13 = v15;

    objc_opt_class();
    v16 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v12 = v17;

    v11 = 0;
    if (v13 && v12)
    {
      v11 = objc_msgSend(v13, "isEqualToString:", v12);
      v12 = v16;
      v13 = v14;
    }
    goto LABEL_16;
  }
  v11 = 1;
LABEL_17:

  return v11;
}

- (id)descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFPropertyDifference;
  -[HFDifference descriptionBuilder](&v11, sel_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPropertyDifference valueA](self, "valueA");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_MergedGlobals_3 != -1)
    dispatch_once(&_MergedGlobals_3, &__block_literal_global_61_0);
  v5 = (id)qword_1ED378618;
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v4, v5);

  -[HFPropertyDifference valueB](self, "valueB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED378620 != -1)
    dispatch_once(&qword_1ED378620, &__block_literal_global_65_1);
  v8 = (id)qword_1ED378628;
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v7, v8);

  return v3;
}

void __42__HFPropertyDifference_descriptionBuilder__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED378618;
  qword_1ED378618 = (uint64_t)CFSTR("valueA");

}

void __42__HFPropertyDifference_descriptionBuilder__block_invoke_4()
{
  void *v0;

  v0 = (void *)qword_1ED378628;
  qword_1ED378628 = (uint64_t)CFSTR("valueB");

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFPropertyDifference;
  v4 = -[HFDifference copyWithZone:](&v11, sel_copyWithZone_, a3);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HFPropertyDifference valueA](self, "valueA");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValueA:", v8);

  -[HFPropertyDifference valueB](self, "valueB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValueB:", v9);

  return v7;
}

- (id)valueA
{
  return self->_valueA;
}

- (void)setValueA:(id)a3
{
  objc_storeStrong(&self->_valueA, a3);
}

- (id)valueB
{
  return self->_valueB;
}

- (void)setValueB:(id)a3
{
  objc_storeStrong(&self->_valueB, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueB, 0);
  objc_storeStrong(&self->_valueA, 0);
}

@end
