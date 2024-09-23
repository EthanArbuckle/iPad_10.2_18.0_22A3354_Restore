@implementation MACFormatter

+ (id)sharedMACFormatter
{
  id result;

  result = (id)qword_2550F4D78;
  if (!qword_2550F4D78)
  {
    result = objc_alloc_init(MACFormatter);
    qword_2550F4D78 = (uint64_t)result;
  }
  return result;
}

+ (id)macFormatter
{
  return objc_alloc_init(MACFormatter);
}

- (MACFormatter)init
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  MACFormatter *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  objc_super v18;

  v4 = objc_msgSend_macAddressSet(MACFormatter, a2, v2);
  v18.receiver = self;
  v18.super_class = (Class)MACFormatter;
  v6 = -[APFormatter initWithCharacterSet:withMaxLength:](&v18, sel_initWithCharacterSet_withMaxLength_, v4, 17);
  if (v6)
  {
    v7 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], v5, qword_2550F4A78);
    objc_msgSend_setPossibleSeparators_(v6, v8, v7);
    v11 = (void *)objc_msgSend_possibleSeparators(v6, v9, v10);
    v14 = objc_msgSend_invertedSet(v11, v12, v13);
    objc_msgSend_setPossibleSeparatorsInvertedSet_(v6, v15, v14);
    objc_msgSend_setUserPreferredSeparator_(v6, v16, (uint64_t)CFSTR(":"));
  }
  return v6;
}

- (void)dealloc
{
  const char *v3;
  const char *v4;
  objc_super v5;

  objc_msgSend_setPossibleSeparators_(self, a2, 0);
  objc_msgSend_setPossibleSeparatorsInvertedSet_(self, v3, 0);
  objc_msgSend_setUserPreferredSeparator_(self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)MACFormatter;
  -[APFormatter dealloc](&v5, sel_dealloc);
}

+ (BOOL)parseMACAddress:(const char *)a3 intoHexString:(char *)a4
{
  BOOL v4;
  BOOL v5;
  const char *v7;
  size_t v8;
  uint64_t i;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;

  if (a3)
    v4 = a4 == 0;
  else
    v4 = 1;
  v5 = !v4;
  if (!v4)
  {
    v7 = a3;
    v8 = strlen(a3);
    for (i = 0; v8; --v8)
    {
      v11 = *(unsigned __int8 *)v7++;
      v10 = v11;
      v12 = v11 - 48;
      v13 = v11 - 97;
      v14 = v11 - 55;
      if ((v11 - 65) >= 6)
        v15 = -1;
      else
        v15 = v14;
      v16 = v10 - 87;
      if (v13 > 5)
        v16 = v15;
      if (v12 <= 9)
        v16 = v12;
      if (v16 >= 0)
        i = 16 * i + v16;
    }
    *a4 = BYTE5(i);
    a4[1] = BYTE4(i);
    a4[2] = BYTE3(i);
    a4[3] = BYTE2(i);
    a4[4] = BYTE1(i);
    a4[5] = i;
  }
  return v5;
}

