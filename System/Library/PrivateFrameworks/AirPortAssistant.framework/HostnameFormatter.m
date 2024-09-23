@implementation HostnameFormatter

+ (id)hostnameFormatter:(unint64_t)a3
{
  HostnameFormatter *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v5 = [HostnameFormatter alloc];
  v8 = objc_msgSend_hostnameSet(a1, v6, v7);
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  const char *v13;
  BOOL v14;
  objc_super v16;

  v10 = objc_msgSend_rangeOfString_options_(a3, a2, (uint64_t)CFSTR(".local"), 4);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = objc_msgSend_length(a3, v9, 0x7FFFFFFFFFFFFFFFLL);
  v11 = objc_msgSend_substringToIndex_(a3, v9, v10);
  v16.receiver = self;
  v16.super_class = (Class)HostnameFormatter;
  v12 = -[APFormatter isPartialStringValid:newEditingString:errorDescription:](&v16, sel_isPartialStringValid_newEditingString_errorDescription_, v11, a4, a5);
  v14 = v12;
  if (a4 && (v12 & 1) == 0)
    *a4 = (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("%@.local"), *a4);
  return v14;
}

+ (id)hostnameSet
{
  id v2;
  const char *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInString_(v2, v3, (uint64_t)CFSTR("-"));
  objc_msgSend_addCharactersInString_(v2, v4, (uint64_t)CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v5, v6);
  objc_msgSend_formUnionWithCharacterSet_(v2, v8, v7);
  return v2;
}

@end
