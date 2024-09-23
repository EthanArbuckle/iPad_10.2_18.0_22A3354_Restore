@implementation BSUIDateLabelFactory

+ (id)sharedInstance
{
  if (qword_1ECEC3930 != -1)
    dispatch_once(&qword_1ECEC3930, &__block_literal_global_2);
  return (id)_MergedGlobals_10;
}

void __38__BSUIDateLabelFactory_sharedInstance__block_invoke()
{
  BSUIDateLabelFactory *v0;
  void *v1;

  v0 = objc_alloc_init(BSUIDateLabelFactory);
  v1 = (void *)_MergedGlobals_10;
  _MergedGlobals_10 = (uint64_t)v0;

}

- (BSUIDateLabelFactory)init
{
  BSUIDateLabelFactory *v2;
  uint64_t v3;
  NSMutableDictionary *recycledLabelsByStyle;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BSUIDateLabelFactory;
  v2 = -[BSUIDateLabelFactory init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    recycledLabelsByStyle = v2->_recycledLabelsByStyle;
    v2->_recycledLabelsByStyle = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__purgeRecycledLabels, *MEMORY[0x1E0CEB298], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB298], 0);

  v4.receiver = self;
  v4.super_class = (Class)BSUIDateLabelFactory;
  -[BSUIDateLabelFactory dealloc](&v4, sel_dealloc);
}

- (id)_labelWithStartDate:(void *)a3 endDate:(void *)a4 timeZone:(uint64_t)a5 allDay:(uint64_t)a6 forStyle:(uint64_t)a7 forType:
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  __objc2_class **v19;
  id v20;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anyObject");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v17, "removeObject:", v18);
LABEL_9:
    objc_msgSend(v18, "startCoalescingUpdates");
    objc_msgSend(v18, "setLabelType:", a7);
    objc_msgSend(v18, "setStartDate:withTimeZone:", v13, v15);
    if (v14)
      v20 = v14;
    else
      v20 = v13;
    objc_msgSend(v18, "setEndDate:withTimeZone:", v20, v15);
    objc_msgSend(v18, "setAllDay:", a5);
    objc_msgSend(v18, "stopCoalescingUpdates");
    goto LABEL_13;
  }
  if (a6 == 1)
  {
    v19 = off_1E43484E0;
  }
  else
  {
    if (a6)
    {
      v18 = 0;
      goto LABEL_13;
    }
    v19 = off_1E43484B8;
  }
  v18 = objc_alloc_init(*v19);
  if (v18)
    goto LABEL_9;
LABEL_13:

LABEL_14:
  return v18;
}

- (id)startLabelWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 forStyle:(int64_t)a7
{
  -[BSUIDateLabelFactory _labelWithStartDate:endDate:timeZone:allDay:forStyle:forType:]((uint64_t)self, a3, a4, a5, a6, a7, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)endLabelWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 forStyle:(int64_t)a7
{
  -[BSUIDateLabelFactory _labelWithStartDate:endDate:timeZone:allDay:forStyle:forType:]((uint64_t)self, a3, a4, a5, a6, a7, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)combinedDateLabelWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 forStyle:(int64_t)a7
{
  -[BSUIDateLabelFactory _labelWithStartDate:endDate:timeZone:allDay:forStyle:forType:]((uint64_t)self, a3, a4, a5, a6, a7, 2 * (a4 != 0));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recycleLabel:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[BSUIDateLabelFactory styleForLabel:](self, "styleForLabel:");
  if (v4 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_recycledLabelsByStyle, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_recycledLabelsByStyle, "setObject:forKey:");
    }
    objc_msgSend(v7, "prepareForReuse");
    if ((unint64_t)objc_msgSend(v6, "count") <= 9)
      objc_msgSend(v6, "addObject:", v7);

  }
}

- (int64_t)styleForLabel:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  if ((objc_msgSend(v4, "isEqual:", objc_opt_class()) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqual:", objc_opt_class()) - 1;

  return v5;
}

- (void)_purgeRecycledLabels
{
  -[NSMutableDictionary removeAllObjects](self->_recycledLabelsByStyle, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recycledLabelsByStyle, 0);
}

@end
