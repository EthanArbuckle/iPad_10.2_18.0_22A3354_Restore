@implementation DMCCTIMEI

void __DMCCTIMEI_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _EquipmentInfo();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "IMEI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(v5, "length");
  v2 = v5;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "length") >= 3)
      objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 2);
    if ((unint64_t)objc_msgSend(v3, "length") >= 0xA)
      objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 9);
    if ((unint64_t)objc_msgSend(v3, "length") >= 0x11)
      objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 16);
    v4 = (void *)DMCCTIMEI_imei;
    DMCCTIMEI_imei = (uint64_t)v3;

    v2 = v5;
  }

}

@end