- (void)removeMACAddressSeparatorsFromString:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;

  v4 = (void *)objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], a2, (uint64_t)a3);
  v6 = (void *)objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], v5, qword_2550F4A78);
  v9 = objc_msgSend_invertedSet(v6, v7, v8);
  objc_msgSend_setScanLocation_(v4, v10, 0);
  if (objc_msgSend_scanCharactersFromSet_intoString_(v4, v11, v9, 0))
  {
    v14 = 0;
    do
    {
      if ((objc_msgSend_isAtEnd(v4, v12, v13) & 1) == 0)
      {
        v14 = objc_msgSend_scanLocation(v4, v15, v16);
        objc_msgSend_deleteCharactersInRange_(a3, v17, v14, 1);
      }
      v4 = (void *)objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], v15, (uint64_t)a3);
      v20 = objc_msgSend_length(a3, v18, v19);
      v22 = v14;
      if (v14 > v20)
        v22 = objc_msgSend_length(a3, v21, v14);
      objc_msgSend_setScanLocation_(v4, v21, v22);
    }
    while (objc_msgSend_scanCharactersFromSet_intoString_(v4, v23, v9, 0)
         && !objc_msgSend_isAtEnd(v4, v24, v25));
  }
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  const char *v13;
  void *v14;
  NSUInteger v15;
  unint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  _BOOL4 v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  unint64_t maxLength;
  id v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  const char *v47;
  char v48;
  unint64_t v49;
  unint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  unint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  unint64_t v82;
  BOOL result;
  void *v84;
  id v85;

  length = a6.length;
  location = a6.location;
  v12 = (id)objc_msgSend_mutableCopy(*a3, a2, (uint64_t)a3, a4, a5, a6.location, a6.length, a7);
  v14 = v12;
  v16 = a4->location;
  v15 = a4->length;
  v85 = a5;
  if (length > v15)
  {
    v24 = (void *)objc_msgSend_substringWithRange_(a5, v13, location, length - v15);
    if (objc_msgSend_length(v24, v25, v26) != 1)
    {
LABEL_11:
      v23 = 0;
      goto LABEL_12;
    }
    v23 = objc_msgSend_rangeOfString_((void *)qword_2550F4A78, v20, (uint64_t)v24) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v17 = (void *)objc_msgSend_substringWithRange_(v12, v13, location, v16 - location);
    if (objc_msgSend_length(v17, v18, v19) != 1)
      goto LABEL_11;
    if (objc_msgSend_rangeOfString_((void *)qword_2550F4A78, v20, (uint64_t)v17) == 0x7FFFFFFFFFFFFFFFLL
      || v20 != (const char *)1)
    {
      goto LABEL_11;
    }
    objc_msgSend_setUserPreferredSeparator_(self, v20, (uint64_t)v17);
    v23 = 1;
  }
