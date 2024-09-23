@implementation APFormatter

+ (id)formatterForBSFormatter:(int)a3 withMaxLen:(int64_t)a4
{
  id result;

  switch(a3)
  {
    case 1:
      result = (id)MEMORY[0x24BEDD108](UTF8Formatter, sel_utf8Formatter_, a4);
      break;
    case 2:
      result = (id)MEMORY[0x24BEDD108](APFormatter, sel_hexFormatter_, a4);
      break;
    case 3:
      result = (id)MEMORY[0x24BEDD108](ASCII7BitFormatter, sel_ascii7BitFormatter_, a4);
      break;
    case 4:
      result = (id)MEMORY[0x24BEDD108](APFormatter, sel_numberOnlyFormatter_, a4);
      break;
    case 5:
      result = (id)MEMORY[0x24BEDD108](APFormatter, sel_sharedIPFormatter, *(_QWORD *)&a3);
      break;
    case 6:
      result = (id)MEMORY[0x24BEDD108](APFormatter, sel_sharedIPv6Formatter, *(_QWORD *)&a3);
      break;
    case 7:
      result = (id)MEMORY[0x24BEDD108](APFormatter, sel_ipOctetFormatter_, a4);
      break;
    case 8:
      result = (id)MEMORY[0x24BEDD108](APFormatter, sel_sharedIPv4PrefixFormatter, *(_QWORD *)&a3);
      break;
    case 9:
      result = (id)MEMORY[0x24BEDD108](MACFormatter, sel_macFormatter, *(_QWORD *)&a3);
      break;
    case 10:
      result = (id)MEMORY[0x24BEDD108](APFormatter, sel_sharedPhoneNumberFormatter, *(_QWORD *)&a3);
      break;
    case 11:
      result = (id)MEMORY[0x24BEDD108](DomainNameFormatter, sel_domainNameFormatter_, a4);
      break;
    case 12:
      result = (id)MEMORY[0x24BEDD108](HostnameFormatter, sel_hostnameFormatter_, a4);
      break;
    case 13:
      result = (id)MEMORY[0x24BEDD108](APFormatter, sel_portRangeFormatter_, a4);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (APFormatter)initWithStringOfValidCharacters:(id)a3 withMaxLength:(unint64_t)a4
{
  uint64_t v6;
  const char *v7;

  v6 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], a2, (uint64_t)a3);
  return (APFormatter *)objc_msgSend_initWithCharacterSet_withMaxLength_(self, v7, v6, a4);
}

- (APFormatter)initWithCharacterSet:(id)a3 withMaxLength:(unint64_t)a4
{
  APFormatter *v6;
  const char *v7;
  APFormatter *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APFormatter;
  v6 = -[APFormatter init](&v14, sel_init);
  v8 = v6;
  if (v6)
  {
    objc_msgSend_setCharacterSet_(v6, v7, (uint64_t)a3);
    v11 = objc_msgSend_invertedSet(a3, v9, v10);
    objc_msgSend_setInvertedCharacterSet_(v8, v12, v11);
    v8->_maxLength = a4;
  }
  return v8;
}

- (APFormatter)initWithMaxLength:(unint64_t)a3
{
  APFormatter *v4;
  const char *v5;
  APFormatter *v6;
  const char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)APFormatter;
  v4 = -[APFormatter init](&v9, sel_init);
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setCharacterSet_(v4, v5, 0);
    objc_msgSend_setInvertedCharacterSet_(v6, v7, 0);
    v6->_maxLength = a3;
  }
  return v6;
}

- (id)stringForObjectValue:(id)a3
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@"), a3);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  BOOL v5;
  BOOL v6;

  if (a3)
    v5 = a4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
    *a3 = (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@"), a4, a5, a4);
  return v6;
}

