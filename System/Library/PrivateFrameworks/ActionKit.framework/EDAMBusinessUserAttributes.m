@implementation EDAMBusinessUserAttributes

+ (id)structName
{
  return CFSTR("BusinessUserAttributes");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_290;
  if (!structFields_structFields_290)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("title"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("location"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("department"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("mobilePhone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("linkedInProfileUrl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("workPhone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("companyStartDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[6] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)structFields_structFields_290;
    structFields_structFields_290 = v10;

    v2 = (void *)structFields_structFields_290;
  }
  return v2;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)department
{
  return self->_department;
}

- (void)setDepartment:(id)a3
{
  objc_storeStrong((id *)&self->_department, a3);
}

- (NSString)mobilePhone
{
  return self->_mobilePhone;
}

- (void)setMobilePhone:(id)a3
{
  objc_storeStrong((id *)&self->_mobilePhone, a3);
}

- (NSString)linkedInProfileUrl
{
  return self->_linkedInProfileUrl;
}

- (void)setLinkedInProfileUrl:(id)a3
{
  objc_storeStrong((id *)&self->_linkedInProfileUrl, a3);
}

- (NSString)workPhone
{
  return self->_workPhone;
}

- (void)setWorkPhone:(id)a3
{
  objc_storeStrong((id *)&self->_workPhone, a3);
}

- (NSNumber)companyStartDate
{
  return self->_companyStartDate;
}

- (void)setCompanyStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_companyStartDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companyStartDate, 0);
  objc_storeStrong((id *)&self->_workPhone, 0);
  objc_storeStrong((id *)&self->_linkedInProfileUrl, 0);
  objc_storeStrong((id *)&self->_mobilePhone, 0);
  objc_storeStrong((id *)&self->_department, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
