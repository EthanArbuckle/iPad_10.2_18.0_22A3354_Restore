@implementation NSEnumerator(ContactsFoundation)

- (_CNCompactMapEnumerator)_cn_compactMap:()ContactsFoundation
{
  id v4;
  _CNCompactMapEnumerator *v5;

  v4 = a3;
  v5 = -[_CNCompactMapEnumerator initWithEnumerator:transform:]([_CNCompactMapEnumerator alloc], "initWithEnumerator:transform:", a1, v4);

  return v5;
}

- (id)_cn_filter:()ContactsFoundation
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__NSEnumerator_ContactsFoundation___cn_filter___block_invoke;
  v8[3] = &unk_1E29BB328;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_cn_compactMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_CNFlatMapEnumerator)_cn_flatMap:()ContactsFoundation
{
  id v4;
  _CNFlatMapEnumerator *v5;

  v4 = a3;
  v5 = -[_CNFlatMapEnumerator initWithEnumerator:transform:]([_CNFlatMapEnumerator alloc], "initWithEnumerator:transform:", a1, v4);

  return v5;
}

@end
