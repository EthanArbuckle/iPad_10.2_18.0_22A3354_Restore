@implementation SWCollaborationShareOptions

+ (SWCollaborationShareOptions)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (SWCollaborationShareOptions *)+[SWCollaborationShareOptions allocWithZone:](_SWCollaborationShareOptions, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SWCollaborationShareOptions;
  return (SWCollaborationShareOptions *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (SWCollaborationShareOptions)initWithOptionsGroups:(NSArray *)optionsGroups summary:(NSString *)summary
{
  NSArray *v6;
  NSString *v7;
  SWCollaborationShareOptions *v8;
  uint64_t v9;
  NSArray *v10;
  objc_super v12;

  v6 = optionsGroups;
  v7 = summary;
  v12.receiver = self;
  v12.super_class = (Class)SWCollaborationShareOptions;
  v8 = -[SWCollaborationShareOptions init](&v12, sel_init);
  if (v8)
  {
    v9 = -[NSArray copy](v6, "copy");
    v10 = v8->_optionsGroups;
    v8->_optionsGroups = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_summary, summary);
  }

  return v8;
}

- (SWCollaborationShareOptions)initWithOptionsGroups:(NSArray *)optionsGroups
{
  NSArray *v4;
  void *v5;
  void *v6;
  SWCollaborationShareOptions *v7;

  v4 = optionsGroups;
  SWCoreFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Share Options"), &stru_1E217B478, CFSTR("SharedWithYouCore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SWCollaborationShareOptions initWithOptionsGroups:summary:](self, "initWithOptionsGroups:summary:", v4, v6);

  return v7;
}

+ (SWCollaborationShareOptions)shareOptionsWithOptionsGroups:(NSArray *)optionsGroups summary:(NSString *)summary
{
  NSString *v6;
  NSArray *v7;
  void *v8;

  v6 = summary;
  v7 = optionsGroups;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOptionsGroups:summary:", v7, v6);

  return (SWCollaborationShareOptions *)v8;
}

+ (SWCollaborationShareOptions)shareOptionsWithOptionsGroups:(NSArray *)optionsGroups
{
  NSArray *v4;
  void *v5;

  v4 = optionsGroups;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOptionsGroups:", v4);

  return (SWCollaborationShareOptions *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SWCollaborationShareOptions *v4;
  SWCollaborationShareOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = self;
  v11.receiver = v4;
  v11.super_class = (Class)SWCollaborationShareOptions;
  v5 = -[SWCollaborationShareOptions init](&v11, sel_init);
  if (v5)
  {
    -[SWCollaborationShareOptions summary](v4, "summary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    -[SWCollaborationShareOptions setSummary:](v5, "setSummary:", v7);

    -[SWCollaborationShareOptions optionsGroups](v4, "optionsGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
    -[SWCollaborationShareOptions setOptionsGroups:](v5, "setOptionsGroups:", v9);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SWCollaborationShareOptions isEqualToShareOptions:](self, "isEqualToShareOptions:", v4);

  return v5;
}

- (BOOL)isEqualToShareOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  SWCollaborationShareOptions *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = (SWCollaborationShareOptions *)a3;
  if (v7 == self)
  {
    v10 = 1;
    goto LABEL_20;
  }
  -[SWCollaborationShareOptions summary](self, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (-[SWCollaborationShareOptions summary](v7, "summary"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationShareOptions summary](self, "summary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationShareOptions summary](v7, "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v9 = 1;
  }
  else
  {
    v15 = 0;
    v9 = 0;
  }
  -[SWCollaborationShareOptions optionsGroups](self, "optionsGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (-[SWCollaborationShareOptions optionsGroups](v7, "optionsGroups"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationShareOptions optionsGroups](self, "optionsGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationShareOptions optionsGroups](v7, "optionsGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isEqual:", v13);

    if (v11)
      goto LABEL_15;
  }
  else
  {
    v10 = 1;
  }

LABEL_15:
  if (v9)
    goto LABEL_16;
LABEL_17:
  if (!v8)

LABEL_20:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWCollaborationShareOptions)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  SWCollaborationShareOptions *v5;
  uint64_t v6;
  NSString *summary;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *optionsGroups;
  objc_super v17;

  v4 = coder;
  v17.receiver = self;
  v17.super_class = (Class)SWCollaborationShareOptions;
  v5 = -[SWCollaborationShareOptions init](&v17, sel_init);
  if (v5)
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summary"));
    v6 = objc_claimAutoreleasedReturnValue();
    summary = v5->_summary;
    v5->_summary = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("optionsGroups"));
    v14 = objc_claimAutoreleasedReturnValue();
    optionsGroups = v5->_optionsGroups;
    v5->_optionsGroups = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SWCollaborationShareOptions summary](self, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("summary"));

  -[SWCollaborationShareOptions optionsGroups](self, "optionsGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("optionsGroups"));

}

- (NSArray)optionsGroups
{
  return self->_optionsGroups;
}

- (void)setOptionsGroups:(NSArray *)optionsGroups
{
  objc_setProperty_nonatomic_copy(self, a2, optionsGroups, 8);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(NSString *)summary
{
  objc_setProperty_nonatomic_copy(self, a2, summary, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_optionsGroups, 0);
}

@end
