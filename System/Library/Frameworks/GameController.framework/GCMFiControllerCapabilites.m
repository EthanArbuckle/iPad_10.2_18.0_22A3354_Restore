@implementation GCMFiControllerCapabilites

BOOL __72___GCMFiControllerCapabilites_initWithGamepadElements_keyboardElements___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  int v6;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Max"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Min"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (v3 && v4)
  {
    v6 = objc_msgSend(v3, "intValue");
    v5 = v6 - objc_msgSend(v4, "intValue") == 1;
  }

  return v5;
}

@end
