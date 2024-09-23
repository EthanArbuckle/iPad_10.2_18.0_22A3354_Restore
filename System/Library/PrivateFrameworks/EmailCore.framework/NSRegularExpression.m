@implementation NSRegularExpression

uint64_t __68__NSRegularExpression_ECMessageBodyParser__ec_attributionExpression__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "ec_copyAttributionRegularExpressionForType:", 0);
  ec_attributionExpression_regex = result;
  return result;
}

uint64_t __74__NSRegularExpression_ECMessageBodyParser__ec_attributionPrefixExpression__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "ec_copyAttributionRegularExpressionForType:", 1);
  ec_attributionPrefixExpression_regex = result;
  return result;
}

uint64_t __73__NSRegularExpression_ECMessageBodyParser__ec_forwardSeparatorExpression__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "ec_copyAttributionRegularExpressionForType:", 2);
  ec_forwardSeparatorExpression_regex = result;
  return result;
}

uint64_t __66__NSRegularExpression_ECMessageBodyParser__ec_signatureExpression__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "ec_copyAttributionRegularExpressionForType:", 3);
  ec_signatureExpression_regex = result;
  return result;
}

void __65__NSRegularExpression_SubjectParser__ec_regularExpressionForList__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^\\[.*?\\][[:space:]]"), 1, &v6);
  v1 = v6;
  v2 = (void *)ec_regularExpressionForList_listRegex;
  ec_regularExpressionForList_listRegex = v0;

  if (!ec_regularExpressionForList_listRegex)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v1, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v5);
  }

}

@end
