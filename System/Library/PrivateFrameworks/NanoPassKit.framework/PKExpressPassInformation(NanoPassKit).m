@implementation PKExpressPassInformation(NanoPassKit)

- (uint64_t)npk_hasImmediateAutomaticSelectionCriterion
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __84__PKExpressPassInformation_NanoPassKit__npk_hasImmediateAutomaticSelectionCriterion__block_invoke;
  v3[3] = &unk_24CFEE6A8;
  v3[4] = &v4;
  objc_msgSend(a1, "enumerateCriteriaWithHandler:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (id)npk_expressAppletIdentifiers
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__PKExpressPassInformation_NanoPassKit__npk_expressAppletIdentifiers__block_invoke;
  v6[3] = &unk_24CFEE6D0;
  v7 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateCredentialsWithHandler:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

@end
