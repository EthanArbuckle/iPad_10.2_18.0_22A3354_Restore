@implementation RecommendationActionController

+ (RecommendationActionController)recommendationActionControllerWithTableManager:(id)a3 andAssistantUIViewController:(id)a4
{
  RecommendationActionController *v4;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;

  v4 = 0;
  if (a3 && a4)
  {
    v4 = objc_alloc_init(RecommendationActionController);
    objc_msgSend_setSectionIdentifier_(v4, v7, (uint64_t)CFSTR("ActionTableSection"));
    objc_msgSend_setTableManager_(v4, v8, (uint64_t)a3);
    v11 = (void *)objc_msgSend_recommendationParamDict(a4, v9, v10);
    v13 = objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("actionKey"));
    objc_msgSend_setActionKey_(v4, v14, v13);
  }
  return v4;
}

- (id)getSectionInfoWithLongStrings:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t valid;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t RowStyleBasicWithImage_text1_text2_withTag;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;

  v3 = a3;
  valid = sub_21A690C10((uint64_t)self->actionKey, qword_2550F4DE8);
  v10 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v6, v7);
  if (v3)
  {
    v11 = sub_21A690C10((uint64_t)CFSTR("TextualSentenceConcatenator"), qword_2550F4DE8);
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = sub_21A690C10((uint64_t)CFSTR("RecommendedInParens"), qword_2550F4DE8);
    valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v12, v14, v11, CFSTR("%@%@"), 0, valid, v13);
  }
  v15 = (void *)objc_msgSend_tableManager(self, v8, v9);
  RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v15, v16, 0, valid, 0, 1349675373);
  objc_msgSend_addObject_(v10, v18, RowStyleBasicWithImage_text1_text2_withTag);
  v21 = (void *)objc_msgSend_tableManager(self, v19, v20);
  v22 = sub_21A690C10((uint64_t)CFSTR("OtherOptionsEllipsis"), qword_2550F4DE8);
  v24 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v21, v23, 0, v22, 0, 1299149413);
  objc_msgSend_addObject_(v10, v25, v24);
  v26 = (void *)MEMORY[0x24BDBCED8];
  v28 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v27, 1);
  v30 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v29, 1349675373);
  return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v26, v31, (uint64_t)v10, CFSTR("sectionRows"), v28, CFSTR("sectionIsMenu"), v30, CFSTR("selectedMenuItemTag"), self->sectionIdentifier, CFSTR("identifier"), 0);
}

- (BOOL)isPrimaryRecommendation
{
  TableViewManager *tableManager;
  uint64_t v3;
  const char *v4;

  tableManager = self->tableManager;
  v3 = objc_msgSend_indexOfSectionWithIdentifier_(tableManager, a2, (uint64_t)self->sectionIdentifier);
  return objc_msgSend_tagOfSelectedRowInMenuSection_(tableManager, v4, v3) == 1349675373;
}

- (void)selectPrimaryRecommendation
{
  TableViewManager *tableManager;
  uint64_t v3;
  const char *v4;

  tableManager = self->tableManager;
  v3 = objc_msgSend_indexPathOfCellWithTag_(tableManager, a2, 1349675373);
  objc_msgSend_selectMenuCellAtIndexPath_(tableManager, v4, v3);
}

- (NSString)actionKey
{
  return self->actionKey;
}

- (void)setActionKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)sectionIdentifier
{
  return self->sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (TableViewManager)tableManager
{
  return self->tableManager;
}

- (void)setTableManager:(id)a3
{
  self->tableManager = (TableViewManager *)a3;
}

@end
