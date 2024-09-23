@implementation HTMLToSuper_BODY_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = (id)IMCopyNormalizedAttributes(a8, 1, 0);
  v9 = (void *)objc_msgSend(v12, "objectForKey:", CFSTR("dir"));
  if (!v9)
  {
LABEL_4:
    v11 = -1;
    goto LABEL_6;
  }
  v10 = v9;
  v11 = 1;
  if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("rtl"), 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v10, "rangeOfString:options:", CFSTR("ltr"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:
  objc_msgSend(a4, "setBaseWritingDirection:", v11);

}

@end
