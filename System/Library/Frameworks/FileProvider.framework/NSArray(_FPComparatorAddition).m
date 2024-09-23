@implementation NSArray(_FPComparatorAddition)

- (id)fp_comparator
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__NSArray__FPComparatorAddition__fp_comparator__block_invoke;
  v2[3] = &unk_1E444D868;
  v2[4] = a1;
  return (id)MEMORY[0x1A1B00850](v2);
}

- (uint64_t)fp_compareItem:()_FPComparatorAddition toItem:
{
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "fp_comparator");
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9 = ((uint64_t (**)(_QWORD, id, id))v8)[2](v8, v7, v6);

  return v9;
}

@end
