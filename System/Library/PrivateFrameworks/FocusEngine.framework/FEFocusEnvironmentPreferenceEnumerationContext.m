@implementation FEFocusEnvironmentPreferenceEnumerationContext

void __92___FEFocusEnvironmentPreferenceEnumerationContext_initWithFocusEnvironment_enumerationMode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a2;
  if (objc_msgSend(v6, sel_allowsWeakReference))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  if (v8)
  {
    _FEFocusEnvironmentEffectivePreferredFocusEnvironments(v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v6);
    if ((unint64_t)objc_msgSend(v9, "count") > 1
      || (objc_msgSend(v9, "firstObject"), v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 != v6))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }

  }
  else
  {
    logger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_23C48C000, v11, OS_LOG_TYPE_FAULT, "Trying to enumerate a focus hierarchy with a focus environment that is in the process of deallocating. This should never happen.", v12, 2u);
    }

    *a3 = 1;
  }

}

@end
