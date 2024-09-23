@implementation GEOServerFormattedStringEqual

uint64_t __GEOServerFormattedStringEqual_block_invokeTm(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v4 = a2 | a3;
  v5 = (id)a2;
  v6 = (id)a3;
  v7 = v5;
  v8 = v6;
  if (v4)
    v9 = objc_msgSend(v7, "isEqual:", v8);
  else
    v9 = 1;

  return v9;
}

uint64_t __GEOServerFormattedStringEqual_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  v6 = GEOServerFormatTokenEqual();

  return v6;
}

@end