- (BOOL)isPartialStringValid:(id)maxLength newEditingString:(id *)a4 errorDescription:(id *)a5
{
  id v7;
  unint64_t v9;
  BOOL result;
  __CFString *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;

  v7 = maxLength;
  if (self->_maxLength)
  {
    v9 = objc_msgSend_UTF8ByteCount(maxLength, a2, (uint64_t)maxLength);
    maxLength = (id)self->_maxLength;
    if (v9 > (unint64_t)maxLength)
    {
      if (a4)
        *a4 = (id)objc_msgSend_prefixStringWithByteCount_(v7, a2, (uint64_t)maxLength);
      if (a5)
      {
        result = 0;
        v11 = CFSTR("gErC");
LABEL_17:
        *a5 = v11;
        return result;
      }
      return 0;
    }
  }
  if (objc_msgSend_characterSet(self, a2, (uint64_t)maxLength))
  {
    v35 = 0;
    v14 = (void *)objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], v12, (uint64_t)v7);
    v16 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], v15, (uint64_t)CFSTR("\n"));
    objc_msgSend_setCharactersToBeSkipped_(v14, v17, v16);
    v20 = objc_msgSend_characterSet(self, v18, v19);
    objc_msgSend_scanCharactersFromSet_intoString_(v14, v21, v20, &v35);
    if ((objc_msgSend_isAtEnd(v14, v22, v23) & 1) == 0)
    {
      if (a4)
      {
        v34 = v35;
        if (!v35)
          v34 = &stru_24DD08368;
        *a4 = v34;
      }
      if (a5)
        *a5 = CFSTR("gErE");
      return 0;
    }
  }
  if (!objc_msgSend_characterSet(self, v12, v13))
    return 1;
  v35 = 0;
  v25 = (void *)objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], v24, (uint64_t)v7);
  v28 = objc_msgSend_invertedCharacterSet(self, v26, v27);
  objc_msgSend_scanCharactersFromSet_intoString_(v25, v29, v28, &v35);
  v32 = objc_msgSend_length(v35, v30, v31);
  result = v32 == 0;
  if (v32)
  {
    if (a4)
    {
      v33 = v35;
      if (!v35)
        v33 = &stru_24DD08368;
      *a4 = v33;
    }
    if (a5)
    {
      v11 = CFSTR("gErE");
      goto LABEL_17;
    }
  }
  return result;
}

+ (id)romanFormatter:(unint64_t)a3
{
  APFormatter *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v5 = [APFormatter alloc];
  v8 = objc_msgSend_romanSet(a1, v6, v7);
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);
}

+ (id)sharedIPFormatter
{
  id result;
  IPv4AddressFormatter *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  result = (id)qword_2550F4D48;
  if (!qword_2550F4D48)
  {
    v4 = [IPv4AddressFormatter alloc];
    v7 = objc_msgSend_ipv4AddressSet(a1, v5, v6);
    result = (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, 15);
    qword_2550F4D48 = (uint64_t)result;
  }
  return result;
}

+ (id)sharedIPv6Formatter
{
  id result;
  APFormatter *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  result = (id)qword_2550F4D50;
  if (!qword_2550F4D50)
  {
    v4 = [APFormatter alloc];
    v7 = objc_msgSend_ipv6AddressSet(a1, v5, v6);
    result = (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, 39);
    qword_2550F4D50 = (uint64_t)result;
  }
  return result;
}

+ (id)sharedIPv4PrefixFormatter
{
  id result;
  IPv4AddressWithPrefixFormatter *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  result = (id)qword_2550F4D58;
  if (!qword_2550F4D58)
  {
    v4 = [IPv4AddressWithPrefixFormatter alloc];
    v7 = objc_msgSend_ipv4AddressWithPrefixSet(a1, v5, v6);
    result = (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, 18);
    qword_2550F4D58 = (uint64_t)result;
  }
  return result;
}

+ (id)ipFormatter:(unint64_t)a3
{
  IPv4AddressFormatter *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v5 = [IPv4AddressFormatter alloc];
  v8 = objc_msgSend_ipv4AddressSet(a1, v6, v7);
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);
}

