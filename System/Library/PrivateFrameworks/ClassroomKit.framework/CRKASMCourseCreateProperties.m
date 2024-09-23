@implementation CRKASMCourseCreateProperties

- (CRKASMCourseUpdateProperties)updateProperties
{
  CRKASMCourseUpdateProperties *updateProperties;
  CRKASMCourseUpdateProperties *v4;
  CRKASMCourseUpdateProperties *v5;

  updateProperties = self->_updateProperties;
  if (!updateProperties)
  {
    v4 = (CRKASMCourseUpdateProperties *)objc_opt_new();
    v5 = self->_updateProperties;
    self->_updateProperties = v4;

    updateProperties = self->_updateProperties;
  }
  return updateProperties;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CRKASMCourseCreateProperties location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocation:", v5);

  -[CRKASMCourseCreateProperties updateProperties](self, "updateProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpdateProperties:", v6);

  return v4;
}

- (BOOL)areFulfilledByCourse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[CRKASMCourseCreateProperties location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v8))
  {
    -[CRKASMCourseCreateProperties updateProperties](self, "updateProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "areFulfilledByCourse:", v4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CRKASMLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setUpdateProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateProperties, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
