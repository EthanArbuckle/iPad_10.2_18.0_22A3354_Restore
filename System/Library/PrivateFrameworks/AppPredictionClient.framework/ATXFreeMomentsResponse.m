@implementation ATXFreeMomentsResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFreeMomentsResponse)initWithFreeMoments:(id)a3
{
  id v4;
  ATXFreeMomentsResponse *v5;
  uint64_t v6;
  NSArray *freeMoments;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFreeMomentsResponse;
  v5 = -[ATXFreeMomentsResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    freeMoments = v5->_freeMoments;
    v5->_freeMoments = (NSArray *)v6;

  }
  return v5;
}

- (ATXFreeMomentsResponse)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  ATXFreeMomentsResponse *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeArrayOfObjectsOfClasses:forKey:", v6, CFSTR("freeMoments"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self = -[ATXFreeMomentsResponse initWithFreeMoments:](self, "initWithFreeMoments:", v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXFreeMomentsResponse freeMoments](self, "freeMoments");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("freeMoments"));

}

- (NSArray)freeMoments
{
  return self->_freeMoments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeMoments, 0);
}

@end
