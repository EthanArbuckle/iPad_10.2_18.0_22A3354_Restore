@implementation ATXTimeSection

- (ATXTimeSection)initWithRows:(id)a3 title:(id)a4 kind:(unint64_t)a5
{
  return -[ATXTimeSection initWithRows:title:kind:representedTimeRangeStart:representedTimeRangeEnd:](self, "initWithRows:title:kind:representedTimeRangeStart:representedTimeRangeEnd:", a3, a4, a5, 0, 0);
}

- (ATXTimeSection)initWithRows:(id)a3 title:(id)a4 kind:(unint64_t)a5 representedTimeRangeStart:(id)a6 representedTimeRangeEnd:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXTimeSection *v17;
  uint64_t v18;
  NSArray *rows;
  uint64_t v20;
  NSString *title;
  ATXTimeSection *v22;
  void *v24;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXTimeSection.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rows"));

  }
  v25.receiver = self;
  v25.super_class = (Class)ATXTimeSection;
  v17 = -[ATXTimeSection init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    rows = v17->_rows;
    v17->_rows = (NSArray *)v18;

    v20 = objc_msgSend(v14, "copy");
    title = v17->_title;
    v17->_title = (NSString *)v20;

    v17->_kind = a5;
    objc_storeStrong((id *)&v17->_representedTimeRangeStart, a6);
    objc_storeStrong((id *)&v17->_representedTimeRangeEnd, a7);
    v22 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeSection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  ATXTimeSection *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, 0);

  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("rows"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kind"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeRangeStart"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeRangeEnd"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ATXTimeSection initWithRows:title:kind:representedTimeRangeStart:representedTimeRangeEnd:](self, "initWithRows:title:kind:representedTimeRangeStart:representedTimeRangeEnd:", v10, v11, v12, v13, v14);

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *rows;
  id v5;

  rows = self->_rows;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rows, CFSTR("rows"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_representedTimeRangeStart, CFSTR("timeRangeStart"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_representedTimeRangeEnd, CFSTR("timeRangeEnd"));

}

- (NSArray)rows
{
  return self->_rows;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (ATXTime)representedTimeRangeStart
{
  return self->_representedTimeRangeStart;
}

- (ATXTime)representedTimeRangeEnd
{
  return self->_representedTimeRangeEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedTimeRangeEnd, 0);
  objc_storeStrong((id *)&self->_representedTimeRangeStart, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
