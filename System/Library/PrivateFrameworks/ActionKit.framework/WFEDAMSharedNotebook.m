@implementation WFEDAMSharedNotebook

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFEDAMSharedNotebook notebookGuid](self, "notebookGuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("notebookGuid"));

}

- (WFEDAMSharedNotebook)initWithCoder:(id)a3
{
  id v4;
  WFEDAMSharedNotebook *v5;
  void *v6;
  uint64_t v7;
  NSString *notebookGuid;
  WFEDAMSharedNotebook *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFEDAMSharedNotebook;
  v5 = -[WFEDAMSharedNotebook init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notebookGuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    notebookGuid = v5->_notebookGuid;
    v5->_notebookGuid = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

- (void)setNotebookGuid:(id)a3
{
  objc_storeStrong((id *)&self->_notebookGuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notebookGuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
