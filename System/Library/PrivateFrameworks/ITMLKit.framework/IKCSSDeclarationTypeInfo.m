@implementation IKCSSDeclarationTypeInfo

- (IKCSSDeclarationTypeInfo)initWithType:(unint64_t)a3 name:(id)a4
{
  id v7;
  IKCSSDeclarationTypeInfo *v8;
  IKCSSDeclarationTypeInfo *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IKCSSDeclarationTypeInfo;
  v8 = -[IKCSSDeclarationTypeInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_name, a4);
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