+ (id)ipOctetFormatter:(unint64_t)a3
{
  IPv4AddressOctetFormatter *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v5 = [IPv4AddressOctetFormatter alloc];
  v8 = objc_msgSend_ipv4AddressSet(a1, v6, v7);
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);
}

+ (id)sharedMultipleIPFormatter
{
  id result;
  APFormatter *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  result = (id)qword_2550F4D60;
  if (!qword_2550F4D60)
  {
    v4 = [APFormatter alloc];
    v7 = objc_msgSend_multipleIpAddressesSet(a1, v5, v6);
    result = (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, 49);
    qword_2550F4D60 = (uint64_t)result;
  }
  return result;
}

+ (id)multipleIPFormatter:(unint64_t)a3
{
  APFormatter *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v5 = [APFormatter alloc];
  v8 = objc_msgSend_multipleIpAddressesSet(a1, v6, v7);
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);
}

+ (id)maxLengthFormatter:(unint64_t)a3
{
  APFormatter *v4;
  const char *v5;

  v4 = [APFormatter alloc];
  return (id)objc_msgSend_initWithMaxLength_(v4, v5, a3);
}

+ (id)numberOnlyFormatter:(unint64_t)a3
{
  APFormatter *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  v4 = [APFormatter alloc];
  v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v5, v6);
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, a3);
}

+ (id)nonZeroNumberOnly:(unint64_t)a3
{
  uint64_t v4;
  APFormatter *v5;
  const char *v6;

  v4 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], a2, (uint64_t)CFSTR("123456789"));
  v5 = [APFormatter alloc];
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v6, v4, a3);
}

+ (id)portRangeFormatter:(unint64_t)a3
{
  APFormatter *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  v4 = [APFormatter alloc];
  v7 = objc_msgSend_portRangeSet(APFormatter, v5, v6);
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, a3);
}

+ (id)sharedPhoneNumberFormatter
{
  id result;
  APFormatter *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  result = (id)qword_2550F4D68;
  if (!qword_2550F4D68)
  {
    v4 = [APFormatter alloc];
    v7 = objc_msgSend_phoneNumberSet(a1, v5, v6);
    result = (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v4, v8, v7, 0);
    qword_2550F4D68 = (uint64_t)result;
  }
  return result;
}

+ (id)phoneNumberFormatter:(unint64_t)a3
{
  APFormatter *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v5 = [APFormatter alloc];
  v8 = objc_msgSend_phoneNumberSet(a1, v6, v7);
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);
}

+ (id)asciiFormatter:(unint64_t)a3
{
  APFormatter *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v5 = [APFormatter alloc];
  v8 = objc_msgSend_asciiSet(a1, v6, v7);
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);
}

+ (id)hexFormatter:(unint64_t)a3
{
  APFormatter *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v5 = [APFormatter alloc];
  v8 = objc_msgSend_hexSet(a1, v6, v7);
  return (id)objc_msgSend_initWithCharacterSet_withMaxLength_(v5, v9, v8, a3);
}

- (void)dealloc
{
  const char *v3;
  objc_super v4;

  objc_msgSend_setCharacterSet_(self, a2, 0);
  objc_msgSend_setInvertedCharacterSet_(self, v3, 0);
  v4.receiver = self;
  v4.super_class = (Class)APFormatter;
  -[APFormatter dealloc](&v4, sel_dealloc);
}

- (void)setCharacterSet:(id)a3
{
  NSCharacterSet *characterSet;

  characterSet = self->_characterSet;
  if (characterSet != a3)
  {

    self->_characterSet = (NSCharacterSet *)a3;
  }
}

- (id)characterSet
{
  return self->_characterSet;
}

- (void)setInvertedCharacterSet:(id)a3
{
  NSCharacterSet *invertedCharacterSet;

  invertedCharacterSet = self->_invertedCharacterSet;
  if (invertedCharacterSet != a3)
  {

    self->_invertedCharacterSet = (NSCharacterSet *)a3;
  }
}

- (id)invertedCharacterSet
{
  return self->_invertedCharacterSet;
}

