@implementation WFEDAMLinkedNotebook

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFEDAMLinkedNotebook shareName](self, "shareName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("shareName"));

}

- (WFEDAMLinkedNotebook)initWithCoder:(id)a3
{
  id v4;
  WFEDAMLinkedNotebook *v5;
  void *v6;
  uint64_t v7;
  NSString *shareName;
  WFEDAMLinkedNotebook *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFEDAMLinkedNotebook;
  v5 = -[WFEDAMLinkedNotebook init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    shareName = v5->_shareName;
    v5->_shareName = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (NSString)shareName
{
  return self->_shareName;
}

- (void)setShareName:(id)a3
{
  objc_storeStrong((id *)&self->_shareName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
