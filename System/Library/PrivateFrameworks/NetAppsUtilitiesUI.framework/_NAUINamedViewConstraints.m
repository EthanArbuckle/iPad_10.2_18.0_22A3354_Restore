@implementation _NAUINamedViewConstraints

- (_NAUINamedViewConstraints)initWithName:(id)a3 constraints:(id)a4 stalenessToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  _NAUINamedViewConstraints *v12;
  _NAUINamedViewConstraints *v13;
  id v14;
  id stalenessToken;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_NAUINamedViewConstraints;
  v12 = -[_NAUINamedViewConstraints init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_constraints, a4);
    if (v11)
    {
      v14 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    stalenessToken = v13->_stalenessToken;
    v13->_stalenessToken = v14;

  }
  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (id)stalenessToken
{
  return self->_stalenessToken;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stalenessToken, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
