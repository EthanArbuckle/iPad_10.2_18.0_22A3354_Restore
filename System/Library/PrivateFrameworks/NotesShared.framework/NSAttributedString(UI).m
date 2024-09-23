@implementation NSAttributedString(UI)

- (ICTTTextEdit)editAtIndex:()UI
{
  void *v3;
  ICTTTextEdit *v4;
  ICTTTextEdit *v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  objc_msgSend(a1, "attributesAtIndex:effectiveRange:", a3, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [ICTTTextEdit alloc];
  v5 = -[ICTTTextEdit initWithAttributes:range:](v4, "initWithAttributes:range:", v3, v7, v8);

  return v5;
}

- (void)enumerateEditsInRange:()UI usingBlock:
{
  id v8;
  NSUInteger v9;
  NSRange v10;
  id v11;
  _QWORD v12[4];
  id v13;
  NSRange v14;
  NSRange v15;

  v8 = a5;
  v15.location = objc_msgSend(a1, "ic_range");
  v15.length = v9;
  v14.location = a3;
  v14.length = a4;
  v10 = NSIntersectionRange(v14, v15);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__NSAttributedString_UI__enumerateEditsInRange_usingBlock___block_invoke;
  v12[3] = &unk_1E76CD3C8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", v10.location, v10.length, 0, v12);

}

- (id)editsInRange:()UI
{
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__NSAttributedString_UI__editsInRange___block_invoke;
  v11[3] = &unk_1E76CD3F0;
  v12 = v7;
  v8 = v7;
  objc_msgSend(a1, "enumerateEditsInRange:usingBlock:", a3, a4, v11);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (uint64_t)edits
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "ic_range");
  return objc_msgSend(a1, "editsInRange:", v2, v3);
}

@end
