@implementation GDViewQuery

- (GDViewQuery)initWithNames:(id)a3 includeDependencies:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  GDViewQuery *v9;
  uint64_t v10;
  NSArray *names;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDViewQuery;
  v9 = -[GDViewQuery init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v6, v7, v8);
    names = v9->_names;
    v9->_names = (NSArray *)v10;

    v9->_includeDependencies = a4;
  }

  return v9;
}

- (GDViewQuery)initWithSchedule:(id)a3 includeDependencies:(BOOL)a4
{
  id v7;
  GDViewQuery *v8;
  GDViewQuery *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDViewQuery;
  v8 = -[GDViewQuery init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_schedule, a3);
    v9->_includeDependencies = a4;
  }

  return v9;
}

- (GDViewQuery)initWithAll
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GDViewQuery;
  return -[GDViewQuery init](&v3, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *names;
  id v5;
  void *v6;
  const char *v7;
  NSString *schedule;
  void *v9;
  const char *v10;
  _BOOL8 includeDependencies;
  const char *v12;
  id v13;

  names = self->_names;
  v5 = a3;
  NSStringFromSelector(sel_names);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)names, v6);

  schedule = self->_schedule;
  NSStringFromSelector(sel_schedule);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)schedule, v9);

  includeDependencies = self->_includeDependencies;
  NSStringFromSelector(sel_includeDependencies);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v12, includeDependencies, v13);

}

- (GDViewQuery)initWithCoder:(id)a3
{
  id v4;
  GDViewQuery *v5;
  GDViewQuery *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  GDViewQuery *v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)GDViewQuery;
  v5 = -[GDViewQuery init](&v30, sel_init);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_names);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    NSStringFromSelector(sel_schedule);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_includeDependencies);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_decodeBoolForKey_(v4, v20, (uint64_t)v19);

    objc_msgSend_error(v4, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v27 = 0;
    }
    else
    {
      if (v14)
      {
        v28 = (void *)objc_msgSend_initWithNames_includeDependencies_(v6, v25, (uint64_t)v14, v21);
      }
      else if (v18)
      {
        v28 = (void *)objc_msgSend_initWithSchedule_includeDependencies_(v6, v25, (uint64_t)v18, v21);
      }
      else
      {
        v28 = (void *)objc_msgSend_initWithAll(v6, v25, v26);
      }
      v6 = v28;
      v27 = v6;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSArray)names
{
  return self->_names;
}

- (NSString)schedule
{
  return self->_schedule;
}

- (BOOL)includeDependencies
{
  return self->_includeDependencies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_names, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
