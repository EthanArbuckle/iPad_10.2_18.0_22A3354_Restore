@implementation NSAttributedString(FUUppercase)

- (id)FU_uppercaseAttributedStringCurrentLocale:()FUUppercase
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a1, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  objc_msgSend(v5, "FU_uppercaseStringUsingCurrentLocale:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v7);
  if (v8 < v6)
    v6 = v8;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__NSAttributedString_FUUppercase__FU_uppercaseAttributedStringCurrentLocale___block_invoke;
  v12[3] = &unk_24ED16140;
  v10 = v9;
  v13 = v10;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v12);

  return v10;
}

@end
