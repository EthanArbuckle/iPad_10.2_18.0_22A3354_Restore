@implementation NSAttributedString(HFStringGeneratoreAdditions)

- (id)stringWithAttributes:()HFStringGeneratoreAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:", 0, objc_msgSend(a1, "length"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)prefersDynamicString
{
  return 0;
}

- (id)_synthesizeAttributedSubstringFromRange:()HFStringGeneratoreAdditions usingDefaultAttributes:
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v8 = (objc_class *)MEMORY[0x1E0CB3778];
  v9 = a5;
  v10 = [v8 alloc];
  objc_msgSend(a1, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v9);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __114__NSAttributedString_HFStringGeneratoreAdditions___synthesizeAttributedSubstringFromRange_usingDefaultAttributes___block_invoke;
  v15[3] = &unk_1EA7358B0;
  v13 = v12;
  v16 = v13;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", a3, a4, 0, v15);

  return v13;
}

@end
