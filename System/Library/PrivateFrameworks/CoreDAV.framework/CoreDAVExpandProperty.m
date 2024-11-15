@implementation CoreDAVExpandProperty

- (CoreDAVExpandProperty)initWithPropertiesToFind:(id)a3 expandedName:(id)a4 expandedNameSpace:(id)a5
{
  id v9;
  id v10;
  id v11;
  CoreDAVExpandProperty *v12;
  CoreDAVExpandProperty *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVExpandProperty;
  v12 = -[CoreDAVExpandProperty init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_propertiesToFind, a3);
    objc_storeStrong((id *)&v13->_expandedName, a4);
    objc_storeStrong((id *)&v13->_expandedNameSpace, a5);
  }

  return v13;
}

- (NSSet)propertiesToFind
{
  return self->_propertiesToFind;
}

- (void)setPropertiesToFind:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesToFind, a3);
}

- (NSString)expandedName
{
  return self->_expandedName;
}

- (void)setExpandedName:(id)a3
{
  objc_storeStrong((id *)&self->_expandedName, a3);
}

- (NSString)expandedNameSpace
{
  return self->_expandedNameSpace;
}

- (void)setExpandedNameSpace:(id)a3
{
  objc_storeStrong((id *)&self->_expandedNameSpace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedNameSpace, 0);
  objc_storeStrong((id *)&self->_expandedName, 0);
  objc_storeStrong((id *)&self->_propertiesToFind, 0);
}

@end
