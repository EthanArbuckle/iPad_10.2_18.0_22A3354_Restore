@implementation DURequestContentTypeObjC

- (DURequestContentTypeObjC)initWithOptions:(unint64_t)a3
{
  DURequestContentTypeObjC *v4;
  DURequestContentTypeObjC *v5;
  _TtC21DocumentUnderstanding20DURequestContentType *v6;
  void *v7;
  uint64_t v8;
  _TtC21DocumentUnderstanding20DURequestContentType *underlyingRequestType;
  DURequestContentTypeObjC *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DURequestContentTypeObjC;
  v4 = -[DURequestContentTypeObjC init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = [_TtC21DocumentUnderstanding20DURequestContentType alloc];
    -[DURequestContentTypeObjC _typesForOptions:](v5, "_typesForOptions:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[DURequestContentType initWithAbilitiesToUnion:](v6, "initWithAbilitiesToUnion:", v7);
    underlyingRequestType = v5->_underlyingRequestType;
    v5->_underlyingRequestType = (_TtC21DocumentUnderstanding20DURequestContentType *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)_typesForOptions:(unint64_t)a3
{
  __int16 v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    +[DURequestContentType languageTag](_TtC21DocumentUnderstanding20DURequestContentType, "languageTag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  +[DURequestContentType wikiDataTopic](_TtC21DocumentUnderstanding20DURequestContentType, "wikiDataTopic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  +[DURequestContentType date](_TtC21DocumentUnderstanding20DURequestContentType, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  +[DURequestContentType address](_TtC21DocumentUnderstanding20DURequestContentType, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  +[DURequestContentType link](_TtC21DocumentUnderstanding20DURequestContentType, "link");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  +[DURequestContentType phoneNumber](_TtC21DocumentUnderstanding20DURequestContentType, "phoneNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  +[DURequestContentType navigationTitle](_TtC21DocumentUnderstanding20DURequestContentType, "navigationTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v13);

  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  +[DURequestContentType userInterfaceUnderstanding](_TtC21DocumentUnderstanding20DURequestContentType, "userInterfaceUnderstanding");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  if ((v3 & 0x100) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  +[DURequestContentType category](_TtC21DocumentUnderstanding20DURequestContentType, "category");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v15);

  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x400) == 0)
      goto LABEL_12;
LABEL_25:
    +[DURequestContentType posTags](_TtC21DocumentUnderstanding20DURequestContentType, "posTags");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

    if ((v3 & 0x800) == 0)
      return v4;
    goto LABEL_13;
  }
LABEL_24:
  +[DURequestContentType poem](_TtC21DocumentUnderstanding20DURequestContentType, "poem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

  if ((v3 & 0x400) != 0)
    goto LABEL_25;
LABEL_12:
  if ((v3 & 0x800) != 0)
  {
LABEL_13:
    +[DURequestContentType foundInEvent](_TtC21DocumentUnderstanding20DURequestContentType, "foundInEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  return v4;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRequestType, 0);
}

@end
