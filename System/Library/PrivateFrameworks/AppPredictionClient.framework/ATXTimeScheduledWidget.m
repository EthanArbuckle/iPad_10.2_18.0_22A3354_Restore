@implementation ATXTimeScheduledWidget

- (ATXTimeScheduledWidget)initWithContainer:(id)a3 kind:(id)a4 extensionId:(id)a5 family:(int64_t)a6
{
  return -[ATXTimeScheduledWidget initWithContainer:kind:extensionId:family:intentDescription:](self, "initWithContainer:kind:extensionId:family:intentDescription:", a3, a4, a5, a6, 0);
}

- (ATXTimeScheduledWidget)initWithContainer:(id)a3 kind:(id)a4 extensionId:(id)a5 family:(int64_t)a6 intentDescription:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ATXTimeScheduledWidget *v16;
  uint64_t v17;
  NSString *container;
  uint64_t v19;
  NSString *kind;
  uint64_t v21;
  NSString *extensionId;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ATXTimeScheduledWidget;
  v16 = -[ATXTimeScheduledWidget init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    container = v16->_container;
    v16->_container = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    kind = v16->_kind;
    v16->_kind = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    extensionId = v16->_extensionId;
    v16->_extensionId = (NSString *)v21;

    v16->_family = a6;
    objc_storeStrong((id *)&v16->_intentDescription, a7);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *kind;
  id v5;

  kind = self->_kind;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", kind, CFSTR("kind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionId, CFSTR("extension"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_container, CFSTR("container"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_family, CFSTR("family"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentDescription, CFSTR("intentDescription"));

}

- (ATXTimeScheduledWidget)initWithCoder:(id)a3
{
  id v4;
  ATXTimeScheduledWidget *v5;
  uint64_t v6;
  NSString *kind;
  uint64_t v8;
  NSString *extensionId;
  uint64_t v10;
  NSString *container;
  uint64_t v12;
  ATXCustomIntentDescription *intentDescription;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXTimeScheduledWidget;
  v5 = -[ATXTimeScheduledWidget init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v6 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extension"));
    v8 = objc_claimAutoreleasedReturnValue();
    extensionId = v5->_extensionId;
    v5->_extensionId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("container"));
    v10 = objc_claimAutoreleasedReturnValue();
    container = v5->_container;
    v5->_container = (NSString *)v10;

    v5->_family = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("family"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    intentDescription = v5->_intentDescription;
    v5->_intentDescription = (ATXCustomIntentDescription *)v12;

  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_kind, "hash");
  v4 = -[NSString hash](self->_extensionId, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_container, "hash");
  return self->_family - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

- (BOOL)isEqual:(id)a3
{
  ATXTimeScheduledWidget *v4;
  ATXTimeScheduledWidget *v5;
  BOOL v6;

  v4 = (ATXTimeScheduledWidget *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXTimeScheduledWidget isEqualToATXTimeScheduledWidget:](self, "isEqualToATXTimeScheduledWidget:", v5);

  return v6;
}

- (BOOL)isEqualToATXTimeScheduledWidget:(id)a3
{
  id *v4;
  NSString *container;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *kind;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *extensionId;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  BOOL v20;

  v4 = (id *)a3;
  container = self->_container;
  v6 = (NSString *)v4[1];
  if (container == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = container;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_11;
  }
  kind = self->_kind;
  v11 = (NSString *)v4[2];
  if (kind == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = kind;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  extensionId = self->_extensionId;
  v16 = (NSString *)v4[3];
  if (extensionId == v16)
  {

    goto LABEL_13;
  }
  v17 = v16;
  v18 = extensionId;
  v19 = -[NSString isEqual:](v18, "isEqual:", v17);

  if ((v19 & 1) != 0)
  {
LABEL_13:
    v20 = self->_family == (_QWORD)v4[4];
    goto LABEL_14;
  }
LABEL_11:
  v20 = 0;
LABEL_14:

  return v20;
}

- (NSString)container
{
  return self->_container;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)extensionId
{
  return self->_extensionId;
}

- (int64_t)family
{
  return self->_family;
}

- (ATXCustomIntentDescription)intentDescription
{
  return self->_intentDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentDescription, 0);
  objc_storeStrong((id *)&self->_extensionId, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