LABEL_12:
  maxLength = self->super._maxLength;
  if (maxLength)
  {
    if (v16 >= maxLength && v23)
      goto LABEL_52;
    if (objc_msgSend_length(*a3, v20, v21) > self->super._maxLength)
    {
      v29 = (id)objc_msgSend_mutableCopy(*a3, v20, v21);
      objc_msgSend_removeMACAddressSeparatorsFromString_(self, v30, (uint64_t)v29);
      if ((unint64_t)objc_msgSend_length(v29, v31, v32) >= 0xD)
        goto LABEL_52;
    }
  }
  if (objc_msgSend_characterSet(self, v20, v21, v85))
  {
    v34 = (void *)objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], v20, (uint64_t)*a3);
    v36 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], v35, (uint64_t)CFSTR("\n"));
    objc_msgSend_setCharactersToBeSkipped_(v34, v37, v36);
    v40 = objc_msgSend_characterSet(self, v38, v39);
    objc_msgSend_scanCharactersFromSet_intoString_(v34, v41, v40, 0);
    if ((objc_msgSend_isAtEnd(v34, v42, v43) & 1) == 0)
      goto LABEL_52;
  }
  if (objc_msgSend_characterSet(self, v20, v33))
  {
    v45 = *a3;
    v46 = objc_msgSend_invertedCharacterSet(self, v20, v44);
    objc_msgSend_rangeOfCharacterFromSet_(v45, v47, v46);
    if (v20)
      goto LABEL_52;
  }
  v48 = !v23;
  if (length > v15)
    v48 = 1;
  if ((v48 & 1) != 0)
  {
    if (length <= 1)
    {
      v50 = objc_msgSend_length(v85, v20, v44);
      if (v50 > objc_msgSend_length(v14, v51, v52)
        && 0xAAAAAAAAAAAAAAABLL * location - 0x5555555555555555 <= 0x5555555555555555)
      {
        objc_msgSend_deleteCharactersInRange_(v14, v20, location - 1, length);
        --a4->location;
        a4->length = 0;
      }
    }
    v53 = (void *)objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], v20, (uint64_t)v14);
    objc_msgSend_setScanLocation_(v53, v54, 0);
    v57 = objc_msgSend_possibleSeparatorsInvertedSet(self, v55, v56);
    objc_msgSend_scanCharactersFromSet_intoString_(v53, v58, v57, 0);
    do
    {
      if (!objc_msgSend_isAtEnd(v53, v59, v60)
        || objc_msgSend_hasSuffix_(v14, v61, (uint64_t)CFSTR(" ")))
      {
        v16 = objc_msgSend_scanLocation(v53, v61, v62);
        objc_msgSend_deleteCharactersInRange_(v14, v63, v16, 1);
        --a4->location;
      }
      v53 = (void *)objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], v61, (uint64_t)v14);
      v66 = objc_msgSend_length(v14, v64, v65);
      v68 = v16;
      if (v16 > v66)
        v68 = objc_msgSend_length(v14, v67, v16);
      objc_msgSend_setScanLocation_(v53, v67, v68);
      v71 = objc_msgSend_possibleSeparatorsInvertedSet(self, v69, v70);
      objc_msgSend_scanCharactersFromSet_intoString_(v53, v72, v71, 0);
    }
    while (!objc_msgSend_isAtEnd(v53, v73, v74)
         || (objc_msgSend_hasSuffix_(v14, v59, (uint64_t)CFSTR(" ")) & 1) != 0);
    if ((unint64_t)objc_msgSend_length(v14, v59, v60) >= 2)
    {
      v77 = 2;
      do
      {
        if (v77 >= self->super._maxLength)
          break;
        v78 = objc_msgSend_userPreferredSeparator(self, v75, v76);
        objc_msgSend_insertString_atIndex_(v14, v79, v78, v77);
        ++a4->location;
        v77 += 3;
      }
      while (v77 <= objc_msgSend_length(v14, v80, v81));
    }
    *a3 = v14;
    return 1;
  }
  v49 = v16;
  if (v16 % 3 != 2)
  {
    if (v16 % 3 == 1)
      v49 = v16 + 1;
    else
      v49 = v16 - 1;
  }
  v82 = (v16 + 1) % 3;
  if (v82 == 2)
  {
LABEL_52:
    v84 = (void *)objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v20, (uint64_t)v85, v85);
    result = 0;
    *a3 = v84;
    a4->location = location;
    a4->length = length;
    return result;
  }
  if (v82)
    return 1;
  if (v16 == self->super._maxLength - 1)
  {
    objc_msgSend_deleteCharactersInRange_(v14, v20, v16 - 1, 1);
    --a4->location;
    a4->length = 0;
  }
  objc_msgSend_insertString_atIndex_(v14, v20, (uint64_t)CFSTR("0"), v49 - 2);
  result = 0;
  ++a4->location;
  *a3 = v14;
  return result;
}

- (void)setPossibleSeparators:(id)a3
{
  NSCharacterSet *possibleSeparators;

  possibleSeparators = self->_possibleSeparators;
  if (possibleSeparators != a3)
  {

    self->_possibleSeparators = (NSCharacterSet *)a3;
  }
}

- (id)possibleSeparators
{
  return self->_possibleSeparators;
}

- (void)setPossibleSeparatorsInvertedSet:(id)a3
{
  NSCharacterSet *possibleSeparatorsInvertedSet;

  possibleSeparatorsInvertedSet = self->_possibleSeparatorsInvertedSet;
  if (possibleSeparatorsInvertedSet != a3)
  {

    self->_possibleSeparatorsInvertedSet = (NSCharacterSet *)a3;
  }
}

- (id)possibleSeparatorsInvertedSet
{
  return self->_possibleSeparatorsInvertedSet;
}

- (void)setUserPreferredSeparator:(id)a3
{
  NSString *userPreferredSeparator;

  userPreferredSeparator = self->_userPreferredSeparator;
  if (userPreferredSeparator != a3)
  {

    self->_userPreferredSeparator = (NSString *)a3;
  }
}

- (id)userPreferredSeparator
{
  return self->_userPreferredSeparator;
}

+ (id)macAddressSet
{
  id v2;
  const char *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInString_(v2, v3, (uint64_t)CFSTR("abcdefABCDEF"));
  objc_msgSend_addCharactersInString_(v2, v4, qword_2550F4A78);
  v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v5, v6);
  objc_msgSend_formUnionWithCharacterSet_(v2, v8, v7);
  return v2;
}

@end
