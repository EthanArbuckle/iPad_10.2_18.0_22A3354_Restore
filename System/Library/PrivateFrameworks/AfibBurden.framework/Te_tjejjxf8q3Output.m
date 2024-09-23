@implementation Te_tjejjxf8q3Output

- (Te_tjejjxf8q3Output)initWithRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:(id)a3
{
  id v5;
  Te_tjejjxf8q3Output *v6;
  Te_tjejjxf8q3Output *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Te_tjejjxf8q3Output;
  v6 = -[Te_tjejjxf8q3Output init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_25075A3C0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("RHYTHM_TYPE_HEAD/FC_1/fully_connected/BiasAdd")))
  {
    objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithMultiArray:", self->_RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (MLMultiArray)RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd
{
  return self->_RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd;
}

- (void)setRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:(id)a3
{
  objc_storeStrong((id *)&self->_RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd, 0);
}

@end
