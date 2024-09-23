@implementation CRKASMCourseSizeLimitingRosterProvider

- (CRKASMCourseSizeLimitingRosterProvider)initWithRosterProvider:(id)a3 maxUserCount:(int64_t)a4 maxTrustedUserCount:(int64_t)a5
{
  CRKASMCourseSizeLimitingRosterProvider *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKASMCourseSizeLimitingRosterProvider;
  result = -[CRKASMRosterProviderDecoratorBase initWithRosterProvider:](&v8, sel_initWithRosterProvider_, a3);
  if (result)
  {
    result->_maxUserCount = a4;
    result->_maxTrustedUserCount = a5;
  }
  return result;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_msgSend(v6, "updateProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = -[CRKASMCourseSizeLimitingRosterProvider isLegalToUpdateCourse:withProperties:error:](self, "isLegalToUpdateCourse:withProperties:error:", 0, v8, &v12);
  v10 = v12;

  if (v9)
  {
    -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createCourseWithProperties:completion:", v6, v7);

  }
  else
  {
    v7[2](v7, v10);
  }

}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  -[CRKASMCourseSizeLimitingRosterProvider courseForIdentifier:](self, "courseForIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12 = -[CRKASMCourseSizeLimitingRosterProvider isLegalToUpdateCourse:withProperties:error:](self, "isLegalToUpdateCourse:withProperties:error:", v11, v9, &v15);
  v13 = v15;
  if (v12)
  {
    -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateCourseWithIdentifier:properties:completion:", v8, v9, v10);

  }
  else
  {
    v10[2](v10, v13);
  }

}

- (BOOL)isLegalToUpdateCourse:(id)a3 withProperties:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;

  v8 = (void *)MEMORY[0x24BDBCEF0];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "users");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x24BDBD1A8];
  if (v11)
    v14 = v11;
  else
    v14 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v8, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "usersToAdd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unionSet:", v16);

  objc_msgSend(v9, "usersToRemove");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minusSet:", v17);

  v18 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v10, "trustedUsers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v19;
  else
    v20 = v13;
  objc_msgSend(v18, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "trustedUsersToAdd");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unionSet:", v22);

  objc_msgSend(v9, "trustedUsersToRemove");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "minusSet:", v23);
  v24 = objc_msgSend(v15, "count");
  if (v24 <= -[CRKASMCourseSizeLimitingRosterProvider maxUserCount](self, "maxUserCount")
    && (v25 = objc_msgSend(v21, "count"),
        v25 <= -[CRKASMCourseSizeLimitingRosterProvider maxTrustedUserCount](self, "maxTrustedUserCount")))
  {
    v26 = 1;
  }
  else if (a5)
  {
    CRKErrorWithCodeAndUserInfo(155, 0);
    v26 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)courseForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "roster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "courses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__CRKASMCourseSizeLimitingRosterProvider_courseForIdentifier___block_invoke;
  v11[3] = &unk_24D9C8160;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "crk_firstMatching:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __62__CRKASMCourseSizeLimitingRosterProvider_courseForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (int64_t)maxUserCount
{
  return self->_maxUserCount;
}

- (int64_t)maxTrustedUserCount
{
  return self->_maxTrustedUserCount;
}

@end