+ (id)ipv4AddressSet
{
  id v2;
  const char *v3;
  const char *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInString_(v2, v3, (uint64_t)CFSTR("."));
  objc_msgSend_addCharactersInString_(v2, v4, (uint64_t)CFSTR("0123456789"));
  return v2;
}

+ (id)ipv4AddressWithPrefixSet
{
  id v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInString_(v2, v3, (uint64_t)CFSTR("/"));
  v6 = objc_msgSend_ipv4AddressSet(APFormatter, v4, v5);
  objc_msgSend_formUnionWithCharacterSet_(v2, v7, v6);
  return v2;
}

+ (id)ipv6AddressSet
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInString_(v3, v4, (uint64_t)CFSTR(":"));
  objc_msgSend_addCharactersInString_(v3, v5, (uint64_t)CFSTR("/"));
  v8 = objc_msgSend_hexSet(a1, v6, v7);
  objc_msgSend_formUnionWithCharacterSet_(v3, v9, v8);
  v12 = objc_msgSend_ipv4AddressSet(a1, v10, v11);
  objc_msgSend_formUnionWithCharacterSet_(v3, v13, v12);
  return v3;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  const char *v8;
  uint64_t v9;
  int isPartialStringValid_newEditingString_errorDescription;
  BOOL v11;
  void *v13;

  v13 = 0;
  isPartialStringValid_newEditingString_errorDescription = objc_msgSend_isPartialStringValid_newEditingString_errorDescription_(self, a2, (uint64_t)*a3, &v13, a7, a6.location, a6.length);
  if (a4)
  {
    if (isPartialStringValid_newEditingString_errorDescription)
      v11 = 1;
    else
      v11 = v13 == 0;
    if (!v11)
    {
      a4->location = objc_msgSend_length(v13, v8, v9);
      a4->length = 0;
    }
  }
  return isPartialStringValid_newEditingString_errorDescription;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

+ (id)romanSet
{
  id v2;
  const char *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInString_(v2, v3, (uint64_t)CFSTR("(),-./:=?\"' "));
  objc_msgSend_addCharactersInString_(v2, v4, (uint64_t)CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v5, v6);
  objc_msgSend_formUnionWithCharacterSet_(v2, v8, v7);
  v10 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v9, (uint64_t)"•");
  objc_msgSend_addCharactersInString_(v2, v11, v10);
  return v2;
}

+ (id)multipleIpAddressesSet
{
  id v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInString_(v2, v3, (uint64_t)CFSTR("., "));
  v6 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v4, v5);
  objc_msgSend_formUnionWithCharacterSet_(v2, v7, v6);
  return v2;
}

+ (id)phoneNumberSet
{
  id v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInString_(v2, v3, (uint64_t)CFSTR("()-*#,."));
  v6 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v4, v5);
  objc_msgSend_formUnionWithCharacterSet_(v2, v7, v6);
  return v2;
}

+ (id)asciiSet
{
  id v2;
  const char *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInRange_(v2, v3, 32, 95);
  objc_msgSend_addCharactersInRange_(v2, v4, 128, 127);
  v6 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v5, (uint64_t)"•");
  objc_msgSend_addCharactersInString_(v2, v7, v6);
  return v2;
}

+ (id)hexSet
{
  return (id)objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], a2, (uint64_t)CFSTR("0123456789abcdefABCDEF"));
}

+ (id)pogoPasswordSet
{
  id v2;
  const char *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInRange_(v2, v3, 32, 95);
  objc_msgSend_addCharactersInRange_(v2, v4, 128, 127);
  v6 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v5, (uint64_t)"•");
  objc_msgSend_addCharactersInString_(v2, v7, v6);
  return v2;
}

+ (id)portRangeSet
{
  id v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInString_(v2, v3, (uint64_t)CFSTR(",-"));
  v6 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v4, v5);
  objc_msgSend_formUnionWithCharacterSet_(v2, v7, v6);
  return v2;
}

@end
