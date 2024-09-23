@implementation CTPerAppDataUsage

- (id)init:(id)a3 withPeriods:(unint64_t)a4
{
  id v7;
  CTPerAppDataUsage *v8;
  CTPerAppDataUsage *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  CTDataUsed *v13;
  CTDataUsage *v14;
  CTDataUsage *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *used;
  _QWORD v21[2];
  id v22;
  objc_super v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a4)
  {
    v23.receiver = self;
    v23.super_class = (Class)CTPerAppDataUsage;
    v8 = -[CTPerAppDataUsage init](&v23, sel_init);
    v9 = v8;
    if (v8)
    {
      v22 = v7;
      objc_storeStrong((id *)&v8->_displayName, a3);
      v21[1] = v21;
      v10 = 8 * a4;
      v11 = (char *)v21 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v11, 8 * a4);
      v12 = 0;
      do
      {
        v13 = [CTDataUsed alloc];
        v14 = -[CTDataUsage initWithHome:roaming:]([CTDataUsage alloc], "initWithHome:roaming:", 0, 0);
        v15 = -[CTDataUsage initWithHome:roaming:]([CTDataUsage alloc], "initWithHome:roaming:", 0, 0);
        v16 = -[CTDataUsed initWithUsage:proxied:](v13, "initWithUsage:proxied:", v14, v15);
        v17 = *(void **)&v11[8 * v12];
        *(_QWORD *)&v11[8 * v12] = v16;

        ++v12;
      }
      while (a4 != v12);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", (char *)v21 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
      v18 = objc_claimAutoreleasedReturnValue();
      used = v9->_used;
      v9->_used = (NSArray *)v18;

      do
      {

        v10 -= 8;
      }
      while (v10);
      v7 = v22;
    }
    self = v9;
    a4 = (unint64_t)self;
  }

  return (id)a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTPerAppDataUsage displayName](self, "displayName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  -[CTPerAppDataUsage used](self, "used");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CTPerAppDataUsage displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayNameKey"));

  -[CTPerAppDataUsage used](self, "used");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("usageKey"));

}

- (CTPerAppDataUsage)initWithCoder:(id)a3
{
  id v4;
  CTPerAppDataUsage *v5;
  uint64_t v6;
  NSString *displayName;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *used;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTPerAppDataUsage;
  v5 = -[CTPerAppDataUsage init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("usageKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    used = v5->_used;
    v5->_used = (NSArray *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)used
{
  return self->_used;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_used, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
