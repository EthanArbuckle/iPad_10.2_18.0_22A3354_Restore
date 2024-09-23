@implementation NSMutableAttributedString(DataDetectorsSupport)

- (void)dd_offsetResultsBy:()DataDetectorsSupport
{
  uint64_t v5;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__1933;
  v11 = __Block_byref_object_dispose__1934;
  v12 = 0;
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
  v5 = objc_msgSend(a1, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__NSMutableAttributedString_DataDetectorsSupport__dd_offsetResultsBy___block_invoke;
  v6[3] = &unk_1E3C95B60;
  v6[4] = a1;
  v6[5] = &v7;
  v6[6] = a3;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("DDResultAttributeName"), 0, v5, 0, v6);

  _Block_object_dispose(&v7, 8);
}

- (void)dd_chopResults
{
  uint64_t v2;
  id v3;
  _QWORD v4[5];

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
  v2 = objc_msgSend(a1, "length");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__NSMutableAttributedString_DataDetectorsSupport__dd_chopResults__block_invoke;
  v4[3] = &unk_1E3C95B88;
  v4[4] = a1;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("DDResultAttributeName"), 0, v2, 0, v4);

}

- (void)dd_appendAttributedString:()DataDetectorsSupport
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (objc_msgSend(a3, "length"))
  {
    v5 = objc_msgSend(a1, "length");
    if (v5)
    {
      v6 = v5;
      v7 = (id)objc_msgSend(a3, "mutableCopy");
      objc_msgSend(v7, "dd_offsetResultsBy:", v6);
      objc_msgSend(a1, "appendAttributedString:", v7);

    }
    else
    {
      objc_msgSend(a1, "appendAttributedString:", a3);
    }
  }
}

@end
