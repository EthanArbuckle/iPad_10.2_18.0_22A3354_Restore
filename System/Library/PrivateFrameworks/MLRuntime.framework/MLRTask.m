@implementation MLRTask

- (MLRTask)initWithParameters:(id)a3 attachments:(id)a4
{
  id v7;
  id v8;
  MLRTask *v9;
  MLRTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLRTask;
  v9 = -[MLRTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameters, a3);
    objc_storeStrong((id *)&v10->_attachments, a4);
  }

  return v10;
}

- (MLRTask)initWithDodMLTask:(id)a3
{
  id v5;
  MLRTaskParameters *v6;
  void *v7;
  MLRTaskParameters *v8;
  MLRTaskAttachments *v9;
  void *v10;
  MLRTaskAttachments *v11;
  MLRTask *v12;

  objc_storeStrong((id *)&self->_DESTask, a3);
  v5 = a3;
  v6 = [MLRTaskParameters alloc];
  objc_msgSend(v5, "recipe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MLRTaskParameters initWithDESRecipe:](v6, "initWithDESRecipe:", v7);
  v9 = [MLRTaskAttachments alloc];
  objc_msgSend(v5, "recipe");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[MLRTaskAttachments initWithDESRecipe:](v9, "initWithDESRecipe:", v10);
  v12 = -[MLRTask initWithParameters:attachments:](self, "initWithParameters:attachments:", v8, v11);

  return v12;
}

- (MLRTask)initWithParametersDict:(id)a3
{
  id v4;
  MLRTaskParameters *v5;
  MLRTaskAttachments *v6;
  MLRTaskAttachments *v7;
  MLRTask *v8;

  v4 = a3;
  v5 = -[MLRTaskParameters initWithParametersDict:]([MLRTaskParameters alloc], "initWithParametersDict:", v4);

  v6 = [MLRTaskAttachments alloc];
  v7 = -[MLRTaskAttachments initWithURLs:](v6, "initWithURLs:", MEMORY[0x24BDBD1A8]);
  v8 = -[MLRTask initWithParameters:attachments:](self, "initWithParameters:attachments:", v5, v7);

  return v8;
}

- (MLRTask)initWithParameters:(id)a3 attachments:(id)a4 internalTask:(id)a5
{
  id v9;
  MLRTask *v10;
  MLRTask *v11;

  v9 = a5;
  v10 = -[MLRTask initWithParameters:attachments:](self, "initWithParameters:attachments:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong(&v10->_internalTask, a5);

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nparameters:\n\t%@\nattachmentURLs:\n\t%@\n"), v5, self->_parameters, self->_attachments);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MLRTaskParameters *parameters;
  id v5;

  parameters = self->_parameters;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", parameters, CFSTR("parameters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachments, CFSTR("attachments"));

}

- (MLRTask)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MLRTask *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MLRTask initWithParameters:attachments:](self, "initWithParameters:attachments:", v5, v6);
  return v7;
}

- (MLRTaskParameters)parameters
{
  return self->_parameters;
}

- (MLRTaskAttachments)attachments
{
  return self->_attachments;
}

- (DESInternalDodMLTask)DESTask
{
  return self->_DESTask;
}

- (id)internalTask
{
  return self->_internalTask;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internalTask, 0);
  objc_storeStrong((id *)&self->_DESTask, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
