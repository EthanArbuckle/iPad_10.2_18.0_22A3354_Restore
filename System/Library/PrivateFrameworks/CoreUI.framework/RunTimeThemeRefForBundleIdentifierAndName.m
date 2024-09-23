@implementation RunTimeThemeRefForBundleIdentifierAndName

void __RunTimeThemeRefForBundleIdentifierAndName_block_invoke(uint64_t a1, void *a2)
{
  id v4;
  CUIMutableStructuredThemeStore *v5;
  NSBundle *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "unsignedIntegerValue");
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", kCUIMutableStructureThemeStoreBundlePrefix))
  {
    v5 = -[CUIMutableStructuredThemeStore initWithIdentifier:]([CUIMutableStructuredThemeStore alloc], "initWithIdentifier:", *(_QWORD *)(a1 + 32));
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = _RegisterThemeProvider(v5);

    objc_msgSend(a2, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)), *(_QWORD *)(a1 + 32));
    return;
  }
  v6 = +[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", *(_QWORD *)(a1 + 40));
  v7 = -[NSBundle pathForResource:ofType:inDirectory:](v6, "pathForResource:ofType:inDirectory:", *(_QWORD *)(a1 + 48), CFSTR("car"), 0);
  if (v7)
  {
    v8 = (uint64_t)v7;
    v5 = -[CUIStructuredThemeStore initWithPath:]([CUIStructuredThemeStore alloc], "initWithPath:", v7);
    -[CUIStructuredThemeStore setBundleID:](v5, "setBundleID:", *(_QWORD *)(a1 + 40));
    -[CUIStructuredThemeStore setMainBundle:](v5, "setMainBundle:", v6 == +[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v5)
      goto LABEL_7;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("RunTimeThemeRefForBundleIdentifierAndName() failed to initialize CUIStructuredThemeStore at path: %@ in bundle: %@"), v8, *(_QWORD *)(a1 + 40));
    _CUILog(4, (uint64_t)"CoreUI: RunTimeThemeRefForBundleIdentifierAndName() failed to initialize CUIStructuredThemeStore at path: '%@' in bundle '%@'", v9, v10, v11, v12, v13, v14, v8);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("RunTimeThemeRefForBundleIdentifierAndName() couldn't find %@.car in bundle with identifier: %@"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
}

@end
