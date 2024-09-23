@implementation UIKit

id __35__UIKit_PKSubsystem_sharedInstance__block_invoke(uint64_t a1)
{
  id result;

  result = objc_alloc_init(*(Class *)(a1 + 32));
  _MergedGlobals_154 = (uint64_t)result;
  return result;
}

uint64_t __43__UIKit_PKSubsystem_beginUsing_withBundle___block_invoke(uint64_t result)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  Class Class;
  uint64_t v6;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "setInfoDictionary:", objc_msgSend(*(id *)(result + 40), "bundleInfoDictionary"));
    v2 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "objectForKey:", CFSTR("NSExtension")), "mutableCopy");
    v3 = objc_msgSend(v2, "objectForKey:", CFSTR("NSExtensionMainStoryboard"));
    if (!v3)
      v3 = objc_msgSend(v2, "objectForKey:", CFSTR("NSExtensionMainStoryboard~ipad"));
    v4 = (id)objc_msgSend(v2, "objectForKey:", CFSTR("NSExtensionPrincipalClass"));
    if (v4)
    {
      if (v3)
        goto LABEL_10;
    }
    else
    {
      v4 = -[NSDictionary objectForKey:](-[NSBundle infoDictionary](+[NSBundle mainBundle](NSBundle, "mainBundle"), "infoDictionary"), "objectForKey:", CFSTR("NSExtensionPrincipalClass"));
      if (v3)
        goto LABEL_10;
    }
    Class = objc_getClass((const char *)objc_msgSend(v4, "UTF8String"));
    if ((objc_opt_respondsToSelector() & 1) == 0
      || !-[objc_class _initializedByViewServices](Class, "_initializedByViewServices"))
    {
      v6 = 1;
      goto LABEL_12;
    }
LABEL_10:
    -[objc_class startViewServiceSessionManagerAsPlugin:](objc_getClass("_UIViewServiceSessionManager"), "startViewServiceSessionManagerAsPlugin:", 1);
    v6 = 0;
LABEL_12:
    result = +[_NSExtensionContextVendor _startListening:](_NSExtensionContextVendor, "_startListening:", v6);
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 8) = 1;
  }
  return result;
}

@end
