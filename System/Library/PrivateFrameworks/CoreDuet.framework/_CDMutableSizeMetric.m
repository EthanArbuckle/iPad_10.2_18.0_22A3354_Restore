@implementation _CDMutableSizeMetric

- (_CDMutableSizeMetric)initWithName:(id)a3 string:(id)a4 scale:(unint64_t)a5 family:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CDMutableSizeMetric;
  return -[_CDSizeMetric initWithName:string:scale:family:](&v7, sel_initWithName_string_scale_family_, a3, a4, a5, a6);
}

- (void)addBytes:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t *v9;
  unint64_t v10;
  id obj;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v5 = *(_QWORD *)(a1 + 16);
    v6 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v6 + 1;
    v7 = a2 / v5;
    objc_storeStrong((id *)(a1 + 80), obj);
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 64) += v7;
    if (v6)
    {
      v8 = (unint64_t *)(a1 + 48);
      if (v7 >= *(_QWORD *)(a1 + 48))
      {
        v10 = *(_QWORD *)(a1 + 56);
        v9 = (unint64_t *)(a1 + 56);
        if (v7 <= v10)
        {
LABEL_8:
          os_unfair_lock_unlock(v4);

          return;
        }
        v8 = v9;
      }
    }
    else
    {
      objc_storeStrong((id *)(a1 + 72), obj);
      *(_QWORD *)(a1 + 32) = v7;
      *(_QWORD *)(a1 + 48) = v7;
      v8 = (unint64_t *)(a1 + 56);
    }
    *v8 = v7;
    goto LABEL_8;
  }
}

- (id)description
{
  objc_class *v3;
  const char *v4;
  id v5;
  SEL v6;
  id Property;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v19 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v5 = objc_getProperty(self, v4, 88, 1);
    Property = objc_getProperty(self, v6, 96, 1);
  }
  else
  {
    v5 = 0;
    Property = 0;
  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v18 = Property;
  objc_msgSend(v8, "numberWithUnsignedInteger:", -[_CDSizeMetric count]((os_unfair_lock_s *)self));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSizeMetric firstUpdate]((os_unfair_lock_s *)self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDSizeMetric firstSize]((os_unfair_lock_s *)self));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSizeMetric lastUpdate]((os_unfair_lock_s *)self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDSizeMetric lastSize]((os_unfair_lock_s *)self));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDSizeMetric minimumSize]((os_unfair_lock_s *)self));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDSizeMetric maximumSize]((os_unfair_lock_s *)self));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -[_CDSizeMetric averageSize]((uint64_t)self));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: { name=%@, text='%@', count=%@, firstUpdate=%@, firstSize=%@, lastUpdate=%@, lastSize=%@, minimumSize=%@, maximumSize=%@, averageSize=%@ }"), v21, v5, v18, v17, v9, v10, v11, v12, v13, v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
