@implementation RunTimeThemeRefForBytes

id __RunTimeThemeRefForBytes_block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  id result;
  CUIStructuredThemeStore *v6;
  CUIStructuredThemeStore *v7;

  v4 = objc_msgSend(a2, "objectForKey:", a1[4]);
  if (v4)
  {
    result = objc_msgSend(v4, "unsignedIntegerValue");
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  }
  else
  {
    v6 = -[CUIStructuredThemeStore initWithBytes:length:]([CUIStructuredThemeStore alloc], "initWithBytes:length:", a1[7], a1[8]);
    if (v6)
    {
      v7 = v6;
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = _RegisterThemeProvider(v6);

      return objc_msgSend(a2, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24)), a1[4]);
    }
    else
    {
      result = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("RunTimeThemeRefForBytes() failed to initialize CUIStructuredThemeStore"));
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
    }
  }
  return result;
}

@end
