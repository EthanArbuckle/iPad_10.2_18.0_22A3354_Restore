@implementation ENReadLinesFromFile

void __ENReadLinesFromFile_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, NSUInteger a5, NSUInteger a6, _BYTE *a7)
{
  id v11;
  NSRange v12;

  v11 = a2;
  if (a5 + a6 >= objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    *a7 = 1;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a7 = 1;
    v12.location = a5;
    v12.length = a6;
    *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = NSUnionRange(*(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 32), v12);
  }

}

uint64_t __ENReadLinesFromFile_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
