@implementation UISwitch

void __65__UISwitch_MobileSafariExtras__sf_initWithOn_valueChangeHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "sender");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v3, "isOn"));

}

@end
