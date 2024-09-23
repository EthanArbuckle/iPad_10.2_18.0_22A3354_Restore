@implementation EDAMIdentityForAdmin

+ (id)structName
{
  return CFSTR("IdentityForAdmin");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1058;
  if (!structFields_structFields_1058)
  {
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 1, CFSTR("identity"), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("state"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 10, 1, CFSTR("stateChanged"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_1058;
    structFields_structFields_1058 = v6;

    v2 = (void *)structFields_structFields_1058;
  }
  return v2;
}

- (EDAMIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (NSNumber)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSNumber)stateChanged
{
  return self->_stateChanged;
}

- (void)setStateChanged:(id)a3
{
  objc_storeStrong((id *)&self->_stateChanged, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChanged, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
