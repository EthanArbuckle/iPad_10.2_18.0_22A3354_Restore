@implementation LinkActionURLQualifier

- (BOOL)allowCopyingOfURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7NewsUI222LinkActionURLQualifier *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v12;

  v4 = sub_1D6E15BE4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D6E15B78();
  v8 = self;
  v9 = (void *)sub_1D6E15B30();
  v10 = objc_msgSend(v9, sel_fc_isHardPaywallNewsArticleURL_, 0);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10 ^ 1;
}

- (BOOL)allowOpenInSafariForURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7NewsUI222LinkActionURLQualifier *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v12;

  v4 = sub_1D6E15BE4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D6E15B78();
  v8 = self;
  v9 = (void *)sub_1D6E15B30();
  v10 = objc_msgSend(v9, sel_fc_isNewsURL);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10 ^ 1;
}

- (BOOL)allowOpenInNewWindowForURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7NewsUI222LinkActionURLQualifier *v8;
  void *v9;
  unsigned int v10;
  _TtC7NewsUI222LinkActionURLQualifier *v11;
  unsigned __int8 v12;
  uint64_t v14;

  v4 = sub_1D6E15BE4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D6E15B78();
  v8 = self;
  v9 = (void *)sub_1D6E15B30();
  v10 = objc_msgSend(v9, sel_fc_isNewsURL);

  if (v10)
  {
    v11 = (_TtC7NewsUI222LinkActionURLQualifier *)objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
    v12 = -[LinkActionURLQualifier supportsMultipleScenes](v11, sel_supportsMultipleScenes);

    v8 = v11;
  }
  else
  {
    v12 = 0;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

- (_TtC7NewsUI222LinkActionURLQualifier)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[LinkActionURLQualifier init](&v3, sel_init);
}

@end
