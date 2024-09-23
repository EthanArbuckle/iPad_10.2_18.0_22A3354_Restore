@implementation INReplaceVariablesInFormatStringFromCodable

id __INReplaceVariablesInFormatStringFromCodable_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (!v2 || (objc_opt_class(), v3 = v2, (objc_opt_isKindOfClass() & 1) == 0))
  {

    objc_msgSend(MEMORY[0x1E0C99D20], "if_arrayWithObjectIfNonNil:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

@end
