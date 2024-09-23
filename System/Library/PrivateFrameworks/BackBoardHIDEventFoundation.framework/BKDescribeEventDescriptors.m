@implementation BKDescribeEventDescriptors

void ___BKDescribeEventDescriptors_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___BKDescribeEventDescriptors_block_invoke_2;
  v3[3] = &unk_1E81F6FD0;
  v4 = v1;
  objc_msgSend(v4, "appendCollection:withName:itemBlock:", v2, CFSTR("desc"), v3);

}

void ___BKDescribeEventDescriptors_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "integerValue");
  IOHIDEventTypeGetName();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", v3, 0);

}

@end
