@implementation CPSAbridgableNewlineLabel

+ (id)sanitizedTextForText:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location[3];
  id v10;
  dispatch_once_t *v11;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = (dispatch_once_t *)&sanitizedTextForText__onceToken_59;
  v10 = 0;
  objc_storeStrong(&v10, &__block_literal_global_60);
  if (*v11 != -1)
    dispatch_once(v11, v10);
  objc_storeStrong(&v10, 0);
  v4 = location[0];
  v5 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_msgSend(v4, "stringByTrimmingCharactersInSet:");

  v6 = (id)objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", sanitizedTextForText____disallowedCharacterSet_58);
  v7 = (id)objc_msgSend(v6, "componentsJoinedByString:", &stru_24E271FF0);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

void __50__CPSAbridgableNewlineLabel_sanitizedTextForText___block_invoke(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5[3];

  v5[2] = a1;
  v5[1] = a1;
  v5[0] = (id)objc_opt_new();
  v3 = v5[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "illegalCharacterSet");
  objc_msgSend(v3, "formUnionWithCharacterSet:");

  v1 = objc_msgSend(v5[0], "copy");
  v2 = (void *)sanitizedTextForText____disallowedCharacterSet_58;
  sanitizedTextForText____disallowedCharacterSet_58 = v1;

  objc_storeStrong(v5, 0);
}

@end
