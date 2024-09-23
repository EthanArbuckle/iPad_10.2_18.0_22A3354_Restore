@implementation NSMutableAttributedString

unint64_t __65__NSMutableAttributedString_DataDetectorsSupport__dd_chopResults__block_invoke(unint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  if (a2)
  {
    v6 = result;
    v7 = objc_msgSend(a2, "range");
    v9 = v7 + v8;
    result = objc_msgSend(*(id *)(v6 + 32), "length");
    if (v9 > result)
      return objc_msgSend(*(id *)(v6 + 32), "removeAttribute:range:", CFSTR("DDResultAttributeName"), a3, a4);
  }
  return result;
}

uint64_t __70__NSMutableAttributedString_DataDetectorsSupport__dd_offsetResultsBy___block_invoke(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  const void *Copy;
  id v9;

  if (a2)
  {
    v7 = result;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40), "objectForKey:", a2))
    {
      return objc_msgSend(*(id *)(v7 + 32), "addAttribute:value:range:", CFSTR("DDResultAttributeName"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 40), "objectForKey:", a2), a3, a4);
    }
    else if (objc_msgSend(a2, "range") + *(_QWORD *)(v7 + 48) < 0)
    {
      return objc_msgSend(*(id *)(v7 + 32), "removeAttribute:range:", CFSTR("DDResultAttributeName"), a3, a4);
    }
    else
    {
      Copy = (const void *)DDResultCreateCopy(objc_msgSend(a2, "coreResult"));
      v9 = +[DDScannerResult resultFromCoreResult:](DDScannerResult, "resultFromCoreResult:", Copy);
      CFRelease(Copy);
      objc_msgSend(v9, "offsetRangeBy:", *(_QWORD *)(v7 + 48));
      objc_msgSend(*(id *)(v7 + 32), "addAttribute:value:range:", CFSTR("DDResultAttributeName"), v9, a3, a4);
      return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 40), "setObject:forKey:", v9, a2);
    }
  }
  return result;
}

@end
