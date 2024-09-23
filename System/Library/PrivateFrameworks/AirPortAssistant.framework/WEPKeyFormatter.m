@implementation WEPKeyFormatter

+ (id)sharedWEPKeyFormatter
{
  id result;
  WEPKeyFormatter *v3;
  const char *v4;

  result = (id)qword_2550F4D70;
  if (!qword_2550F4D70)
  {
    v3 = [WEPKeyFormatter alloc];
    result = (id)objc_msgSend_initWithMaxByteCount_maxLength_(v3, v4, 64, 64);
    qword_2550F4D70 = (uint64_t)result;
  }
  return result;
}

+ (id)wepKeyFormatter:(unint64_t)a3
{
  WEPKeyFormatter *v4;
  const char *v5;

  v4 = [WEPKeyFormatter alloc];
  return (id)objc_msgSend_initWithMaxByteCount_maxLength_(v4, v5, a3, a3);
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  const __CFString *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const __CFString *v24;
  objc_super v25;
  const __CFString *v26;

  v9 = CFSTR("$");
  if ((objc_msgSend_hasPrefix_(a3, a2, (uint64_t)CFSTR("$")) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v9 = CFSTR("0x");
    if ((objc_msgSend_hasPrefix_(a3, v10, (uint64_t)CFSTR("0x")) & 1) == 0
      && !objc_msgSend_hasPrefix_(a3, v10, (uint64_t)CFSTR("0X")))
    {
      goto LABEL_7;
    }
    v11 = 2;
  }
  v26 = 0;
  v12 = (void *)MEMORY[0x24BDD17A8];
  v13 = objc_msgSend_substringFromIndex_(a3, v10, v11);
  v15 = (void *)objc_msgSend_scannerWithString_(v12, v14, v13);
  v18 = objc_msgSend_hexSet(APFormatter, v16, v17);
  objc_msgSend_scanCharactersFromSet_intoString_(v15, v19, v18, &v26);
  if ((objc_msgSend_isAtEnd(v15, v20, v21) & 1) != 0)
  {
LABEL_7:
    v25.receiver = self;
    v25.super_class = (Class)WEPKeyFormatter;
    return -[UTF8Formatter isPartialStringValid:newEditingString:errorDescription:](&v25, sel_isPartialStringValid_newEditingString_errorDescription_, a3, a4, a5);
  }
  if (a4)
  {
    v24 = v26;
    if (!v26)
      v24 = &stru_24DD08368;
    *a4 = (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, (uint64_t)CFSTR("%@%@"), v9, v24);
  }
  if (a5)
    *a5 = CFSTR("gErE");
  return 0;
}

@end
