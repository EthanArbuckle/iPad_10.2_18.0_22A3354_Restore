@implementation HMFDescribeIntoBufferWithIndent

uint64_t __HMFDescribeIntoBufferWithIndent_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "appendString:", v6);
  HMFDescribeIntoBufferWithIndent(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v8);

  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" = "));
  HMFDescribeIntoBufferWithIndent(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v7);

  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(";\n"));
}

@end
