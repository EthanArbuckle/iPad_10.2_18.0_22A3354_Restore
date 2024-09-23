@implementation ZL20defaultPostStepBlock

void _ZL20defaultPostStepBlock_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(a2, "representedObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v2 = objc_msgSend(v3, "_backingNode");
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 208))(v2);
  }

}

@end
