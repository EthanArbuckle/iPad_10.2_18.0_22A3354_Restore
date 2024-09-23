@implementation NTKAllSignatureRectangularTypes

void __NTKAllSignatureRectangularTypes_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndex:", 7);
  objc_msgSend(v2, "addIndex:", 1);
  objc_msgSend(v2, "addIndex:", 16);
  objc_msgSend(v2, "addIndex:", 8);
  objc_msgSend(v2, "addIndex:", 22);
  objc_msgSend(v2, "addIndex:", 43);
  objc_msgSend(v2, "addIndex:", 44);
  objc_msgSend(v2, "addIndex:", 31);
  objc_msgSend(v2, "addIndex:", 15);
  objc_msgSend(v2, "addIndex:", 48);
  objc_msgSend(v2, "addIndex:", 23);
  objc_msgSend(v2, "addIndex:", 20);
  objc_msgSend(v2, "addIndex:", 26);
  objc_msgSend(v2, "addIndex:", 3);
  objc_msgSend(v2, "addIndex:", 2);
  objc_msgSend(v2, "addIndex:", 4);
  objc_msgSend(v2, "addIndex:", 34);
  objc_msgSend(v2, "addIndex:", 35);
  objc_msgSend(v2, "addIndex:", 17);
  objc_msgSend(v2, "addIndex:", 42);
  objc_msgSend(v2, "addIndex:", 18);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v2, "addIndex:", 40);
    objc_msgSend(v2, "addIndex:", 12);
    objc_msgSend(v2, "addIndex:", 5);
  }
  objc_msgSend(v2, "addIndex:", 50);
  objc_msgSend(v2, "addIndex:", 58);
  objc_msgSend(v2, "addIndex:", 52);
  objc_msgSend(v2, "addIndex:", 53);
  objc_msgSend(v2, "addIndex:", 56);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v2);
  v1 = (void *)NTKAllSignatureRectangularTypes_results;
  NTKAllSignatureRectangularTypes_results = v0;

}

@end
