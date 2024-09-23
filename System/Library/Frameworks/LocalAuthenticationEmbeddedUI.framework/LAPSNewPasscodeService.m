@implementation LAPSNewPasscodeService

- (LAPSNewPasscodeService)initWithPersistence:(id)a3
{
  id v5;
  LAPSNewPasscodeService *v6;
  LAPSNewPasscodeService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSNewPasscodeService;
  v6 = -[LAPSNewPasscodeService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_persistence, a3);

  return v7;
}

- (id)allowedPasscodeTypes
{
  void *v2;
  void *v3;
  void *v4;

  -[LAPSNewPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simplestAllowedNewPasscodeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "identifier"))
    -[LAPSNewPasscodeService allowedPasscodeTypes].cold.1();
  +[LAPSPasscodeTypeCollection allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo:](LAPSPasscodeTypeCollection, "allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo:", objc_msgSend(v3, "complexityRating"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)passcodeType
{
  void *v2;
  void *v3;

  -[LAPSNewPasscodeService persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultNewPasscodeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __CFString *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[LAPSNewPasscodeService persistence](self, "persistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v9 = objc_msgSend(v8, "verifyNewPasscodeMeetsPlatformRequirements:error:", v6, &v25);
  v10 = v25;

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v10, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      -[LAPSNewPasscodeService persistence](self, "persistence");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedPasscodeRequirements");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = &stru_24FDCE800;
      if (v21)
        v23 = (__CFString *)v21;
      v18 = v23;

    }
    v24 = +[LAPSErrorBuilder newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:](LAPSErrorBuilder, "newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:", v18);
    v7[2](v7, v24);

    goto LABEL_16;
  }
  objc_msgSend(v6, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasFixedLength") & 1) != 0)
  {
    objc_msgSend(v6, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "identifier");

    if (v13 != 4)
    {
      -[LAPSNewPasscodeService persistence](self, "persistence");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "verifyFixedLengthNumericPasscodeIsStrong:", v6);
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[LAPSNewPasscodeService persistence](self, "persistence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "verifyVariableLengthAlphanumericPasscodeIsStrong:", v6);
LABEL_9:
  v19 = v15;

  if ((v19 & 1) == 0)
  {
    v18 = +[LAPSErrorBuilder newPasscodeIsTooEasyError](LAPSErrorBuilder, "newPasscodeIsTooEasyError");
    v7[2](v7, v18);
LABEL_16:

    goto LABEL_17;
  }
  v7[2](v7, 0);
LABEL_17:

}

- (LAPSPasscodePersistence)persistence
{
  return self->_persistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
}

- (void)allowedPasscodeTypes
{
  __assert_rtn("-[LAPSNewPasscodeService allowedPasscodeTypes]", "LAPSNewPasscodeService.m", 26, "[simplestAllowedPasscodeType identifier] != LAPSPasscodeTypeIdentifierNone");
}

@end
