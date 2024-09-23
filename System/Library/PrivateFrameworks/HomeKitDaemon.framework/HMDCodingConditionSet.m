@implementation HMDCodingConditionSet

+ (HMDCodingConditionSet)resolve:(void *)a3 fromSet:
{
  uint64_t v5;
  unint64_t v7;
  HMDCodingConditionSet *v8;
  SEL v9;
  id v10;

  objc_opt_self();
  if (!a3)
    return 0;
  v5 = objc_msgSend(a3, "indexOfObject:", a2);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7 = v5;
  objc_opt_self();
  if (v7 < 0x40)
    return (HMDCodingConditionSet *)(1 << v7);
  v8 = (HMDCodingConditionSet *)_HMFPreconditionFailure();
  return -[HMDCodingConditionSet initWithModel:](v8, v9, v10);
}

- (HMDCodingConditionSet)initWithModel:(id)a3
{
  HMDCodingConditionSet *v4;
  HMDCodingConditionSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDCodingConditionSet;
  v4 = -[HMDCodingConditionSet init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_model, a3);
  return v5;
}

- (HMDCodingConditionSet)initWithModel:(id)a3 conditions:(id)a4
{
  HMDCodingConditionSet *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = -[HMDCodingConditionSet initWithModel:](self, "initWithModel:", a3);
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = a4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[HMDCodingConditionSet addCondition:](v5, "addCondition:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (void)addCondition:(id)a3
{
  self->_bitmask |= (unint64_t)-[HMDCodingConditionSet resolve:](self, (uint64_t)a3);
}

- (void)removeCondition:(id)a3
{
  self->_bitmask &= ~(unint64_t)-[HMDCodingConditionSet resolve:](self, (uint64_t)a3);
}

- (id)description
{
  HMDManagedObjectCodingModel *model;
  unint64_t bitmask;
  NSOrderedSet *conditions;
  id v5;
  id v6;
  __CFString *v7;
  uint64_t v9;
  uint64_t v10;
  HMDCodingConditionSet *(*v11)(uint64_t, uint64_t, unint64_t);
  void *v12;
  id v13;
  unint64_t v14;

  model = self->_model;
  bitmask = self->_bitmask;
  if (model)
    conditions = model->_conditions;
  else
    conditions = 0;
  objc_opt_self();
  if (bitmask)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __55__HMDCodingConditionSet_descriptionForBitmask_withSet___block_invoke;
    v12 = &unk_24E77DFE0;
    v13 = v5;
    v14 = bitmask;
    v6 = v5;
    -[NSOrderedSet enumerateObjectsUsingBlock:](conditions, "enumerateObjectsUsingBlock:", &v9);
    v7 = (__CFString *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  }
  else
  {
    v7 = CFSTR("<none>");
  }
  return v7;
}

- (unint64_t)hash
{
  return self->_bitmask ^ -[HMDManagedObjectCodingModel hash](self->_model, "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && (HMDManagedObjectCodingModel *)*((_QWORD *)a3 + 1) == self->_model
      && *((_QWORD *)a3 + 2) == self->_bitmask;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithModel:", self->_model);
  *((_QWORD *)result + 2) = self->_bitmask;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

HMDCodingConditionSet *__55__HMDCodingConditionSet_descriptionForBitmask_withSet___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  HMDCodingConditionSet *result;
  HMDCodingConditionSet *v7;
  uint64_t v8;

  result = (HMDCodingConditionSet *)objc_opt_self();
  if (a3 >= 0x40)
  {
    v7 = (HMDCodingConditionSet *)_HMFPreconditionFailure();
    return -[HMDCodingConditionSet resolve:](v7, v8);
  }
  else if (((*(_QWORD *)(a1 + 40) >> a3) & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("|"));
    return (HMDCodingConditionSet *)objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
  }
  return result;
}

- (HMDCodingConditionSet)resolve:(HMDCodingConditionSet *)result
{
  HMDManagedObjectCodingModel *model;
  NSOrderedSet *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    model = result->_model;
    v4 = model ? model->_conditions : 0;
    result = +[HMDCodingConditionSet resolve:fromSet:]((uint64_t)HMDCodingConditionSet, a2, v4);
    if (!result)
    {
      v5 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543618;
        v9 = v7;
        v10 = 2114;
        v11 = a2;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring coding condition '%{public}@' that is not defined in the coding model", (uint8_t *)&v8, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      return 0;
    }
  }
  return result;
}

@end
