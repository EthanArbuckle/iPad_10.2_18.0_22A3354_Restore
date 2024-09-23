@implementation FBSDisplayLayoutElement(INCDisplayLayoutMonitorObserver)

- (BOOL)_intents_isExpectedElement
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  _BOOL8 v6;

  objc_msgSend(a1, "_intents_SpringBoardElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v6 = 1;
  if (v2)
  {
    if (objc_msgSend(v2, "layoutRole") == 3)
    {
      objc_msgSend(a1, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D22C78]);

      if (!v5)
        v6 = 0;
    }
  }

  return v6;
}

- (id)_intents_SpringBoardElement
{
  id v2;

  if (!objc_msgSend(a1, "conformsToProtocol:", &unk_1EF163F30))
    goto LABEL_4;
  v2 = a1;
  if ((objc_msgSend(v2, "isSpringBoardElement") & 1) == 0)
  {

LABEL_4:
    v2 = 0;
  }
  return v2;
}

- (uint64_t)_intents_isSiri
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_intents_SpringBoardElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D22C88]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
