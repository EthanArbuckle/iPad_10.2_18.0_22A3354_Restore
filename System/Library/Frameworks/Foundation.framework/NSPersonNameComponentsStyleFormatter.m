@implementation NSPersonNameComponentsStyleFormatter

uint64_t __76___NSPersonNameComponentsStyleFormatter__orderedNonEmptyKeysFromComponents___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", a2);
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", a2), "length") != 0;
  return result;
}

uint64_t __102___NSPersonNameComponentsStyleFormatter__formattedStringFromOrderedKeys_components_attributesByRange___block_invoke(uint64_t a1, void *a2, char *a3)
{
  void *v4;
  id v6;
  void *v7;
  uint64_t result;
  NSValue *v9;
  void *v10;
  NSValue *v11;
  void *v12;

  v4 = a2;
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", a2);
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "masterFormatter"), "isPhonetic")
    && objc_msgSend(v4, "hasPrefix:", CFSTR("phoneticRepresentation.")))
  {
    v4 = (void *)objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("phoneticRepresentation."), "length"));
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "abbreviatedKeys"), "containsObject:", v4))
    v6 = +[NSPersonNameComponentsFormatter __initialsForString:](NSPersonNameComponentsFormatter, "__initialsForString:", v6);
  if (a3)
  {
    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3 - 1));
    if (objc_msgSend(v7, "length"))
      a3 = (char *)objc_msgSend(*(id *)(a1 + 40), "_delimiterBetweenString:andString:isPhonetic:", v7, v6, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "masterFormatter"), "isPhonetic"));
    else
      a3 = 0;
  }
  result = objc_msgSend(v6, "length");
  if (result)
  {
    v9 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "length"), objc_msgSend(a3, "length"));
    v10 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v9);
    if (!v10)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v10, v9);
    }
    objc_msgSend(v10, "setObject:forKey:", CFSTR("delimiter"), CFSTR("NSPersonNameComponentKey"));
    if (a3)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "appendString:", a3);
    if (*(_QWORD *)(a1 + 56))
    {
      v11 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "length"), objc_msgSend(v6, "length"));
      v12 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v11);
      if (!v12)
      {
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v12, v11);
      }
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v4, CFSTR("NSPersonNameComponentKey"));
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "appendString:", v6);
  }
  return result;
}

uint64_t __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "keysOfInterest"), "containsObject:", a2);
}

id __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id result;
  id v4;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "orderedTemplate"), "objectAtIndexedSubscript:", a2), "mutableCopy");
  if (result)
  {
    v4 = result;
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(result, "insertString:atIndex:", CFSTR("phoneticRepresentation."), 0);
    return (id)objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  return result;
}

uint64_t __81___NSPersonNameComponentsStyleFormatter_annotatedStringFromPersonNameComponents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a2, "rangeValue");
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a3, v5, v6);
}

@end
