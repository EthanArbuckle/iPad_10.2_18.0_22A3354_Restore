@implementation RWIProtocolDOMNode

__CFString *__86__RWIProtocolDOMNode_IKJSInspector__ik_updateWithDOMNode_fullfillChildren_dispatcher___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = objc_msgSend(v2, "nodeId");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = &stru_1E9F50578;
      goto LABEL_7;
    }
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = objc_msgSend(v2, "ITMLID");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%i"), v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v5;
}

@end
