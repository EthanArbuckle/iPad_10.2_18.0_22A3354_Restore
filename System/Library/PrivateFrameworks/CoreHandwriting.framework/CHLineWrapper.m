@implementation CHLineWrapper

- (CHLineWrapper)init
{
  CHLineWrapper *v2;
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CRLineWrapper *lineWrapper;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CHLineWrapper;
  v2 = -[CHLineWrapper init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DBECC8]);
    v4 = objc_alloc(MEMORY[0x1E0DBECC0]);
    v9 = objc_msgSend_initWithConfiguration_(v4, v5, (uint64_t)v3, v6, v7, v8);
    lineWrapper = v2->_lineWrapper;
    v2->_lineWrapper = (CRLineWrapper *)v9;

  }
  return v2;
}

- (id)lineWrappingResultForGroups:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v5;
  void *v6;
  CHLineWrappingResult *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_paragraphsByUpdatingLineWrappingTypesInGroups_(self->_lineWrapper, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [CHLineWrappingResult alloc];
  v12 = (void *)objc_msgSend_initWithLineWrappableGroups_(v7, v8, (uint64_t)v6, v9, v10, v11);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineWrapper, 0);
}

@end
