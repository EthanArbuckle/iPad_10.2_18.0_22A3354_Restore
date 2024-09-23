@implementation FCUserVectorModelOutput

- (FCUserVectorModelOutput)initWithUser_vector:(id)a3
{
  id v5;
  FCUserVectorModelOutput *v6;
  FCUserVectorModelOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCUserVectorModelOutput;
  v6 = -[FCUserVectorModelOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_user_vector, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E470C8A0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("user_vector")))
  {
    v4 = (void *)MEMORY[0x1E0C9E918];
    -[FCUserVectorModelOutput user_vector](self, "user_vector");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureValueWithMultiArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)user_vector
{
  return self->_user_vector;
}

- (void)setUser_vector:(id)a3
{
  objc_storeStrong((id *)&self->_user_vector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user_vector, 0);
}

@end
